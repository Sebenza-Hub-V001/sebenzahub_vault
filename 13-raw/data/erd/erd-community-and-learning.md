---
title: "ERD — Community & Learning"
type: reference
created: 2026-04-10
updated: 2026-04-10
tags: [database, erd, community-and-learning]
status: active
---

# ERD — Community & Learning

**28 tables** · **41 FK relationships** — Community posts, mentorship, skill verification, learning resources.

← Back to [[13-raw/data/erd/index|ERD Index]]

## `communityBadges`

PostgreSQL: `community_badges` · 4 columns · 0 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | NOT NULL |
| criteria | JSONB | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |

**Referenced by:** `communityUserBadges.badgeId`

## `communityBookmarks`

PostgreSQL: `community_bookmarks` · 4 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| postId | UUID | NOT NULL, FK → `communityPosts.id` (CASCADE) |
| createdAt | TIMESTAMP | NOT NULL |

## `communityChallengeEntries`

PostgreSQL: `community_challenge_entries` · 5 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| challengeId | UUID | NOT NULL, FK → `communityChallenges.id` (CASCADE) |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| postId | UUID | FK → `communityPosts.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |

## `communityChallenges`

PostgreSQL: `community_challenges` · 7 columns · 0 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | NOT NULL |
| startsAt | TIMESTAMP | NOT NULL |
| endsAt | TIMESTAMP | NOT NULL |
| bonusPoints | INTEGER | — |
| participantCount | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |

**Referenced by:** `communityChallengeEntries.challengeId`

## `communityComments`

PostgreSQL: `community_comments` · 7 columns · 2 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| postId | UUID | NOT NULL, FK → `communityPosts.id` (CASCADE) |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| body | TEXT | NOT NULL |
| parentId | UUID | — |
| upvotes | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |

**Referenced by:** `communityReports.commentId`

## `communityInterviewExperiences`

PostgreSQL: `community_interview_experiences` · 11 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| difficulty | INTEGER | — |
| stages | JSONB | — |
| questionsAsked | JSONB | — |
| tips | TEXT | — |
| overallExperience | TEXT | — |
| rating | INTEGER | — |
| isAnonymous | BOOLEAN | — |
| upvotes | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |

## `communityMentorProfiles`

PostgreSQL: `community_mentor_profiles` · 13 columns · 1 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, UNIQUE, FK → `users.id` (CASCADE) |
| bio | TEXT | — |
| industries | JSONB | — |
| expertise | JSONB | — |
| yearsExperience | INTEGER | — |
| maxMentees | INTEGER | — |
| currentMentees | INTEGER | — |
| isAvailable | BOOLEAN | — |
| totalSessions | INTEGER | — |
| avgRating | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `communityMentorRequests.mentorId`

## `communityMentorRequests`

PostgreSQL: `community_mentor_requests` · 7 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| mentorId | UUID | NOT NULL, FK → `communityMentorProfiles.id` (CASCADE) |
| menteeId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| message | TEXT | — |
| goals | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `communityPollVotes`

PostgreSQL: `community_poll_votes` · 5 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| pollId | UUID | NOT NULL, FK → `communityPolls.id` (CASCADE) |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| optionIndex | INTEGER | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |

## `communityPolls`

PostgreSQL: `community_polls` · 6 columns · 1 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| postId | UUID | NOT NULL, FK → `communityPosts.id` (CASCADE) |
| options | JSONB | NOT NULL |
| voteCounts | JSONB | — |
| endsAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

**Referenced by:** `communityPollVotes.pollId`

## `communityPostViews`

PostgreSQL: `community_post_views` · 4 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| postId | UUID | NOT NULL, FK → `communityPosts.id` (CASCADE) |
| viewedAt | TIMESTAMP | NOT NULL |

## `communityPosts`

PostgreSQL: `community_posts` · 12 columns · 1 FK out · 7 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| body | TEXT | NOT NULL |
| tags | JSONB | — |
| upvotes | INTEGER | — |
| commentCount | INTEGER | — |
| isPinned | BOOLEAN | — |
| isAnonymous | BOOLEAN | — |
| metadata | JSONB | — |
| aiSummary | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `communityComments.postId`, `communityBookmarks.postId`, `communityReactions.postId`, `communityPostViews.postId`, `communityPolls.postId`, `communityReports.postId`, `communityChallengeEntries.postId`

## `communityReactions`

PostgreSQL: `community_reactions` · 4 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| postId | UUID | NOT NULL, FK → `communityPosts.id` (CASCADE) |
| createdAt | TIMESTAMP | NOT NULL |

## `communityReports`

PostgreSQL: `community_reports` · 6 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| reporterId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| postId | UUID | FK → `communityPosts.id` (CASCADE) |
| commentId | UUID | FK → `communityComments.id` (CASCADE) |
| details | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

## `communityUserBadges`

PostgreSQL: `community_user_badges` · 4 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| badgeId | UUID | NOT NULL, FK → `communityBadges.id` (CASCADE) |
| awardedAt | TIMESTAMP | NOT NULL |

## `learningEnrollments`

PostgreSQL: `learning_enrollments` · 7 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| resourceId | UUID | NOT NULL, FK → `learningResources.id` (CASCADE) |
| progress | INTEGER | — |
| completedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `learningResources`

PostgreSQL: `learning_resources` · 7 columns · 0 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| url | TEXT | — |
| skillTags | JSONB | — |
| rating | REAL | — |
| description | TEXT | — |
| isActive | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |

**Referenced by:** `learningEnrollments.resourceId`

## `salaryNegotiations`

PostgreSQL: `salary_negotiations` · 8 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| targetSalary | INTEGER | — |
| currentSalary | INTEGER | — |
| messages | JSONB | — |
| aiSuggestions | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `skillBattleRecords`

PostgreSQL: `skill_battle_records` · 13 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| questionsCount | INTEGER | NOT NULL |
| correctCount | INTEGER | NOT NULL |
| totalPoints | INTEGER | NOT NULL |
| maxPoints | INTEGER | NOT NULL |
| timeTakenSeconds | INTEGER | — |
| avgTimePerQuestion | REAL | — |
| streak | INTEGER | NOT NULL |
| xpEarned | INTEGER | NOT NULL |
| accuracy | REAL | — |
| battleData | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

## `skillChallengeAttempts`

PostgreSQL: `skill_challenge_attempts` · 10 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| challengeId | UUID | NOT NULL, FK → `skillChallenges.id` (CASCADE) |
| skillVerificationId | UUID | FK → `skillVerifications.id` (SET NULL) |
| score | INTEGER | NOT NULL |
| passed | BOOLEAN | NOT NULL |
| timeTakenSeconds | INTEGER | — |
| answers | JSONB | — |
| startedAt | TIMESTAMP | NOT NULL |
| completedAt | TIMESTAMP | NOT NULL |

## `skillChallenges`

PostgreSQL: `skill_challenges` · 6 columns · 0 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| questions | JSONB | — |
| timeLimitSeconds | INTEGER | — |
| passingScore | INTEGER | — |
| isActive | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |

**Referenced by:** `skillChallengeAttempts.challengeId`

## `skillEndorsements`

PostgreSQL: `skill_endorsements` · 5 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| candidateId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| endorserId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| message | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

## `skillInterviewPrep`

PostgreSQL: `skill_interview_prep` · 10 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| skillVerificationId | UUID | FK → `skillVerifications.id` (SET NULL) |
| questions | JSONB | — |
| practiceSessions | JSONB | — |
| readinessScore | INTEGER | — |
| lastPracticedAt | TIMESTAMP | — |
| totalSessions | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `skillProjects`

PostgreSQL: `skill_projects` · 6 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| description | TEXT | — |
| skillIds | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `skillVerificationRequests`

PostgreSQL: `skill_verification_requests` · 8 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| skillVerificationId | UUID | NOT NULL, FK → `skillVerifications.id` (CASCADE) |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| message | TEXT | — |
| verifierResponse | TEXT | — |
| expiresAt | TIMESTAMP | NOT NULL |
| respondedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

## `skillVerifications`

PostgreSQL: `skill_verifications` · 19 columns · 1 FK out · 4 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| credentialUrl | TEXT | — |
| verifiedAt | TIMESTAMP | — |
| expiresAt | TIMESTAMP | — |
| badgeUrl | TEXT | — |
| yearsExperience | INTEGER | — |
| isHotSkill | BOOLEAN | — |
| linkedCredentialId | INTEGER | — |
| lastUsedAt | TIMESTAMP | — |
| lastRefreshedAt | TIMESTAMP | — |
| challengeVerified | BOOLEAN | — |
| challengeScore | INTEGER | — |
| challengeCompletedAt | TIMESTAMP | — |
| evidenceUrl | TEXT | — |
| evidenceMetadata | JSONB | — |
| autoVerified | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `skillVerificationRequests.skillVerificationId`, `skillChallengeAttempts.skillVerificationId`, `skillVideoProofs.skillVerificationId`, `skillInterviewPrep.skillVerificationId`

## `skillVideoProofs`

PostgreSQL: `skill_video_proofs` · 12 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| skillVerificationId | UUID | FK → `skillVerifications.id` (SET NULL) |
| videoUrl | TEXT | NOT NULL |
| thumbnailUrl | TEXT | — |
| description | TEXT | — |
| durationSeconds | INTEGER | — |
| viewCount | INTEGER | — |
| isPublic | BOOLEAN | — |
| aiSummary | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `skills`

PostgreSQL: `skills` · 2 columns · 0 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| createdAt | TIMESTAMP | NOT NULL |

**Referenced by:** `candidateSkills.skillId`

---
← Back to [[13-raw/data/erd/index|ERD Index]]