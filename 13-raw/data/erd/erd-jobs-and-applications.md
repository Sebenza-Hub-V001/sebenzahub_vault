---
title: "ERD — Jobs & Applications"
type: reference
created: 2026-04-10
updated: 2026-04-10
tags: [database, erd, jobs-and-applications]
status: active
---

# ERD — Jobs & Applications

**17 tables** · **27 FK relationships** — Job listings, applications, templates, search, and application lifecycle.

← Back to [[13-raw/data/erd/index|ERD Index]]

## `applicationActivities`

PostgreSQL: `application_activities` · 6 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| applicationId | UUID | NOT NULL, FK → `jobApplications.id` (CASCADE) |
| userId | UUID | FK → `users.id` (SET NULL) |
| content | TEXT | — |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

## `applicationCommunications`

PostgreSQL: `application_communications` · 6 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| applicationId | UUID | NOT NULL, FK → `jobApplications.id` (CASCADE) |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| content | TEXT | NOT NULL |
| sentAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

## `applicationFollowUps`

PostgreSQL: `application_follow_ups` · 6 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| applicationId | UUID | NOT NULL, FK → `jobApplications.id` (CASCADE) |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| sentAt | TIMESTAMP | NOT NULL |
| messagePreview | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

## `applicationMomentumSnapshots`

PostgreSQL: `application_momentum_snapshots` · 9 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| score | REAL | NOT NULL |
| velocity | REAL | — |
| responseRateTrend | REAL | — |
| forecast | JSONB | — |
| dailyPlaybook | JSONB | — |
| calculatedAt | TIMESTAMP | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |

## `applicationNetworkingActions`

PostgreSQL: `application_networking_actions` · 5 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| applicationId | UUID | NOT NULL, FK → `jobApplications.id` (CASCADE) |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| notes | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

## `applicationNotes`

PostgreSQL: `application_notes` · 8 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| applicationId | UUID | NOT NULL, FK → `jobApplications.id` (CASCADE) |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| content | TEXT | NOT NULL |
| tags | JSONB | — |
| isPinned | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `applicationReminders`

PostgreSQL: `application_reminders` · 6 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| applicationId | UUID | NOT NULL, FK → `jobApplications.id` (CASCADE) |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| reminderDate | TIMESTAMP | NOT NULL |
| message | TEXT | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |

## `applicationStreaks`

PostgreSQL: `application_streaks` · 10 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| currentStreak | INTEGER | NOT NULL |
| longestStreak | INTEGER | NOT NULL |
| lastActiveDate | TIMESTAMP | — |
| momentumScore | INTEGER | NOT NULL |
| achievements | JSONB | — |
| weeklyChallenge | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `applicationWithdrawals`

PostgreSQL: `application_withdrawals` · 5 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| applicationId | UUID | NOT NULL, FK → `jobApplications.id` (CASCADE) |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| details | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

## `jdDrafts`

PostgreSQL: `jd_drafts` · 12 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| createdBy | UUID | FK → `users.id` (CASCADE) |
| inputParams | JSONB | — |
| content | JSONB | — |
| scores | JSONB | — |
| version | INTEGER | — |
| parentId | UUID | — |
| isFavorite | BOOLEAN | — |
| isTemplate | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `jobApplications`

PostgreSQL: `job_applications` · 17 columns · 2 FK out · 26 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| jobId | UUID | NOT NULL, FK → `jobs.id` (CASCADE) |
| coverLetter | TEXT | — |
| resumeUrl | TEXT | — |
| answers | JSONB | — |
| matchScore | REAL | — |
| screeningNotes | TEXT | — |
| aiMatchScore | REAL | — |
| aiMatchExplanation | TEXT | — |
| aiMatchedSkills | JSONB | — |
| aiMissingSkills | JSONB | — |
| videoIntroId | UUID | — |
| ghostRiskScore | INTEGER | — |
| ghostRiskFactors | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `applicationNotes.applicationId`, `applicationReminders.applicationId`, `applicationWithdrawals.applicationId`, `applicationActivities.applicationId`, `scorecardResponses.applicationId`, `offers.applicationId`, `emailSequenceExecutions.applicationId`, `schedulingLinks.applicationId` +18 more

## `jobEmbeddings`

PostgreSQL: `job_embeddings` · 4 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| jobId | UUID | NOT NULL, UNIQUE, FK → `jobs.id` (CASCADE) |
| embedding | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

## `jobFavorites`

PostgreSQL: `job_favorites` · 4 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| jobId | UUID | NOT NULL, FK → `jobs.id` (CASCADE) |
| createdAt | TIMESTAMP | NOT NULL |

## `jobIntakeScorecard`

PostgreSQL: `job_intake_scorecard` · 21 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL |
| jobId | UUID | NOT NULL |
| clientId | UUID | — |
| salaryCompetitiveness | INTEGER | — |
| roleClarity | INTEGER | — |
| urgencyLevel | INTEGER | — |
| hiringManagerAccess | INTEGER | — |
| interviewProcess | INTEGER | — |
| locationAttractiveness | INTEGER | — |
| brandStrength | INTEGER | — |
| overallScore | INTEGER | — |
| fillProbability | INTEGER | — |
| estimatedTimeToFill | INTEGER | — |
| estimatedFee | INTEGER | — |
| scoredBy | UUID | — |
| aiAssisted | BOOLEAN | — |
| notes | TEXT | — |
| interviewStages | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `jobSearchExpenses`

PostgreSQL: `job_search_expenses` · 10 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| amountCents | INTEGER | NOT NULL |
| expenseDate | TIMESTAMP | NOT NULL |
| isRecurring | BOOLEAN | — |
| receiptUrl | TEXT | — |
| taxDeductible | BOOLEAN | — |
| notes | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `jobTemplates`

PostgreSQL: `job_templates` · 7 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| requirements | JSONB | — |
| approvalChain | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `jobs`

PostgreSQL: `jobs` · 24 columns · 2 FK out · 56 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (SET NULL) |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| core | JSONB | — |
| compensation | JSONB | — |
| roleDetails | JSONB | — |
| application | JSONB | — |
| companyDetails | JSONB | — |
| contract | JSONB | — |
| benefits | JSONB | — |
| vetting | JSONB | — |
| compliance | JSONB | — |
| attachments | JSONB | — |
| accessibility | JSONB | — |
| branding | JSONB | — |
| admin | JSONB | — |
| seo | JSONB | — |
| viewCount | INTEGER | — |
| applicationCount | INTEGER | — |
| isFeatured | BOOLEAN | — |
| expiresAt | TIMESTAMP | — |
| publishedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `jobApplications.jobId`, `jobFavorites.jobId`, `jobEmbeddings.jobId`, `assessmentInvitations.jobId`, `interviews.jobId`, `autoSearchResults.jobId`, `autoApplyLog.jobId`, `scorecards.jobId` +48 more

---
← Back to [[13-raw/data/erd/index|ERD Index]]