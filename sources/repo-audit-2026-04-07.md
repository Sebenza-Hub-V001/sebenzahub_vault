---
title: "Codebase Audit — 2026-04-07"
type: source
created: 2026-04-07
updated: 2026-04-07
tags: [source, audit, codebase, architecture]
status: active
confidence: high
---

# Codebase Audit — 2026-04-07

**Source:** Local repository at `C:\Users\User\Desktop\Sebenza_Hub_Claude\Sebenza_Hub_Claude_V2`
**Date audited:** 2026-04-07
**Method:** Full automated exploration of directory structure, routes, models, features, and auth flows.

## Summary

Sebenza Hub is a large-scale, production-deployed recruitment and career SaaS platform built for the South African market. It's a React + Express.js + PostgreSQL monorepo with deep AI integration (OpenAI, Anthropic, Google), WhatsApp Business API, and South African compliance (POPIA, B-BBEE, Employment Equity).

## Key Findings

### Scale
- **755 database tables** (Drizzle ORM + PostgreSQL/Neon)
- **3,586 API endpoints** across 120 server route files
- **464 frontend pages** with code-splitting and lazy loading
- **496 reusable UI components**
- **66 E2E test suites** (Playwright)
- **18 subscription plans**
- **149 NPM dependencies**

### Architecture
- Monorepo: `client/` (React/Vite), `server/` (Express), `shared/` (schema)
- Passwordless magic-link auth via Resend
- Organization-based multi-tenancy
- Role-based access control with 40+ granular permissions
- BullMQ job queue for async operations
- Cloudflare R2 for file storage
- Deployed on Railway with GitHub Actions CI/CD

### Four User Types
1. **Individual** — Job seeker with profile, CV management, learning hub, community
2. **Recruiter** — Talent agency with ATS, CRM, client management, AI sourcing (95 dashboard routes — largest)
3. **Business** — Employer with HR suite, workforce planning, compliance tools
4. **Admin** — Platform operator with feature flags, billing, AI monitoring, fraud detection

### AI Integration
- 383+ AI endpoints
- Three providers: OpenAI, Anthropic Claude, Google Gemini
- Powers: matching, screening, interviews, JD writing, offer prediction, bias auditing, career coaching

### South African Compliance
- POPIA consent collection and data retention
- B-BBEE level tracking (Level 1–8) for recruiters and organizations
- Employment Equity demographic data capture
- WhatsApp-first communication (dominant in SA market)
- ZAR currency, SA provinces/cities

### External Integrations
- Resend (email), Cloudflare R2 (storage), WhatsApp Business API
- Adzuna + CareerJet (job aggregation), LinkedIn (lead import)
- Slack webhooks, Apify (scraping)

## Entities Identified
- [[entities/sebenza-hub]] — The platform
- [[entities/individual-user]] — Job seeker
- [[entities/recruiter-user]] — Talent agency
- [[entities/business-user]] — Employer
- [[entities/admin-user]] — Platform operator

## Concepts Identified
- [[concepts/authentication]] — Magic link auth
- [[concepts/rbac]] — Permission system
- [[concepts/multi-tenancy]] — Organization model
- [[concepts/application-lifecycle]] — Hiring pipeline
- [[concepts/ai-features]] — AI capabilities
- [[concepts/compliance]] — POPIA, B-BBEE, EE
- [[concepts/billing-system]] — Subscriptions and credits
- [[concepts/whatsapp-integration]] — WhatsApp features
- [[concepts/tech-stack]] — Technology details

## Open Questions Raised
- How are recruiter trust tiers (bronze/silver/gold/platinum) calculated?
- What are the 18 specific subscription plans?
- How is the Recruiter–Business vendor relationship established?
- Is the `refresh_tokens` table actively used?
- What WhatsApp Business API provider is used?
- How is AI provider selection handled per feature?
