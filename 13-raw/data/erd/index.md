---
title: "Database ERD — Entity Relationship Diagram"
type: reference
created: 2026-04-10
updated: 2026-04-10
tags: [database, erd, schema, architecture, postgresql, drizzle]
sources: [repo-audit-2026-04-07]
status: active
confidence: high
---

# Database ERD — Entity Relationship Diagram

Complete schema map for Sebenza Hub's PostgreSQL database, managed via Drizzle ORM.
Split into per-domain files for Obsidian performance.

## At a Glance

| Metric | Value |
|--------|-------|
| Total tables | **794** |
| Foreign key relationships | **1208** |
| Domains | **29** |
| Total columns (approx.) | **8429** |
| ORM | Drizzle (pgTable) |
| Database | PostgreSQL (Neon) |

## Hub Tables (Most Connected)

| Table | Incoming FKs | Role |
|-------|-------------|------|
| `users` | 461 | Central user record — every domain references this |
| `organizations` | 333 | Multi-tenant org anchor |
| `jobs` | 56 | Job listings — core recruitment pipeline |
| `jobApplications` | 26 | Application records linking users to jobs |
| `candidates` | 22 | Candidate profiles for screening and CRM |
| `videoInterviews` | 9 | Video interview sessions |
| `offers` | 10 | Offer management and negotiations |
| `competencyTests` | 8 | Assessment test definitions |
| `corporateClients` | 8 | Recruiter corporate client records |
| `plans` | 9 | 18 subscription plans |

## Dependency Pyramid

```
                    ┌─────────────────────┐
                    │  users (461 refs)    │
                    │  organizations (333) │
                    └──────────┬──────────┘
                               │
              ┌─────────────────┼─────────────────┐
              ▼                 ▼                 ▼
        ┌──────────┐    ┌──────────────┐   ┌──────────┐
        │ jobs (56)│    │candidates(22)│   │plans (9) │
        └────┬─────┘    └──────────────┘   └──────────┘
             ▼
    ┌──────────────────┐
    │jobApplications(26)│
    └────────┬─────────┘
             ▼
     offers · placements · screenings · interviews
```

## Cross-Domain Relationships

| Link | Foreign Keys |
|------|-------------|
| **Jobs → Core** | `jobs.organizationId` → `organizations.id`, `jobs.createdBy` → `users.id` |
| **Pipeline → Jobs** | `offers.applicationId` → `jobApplications.id` |
| **Billing → Core** | `subscriptions.organizationId` → `organizations.id` |
| **WhatsApp → Assessments** | `whatsappAssessmentSessions.testId` → `competencyTests.id` |
| **Screening → Candidates** | `screeningCandidates.candidateId` → `candidates.id` |
| **CRM → Candidates** | `talentCrmContacts.candidateId` → `candidates.id` |
| **Messaging → Jobs** | `conversations.applicationId` → `jobApplications.id` |
| **Background → Jobs** | `backgroundChecks.applicationId` → `jobApplications.id` |

## Domains

| Domain | Tables | FKs | Detail |
|--------|--------|-----|--------|
| AI Platform | 59 | 76 | [[13-raw/data/erd/erd-ai-platform|Detail →]] |
| Assessments & Testing | 17 | 25 | [[13-raw/data/erd/erd-assessments-and-testing|Detail →]] |
| Automation | 12 | 20 | [[13-raw/data/erd/erd-automation|Detail →]] |
| Background Checks | 15 | 34 | [[13-raw/data/erd/erd-background-checks|Detail →]] |
| Billing & Subscriptions | 48 | 39 | [[13-raw/data/erd/erd-billing-and-subscriptions|Detail →]] |
| CV & Resume | 5 | 6 | [[13-raw/data/erd/erd-cv-and-resume|Detail →]] |
| Candidates | 4 | 9 | [[13-raw/data/erd/erd-candidates|Detail →]] |
| Client Management | 14 | 10 | [[13-raw/data/erd/erd-client-management|Detail →]] |
| Community & Learning | 28 | 41 | [[13-raw/data/erd/erd-community-and-learning|Detail →]] |
| Compliance (POPIA/B-BBEE/EE) | 54 | 98 | [[13-raw/data/erd/erd-compliance-popia-b-bbee-ee|Detail →]] |
| Core & Auth | 21 | 24 | [[13-raw/data/erd/erd-core-and-auth|Detail →]] |
| Data Migration | 14 | 10 | [[13-raw/data/erd/erd-data-migration|Detail →]] |
| Fraud & Security | 30 | 16 | [[13-raw/data/erd/erd-fraud-and-security|Detail →]] |
| Interviews & Scheduling | 18 | 38 | [[13-raw/data/erd/erd-interviews-and-scheduling|Detail →]] |
| Jobs & Applications | 17 | 27 | [[13-raw/data/erd/erd-jobs-and-applications|Detail →]] |
| Marketing & Career Site | 51 | 71 | [[13-raw/data/erd/erd-marketing-and-career-site|Detail →]] |
| Messaging & Inbox | 47 | 82 | [[13-raw/data/erd/erd-messaging-and-inbox|Detail →]] |
| Onboarding | 6 | 17 | [[13-raw/data/erd/erd-onboarding|Detail →]] |
| Other | 140 | 213 | [[13-raw/data/erd/erd-other|Detail →]] |
| Pipeline & Offers | 26 | 55 | [[13-raw/data/erd/erd-pipeline-and-offers|Detail →]] |
| RBAC & Audit | 11 | 32 | [[13-raw/data/erd/erd-rbac-and-audit|Detail →]] |
| Recruiter KPIs | 11 | 9 | [[13-raw/data/erd/erd-recruiter-kpis|Detail →]] |
| Referrals & References | 4 | 10 | [[13-raw/data/erd/erd-referrals-and-references|Detail →]] |
| Screening | 20 | 50 | [[13-raw/data/erd/erd-screening|Detail →]] |
| Talent CRM | 26 | 63 | [[13-raw/data/erd/erd-talent-crm|Detail →]] |
| User Profiles | 10 | 11 | [[13-raw/data/erd/erd-user-profiles|Detail →]] |
| Video | 22 | 47 | [[13-raw/data/erd/erd-video|Detail →]] |
| WhatsApp | 49 | 48 | [[13-raw/data/erd/erd-whatsapp|Detail →]] |
| White Label | 15 | 27 | [[13-raw/data/erd/erd-white-label|Detail →]] |

## References

- [[01-entities/sebenza-hub]] — Platform overview
- [[02-concepts/tech-stack]] — Technology stack
- [[09-sources/database-erd-2026-04-10]] — Source summary
- [[09-sources/repo-audit-2026-04-07]] — Original codebase audit