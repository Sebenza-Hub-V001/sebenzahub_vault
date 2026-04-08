---
title: "Wiki Index"
type: overview
created: 2026-04-06
updated: 2026-04-07
tags: [index, navigation]
status: active
---

# Wiki Index

> Last updated: 2026-04-08 | Pages: 44 | Sources: 10 (+7 raw docs) | Presentations: 0

## Entities
- [[01-entities/sebenza-hub]] — Multi-sided recruitment & career SaaS platform (South Africa)
- [[01-entities/individual-user]] — Job seeker: 85 dashboard pages (profile, credentials, jobs, learning, career, community)
- [[01-entities/recruiter-user]] — Talent agency: 86 dashboard pages (recruitment, clients, AI, offers, screening, compliance)
- [[01-entities/business-user]] — Employer / corporate HR: 15 dashboard pages (jobs, HR/workforce, settings)
- [[01-entities/admin-user]] — Platform operator: 104 dashboard pages (features, RBAC, AI monitoring, bias auditing, WhatsApp)
- [[01-entities/offer-system]] — Full offer lifecycle: creation, approval chains, negotiation, compliance
- [[01-entities/screening-system]] — CV screening, chatbot, competency tests, background checks
- [[01-entities/linkedin-integration]] — OAuth, lead gen form sync, AI scoring, nurture sequences
- [[01-entities/community-learning-hub]] — Forum, mentorship, learning paths, skill verification, gamification
- [[01-entities/whatsapp-bot]] — AI-powered recruitment assistant via WhatsApp (20 admin tabs, 6 SA languages)
- [[01-entities/job-aggregation]] — External job aggregation via Adzuna and CareerJet APIs

## Concepts
- [[02-concepts/authentication]] — Passwordless magic-link login via Resend
- [[02-concepts/rbac]] — Role-based access control with 40+ granular permissions
- [[02-concepts/multi-tenancy]] — Organization-based data isolation for Recruiters and Businesses
- [[02-concepts/application-lifecycle]] — Full hiring pipeline: apply → screen → interview → offer → hire
- [[02-concepts/ai-features]] — OpenAI + Anthropic + Google Gemini powering matching, screening, interviews (83% of pages still untouched)
- [[02-concepts/compliance]] — POPIA, B-BBEE, Employment Equity (South African compliance)
- [[02-concepts/billing-system]] — 18 subscription plans, credits, usage metering, 157 seeded features
- [[02-concepts/whatsapp-integration]] — WhatsApp Business API: apply, campaigns, chatbots
- [[02-concepts/tech-stack]] — React + Express + PostgreSQL + Railway
- [[02-concepts/seo-strategy]] — SEO implementation (mature foundation) + content growth strategy

## Workflows
- [[03-workflows/individual-journey]] — Complete 57-feature journey: hiring + AI tools + learning + career dev + community
- [[03-workflows/recruiter-journey]] — Complete 95+ feature journey: recruitment path + communication + analytics + compliance + brand
- [[03-workflows/business-journey]] — Complete employer journey: hiring + vendor management + workforce & HR + compliance

## Sources
- [[09-sources/repo-audit-2026-04-07]] — Full codebase audit, 2026-04-07
- [[09-sources/features-inventory-2026-04-07]] — Platform feature inventory (325 pages, 3586 endpoints, 755 tables, 157 features)
- [[09-sources/individual-features-2026-04-07]] — 56+ Individual features detailed guide
- [[09-sources/recruitment-features-2026-04-07]] — 95+ Recruiter features detailed guide
- [[09-sources/ai-enhancement-opportunities-2026-04-07]] — AI enhancement audit (56 opportunities, 83% of pages lack AI)
- [[09-sources/seo-plan-2026-04-07]] — SEO strategy (target: 10K monthly organic visitors)
- [[09-sources/whatsapp-bot-training-manual-2026-04-07]] — WhatsApp bot operational manual (20 admin tabs)
- [[09-sources/individual-journey-gap-analysis-2026-04-07]] — Journey gap analysis (40% coverage → 100% rewrite)
- [[09-sources/recruiter-journey-gap-analysis-2026-04-08]] — Recruiter journey gap analysis (60% coverage → 100% rewrite)
- [[09-sources/business-journey-gap-analysis-2026-04-08]] — Business journey gap analysis (65% coverage → 100% rewrite)

## Raw Source Documents
- `13-raw/data/features-inventory.md` — Platform feature inventory (325 pages, 3586 endpoints, 755 tables)
- `13-raw/articles/individual-features.md` — 56 Individual features detailed guide
- `13-raw/articles/recruitment-features.md` — 95+ Recruiter features detailed guide
- `13-raw/articles/ai-enhancement-opportunities.md` — AI enhancement audit (83% of pages lack AI)
- `13-raw/articles/seo-plan.md` — SEO strategy document
- `13-raw/articles/whatsapp-bot-training-manual.md` — WhatsApp chatbot training guide
- `13-raw/articles/individual-journey-gap-analysis.md` — Individual journey coverage audit

## Comparisons
- [[06-comparisons/user-type-comparison]] — Side-by-side feature matrix across all 4 user types

## Decisions

## Tweets
- [[10-tweets/karpathy-llm-knowledge-bases]] — LLM-powered knowledge bases replace RAG at personal scale, @karpathy, 2026-04
- [[10-tweets/farzatv-farzapedia-personal-wiki]] — LLM compiles 2,500 personal notes into 400-article wiki for agent consumption, @FarzaTV, 2026-04
- [[10-tweets/explorax-20-agentic-skills]] — 20 reusable agentic skill files (.md) for Claude/ChatGPT/Gemini across writing, visual, research, video & coding, @exploraX_, 2026-04
- [[10-tweets/aiedge-claude-skills-guide]] — Claude Skills architecture: progressive loading, A/B testing, trigger optimisation, eval framework, @aiedge_, 2026-03

## Presentations

_(No presentations yet.)_

## Questions
- [[08-questions/recruiter-business-relationship]] — How is the vendor relationship established? Status: partially resolved (medium confidence)
- [[08-questions/trust-tier-calculation]] — How are recruiter trust tiers calculated? Status: partially resolved (medium confidence)
- [[08-questions/subscription-plans]] — What are the 18 plans and their pricing? Status: partially resolved (pricing hints found)
- [[08-questions/ai-provider-selection]] — How is the AI provider selected per feature? Status: partially resolved (admin-configurable confirmed)
