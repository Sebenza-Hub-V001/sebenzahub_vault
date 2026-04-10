---
title: "ERD — CV & Resume"
type: reference
created: 2026-04-10
updated: 2026-04-10
tags: [database, erd, cv-and-resume]
status: active
---

# ERD — CV & Resume

**5 tables** · **6 FK relationships** — CV management, style presets, versioning, and cover letters.

← Back to [[13-raw/data/erd/index|ERD Index]]

## `coverLetters`

PostgreSQL: `cover_letters` · 20 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| content | TEXT | NOT NULL |
| jobDescription | TEXT | — |
| wordCount | INTEGER | — |
| highlights | JSONB | — |
| qualityScore | INTEGER | — |
| qualityBreakdown | JSONB | — |
| qualityFeedback | JSONB | — |
| parentId | UUID | — |
| isTemplate | BOOLEAN | — |
| timesUsed | INTEGER | — |
| lastUsedAt | TIMESTAMP | — |
| linkedApplicationId | UUID | — |
| isFavorite | BOOLEAN | — |
| tags | JSONB | — |
| version | INTEGER | — |
| versionHistory | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `cvStylePresets`

PostgreSQL: `cv_style_presets` · 5 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| isDefault | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `cvVersions`

PostgreSQL: `cv_versions` · 6 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| cvId | UUID | NOT NULL, FK → `cvs.id` (CASCADE) |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| versionNumber | INTEGER | NOT NULL |
| snapshot | JSONB | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |

## `cvs`

PostgreSQL: `cvs` · 15 columns · 1 FK out · 5 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| personalInfo | JSONB | — |
| aboutMe | TEXT | — |
| skills | JSONB | — |
| workExperience | JSONB | — |
| education | JSONB | — |
| references | JSONB | — |
| photoUrl | TEXT | — |
| resumeUrl | TEXT | — |
| hiddenFields | JSONB | — |
| isDefault | BOOLEAN | — |
| stylePresetId | UUID | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `cvVersions.cvId`, `adminCvFlags.cvId`, `adminCvNotes.cvId`, `adminCvTagAssignments.cvId`, `adminCvPoolMembers.cvId`

## `resumes`

PostgreSQL: `resumes` · 8 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| candidateId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| fileUrl | TEXT | — |
| filesizeBytes | INTEGER | — |
| parsedOk | BOOLEAN | — |
| rawText | TEXT | — |
| parsedData | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

---
← Back to [[13-raw/data/erd/index|ERD Index]]