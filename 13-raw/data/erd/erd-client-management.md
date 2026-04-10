---
title: "ERD — Client Management"
type: reference
created: 2026-04-10
updated: 2026-04-10
tags: [database, erd, client-management]
status: active
---

# ERD — Client Management

**14 tables** · **10 FK relationships** — Recruiter corporate client CRM: contacts, engagements, revenue, meetings.

← Back to [[13-raw/data/erd/index|ERD Index]]

## `approvedVendors`

PostgreSQL: `approved_vendors` · 5 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| rate | REAL | — |
| ndaSigned | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |

## `clientDocuments`

PostgreSQL: `client_documents` · 9 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| clientId | UUID | NOT NULL, FK → `corporateClients.id` (CASCADE) |
| organizationId | UUID | NOT NULL |
| uploadedBy | UUID | NOT NULL |
| description | TEXT | — |
| fileUrl | TEXT | — |
| fileSize | INTEGER | — |
| expiresAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

## `clientMeetings`

PostgreSQL: `client_meetings` · 13 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| clientId | UUID | NOT NULL, FK → `corporateClients.id` (CASCADE) |
| organizationId | UUID | NOT NULL |
| createdBy | UUID | NOT NULL |
| description | TEXT | — |
| isVirtual | BOOLEAN | — |
| meetingUrl | TEXT | — |
| scheduledAt | TIMESTAMP | NOT NULL |
| duration | INTEGER | — |
| outcome | TEXT | — |
| attendees | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `clientNotes`

PostgreSQL: `client_notes` · 9 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| clientId | UUID | NOT NULL, FK → `corporateClients.id` (CASCADE) |
| organizationId | UUID | NOT NULL |
| authorId | UUID | NOT NULL |
| content | TEXT | NOT NULL |
| isPinned | BOOLEAN | — |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `clientPipeline`

PostgreSQL: `client_pipeline` · 13 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL |
| clientId | UUID | NOT NULL |
| stageChangedAt | TIMESTAMP | — |
| assignedTo | UUID | — |
| notes | TEXT | — |
| expectedRevenue | INTEGER | — |
| probability | INTEGER | — |
| nextAction | TEXT | — |
| nextActionDate | TIMESTAMP | — |
| lostReason | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `clientPipelineActivities`

PostgreSQL: `client_pipeline_activities` · 7 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| pipelineId | UUID | NOT NULL |
| organizationId | UUID | NOT NULL |
| description | TEXT | — |
| performedBy | UUID | — |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

## `clientPipelineStageHistory`

PostgreSQL: `client_pipeline_stage_history` · 6 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| pipelineId | UUID | NOT NULL |
| organizationId | UUID | NOT NULL |
| changedBy | UUID | — |
| durationInStage | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |

## `clientPipelineTasks`

PostgreSQL: `client_pipeline_tasks` · 9 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| pipelineId | UUID | NOT NULL |
| organizationId | UUID | NOT NULL |
| description | TEXT | — |
| dueDate | TIMESTAMP | — |
| assignedTo | UUID | — |
| completedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `clientRevenue`

PostgreSQL: `client_revenue` · 7 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| clientId | UUID | NOT NULL, FK → `corporateClients.id` (CASCADE) |
| organizationId | UUID | NOT NULL |
| amount | INTEGER | NOT NULL |
| date | TIMESTAMP | — |
| jobId | UUID | — |
| createdAt | TIMESTAMP | NOT NULL |

## `clientSatisfaction`

PostgreSQL: `client_satisfaction` · 7 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| clientId | UUID | NOT NULL, FK → `corporateClients.id` (CASCADE) |
| organizationId | UUID | NOT NULL |
| recordedBy | UUID | NOT NULL |
| score | INTEGER | NOT NULL |
| feedback | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

## `clientTags`

PostgreSQL: `client_tags` · 2 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| clientId | UUID | NOT NULL, FK → `corporateClients.id` (CASCADE) |

## `corporateClientContacts`

PostgreSQL: `corporate_client_contacts` · 5 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| clientId | UUID | NOT NULL, FK → `corporateClients.id` (CASCADE) |
| whatsappConsent | BOOLEAN | — |
| isPrimary | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |

## `corporateClientEngagements`

PostgreSQL: `corporate_client_engagements` · 7 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| clientId | UUID | NOT NULL, FK → `corporateClients.id` (CASCADE) |
| feePercent | REAL | — |
| retainerAmount | INTEGER | — |
| startDate | TIMESTAMP | — |
| endDate | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

## `corporateClients`

PostgreSQL: `corporate_clients` · 7 columns · 1 FK out · 8 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| agencyOrganizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| rating | REAL | — |
| website | TEXT | — |
| notes | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `corporateClientContacts.clientId`, `corporateClientEngagements.clientId`, `clientNotes.clientId`, `clientDocuments.clientId`, `clientTags.clientId`, `clientMeetings.clientId`, `clientRevenue.clientId`, `clientSatisfaction.clientId`

---
← Back to [[13-raw/data/erd/index|ERD Index]]