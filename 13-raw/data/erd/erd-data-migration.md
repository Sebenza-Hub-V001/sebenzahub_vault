---
title: "ERD — Data Migration"
type: reference
created: 2026-04-10
updated: 2026-04-10
tags: [database, erd, data-migration]
status: active
---

# ERD — Data Migration

**14 tables** · **10 FK relationships** — Data migration pipelines, field mappings, connectors, compliance.

← Back to [[13-raw/data/erd/index|ERD Index]]

## `migrationApprovals`

PostgreSQL: `migration_approvals` · 10 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| migrationId | UUID | — |
| exportId | UUID | — |
| requestedBy | UUID | — |
| reviewedBy | UUID | — |
| requestReason | TEXT | — |
| reviewNotes | TEXT | — |
| expiresAt | TIMESTAMP | — |
| reviewedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

## `migrationComplianceAudit`

PostgreSQL: `migration_compliance_audit` · 7 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| ruleId | UUID | — |
| migrationId | UUID | — |
| details | JSONB | — |
| resolvedAt | TIMESTAMP | — |
| resolvedBy | UUID | — |
| createdAt | TIMESTAMP | NOT NULL |

## `migrationComplianceRules`

PostgreSQL: `migration_compliance_rules` · 12 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| fieldPatterns | JSONB | — |
| retentionDays | INTEGER | — |
| appliesTo | JSONB | — |
| isSystemRule | BOOLEAN | — |
| isActive | BOOLEAN | — |
| violationCount | INTEGER | — |
| lastTriggeredAt | TIMESTAMP | — |
| createdBy | UUID | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `migrationConnectors`

PostgreSQL: `migration_connectors` · 18 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| credentials | JSONB | — |
| config | JSONB | — |
| healthScore | INTEGER | — |
| lastHealthCheck | TIMESTAMP | — |
| lastSyncAt | TIMESTAMP | — |
| totalSyncs | INTEGER | — |
| totalRecordsSynced | INTEGER | — |
| errorLog | JSONB | — |
| rateLimitRemaining | INTEGER | — |
| rateLimitResetAt | TIMESTAMP | — |
| autoReconnect | BOOLEAN | — |
| retryAttempts | INTEGER | — |
| timeoutMs | INTEGER | — |
| isActive | BOOLEAN | — |
| createdBy | UUID | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `migrationDataProfiles`

PostgreSQL: `migration_data_profiles` · 17 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| migrationId | UUID | — |
| connectorId | UUID | — |
| totalRecords | INTEGER | — |
| sampleSize | INTEGER | — |
| qualityScore | INTEGER | — |
| completenessScore | INTEGER | — |
| accuracyScore | INTEGER | — |
| consistencyScore | INTEGER | — |
| uniquenessScore | INTEGER | — |
| fieldAnalysis | JSONB | — |
| anomalies | JSONB | — |
| duplicateGroups | INTEGER | — |
| piiFieldsDetected | JSONB | — |
| recommendations | JSONB | — |
| profiledAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

## `migrationExports`

PostgreSQL: `migration_exports` · 18 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| connectorId | UUID | — |
| dataTypes | JSONB | — |
| filters | JSONB | — |
| fieldSelection | JSONB | — |
| totalRecords | INTEGER | — |
| exportedRecords | INTEGER | — |
| errorCount | INTEGER | — |
| fileUrl | TEXT | — |
| fileSize | INTEGER | — |
| complianceChecked | BOOLEAN | — |
| piiMasked | BOOLEAN | — |
| startedAt | TIMESTAMP | — |
| completedAt | TIMESTAMP | — |
| expiresAt | TIMESTAMP | — |
| createdBy | UUID | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `migrationFieldMappings`

PostgreSQL: `migration_field_mappings` · 7 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| migrationId | UUID | FK → `dataMigrations.id` (CASCADE) |
| templateId | UUID | FK → `migrationTemplates.id` (CASCADE) |
| mappings | JSONB | — |
| isActive | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `migrationLogs`

PostgreSQL: `migration_logs` · 5 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| migrationId | UUID | NOT NULL, FK → `dataMigrations.id` (CASCADE) |
| message | TEXT | NOT NULL |
| details | JSONB | — |
| timestamp | TIMESTAMP | NOT NULL |

## `migrationPipelineRuns`

PostgreSQL: `migration_pipeline_runs` · 13 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| pipelineId | UUID | NOT NULL |
| startedAt | TIMESTAMP | — |
| completedAt | TIMESTAMP | — |
| durationMs | INTEGER | — |
| recordsInput | INTEGER | — |
| recordsOutput | INTEGER | — |
| recordsFiltered | INTEGER | — |
| recordsErrored | INTEGER | — |
| stepResults | JSONB | — |
| errors | JSONB | — |
| createdBy | UUID | — |
| createdAt | TIMESTAMP | NOT NULL |

## `migrationPipelines`

PostgreSQL: `migration_pipelines` · 16 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| connectorId | UUID | — |
| steps | JSONB | — |
| inputSchema | JSONB | — |
| outputSchema | JSONB | — |
| errorHandling | JSONB | — |
| schedule | JSONB | — |
| lastRunAt | TIMESTAMP | — |
| runCount | INTEGER | — |
| avgDurationMs | INTEGER | — |
| totalRecordsProcessed | INTEGER | — |
| isActive | BOOLEAN | — |
| createdBy | UUID | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `migrationRollbacks`

PostgreSQL: `migration_rollbacks` · 10 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| migrationId | UUID | NOT NULL, FK → `dataMigrations.id` (CASCADE) |
| recordsReverted | INTEGER | — |
| totalToRevert | INTEGER | — |
| reason | TEXT | — |
| rollbackData | JSONB | — |
| initiatedBy | UUID | FK → `users.id` (SET NULL) |
| startedAt | TIMESTAMP | — |
| completedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

## `migrationSchedules`

PostgreSQL: `migration_schedules` · 16 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| templateId | UUID | FK → `migrationTemplates.id` (SET NULL) |
| dataTypes | JSONB | — |
| scheduledAt | TIMESTAMP | — |
| nextRunAt | TIMESTAMP | — |
| lastRunAt | TIMESTAMP | — |
| runCount | INTEGER | — |
| maxRetries | INTEGER | — |
| isActive | BOOLEAN | — |
| config | JSONB | — |
| notifyOnComplete | BOOLEAN | — |
| notifyOnError | BOOLEAN | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `migrationTemplates`

PostgreSQL: `migration_templates` · 13 columns · 1 FK out · 3 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| dataTypes | JSONB | — |
| fieldMappings | JSONB | — |
| transformations | JSONB | — |
| validationRules | JSONB | — |
| isSystemTemplate | BOOLEAN | — |
| isActive | BOOLEAN | — |
| usageCount | INTEGER | — |
| avgSuccessRate | REAL | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `migrationFieldMappings.templateId`, `migrationSchedules.templateId`, `migrationValidations.templateId`

## `migrationValidations`

PostgreSQL: `migration_validations` · 9 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| migrationId | UUID | FK → `dataMigrations.id` (CASCADE) |
| templateId | UUID | FK → `migrationTemplates.id` (CASCADE) |
| config | JSONB | — |
| passCount | INTEGER | — |
| failCount | INTEGER | — |
| failedRecords | JSONB | — |
| isActive | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |

---
← Back to [[13-raw/data/erd/index|ERD Index]]