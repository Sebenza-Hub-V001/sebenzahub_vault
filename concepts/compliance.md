---
title: "Compliance (POPIA, B-BBEE, Employment Equity)"
type: concept
created: 2026-04-07
updated: 2026-04-07
tags: [compliance, popia, bbbee, employment-equity, south-africa, legal]
sources: [repo-audit-2026-04-07]
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
- Connects to [[concepts/ai-features]] governance

## Open Questions

- How is POPIA consent versioned? If the consent text changes, are users re-prompted?
- Who verifies B-BBEE certificates — admin manual review or automated?
- What EE report formats are generated (EEA2, EEA4)?
- How is the tension between EE data collection and POPIA managed in practice?

## References

- [[entities/recruiter-user]] — B-BBEE level, POPIA compliance on profile
- [[entities/business-user]] — Organization compliance settings
- [[entities/admin-user]] — Compliance reporting and monitoring
- [[concepts/ai-features]] — AI bias auditing
- [[concepts/rbac]] — `data:pii_access` permission for sensitive data
- Source: [[sources/repo-audit-2026-04-07]]
