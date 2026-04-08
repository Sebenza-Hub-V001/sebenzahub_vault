---
title: "Sebenza Hub — Overview"
type: overview
created: 2026-04-07
updated: 2026-04-08
tags: [overview, synthesis, platform]
status: active
confidence: high
---

# Sebenza Hub — Overview

Sebenza Hub is a **multi-sided recruitment and career platform** built for the South African employment market. It connects four distinct user types — Individuals (job seekers), Recruiters (talent agencies), Businesses (employers), and Admins (platform operators) — through a unified web application with deep AI integration, WhatsApp-first communication, and South African compliance baked in (POPIA, B-BBEE, Employment Equity).

## The Four Pillars

| User Type | Role | Core Purpose | Dashboard Pages | Journey |
|-----------|------|--------------|-----------------|---------|
| **[[01-entities/individual-user]]** | Job Seeker | Find jobs, build skills, manage career | 51 | [[03-workflows/individual-journey]] |
| **[[01-entities/recruiter-user]]** | Talent Agency | Source candidates, manage clients, earn placement fees | 101 | [[03-workflows/recruiter-journey]] |
| **[[01-entities/business-user]]** | Employer / Corporate HR | Post jobs, hire directly, manage workforce | 47 | [[03-workflows/business-journey]] |
| **[[01-entities/admin-user]]** | Platform Operator | Configure platform, monitor health, ensure compliance | 24 | [[03-workflows/admin-journey]] |

**Total: 223 dashboard pages.** See [[06-comparisons/user-type-comparison]] for a detailed side-by-side feature matrix. See [[15-dashboards/individual-dashboard|Dashboard Layouts]] for exact routes.

## How They Connect

**Individual** ↔ Job ↔ **Recruiter** · Job ↔ **Business** · **Admin** oversees all

- **Individuals** search and apply for jobs posted by Recruiters or Businesses, plus aggregated external listings from [[01-entities/job-aggregation|Adzuna and CareerJet]].
- **Recruiters** source Individuals and submit them to Business clients, earning placement fees. Their Revenue Engine (client pipeline, submissions, placements, KPIs) drives agency economics.
- **Businesses** post jobs directly and/or work with Recruiters as vendors.
- **Admins** manage the platform, configure features, monitor AI, and enforce compliance.

The key relationship triangle: Recruiters act as **intermediaries** between Individuals and Businesses. A Business can hire directly (bypassing recruiters) or through a Recruiter (who earns a fee). See [[02-concepts/application-lifecycle]] for the full flow, and [[08-questions/recruiter-business-relationship]] for open questions about the vendor relationship.

## Scale

| Component | Count |
|-----------|-------|
| Database tables | 755 |
| API endpoints | 3,586 |
| Frontend pages | 325 (routes) / 464 (inc. sub-components) |
| Reusable UI components | 496 |
| Seeded features | 157 (42 Individual + 86 Recruiter + 29 Business/Admin) |
| E2E test suites | 66 |
| Subscription plans | 18 |
| AI backend functions | 42 (across 3 providers) |
| AI API endpoints | 383+ |

## Three Products in One

### 1. Career Platform for Individuals
Not just a job board — a complete career development ecosystem. The [[03-workflows/individual-journey|Individual journey]] follows a 7-step hiring path (signup → profile → search → apply → track → interview → offer) with 4 parallel tracks: AI assistance, learning (14 features including SETA learnerships), community, and career development. Each track activates at specific moments — a rejection, a skill gap, a stalled search — and feeds back into the hiring path. 51 dashboard pages, 56+ documented features.

### 2. Recruitment ATS + CRM for Agencies
A full ATS + CRM + business intelligence suite comparable to standalone products like Bullhorn or Greenhouse. The [[03-workflows/recruiter-journey|Recruiter journey]] follows a 10-step recruitment path (signup → profile → clients → jobs → source → screen → interview → offer → place → retain) with 4 parallel tracks: communication & automation, analytics & intelligence, compliance & governance, and brand & growth. 101 dashboard pages, 95+ documented features.

### 3. HR Suite for Businesses
The growing employer segment. The [[03-workflows/business-journey|Business journey]] follows a 7-step hiring path with dual channels (direct applications + recruiter vendor submissions) and 4 parallel tracks: vendor management & active sourcing, communication & automation, compliance & governance, and workforce & HR (unique to Business — succession planning, contract workers, performance, HRIS integration). 47 dashboard pages, expanded significantly from the initial 15-page scope.

## AI: Deep but Underutilised

The AI backbone is **excellent** — 42 functions across OpenAI, Anthropic Claude, and Google Gemini, with admin-configurable per-feature model selection. But [[09-sources/ai-enhancement-opportunities-2026-04-07]] reveals that **83% of pages don't use AI at all**.

The biggest opportunity: **wiring existing AI to existing pages**. Five quick wins (auto-prep kit, bias check, offer prediction, smart alerts, smart reply) require only connecting backend functions already built. Eight more high-value enhancements (match scores, application insights, profile coach, pipeline risk, candidate summaries, relationship AI, auto-screening, compliance AI) need medium effort.

Infrastructure gaps: no background AI job queue, no real-time streaming, dormant job embeddings table, no proactive AI notifications. See [[02-concepts/ai-features]] for details.

## WhatsApp: A Platform Within the Platform

The [[01-entities/whatsapp-bot]] is not a simple chatbot — it's a complete recruitment operating system via WhatsApp (SA's dominant messaging platform). It supports 6 SA languages, POPIA consent, CV parsing, job search, applications, screening interviews, career coaching, and frustration-driven human escalation.

The admin WhatsApp dashboard alone has **20 tabs** — including a visual flow builder (9 node types), DNA Analyzer (conversation pattern classification), War Room (escalation prediction), and Growth Engine (viral/referral tracking). See [[09-sources/whatsapp-bot-training-manual-2026-04-07]].

## SEO: Mature Foundation, Content Gap

The [[02-concepts/seo-strategy]] is already comprehensive: per-page meta tags, 8 JSON-LD schemas, sitemap, robots.txt, Open Graph tags, Core Web Vitals tracking. The critical gap is **SSR/prerendering** — as a React SPA, the site may not be fully indexed. Blog content expansion is the highest-impact organic growth lever. Target: 10,000+ monthly organic visitors within 12 months.

## South African Focus

Sebenza Hub is purpose-built for South Africa:

- **B-BBEE levels** tracked for recruiters and businesses (Level 1–8)
- **POPIA compliance** with consent tracking and data retention policies
- **Employment Equity** data capture (race, gender, disability) for statutory reporting
- **ZAR currency** defaults, South African provinces and cities
- **WhatsApp-first** communication (dominant messaging platform in SA)
- **SETA learnerships** integrated into the learning hub
- **6 SA languages** in WhatsApp bot greetings

## Key Systems

| System | Page |
|--------|------|
| Authentication | [[02-concepts/authentication]] |
| Role-Based Access Control | [[02-concepts/rbac]] |
| Multi-Tenancy | [[02-concepts/multi-tenancy]] |
| Application Lifecycle | [[02-concepts/application-lifecycle]] |
| AI Features | [[02-concepts/ai-features]] |
| Compliance | [[02-concepts/compliance]] |
| Billing | [[02-concepts/billing-system]] |
| WhatsApp Integration | [[02-concepts/whatsapp-integration]] |
| Tech Stack | [[02-concepts/tech-stack]] |
| SEO Strategy | [[02-concepts/seo-strategy]] |

## Emerging Themes

1. **AI is the moat, but it's barely deployed.** The platform has sophisticated AI infrastructure that most pages don't use. Connecting existing AI to existing pages is the highest-leverage work.
2. **WhatsApp is strategic.** The 20-tab admin dashboard and sophisticated bot capabilities suggest WhatsApp is a first-class channel, not an afterthought. This makes sense for SA where WhatsApp dominates.
3. **The Recruiter product is the revenue engine.** With placement fee tracking, client CRM, and KPI dashboards, the platform is designed around recruitment agency economics.
4. **Business dashboard has expanded significantly.** Now 47 pages (up from 15), with vendor management, workforce planning, and compliance tracks. AI usage remains the key gap — 5 AI tools exist but are underutilised.
5. **Compliance is a differentiator.** POPIA, B-BBEE, and Employment Equity are deeply integrated, not bolted on. This is hard for international competitors to replicate.

## Open Questions

- [[08-questions/recruiter-business-relationship]] — How vendor relationships are established (medium confidence)
- [[08-questions/trust-tier-calculation]] — How recruiter trust tiers are calculated (medium confidence)
- [[08-questions/subscription-plans]] — What are the 18 plans and their pricing (medium confidence)
- [[08-questions/ai-provider-selection]] — How AI providers are routed per feature (medium confidence)

## References

- [[01-entities/sebenza-hub]] — Platform entity page
- [[06-comparisons/user-type-comparison]] — Feature matrix across all 4 user types
- [[09-sources/repo-audit-2026-04-07]] — Initial codebase audit
- [[09-sources/features-inventory-2026-04-07]] — Platform features inventory
- [[09-sources/individual-features-2026-04-07]] — Individual features guide
- [[09-sources/recruitment-features-2026-04-07]] — Recruitment features guide
- [[09-sources/ai-enhancement-opportunities-2026-04-07]] — AI enhancement audit
- [[09-sources/seo-plan-2026-04-07]] — SEO strategy document
- [[09-sources/whatsapp-bot-training-manual-2026-04-07]] — WhatsApp bot manual
- [[12-tasks/todo.md]] — Current task backlog
- [[12-tasks/lessons.md]] — Patterns and corrections
