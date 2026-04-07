---
title: "Job Aggregation"
type: entity
created: 2026-04-07
updated: 2026-04-07
tags: [job-board, integration, adzuna, careerjet, aggregation]
sources: [repo-audit-2026-04-07, features-inventory-2026-04-07]
status: active
confidence: medium
user-types: [individual, admin]
---

# Job Aggregation

Sebenza Hub integrates with external job aggregation APIs to supplement its native job listings, giving Individuals access to a wider pool of opportunities.

## Providers

| Provider | API | Purpose |
|----------|-----|---------|
| **Adzuna** | Adzuna API | International job aggregator with SA coverage |
| **CareerJet** | CareerJet API | Global job search engine |

## How It Works

1. **Admin configures** job aggregator settings via `/admin/job-aggregator`
2. **External jobs** are fetched from Adzuna and CareerJet APIs
3. **Jobs are surfaced** alongside native listings in the Individual job search
4. **Recruiters can export** job listings to Adzuna/CareerJet via the `job-board-export` feature (CSV/Pnet/CJ/Adzuna export)

## Integration Points

### Inbound (Aggregator → Platform)
- External jobs displayed in Individual job search (`/dashboard/individual/all-jobs`)
- Admin manages aggregator configuration (`/admin/job-aggregator`)

### Outbound (Platform → Aggregator)
- Recruiter feature: `job-board-export` — CSV/Pnet/CJ/Adzuna export
- Recruiter page: `/dashboard/recruiter/job-board-integrations`

## Seeded Features

| Key | Name | Type | User |
|-----|------|------|------|
| `job-board-export` | CSV/Pnet/CJ/Adzuna Export | boolean | Recruiter |
| `job-board-integrations` | Job Board Integrations | boolean | Recruiter |

## Tech Stack

- External API clients in the server layer
- Listed in [[concepts/tech-stack]] under External Services
- Admin page for configuration: `/admin/job-aggregator`

## Open Questions

- What's the refresh frequency for aggregated jobs?
- Are aggregated jobs clearly marked as external vs native listings?
- Is there deduplication when the same job exists on the platform and an aggregator?
- What are the API rate limits and costs for Adzuna and CareerJet?

## References

- [[entities/sebenza-hub]] — Platform integrations
- [[entities/individual-user]] — Job search consumer
- [[entities/recruiter-user]] — Job export to boards
- [[entities/admin-user]] — Aggregator configuration
- [[concepts/tech-stack]] — External services
- Source: [[sources/repo-audit-2026-04-07]]
- Source: [[sources/features-inventory-2026-04-07]]
