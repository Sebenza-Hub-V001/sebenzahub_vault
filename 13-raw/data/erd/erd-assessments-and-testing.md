---
title: "ERD — Assessments & Testing"
type: reference
created: 2026-04-10
updated: 2026-04-10
tags: [database, erd, assessments-and-testing]
status: active
---

# ERD — Assessments & Testing

**17 tables** · **25 FK relationships** — Competency tests, question banks, attempts, invitations, templates.

← Back to [[13-raw/data/erd/index|ERD Index]]

## `assessmentBenchmarks`

PostgreSQL: `assessment_benchmarks` · 3 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | SERIAL | PK |
| score | INTEGER | NOT NULL |
| recordedAt | TIMESTAMP | NOT NULL |

## `assessmentBundleItems`

PostgreSQL: `assessment_bundle_items` · 11 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | SERIAL | PK |
| bundleId | UUID | NOT NULL, FK → `assessmentBundles.id` (CASCADE) |
| templateId | INTEGER | FK → `testLibraryTemplates.id` |
| testId | UUID | FK → `competencyTests.id` |
| stageNumber | INTEGER | NOT NULL |
| weight | INTEGER | — |
| isRequired | BOOLEAN | — |
| isEliminatory | BOOLEAN | — |
| minimumScore | INTEGER | — |
| sortOrder | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |

## `assessmentBundles`

PostgreSQL: `assessment_bundles` · 10 columns · 1 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| organizationId | UUID | NOT NULL |
| createdBy | UUID | NOT NULL, FK → `users.id` |
| estimatedTotalMinutes | INTEGER | — |
| minimumPassingScore | INTEGER | — |
| isPublic | BOOLEAN | — |
| usageCount | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `assessmentBundleItems.bundleId`

## `assessmentInvitations`

PostgreSQL: `assessment_invitations` · 10 columns · 4 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| testId | UUID | NOT NULL, FK → `competencyTests.id` (CASCADE) |
| jobId | UUID | FK → `jobs.id` (SET NULL) |
| deadline | TIMESTAMP | — |
| sentAt | TIMESTAMP | — |
| openedAt | TIMESTAMP | — |
| completedAt | TIMESTAMP | — |
| attemptId | UUID | FK → `testAttempts.id` (SET NULL) |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |

**Referenced by:** `aiInterviewSessions.invitationId`

## `competencyTests`

PostgreSQL: `competency_tests` · 17 columns · 2 FK out · 8 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (SET NULL) |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| description | TEXT | — |
| durationMinutes | INTEGER | — |
| passingScore | REAL | — |
| antiCheatConfig | JSONB | — |
| tags | JSONB | — |
| deadline | TIMESTAMP | — |
| templateId | UUID | — |
| totalInvitations | INTEGER | — |
| completedAttempts | INTEGER | — |
| libraryTemplateId | INTEGER | — |
| isSaRecommended | BOOLEAN | — |
| isFromLibrary | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `testSections.testId`, `testAttempts.testId`, `assessmentInvitations.testId`, `testLibraryUsage.testId`, `aiInterviewSessions.testId`, `whatsappConversations.currentTestId`, `whatsappAssessmentSessions.testId`, `assessmentBundleItems.testId`

## `customTemplates`

PostgreSQL: `custom_templates` · 14 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| createdBy | UUID | NOT NULL |
| organizationId | UUID | — |
| description | TEXT | — |
| durationMinutes | INTEGER | — |
| questionCount | INTEGER | — |
| tags | JSONB | — |
| questions | JSONB | — |
| version | INTEGER | — |
| isActive | BOOLEAN | — |
| cloneCount | INTEGER | — |
| lastUsedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `testAttempts`

PostgreSQL: `test_attempts` · 15 columns · 1 FK out · 4 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| testId | UUID | NOT NULL, FK → `competencyTests.id` (CASCADE) |
| candidateId | UUID | — |
| overallScore | REAL | — |
| maxScore | REAL | — |
| fraudScore | REAL | — |
| fullscreenExits | INTEGER | — |
| tabSwitches | INTEGER | — |
| copyPasteAttempts | INTEGER | — |
| saPercentile | INTEGER | — |
| integrityScore | INTEGER | — |
| questionTimeData | JSONB | — |
| startedAt | TIMESTAMP | NOT NULL |
| completedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

**Referenced by:** `testResponses.attemptId`, `assessmentInvitations.attemptId`, `candidateCredentials.attemptId`, `whatsappAssessmentSessions.attemptId`

## `testItems`

PostgreSQL: `test_items` · 9 columns · 1 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| sectionId | UUID | NOT NULL, FK → `testSections.id` (CASCADE) |
| stem | TEXT | NOT NULL |
| options | JSONB | — |
| correctAnswer | JSONB | — |
| rubric | TEXT | — |
| points | REAL | — |
| order | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |

**Referenced by:** `testResponses.itemId`

## `testLibraryFavorites`

PostgreSQL: `test_library_favorites` · 5 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | SERIAL | PK |
| templateId | INTEGER | NOT NULL, FK → `testLibraryTemplates.id` (CASCADE) |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| notes | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

## `testLibraryQuestions`

PostgreSQL: `test_library_questions` · 12 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | SERIAL | PK |
| templateId | INTEGER | NOT NULL, FK → `testLibraryTemplates.id` (CASCADE) |
| stem | TEXT | NOT NULL |
| options | JSONB | — |
| correctAnswer | TEXT | — |
| explanation | TEXT | — |
| rubric | TEXT | — |
| points | INTEGER | — |
| codeStarterCode | TEXT | — |
| isPersonality | BOOLEAN | — |
| sortOrder | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |

## `testLibraryRatings`

PostgreSQL: `test_library_ratings` · 11 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | SERIAL | PK |
| templateId | INTEGER | NOT NULL, FK → `testLibraryTemplates.id` (CASCADE) |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| rating | INTEGER | NOT NULL |
| review | TEXT | — |
| effectiveness | INTEGER | — |
| relevance | INTEGER | — |
| wouldRecommend | BOOLEAN | — |
| helpfulCount | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `testLibraryTemplates`

PostgreSQL: `test_library_templates` · 17 columns · 0 FK out · 7 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | SERIAL | PK |
| description | TEXT | NOT NULL |
| testFocus | JSONB | NOT NULL |
| skillsFor | JSONB | — |
| durationMinutes | INTEGER | NOT NULL |
| questionCount | INTEGER | NOT NULL |
| tags | JSONB | — |
| isPopular | BOOLEAN | — |
| isFree | BOOLEAN | — |
| isNew | BOOLEAN | — |
| isSaRecommended | BOOLEAN | — |
| saIndustries | JSONB | — |
| nqfLevel | INTEGER | — |
| isActive | BOOLEAN | — |
| sortOrder | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `testLibraryQuestions.templateId`, `testLibraryUsage.templateId`, `candidateCredentials.templateId`, `testLibraryRatings.templateId`, `testLibraryFavorites.templateId`, `assessmentBundleItems.templateId`, `testLibraryViews.templateId`

## `testLibraryUsage`

PostgreSQL: `test_library_usage` · 5 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | SERIAL | PK |
| templateId | INTEGER | NOT NULL, FK → `testLibraryTemplates.id` |
| recruiterId | UUID | NOT NULL, FK → `users.id` |
| testId | UUID | NOT NULL, FK → `competencyTests.id` |
| usedAt | TIMESTAMP | NOT NULL |

## `testLibraryViews`

PostgreSQL: `test_library_views` · 4 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | SERIAL | PK |
| templateId | INTEGER | NOT NULL, FK → `testLibraryTemplates.id` (CASCADE) |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| viewedAt | TIMESTAMP | NOT NULL |

## `testResponses`

PostgreSQL: `test_responses` · 8 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| attemptId | UUID | NOT NULL, FK → `testAttempts.id` (CASCADE) |
| itemId | UUID | NOT NULL, FK → `testItems.id` (CASCADE) |
| response | JSONB | — |
| isCorrect | BOOLEAN | — |
| pointsAwarded | REAL | — |
| timeTakenSeconds | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |

## `testSections`

PostgreSQL: `test_sections` · 5 columns · 1 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| testId | UUID | NOT NULL, FK → `competencyTests.id` (CASCADE) |
| weight | REAL | — |
| order | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |

**Referenced by:** `testItems.sectionId`

## `testTemplates`

PostgreSQL: `test_templates` · 8 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| durationMinutes | INTEGER | — |
| questionCount | INTEGER | — |
| tags | JSONB | — |
| questions | JSONB | — |
| isActive | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |

---
← Back to [[13-raw/data/erd/index|ERD Index]]