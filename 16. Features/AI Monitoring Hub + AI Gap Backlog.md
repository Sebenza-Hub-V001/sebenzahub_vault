**Ready for review**

Select text to add comments on the plan

# Full Strategy: AI Monitoring Hub + AI Gap Backlog

## Context

Sebenza Hub has a world-class AI backbone (363 functions, 3 providers, skills registry, BullMQ queues, 25+ AI tables) but only **31% of 191 dashboard pages** leverage it. The infrastructure is production-ready; the execution gap is massive. This plan addresses both:

1. **Part A**: Build a recurring AI Monitoring Hub using BullMQ cron jobs
2. **Part B**: Decompose the 56 AI enhancement opportunities into parallelizable implementation waves

---

## Part A: AI Monitoring Hub

### Architecture

Single new BullMQ queue (`ai-monitoring-hub`) added to `server/queue.ts`, following the existing `crm-intelligence` multi-job-name pattern. New worker file `server/ai-monitoring-hub.ts` implements 6 monitors.

### 6 Recurring Monitors

|Monitor|Cron|Schedule (SAST)|What It Does|
|---|---|---|---|
|`stale-job-detection`|`0 6 * * *`|Daily 8am|Flag expired/ghost jobs, jobs with 0 apps after 30+ days|
|`compliance-audit`|`0 2 * * 1`|Weekly Mon 4am|Check POPIA consent expiry, B-BBEE deadlines, EE report gaps|
|`candidate-match-refresh`|`0 1 * * *`|Daily 3am|Re-score candidates whose profiles updated in last 24h|
|`whatsapp-bot-health`|`*/15 * * * *`|Every 15 min|Monitor response times, drop-off rates, unhandled intents|
|`ai-cost-quality`|`0 */4 * * *`|Every 4 hours|Track spend vs budget, detect latency spikes, error surges|
|`platform-health-pulse`|`0 5 * * *`|Daily 7am|AI-generated narrative summarizing all signals + recommendations|

### New Database Tables (2)

1. **`monitoring_run_logs`** - Tracks every monitor execution (type, status, findings, duration, trigger source)
2. **`health_pulse_reports`** - Stores daily AI-generated health reports (overall score 0-100, signal breakdowns, AI narrative, prioritized recommendations)

### Files to Create/Modify

|File|Action|
|---|---|
|`server/queue.ts`|Add queue, worker dispatch, 6 cron schedules|
|`server/ai-monitoring-hub.ts`|**NEW** - 6 monitor implementations|
|`shared/schema.ts`|Add `monitoringRunLogs` + `healthPulseReports` tables|
|`server/storage.ts`|Add CRUD methods for new tables|
|`server/routes.ts`|Add `/api/admin/ai-monitoring-hub/*` endpoints (10 routes)|
|`client/src/pages/admin/ai-monitoring/MonitoringHubTab.tsx`|**NEW** - Dashboard tab with 8 sub-components|

### API Endpoints (10)

```
GET  /api/admin/ai-monitoring-hub/dashboard      - Aggregated overview
GET  /api/admin/ai-monitoring-hub/runs            - Paginated run history
GET  /api/admin/ai-monitoring-hub/pulse/latest    - Latest health report
GET  /api/admin/ai-monitoring-hub/pulse/:id       - Specific report
POST /api/admin/ai-monitoring-hub/trigger         - Manual trigger any monitor
GET  /api/admin/ai-monitoring-hub/schedules       - Current cron config
POST /api/admin/ai-monitoring-hub/schedules/:type - Update schedule
GET  /api/admin/ai-monitoring-hub/stale-jobs      - Stale job findings
GET  /api/admin/ai-monitoring-hub/compliance      - Compliance audit results
GET  /api/admin/ai-monitoring-hub/whatsapp-health/timeline - 24h time-series
```

### Frontend: MonitoringHubTab Components

- **HealthPulseCard** - Score gauge + AI narrative excerpt
- **MonitorStatusGrid** - 6 cards with status badges + "Run Now" buttons
- **StaleJobsPanel** - Table of flagged jobs with recommended actions
- **ComplianceTimeline** - Color-coded upcoming deadlines
- **WhatsAppHealthChart** - Recharts line graph (response time, drop-off, unhandled)
- **AiCostBurndown** - Bar chart of daily spend by feature with budget threshold
- **MatchRefreshStats** - Nightly refresh summary
- **AlertFeed** - Combined alert stream from all monitoring-generated alerts

### Integration Points

- Writes to existing alert tables (`ai_anomaly_alerts`, `bbbee_compliance_alerts`, `billing_alerts`, `feature_alerts`)
- Uses existing `chatJSON()` for AI-powered analysis (stale-job detection, health pulse generation)
- Uses existing `matchCandidateToJob()` for candidate refresh
- Uses existing email queue for admin notifications

---

## Part B: AI Gap Backlog - 5-Wave Implementation

### Wave 1: Quick Wins (5 units, ALL parallel, Size: S each)

|Unit|Page|Enhancement|Backend Status|
|---|---|---|---|
|1A|`IndividualInterviewScheduling.tsx`|Auto-trigger prep kit on interview confirmation|Endpoint exists|
|1B|`RecruiterJobs.tsx`|Auto-bias check on job save/publish|`detectJDBias()` exists|
|1C|`RecruiterOffers.tsx`|Inline acceptance prediction badge per offer|Endpoint exists|
|1D|`IndividualSettings.tsx`|AI-suggested notification frequency|Thin new route needed|
|1E|`RecruiterInbox.tsx`|Auto-show 3 smart reply chips|`smartReply()` exists|

### Wave 2: High-Value Medium (8 units, ALL parallel, Size: M each)

|Unit|Page|Enhancement|Backend Status|
|---|---|---|---|
|2A-1|`IndividualAllJobs.tsx`|Match score badges per job listing|`matchCandidateToJob()` exists|
|2A-2|`IndividualApplications.tsx`|AI status insights, auto-feedback on rejection|`generateApplicationFeedback()` exists|
|2A-3|`IndividualProfile.tsx`|AI completeness coach widget|`profileCompletenessCoach()` exists|
|2B-1|`RecruiterPipeline.tsx`|Per-candidate risk badges (drop-off, stale)|`pipelineIntelligence()` exists|
|2B-2|`RecruiterCandidates.tsx`|AI one-line summary per candidate|`generateCandidateSummary()` exists|
|2B-3|`RecruiterTalentCRM.tsx`|Relationship health + next-best-action|CRM intelligence functions exist|
|2B-4|`RecruiterScreening.tsx`|Auto-trigger screening on application submit|`screenCandidate()` exists|
|2C-1|`RecruiterBBBEE.tsx` + `RecruiterEE.tsx`|Compliance scores + remediation suggestions|SA compliance functions exist|

### Wave 3: High Effort (6 units, ALL parallel, Size: L-XL)

|Unit|Page|Enhancement|Backend Status|
|---|---|---|---|
|3A-1|`IndividualAnalytics.tsx`|Predictive career analytics dashboard|Needs new `predictiveCareerAnalytics()`|
|3A-2|`RecruiterAnalytics.tsx`|Pipeline forecasting + bottleneck detection|Needs new `pipelineForecast()`|
|3A-3|`BusinessWorkforcePlanning.tsx`|AI scenario simulation + headcount forecasting|`workforceModeling()` exists, needs extension|
|3A-4|`BusinessPerformanceManagement.tsx`|Trend analysis + predictive performance|`performanceInsights()` exists, needs extension|
|3A-5|`AdminOverview.tsx`|Daily AI health brief widget|Reuse `AIDashboardBrief` component|
|3B-1|Semantic search infrastructure|Activate `job_embeddings` table, embedding generation on save|`aiHybridSearch()` exists, needs vector layer|

### Wave 4: Cross-Cutting Enhancements (6 units, mixed dependencies)

|Unit|Scope|Size|Dependencies|
|---|---|---|---|
|4A-1|Real-time AI streaming across 10+ pages|L|None (can start immediately)|
|4A-2|Expand `ai-queue.ts` to production BullMQ|L|None|
|4B-1|Proactive AI notifications|L|Wave 2A|
|4B-2|AI-powered onboarding|M|Wave 2A-3|
|4B-3|Multi-language AI (11 SA languages)|L|Waves 1-3|
|4B-4|AI-personalized dashboards (all 4 roles)|M|Waves 1-3|

### Wave 5: Remaining Page-Level (~22 units, all parallel within groups)

- **5A**: Individual pages (7 items: Favourites, CVs, Community, LearningHub, SavedSearches, ExperienceSurveys, Dashboard)
- **5B**: Recruiter pages (8 items: Dashboard, KPI, Placements, WorkflowAutomation, CompetitiveIntel, BlindHiring, Approvals, PredictiveAnalytics)
- **5C**: Business pages (3 items: Team, BrandVoice, Settings)
- **5D**: Admin pages (5 items: Dashboard, Fraud, Compliance, SEO, RBAC)

### Dependency Graph

```
Wave 1 (5 parallel) ──→ Wave 2 (8 parallel) ──→ Wave 3 (6 parallel) ──→ Wave 4B (4 sequential) ──→ Wave 5 (22 parallel)
                                                  Wave 4A (2 parallel) ─────────────────────────↗
Part A: Monitoring Hub can run in parallel with ALL waves
```

### Standard Pattern Per Unit

Every unit follows the same recipe:

1. **Backend** (if needed): Add function to `server/ai.ts` using `chatJSON()`, add route to `server/routes.ts`
2. **Frontend**: Add `useMutation` calling `apiRequest("/api/ai/<name>")`, render in collapsible AI insight card with purple/sparkle theme (see `ai-dashboard-brief.tsx`)

### Key Reusable Components

- `client/src/components/ui/ai-dashboard-brief.tsx` - AI widget pattern for all dashboards
- `client/src/hooks/use-ai-features.ts` - Feature flag detection
- `client/src/hooks/use-ai-stream.ts` - SSE streaming
- `client/src/hooks/use-semantic-search.ts` - Semantic search
- `client/src/lib/queryClient.ts` - `apiRequest` + `getQueryFn` utilities

---

## Execution Strategy

### Recommended Start: Part A + Wave 1 in parallel

1. **Start Part A** (AI Monitoring Hub) - foundational infrastructure
2. **Start Wave 1** (5 quick wins) - immediate visible value
3. Progress through Waves 2-5 sequentially, maximizing parallel agents per wave

### Estimated Timeline (with parallel agents)

- Part A: ~4-6 hours
- Wave 1: ~1 hour (5 agents)
- Wave 2: ~2 hours (8 agents)
- Wave 3: ~3 hours (6 agents)
- Wave 4: ~3 hours (mixed)
- Wave 5: ~2 hours (12 agents)

### Verification Plan

1. **Part A**: Trigger each monitor manually via API, verify `monitoring_run_logs` entries, check alert table writes, render frontend dashboard
2. **Each Wave unit**: Call the AI endpoint directly, verify JSON response structure, check frontend renders insight card, test loading/error states
3. **End-to-end**: Full user journey - sign up, upload CV, browse jobs (see match scores), apply (see auto-screen), get interview (see auto-prep)

Add Comment