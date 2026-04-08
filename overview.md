---
title: "Sebenza Hub — Overview"
type: overview
created: 2026-04-07
updated: 2026-04-07
tags: [overview, synthesis, platform]
status: active
confidence: high
---

# Sebenza Hub — Overview

Sebenza Hub is a **multi-sided recruitment and career platform** built for the South African employment market. It connects four distinct user types — Individuals (job seekers), Recruiters (talent agencies), Businesses (employers), and Admins (platform operators) — through a unified web application with deep AI integration, WhatsApp-first communication, and South African compliance baked in (POPIA, B-BBEE, Employment Equity).

## The Four Pillars

| User Type | Role | Core Purpose | Dashboard Pages | Features |
|-----------|------|--------------|-----------------|----------|
| **[[01-entities/individual-user]]** | Job Seeker | Find jobs, build skills, manage career | 85 | 42 (56+ documented) |
| **[[01-entities/recruiter-user]]** | Talent Agency | Source candidates, manage clients, earn placement fees | 86 | 86 (95+ documented) |
| **[[01-entities/business-user]]** | Employer / Corporate HR | Post jobs, hire directly, manage workforce | 15 | 29 |
| **[[01-entities/admin-user]]** | Platform Operator | Configure platform, monitor health, ensure compliance | 104 | — |

See [[06-comparisons/user-type-comparison]] for a detailed side-by-side feature matrix.

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
Not just a job board — a complete career development ecosystem. Individuals get AI-powered job matching, CV review, cover letter generation, interview simulation, salary negotiation coaching, skill gap analysis, learning paths, SETA learnerships, portfolio builder, mentorship, and community. See [[09-sources/individual-features-2026-04-07]] for full documentation of 56+ features.

### 2. Recruitment ATS + CRM for Agencies
A full ATS + CRM + business intelligence suite comparable to standalone products like Bullhorn or Greenhouse. Recruiters manage the complete lifecycle: source → screen → evaluate → interview → offer → place. The Revenue Engine (client pipeline, submissions, placements, KPI tracking) makes this a business tool, not just a hiring tool. See [[09-sources/recruitment-features-2026-04-07]] for full documentation of 95+ features.

### 3. HR Suite for Businesses
The smallest but growing segment. Businesses manage jobs, applications, contract workers, performance, succession planning, workforce planning, and vendor (recruiter) relationships. The AI enhancement audit identifies 8 opportunities to bring AI to this dashboard — currently 0% of Business pages use AI.

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
4. **Business dashboard is the growth frontier.** At 15 pages with 0% AI usage, this is the least developed segment — and the most obvious expansion opportunity.
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
