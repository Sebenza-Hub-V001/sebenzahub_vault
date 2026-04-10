---
title: "ERD — Video"
type: reference
created: 2026-04-10
updated: 2026-04-10
tags: [database, erd, video]
status: active
---

# ERD — Video

**22 tables** · **47 FK relationships** — Video profiles, mock interviews, application intros, B-BBEE verifications.

← Back to [[13-raw/data/erd/index|ERD Index]]

## `videoApplicationIntros`

PostgreSQL: `video_application_intros` · 8 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| videoProfileId | UUID | NOT NULL, FK → `videoProfiles.id` (CASCADE) |
| jobId | UUID | NOT NULL, FK → `jobs.id` (CASCADE) |
| introVideoUrl | TEXT | — |
| introTranscript | TEXT | — |
| generatedScript | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

## `videoBbbeeVerifications`

PostgreSQL: `video_bbbee_verifications` · 8 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| videoProfileId | UUID | FK → `videoProfiles.id` (SET NULL) |
| demographicDeclaration | JSONB | — |
| transcript | TEXT | — |
| verifiedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `videoInterviewAutomations`

PostgreSQL: `video_interview_automations` · 8 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| conditions | JSONB | — |
| actions | JSONB | — |
| isActive | BOOLEAN | — |
| executionCount | INTEGER | — |
| lastExecutedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

## `videoInterviewBranding`

PostgreSQL: `video_interview_branding` · 9 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| logoUrl | TEXT | — |
| welcomeMessage | TEXT | — |
| thankYouMessage | TEXT | — |
| customCss | TEXT | — |
| showBranding | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `videoInterviewClips`

PostgreSQL: `video_interview_clips` · 14 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| videoInterviewId | UUID | NOT NULL, FK → `videoInterviews.id` (CASCADE) |
| createdBy | UUID | NOT NULL, FK → `users.id` |
| description | TEXT | — |
| startTime | REAL | NOT NULL |
| endTime | REAL | NOT NULL |
| clipUrl | TEXT | — |
| thumbnailUrl | TEXT | — |
| tags | JSONB | — |
| isHighlight | BOOLEAN | — |
| questionIndex | INTEGER | — |
| aiInsight | TEXT | — |
| viewCount | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |

## `videoInterviewDebriefs`

PostgreSQL: `video_interview_debriefs` · 16 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| videoInterviewId | UUID | NOT NULL, FK → `videoInterviews.id` (CASCADE) |
| generatedBy | UUID | NOT NULL, FK → `users.id` |
| summary | TEXT | NOT NULL |
| confidenceScore | REAL | — |
| strengthsSummary | JSONB | — |
| concernsSummary | JSONB | — |
| evaluatorConsensus | JSONB | — |
| keyMoments | JSONB | — |
| comparativeInsights | TEXT | — |
| nextSteps | JSONB | — |
| riskFactors | JSONB | — |
| cultureFitScore | REAL | — |
| technicalFitScore | REAL | — |
| leadershipFitScore | REAL | — |
| createdAt | TIMESTAMP | NOT NULL |

## `videoInterviewEvaluations`

PostgreSQL: `video_interview_evaluations` · 10 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| videoInterviewId | UUID | NOT NULL, FK → `videoInterviews.id` (CASCADE) |
| evaluatorId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| ratings | JSONB | — |
| overallScore | REAL | — |
| strengths | TEXT | — |
| concerns | TEXT | — |
| privateNotes | TEXT | — |
| submittedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

## `videoInterviewNotes`

PostgreSQL: `video_interview_notes` · 7 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| videoInterviewId | UUID | NOT NULL, FK → `videoInterviews.id` (CASCADE) |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| content | TEXT | NOT NULL |
| videoTimestamp | REAL | — |
| isPrivate | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |

## `videoInterviewPrepPackets`

PostgreSQL: `video_interview_prep_packets` · 12 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| videoInterviewId | UUID | NOT NULL, FK → `videoInterviews.id` (CASCADE) |
| generatedBy | UUID | NOT NULL, FK → `users.id` |
| candidateSummary | TEXT | — |
| roleContext | TEXT | — |
| suggestedQuestions | JSONB | — |
| redFlagsToWatch | JSONB | — |
| interviewStrategy | TEXT | — |
| timeAllocation | JSONB | — |
| evaluationFocus | JSONB | — |
| starPrompts | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

## `videoInterviewQuestionAnalytics`

PostgreSQL: `video_interview_question_analytics` · 13 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| questionText | TEXT | NOT NULL |
| timesAsked | INTEGER | — |
| avgResponseDuration | REAL | — |
| avgRetakes | REAL | — |
| avgAiScore | REAL | — |
| discriminationIndex | REAL | — |
| difficultyLevel | REAL | — |
| candidateDropoffRate | REAL | — |
| effectivenessScore | REAL | — |
| lastUsedAt | TIMESTAMP | — |
| updatedAt | TIMESTAMP | NOT NULL |

## `videoInterviewReactions`

PostgreSQL: `video_interview_reactions` · 7 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| videoInterviewId | UUID | NOT NULL, FK → `videoInterviews.id` (CASCADE) |
| userId | UUID | NOT NULL, FK → `users.id` |
| videoTimestamp | REAL | NOT NULL |
| questionIndex | INTEGER | — |
| comment | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

## `videoInterviewRooms`

PostgreSQL: `video_interview_rooms` · 13 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| videoInterviewId | UUID | FK → `videoInterviews.id` (SET NULL) |
| hostUserId | UUID | FK → `users.id` |
| participants | JSONB | — |
| scheduledAt | TIMESTAMP | — |
| startedAt | TIMESTAMP | — |
| endedAt | TIMESTAMP | — |
| duration | INTEGER | — |
| recordingEnabled | BOOLEAN | — |
| recordingUrl | TEXT | — |
| settings | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

## `videoInterviewScorecardResults`

PostgreSQL: `video_interview_scorecard_results` · 11 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| videoInterviewId | UUID | NOT NULL, FK → `videoInterviews.id` (CASCADE) |
| scorecardId | UUID | NOT NULL, FK → `videoInterviewScorecards.id` (CASCADE) |
| evaluatorId | UUID | NOT NULL, FK → `users.id` |
| scores | JSONB | — |
| weightedTotal | REAL | — |
| maxPossible | REAL | — |
| percentageScore | REAL | — |
| summary | TEXT | — |
| submittedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

## `videoInterviewScorecards`

PostgreSQL: `video_interview_scorecards` · 7 columns · 1 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| criteria | JSONB | — |
| isDefault | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `videoInterviewScorecardResults.scorecardId`

## `videoInterviewShares`

PostgreSQL: `video_interview_shares` · 7 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| videoInterviewId | UUID | NOT NULL, FK → `videoInterviews.id` (CASCADE) |
| sharedBy | UUID | NOT NULL, FK → `users.id` |
| permissions | JSONB | — |
| accessedAt | TIMESTAMP | — |
| expiresAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

## `videoInterviewTemplates`

PostgreSQL: `video_interview_templates` · 11 columns · 2 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| questions | JSONB | — |
| settings | JSONB | — |
| brandingConfig | JSONB | — |
| duration | INTEGER | — |
| isBuiltIn | BOOLEAN | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `videoInterviews.templateId`

## `videoInterviews`

PostgreSQL: `video_interviews` · 25 columns · 5 FK out · 9 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| jobId | UUID | FK → `jobs.id` (SET NULL) |
| applicationId | UUID | FK → `jobApplications.id` (SET NULL) |
| templateId | UUID | FK → `videoInterviewTemplates.id` (SET NULL) |
| questions | JSONB | — |
| recordingUrl | TEXT | — |
| transcription | TEXT | — |
| aiAnalysis | JSONB | — |
| aiScore | REAL | — |
| duration | INTEGER | — |
| deadline | TIMESTAMP | — |
| maxRetakes | INTEGER | — |
| timeLimitPerQuestion | INTEGER | — |
| introMessage | TEXT | — |
| evaluatorIds | JSONB | — |
| responseVideos | JSONB | — |
| tags | JSONB | — |
| inviteSentAt | TIMESTAMP | — |
| reminderSentAt | TIMESTAMP | — |
| expiresAt | TIMESTAMP | — |
| scheduledAt | TIMESTAMP | — |
| completedAt | TIMESTAMP | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |

**Referenced by:** `videoInterviewEvaluations.videoInterviewId`, `videoInterviewNotes.videoInterviewId`, `videoInterviewRooms.videoInterviewId`, `videoInterviewClips.videoInterviewId`, `videoInterviewScorecardResults.videoInterviewId`, `videoInterviewShares.videoInterviewId`, `videoInterviewReactions.videoInterviewId`, `videoInterviewDebriefs.videoInterviewId` +1 more

## `videoMockInterviews`

PostgreSQL: `video_mock_interviews` · 10 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| jobId | UUID | FK → `jobs.id` (SET NULL) |
| questionsAsked | JSONB | — |
| responses | JSONB | — |
| overallReport | JSONB | — |
| currentRound | INTEGER | — |
| totalRounds | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `videoProfileReviews`

PostgreSQL: `video_profile_reviews` · 8 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| videoProfileId | UUID | NOT NULL, FK → `videoProfiles.id` (CASCADE) |
| recruiterId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| rating | INTEGER | — |
| notes | TEXT | — |
| isBookmarked | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `videoProfileViews`

PostgreSQL: `video_profile_views` · 7 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| videoProfileId | UUID | NOT NULL, FK → `videoProfiles.id` (CASCADE) |
| viewerId | UUID | FK → `users.id` (SET NULL) |
| watchDuration | INTEGER | — |
| totalDuration | INTEGER | — |
| completionPercent | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |

## `videoProfiles`

PostgreSQL: `video_profiles` · 24 columns · 1 FK out · 5 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| videoUrl | TEXT | — |
| thumbnailUrl | TEXT | — |
| duration | INTEGER | — |
| transcript | TEXT | — |
| aiAnalysis | JSONB | — |
| isPrimary | BOOLEAN | — |
| isVisibleToRecruiters | BOOLEAN | — |
| fileSize | INTEGER | — |
| captions | JSONB | — |
| chapters | JSONB | — |
| trimStart | INTEGER | — |
| trimEnd | INTEGER | — |
| tags | JSONB | — |
| scriptContent | TEXT | — |
| viewCount | INTEGER | — |
| previousAnalysis | JSONB | — |
| highlights | JSONB | — |
| translatedCaptions | JSONB | — |
| portfolioOrder | INTEGER | — |
| bbbeeVerified | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `videoProfileViews.videoProfileId`, `videoProfileReviews.videoProfileId`, `videoRequests.responseVideoProfileId`, `videoApplicationIntros.videoProfileId`, `videoBbbeeVerifications.videoProfileId`

## `videoRequests`

PostgreSQL: `video_requests` · 11 columns · 4 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| recruiterId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| candidateId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| jobId | UUID | FK → `jobs.id` (SET NULL) |
| questions | JSONB | — |
| responseVideoProfileId | UUID | FK → `videoProfiles.id` (SET NULL) |
| message | TEXT | — |
| dueDate | TIMESTAMP | — |
| completedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

---
← Back to [[13-raw/data/erd/index|ERD Index]]