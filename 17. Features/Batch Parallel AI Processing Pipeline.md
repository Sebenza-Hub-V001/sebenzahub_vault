**Ready for review**

Select text to add comments on the plan

# Batch Parallel AI Processing Pipeline (`/batch` pattern)

## Context

Sebenza Hub has 100+ AI functions (screening, matching, CV parsing, JD generation) but currently processes them either synchronously in request handlers or via a primitive in-memory queue (`server/ai-queue.ts`) that runs one task at a time. The existing bulk-screen endpoint (`routes.ts:8454`) uses `Promise.all` with no progress tracking, no cancellation, and no persistence. For a platform handling recruitment at scale, this needs a proper **decompose → parallelise → track → aggregate** pipeline leveraging the existing BullMQ + Redis infrastructure.

---

## Architecture Overview

```
API Request (create batch)
  -> Insert aiBatchJobs row + N aiBatchItems rows
  -> Enqueue N BullMQ jobs to "ai-batch" queue
  -> Return 202 with batchId

BullMQ Worker (concurrency: 5, rate-limited)
  -> Pick item -> resolve handler by batch type
  -> Call existing AI function (screenCandidate, matchCandidateToJob, etc.)
  -> Store result in aiBatchItems.outputData
  -> Atomic increment aiBatchJobs.completedItems
  -> On last item: run aggregation, set batch status to completed

Frontend polls /api/batches/:id/progress every 2s via TanStack Query refetchInterval
```

---

## Phase 1: Database Schema

**File:** `shared/schema.ts` (after `aiJobs` table at line ~2289)

Add two tables:

### `ai_batch_jobs` (parent — progress tracking)

|Column|Type|Notes|
|---|---|---|
|id|uuid PK||
|organization_id|uuid FK|Multi-tenant scoping|
|created_by|uuid FK|User who launched|
|type|varchar(50)|`bulk_screen`, `bulk_match`, `bulk_cv_parse`, `bulk_jd_generate`, `bulk_talent_score`|
|name|varchar(255)|Human label|
|status|varchar(30)|`pending` → `processing` → `completed` / `failed` / `cancelled`|
|total_items|integer|Set at creation|
|completed_items|integer|Atomically incremented by workers|
|failed_items|integer|Atomically incremented by workers|
|config|jsonb|Type-specific config (jobId, criteria, candidateIds, etc.)|
|summary|jsonb|Aggregated results written on completion|
|error|text|Top-level error if entire batch fails|
|started_at, completed_at, cancelled_at, created_at, updated_at|timestamps||

### `ai_batch_items` (children — per-item detail)

|Column|Type|Notes|
|---|---|---|
|id|uuid PK||
|batch_id|uuid FK cascade||
|item_index|integer|Ordering|
|status|varchar(30)|`pending` → `processing` → `completed` / `failed` / `cancelled`|
|input_data|jsonb|What the AI function receives|
|output_data|jsonb|AI function response|
|error|text|Per-item error|
|retry_count|integer||
|processing_time_ms|integer||
|started_at, completed_at, created_at|timestamps||

**Indexes:** org_id, status, batch_id+status composite

**Type exports:** `AiBatchJob`, `InsertAiBatchJob`, `AiBatchItem`, `InsertAiBatchItem`

---

## Phase 2: Queue & Processor Framework

### New file: `server/batch-processor.ts`

Handler interface + registry:

```typescript
interface BatchHandler<TInput = any, TOutput = any> {
  type: string;
  decompose(config: Record<string, any>, orgId: string): Promise<{ inputData: TInput }[]>;
  process(input: TInput): Promise<TOutput>;
  aggregate(results: { input: TInput; output: TOutput }[]): Record<string, any>;
  persist?(batchId: string, input: TInput, output: TOutput): Promise<void>;
  concurrency?: number;       // default 5
  rateLimitMax?: number;      // default 10
  rateLimitDuration?: number; // default 10000ms
}
```

5 handler implementations (each ~30-50 lines, delegating to existing AI functions):

|Handler|AI Function|Decompose Source|Persist Side Effect|
|---|---|---|---|
|`bulk_screen`|`screenCandidate()`|`screening_candidates` table|Creates `screening_evaluations` rows|
|`bulk_match`|`matchCandidateToJob()`|`candidate_profiles` + target job|Updates `jobApplications.aiMatchScore`|
|`bulk_cv_parse`|`parseResume()`|`resumes` table or file URLs|Updates parsed resume data|
|`bulk_jd_generate`|`generateJobDescription()`|Array of job specs in config|Creates draft jobs|
|`bulk_talent_score`|`matchCandidateToJob()`|Talent pool members|Updates pool member scores|

### New file: `server/batch-queue.ts`

- Single BullMQ queue: `"ai-batch"`
- Worker concurrency: 5 (overridable per handler)
- Rate limiter: `{ max: 10, duration: 10000 }` (10 AI calls per 10s)
- Retry: `attempts: 2, backoff: { type: "exponential", delay: 5000 }`
- Cancellation: Redis key `batch:{batchId}:cancelled` checked before each item
- On item complete: atomic `UPDATE ai_batch_jobs SET completed_items = completed_items + 1`
- On batch complete (completed + failed == total): call `handler.aggregate()`, write summary, set status

### Wire into existing infrastructure:

**File:** `server/queue.ts` — Add `aiBatchQueue` variable, getter `getAiBatchQueue()`, and call `initBatchQueue()` inside `initQueues()`

---

## Phase 3: API Endpoints

### New file: `server/batch-routes.ts`

Register via `registerBatchRoutes(app)` in `server/routes.ts`.

|Method|Path|Auth|Purpose|
|---|---|---|---|
|`POST`|`/api/batches`|recruiter/business/admin|Create & start batch|
|`GET`|`/api/batches`|authenticated|List batches (paginated, org-scoped)|
|`GET`|`/api/batches/:id`|authenticated|Batch detail + progress|
|`GET`|`/api/batches/:id/items`|authenticated|Items list (paginated, filterable by status)|
|`POST`|`/api/batches/:id/cancel`|owner/admin|Cancel running batch|
|`POST`|`/api/batches/:id/retry-failed`|owner/admin|Re-enqueue failed items only|
|`DELETE`|`/api/batches/:id`|owner/admin|Delete batch + items|

**Create request body:**

```json
{
  "type": "bulk_screen",
  "name": "Screen Q2 Engineering Apps",
  "config": { "screeningJobId": "uuid" }
}
```

**Progress response (from GET /:id):**

```json
{
  "id": "uuid", "status": "processing",
  "totalItems": 200, "completedItems": 87, "failedItems": 3,
  "percentComplete": 45, "summary": null
}
```

### Storage methods in `server/storage.ts`:

- `createBatchJob`, `getBatchJob`, `listBatchJobs`, `updateBatchJobStatus`
- `createBatchItems`, `getBatchItem`, `listBatchItems`, `updateBatchItemStatus`
- `incrementBatchCompleted`, `incrementBatchFailed` (atomic counter updates)

---

## Phase 4: Frontend

### New files:

- `client/src/pages/dashboard/recruiter/batch-jobs.tsx` — List all batches with status badges, progress bars
- `client/src/pages/dashboard/recruiter/batch-job-detail.tsx` — Progress card + results summary + items table
- `client/src/hooks/use-batch-progress.ts` — TanStack Query hook with `refetchInterval: 2000` while processing

### Integration points (add "Batch" buttons to existing pages):

- Screening job detail → "Batch Screen All" button
- Job detail → "Batch Match Candidates" button
- Talent pool → "Re-Score Pool" button

---

## Phase 5: Verification

1. **Unit test batch-processor**: Mock AI functions, verify decompose/process/aggregate flow
2. **Integration test**: Create a batch via API, verify items are queued, mock AI responses, check progress endpoint returns correct counts, verify aggregation runs on completion
3. **Cancel test**: Start batch, cancel mid-flight, verify remaining items marked cancelled
4. **Error isolation test**: One item throws, verify batch continues and failed count increments
5. **Manual E2E**: Create a `bulk_screen` batch from the UI, watch progress bar, verify screening evaluations created

---

## Critical Files

|File|Action|
|---|---|
|`shared/schema.ts`|Add 2 tables + type exports (after line 2289)|
|`server/batch-processor.ts`|**New** — Handler interface + 5 implementations|
|`server/batch-queue.ts`|**New** — BullMQ queue + worker|
|`server/batch-routes.ts`|**New** — 7 API endpoints|
|`server/queue.ts`|Add batch queue variable + init call|
|`server/routes.ts`|Register `registerBatchRoutes(app)`|
|`server/storage.ts`|Add batch CRUD + atomic counter methods|
|`server/ai.ts`|**Read-only** — reference for AI function signatures|
|`client/src/pages/dashboard/recruiter/batch-jobs.tsx`|**New** — Batch list page|
|`client/src/pages/dashboard/recruiter/batch-job-detail.tsx`|**New** — Batch detail page|
|`client/src/hooks/use-batch-progress.ts`|**New** — Progress polling hook|

## Implementation Order

1. Schema + migration
2. `batch-processor.ts` (handler framework + `bulk_screen` handler first)
3. `batch-queue.ts` (BullMQ queue + worker)
4. Wire into `queue.ts`
5. Storage methods in `storage.ts`
6. `batch-routes.ts` + register in `routes.ts`
7. Remaining 4 handlers
8. Frontend pages + hook
9. Integration buttons on existing pages
10. Testing & verification

Add Comment