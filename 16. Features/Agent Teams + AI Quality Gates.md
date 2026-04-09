

## Context

Sebenza Hub has extensive AI infrastructure (60+ features, multi-provider, smart routing) but lacks two critical patterns:

1. **Agent Teams** -- Complex AI tasks run as monolithic calls. No way to decompose screening/matching/JD-generation into coordinated sub-agents that run in parallel.
2. **Quality Gates** -- AI outputs go directly to users with no systematic post-processing validation for POPIA compliance, bias, PII leaks, or format correctness.

These features address the 83% AI gap audit finding and add production-grade safety.

---

## Part 1: Agent Teams (Multi-Agent Orchestration)

### Schema (3 tables in `shared/schema.ts`)

1. **`agent_team_definitions`** -- Reusable pipeline templates
    
    - `id`, `name`, `slug` (unique), `description`, `category` (screening/jd-generation/matching)
    - `nodes` (jsonb) -- DAG definition as `AgentNode[]`
    - `defaultConfig`, `isEnabled`, `version`, `createdBy`, timestamps
2. **`agent_team_runs`** -- Execution tracking
    
    - `id`, `teamDefinitionId`, `userId`, `organizationId`
    - `status` (pending/running/completed/partial_failure/failed/cancelled)
    - `inputContext`, `finalContext`, `aggregatedResult` (all jsonb)
    - `nodeStatuses` (jsonb array), `totalDurationMs`, `totalTokensUsed`, `estimatedCostUsd`
3. **`agent_team_node_logs`** -- Per-node debug logs
    
    - `id`, `runId`, `nodeId`, `featureKey`
    - `inputSnapshot`, `outputSnapshot`, `provider`, `modelId`
    - `inputTokens`, `outputTokens`, `latencyMs`, `status`, `errorMessage`

### AgentNode Type

```typescript
interface AgentNode {
  nodeId: string;
  name: string;
  featureKey: string;          // maps to chatJSON featureKey
  systemPrompt?: string;       // override, else resolved from aiSkillPrompts
  userPromptTemplate: string;  // Handlebars: {{context.cvText}}, {{nodes.cv-parser.skills}}
  dependsOn: string[];         // nodeIds that must complete first
  outputKey: string;           // key in shared context for this node's output
  timeoutMs?: number;          // default 60000
  optional?: boolean;          // failure doesn't abort pipeline
  retries?: number;            // default 0
}
```

### Core Engine -- `server/agent-teams-engine.ts` (new)

- `validateDAG(nodes)` -- cycle detection, reference validation
- `resolveExecutionPlan(nodes)` -- topological sort into parallel "waves"
- `executeNode(node, context, runId)` -- calls existing `chatJSON()`, renders template, records log
- `executeAgentTeam(teamDefId, inputContext, userId)` -- main orchestrator:
    1. Load definition, create run record
    2. Resolve DAG into waves
    3. For each wave: `Promise.allSettled` all nodes in parallel
    4. Merge outputs into shared context
    5. Handle failures (optional nodes skip, required nodes abort)
    6. Update run with final status, context, cost

### Routes -- `server/agent-teams-routes.ts` (new)

|Method|Path|Description|
|---|---|---|
|GET|`/api/admin/agent-teams`|List definitions|
|POST|`/api/admin/agent-teams`|Create definition|
|GET/PUT/DELETE|`/api/admin/agent-teams/:id`|CRUD|
|POST|`/api/admin/agent-teams/:id/validate`|Validate DAG|
|POST|`/api/agent-teams/:id/run`|Execute (returns runId)|
|GET|`/api/agent-teams/runs/:runId`|Run status + node statuses|
|GET|`/api/agent-teams/runs/:runId/logs`|Node-level logs|
|POST|`/api/agent-teams/runs/:runId/cancel`|Cancel|
|GET|`/api/agent-teams/runs`|User's runs (paginated)|

Register in `server/routes.ts` around line 60062.

### Seed Pipelines -- `server/seed-agent-teams.ts` (new)

1. **Screening Pipeline**: `cv-parser → [skills-extractor, compliance-checker] → scorer → final-decision`
2. **JD Generation**: `requirements-analyzer → [market-researcher, compliance-language] → brand-voice → final-composition`
3. **Candidate Matching**: `profile-analyzer → [skills-matcher, culture-fit, salary-alignment] → aggregator`

### Frontend

- **`client/src/pages/admin/AdminAgentTeams.tsx`** -- Main admin page (Teams/Runs/Analytics tabs)
- **`client/src/components/agent-teams/AgentTeamDAGViewer.tsx`** -- Visual DAG renderer (CSS grid, color-coded nodes)
- **`client/src/components/agent-teams/AgentTeamRunMonitor.tsx`** -- Live run monitoring (polls every 2s)
- **`client/src/components/agent-teams/AgentTeamNodeEditor.tsx`** -- Node config form

### Storage Methods (in `server/storage.ts`)

Add CRUD for all 3 tables following the `aiSkillPrompts` pattern (~line 13391).

---

## Part 2: AI Quality Gates

### Schema (2 tables in `shared/schema.ts`)

1. **`ai_quality_gates`** -- Gate definitions (admin-configurable)
    
    - `id`, `name`, `gateType`, `scope` (global/feature/feature_group), `scopeTarget`
    - `severity` (block/warn/log), `config` (jsonb, type-specific thresholds)
    - `validatorFn` (maps to server-side function), `isEnabled`, `priority`
    - `passCount`, `warnCount`, `failCount`, `lastTriggeredAt`
2. **`ai_quality_gate_logs`** -- Audit trail
    
    - `id`, `gateId`, `gateName`, `gateType`, `featureKey`
    - `result` (pass/warn/fail), `severity`, `details` (jsonb)
    - `outputSnapshot` (truncated), `userId`, `organizationId`, `latencyMs`

### Core Engine -- `server/ai-quality-gates.ts` (new)

- 5-minute gate cache (same pattern as `resolveModel`)
- `evaluateQualityGates(featureKey, output, context)` -- loads applicable gates, runs all in parallel via `Promise.all`
- Returns `GateEvaluationSummary` with `passed`, `results[]`, `warnings[]`, `failures[]`

### Validator Functions (all regex/heuristic, NO secondary AI calls)

**CV Screening:**

- `validatePopiaCompliance` -- scans for SA ID numbers (`\d{13}`), phone, email, addresses
- `validateBiasDetection` -- flags demographic terms in aiReasoning
- `validateConfidenceThreshold` -- ensures scoreTotal meets minimum
- `validateKnockoutReasons` -- knockout reasons must be specific + reference criteria

**JD Generation:**

- `validateEEACompliance` -- EEA-prohibited terms outside B-BBEE context
- `validateGenderNeutral` -- gendered language scan
- `validateBrandVoiceAlignment` -- tone check against brand profile
- `validateNoDiscriminatoryRequirements` -- age-coded, unnecessary degree requirements

**Candidate Match:**

- `validateMatchThreshold` -- minimum score check
- `validateDiversityImpact` -- protected group disadvantage flags
- `validateSkillsConfidence` -- matched skills must exist in input data

**General (all outputs):**

- `validatePiiLeak` -- deep scan all string fields for PII patterns
- `validateToxicity` -- profanity/toxic word list
- `validateOutputFormat` -- required fields exist, correct types
- `validateTokenBudget` -- cost/token limits

### Integration Point -- `server/ai.ts` lines 470-473

After `const parsed = JSON.parse(raw) as T;` in `chatJSON`:

```typescript
const gateResults = await evaluateQualityGates(opts.featureKey, parsed, { provider, modelId });
recordGateResults(opts.featureKey, gateResults); // fire-and-forget
if (!gateResults.passed) {
  throw new QualityGateError(`Blocked by: ${gateResults.failures.map(g => g.gateName).join(", ")}`, gateResults);
}
if (gateResults.warnings.length > 0) {
  (parsed as any).__qualityWarnings = gateResults.warnings;
}
```

Same pattern applied to `chatMultiTurn` at line 487.

### Routes (extend `server/ai-features-routes.ts`)

|Method|Path|Description|
|---|---|---|
|GET/POST|`/api/admin/ai-quality-gates`|List/create gates|
|PUT/DELETE|`/api/admin/ai-quality-gates/:id`|Update/delete|
|GET|`/api/admin/ai-quality-gates/logs`|Paginated audit log|
|GET|`/api/admin/ai-quality-gates/stats`|Pass/warn/fail rates|
|POST|`/api/admin/ai-quality-gates/test`|Dry-run against sample|

### Frontend -- `client/src/components/admin/ai-features/QualityGatesTab.tsx` (new)

Add to `AdminFeaturesSetup.tsx` alongside existing Safety Guardrails tab. Shows:

- Summary cards (total gates, pass rate, block rate, avg latency)
- Gate list with CRUD, enabled toggle, severity badge
- Log viewer with filters
- Test panel for dry-run validation

### Seed Gates

Default gates on creation:

- PII leak prevention → severity: **block**
- POPIA compliance → severity: **block**
- Bias detection → severity: **warn**
- Gender neutral language → severity: **warn**
- Output format validation → severity: **log**
- Token budget → severity: **warn**

---

## Implementation Order

### Phase 1: Schema + Foundation

1. Add 5 new tables to `shared/schema.ts` (3 agent teams + 2 quality gates)
2. Create migration file
3. Add storage methods to `server/storage.ts`

### Phase 2: Quality Gates (higher priority -- safety)

4. Create `server/ai-quality-gates.ts` with engine + all validators
5. Modify `chatJSON` and `chatMultiTurn` in `server/ai.ts` (~4 lines each)
6. Add CRUD routes to `server/ai-features-routes.ts`
7. Create `QualityGatesTab.tsx` and register in AdminFeaturesSetup
8. Seed default gates

### Phase 3: Agent Teams

9. Create `server/agent-teams-engine.ts` (DAG validation, execution)
10. Create `server/agent-teams-routes.ts`
11. Register routes in `server/routes.ts`
12. Create `server/seed-agent-teams.ts` with 3 pipelines
13. Add storage methods for agent teams

### Phase 4: Agent Teams Frontend

14. Create `AdminAgentTeams.tsx` page
15. Create DAG viewer, run monitor, node editor components
16. Add admin navigation entry

### Phase 5: Integration

17. Wire screening pipeline into existing screening routes
18. Wire JD pipeline into existing JD generation
19. Wire matching pipeline into existing matching flow

## Critical Files

|File|Action|
|---|---|
|`shared/schema.ts`|Add 5 tables (~line 17130 and 18848)|
|`server/ai.ts`|Hook quality gates into `chatJSON` (line 470) and `chatMultiTurn`|
|`server/ai-quality-gates.ts`|New -- core validation engine|
|`server/agent-teams-engine.ts`|New -- DAG orchestrator|
|`server/agent-teams-routes.ts`|New -- API endpoints|
|`server/ai-features-routes.ts`|Extend with quality gate CRUD|
|`server/storage.ts`|Add storage methods for 5 new tables|
|`server/routes.ts`|Register agent teams routes (~line 60062)|
|`client/src/components/admin/ai-features/QualityGatesTab.tsx`|New -- admin UI|
|`client/src/pages/admin/AdminAgentTeams.tsx`|New -- admin page|
|`client/src/components/agent-teams/`|New -- 3 components|

## Verification

1. **Quality Gates**: Create a gate via admin API, trigger an AI call (e.g., CV screening), verify gate log appears in audit trail
2. **Agent Teams**: Create the screening pipeline, run it with sample CV data, verify all nodes execute in correct order with parallel waves
3. **Integration**: Confirm `chatJSON` still works for all existing features (gates should pass cleanly for normal outputs)
4. **Performance**: Gate pipeline adds < 50ms overhead (measure with and without)