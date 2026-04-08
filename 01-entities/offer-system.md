---
title: "Offer System"
type: entity
created: 2026-04-07
updated: 2026-04-07
tags: [offers, hiring, negotiation, approval, compensation]
sources: [repo-audit-2026-04-07]
status: active
confidence: high
---

# Offer System

The Offer System is one of Sebenza Hub's most sophisticated subsystems — a full lifecycle management tool for creating, approving, negotiating, and tracking job offers. It includes AI-powered negotiation strategy, compliance checking, salary benchmarking, and multi-step approval workflows.

## Offer Lifecycle

```
Draft → Pending Approval → Sent → Viewed → Accepted / Negotiation / Declined / Expired
                                              ↓
                                    Counter-offer rounds
                                    (company ↔ candidate)
                                              ↓
                                    Resolved / Withdrawn
```

### Status Values (`offers.status`)

| Status | Description |
|--------|-------------|
| `draft` | Created but not submitted for approval |
| `pending_approval` | In approval workflow |
| `sent` | Delivered to candidate |
| `accepted` | Candidate accepted |
| `declined` | Candidate declined |
| `expired` | Time-limited, no response |
| `withdrawn` | Retracted by employer |

### Negotiation Status

| Status | Description |
|--------|-------------|
| `none` | No negotiation |
| `in_progress` | Active negotiation rounds |
| `resolved` | Negotiation concluded |

## Database Tables (12 tables)

| Table | Purpose |
|-------|---------|
| `offers` | Core offer record (salary, benefits, status, dates) |
| `offerLetters` | Generated offer letter with signature tracking |
| `offerNegotiations` | Negotiation rounds (proposed salary, benefits, who proposed) |
| `negotiationCommunications` | Communication log with sentiment analysis |
| `negotiationDeadlines` | Response deadlines, escalation triggers |
| `negotiationApprovals` | Multi-level approval (manager → dept head → exec) |
| `negotiationCompPackages` | Full compensation packages per round |
| `offerTemplates` | Reusable templates by category and job level |
| `offerApprovalChains` | Sequential approval workflow steps |
| `offerActivityLog` | Audit trail of all offer actions |
| `offerComplianceChecks` | Legal/regulatory compliance validation |
| `offerBenchmarks` | Market salary data by role, region, industry |

## Approval Workflow

Multi-step sequential approval with delegation and escalation:

```
Step 1: Hiring Manager (approval level 1)
  → Approved? → Step 2
  → Rejected? → Back to draft
  → Delegated? → Delegate reviews instead

Step 2: Department Head (approval level 2)
  → Approved? → Step 3 (if required)
  → Escalated? → Auto-notify next level

Step 3: Executive (CFO/CEO) (approval level 3)
  → Approved? → Offer status → "sent"
```

Each step tracks: `maxAuthorizedAmount`, `conditions`, `dueDate`, `reminderSentAt`, `escalatedAt`.

## Negotiation Flow

1. **Initial offer** sent to candidate
2. **Candidate responds** — accept, decline, or counter
3. **Counter-offer rounds** — each round tracked with:
   - `proposedSalary`, `proposedBenefits`
   - `proposedBy` (company or candidate)
   - `status` (pending, accepted, rejected, countered)
4. **Communications logged** per round with sentiment analysis (-100 to +100)
5. **Approval loop** — if counter exceeds authority, escalates for approval
6. **Resolution** — accepted, declined, or expired

## Compensation Packages

Full SA-relevant compensation tracked per negotiation round:

- Base salary, signing bonus, annual bonus, bonus target %
- Commission structure, equity value + vesting schedule
- Allowances: car, housing, medical aid, retirement, study, cellphone, travel
- Leave days, remote work days, relocation assistance
- Total annual value, cost-to-company calculation

## AI Features

| Endpoint | Purpose |
|----------|---------|
| `POST /api/ai/negotiation-health-score` | Health score for ongoing negotiation |
| `POST /api/ai/generate-negotiation-strategy` | AI strategy playbook |
| `POST /api/ai/negotiation-advisor` | Counter-offer suggestions |
| `POST /api/ai/coach/salary` | Salary coaching |
| `POST /api/ai/negotiation-roleplay` | Practice negotiation |
| `POST /api/ai/negotiation-debrief` | Post-negotiation analysis |

## Compliance Checking

`offerComplianceChecks` validates:
- Pay band compliance
- Employment equity alignment
- B-BBEE requirements
- Labour law adherence
- Issue severity: low / medium / high / critical

## Benchmarking

`offerBenchmarks` provides market data:
- By job title, seniority level, industry, region, province
- Salary min / median / max
- Total comp min / median / max
- Common benefits, demand level, scarce skill flag, B-BBEE premium

## Frontend Pages (Recruiter)

| Page | Route | Purpose |
|------|-------|---------|
| Offers Dashboard | `/offers` | Kanban view of all offers |
| Offer Letters | `/offer-letters` | Generate + sign letters |
| Offer Templates | `/offer-templates` | Template management |
| Offer Negotiation | `/offer-negotiation` | Negotiation tracking |
| Offer Approvals | `/offer-approvals` | Approval workflows |
| Offer Comparison | `/offer-compare` | Compare multiple offers |
| Offer Analytics | `/offer-analytics` | Acceptance rates, metrics |
| Offer Benchmarking | `/offer-benchmarking` | Salary benchmarks |
| Offer Compliance | `/offer-compliance` | Compliance checks |
| Offer Predictor | `/offer-predictor` | AI acceptance prediction |
| Offer Timeline | `/offer-timeline` | Visual milestone tracking |

## Open Questions

- How are offer letter templates designed? Is there a WYSIWYG editor or is it markdown/HTML?
- What triggers compliance checks — automatic on creation or manual?
- How does the `bbbeePremium` field in benchmarks affect salary recommendations?

## References

- [[02-concepts/application-lifecycle]] — Offer is the penultimate stage
- [[01-entities/recruiter-user]] — Primary user of offer features
- [[01-entities/business-user]] — Also manages offers
- [[02-concepts/compliance]] — Offer compliance checking
- [[02-concepts/ai-features]] — AI negotiation tools
- Source: [[09-sources/repo-audit-2026-04-07]]
