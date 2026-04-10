---
title: "ERD — Background Checks"
type: reference
created: 2026-04-10
updated: 2026-04-10
tags: [database, erd, background-checks]
status: active
---

# ERD — Background Checks

**15 tables** · **34 FK relationships** — Background check workflows, providers, consent, scoring, adjudication.

← Back to [[13-raw/data/erd/index|ERD Index]]

## `backgroundCheckAdjudications`

PostgreSQL: `background_check_adjudications` · 12 columns · 4 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| checkId | UUID | NOT NULL, FK → `backgroundChecks.id` (CASCADE) |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| adjudicatorId | UUID | FK → `users.id` (SET NULL) |
| reasoning | TEXT | — |
| conditions | JSONB | — |
| escalatedFrom | UUID | — |
| escalatedTo | UUID | FK → `users.id` (SET NULL) |
| escalationReason | TEXT | — |
| completedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | — |

## `backgroundCheckAlerts`

PostgreSQL: `background_check_alerts` · 9 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| checkId | UUID | FK → `backgroundChecks.id` (CASCADE) |
| message | TEXT | — |
| isRead | BOOLEAN | — |
| isDismissed | BOOLEAN | — |
| actionUrl | TEXT | — |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

## `backgroundCheckCampaigns`

PostgreSQL: `background_check_campaigns` · 18 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| jobId | UUID | — |
| packageId | UUID | — |
| totalCandidates | INTEGER | — |
| completedChecks | INTEGER | — |
| failedChecks | INTEGER | — |
| highRiskCount | INTEGER | — |
| slaDeadline | TIMESTAMP | — |
| checkTypes | JSONB | — |
| candidateEmails | JSONB | — |
| autoConsent | BOOLEAN | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| startedAt | TIMESTAMP | — |
| completedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | — |

## `backgroundCheckConsent`

PostgreSQL: `background_check_consent` · 7 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| checkId | UUID | NOT NULL, FK → `backgroundChecks.id` (CASCADE) |
| consentText | TEXT | — |
| consentGivenAt | TIMESTAMP | — |
| consentExpiresAt | TIMESTAMP | — |
| revokedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

## `backgroundCheckDisputes`

PostgreSQL: `background_check_disputes` · 18 columns · 4 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| checkId | UUID | NOT NULL, FK → `backgroundChecks.id` (CASCADE) |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| disputeReason | TEXT | NOT NULL |
| evidenceProvided | TEXT | — |
| assignedTo | UUID | FK → `users.id` (SET NULL) |
| resolution | TEXT | — |
| resolvedBy | UUID | FK → `users.id` (SET NULL) |
| resolvedAt | TIMESTAMP | — |
| adverseActionSent | BOOLEAN | — |
| adverseActionDate | TIMESTAMP | — |
| preAdverseNoticeSent | BOOLEAN | — |
| preAdverseNoticeDate | TIMESTAMP | — |
| waitingPeriodDays | INTEGER | — |
| candidateResponseDeadline | TIMESTAMP | — |
| candidateResponse | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | — |

## `backgroundCheckDocuments`

PostgreSQL: `background_check_documents` · 12 columns · 4 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| checkId | UUID | NOT NULL, FK → `backgroundChecks.id` (CASCADE) |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| fileSize | INTEGER | — |
| storageUrl | TEXT | — |
| verifiedBy | UUID | FK → `users.id` (SET NULL) |
| verifiedAt | TIMESTAMP | — |
| expiresAt | TIMESTAMP | — |
| metadata | JSONB | — |
| isConfidential | BOOLEAN | — |
| uploadedBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |

## `backgroundCheckNotes`

PostgreSQL: `background_check_notes` · 6 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| checkId | UUID | NOT NULL, FK → `backgroundChecks.id` (CASCADE) |
| authorId | UUID | FK → `users.id` (SET NULL) |
| content | TEXT | NOT NULL |
| isInternal | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |

## `backgroundCheckPackages`

PostgreSQL: `background_check_packages` · 10 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| checkTypes | JSONB | NOT NULL |
| isDefault | BOOLEAN | — |
| estimatedCost | INTEGER | — |
| estimatedDays | INTEGER | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | — |

## `backgroundCheckProviders`

PostgreSQL: `background_check_providers` · 18 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| checkTypes | JSONB | — |
| apiEndpoint | TEXT | — |
| apiKeyEncrypted | TEXT | — |
| avgTurnaroundDays | INTEGER | — |
| successRate | INTEGER | — |
| costPerCheck | INTEGER | — |
| lastHealthCheck | TIMESTAMP | — |
| totalChecksProcessed | INTEGER | — |
| rating | INTEGER | — |
| website | TEXT | — |
| notes | TEXT | — |
| slaGuaranteeDays | INTEGER | — |
| accreditations | JSONB | — |
| regions | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | — |

## `backgroundCheckRescreening`

PostgreSQL: `background_check_rescreening` · 9 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| originalCheckId | UUID | FK → `backgroundChecks.id` (SET NULL) |
| scheduledDate | TIMESTAMP | — |
| completedDate | TIMESTAMP | — |
| newCheckId | UUID | — |
| rescreenIntervalMonths | INTEGER | — |
| isAutomated | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |

## `backgroundCheckScoring`

PostgreSQL: `background_check_scoring` · 18 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| checkId | UUID | NOT NULL, FK → `backgroundChecks.id` (CASCADE) |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| overallScore | INTEGER | — |
| criminalScore | INTEGER | — |
| financialScore | INTEGER | — |
| employmentScore | INTEGER | — |
| educationScore | INTEGER | — |
| identityScore | INTEGER | — |
| socialScore | INTEGER | — |
| aiConfidence | INTEGER | — |
| aiReasoning | TEXT | — |
| flaggedItems | JSONB | — |
| anomalies | JSONB | — |
| benchmarkPercentile | INTEGER | — |
| industryComparison | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | — |

## `backgroundCheckSettings`

PostgreSQL: `background_check_settings` · 10 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| defaultPackageId | UUID | — |
| notifyOnComplete | BOOLEAN | — |
| notifyOnHighRisk | BOOLEAN | — |
| slaWarningDays | INTEGER | — |
| checkExpiryDays | INTEGER | — |
| providers | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | — |

## `backgroundCheckTimeline`

PostgreSQL: `background_check_timeline` · 5 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| checkId | UUID | NOT NULL, FK → `backgroundChecks.id` (CASCADE) |
| description | TEXT | — |
| performedBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |

## `backgroundCheckTrustProfiles`

PostgreSQL: `background_check_trust_profiles` · 19 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| compositeScore | INTEGER | — |
| criminalScore | INTEGER | — |
| financialScore | INTEGER | — |
| employmentScore | INTEGER | — |
| educationScore | INTEGER | — |
| identityScore | INTEGER | — |
| referenceScore | INTEGER | — |
| totalChecksCompleted | INTEGER | — |
| totalChecksFailed | INTEGER | — |
| lastCheckDate | TIMESTAMP | — |
| nextRescreenDate | TIMESTAMP | — |
| shareExpiresAt | TIMESTAMP | — |
| highlights | JSONB | — |
| concerns | JSONB | — |
| verificationSummary | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | — |

## `backgroundChecks`

PostgreSQL: `background_checks` · 15 columns · 4 FK out · 9 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| applicationId | UUID | FK → `jobApplications.id` (SET NULL) |
| result | JSONB | — |
| completedAt | TIMESTAMP | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| estimatedCost | INTEGER | — |
| actualCost | INTEGER | — |
| slaDeadline | TIMESTAMP | — |
| consentRecorded | BOOLEAN | — |
| packageId | UUID | — |
| assignedTo | UUID | FK → `users.id` (SET NULL) |
| expiresAt | TIMESTAMP | — |
| updatedAt | TIMESTAMP | — |

**Referenced by:** `backgroundCheckNotes.checkId`, `backgroundCheckTimeline.checkId`, `backgroundCheckConsent.checkId`, `backgroundCheckDocuments.checkId`, `backgroundCheckDisputes.checkId`, `backgroundCheckAlerts.checkId`, `backgroundCheckScoring.checkId`, `backgroundCheckAdjudications.checkId` +1 more

---
← Back to [[13-raw/data/erd/index|ERD Index]]