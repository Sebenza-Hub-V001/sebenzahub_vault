---
title: "ERD — AI Platform"
type: reference
created: 2026-04-10
updated: 2026-04-10
tags: [database, erd, ai-platform]
status: active
---

# ERD — AI Platform

**59 tables** · **76 FK relationships** — AI jobs, model governance, bias auditing, autopilot, prompt management, quality gates.

← Back to [[13-raw/data/erd/index|ERD Index]]

## `agentTeamDefinitions`

PostgreSQL: `agent_team_definitions` · 9 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| nodes | JSONB | NOT NULL |
| defaultConfig | JSONB | — |
| isEnabled | BOOLEAN | NOT NULL |
| version | INTEGER | NOT NULL |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `agentTeamNodeLogs`

PostgreSQL: `agent_team_node_logs` · 9 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| runId | UUID | NOT NULL |
| inputSnapshot | JSONB | — |
| outputSnapshot | JSONB | — |
| inputTokens | INTEGER | — |
| outputTokens | INTEGER | — |
| latencyMs | INTEGER | — |
| errorMessage | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

## `agentTeamRuns`

PostgreSQL: `agent_team_runs` · 15 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| teamDefinitionId | UUID | NOT NULL |
| userId | UUID | FK → `users.id` (SET NULL) |
| organizationId | UUID | — |
| inputContext | JSONB | NOT NULL |
| finalContext | JSONB | — |
| aggregatedResult | JSONB | — |
| nodeStatuses | JSONB | — |
| startedAt | TIMESTAMP | — |
| completedAt | TIMESTAMP | — |
| totalDurationMs | INTEGER | — |
| totalTokensUsed | INTEGER | — |
| estimatedCostUsd | REAL | — |
| errorSummary | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

## `aiAbExperiments`

PostgreSQL: `ai_ab_experiments` · 15 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| trafficSplit | REAL | — |
| secondaryMetrics | JSONB | — |
| minSampleSize | INTEGER | — |
| confidenceLevel | REAL | — |
| controlResults | JSONB | — |
| variantResults | JSONB | — |
| pValue | REAL | — |
| effectSize | REAL | — |
| startedAt | TIMESTAMP | — |
| completedAt | TIMESTAMP | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `aiAbTests`

PostgreSQL: `ai_ab_tests` · 12 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| variants | JSONB | NOT NULL |
| trafficSplit | JSONB | — |
| metrics | JSONB | — |
| confidenceLevel | REAL | — |
| sampleSize | INTEGER | — |
| targetSampleSize | INTEGER | — |
| startedAt | TIMESTAMP | — |
| completedAt | TIMESTAMP | — |
| createdBy | UUID | FK → `users.id` |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `aiAccessPolicies`

PostgreSQL: `ai_access_policies` · 13 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| featureKeys | JSONB | NOT NULL |
| maxDailyRequests | INTEGER | — |
| maxMonthlyTokens | INTEGER | — |
| allowedModels | JSONB | — |
| allowedProviders | JSONB | — |
| requireApproval | BOOLEAN | — |
| isEnabled | BOOLEAN | — |
| priority | INTEGER | — |
| createdBy | UUID | FK → `users.id` |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `aiActivityFeed`

PostgreSQL: `ai_activity_feed` · 6 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| relatedEntityId | UUID | — |
| metadata | JSONB | — |
| isRead | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |

## `aiAnomalyAlerts`

PostgreSQL: `ai_anomaly_alerts` · 10 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| expectedValue | REAL | — |
| actualValue | REAL | — |
| deviationPercent | REAL | — |
| resolvedBy | UUID | FK → `users.id` (SET NULL) |
| resolvedAt | TIMESTAMP | — |
| resolutionNotes | TEXT | — |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

## `aiAuditEvents`

PostgreSQL: `ai_audit_events` · 7 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| actorId | UUID | FK → `users.id` (SET NULL) |
| previousValue | JSONB | — |
| newValue | JSONB | — |
| description | TEXT | — |
| userAgent | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

## `aiAutopilotConfig`

PostgreSQL: `ai_autopilot_config` · 29 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, UNIQUE, FK → `organizations.id` (CASCADE) |
| autopilotEnabled | BOOLEAN | — |
| scoringWeights | JSONB | — |
| autoScreenEnabled | BOOLEAN | — |
| autoScreenThreshold | INTEGER | — |
| autoRejectEnabled | BOOLEAN | — |
| autoRejectThreshold | INTEGER | — |
| autoShortlistEnabled | BOOLEAN | — |
| autoShortlistThreshold | INTEGER | — |
| knockoutCriteria | JSONB | — |
| mustHaveSkills | JSONB | — |
| niceToHaveSkills | JSONB | — |
| mustHaveYearsExperience | INTEGER | — |
| autoResponseEnabled | BOOLEAN | — |
| autoResponseDelay | INTEGER | — |
| autoFollowUpEnabled | BOOLEAN | — |
| autoFollowUpDays | INTEGER | — |
| aiSourcingEnabled | BOOLEAN | — |
| aiSourcingChannels | JSONB | — |
| aiSourcingMaxPerDay | INTEGER | — |
| aiDiversitySourcingEnabled | BOOLEAN | — |
| blindScreeningEnabled | BOOLEAN | — |
| removeDemographics | BOOLEAN | — |
| removePhotos | BOOLEAN | — |
| removeNames | BOOLEAN | — |
| removeAge | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `aiAutopilotExecutions`

PostgreSQL: `ai_autopilot_executions` · 8 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| ruleId | UUID | NOT NULL, FK → `aiAutopilotRules.id` (CASCADE) |
| triggerValue | REAL | — |
| thresholdValue | REAL | — |
| executionDetails | JSONB | — |
| revertedAt | TIMESTAMP | — |
| revertedBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |

## `aiAutopilotRules`

PostgreSQL: `ai_autopilot_rules` · 13 columns · 1 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| threshold | REAL | NOT NULL |
| windowMinutes | INTEGER | — |
| cooldownMinutes | INTEGER | — |
| actionConfig | JSONB | — |
| isActive | BOOLEAN | — |
| triggerCount | INTEGER | — |
| lastTriggeredAt | TIMESTAMP | — |
| lastEvaluatedAt | TIMESTAMP | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `aiAutopilotExecutions.ruleId`

## `aiBatchItems`

PostgreSQL: `ai_batch_items` · 11 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| batchId | UUID | NOT NULL, FK → `aiBatchJobs.id` (CASCADE) |
| itemIndex | INTEGER | NOT NULL |
| inputData | JSONB | NOT NULL |
| outputData | JSONB | — |
| error | TEXT | — |
| retryCount | INTEGER | NOT NULL |
| processingTimeMs | INTEGER | — |
| startedAt | TIMESTAMP | — |
| completedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

## `aiBatchJobs`

PostgreSQL: `ai_batch_jobs` · 14 columns · 2 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| totalItems | INTEGER | NOT NULL |
| completedItems | INTEGER | NOT NULL |
| failedItems | INTEGER | NOT NULL |
| config | JSONB | — |
| summary | JSONB | — |
| error | TEXT | — |
| startedAt | TIMESTAMP | — |
| completedAt | TIMESTAMP | — |
| cancelledAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `aiBatchItems.batchId`

## `aiBiasAudits`

PostgreSQL: `ai_bias_audits` · 7 columns · 1 FK out · 5 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| results | JSONB | — |
| demographicBreakdown | JSONB | — |
| fairnessScore | REAL | — |
| recommendations | JSONB | — |
| auditedBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |

**Referenced by:** `biasRemediationActions.auditId`, `biasAlertEvents.auditId`, `biasSimulations.baselineAuditId`, `biasIntersectionalRecords.auditId`, `biasCausalAnalysis.auditId`

## `aiCostBudgets`

PostgreSQL: `ai_cost_budgets` · 10 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| monthlyBudgetUsd | REAL | NOT NULL |
| alertThresholdPercent | REAL | — |
| currentSpendUsd | REAL | — |
| periodStart | TIMESTAMP | NOT NULL |
| periodEnd | TIMESTAMP | — |
| actionConfig | JSONB | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `aiCostRecommendations`

PostgreSQL: `ai_cost_recommendations` · 8 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| currentCostPerDay | REAL | — |
| projectedCostPerDay | REAL | — |
| savingsPercent | REAL | — |
| accuracyImpact | REAL | — |
| rationale | TEXT | — |
| implementedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

## `aiExplainabilityLogs`

PostgreSQL: `ai_explainability_logs` · 10 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| inputSummary | TEXT | — |
| outputSummary | TEXT | — |
| explanation | TEXT | — |
| confidenceScore | REAL | — |
| featureImportance | JSONB | — |
| wasOverridden | BOOLEAN | — |
| overriddenBy | UUID | FK → `users.id` (SET NULL) |
| overrideReason | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

## `aiFeatureConfigs`

PostgreSQL: `ai_feature_configs` · 4 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| isEnabled | BOOLEAN | — |
| updatedAt | TIMESTAMP | NOT NULL |

## `aiFeaturePresets`

PostgreSQL: `ai_feature_presets` · 8 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| configs | JSONB | NOT NULL |
| isBuiltIn | BOOLEAN | — |
| isDefault | BOOLEAN | — |
| createdBy | UUID | FK → `users.id` |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `aiFeatureRollouts`

PostgreSQL: `ai_feature_rollouts` · 16 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| rolloutPercentage | INTEGER | — |
| targetPercentage | INTEGER | — |
| incrementStep | INTEGER | — |
| incrementIntervalMinutes | INTEGER | — |
| rollbackThreshold | JSONB | — |
| newConfig | JSONB | — |
| previousConfig | JSONB | — |
| qualityGate | JSONB | — |
| rolloutHistory | JSONB | — |
| startedAt | TIMESTAMP | — |
| completedAt | TIMESTAMP | — |
| rolledBackAt | TIMESTAMP | — |
| createdBy | UUID | FK → `users.id` |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `aiGovernancePolicies`

PostgreSQL: `ai_governance_policies` · 10 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| rules | JSONB | — |
| appliesTo | JSONB | — |
| isActive | BOOLEAN | — |
| lastTriggered | TIMESTAMP | — |
| triggerCount | INTEGER | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `aiIncidents`

PostgreSQL: `ai_incidents` · 12 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| impactSummary | TEXT | — |
| rootCause | TEXT | — |
| remediation | TEXT | — |
| affectedUsers | INTEGER | — |
| timeline | JSONB | — |
| assignedTo | UUID | FK → `users.id` (SET NULL) |
| resolvedBy | UUID | FK → `users.id` (SET NULL) |
| resolvedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `aiInterviewSessions`

PostgreSQL: `ai_interview_sessions` · 14 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| testId | UUID | FK → `competencyTests.id` (SET NULL) |
| invitationId | UUID | FK → `assessmentInvitations.id` (SET NULL) |
| jobDescription | TEXT | — |
| messages | JSONB | — |
| aiScore | REAL | — |
| aiSummary | TEXT | — |
| aiStrengths | JSONB | — |
| aiConcerns | JSONB | — |
| questionCount | INTEGER | — |
| maxQuestions | INTEGER | — |
| startedAt | TIMESTAMP | NOT NULL |
| completedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

## `aiJobs`

PostgreSQL: `ai_jobs` · 8 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| inputData | JSONB | — |
| outputData | JSONB | — |
| error | TEXT | — |
| userId | UUID | FK → `users.id` (SET NULL) |
| organizationId | UUID | FK → `organizations.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| completedAt | TIMESTAMP | — |

## `aiModelMetrics`

PostgreSQL: `ai_model_metrics` · 8 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| accuracy | REAL | — |
| biasScore | REAL | — |
| latencyMs | INTEGER | — |
| requestCount | INTEGER | — |
| errorCount | INTEGER | — |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

## `aiModelRegistry`

PostgreSQL: `ai_model_registry` · 12 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| deployedAt | TIMESTAMP | — |
| accuracy | REAL | — |
| latencyP50 | REAL | — |
| latencyP99 | REAL | — |
| tokenCostPer1k | REAL | — |
| maxTokens | INTEGER | — |
| config | JSONB | — |
| changelog | TEXT | — |
| deployedBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `aiPromptExperimentAssignments`

PostgreSQL: `ai_prompt_experiment_assignments` · 4 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| experimentId | UUID | NOT NULL, FK → `aiPromptExperiments.id` (CASCADE) |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| assignedAt | TIMESTAMP | NOT NULL |

## `aiPromptExperimentEvents`

PostgreSQL: `ai_prompt_experiment_events` · 7 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| experimentId | UUID | NOT NULL, FK → `aiPromptExperiments.id` (CASCADE) |
| userId | UUID | FK → `users.id` (SET NULL) |
| eventValue | REAL | — |
| metadata | JSONB | — |
| entityId | UUID | — |
| createdAt | TIMESTAMP | NOT NULL |

## `aiPromptExperiments`

PostgreSQL: `ai_prompt_experiments` · 15 columns · 3 FK out · 2 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| controlPromptId | UUID | NOT NULL, FK → `aiPromptTemplates.id` |
| variantPromptId | UUID | NOT NULL, FK → `aiPromptTemplates.id` |
| trafficSplit | REAL | NOT NULL |
| secondaryMetrics | JSONB | — |
| minSampleSize | INTEGER | NOT NULL |
| confidenceLevel | REAL | NOT NULL |
| pValue | REAL | — |
| effectSize | REAL | — |
| startedAt | TIMESTAMP | — |
| completedAt | TIMESTAMP | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `aiPromptExperimentAssignments.experimentId`, `aiPromptExperimentEvents.experimentId`

## `aiPromptTemplates`

PostgreSQL: `ai_prompt_templates` · 17 columns · 1 FK out · 2 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| version | INTEGER | NOT NULL |
| systemPrompt | TEXT | NOT NULL |
| userPromptTemplate | TEXT | — |
| variables | JSONB | — |
| temperature | REAL | — |
| maxTokens | INTEGER | — |
| topP | REAL | — |
| frequencyPenalty | REAL | — |
| presencePenalty | REAL | — |
| stopSequences | JSONB | — |
| isActive | BOOLEAN | — |
| isDefault | BOOLEAN | — |
| testResults | JSONB | — |
| createdBy | UUID | FK → `users.id` |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `aiPromptExperiments.controlPromptId`, `aiPromptExperiments.variantPromptId`

## `aiQualityFeedback`

PostgreSQL: `ai_quality_feedback` · 8 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | FK → `users.id` (SET NULL) |
| rating | INTEGER | NOT NULL |
| comment | TEXT | — |
| inputSnippet | TEXT | — |
| outputSnippet | TEXT | — |
| responseTimeMs | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |

## `aiQualityGateLogs`

PostgreSQL: `ai_quality_gate_logs` · 8 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| gateId | UUID | FK → `aiQualityGates.id` (SET NULL) |
| details | JSONB | — |
| outputSnapshot | TEXT | — |
| userId | UUID | — |
| organizationId | UUID | — |
| latencyMs | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |

## `aiQualityGates`

PostgreSQL: `ai_quality_gates` · 11 columns · 1 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| config | JSONB | NOT NULL |
| isEnabled | BOOLEAN | — |
| priority | INTEGER | — |
| passCount | INTEGER | — |
| warnCount | INTEGER | — |
| failCount | INTEGER | — |
| lastTriggeredAt | TIMESTAMP | — |
| createdBy | UUID | FK → `users.id` |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `aiQualityGateLogs.gateId`

## `aiRecurringMonitorAlerts`

PostgreSQL: `ai_recurring_monitor_alerts` · 11 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| monitorId | UUID | NOT NULL, FK → `aiRecurringMonitors.id` (CASCADE) |
| runId | UUID | FK → `aiRecurringMonitorRuns.id` (SET NULL) |
| description | TEXT | — |
| entityId | UUID | — |
| actionTaken | BOOLEAN | — |
| actionTakenAt | TIMESTAMP | — |
| actionTakenBy | UUID | FK → `users.id` (SET NULL) |
| metadata | JSONB | — |
| expiresAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

## `aiRecurringMonitorRuns`

PostgreSQL: `ai_recurring_monitor_runs` · 11 columns · 1 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| monitorId | UUID | NOT NULL, FK → `aiRecurringMonitors.id` (CASCADE) |
| startedAt | TIMESTAMP | NOT NULL |
| completedAt | TIMESTAMP | — |
| durationMs | INTEGER | — |
| itemsProcessed | INTEGER | — |
| itemsFlagged | INTEGER | — |
| summary | JSONB | — |
| errorMessage | TEXT | — |
| aiTokensUsed | INTEGER | — |
| aiCostUsd | REAL | — |

**Referenced by:** `aiRecurringMonitorAlerts.runId`

## `aiRecurringMonitors`

PostgreSQL: `ai_recurring_monitors` · 15 columns · 2 FK out · 2 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| skillId | UUID | FK → `aiSkillPrompts.id` (SET NULL) |
| intervalMinutes | INTEGER | — |
| isEnabled | BOOLEAN | NOT NULL |
| config | JSONB | — |
| lastRunAt | TIMESTAMP | — |
| lastRunDurationMs | INTEGER | — |
| nextRunAt | TIMESTAMP | — |
| consecutiveFailures | INTEGER | — |
| maxRetries | INTEGER | — |
| timeoutMs | INTEGER | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `aiRecurringMonitorRuns.monitorId`, `aiRecurringMonitorAlerts.monitorId`

## `aiSafetyRules`

PostgreSQL: `ai_safety_rules` · 9 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| config | JSONB | NOT NULL |
| isEnabled | BOOLEAN | — |
| priority | INTEGER | — |
| violationCount | INTEGER | — |
| lastTriggeredAt | TIMESTAMP | — |
| createdBy | UUID | FK → `users.id` |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `aiSearchHistory`

PostgreSQL: `ai_search_history` · 14 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| query | TEXT | NOT NULL |
| filters | JSONB | — |
| resultCount | INTEGER | — |
| topMatchScore | INTEGER | — |
| interpretedCriteria | JSONB | — |
| resultSummary | JSONB | — |
| candidatesShortlisted | INTEGER | — |
| candidatesContacted | INTEGER | — |
| searchDurationMs | INTEGER | — |
| isSaved | BOOLEAN | — |
| tags | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

## `aiSkillPrompts`

PostgreSQL: `ai_skill_prompts` · 11 columns · 1 FK out · 2 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| promptContent | TEXT | NOT NULL |
| outputFormat | TEXT | — |
| constraints | TEXT | — |
| keywords | JSONB | — |
| version | INTEGER | NOT NULL |
| isEnabled | BOOLEAN | NOT NULL |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `aiSkillReviews.skillId`, `aiRecurringMonitors.skillId`

## `aiSkillReviews`

PostgreSQL: `ai_skill_reviews` · 9 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| skillId | UUID | NOT NULL, FK → `aiSkillPrompts.id` (CASCADE) |
| reviewerNotes | TEXT | — |
| reviewedBy | UUID | FK → `users.id` (SET NULL) |
| reviewedAt | TIMESTAMP | — |
| snoozedUntil | TIMESTAMP | — |
| autoSuggestions | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `aiSmartRouterConfigs`

PostgreSQL: `ai_smart_router_configs` · 13 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| isEnabled | BOOLEAN | — |
| complexityThresholds | JSONB | — |
| fallbackChain | JSONB | — |
| circuitBreakerConfig | JSONB | — |
| qualityMinScore | REAL | — |
| maxLatencyMs | INTEGER | — |
| maxCostPerRequest | REAL | — |
| featureOverrides | JSONB | — |
| routingStats | JSONB | — |
| createdBy | UUID | FK → `users.id` |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `aiSourcingCandidateDna`

PostgreSQL: `ai_sourcing_candidate_dna` · 16 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| candidateProfileId | UUID | FK → `candidateSourcingProfiles.id` |
| responseLikelihood | REAL | NOT NULL |
| offerAcceptanceProbability | REAL | NOT NULL |
| retentionScore | REAL | NOT NULL |
| growthTrajectory | REAL | NOT NULL |
| culturalAlignment | REAL | NOT NULL |
| leadershipPotential | REAL | NOT NULL |
| innovationIndex | REAL | NOT NULL |
| adaptabilityScore | REAL | NOT NULL |
| overallDnaScore | REAL | NOT NULL |
| signals | JSONB | — |
| narrative | TEXT | — |
| generatedAt | TIMESTAMP | NOT NULL |
| expiresAt | TIMESTAMP | — |

## `aiSourcingCompetitorIntel`

PostgreSQL: `ai_sourcing_competitor_intel` · 9 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| hiringActivity | JSONB | — |
| talentFlow | JSONB | — |
| compensationIntel | JSONB | — |
| techStack | JSONB | — |
| insights | TEXT | — |
| lastUpdated | TIMESTAMP | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |

## `aiSourcingCopilotChats`

PostgreSQL: `ai_sourcing_copilot_chats` · 8 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| messages | JSONB | — |
| context | JSONB | — |
| messageCount | INTEGER | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `aiSourcingCraftedMessages`

PostgreSQL: `ai_sourcing_crafted_messages` · 10 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| candidateProfileId | UUID | FK → `candidateSourcingProfiles.id` |
| messageBody | TEXT | NOT NULL |
| personalizationPoints | JSONB | — |
| alternativeVersions | JSONB | — |
| sentAt | TIMESTAMP | — |
| responseReceived | BOOLEAN | — |
| responseAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

## `aiSourcingDiversityReports`

PostgreSQL: `ai_sourcing_diversity_reports` · 8 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| reportDate | TIMESTAMP | NOT NULL |
| pipelineDiversity | JSONB | — |
| sourcingBias | JSONB | — |
| bbbeeCompliance | JSONB | — |
| insights | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

## `aiSourcingMarketPulse`

PostgreSQL: `ai_sourcing_market_pulse` · 13 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| impactedRoles | JSONB | — |
| impactedSkills | JSONB | — |
| estimatedCandidates | INTEGER | NOT NULL |
| matchingOpenRoles | JSONB | — |
| actionRecommendations | JSONB | — |
| urgencyScore | REAL | NOT NULL |
| sourceUrl | TEXT | — |
| detectedAt | TIMESTAMP | NOT NULL |
| expiresAt | TIMESTAMP | — |
| actedUpon | BOOLEAN | — |

## `aiSourcingNetworkNodes`

PostgreSQL: `ai_sourcing_network_nodes` · 6 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| metadata | JSONB | — |
| connections | JSONB | — |
| centralityScore | REAL | — |
| createdAt | TIMESTAMP | NOT NULL |

## `aiSourcingPassiveSignals`

PostgreSQL: `ai_sourcing_passive_signals` · 9 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| candidateProfileId | UUID | FK → `candidateSourcingProfiles.id` |
| signalStrength | REAL | NOT NULL |
| description | TEXT | — |
| metadata | JSONB | — |
| detectedAt | TIMESTAMP | NOT NULL |
| expiresAt | TIMESTAMP | — |
| acknowledged | BOOLEAN | — |

## `aiSourcingPipelineForecasts`

PostgreSQL: `ai_sourcing_pipeline_forecasts` · 8 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| jobId | UUID | — |
| forecastDate | TIMESTAMP | NOT NULL |
| predictions | JSONB | — |
| confidence | REAL | NOT NULL |
| insights | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

## `aiSourcingPlaybooks`

PostgreSQL: `ai_sourcing_playbooks` · 7 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| strategy | JSONB | — |
| kpis | JSONB | — |
| insights | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `aiSourcingResumeUploads`

PostgreSQL: `ai_sourcing_resume_uploads` · 10 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| fileSize | INTEGER | — |
| parsedData | JSONB | — |
| matchedProfileId | UUID | FK → `candidateSourcingProfiles.id` |
| duplicateOf | UUID | — |
| confidenceScore | REAL | — |
| uploadedBy | UUID | FK → `users.id` |
| createdAt | TIMESTAMP | NOT NULL |
| processedAt | TIMESTAMP | — |

## `aiSourcingSequenceEnrollments`

PostgreSQL: `ai_sourcing_sequence_enrollments` · 8 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| sequenceId | UUID | NOT NULL, FK → `aiSourcingSequences.id` (CASCADE) |
| candidateProfileId | UUID | FK → `candidateSourcingProfiles.id` |
| currentStep | INTEGER | NOT NULL |
| enrolledAt | TIMESTAMP | NOT NULL |
| completedAt | TIMESTAMP | — |
| lastActionAt | TIMESTAMP | — |
| responseData | JSONB | — |

## `aiSourcingSequenceSteps`

PostgreSQL: `ai_sourcing_sequence_steps` · 10 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| sequenceId | UUID | NOT NULL, FK → `aiSourcingSequences.id` (CASCADE) |
| stepNumber | INTEGER | NOT NULL |
| content | TEXT | — |
| contentVariantB | TEXT | — |
| delayDays | INTEGER | NOT NULL |
| delayHours | INTEGER | NOT NULL |
| sendTimeOptimization | BOOLEAN | — |
| stats | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

## `aiSourcingSequences`

PostgreSQL: `ai_sourcing_sequences` · 10 columns · 2 FK out · 2 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| totalSteps | INTEGER | NOT NULL |
| targetCriteria | JSONB | — |
| abTestEnabled | BOOLEAN | — |
| stats | JSONB | — |
| createdBy | UUID | FK → `users.id` |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `aiSourcingSequenceSteps.sequenceId`, `aiSourcingSequenceEnrollments.sequenceId`

## `aiSourcingTalentMaps`

PostgreSQL: `ai_sourcing_talent_maps` · 10 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| targetSkills | JSONB | — |
| regions | JSONB | — |
| skillClusters | JSONB | — |
| companyFlows | JSONB | — |
| insights | TEXT | — |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `aiTranslationSessions`

PostgreSQL: `ai_translation_sessions` · 15 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| sourceText | TEXT | NOT NULL |
| translatedText | TEXT | — |
| alternativeTranslations | JSONB | — |
| contextNotes | TEXT | — |
| glossaryTermsUsed | JSONB | — |
| confidence | REAL | — |
| tokensUsed | INTEGER | — |
| durationMs | INTEGER | — |
| wasAccepted | BOOLEAN | — |
| wasEdited | BOOLEAN | — |
| editedText | TEXT | — |
| keyId | UUID | FK → `translationKeys.id` |
| createdBy | UUID | FK → `users.id` |
| createdAt | TIMESTAMP | NOT NULL |

## `aiUsageLogs`

PostgreSQL: `ai_usage_logs` · 10 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | FK → `users.id` (SET NULL) |
| tokensInput | INTEGER | — |
| tokensOutput | INTEGER | — |
| latencyMs | INTEGER | — |
| costUsd | REAL | — |
| statusCode | INTEGER | — |
| errorMessage | TEXT | — |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

---
← Back to [[13-raw/data/erd/index|ERD Index]]