---
title: "ERD — Onboarding"
type: reference
created: 2026-04-10
updated: 2026-04-10
tags: [database, erd, onboarding]
status: active
---

# ERD — Onboarding

**6 tables** · **17 FK relationships** — Employee onboarding templates, instances, buddies, checklists.

← Back to [[13-raw/data/erd/index|ERD Index]]

## `onboardingBuddies`

PostgreSQL: `onboarding_buddies` · 11 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| instanceId | UUID | FK → `onboardingInstances.id` (CASCADE) |
| expertise | JSONB | — |
| meetingsScheduled | INTEGER | — |
| meetingsCompleted | INTEGER | — |
| rating | INTEGER | — |
| notes | TEXT | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `onboardingCheckins`

PostgreSQL: `onboarding_checkins` · 13 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| instanceId | UUID | FK → `onboardingInstances.id` (CASCADE) |
| scheduledDate | TIMESTAMP | NOT NULL |
| participants | JSONB | — |
| notes | TEXT | — |
| satisfaction | INTEGER | — |
| actionItems | JSONB | — |
| duration | INTEGER | — |
| completedAt | TIMESTAMP | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `onboardingDocuments`

PostgreSQL: `onboarding_documents` · 11 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| instanceId | UUID | FK → `onboardingInstances.id` (CASCADE) |
| required | BOOLEAN | — |
| deadline | TIMESTAMP | — |
| uploadedAt | TIMESTAMP | — |
| verifiedAt | TIMESTAMP | — |
| notes | TEXT | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `onboardingInstances`

PostgreSQL: `onboarding_instances` · 11 columns · 4 FK out · 3 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| templateId | UUID | FK → `onboardingTemplates.id` (SET NULL) |
| applicationId | UUID | FK → `jobApplications.id` (SET NULL) |
| startDate | TIMESTAMP | — |
| tasks | JSONB | NOT NULL |
| progress | INTEGER | — |
| completedAt | TIMESTAMP | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `onboardingBuddies.instanceId`, `onboardingDocuments.instanceId`, `onboardingCheckins.instanceId`

## `onboardingResources`

PostgreSQL: `onboarding_resources` · 12 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| url | TEXT | — |
| mandatory | BOOLEAN | — |
| tags | JSONB | — |
| views | INTEGER | — |
| completions | INTEGER | — |
| rating | INTEGER | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `onboardingTemplates`

PostgreSQL: `onboarding_templates` · 7 columns · 2 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| tasks | JSONB | NOT NULL |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `onboardingInstances.templateId`

---
← Back to [[13-raw/data/erd/index|ERD Index]]