---
title: "SA National AI Policy — Compliance Review for Sebenza Hub"
type: source
created: 2026-04-11
updated: 2026-04-11
tags: [compliance, ai, popia, regulation, south-africa, policy, bias, transparency, accountability]
sources: [sa-ai-policy-compliance-review]
status: active
confidence: high
---

# SA National AI Policy — Compliance Review for Sebenza Hub

## One-Paragraph Summary

A compliance gap analysis of Sebenza Hub's AI features against the **Draft South Africa National AI Policy** (Gazette No. 54477, 10 April 2026, Cabinet-approved 25 March 2026). The review maps 7 AI features to the policy's EU AI Act-inspired risk tiers, finding Predictive Hiring, Job Matching, Battle Cards, and Assessment Scoring in the **HIGH risk** category. It audits against the policy's 6 principles (fairness, transparency, privacy, accountability, human oversight, inclusiveness) and identifies gaps in all six — most critically in candidate-facing transparency, bias auditing operationalisation, and AI-specific POPIA consent. Ten prioritised action items are proposed, with a 12–18 month compliance window before high-risk enforcement begins (Year 2: 2026/27).

## Key Claims

### Policy Context
- Draft policy approved by Cabinet on 25 March 2026; public comments close **10 June 2026**
- Phased implementation: Year 1 (finalise policy), Year 2 (high-risk regulations), Year 3 (full implementation)
- Risk-based approach inspired by the EU AI Act: unacceptable / high / medium / low tiers
- 6 key principles: Fairness, Reliability & Safety, Privacy & Security, Inclusiveness, Transparency, Accountability
- Recruitment/hiring is **explicitly a high-risk category**

### Risk Classification of Sebenza Hub Features

| Risk Level | Features |
|---|---|
| **High** | Predictive Hiring (hire/no-hire verdicts), Job Matching Engine (candidate scoring), Battle Card Analyzer (comparative hiring), Assessment Scoring (auto-scoring) |
| **Medium** | Decision Simulator (offer probability), Automation Engine (pipeline actions), Assessment Scoring (borderline) |
| **Low** | AI Safety Rules, Cost Controls |

### Compliance Gaps Found (all 6 principles)

1. **Fairness & Bias Mitigation** — No documented bias detection or fairness constraints on matching/scoring. No demographic parity testing. No gender or human rights impact assessments. Bias audit infrastructure exists in DB (`ai_bias_audits` table, admin dashboard) but is **not operationalised**.

2. **Transparency & Explainability** — Match scores show percentages but reasoning not exposed to candidates. Predictive hiring verdicts don't show dimension weighting. No AI disclosure notices. No candidate challenge/appeal mechanism. No POPIA Section 71 compliance (automated decision-making notification). No algorithm impact assessments.

3. **Privacy & Data Protection (POPIA)** — General consent management exists, but AI-specific consent is missing. Full candidate profiles sent to Claude AI with no evidence of data minimisation, anonymisation, or purpose limitation for AI processing specifically.

4. **Accountability** — AI usage logging exists (feature, provider, model, tokens, cost) but no designated AI accountability officer/role, no documented accountability framework, no escalation path for adverse AI outcomes.

5. **Human Oversight (HITL)** — Predictive hiring has human-in-loop (recruiter acts on verdicts). But automation engine can auto-execute stage moves and emails without human gates. No documented kill-switch to disable AI features globally.

6. **Inclusiveness** — B-BBEE and EE compliance exists, but no accessibility testing of AI interfaces, no multilingual AI explanations, no child data protections.

### What Already Exists (foundation)
- POPIA consent management (tracking, expiration, revocation)
- `ai_bias_audits` table and admin bias auditing dashboard
- `ai_audit_events` and `ai_model_metrics` tables
- AI usage logging (feature, provider, model, user, tokens, cost)
- Quality feedback loop with ratings
- B-BBEE compliance scoring and Employment Equity reporting
- Blind Hiring feature (hide demographics)

### Top 10 Priority Actions
1. Add AI disclosure notices to candidate-facing pages
2. Implement POPIA Section 71 automated decision-making compliance
3. Build bias audit framework for matching/scoring algorithms
4. Add data minimisation to AI endpoints
5. Create candidate appeal mechanism for AI-driven decisions
6. Add explicit AI processing consent (separate from general consent)
7. Designate AI accountability officer/role
8. Add kill-switch to disable AI features globally
9. Document Privacy Impact Assessments per AI feature
10. Implement algorithm impact assessments with regular testing cadence

## Entities and Concepts Mentioned

- [[04-standards/sa-national-ai-policy]] — The draft policy itself
- [[02-concepts/compliance]] — Existing POPIA/B-BBEE/EE compliance framework
- [[02-concepts/ai-features]] — AI features classified by risk
- [[01-entities/sebenza-hub]] — Platform under review
- POPIA Section 71 — Automated decision-making provisions
- EU AI Act — Model the SA policy is inspired by

## Contradictions and Tensions with Existing Wiki

> ⚠️ **Tension:** [[02-concepts/compliance]] documents `ai_bias_audits` table and admin bias auditing dashboard as existing infrastructure, but this review finds these are **not operationalised** — no documented bias detection, no fairness constraints, no demographic parity testing is actually running. The infrastructure exists but the processes don't.

> ⚠️ **Tension:** [[02-concepts/ai-features]] lists a "Bias & Governance" section suggesting admin can monitor AI fairness through bias audits, governance policies, and model metrics. This review reveals that while the database tables and endpoints exist, **no candidate-facing transparency** has been implemented — candidates don't know AI is evaluating them, can't see how scores are calculated, and have no appeal mechanism.

> ⚠️ **Tension:** [[02-concepts/compliance]] documents POPIA consent management as implemented, but this review identifies a gap: **general platform consent ≠ AI-specific consent**. POPIA (and the new AI policy) require separate, explicit consent for AI processing of personal data, which doesn't exist.

## Open Questions Raised

- Does the `ai_bias_audits` table actually contain any data, or is it an empty schema?
- Has the admin bias auditing dashboard ever been used in production?
- What would a POPIA Section 71 notification look like in the Sebenza Hub UX?
- Should Sebenza Hub submit a public comment on the draft policy by 10 June 2026?
- Will the policy require third-party certification of high-risk AI systems? If so, what certification bodies exist in SA?

## References

- Raw source: `13-raw/articles/sa-ai-policy-compliance-review.md`
- [[04-standards/sa-national-ai-policy]] — Policy details and timeline
- [[02-concepts/compliance]] — Existing compliance framework
- [[02-concepts/ai-features]] — AI features and governance
- [[03-workflows/admin-journey]] — Admin AI governance track
