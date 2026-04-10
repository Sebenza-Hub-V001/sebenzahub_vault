---
title: "Database ERD — Full Schema Map"
type: source
created: 2026-04-10
updated: 2026-04-10
tags: [source, database, erd, schema, architecture, postgresql, drizzle]
status: active
confidence: high
---

# Database ERD — Full Schema Map

**Source:** `13-raw/data/database-erd.md`
**Date produced:** 2026-04-10
**Method:** Automated extraction from Drizzle ORM schema definitions in `shared/schema.ts`

## Summary

Complete entity-relationship diagram for Sebenza Hub's PostgreSQL database (hosted on Neon). The schema contains **794 tables** across **29 domains** with **1,208 foreign key relationships** and approximately **8,429 columns**. This represents growth from the 755 tables documented in the [[09-sources/repo-audit-2026-04-07|April 7 audit]] — an increase of 39 tables in 3 days.

## Key Claims

### Scale
- **794 tables** total (up from 755 on 2026-04-07)
- **1,208 foreign key relationships** mapping cross-domain dependencies
- **~8,429 columns** across all tables
- **29 distinct domains** (up from the ~25 implied in the features inventory)

### Hub Tables (Gravitational Centre)
- `users` — 461 inbound FKs (every domain references this table)
- `organizations` — 333 inbound FKs (multi-tenant anchor)
- `jobs` — 56 inbound FKs (core recruitment pipeline)
- `jobApplications` — 26 inbound FKs (application records)
- `candidates` — 22 inbound FKs (candidate profiles)

### Domain Distribution (by table count)
| Domain | Tables | FK Relationships |
|--------|--------|-----------------|
| Other / Miscellaneous | 140 | 213 |
| AI Platform | 59 | 76 |
| Compliance (POPIA/B-BBEE/EE) | 54 | 98 |
| Marketing & Career Site | 51 | 71 |
| WhatsApp | 49 | 48 |
| Billing & Subscriptions | 48 | 39 |
| Messaging & Inbox | 47 | 82 |
| Fraud & Security | 30 | 16 |
| Community & Learning | 28 | 41 |
| Pipeline & Offers | 26 | 55 |
| Talent CRM | 26 | 63 |
| Core & Auth | 21 | 24 |
| Screening | 20 | 50 |
| Interviews & Scheduling | 18 | 38 |
| Jobs & Applications | 17 | 27 |
| Assessments & Testing | 17 | 25 |
| Video | 22 | 47 |
| Background Checks | 15 | 34 |
| White Label | 15 | 27 |
| Client Management | 14 | 10 |
| Data Migration | 14 | 10 |
| Automation | 12 | 20 |
| RBAC & Audit | 11 | 32 |
| Recruiter KPIs | 11 | 9 |
| User Profiles | 10 | 11 |
| Onboarding | 6 | 17 |
| CV & Resume | 5 | 6 |
| Candidates | 4 | 9 |
| Referrals & References | 4 | 10 |

### Heaviest Domains by FK Complexity
1. **Messaging & Inbox** — 82 FK relationships across 47 tables (most interconnected per table)
2. **Compliance** — 98 FK relationships across 54 tables (regulatory data web)
3. **AI Platform** — 76 FK relationships across 59 tables (many tables, moderate coupling)
4. **Marketing** — 71 FK relationships across 51 tables
5. **Talent CRM** — 63 FK relationships across 26 tables (high density — 2.4 FKs per table)

### SA-Specific Compliance Tables
- **POPIA:** `popiaConsents`, `popiaBreachIncidents`, `popiaComplaints`, `popiaConsentTemplates`, `popiaDataMapping`, `popiaDataProcessingAgreements`, `popiaImpactAssessments`, `popiaInformationOfficers`, `popiaRegulatoryFilings`, `popiaTrainingRecords`
- **B-BBEE:** `bbbeeScores`, `bbbeeCertificates`, `bbbeeOwnershipAnalysis`, `bbbeeSkillsPrograms`, `bbbeeSedProjects`, `bbbeeSupplierDevelopment`, `bbbeeImprovementPlans`, `bbbeeScoreHistory`, `bbbeeSectorBenchmarks`, `bbbeePlacementImpacts`, `bbbeeComplianceAlerts`, `bbbeeComplianceChecklist`, `bbbeeComplianceDeadlines`, `bbbeeDocumentVault`, `bbbeeCommitteeMeetings`, `bbbeeClientPortfolio`
- **Employment Equity:** `eeReports`, `eePlans`, `eeBarriers`, `eeAffirmativeMeasures`, `eeConsultations`, `eeIncomeDifferentials`
- **Blind Hiring:** 15 tables covering configs, reviews, calibration sessions, adverse impact analysis, fairness certificates, skills challenges, bias scans, compliance assessments, data retention policies

### Notable Architectural Patterns
- **JSONB everywhere** — Most tables use JSONB columns for flexible/extensible data (skills, config, metadata, custom fields)
- **Soft multi-tenancy** — Almost all tables carry `organizationId` FK for data isolation
- **CASCADE deletes** — Dominant FK strategy is CASCADE, with SET NULL for optional references
- **UUID primary keys** — Universal across the schema (except test library tables which use SERIAL)
- **Dual timestamp pattern** — `createdAt` + `updatedAt` on nearly every table
- **No enum columns visible** — Statuses and types likely stored as TEXT or enforced in application code

### Cross-Domain Bridges
Key FK relationships connecting domains:
- Jobs → Core: `jobs.organizationId`, `jobs.createdBy`
- Pipeline → Jobs: `offers.applicationId`, `scorecardResponses.applicationId`
- WhatsApp → Assessments: `whatsappAssessmentSessions.testId` → `competencyTests.id`
- CRM → Candidates: `talentPoolMembers.candidateId`, `talentCrmContacts.candidateId`
- Messaging → Jobs: `conversations.applicationId`, `emailSequenceExecutions.applicationId`
- Background → Jobs: `backgroundChecks.applicationId`

## Entities and Concepts Mentioned
- [[01-entities/sebenza-hub]] — Platform overview (table count needs update)
- [[02-concepts/tech-stack]] — Technology stack (table count needs update)
- [[02-concepts/billing-system]] — 48 billing tables documented here
- [[02-concepts/rbac]] — 11 RBAC tables documented here
- [[02-concepts/multi-tenancy]] — `organizations` as the multi-tenant anchor
- [[02-concepts/authentication]] — Core auth tables documented here
- [[02-concepts/application-lifecycle]] — Pipeline & Offers tables
- [[02-concepts/compliance]] — 54 compliance tables (POPIA + B-BBEE + EE)
- [[02-concepts/whatsapp-integration]] — 49 WhatsApp tables
- [[02-concepts/ai-features]] — 59 AI platform tables

## Contradictions / Updates
> ⚠️ **Update:** [[09-sources/repo-audit-2026-04-07]] reported 755 tables; this ERD shows **794 tables** (39 new tables in 3 days). The features inventory also listed 755. All references to "755 tables" should be updated.

> ⚠️ **Update:** The features inventory listed ~25 domains; this ERD identifies **29 distinct domains**. The additional granularity comes from separating out Automation, Data Migration, Onboarding, and Referrals as their own domains.

## Open Questions
- What drove the addition of 39 tables in 3 days? Likely new feature development, but the specific features are not documented.
- Several tables in the "Other" domain (140 tables) may deserve their own domain classification — this is the largest catch-all bucket.
- The `placements` and `submissions` tables have **0 FK constraints** despite having columns like `organizationId`, `jobId`, `candidateId` — are these intentionally denormalized or missing constraints?

## References
- Raw source: `13-raw/data/database-erd.md`
- Prior audit: [[09-sources/repo-audit-2026-04-07]]
- Prior inventory: [[09-sources/features-inventory-2026-04-07]]
