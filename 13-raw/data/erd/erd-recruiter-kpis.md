---
title: "ERD — Recruiter KPIs"
type: reference
created: 2026-04-10
updated: 2026-04-10
tags: [database, erd, recruiter-kpis]
status: active
---

# ERD — Recruiter KPIs

**11 tables** · **9 FK relationships** — Recruiter performance: KPI targets, call notes, LinkedIn leads, pipelines.

← Back to [[13-raw/data/erd/index|ERD Index]]

## `callNotes`

PostgreSQL: `call_notes` · 22 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL |
| recruiterId | UUID | NOT NULL |
| contactId | UUID | — |
| duration | INTEGER | — |
| rawNotes | TEXT | NOT NULL |
| aiSummary | TEXT | — |
| aiActionItems | JSONB | — |
| jobId | UUID | — |
| submissionId | UUID | — |
| rating | INTEGER | — |
| tags | JSONB | — |
| pinned | BOOLEAN | — |
| aiKeyPoints | JSONB | — |
| aiFollowUpSuggestion | TEXT | — |
| followUpRequired | BOOLEAN | — |
| followUpDate | TIMESTAMP | — |
| followUpNotes | TEXT | — |
| followUpCompletedAt | TIMESTAMP | — |
| completed | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `callObjections`

PostgreSQL: `call_objections` · 9 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL |
| recruiterId | UUID | NOT NULL |
| callNoteId | UUID | — |
| objection | TEXT | NOT NULL |
| aiRebuttal | TEXT | — |
| userRebuttal | TEXT | — |
| frequency | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |

## `callPlaybooks`

PostgreSQL: `call_playbooks` · 9 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL |
| recruiterId | UUID | NOT NULL |
| description | TEXT | — |
| steps | JSONB | — |
| isShared | BOOLEAN | — |
| usageCount | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `kpiActivityLog`

PostgreSQL: `kpi_activity_log` · 11 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL |
| recruiterId | UUID | NOT NULL |
| description | TEXT | — |
| relatedJobId | UUID | — |
| relatedCandidateId | UUID | — |
| revenueImpact | INTEGER | — |
| duration | INTEGER | — |
| notes | TEXT | — |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

## `kpiTargets`

PostgreSQL: `kpi_targets` · 20 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL |
| recruiterId | UUID | NOT NULL |
| callsTarget | INTEGER | — |
| emailsTarget | INTEGER | — |
| sourcingTarget | INTEGER | — |
| screeningTarget | INTEGER | — |
| submissionsTarget | INTEGER | — |
| interviewsTarget | INTEGER | — |
| offersTarget | INTEGER | — |
| placementsTarget | INTEGER | — |
| revenueTarget | INTEGER | — |
| pipelineTarget | INTEGER | — |
| submissionToInterviewTarget | INTEGER | — |
| interviewToOfferTarget | INTEGER | — |
| offerToPlacementTarget | INTEGER | — |
| avgTimeToFillTarget | INTEGER | — |
| isActive | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `leadNurtureEnrollments`

PostgreSQL: `lead_nurture_enrollments` · 8 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| sequenceId | UUID | NOT NULL, FK → `leadNurtureSequences.id` (CASCADE) |
| leadId | UUID | NOT NULL, FK → `linkedinLeads.id` (CASCADE) |
| currentStep | INTEGER | — |
| nextStepAt | TIMESTAMP | — |
| enrolledAt | TIMESTAMP | NOT NULL |
| completedAt | TIMESTAMP | — |
| stepResults | JSONB | — |

## `leadNurtureSequences`

PostgreSQL: `lead_nurture_sequences` · 11 columns · 1 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| recruiterId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| description | TEXT | — |
| steps | JSONB | — |
| stopConditions | JSONB | — |
| enrolledCount | INTEGER | — |
| completedCount | INTEGER | — |
| responseRate | REAL | — |
| isActive | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `leadNurtureEnrollments.sequenceId`

## `linkedinLeadDuplicates`

PostgreSQL: `linkedin_lead_duplicates` · 8 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| recruiterId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| leadId1 | UUID | NOT NULL, FK → `linkedinLeads.id` (CASCADE) |
| leadId2 | UUID | NOT NULL, FK → `linkedinLeads.id` (CASCADE) |
| confidence | REAL | NOT NULL |
| mergedIntoId | UUID | — |
| detectedAt | TIMESTAMP | NOT NULL |
| resolvedAt | TIMESTAMP | — |

## `linkedinLeadJobMatches`

PostgreSQL: `linkedin_lead_job_matches` · 9 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| leadId | UUID | NOT NULL, FK → `linkedinLeads.id` (CASCADE) |
| jobId | UUID | NOT NULL, FK → `jobs.id` (CASCADE) |
| matchScore | INTEGER | NOT NULL |
| matchExplanation | TEXT | — |
| matchedSkills | JSONB | — |
| missingSkills | JSONB | — |
| isRecommended | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |

## `linkedinLeads`

PostgreSQL: `linkedin_leads` · 27 columns · 1 FK out · 4 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| recruiterId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| headline | TEXT | — |
| linkedinProfileUrl | TEXT | — |
| customFields | JSONB | — |
| convertedCandidateId | UUID | — |
| notes | TEXT | — |
| tags | JSONB | — |
| leadScore | INTEGER | — |
| lastContactedAt | TIMESTAMP | — |
| nextFollowUpAt | TIMESTAMP | — |
| assignedTo | UUID | — |
| activityLog | JSONB | — |
| aiScore | INTEGER | — |
| aiInsights | JSONB | — |
| aiScoredAt | TIMESTAMP | — |
| outreachHistory | JSONB | — |
| conversionProbability | REAL | — |
| predictedConvertBy | TIMESTAMP | — |
| predictionUpdatedAt | TIMESTAMP | — |
| linkedTalentPoolIds | JSONB | — |
| linkedSequenceIds | JSONB | — |
| linkedCallNoteIds | JSONB | — |
| crossPlatformActions | JSONB | — |
| importedAt | TIMESTAMP | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `linkedinLeadJobMatches.leadId`, `leadNurtureEnrollments.leadId`, `linkedinLeadDuplicates.leadId1`, `linkedinLeadDuplicates.leadId2`

## `recruiterKpis`

PostgreSQL: `recruiter_kpis` · 23 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL |
| recruiterId | UUID | NOT NULL |
| periodStart | TIMESTAMP | NOT NULL |
| periodEnd | TIMESTAMP | NOT NULL |
| callsMade | INTEGER | — |
| emailsSent | INTEGER | — |
| candidatesSourced | INTEGER | — |
| candidatesScreened | INTEGER | — |
| submissionsMade | INTEGER | — |
| interviewsScheduled | INTEGER | — |
| interviewsConducted | INTEGER | — |
| offersMade | INTEGER | — |
| offersAccepted | INTEGER | — |
| placementsMade | INTEGER | — |
| revenueGenerated | INTEGER | — |
| revenueTarget | INTEGER | — |
| pipelineValue | INTEGER | — |
| submissionToInterview | INTEGER | — |
| interviewToOffer | INTEGER | — |
| offerToPlacement | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

---
← Back to [[13-raw/data/erd/index|ERD Index]]