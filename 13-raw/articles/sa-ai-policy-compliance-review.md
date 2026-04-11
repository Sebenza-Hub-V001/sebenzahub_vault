# SA National AI Policy Compliance Review for Sebenza Hub

## Policy Overview

The **Draft South Africa National AI Policy** (Gazette No. 54477, 10 April 2026) was approved by Cabinet on 25 March 2026. Public comments close **10 June 2026**. It's currently a draft policy framework — not yet legislation — but signals the regulatory direction. Implementation is phased:
- **Year 1 (2025/26):** Finalize policy, publish draft requirements for unacceptable risks
- **Year 2 (2026/27):** Implement high-risk regulations, sector strategies
- **Year 3 (2027/28):** Full implementation

---

## Sebenza Hub's AI Features at Risk

Sebenza Hub has **significant AI-driven features** that fall squarely into areas the policy targets:

| Feature | Policy Risk Level |
|---|---|
| Predictive Hiring (hire/no-hire verdicts) | **HIGH** - automated employment decisions |
| Job Matching Engine (scoring candidates) | **HIGH** - consumer decision-making system |
| Battle Card Analyzer (candidate comparison) | **HIGH** - comparative hiring decisions |
| Decision Simulator (offer probability) | **MEDIUM** - advisory but influences decisions |
| Automation Engine (pipeline actions) | **MEDIUM** - automated processing of applicants |
| Assessment Scoring (auto-scoring) | **MEDIUM** - educational/employment gating |
| AI Safety Rules & Cost Controls | **LOW** - internal operational |

---

## Compliance Assessment: 6 Key Principles

The policy identifies **6 key principles of responsible AI**: Fairness, Reliability & Safety, Privacy & Security, Inclusiveness, Transparency, Accountability.

### 1. FAIRNESS & BIAS MITIGATION — GAPS FOUND

**Policy requires:**
- AI systems trained on diverse datasets representing all demographics
- Frequent testing of algorithms for biased outcomes
- Mandatory gender and human rights impact assessments
- Independent certification of high-stakes AI applications

**Sebenza Hub status:**
- Job matching uses weighted scoring but **no documented bias detection or fairness constraints**
- Predictive hiring produces verdicts (strong_hire to no_hire) with **no bias audit trail**
- No demographic fairness testing on matching/scoring algorithms
- No gender or human rights impact assessment framework

**Action needed:**
- Add bias audit logging on all AI scoring/matching outputs
- Implement demographic parity testing for match scores
- Document fairness testing procedures
- Create impact assessment templates for AI hiring features

### 2. TRANSPARENCY & EXPLAINABILITY — GAPS FOUND

**Policy requires:**
- "Sufficient explainability" — users must understand how AI decisions are made
- Plain-language notifications when individuals are affected by automated decisions
- Citizens must be able to challenge AI-driven decisions through appropriate fora
- POPIA Section 71 on automated decision-making must be applied
- Routine algorithm impact assessments

**Sebenza Hub status:**
- Match scores show percentage but **reasoning not exposed to candidates**
- Predictive hiring verdicts don't show how dimensions were weighted
- No notification to candidates that AI is being used in their evaluation
- No mechanism for candidates to challenge AI-driven decisions
- No algorithm impact assessments conducted

**Action needed:**
- Add AI disclosure notices on candidate-facing pages ("AI is used to assist in evaluating your application")
- Expose match score breakdowns to candidates (skills %, experience %, etc.)
- Build a challenge/appeal mechanism for AI-driven decisions
- Implement Section 71 POPIA compliance: inform data subjects of automated decisions affecting them and provide opportunity to make representations

### 3. PRIVACY & DATA PROTECTION (POPIA) — PARTIAL COMPLIANCE

**Policy requires:**
- Align with POPIA's 8 conditions for lawful processing
- Data protection by design and default
- Data minimisation and purpose limitation
- Transparency in AI data usage and storage
- Privacy Impact Assessments for AI systems processing sensitive information

**Sebenza Hub status:**
- POPIA consent management exists (consent tracking, expiration, revocation)
- **BUT**: Candidate PII is passed to Claude AI for analysis with no evidence of:
  - Explicit consent for AI processing specifically
  - Data anonymization/pseudonymization before AI analysis
  - Purpose limitation (what specifically the AI can/cannot do with data)
  - Data minimization (full profiles sent vs. only necessary fields)

**Action needed:**
- Add explicit AI-specific consent ("your data may be processed by AI for matching/scoring")
- Implement data minimization: only send necessary fields to AI endpoints
- Add Privacy Impact Assessment documentation for each AI feature
- Ensure AI processing consent is separate from general platform consent

### 4. ACCOUNTABILITY — GAPS FOUND

**Policy requires:**
- Clear lines of accountability traceable to a specific official or entity
- Organizations must take responsibility for AI system outcomes
- Named accountable official for AI deployments

**Sebenza Hub status:**
- AI usage logging exists (feature, provider, model, user, tokens, cost)
- Quality feedback loop with ratings
- **BUT**: No designated AI accountability officer/role
- No documented accountability framework for AI decisions
- No clear escalation path when AI produces adverse outcomes

**Action needed:**
- Designate an AI accountability contact within the platform
- Document accountability chain for each AI feature
- Create incident response procedures for AI-related complaints

### 5. HUMAN OVERSIGHT (HITL) — PARTIAL COMPLIANCE

**Policy requires:**
- Critical AI decisions must involve human oversight
- Human-in-the-Loop approach at all development stages
- Safety brakes and human control always maintained
- Consumers must have option to engage with humans instead of AI

**Sebenza Hub status:**
- Essay/code assessments marked as "pending AI scoring" (suggests human review possible)
- Predictive hiring appears to generate verdicts that recruiters then act on (human-in-loop)
- **BUT**: Automation engine can auto-execute actions (move stages, send emails) without explicit human approval gates
- Match scores auto-calculated without human verification requirement
- No documented "safety brake" to disable AI features

**Action needed:**
- Ensure all automations that affect candidate status have human approval gates for critical stages
- Add kill-switch/safety brake to disable AI scoring globally
- Document which decisions require human review vs. which are advisory

### 6. INCLUSIVENESS — GAPS FOUND

**Policy requires:**
- AI must advance disability inclusion
- Child-centric ethical principles for child data
- Ensure AI technologies are accessible to all South Africans
- Address historical socio-economic disparities

**Sebenza Hub status:**
- B-BBEE compliance scoring exists
- Employment Equity reporting exists
- **BUT**: No accessibility testing of AI-driven interfaces documented
- No multilingual support for AI explanations
- No child data protections (if any minors use the platform)

---

## Risk Classification Summary

Under the policy's risk-based approach (inspired by the EU AI Act):

| Category | Sebenza Hub Features | Required Actions |
|---|---|---|
| **Unacceptable Risk** | None identified | - |
| **High Risk** | Predictive Hiring, Job Matching, Battle Cards, Assessment Scoring | Bias audits, explainability, HITL, impact assessments, potential future certification |
| **Medium Risk** | Automation Engine, Decision Simulator, Offer Strategy | Transparency notices, accountability logging |
| **Low Risk** | AI Cost Controls, Safety Rules | Standard compliance |

---

## Top 10 Priority Actions

1. **Add AI disclosure notices** to candidate-facing pages
2. **Implement POPIA Section 71** automated decision-making compliance (notify + allow representations)
3. **Build bias audit framework** for matching and scoring algorithms
4. **Add data minimization** to AI endpoints (don't send full profiles to Claude)
5. **Create candidate appeal mechanism** for AI-driven decisions
6. **Add explicit AI processing consent** separate from general consent
7. **Designate AI accountability officer/role** in platform administration
8. **Add kill-switch** to disable AI features globally
9. **Document Privacy Impact Assessments** for each AI feature
10. **Implement algorithm impact assessments** with regular testing cadence

---

## Timeline Alignment

The policy is still in **draft/comment phase** (closes 10 June 2026). High-risk regulations expected in **Year 2 (2026/27)**. This gives Sebenza Hub approximately **12-18 months** to achieve full compliance before enforcement begins. Items 1-3 above should be prioritized immediately as they represent the highest risk areas.

**Bottom line:** Sebenza Hub has strong foundational compliance infrastructure (POPIA consent management, audit trails, AI usage logging) but has significant gaps in **transparency to candidates, bias auditing, and explainability** of AI-driven hiring decisions. The recruitment/hiring use case is explicitly a high-risk category under this policy.
