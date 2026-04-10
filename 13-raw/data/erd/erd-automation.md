---
title: "ERD — Automation"
type: reference
created: 2026-04-10
updated: 2026-04-10
tags: [database, erd, automation]
status: active
---

# ERD — Automation

**12 tables** · **20 FK relationships** — Workflow automation chains, templates, webhooks, A/B tests.

← Back to [[13-raw/data/erd/index|ERD Index]]

## `automationAbTests`

PostgreSQL: `automation_ab_tests` · 17 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| variantA | JSONB | NOT NULL |
| variantB | JSONB | NOT NULL |
| splitRatio | INTEGER | — |
| targetSampleSize | INTEGER | — |
| currentSampleA | INTEGER | — |
| currentSampleB | INTEGER | — |
| resultA | JSONB | — |
| resultB | JSONB | — |
| confidenceLevel | INTEGER | — |
| startedAt | TIMESTAMP | — |
| completedAt | TIMESTAMP | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `automationChainExecutions`

PostgreSQL: `automation_chain_executions` · 11 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| chainId | UUID | NOT NULL, FK → `automationChains.id` (CASCADE) |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| stepsCompleted | INTEGER | — |
| totalSteps | INTEGER | NOT NULL |
| stepResults | JSONB | — |
| triggerData | JSONB | — |
| errorMessage | TEXT | — |
| totalDurationMs | INTEGER | — |
| startedAt | TIMESTAMP | NOT NULL |
| completedAt | TIMESTAMP | — |

## `automationChainSteps`

PostgreSQL: `automation_chain_steps` · 6 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| chainId | UUID | NOT NULL, FK → `automationChains.id` (CASCADE) |
| automationId | UUID | FK → `workflowAutomations.id` (SET NULL) |
| stepOrder | INTEGER | NOT NULL |
| config | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

## `automationChains`

PostgreSQL: `automation_chains` · 12 columns · 2 FK out · 2 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| triggerConditions | JSONB | — |
| maxRetries | INTEGER | — |
| timeoutMs | INTEGER | — |
| isActive | BOOLEAN | — |
| executionCount | INTEGER | — |
| lastExecutedAt | TIMESTAMP | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `automationChainSteps.chainId`, `automationChainExecutions.chainId`

## `automationExecutionLogs`

PostgreSQL: `automation_execution_logs` · 10 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| automationId | UUID | NOT NULL, FK → `workflowAutomations.id` (CASCADE) |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| triggerData | JSONB | — |
| actionsExecuted | JSONB | — |
| errorMessage | TEXT | — |
| candidateId | UUID | — |
| jobId | UUID | — |
| executionDurationMs | INTEGER | — |
| executedAt | TIMESTAMP | NOT NULL |

## `automationExecutions`

PostgreSQL: `automation_executions` · 8 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| ruleId | UUID | NOT NULL, FK → `billingAutomationRules.id` (CASCADE) |
| triggerData | JSONB | — |
| actionResult | JSONB | — |
| errorMessage | TEXT | — |
| durationMs | INTEGER | — |
| executedAt | TIMESTAMP | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |

## `automationInsights`

PostgreSQL: `automation_insights` · 10 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| description | TEXT | NOT NULL |
| suggestedAutomation | JSONB | — |
| evidence | JSONB | — |
| predictedTimeSavedMins | INTEGER | — |
| predictedImpactScore | INTEGER | — |
| adoptedAutomationId | UUID | — |
| expiresAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

## `automationSchedules`

PostgreSQL: `automation_schedules` · 9 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| automationId | UUID | NOT NULL, FK → `workflowAutomations.id` (CASCADE) |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| scheduledDays | JSONB | — |
| nextRunAt | TIMESTAMP | — |
| lastRunAt | TIMESTAMP | — |
| isActive | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `automationTemplates`

PostgreSQL: `automation_templates` · 9 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| triggerConditions | JSONB | — |
| actions | JSONB | — |
| tags | JSONB | — |
| popularity | INTEGER | — |
| isGlobal | BOOLEAN | — |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| createdAt | TIMESTAMP | NOT NULL |

## `automationVersions`

PostgreSQL: `automation_versions` · 8 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| automationId | UUID | NOT NULL, FK → `workflowAutomations.id` (CASCADE) |
| version | INTEGER | NOT NULL |
| triggerConditions | JSONB | — |
| actions | JSONB | — |
| changeNote | TEXT | — |
| changedBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |

## `automationWebhookLogs`

PostgreSQL: `automation_webhook_logs` · 12 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| webhookId | UUID | NOT NULL, FK → `automationWebhooks.id` (CASCADE) |
| automationId | UUID | — |
| requestUrl | TEXT | NOT NULL |
| requestHeaders | JSONB | — |
| requestBody | JSONB | — |
| responseStatus | INTEGER | — |
| responseBody | TEXT | — |
| durationMs | INTEGER | — |
| retryAttempt | INTEGER | — |
| error | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

## `automationWebhooks`

PostgreSQL: `automation_webhooks` · 18 columns · 2 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| url | TEXT | NOT NULL |
| headers | JSONB | — |
| payloadTemplate | JSONB | — |
| authConfig | JSONB | — |
| retryPolicy | JSONB | — |
| timeoutMs | INTEGER | — |
| isActive | BOOLEAN | — |
| lastCalledAt | TIMESTAMP | — |
| successCount | INTEGER | — |
| failureCount | INTEGER | — |
| lastStatusCode | INTEGER | — |
| lastError | TEXT | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `automationWebhookLogs.webhookId`

---
← Back to [[13-raw/data/erd/index|ERD Index]]