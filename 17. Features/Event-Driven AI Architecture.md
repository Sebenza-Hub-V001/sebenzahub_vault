**Ready for review**

Select text to add comments on the plan

# Event-Driven AI Architecture (Channels Pattern)

## Context

Sebenza Hub's WhatsApp bot already implements a solid event-driven pattern: receive external webhook → normalize → queue to BullMQ → process via state machine → respond. The goal is to **generalize this pattern** into a platform-wide event bus so that any external system (WhatsApp, LinkedIn, job boards, email replies, internal platform events) can trigger AI processing without user initiation.

The existing automation engine (`server/automation-engine.ts`) handles 4 hardcoded trigger events (`application_received`, `stage_changed`, `interview_scheduled`, `offer_sent`). The new system extends this to arbitrary channel events with configurable routing rules stored in the database.

---

## Architecture Overview

```
External Sources           Channel Adapters           Event Bus              Router + AI Pipeline
─────────────────         ──────────────────         ───────────            ──────────────────────
WhatsApp webhook    →     WhatsAppAdapter      →                           
LinkedIn webhook    →     LinkedInAdapter      →     BullMQ Queue    →     Match event routes    →  AI actions
Job board sync      →     JobBoardAdapter      →     "channel-events"      (DB-stored rules)        Send outbound
Email inbound       →     EmailAdapter         →                           Fire automations
Internal events     →     PlatformAdapter      →                           Transform data
Cron schedules      →     CronAdapter          →                           Webhook calls
```

**Key design decisions:**

- Single new BullMQ queue (`channel-events`) layered on top of existing queues — no replacement
- Existing WhatsApp bot queue continues processing messages unchanged; event bus gets a _copy_
- Channel adapters are a registry pattern — add new channels by implementing one interface
- Routes are DB-stored JSON, editable via admin UI — no code changes to add routing rules

---

## New Files

```
server/channels/
  types.ts                     — Core interfaces (ChannelEvent, ChannelAdapter, EventRoute, PipelineStep)
  event-bus.ts                 — BullMQ queue + worker for channel-events
  event-router.ts              — Load routes from DB, match events, dispatch pipelines
  ai-pipeline.ts               — Execute pipeline steps (ai_action, send_outbound, fire_automation, etc.)
  channel-registry.ts          — Adapter registry (register/get/list)
  event-logger.ts              — Persist events to channel_events table
  adapters/
    whatsapp-adapter.ts        — Wraps existing whatsapp.ts
    linkedin-adapter.ts        — Wraps existing linkedin.ts
    job-board-adapter.ts       — Wraps existing job-aggregator-sync.ts
    email-adapter.ts           — Wraps existing Resend integration
    sms-adapter.ts             — Wraps existing sms.ts
    platform-adapter.ts        — Internal platform events
    cron-adapter.ts            — Scheduled/cron events
  routes/
    channel-admin-routes.ts    — Admin API endpoints

client/src/pages/admin/
  AdminChannels.tsx            — Channel adapter dashboard + health checks
  AdminEventRoutes.tsx         — Visual route builder
  AdminEventLog.tsx            — Searchable event log with replay
```

---

## Modified Files

|File|Change|
|---|---|
|[server/queue.ts](vscode-webview://19fc6h4v3qtfnca0qu1oe8qv8e3nq7km03ja2jl3bvo4jv15uhka/server/queue.ts)|Add `channelEventsQueue`, call `initEventBus()` + `initChannelAdapters()` in `initQueues()`|
|[server/routes.ts](vscode-webview://19fc6h4v3qtfnca0qu1oe8qv8e3nq7km03ja2jl3bvo4jv15uhka/server/routes.ts)|Add `publishEvent()` in WhatsApp webhook handler (alongside existing bot queue); register channel admin routes|
|[shared/schema.ts](vscode-webview://19fc6h4v3qtfnca0qu1oe8qv8e3nq7km03ja2jl3bvo4jv15uhka/shared/schema.ts)|Add 3 tables: `channel_events`, `channel_event_routes`, `channel_adapter_configs`|
|[client/src/pages/admin/AdminDashboard.tsx](vscode-webview://19fc6h4v3qtfnca0qu1oe8qv8e3nq7km03ja2jl3bvo4jv15uhka/client/src/pages/admin/AdminDashboard.tsx)|Add "Channels" nav item to Platform Config group|

---

## Core Interfaces

### ChannelEvent (unified event schema)

```typescript
interface ChannelEvent {
  id: string;                          // UUID
  channel: ChannelType;                // 'whatsapp' | 'linkedin' | 'job_board' | 'email' | 'sms' | 'cron' | 'platform'
  eventType: string;                   // e.g. 'message.inbound.text', 'lead_form.submitted', 'job.published'
  source: string;                      // 'meta_whatsapp', 'linkedin_webhooks', 'adzuna', 'internal'
  organizationId: string | null;
  userId: string | null;
  payload: Record<string, unknown>;    // normalized event data
  metadata: {
    receivedAt: string;
    rawWebhookId?: string;
    retryCount: number;
    correlationId: string;
    parentEventId?: string;
  };
  ppiRedacted: boolean;               // POPIA flag
}
```

### ChannelAdapter (plug-in interface)

```typescript
interface ChannelAdapter {
  readonly channelType: ChannelType;
  readonly source: string;
  validateWebhook(req: Request): boolean;
  normalizeEvent(rawPayload: unknown): ChannelEvent[];
  sendOutbound(action: OutboundAction): Promise<OutboundResult>;
  healthCheck(): Promise<{ ok: boolean; latencyMs: number; error?: string }>;
}
```

### EventRoute (DB-stored routing rule)

```typescript
interface EventRoute {
  id: string;
  name: string;
  organizationId: string | null;       // null = global
  channel: ChannelType | '*';
  eventTypePattern: string;            // glob: 'message.*', 'job.*'
  conditions: RouteCondition[];        // payload field checks
  pipeline: PipelineStep[];            // ordered action steps
  isActive: boolean;
  priority: number;
  rateLimitPerHour: number | null;
}
```

### PipelineStep types

- `ai_action` — call any function from `server/ai.ts` dynamically
- `send_outbound` — send message via any channel adapter
- `fire_automation` — bridge to existing automation engine
- `transform` — reshape data between steps
- `condition` — conditional branching
- `delay` — re-queue with BullMQ delay for async continuation
- `webhook` — call external URL

---

## Database Schema (3 new tables)

### `channel_events` — Event audit log

- `id`, `channel`, `event_type`, `source`, `organization_id`, `user_id`
- `payload` (JSONB), `metadata` (JSONB), `ppi_redacted`
- `routes_matched`, `processed_at`, `processing_duration_ms`, `error_message`
- `expires_at` (POPIA auto-expiry), `created_at`
- Indexes: channel, event_type, organization_id, created_at, expires_at

### `channel_event_routes` — Routing rules

- `id`, `organization_id`, `name`, `description`
- `channel`, `event_type_pattern`, `conditions` (JSONB), `pipeline` (JSONB)
- `is_active`, `priority`, `rate_limit_per_hour`
- `execution_count`, `last_executed_at`, `last_error`
- `created_by`, `created_at`, `updated_at`

### `channel_adapter_configs` — Per-org adapter settings

- `id`, `organization_id`, `channel_type`, `source`
- `is_enabled`, `credentials` (JSONB, encrypted), `webhook_secret`, `webhook_url`
- `health_status`, `last_health_check_at`, `config` (JSONB)

---

## Integration Points

### 1. Event Bus init (server/queue.ts)

Add after existing queue initialization in `initQueues()`:

```typescript
const { initEventBus } = await import("./channels/event-bus");
const { initChannelAdapters } = await import("./channels/channel-registry");
initEventBus(redisUrl);
await initChannelAdapters();
```

### 2. WhatsApp webhook bridge (server/routes.ts ~line 28842)

After existing `botQueue.add("incoming-message", ...)`, add:

```typescript
const { publishEvent } = await import("./channels/event-bus");
const { getAdapter } = await import("./channels/channel-registry");
const adapter = getAdapter("whatsapp");
if (adapter) {
  for (const event of adapter.normalizeEvent(req.body)) {
    publishEvent(event).catch(() => {}); // fire-and-forget copy
  }
}
```

Existing bot processing is **unchanged** — event bus gets a parallel copy.

### 3. Platform events (server/routes.ts, various handlers)

Add `publishEvent()` calls at key platform actions:

- Job published → `platform:job.published`
- Application submitted → `platform:application.received`
- User registered → `platform:user.registered`
- Stage changed → `platform:stage.changed`

---

## Example Event Flow: Job Published → Auto-Match → WhatsApp Notify

1. Recruiter publishes job → route handler calls `publishEvent({ channel: "platform", eventType: "job.published", ... })`
2. Event bus queues to BullMQ `channel-events`
3. Worker picks up, logs to `channel_events` table
4. Router loads active routes, matches `eventTypePattern: "job.published"`
5. Pipeline executes:
    - Step 1 (`ai_action`): Call `matchCandidateToJob` from `server/ai.ts`
    - Step 2 (`transform`): Filter matches with score > 0.7
    - Step 3 (`send_outbound`): Send WhatsApp messages to matched candidates via WhatsApp adapter

---

## Implementation Phases

### Phase 1: Foundation

- `server/channels/types.ts` — all interfaces
- `server/channels/event-bus.ts` — BullMQ queue + worker
- `server/channels/event-logger.ts` — persist to DB
- `server/channels/channel-registry.ts` — adapter registry
- 3 new tables in `shared/schema.ts` + migration
- `initEventBus()` + `initChannelAdapters()` in `server/queue.ts`
- WhatsApp adapter (wrapping existing code)
- Platform adapter (wrapping existing automation engine)

### Phase 2: Routing Engine

- `server/channels/event-router.ts` — route matching with glob patterns
- `server/channels/ai-pipeline.ts` — pipeline step execution
- Seed 3-5 default routes
- Add `publishEvent()` to WhatsApp webhook + key platform events

### Phase 3: Additional Adapters

- LinkedIn, Job Board, Email, SMS, Cron adapters

### Phase 4: Admin UI

- AdminChannels.tsx — adapter status + health checks
- AdminEventRoutes.tsx — visual route builder
- AdminEventLog.tsx — event log with replay
- Sidebar navigation entry

### Phase 5: Advanced

- Rate limiting per route, event replay, pipeline analytics, dead letter queue, circuit breakers

---

## POPIA Compliance

- `ppi_redacted` flag on events tracks PII stripping status
- `expires_at` enables automatic data retention (default 90 days)
- Cron job purges expired events
- Event logger redacts phone numbers/emails/IDs before persisting when configured

---

## Verification Plan

1. Unit test: WhatsApp adapter normalizes a Meta webhook payload into correct ChannelEvent shape
2. Unit test: Event router matches routes with glob patterns and conditions
3. Integration test: Publish a platform event → verify it flows through event bus → matches a route → executes pipeline
4. Manual test: Publish a job from the UI → verify matched candidates receive WhatsApp notification
5. Admin UI: Verify channel health checks, event log pagination, route CRUD

Add Comment