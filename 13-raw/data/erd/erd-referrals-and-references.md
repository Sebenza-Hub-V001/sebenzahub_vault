---
title: "ERD — Referrals & References"
type: reference
created: 2026-04-10
updated: 2026-04-10
tags: [database, erd, referrals-and-references]
status: active
---

# ERD — Referrals & References

**4 tables** · **10 FK relationships** — Referral programmes, campaigns, reference requests and responses.

← Back to [[13-raw/data/erd/index|ERD Index]]

## `referenceRequests`

PostgreSQL: `reference_requests` · 6 columns · 2 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| recruiterId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| candidateId | UUID | FK → `candidates.id` (SET NULL) |
| sentAt | TIMESTAMP | — |
| completedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

**Referenced by:** `referenceResponses.requestId`

## `referenceResponses`

PostgreSQL: `reference_responses` · 8 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| requestId | UUID | NOT NULL, FK → `referenceRequests.id` (CASCADE) |
| ratings | JSONB | — |
| strengths | TEXT | — |
| concerns | TEXT | — |
| rawResponses | JSONB | — |
| aiSummary | TEXT | — |
| completedAt | TIMESTAMP | NOT NULL |

## `referralCampaigns`

PostgreSQL: `referral_campaigns` · 13 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| jobId | UUID | FK → `jobs.id` (SET NULL) |
| targetSkills | TEXT | — |
| bonusTiers | JSONB | — |
| defaultBonusAmount | INTEGER | — |
| targetCount | INTEGER | — |
| startsAt | TIMESTAMP | — |
| expiresAt | TIMESTAMP | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `referrals`

PostgreSQL: `referrals` · 18 columns · 4 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| jobId | UUID | FK → `jobs.id` (CASCADE) |
| referrerUserId | UUID | FK → `users.id` (SET NULL) |
| candidateLinkedin | TEXT | — |
| recommendation | TEXT | — |
| resumeUrl | TEXT | — |
| applicationId | UUID | FK → `jobApplications.id` (SET NULL) |
| bonusAmount | INTEGER | — |
| bonusPaidAt | TIMESTAMP | — |
| skills | TEXT | — |
| notes | TEXT | — |
| rating | INTEGER | — |
| interviewDate | TIMESTAMP | — |
| hiredDate | TIMESTAMP | — |
| rejectedReason | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

---
← Back to [[13-raw/data/erd/index|ERD Index]]