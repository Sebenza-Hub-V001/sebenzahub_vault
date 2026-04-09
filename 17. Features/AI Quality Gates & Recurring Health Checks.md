**Ready for review**

Select text to add comments on the plan

# 

## Context

Sebenza Hub's AI features (CV screening, JD writing, candidate matching) currently return results directly to users without automated quality validation. The `aiGovernancePolicies` table exists with rules/thresholds/enforce modes but isn't wired into the AI output pipeline. Similarly, there's no scheduled monitoring for data staleness, compliance drift, or bot quality — all checks are manual.

This plan adds:

1. **Quality gates** that intercept AI outputs in `chatJSON()` and validate against governance policies before results reach users
2. **Recurring health checks** via BullMQ repeatable jobs for proactive monitoring

---

## Feature 1: AI Output Quality Gates

### Approach

Insert quality gate logic **inside `chatJSON()`** (server/ai.ts:628) — right after `JSON.parse(raw)` and before `return parsed`. This single integration point captures all 15+ call sites automatically without modifying individual route handlers.

### New File: `server/ai-quality-gate.ts`

**`evaluateQualityGate(featureKey, output)`**

- Loads active policies from `ai_governance_policies` where `applies_to` contains `featureKey` and `is_active = true`
- Caches policies in memory with 60s TTL (matches existing `_configCache` pattern in ai.ts)
- Evaluates each policy's `rules` array: `{metric, operator, threshold, action}`
- Maps feature outputs to metrics:
    - `screenCandidate`: scoreTotal → "score", flags.length → "flag_count", knockout.triggered → "knockout"
    - `generateJobDescription`: inclusivityScore → "inclusivity", readabilityScore → "readability", biasFlags.length → "bias_flag_count"
    - `matchCandidateToJob`: score → "score", missingSkills.length → "missing_skills_count"
- Returns `{ passed, mode, violations[], qualityScore }`

**`recordQualityMetrics(featureKey, modelId, result)`** — fire-and-forget

- Inserts into `ai_model_metrics` with quality score and violation metadata
- If block-mode violations exist, creates `ai_anomaly_alerts` entry

**`checkAnomalyPatterns(featureKey, qualityScore)`** — fire-and-forget

- Queries last 20 metrics for rolling average
- Creates anomaly alert if quality drops below `qualityMinScore` from `ai_smart_router_configs`

### Modify: `server/ai.ts` (line 628-631)

After `const parsed = JSON.parse(raw) as T;`, insert:

```
const gate = await evaluateQualityGate(featureKey, parsed);
recordQualityMetrics(featureKey, modelId, gate);  // fire-and-forget
checkAnomalyPatterns(featureKey, gate.qualityScore);  // fire-and-forget

if (!gate.passed && gate.mode === "block") {
  throw new Error(`AI quality gate blocked: ${violations summary}`);
}
if (gate.mode === "warn" && typeof parsed === "object") {
  (parsed as any)._qualityWarnings = gate.violations;
}
```

### Modify: `server/routes.ts` — Admin endpoints

- `GET /api/admin/ai-quality-gate/status` — active policies + recent metrics per feature
- `GET /api/admin/ai-quality-gate/metrics` — 30-day quality trends, pass/warn/block counts
- `PUT /api/admin/ai-quality-gate/config` — update global quality minimum score

---

## Feature 2: Recurring AI Health Checks

### Approach

Add `ai-health-checks` BullMQ queue with 4 repeatable jobs. Processing logic in a dedicated file to keep queue.ts clean.

### New File: `server/ai-health-checks.ts`

**1. `processStaleJobDetection()`** — Daily 6AM UTC

- Query jobs where `status = 'active'` and `updated_at < NOW() - 30 days`
- Insert count + job IDs into `platform_health_metrics` (metric_type: `stale_job_count`)
- Create anomaly alert if count exceeds threshold

**2. `processComplianceAudit()`** — Weekly Monday 4AM UTC

- B-BBEE: find orgs with missing/expired `bbbee_scores`
- POPIA: count expired consents (`expires_at < NOW()` and not revoked)
- Insert results into `platform_health_metrics` (metric_type: `compliance_audit_bbbee`, `compliance_audit_popia`)

**3. `processMatchScoreRefresh(jobId?)`** — Daily 3AM UTC

- Find jobs created in last 7 days with status active
- Re-run matching for up to 50 candidate-job pairs per run (API cost cap)
- Update `talent_crm_match_results` with refreshed scores
- Log summary to `platform_health_metrics` (metric_type: `match_score_refresh`)

**4. `processWhatsAppQualitySampling()`** — Daily 5AM UTC

- Sample 20 random AI-processed conversations from last 7 days
- Evaluate: response time, sentiment distribution, escalation rate
- Insert into `platform_health_metrics` (metric_type: `whatsapp_bot_quality`)

### Modify: `server/queue.ts` (after line 507)

- Create `ai-health-checks` queue + worker (concurrency: 1)
- Add 4 repeatable jobs with cron patterns
- Dynamic import of `./ai-health-checks` in worker (same pattern as job-alerts)
- Export `getAiHealthCheckQueue()` for admin API access

### Modify: `server/routes.ts` — Admin endpoints

- `GET /api/admin/ai-health-checks/results` — recent health check results from `platform_health_metrics`
- `GET /api/admin/ai-health-checks/status` — queue status + last run timestamps
- `POST /api/admin/ai-health-checks/trigger` — manually trigger a specific check
- `PUT /api/admin/ai-health-checks/schedule` — update cron patterns

---

## Files Summary

|File|Action|Purpose|
|---|---|---|
|`server/ai-quality-gate.ts`|CREATE|Quality gate evaluation, metrics recording, anomaly detection|
|`server/ai-health-checks.ts`|CREATE|4 health check processors|
|`server/ai.ts`|MODIFY|Wire quality gate into `chatJSON()` at line 628|
|`server/queue.ts`|MODIFY|Add `ai-health-checks` queue + repeatable jobs after line 507|
|`server/routes.ts`|MODIFY|Add admin endpoints for quality gate config + health check management|

## Key Reuse

- **No new DB tables** — uses existing `ai_governance_policies`, `ai_model_metrics`, `ai_anomaly_alerts`, `platform_health_metrics`, `ai_smart_router_configs`
- **Existing patterns** — 60s cache TTL, fire-and-forget metrics, dynamic imports, BullMQ repeatable jobs
- **Existing types** — `AiGovernancePolicy`, `PlatformHealthMetric`, `InsertPlatformHealthMetric` from schema.ts

## Verification

1. **Quality gates**: Seed a governance policy with `enforceMode: "warn"`, `appliesTo: ["jd_generate"]`, rules targeting low readability score → verify `_qualityWarnings` appears in JD output
2. **Health checks**: Manually trigger via `POST /api/admin/ai-health-checks/trigger` with `checkType: "stale-job-detection"` → verify `platform_health_metrics` row created
3. **Block mode**: Create policy with `enforceMode: "block"` and impossible threshold → verify AI call returns error
4. **Queue scheduling**: Check BullMQ dashboard or query repeatable jobs to confirm cron patterns registered

Add Comment