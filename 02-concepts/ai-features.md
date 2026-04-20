---
title: "AI Features"
type: concept
created: 2026-04-07
updated: 2026-04-20
tags: [ai, machine-learning, openai, anthropic, google, compliance, regulation, risk-classification, rag, whatsapp-ai]
sources: [repo-audit-2026-04-07, ai-enhancement-opportunities-2026-04-07, sa-ai-policy-compliance-review, repo-sync-2026-04-20]
status: active
confidence: high
---

# AI Features

Sebenza Hub integrates **three AI providers** — OpenAI, Anthropic Claude, and Google Gemini — across the entire platform. With 383+ AI-specific API endpoints, AI is not a bolt-on feature; it's core infrastructure.

## AI Providers

| Provider | SDK | Primary Use |
|----------|-----|-------------|
| OpenAI | `openai 4.77.0` | Job matching, CV analysis, content generation; Whisper for WhatsApp voice transcription |
| Anthropic Claude | `@anthropic-ai/sdk 0.78.0` | Complex reasoning, analysis — model ID bumped to **Claude Opus 4.7** across components on 2026-04-18 |
| Google Gemini | `@google/generative-ai 0.24.1` | Generative features |

## Features by User Type

### Individual AI Features

| Feature | Description |
|---------|-------------|
| **Auto Match** | AI matches profile to jobs (aiMatchScore 0–100) |
| **CV Review** | Analyzes CV for improvements, ATS compatibility |
| **Cover Letter Generator** | Auto-generates tailored cover letters per job |
| **Salary Negotiator** | AI guidance on salary negotiation strategy |
| **Interview Simulator** | Practice interviews with AI feedback |
| **Career Coaching** | Personalized career guidance |
| **Ghost Job Detection** | Detects potentially fake job postings (ghostRiskScore) |
| **Skill Gap Analysis** | Identifies missing skills for target roles |
| **Market Radar** | Monitors salary trends, hiring bursts, layoffs |
| **Career Autopilot** | Auto-apply, auto-cover-letter, auto-follow-up |
| **Interview Prep** | Auto-research companies, prep questions |

### Recruiter AI Features

| Feature | Description |
|---------|-------------|
| **AI Candidate Search** | Natural language candidate search |
| **AI Matching** | Match candidates to jobs with explanations |
| **JD Writer** | Generate job descriptions from brief |
| **Question Generator** | Generate interview questions per role |
| **Screening Bot** | Automated initial screening chatbot |
| **Candidate Summary** | AI-generated candidate overviews |
| **Video Analysis** | Analyze video interview performance |
| **Predictive Hiring** | Predict hiring success probability |
| **Culture Fit** | Assess cultural alignment |
| **Offer Predictor** | Predict offer acceptance probability |
| **AI Copilot** | Chat-based recruitment assistant |
| **Crafted Messages** | AI-generated outreach messages |
| **DNA Card** | Auto-generated recruiter profile summary |
| **Reputation Score** | AI-calculated reputation metrics |
| **Competitive Benchmarking** | Percentile ranking vs sector peers |
| **Profile Coach** | AI suggestions to improve recruiter profile |
| **Smart Match** | Match candidates to a specific job posting (added 2026-04-16) |
| **AI Candidate Search v2** | Natural language search + keyword filtering + enriched result fields (2026-04-16) |

### Business AI Features

| Feature | Description |
|---------|-------------|
| **AI Search** | Candidate search |
| **AI Questions** | Interview question generation |
| **AI Writer** | Content generation (JDs, emails) |
| **Predictive Hiring** | Hiring success prediction |
| **Screening Bot** | Automated screening |

### Admin AI Features

| Feature | Description |
|---------|-------------|
| **AI Monitoring** | Track usage, costs, quality across all AI features |
| **Bias Auditing** | Monitor AI decisions for demographic bias |
| **AI Governance** | Policy management for AI features (unified with billing registry on 2026-04-13) |
| **Model Metrics** | Track accuracy, latency, cost per model |
| **Pay Equity Dashboard** | Platform-wide pay equity surfaces (added 2026-04-19) |

### WhatsApp / Linda AI Features (Phase 0–6, 2026-04-19)

See [[02-concepts/whatsapp-integration]] for full detail. Linda is now a first-class AI feature of the platform:

| Feature | Description |
|---------|-------------|
| **Intent AI Fallback** | LLM intent classification on unmatched messages, default-on |
| **RAG FAQ** | Answers grounded in `wiki_pages` table content |
| **Escalation Summary** | Auto-summarises conversation context when escalating to human |
| **Voice Transcription** | Whisper transcribes voice notes before NLU |
| **AI Reply Drafts** | Agent composer suggests replies from conversation context |
| **Bidirectional Translation** | User writes local language ↔ agent reads/replies English |

## Infrastructure

### Database Tables

| Table | Purpose |
|-------|---------|
| `ai_feature_configs` | Feature enablement per AI provider |
| `ai_jobs` | Async job queue for AI operations |
| `ai_interview_sessions` | Candidate AI interview data with scores |
| `ai_bias_audits` | Fairness auditing results |
| `ai_model_metrics` | Performance tracking (accuracy, bias, latency) |
| `ai_audit_events` | AI usage monitoring log |

### API Endpoints

383+ AI-specific endpoints organized under:
- `/api/ai/*` — General AI (chat, complete, summarize, extract)
- `/api/ai-sourcing/*` — Candidate sourcing AI
- `/api/ai-intelligence/*` — Intelligence operations
- `/api/ai-advanced/*` — Advanced AI features
- `/api/ai-features/*` — Feature implementations
- `/api/ai-predictive-hiring` — Predictive hiring

### Async Processing

Heavy AI operations run asynchronously via BullMQ (Redis-backed job queue):
- CV parsing and analysis
- Batch candidate matching
- Video analysis
- Report generation

## Bias & Governance

Admin can monitor AI fairness through:
- **Bias Audits** — Demographic breakdown of AI decisions
- **Governance Policies** — Rules for AI feature usage
- **Model Metrics** — Track accuracy and bias per model
- **Audit Events** — Full log of AI interactions

This connects to the broader [[02-concepts/compliance]] framework.

> ⚠️ **Tension:** The bias audit infrastructure (tables, endpoints, admin dashboard) exists in the codebase, but an internal SA AI Policy compliance review (2026-04-11) finds it is **not operationalised** — no documented fairness constraints, no demographic parity testing, no algorithm impact assessments are running. Candidates receive no AI disclosure notices, cannot see how scores are calculated, and have no appeal mechanism.

## SA National AI Policy — Risk Classification

Under the [[04-standards/sa-national-ai-policy]] (draft, 2026), Sebenza Hub's AI features are classified by regulatory risk:

| Risk Level | Features | Regulatory Requirements |
|---|---|---|
| **High** | Predictive Hiring, Job Matching, Battle Cards, Assessment Scoring | Bias audits, explainability, HITL, impact assessments, potential certification |
| **Medium** | Decision Simulator, Automation Engine, Offer Strategy | Transparency notices, accountability logging |
| **Low** | AI Cost Controls, Safety Rules | Standard compliance |

**Key compliance gaps for high-risk features:**
- ~~No AI disclosure notices to candidates~~ **Partially resolved (2026-04-17):** AI-assisted review badge on public job detail; AI screening disclosure + consent checkbox in QuickApplyDialog; `POST /api/applications` enforces `ai_processing` consent.
- No POPIA Section 71 compliance (automated decision-making notification + right to challenge) — still outstanding
- No data minimisation for AI endpoints (full profiles sent to Claude) — still outstanding
- No designated AI accountability officer — still outstanding
- **AI-intelligence endpoints now role-gated** (2026-04-17, `f31a58a`) — 5 previously-open endpoints require recruiter role
- No global kill-switch to disable AI features
- Automation engine lacks human approval gates for critical pipeline stages

**Timeline:** High-risk regulations expected 2026/27 (~12–18 months). The full gap analysis and 10 prioritised action items are tracked in the internal SA AI Policy compliance review (2026-04-11).

## AI Enhancement Opportunities

Audit findings show **83% of pages don't use AI** despite 42 backend functions being available. The biggest opportunity is wiring existing AI to existing pages.

### Quick Wins (existing backend, low effort)
- Interview scheduling → auto-trigger `researchCompany()` + `generateInterviewQuestions()`
- Job creation → auto-trigger `analyzeRequirementRestrictiveness()` for bias detection
- Offers → wire `predictOfferAcceptance()` to offer creation
- Recruiter inbox → wire `composeEmail()` for smart reply suggestions

### High-Value Medium Effort
- Job listings → `matchCandidateToJob()` scores on every job card
- Profile → AI completeness coach from `improveCv()` + `coachCandidate()`
- Pipeline → `predictHiringSuccess()` + `scoreCandidateEngagement()` for risk indicators
- Screening → auto-trigger `screenCandidate()` on every new application

### Infrastructure Gaps
- **No background AI queue** — BullMQ exists for email/SMS but not AI tasks
- **No real-time streaming** — all AI responses block until complete
- **Dormant embeddings** — `jobEmbeddings` table exists but isn't used for semantic search
- **No proactive AI notifications** — all notifications are event-based

## Open Questions

- How is the AI provider selected per feature? Is it configurable or hardcoded?
- What's the cost model — are AI features metered/limited by plan?
- How is prompt engineering managed? Are prompts versioned?
- What's the fallback when an AI provider is unavailable?

## References

- [[04-standards/sa-national-ai-policy]] — SA National AI Policy (draft) — risk classification for AI features
- Internal source: SA AI Policy compliance review (2026-04-11) — full compliance gap analysis
- [[02-concepts/application-lifecycle]] — AI in the hiring pipeline
- [[02-concepts/compliance]] — AI bias and governance
- [[03-workflows/individual-journey]] — AI tools in the Individual journey (Step 8)
- [[03-workflows/recruiter-journey]] — AI tools across the recruiter workflow
- Internal source: repo sync 2026-04-20 — WhatsApp AI Phase 0–6, smart match, role-gated AI endpoints, Opus 4.7
