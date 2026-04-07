---
title: "AI Features"
type: concept
created: 2026-04-07
updated: 2026-04-07
tags: [ai, machine-learning, openai, anthropic, google]
sources: [repo-audit-2026-04-07, ai-enhancement-opportunities-2026-04-07]
status: active
confidence: high
---

# AI Features

Sebenza Hub integrates **three AI providers** — OpenAI, Anthropic Claude, and Google Gemini — across the entire platform. With 383+ AI-specific API endpoints, AI is not a bolt-on feature; it's core infrastructure.

## AI Providers

| Provider | SDK | Primary Use |
|----------|-----|-------------|
| OpenAI | `openai 4.77.0` | Job matching, CV analysis, content generation |
| Anthropic Claude | `@anthropic-ai/sdk 0.78.0` | Complex reasoning, analysis |
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
| **Career Coaching** | Personalized career guidance. Capabilities: Pattern Detection, Skill Matching, Risk Analysis, Predictions |
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
| **AI Governance** | Policy management for AI features |
| **Model Metrics** | Track accuracy, latency, cost per model |

### Shared AI Video Analysis Framework

Per [[sources/individual-feature-guide-pdf-2026-04-07]], Video Profile and Interview Simulator share an AI analysis framework that scores video content on three dimensions: **Confidence** (87%), **Clarity** (92%), **Engagement** (78%). These consistent scores across both features suggest a unified video analysis pipeline rather than feature-specific implementations.

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

This connects to the broader [[concepts/compliance]] framework.

## AI Enhancement Opportunities

Per [[sources/ai-enhancement-opportunities-2026-04-07]], **83% of pages don't use AI** despite 42 backend functions being available. The biggest opportunity is wiring existing AI to existing pages.

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

- How is the AI provider selected per feature? Is it configurable or hardcoded? (See [[questions/ai-provider-selection]])
- What's the cost model — are AI features metered/limited by plan?
- How is prompt engineering managed? Are prompts versioned?
- What's the fallback when an AI provider is unavailable?

## References

- [[entities/individual-user]] — AI features for job seekers
- [[workflows/individual-journey]] — AI tools in the Individual journey (Step 8)
- [[entities/recruiter-user]] — AI features for recruiters
- [[entities/admin-user]] — AI monitoring and governance
- [[concepts/application-lifecycle]] — AI in the hiring pipeline
- [[entities/sebenza-hub]] — Platform overview
- Source: [[sources/repo-audit-2026-04-07]]
- Source: [[sources/ai-enhancement-opportunities-2026-04-07]]
- Source: [[sources/individual-feature-guide-pdf-2026-04-07]]
