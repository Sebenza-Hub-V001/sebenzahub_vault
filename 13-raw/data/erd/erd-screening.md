---
title: "ERD — Screening"
type: reference
created: 2026-04-10
updated: 2026-04-10
tags: [database, erd, screening]
status: active
---

# ERD — Screening

**20 tables** · **50 FK relationships** — AI-powered screening jobs, evaluations, bots, culture-fit assessments.

← Back to [[13-raw/data/erd/index|ERD Index]]

## `cultureFitAssessments`

PostgreSQL: `culture_fit_assessments` · 27 columns · 2 FK out · 2 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| recruiterId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| organizationId | UUID | FK → `organizations.id` (SET NULL) |
| candidateExperience | TEXT | — |
| candidateInterviewResponses | TEXT | — |
| candidateValues | TEXT | — |
| companyCulture | TEXT | — |
| companyValues | TEXT | — |
| companyTeamDynamics | TEXT | — |
| templateId | UUID | — |
| fitScore | INTEGER | — |
| alignments | JSONB | — |
| concerns | JSONB | — |
| recommendations | JSONB | — |
| biasAnalysis | JSONB | — |
| interviewQuestions | JSONB | — |
| onboardingPlan | JSONB | — |
| teamCompatibility | JSONB | — |
| dimensionWeights | JSONB | — |
| archetypeResult | JSONB | — |
| clashSimulation | JSONB | — |
| retentionRisk | JSONB | — |
| tags | JSONB | — |
| notes | TEXT | — |
| isFavorite | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `cultureFitInterviewerScores.assessmentId`, `cultureFitDNAProfiles.assessmentId`

## `cultureFitDNAProfiles`

PostgreSQL: `culture_fit_dna_profiles` · 16 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| recruiterId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| organizationId | UUID | FK → `organizations.id` (SET NULL) |
| assessmentId | UUID | FK → `cultureFitAssessments.id` (CASCADE) |
| strands | JSONB | — |
| dominantTraits | JSONB | — |
| culturalGenome | JSONB | — |
| uniquenessScore | INTEGER | — |
| matchPattern | TEXT | — |
| personalitySummary | TEXT | — |
| workEnvironmentFit | JSONB | — |
| leadershipStyle | JSONB | — |
| motivationDrivers | JSONB | — |
| blindSpots | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `cultureFitInterviewerScores`

PostgreSQL: `culture_fit_interviewer_scores` · 14 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| recruiterId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| organizationId | UUID | FK → `organizations.id` (SET NULL) |
| assessmentId | UUID | FK → `cultureFitAssessments.id` (CASCADE) |
| interviewDate | TIMESTAMP | — |
| dimensionScores | JSONB | — |
| overallScore | INTEGER | — |
| overallImpression | TEXT | — |
| notes | TEXT | — |
| strengths | JSONB | — |
| concerns | JSONB | — |
| aggregationResult | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `cultureFitTeamProfiles`

PostgreSQL: `culture_fit_team_profiles` · 12 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| recruiterId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| organizationId | UUID | FK → `organizations.id` (SET NULL) |
| templateId | UUID | FK → `cultureFitTemplates.id` (SET NULL) |
| workStyle | TEXT | — |
| communicationStyle | TEXT | — |
| values | TEXT | — |
| strengths | JSONB | — |
| preferences | JSONB | — |
| cultureScores | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `cultureFitTemplates`

PostgreSQL: `culture_fit_templates` · 13 columns · 2 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| recruiterId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| organizationId | UUID | FK → `organizations.id` (SET NULL) |
| description | TEXT | — |
| culture | TEXT | NOT NULL |
| values | TEXT | — |
| teamDynamics | TEXT | — |
| dimensionWeights | JSONB | — |
| customDimensions | JSONB | — |
| isDefault | BOOLEAN | — |
| usageCount | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `cultureFitTeamProfiles.templateId`

## `screeningActivityLog`

PostgreSQL: `screening_activity_log` · 5 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| screeningJobId | UUID | NOT NULL, FK → `screeningJobs.id` (CASCADE) |
| userId | UUID | FK → `users.id` (SET NULL) |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

## `screeningAgentResults`

PostgreSQL: `screening_agent_results` · 14 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| screeningJobId | UUID | NOT NULL, FK → `screeningJobs.id` (CASCADE) |
| screeningCandidateId | UUID | NOT NULL, FK → `screeningCandidates.id` (CASCADE) |
| screeningEvaluationId | UUID | FK → `screeningEvaluations.id` (CASCADE) |
| score | REAL | — |
| confidence | REAL | — |
| breakdown | JSONB | — |
| flags | JSONB | — |
| reasoning | TEXT | — |
| metadata | JSONB | — |
| durationMs | INTEGER | — |
| errorMessage | TEXT | — |
| aiTokensUsed | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |

## `screeningBotCampaigns`

PostgreSQL: `screening_bot_campaigns` · 16 columns · 3 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| templateId | UUID | FK → `screeningBotTemplates.id` (SET NULL) |
| qualifyingCriteria | JSONB | — |
| candidates | JSONB | — |
| totalInvited | INTEGER | — |
| totalCompleted | INTEGER | — |
| totalShortlisted | INTEGER | — |
| avgScore | REAL | — |
| completionRate | REAL | — |
| selfServiceExpiry | TIMESTAMP | — |
| welcomeMessage | TEXT | — |
| reminderEnabled | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `screeningBotSelfServiceLinks.campaignId`

## `screeningBotPlaybooks`

PostgreSQL: `screening_bot_playbooks` · 12 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| description | TEXT | — |
| stages | JSONB | — |
| totalStages | INTEGER | — |
| requireSequential | BOOLEAN | — |
| autoAdvance | BOOLEAN | — |
| autoRejectThreshold | INTEGER | — |
| usageCount | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `screeningBotQuestionBanks`

PostgreSQL: `screening_bot_question_banks` · 8 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| questions | JSONB | — |
| isPublic | BOOLEAN | — |
| usageCount | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `screeningBotSelfServiceLinks`

PostgreSQL: `screening_bot_self_service_links` · 12 columns · 4 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| templateId | UUID | FK → `screeningBotTemplates.id` (SET NULL) |
| campaignId | UUID | FK → `screeningBotCampaigns.id` (SET NULL) |
| qualifyingCriteria | JSONB | — |
| welcomeMessage | TEXT | — |
| maxUses | INTEGER | — |
| usedCount | INTEGER | — |
| isActive | BOOLEAN | — |
| expiresAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

## `screeningBotSessions`

PostgreSQL: `screening_bot_sessions` · 23 columns · 4 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| recruiterId | UUID | FK → `users.id` (SET NULL) |
| templateId | UUID | FK → `screeningBotTemplates.id` (SET NULL) |
| screeningJobId | UUID | FK → `screeningJobs.id` (SET NULL) |
| messages | JSONB | — |
| qualifyingCriteria | JSONB | — |
| knockoutResults | JSONB | — |
| scoreTotal | REAL | — |
| scoreBreakdown | JSONB | — |
| summary | TEXT | — |
| aiReasoning | TEXT | — |
| sentimentAnalysis | JSONB | — |
| redFlags | JSONB | — |
| greenFlags | JSONB | — |
| duration | INTEGER | — |
| questionCount | INTEGER | — |
| tags | JSONB | — |
| notes | TEXT | — |
| followUpScheduled | BOOLEAN | — |
| followUpDate | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| completedAt | TIMESTAMP | — |

## `screeningBotTemplates`

PostgreSQL: `screening_bot_templates` · 18 columns · 2 FK out · 3 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| description | TEXT | — |
| qualifyingCriteria | JSONB | — |
| knockoutQuestions | JSONB | — |
| questionBank | JSONB | — |
| scoringWeights | JSONB | — |
| maxQuestions | INTEGER | — |
| timeoutMinutes | INTEGER | — |
| welcomeMessage | TEXT | — |
| completionMessage | TEXT | — |
| isPublic | BOOLEAN | — |
| usageCount | INTEGER | — |
| avgScore | REAL | — |
| passRate | REAL | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `screeningBotSessions.templateId`, `screeningBotCampaigns.templateId`, `screeningBotSelfServiceLinks.templateId`

## `screeningCandidates`

PostgreSQL: `screening_candidates` · 8 columns · 2 FK out · 3 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| screeningJobId | UUID | NOT NULL, FK → `screeningJobs.id` (CASCADE) |
| candidateId | UUID | FK → `candidates.id` (SET NULL) |
| skills | JSONB | — |
| experience | JSONB | — |
| rawCvText | TEXT | — |
| resumeUrl | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

**Referenced by:** `screeningEvaluations.screeningCandidateId`, `screeningNotes.screeningCandidateId`, `screeningAgentResults.screeningCandidateId`

## `screeningEvaluations`

PostgreSQL: `screening_evaluations` · 11 columns · 2 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| screeningJobId | UUID | NOT NULL, FK → `screeningJobs.id` (CASCADE) |
| screeningCandidateId | UUID | NOT NULL, FK → `screeningCandidates.id` (CASCADE) |
| scoreTotal | REAL | — |
| scoreBreakdown | JSONB | — |
| knockout | JSONB | — |
| flags | JSONB | — |
| rank | INTEGER | — |
| aiReasoning | TEXT | — |
| orchestrationRunId | UUID | — |
| createdAt | TIMESTAMP | NOT NULL |

**Referenced by:** `screeningAgentResults.screeningEvaluationId`

## `screeningJobs`

PostgreSQL: `screening_jobs` · 15 columns · 2 FK out · 8 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (SET NULL) |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| description | TEXT | — |
| salaryMin | INTEGER | — |
| salaryMax | INTEGER | — |
| minExperienceYears | INTEGER | — |
| maxExperienceYears | INTEGER | — |
| notes | TEXT | — |
| mustHaveSkills | JSONB | — |
| niceToHaveSkills | JSONB | — |
| knockouts | JSONB | — |
| weights | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `screeningCandidates.screeningJobId`, `screeningEvaluations.screeningJobId`, `screeningNotes.screeningJobId`, `screeningActivityLog.screeningJobId`, `screeningShareLinks.screeningJobId`, `screeningBotSessions.screeningJobId`, `screeningAgentResults.screeningJobId`, `screeningOrchestrationRuns.screeningJobId`

## `screeningNotes`

PostgreSQL: `screening_notes` · 6 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| screeningJobId | UUID | NOT NULL, FK → `screeningJobs.id` (CASCADE) |
| screeningCandidateId | UUID | FK → `screeningCandidates.id` (CASCADE) |
| userId | UUID | FK → `users.id` (SET NULL) |
| content | TEXT | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |

## `screeningOrchestrationRuns`

PostgreSQL: `screening_orchestration_runs` · 10 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| screeningJobId | UUID | NOT NULL, FK → `screeningJobs.id` (CASCADE) |
| triggeredBy | UUID | FK → `users.id` (SET NULL) |
| totalCandidates | INTEGER | — |
| completedCandidates | INTEGER | — |
| failedCandidates | INTEGER | — |
| agentConfig | JSONB | — |
| startedAt | TIMESTAMP | — |
| completedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

## `screeningShareLinks`

PostgreSQL: `screening_share_links` · 5 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| screeningJobId | UUID | NOT NULL, FK → `screeningJobs.id` (CASCADE) |
| expiresAt | TIMESTAMP | NOT NULL |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |

## `screenings`

PostgreSQL: `screenings` · 10 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| roleId | UUID | NOT NULL, FK → `roles.id` (CASCADE) |
| candidateId | UUID | NOT NULL, FK → `candidates.id` (CASCADE) |
| scoreTotal | REAL | — |
| scoreBreakdown | JSONB | — |
| knockout | JSONB | — |
| flags | JSONB | — |
| rank | INTEGER | — |
| aiReasoning | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

---
← Back to [[13-raw/data/erd/index|ERD Index]]