---
title: "AI Features"
type: concept
created: 2026-04-07
updated: 2026-05-06
tags: [ai, machine-learning, openai, anthropic, google, compliance, regulation, risk-classification, rag, whatsapp-ai, agentic, cost-governance]
sources: [repo-audit-2026-04-07, ai-enhancement-opportunities-2026-04-07, sa-ai-policy-compliance-review, repo-sync-2026-04-20, repo-sync-2026-05-06]
status: active
confidence: high
---

# AI Features

Sebenza Hub integrates **three AI providers** — OpenAI, Anthropic Claude, and Google Gemini — across the entire platform. With 383+ AI-specific API endpoints, AI is not a bolt-on feature; it's core infrastructure.

## AI Providers

| Provider | SDK | Primary Use |
|----------|-----|-------------|
| OpenAI | `openai 4.77.0` | Job matching, CV analysis, content generation; Whisper for WhatsApp voice transcription. **Default model bumped to `gpt-4o` on 2026-04-29** (was `gpt-5.4`) — applied via migrations `0079`/`0080` and updates across the codebase |
| Anthropic Claude | `@anthropic-ai/sdk 0.78.0` | Complex reasoning, analysis — model ID bumped to **Claude Opus 4.7** across components on 2026-04-18 |
| Google Gemini | `@google/generative-ai 0.24.1` | Generative features |

**Platform-wide AI default chain** (added 2026-04-25, `eafcde2f`): admin sets a global default chain at the platform level. Per-feature configs override the global default only when explicitly set, and global config now takes priority over hardcoded defaults during model resolution (`f5c5cd25`). The `unique_constraint_on_ai_feature_configs.feature_key` (migration `0074`) prevents duplicate configs.

**`isAgentic` flag** (added 2026-04-25, `62ae13b8`): AI features are now classified as agentic (multi-turn, adaptive — e.g. Linda) or one-shot (single inference — e.g. CV Review). Used downstream by the cost-governance + telemetry layer to differentiate session-cost from request-cost economics.

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
| **Model Metrics** | Track accuracy, latency, cost per model. **ZAR alongside USD** across Predictive, A/B Testing, Usage Analytics, Cost Intelligence, and Cost Optimizer tabs (2026-04-26). Cost-per-request is now weighted by call count (volume-weighted), not arithmetic mean. Blended `token_cost_per_1k` exposed for Model Cost Comparison. |
| **Pay Equity Dashboard** | Platform-wide pay equity surfaces (added 2026-04-19) |
| **Spend Explorer** | Per-feature × per-model cost breakdown (added 2026-05-04, `81afeaa9`) — admin observability tab inside AI Monitoring |
| **AI Off toggle** | Now actually disables the feature (`92991158`, 2026-05-04) — was cosmetic before |
| **Daily AI spend circuit breaker** | Automatic throttle when daily spend crosses threshold (added 2026-05-01, `df49ea48`) |
| **Runtime daily budget kill switch** | Admin can override the daily AI budget at runtime (added 2026-05-03, migration `0107`) — backed by `ai_budget_overrides` table |
| **AI migration generation** | Admin authors SQL migrations from natural language (added 2026-04-25, `f59b82ad`); admin migrations UI at `471b8130` with password unlock at `12d5d1a0` |
| **Database migration guard** | Destructive `drizzle-kit push` blocked in production (added 2026-04-25, `a2c65869`) |
| **Soak-report endpoint** | Bearer-token endpoint for agentic AI feature soak metrics (added 2026-04-26, `d9033dcf`) |

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

## 2026-05-06 — Cost Governance & Telemetry Maturity

A heavy build-out across the AI cost / governance / observability surfaces during the 2026-04-21 → 2026-05-06 window. See [[09-sources/repo-sync-2026-05-06]] for full commit-level detail. Highlights:

- **Default model gpt-4o** (was `gpt-5.4`) — class-based defaults via migrations `0079`/`0080`.
- **Spend Explorer** (per-feature × per-model breakdown) for admin observability.
- **Daily AI spend circuit breaker** + **runtime budget kill switch** with `ai_budget_overrides` table.
- **ZAR display alongside USD** across all cost tabs; volume-weighted cost-per-request.
- **`isAgentic` flag** to classify multi-turn vs one-shot features.
- **Platform-wide AI default chain** with global config priority over hardcoded defaults.
- **AI migration generation** — natural-language → SQL migration via admin UI.
- **`tool_calls` audit trail** in `ai_usage_logs` (every Linda agent tool call audit-logged).
- **Fallback attempt tracking** in AI metrics logging (`5273905f`).
- **Limit candidate scoring to 50** for performance (`07721448`).
- **CV review sub-tools** + feature catalog updates (`b45bdc8d`).

## Open Questions

- How is the AI provider selected per feature? Is it configurable or hardcoded? — **partially resolved 2026-05-06:** platform-wide default chain is admin-configurable, per-feature overrides via `ai_feature_configs.feature_key` (unique-constrained).
- What's the cost model — are AI features metered/limited by plan?
- How is prompt engineering managed? Are prompts versioned?
- What's the fallback when an AI provider is unavailable? — **partially resolved 2026-05-06:** AI metrics now log fallback attempts; cross-provider AI fallback added in resume parse pipeline (`adce4fbd`).
- What's the operational runbook for triggering the runtime AI budget kill switch? Who has admin permissions? (raised 2026-05-06)

## References

- [[04-standards/sa-national-ai-policy]] — SA National AI Policy (draft) — risk classification for AI features
- Internal source: SA AI Policy compliance review (2026-04-11) — full compliance gap analysis
- [[02-concepts/application-lifecycle]] — AI in the hiring pipeline
- [[02-concepts/compliance]] — AI bias and governance
- [[03-workflows/individual-journey]] — AI tools in the Individual journey (Step 8)
- [[03-workflows/recruiter-journey]] — AI tools across the recruiter workflow
- Internal source: repo sync 2026-04-20 — WhatsApp AI Phase 0–6, smart match, role-gated AI endpoints, Opus 4.7
- Internal source: [[09-sources/repo-sync-2026-05-06]] — gpt-4o default, isAgentic flag, daily spend circuit breaker, runtime budget kill switch, Spend Explorer, ZAR display, AI migration generation, tool_calls audit
