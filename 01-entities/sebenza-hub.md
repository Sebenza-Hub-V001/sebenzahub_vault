---
title: "Sebenza Hub"
type: entity
created: 2026-04-07
updated: 2026-04-10
tags: [platform, product, saas, recruitment]
sources: [repo-audit-2026-04-07, database-erd-2026-04-10]
status: active
confidence: high
---

# Sebenza Hub

Sebenza Hub is a **multi-sided recruitment and career SaaS platform** targeting the South African employment market. It connects job seekers, recruitment agencies, employers, and platform administrators through a single web application.

**Production URL:** `sebenzahub.co.za`
**Staging URL:** `sebenzahubclaudev2-staging.up.railway.app`

## What It Does

Sebenza Hub is three products in one:

1. **Job board + career platform** for Individuals (job seekers)
2. **Recruitment ATS + CRM** for Recruiters (talent agencies)
3. **HR hiring suite** for Businesses (employers)

All three are unified under one platform, with an Admin layer that governs the whole system.

## Tech Stack

See [[02-concepts/tech-stack]] for full details.

| Layer | Technology |
|-------|-----------|
| Frontend | React 18 + TypeScript + Vite |
| Backend | Express.js (Node.js) |
| Database | PostgreSQL (Neon serverless) |
| ORM | Drizzle ORM |
| UI | Radix UI + Tailwind CSS |
| Auth | Passwordless magic link (Resend) |
| AI | OpenAI + Anthropic Claude + Google Gemini |
| Storage | Cloudflare R2 |
| Queue | BullMQ (Redis) |
| Hosting | Railway |
| Routing | wouter (frontend), Express Router (backend) |
| Testing | Playwright E2E |

## Scale Metrics

| Component | Count |
|-----------|-------|
| Database tables | 794 (29 domains, 1208 FK relationships) |
| API endpoints | 3,586 |
| Frontend pages | 464 |
| UI components | 496 |
| Server route files | 120 |
| E2E test suites | 66 |
| Subscription plans | 18 |
| Migration files | 28 |
| NPM dependencies | 149 |

## Four User Types

| User Type | Entity Page | Role Value |
|-----------|-------------|------------|
| Individual (Job Seeker) | [[01-entities/individual-user]] | `individual` |
| Recruiter (Talent Agency) | [[01-entities/recruiter-user]] | `recruiter` |
| Business (Employer) | [[01-entities/business-user]] | `business` |
| Admin (Platform Operator) | [[01-entities/admin-user]] | `admin` |

## Key Systems

| System | Concept Page |
|--------|-------------|
| Authentication | [[02-concepts/authentication]] |
| Role-Based Access Control | [[02-concepts/rbac]] |
| Multi-Tenancy | [[02-concepts/multi-tenancy]] |
| Application Lifecycle | [[02-concepts/application-lifecycle]] |
| AI Features | [[02-concepts/ai-features]] |
| Compliance | [[02-concepts/compliance]] |
| Billing | [[02-concepts/billing-system]] |
| WhatsApp Integration | [[02-concepts/whatsapp-integration]] |
| SEO Strategy | [[02-concepts/seo-strategy]] |

## External Integrations

| Integration | Purpose |
|-------------|---------|
| Resend | Email delivery (magic links, notifications) |
| Cloudflare R2 | File/document storage (CVs, logos) |
| OpenAI | AI matching, generation, analysis |
| Anthropic Claude | AI features |
| Google Gemini | AI features |
| Adzuna API | Job aggregation |
| CareerJet API | Job aggregation |
| LinkedIn | Lead import, profile verification |
| WhatsApp Business API | Messaging, chatbots, apply-via-WhatsApp |
| Slack | Webhook notifications |
| Apify | Web scraping |
| Peach Payments | Payment processing (SA) |

## South African Focus

- B-BBEE (Black Economic Empowerment) compliance tracking
- POPIA (Protection of Personal Information Act) consent management
- Employment Equity data capture for statutory reporting
- ZAR currency, SA provinces, SA cities
- WhatsApp-first communication strategy
- SETA learnership integration

## Repository

- **Location:** `C:\Users\User\Desktop\Sebenza_Hub_Claude\Sebenza_Hub_Claude_V2`
- **Branch:** `claude/build-sebenza-hub-website-559Nz` (deploys to production)
- **Structure:** Monorepo with `client/`, `server/`, `shared/` directories

## References

- [[06-comparisons/user-type-comparison]] — Feature matrix across all user types
- [[02-concepts/tech-stack]] — Full technology details
- [[01-entities/whatsapp-bot]] — WhatsApp bot entity
- [[01-entities/job-aggregation]] — Job aggregation (Adzuna, CareerJet)
- [[02-concepts/seo-strategy]] — SEO strategy and implementation
- Source: [[09-sources/repo-audit-2026-04-07]]
- Source: [[09-sources/features-inventory-2026-04-07]]
- Source: [[09-sources/database-erd-2026-04-10]]
