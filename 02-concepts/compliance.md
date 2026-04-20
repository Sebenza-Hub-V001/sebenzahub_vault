---
title: "Compliance (POPIA, B-BBEE, Employment Equity, AI Policy)"
type: concept
created: 2026-04-07
updated: 2026-04-20
tags: [compliance, popia, bbbee, employment-equity, south-africa, legal, ai, regulation, transparency, privacy-policy, pay-equity]
sources: [repo-audit-2026-04-07, sa-ai-policy-compliance-review, repo-sync-2026-04-20]
status: active
confidence: high
---

# Compliance (POPIA, B-BBEE, Employment Equity)

Sebenza Hub is built for the South African market and embeds three key compliance frameworks into its core functionality.

## 1. POPIA (Protection of Personal Information Act)

South Africa's data protection law (similar to GDPR).

**How it's implemented:**

| Feature | Implementation |
|---------|---------------|
| Consent collection | Required during Individual onboarding (checkbox) |
| Consent text | Configurable per organization in `complianceSettings.consentText` |
| Data retention | Configurable per org in `complianceSettings.dataRetentionDays` (default: 365) |
| Recruiter compliance | `recruiterProfiles.popiaCompliant` flag |
| Organization compliance | `complianceSettings.popiaCompliant` flag |
| Data subject requests | DSAR (Data Subject Access Request) support |
| **Privacy Policy page** | POPIA-aligned scaffold at `/privacy` (added 2026-04-17) |
| **Signup consent persistence** | Consent persisted to `popia_consents` on magic-link verify (2026-04-18) |
| **AI processing consent** | Required flag enforced at `POST /api/applications` — request rejected without it (2026-04-17) |
| **AI disclosure UI** | AI-assisted review badge on public job detail; AI screening disclosure + consent checkbox in QuickApplyDialog (2026-04-17) |
| **Demographic opt-in** | Gender/race capture is opt-in at source (2026-04-18) — consented data then drives pay-gap cards |

**Key principle:** Users must consent before their personal data is processed. Recruiters and Businesses must declare POPIA compliance.

## 2. B-BBEE (Broad-Based Black Economic Empowerment)

South Africa's economic transformation framework that scores companies on ownership, management, skills development, and enterprise/supplier development.

**How it's implemented:**

| Feature | Implementation |
|---------|---------------|
| Recruiter level | `recruiterProfiles.bbbeeLevel` — Level 1 through Level 8, or "non_compliant" |
| Recruiter expiry | `recruiterProfiles.bbbeeExpiryDate` |
| Recruiter verification | `bbbeeVerificationStatus` — "unverified", "pending", "verified", "expired" |
| Recruiter document | `bbbeeDocumentUrl` — Uploaded certificate |
| Organization level | `organizations.bbbeeLevel` |
| Transformation statement | `recruiterProfiles.transformationStatement` |
| Diversity initiatives | `recruiterProfiles.diversityInitiatives` (JSONB array) |
| Compliance dashboard | `/dashboard/recruiter/bbbee` and `/dashboard/business/bbbee` |
| Reporting | `/admin/compliance-reports` for Admin |

**B-BBEE Levels:**

| Level | Procurement Recognition |
|-------|------------------------|
| Level 1 | 135% |
| Level 2 | 125% |
| Level 3 | 110% |
| Level 4 | 100% |
| Level 5–8 | Progressively less |
| Non-compliant | 0% |

Higher B-BBEE levels make Recruiters more attractive to Business clients who need to meet their own B-BBEE targets.

## 3. Employment Equity (EE)

South Africa's employment equity legislation requires employers to report on workforce demographics and take affirmative action.

**How it's implemented:**

| Feature | Implementation |
|---------|---------------|
| Demographic data capture | `candidateProfiles.gender`, `race`, `disability` fields |
| EE data capture toggle | `complianceSettings.eeDataCapture` (per organization) |
| EE Reports | `/dashboard/recruiter/ee-reports` and `/dashboard/business/employment-equity` |
| Diversity Analytics | Dedicated analytics pages for Recruiter and Business |
| Blind Hiring | `/dashboard/recruiter/blind-hiring` — hide demographics to reduce bias |
| Admin reporting | `/admin/compliance-reports` |

**Key tension:** EE requires collecting demographic data for statutory reporting, while POPIA restricts collecting personal data. The platform handles this by making EE data collection optional (toggle per org) and ensuring consent is obtained.

## Audit Trail

All compliance-relevant actions are tracked:

| Table | Purpose |
|-------|---------|
| `audit_trail` | General audit trail for all actions |
| `fraud_audit_log` | Admin fraud reviews |
| `approval_audit_log` | Approval workflow audits |
| `ai_audit_events` | AI decision monitoring |
| `migration_compliance_audit` | Data migration compliance |

Recruiter and Business dashboards include an **Audit Trail** page showing all actions and changes.

## AI Bias Auditing

AI decisions are monitored for compliance:
- `ai_bias_audits` — Fairness auditing results with demographic breakdowns
- Admin bias auditing dashboard at `/admin/bias-auditing`
- **Platform-wide Pay Equity dashboard** added 2026-04-19 at the admin layer (`b104376`)
- Connects to [[02-concepts/ai-features]] governance

> ⚠️ **Tension:** The bias audit infrastructure (database tables, admin dashboard) exists but is **not operationalised**. An internal compliance review (2026-04-11) finds no evidence of documented bias detection, demographic parity testing, or fairness constraints actually running against matching/scoring algorithms. The plumbing is there; the processes aren't.
> **Update (2026-04-19):** Recruiter-side benchmark + pay-equity endpoints are now real (previously hardcoded). Admin-side pay-equity dashboard exists. Operationalisation of bias detection against the matching algorithms remains outstanding.

## 4. SA National AI Policy (Draft — 2026)

The [[04-standards/sa-national-ai-policy]] (Gazette No. 54477, Cabinet-approved 25 March 2026) introduces a **risk-based AI classification** modelled on the EU AI Act. Recruitment/hiring AI is explicitly **HIGH risk**.

**Sebenza Hub's high-risk AI features:** Predictive Hiring, Job Matching Engine, Battle Card Analyzer, Assessment Scoring.

### Compliance Gaps Identified

| Principle | Gap | 2026-04-20 Status |
|---|---|---|
| **Fairness** | No bias detection running, no demographic parity testing, no impact assessments | Open — plumbing exists, processes still don't run |
| **Transparency** | No AI disclosure notices to candidates, no explainability of scores, no appeal mechanism | **Partially resolved** — AI disclosure badges + consent checkbox now live in public job detail and QuickApplyDialog (2026-04-17) |
| **Privacy (POPIA)** | AI-specific consent missing — general consent doesn't cover AI processing; no data minimisation for AI endpoints | **Consent partially resolved** — `ai_processing` now enforced at apply endpoint, demographic opt-in added, Privacy Policy page live. Data minimisation still open. |
| **Accountability** | No designated AI accountability officer, no incident response for AI complaints | Open |
| **Human Oversight** | Automation engine lacks approval gates for critical stages; no global kill-switch | Open |
| **Inclusiveness** | No accessibility testing of AI interfaces, no multilingual AI explanations | **Partially improved** — WhatsApp Phase 6 (2026-04-19) adds bidirectional translation; multilingual AI conversation in WhatsApp now real, though explanations of AI scoring remain English-only |

### POPIA Section 71 — Not Yet Implemented

Section 71 requires that data subjects be **notified** when automated decisions materially affect them and given the opportunity to **make representations** (challenge the decision). This is not currently implemented for any of Sebenza Hub's AI-driven hiring features.

### Timeline

- **10 June 2026** — Public comment period closes
- **2026/27** — High-risk regulations take effect
- **12–18 months** to achieve compliance from policy finalisation

Full gap analysis and prioritised action items are tracked in the internal SA AI Policy compliance review (2026-04-11).

## Open Questions

- How is POPIA consent versioned? If the consent text changes, are users re-prompted?
- Who verifies B-BBEE certificates — admin manual review or automated?
- What EE report formats are generated (EEA2, EEA4)?
- How is the tension between EE data collection and POPIA managed in practice?
- Does the `ai_bias_audits` table contain any production data, or is it an empty schema?
- What would a POPIA Section 71 notification look like in the Sebenza Hub UX?
- Should Sebenza Hub submit a public comment on the draft AI policy by 10 June 2026?

## Compliance in Workflows

- [[03-workflows/recruiter-journey]] — Track C: Compliance & Governance (EE audits, POPIA data requests, fee disputes)

## References

- [[04-standards/sa-national-ai-policy]] — SA National AI Policy (draft) — risk classification, 6 principles, timeline
- Internal source: SA AI Policy compliance review (2026-04-11) — full gap analysis
- [[02-concepts/ai-features]] — AI bias auditing and risk classification
- [[02-concepts/rbac]] — `data:pii_access` permission for sensitive data
- [[03-workflows/recruiter-journey]] — Track C: Compliance & Governance
- Internal source: repo sync 2026-04-20 — POPIA AI consent enforcement, Privacy Policy page, demographic opt-in, pay-equity dashboard
