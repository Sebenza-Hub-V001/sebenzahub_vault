---
title: "Source: AI Enhancement Opportunities Audit"
type: source
created: 2026-04-07
updated: 2026-04-07
tags: [ai, enhancement, audit, roadmap]
sources: [ai-enhancement-opportunities]
status: active
confidence: high
---

# Source: AI Enhancement Opportunities Audit

**Raw file:** `13-raw/articles/ai-enhancement-opportunities.md`
**Ingested:** 2026-04-07

## Summary

A complete audit of AI usage across Sebenza Hub identifying **56 enhancement opportunities**. The core finding: the AI backbone is excellent (42 functions, 3 providers, 44 API endpoints) but **83% of pages don't use AI at all**. Most enhancements involve wiring existing AI functions to pages that already exist.

## Key Claims

### Current State
- 136 total pages analysed (subset of full 325)
- **23 pages (17%) use AI** — the remaining 113 are static/CRUD
- **42 AI functions** in the backend
- **44 AI API endpoints** out of 200+ total
- 3 AI providers: OpenAI, Anthropic, Google Gemini
- Admin-configurable per-feature model selection already exists

### 56 Enhancement Opportunities
- **15 Job Seeker features** — match scores on job cards, AI application insights, profile coach, test prep, smart forum, learning paths
- **19 Recruiter features** — pipeline intelligence, candidate insights, predictive analytics, relationship AI, auto-screening, compliance assistant
- **8 Business features** — workforce scenario modeling, succession planning, performance insights, report narratives, vendor scoring
- **7 Admin features** — platform intelligence, feature optimization, predictive monitoring, user intelligence, revenue AI, compliance analysis
- **7 Cross-cutting enhancements** — real-time streaming, background AI queue, semantic search, proactive notifications, AI onboarding, multi-language AI, AI dashboards

### Priority Matrix

**5 Quick Wins** (low effort, existing backend):
1. Interview scheduling → auto-prep kit
2. Jobs → auto-bias check on save
3. Offers → acceptance prediction
4. Settings → smart alerts
5. Recruiter inbox → smart reply

**8 High-Value Medium Effort** (wire existing AI):
1. Job listings → match scores
2. Applications → status insights
3. Profile → completeness coach
4. Pipeline → risk indicators
5. Candidates → AI summaries
6. Talent CRM → relationship AI
7. Screening → auto-trigger
8. BBBEE/EE → compliance AI

**6 High-Value High Effort** (new AI functions needed):
1. Analytics → predictive dashboard
2. Recruiter analytics → forecasting
3. Workforce planning → scenarios
4. Performance → trend insights
5. Admin overview → platform AI
6. Semantic search with embeddings

### Critical Infrastructure Gaps
- **No background AI job queue** — BullMQ exists for email/SMS but not AI tasks
- **No real-time AI streaming** — all responses are blocking (wait for full response)
- **Job embeddings table exists but isn't used** — semantic search foundation is laid but dormant
- **No AI-triggered notifications** — all notifications are event-based, not AI-proactive

## Entities and Concepts Mentioned

- [[02-concepts/ai-features]] — Core AI capabilities and gaps
- [[01-entities/individual-user]] — 15 AI enhancement opportunities
- [[01-entities/recruiter-user]] — 19 AI enhancement opportunities
- [[01-entities/business-user]] — 8 AI enhancement opportunities
- [[01-entities/admin-user]] — 7 AI enhancement opportunities
- [[02-concepts/tech-stack]] — BullMQ, embeddings, streaming infrastructure

## Notable Observations

- The most impactful single change would be wiring `matchCandidateToJob()` to the job listings page — it already exists and would transform the job search experience.
- The Business dashboard (15 pages, 0 with AI) is the most underserved by AI. High-impact features like workforce planning and succession planning would require new AI functions.
- Multi-language AI for SA's 11 official languages is flagged as critical for market penetration but high effort.

## Open Questions

- What's the current AI cost per user/month?
- Is the `jobEmbeddings` table populated? If so, what's the embedding model?
- See [[08-questions/ai-provider-selection]] for provider routing logic.

## References

- [[02-concepts/ai-features]]
- [[01-entities/sebenza-hub]]
- [[02-concepts/tech-stack]]
- [[08-questions/ai-provider-selection]]
