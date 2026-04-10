---
title: "ERD — Candidates"
type: reference
created: 2026-04-10
updated: 2026-04-10
tags: [database, erd, candidates]
status: active
---

# ERD — Candidates

**4 tables** · **9 FK relationships** — Candidate records imported by recruiters, with skills and credentials.

← Back to [[13-raw/data/erd/index|ERD Index]]

## `candidateComparisons`

PostgreSQL: `candidate_comparisons` · 11 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| jobId | UUID | FK → `jobs.id` (CASCADE) |
| applicationIds | JSONB | NOT NULL |
| notes | TEXT | — |
| weights | JSONB | — |
| decisions | JSONB | — |
| aiAnalysis | JSONB | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `candidateCredentials`

PostgreSQL: `candidate_credentials` · 13 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | SERIAL | PK |
| candidateId | UUID | NOT NULL, FK → `users.id` |
| templateId | INTEGER | NOT NULL, FK → `testLibraryTemplates.id` |
| attemptId | UUID | FK → `testAttempts.id` |
| score | INTEGER | — |
| percentile | INTEGER | — |
| passed | BOOLEAN | — |
| completedAt | TIMESTAMP | — |
| expiresAt | TIMESTAMP | — |
| isPublic | BOOLEAN | — |
| timeTakenMinutes | INTEGER | — |
| retakeCount | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |

## `candidateSkills`

PostgreSQL: `candidate_skills` · 4 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| candidateId | UUID | NOT NULL, FK → `candidates.id` (CASCADE) |
| skillId | UUID | NOT NULL, FK → `skills.id` (CASCADE) |
| createdAt | TIMESTAMP | NOT NULL |

## `candidates`

PostgreSQL: `candidates` · 8 columns · 1 FK out · 22 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (SET NULL) |
| links | JSONB | — |
| summary | TEXT | — |
| resumeUrl | TEXT | — |
| tags | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `experiences.candidateId`, `education.candidateId`, `certifications.candidateId`, `projects.candidateId`, `awards.candidateId`, `candidateSkills.candidateId`, `screeningCandidates.candidateId`, `screenings.candidateId` +14 more

---
← Back to [[13-raw/data/erd/index|ERD Index]]