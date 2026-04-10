---
title: "ERD — Interviews & Scheduling"
type: reference
created: 2026-04-10
updated: 2026-04-10
tags: [database, erd, interviews-and-scheduling]
status: active
---

# ERD — Interviews & Scheduling

**18 tables** · **38 FK relationships** — Interview scheduling, video rooms, pools, rounds, scorecards.

← Back to [[13-raw/data/erd/index|ERD Index]]

## `holds`

PostgreSQL: `holds` · 6 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| startTime | TIMESTAMP | NOT NULL |
| endTime | TIMESTAMP | NOT NULL |
| reason | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

## `interviewFeedback`

PostgreSQL: `interview_feedback` · 13 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| applicationId | UUID | FK → `jobApplications.id` (CASCADE) |
| npsScore | INTEGER | — |
| overallRating | INTEGER | — |
| communicationRating | INTEGER | — |
| processRating | INTEGER | — |
| interviewerRating | INTEGER | — |
| wouldRecommend | BOOLEAN | — |
| feedback | TEXT | — |
| suggestions | TEXT | — |
| completedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

## `interviewKits`

PostgreSQL: `interview_kits` · 11 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| jobId | UUID | FK → `jobs.id` (SET NULL) |
| questions | JSONB | — |
| scoringCriteria | JSONB | — |
| redFlags | JSONB | — |
| followUpPrompts | JSONB | — |
| duration | INTEGER | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `interviewPools`

PostgreSQL: `interview_pools` · 7 columns · 1 FK out · 2 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| workingHours | JSONB | — |
| defaultDuration | INTEGER | — |
| bufferMinutes | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `poolMembers.poolId`, `interviews.poolId`

## `interviewRehearsals`

PostgreSQL: `interview_rehearsals` · 7 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| applicationId | UUID | NOT NULL, FK → `jobApplications.id` (CASCADE) |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| questions | JSONB | NOT NULL |
| answers | JSONB | — |
| readinessScore | REAL | — |
| createdAt | TIMESTAMP | NOT NULL |

## `interviewReminders`

PostgreSQL: `interview_reminders` · 7 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| interviewId | UUID | FK → `interviews.id` (CASCADE) |
| scheduledFor | TIMESTAMP | NOT NULL |
| message | TEXT | — |
| sentAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

## `interviewRounds`

PostgreSQL: `interview_rounds` · 10 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| jobId | UUID | FK → `jobs.id` (CASCADE) |
| applicationId | UUID | FK → `jobApplications.id` (SET NULL) |
| currentRound | INTEGER | — |
| totalRounds | INTEGER | — |
| roundDetails | JSONB | — |
| decisionNotes | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `interviewScorecards`

PostgreSQL: `interview_scorecards` · 16 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| interviewId | UUID | FK → `interviews.id` (CASCADE) |
| interviewerId | UUID | FK → `users.id` (SET NULL) |
| overallRating | INTEGER | — |
| criteria | JSONB | — |
| strengths | TEXT | — |
| concerns | TEXT | — |
| cultureFitRating | INTEGER | — |
| technicalRating | INTEGER | — |
| communicationRating | INTEGER | — |
| notes | TEXT | — |
| isComplete | BOOLEAN | — |
| submittedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `interviewSettings`

PostgreSQL: `interview_settings` · 8 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, UNIQUE, FK → `organizations.id` (CASCADE) |
| defaultDuration | INTEGER | — |
| bufferTime | INTEGER | — |
| workingHours | JSONB | — |
| panelTemplates | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `interviewTemplates`

PostgreSQL: `interview_templates` · 14 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| duration | INTEGER | — |
| location | TEXT | — |
| stages | JSONB | — |
| questions | JSONB | — |
| scorecardCriteria | JSONB | — |
| preparationNotes | TEXT | — |
| candidateInstructions | TEXT | — |
| isDefault | BOOLEAN | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `interviewerAvailability`

PostgreSQL: `interviewer_availability` · 8 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| userId | UUID | FK → `users.id` (CASCADE) |
| dayOfWeek | INTEGER | NOT NULL |
| isActive | BOOLEAN | — |
| effectiveFrom | TIMESTAMP | — |
| effectiveUntil | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

## `interviews`

PostgreSQL: `interviews` · 12 columns · 4 FK out · 2 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| poolId | UUID | FK → `interviewPools.id` (SET NULL) |
| jobId | UUID | FK → `jobs.id` (SET NULL) |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| interviewerUserId | UUID | FK → `users.id` (SET NULL) |
| startTime | TIMESTAMP | NOT NULL |
| endTime | TIMESTAMP | NOT NULL |
| meetingJoinUrl | TEXT | — |
| notes | TEXT | — |
| feedback | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `interviewReminders.interviewId`, `interviewScorecards.interviewId`

## `poolMembers`

PostgreSQL: `pool_members` · 6 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| poolId | UUID | NOT NULL, FK → `interviewPools.id` (CASCADE) |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| weight | REAL | — |
| isActive | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |

## `schedulingBulkOps`

PostgreSQL: `scheduling_bulk_ops` · 10 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| totalCount | INTEGER | — |
| processedCount | INTEGER | — |
| failedCount | INTEGER | — |
| inputData | JSONB | — |
| results | JSONB | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| completedAt | TIMESTAMP | — |

## `schedulingLinkActivities`

PostgreSQL: `scheduling_link_activities` · 5 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| schedulingLinkId | UUID | FK → `schedulingLinks.id` (CASCADE) |
| description | TEXT | — |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

## `schedulingLinks`

PostgreSQL: `scheduling_links` · 13 columns · 4 FK out · 2 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| jobId | UUID | FK → `jobs.id` (CASCADE) |
| applicationId | UUID | FK → `jobApplications.id` (CASCADE) |
| duration | INTEGER | — |
| availableSlots | JSONB | NOT NULL |
| selectedSlot | JSONB | — |
| location | TEXT | — |
| notes | TEXT | — |
| expiresAt | TIMESTAMP | — |
| scheduledAt | TIMESTAMP | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |

**Referenced by:** `schedulingLinkActivities.schedulingLinkId`, `schedulingReminders.schedulingLinkId`

## `schedulingReminders`

PostgreSQL: `scheduling_reminders` · 6 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| schedulingLinkId | UUID | FK → `schedulingLinks.id` (CASCADE) |
| scheduledFor | TIMESTAMP | NOT NULL |
| sentAt | TIMESTAMP | — |
| message | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

## `schedulingTemplates`

PostgreSQL: `scheduling_templates` · 22 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| duration | INTEGER | — |
| location | TEXT | — |
| bufferMinutes | INTEGER | — |
| maxBookingsPerDay | INTEGER | — |
| minNoticeHours | INTEGER | — |
| candidateInstructions | TEXT | — |
| confirmationMessage | TEXT | — |
| reminderEnabled | BOOLEAN | — |
| reminderHoursBefore | INTEGER | — |
| requireCandidatePhone | BOOLEAN | — |
| collectCandidateTimezone | BOOLEAN | — |
| allowReschedule | BOOLEAN | — |
| rescheduleDeadlineHours | INTEGER | — |
| autoConfirm | BOOLEAN | — |
| isDefault | BOOLEAN | — |
| usageCount | INTEGER | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

---
← Back to [[13-raw/data/erd/index|ERD Index]]