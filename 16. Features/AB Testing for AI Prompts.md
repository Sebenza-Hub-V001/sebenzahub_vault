---
aliases:
  - A/B Testing for AI Prompts
---
**Ready for review**

Select text to add comments on the plan

# A/B Testing for AI Prompts — Implementation Plan

## Context

Sebenza Hub has 200+ AI features (JD Writer, Resume Parser, Interview Coach, etc.) with prompts defined inline in `server/ai.ts` and optionally overridden via `ai_prompt_templates` DB table. There's an existing **model** A/B testing system (`aiAbExperiments` table + `ABTestingTab.tsx`), but no way to A/B test **prompt variations** — e.g., test two JD Writer prompts and measure which generates JDs that attract more applications.

This plan adds prompt-level A/B testing: create experiments with two prompt variants, automatically assign users to variants, track downstream outcomes, and compute statistical significance.

---

## Phase 1: Schema + Storage (Foundation)

### 1.1 Add 3 tables to `shared/schema.ts`

**`ai_prompt_experiments`** — experiment definition

- `id` (uuid PK), `name`, `description`, `featureKey` (varchar 100)
- `status` (draft | running | paused | completed | cancelled)
- `controlPromptId` → FK to `aiPromptTemplates.id`
- `variantPromptId` → FK to `aiPromptTemplates.id`
- `trafficSplit` (real, default 50) — % routed to variant
- `primaryMetric` (varchar 100) — e.g. "applications_received", "click_through_rate"
- `secondaryMetrics` (jsonb string[])
- `minSampleSize` (int, default 100), `confidenceLevel` (real, default 0.95)
- `winner` (control | variant | inconclusive | null), `pValue`, `effectSize`
- `startedAt`, `completedAt`, `createdBy`, `createdAt`, `updatedAt`
- Indexes: featureKey, status

**`ai_prompt_experiment_assignments`** — sticky user→variant mapping

- `id` (uuid PK), `experimentId` → FK cascade, `userId` → FK cascade
- `variant` (control | variant), `assignedAt`
- Unique index on (experimentId, userId)

**`ai_prompt_experiment_events`** — granular outcome tracking

- `id` (uuid PK), `experimentId` → FK cascade, `userId` → FK set null
- `variant` (control | variant), `eventType` (varchar 100), `eventValue` (real nullable)
- `metadata` (jsonb), `entityType` (varchar 50), `entityId` (uuid nullable)
- `createdAt`
- Indexes: experimentId, (experimentId + variant), (experimentId + eventType), (entityType + entityId)

Add type exports: `AiPromptExperiment`, `InsertAiPromptExperiment`, etc.

### 1.2 Migration file

- `migrations/XXXX_ai_prompt_experiments.sql` — CREATE TABLE + indexes for all 3 tables

### 1.3 Storage methods in `server/storage.ts`

Add to IStorage interface + DatabaseStorage:

```
// Experiments CRUD
listPromptExperiments(filters?: { status?, featureKey? }): Promise<AiPromptExperiment[]>
getPromptExperiment(id): Promise<AiPromptExperiment | undefined>
getActivePromptExperimentForFeature(featureKey): Promise<AiPromptExperiment | undefined>
createPromptExperiment(data): Promise<AiPromptExperiment>
updatePromptExperiment(id, data): Promise<AiPromptExperiment | undefined>

// Assignments
getPromptExperimentAssignment(experimentId, userId): Promise<Assignment | undefined>
createPromptExperimentAssignment(data): Promise<Assignment>

// Events
recordPromptExperimentEvent(data): Promise<Event>
getPromptExperimentResults(experimentId): Promise<{ control: VariantStats, variant: VariantStats }>
getPromptExperimentEvents(experimentId, filters?): Promise<{ events: Event[], total: number }>
```

`getActivePromptExperimentForFeature` filters by `status = 'running'` — only one running experiment per featureKey enforced at creation time.

---

## Phase 2: AI Engine Integration

### 2.1 Statistical utilities — NEW file `server/ab-statistics.ts`

Pure math functions:

- `welchTTest(controlSamples, variantSamples)` → p-value (for continuous metrics)
- `chiSquaredProportionTest(cConversions, cTotal, vConversions, vTotal)` → p-value (for binary outcomes like "applied")
- `cohensD(controlMean, variantMean, pooledStdDev)` → effect size
- `isSignificant(pValue, confidenceLevel)` → boolean

### 2.2 Experiment resolution in `server/ai.ts`

Add function `resolvePromptExperiment(featureKey, userId?)`:

1. Check cache for active experiment on this featureKey (60s TTL, same pattern as `resolveModel`)
2. If no experiment or no userId → return null (use default prompt)
3. Look up or create sticky assignment: `hash(userId + experimentId) % 100 < trafficSplit ? "variant" : "control"`
4. Fetch the corresponding `aiPromptTemplates` row
5. Return `{ systemPrompt, experimentId, variant }`

### 2.3 Modify `chatJSON` (line 396 of ai.ts)

Add optional `userId` param to opts. Before existing prompt resolution logic:

```
const experiment = await resolvePromptExperiment(opts.featureKey, opts.userId);
if (experiment) {
  systemPrompt = experiment.systemPrompt;
  // record "ai_call" event for tracking
}
```

This is **backward-compatible**: no `userId` = no experiment participation = existing behavior unchanged.

### 2.4 Thread `userId` from routes

In `server/routes.ts`, for AI feature calls that already have `req.user.id`, pass it through:

```typescript
// Before: generateJobDescription({ title, ... })
// After:  generateJobDescription({ title, ..., userId: req.user?.id })
```

Start with JD Writer (`generateJobDescription`) as the pilot feature. Extend to other features incrementally.

---

## Phase 3: Admin API Routes

Add to `server/routes.ts` (admin section):

```
GET    /api/admin/ai-prompt-experiments              — list (filter by status, featureKey)
POST   /api/admin/ai-prompt-experiments              — create (validates featureKey uniqueness for running)
GET    /api/admin/ai-prompt-experiments/:id           — detail + inline results
PATCH  /api/admin/ai-prompt-experiments/:id           — update name/description/trafficSplit
POST   /api/admin/ai-prompt-experiments/:id/start     — set status=running, startedAt=now
POST   /api/admin/ai-prompt-experiments/:id/pause     — set status=paused
POST   /api/admin/ai-prompt-experiments/:id/complete  — set status=completed, compute winner
POST   /api/admin/ai-prompt-experiments/:id/promote   — set winning prompt as isDefault on aiPromptTemplates
GET    /api/admin/ai-prompt-experiments/:id/results   — aggregated stats + significance
GET    /api/admin/ai-prompt-experiments/:id/events    — paginated raw events
```

All protected with `requireAuth` + admin role check.

---

## Phase 4: Admin UI

### 4.1 New file: `client/src/pages/admin/ai-monitoring/PromptABTestingTab.tsx`

Structure (following existing `ABTestingTab.tsx` patterns):

1. **Stat cards**: Active Experiments, Total Calls Tracked, Completed, Significant Winners Found
2. **Experiment list**: Cards with status badge, featureKey, traffic split, sample progress bar, actions
3. **Create dialog**:
    - Feature key dropdown
    - Control prompt selector (from `aiPromptTemplates` filtered by featureKey)
    - Variant prompt selector (same filter)
    - Traffic split slider (0-100%)
    - Primary metric dropdown (applications_received, click_through, time_to_fill, user_rating, completion_rate)
    - Min sample size input
4. **Experiment detail** (expandable or dialog):
    - Side-by-side prompt preview (control vs variant text)
    - Live metrics: calls per variant, conversion rates, bar chart comparison
    - Statistical significance display: p-value, effect size, confidence
    - Progress toward min sample size
    - Action buttons: Start / Pause / Complete / Promote Winner

### 4.2 Register tab in `AdminAIMonitoring.tsx`

Add `{ value: "prompt-ab", label: "Prompt A/B", icon: FlaskConical }` to tabs config, render `<PromptABTestingTab />` in the corresponding tab content.

---

## Phase 5: Outcome Tracking Integration

### 5.1 Helper function in `server/ai.ts`

```typescript
export async function recordExperimentOutcome(
  entityType: string, entityId: string, 
  eventType: string, eventValue?: number
)
```

Looks up the `ai_call` event for this entity to find experimentId + variant, then records the outcome event. Fire-and-forget (non-blocking).

### 5.2 Instrument key routes in `server/routes.ts`

- **Job application created** (`POST /api/applications`): record `"application_received"` for the job's experiment
- **Job viewed** (if tracked): record `"job_view"` for click-through
- **Job filled** (status change): record `"time_to_fill"` with days elapsed

---

## Files to Modify

|File|Change|
|---|---|
|`shared/schema.ts`|3 new tables + type exports (~80 lines)|
|`server/storage.ts`|IStorage interface + DatabaseStorage methods (~150 lines)|
|`server/ab-statistics.ts`|**NEW** — statistical test utilities (~80 lines)|
|`server/ai.ts`|`resolvePromptExperiment()`, modify `chatJSON`, outcome helper (~60 lines)|
|`server/routes.ts`|Admin API routes + outcome instrumentation (~200 lines)|
|`client/src/pages/admin/ai-monitoring/PromptABTestingTab.tsx`|**NEW** — admin UI (~600 lines)|
|`client/src/pages/admin/AdminAIMonitoring.tsx`|Register new tab (~5 lines)|

---

## Verification Plan

1. **Schema**: Run `npx drizzle-kit push` — tables created without errors
2. **Storage**: Create an experiment via admin route, verify DB rows
3. **Assignment**: Call an AI feature with userId, verify sticky assignment (same user always gets same variant)
4. **Prompt swap**: With experiment running, verify `chatJSON` uses experiment prompt instead of inline
5. **Events**: Record outcome events, verify aggregation in results endpoint
6. **Statistics**: With sample data, verify p-value and effect size calculations
7. **Admin UI**: Create experiment, start it, view live results, complete and promote winner
8. **Build**: `npm run build` passes without errors

Add Comment