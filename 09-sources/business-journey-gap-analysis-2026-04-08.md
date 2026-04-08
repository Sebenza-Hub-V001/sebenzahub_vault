---
title: "Business Journey Gap Analysis"
type: source
created: 2026-04-08
updated: 2026-04-08
tags: [business, journey, gap-analysis, coverage]
sources: [business-journey-gap-analysis]
status: active
confidence: high
---

# Business Journey Gap Analysis

**Source:** Internal analysis comparing [[03-workflows/business-journey]] against [[01-entities/business-user]]
**Analysed:** 2026-04-08

## Summary

The Business journey document covered the linear hiring path (Steps 1–9) but missed vendor management, active sourcing, communication tools, and the post-hire HR features lacked scenario depth. Coverage was approximately 65% of the full Business feature set.

## Coverage Gaps by Category

| Category | In Journey | Missing | Gap Severity |
|----------|-----------|---------|-------------|
| Vendor Management | Mentioned in table only | /vendors page, vendor performance tracking, engagement terms management | High |
| Active Sourcing | None (passive "receive applications" only) | AI Search, Talent CRM, Candidate Sourcing | High |
| Communication | None | Unified Inbox, Email Templates | Medium |
| AI Tools | AI Writer mentioned briefly | AI Search, AI Questions, Predictive Hiring (scenarios) | Medium |
| Offer Depth | Basic mention | Offer Letters, Offer Templates, Offer Approvals (detail) | Low |
| HR & Workforce | Listed as features | Succession Planning, Contract Workers, Team DNA, Performance (no scenarios) | Medium |
| Account | None | Billing, SSO Config, Profile page | Low |

## Resolution

Restructured from 9 linear steps to **7 hiring steps + 4 parallel tracks** with scenario-driven narratives:
- **Track A: Vendor Management & Active Sourcing** — role won't fill through job board, vendor underperforming, direct vs recruiter decision framework
- **Track B: Communication & Automation** — candidates dropping out from slow responses, team scattered across channels
- **Track C: Compliance & Governance** — EE audit, POPIA data request, B-BBEE scorecard
- **Track D: Workforce & HR** — CFO leaves (succession), contractor visibility, team composition analysis, performance-driven hiring

## References

- [[03-workflows/business-journey]] — Rewritten document
- [[01-entities/business-user]] — Full feature list
