---
title: "Dashboard Layouts (Journey-Aligned)"
type: source
created: 2026-04-08
updated: 2026-04-08
tags: [dashboard, layout, journey, sidebar, navigation]
sources: [dashboard-layouts]
status: active
confidence: high
---

# Dashboard Layouts (Journey-Aligned)

**Source:** `13-raw/articles/dashboard-layouts.md`
**Ingested:** 2026-04-08

## Summary

All four dashboards have been restructured to follow their respective user journey documents. Each sidebar is divided into a **primary path** (sequential hiring/recruitment/operations steps) and **parallel tracks** (scenario-driven features), separated by a thick visual divider with glowing section headers.

## Dashboard Summary

| Dashboard | Route Prefix | Groups | Pages | Primary Path | Parallel Tracks |
|-----------|-------------|--------|-------|--------------|-----------------|
| Individual | `/dashboard/individual/*` | 11 | 51 | Hiring Path (5 groups) | AI Assistance, Learning, Community, Career Dev |
| Recruiter | `/dashboard/recruiter/*` | 14 | 101 | Recruitment Path (8 groups) | Communication, Analytics, Compliance, Brand |
| Business | `/dashboard/business/*` | 12 | 47 | Hiring Path (6 groups) | Vendor/Sourcing, Communication, Compliance, Workforce/HR |
| Admin | `/admin/*` | 9 | 24 | Operations Path (4 groups) | AI Governance, Trust/Safety, Platform Config |

## Key Changes from Previous Layout

- **Individual:** 48 → 51 pages. Portfolio Builder moved to Hiring Path (Build Profile). Interview Simulator moved to Hiring Path. Salary Insights added to Offers group.
- **Recruiter:** 101 pages (unchanged count). Reorganised from flat categories to 8-step recruitment path + 4 parallel tracks. Screening Roles, Compare Detail added to Screen & Evaluate.
- **Business:** 35 → 47 pages. Significant expansion: added Vendor & Sourcing track (3 pages), Communication (3 pages), expanded Compliance (4 pages), Workforce & HR (7 pages), Analytics (4 pages), Knowledge Base (3 pages).
- **Admin:** 24 pages (unchanged). Reorganised from flat categories to Operations Path + 3 parallel tracks. New sections: AI Governance, Trust & Safety, Platform Config.

## Cross-References

- [[15-dashboards/Individual Dashboard]] — Full page-by-page layout
- [[15-dashboards/Recruiter Dashboard]] — Full page-by-page layout
- [[15-dashboards/Business Dashboard]] — Full page-by-page layout
- [[15-dashboards/Admin Dashboard]] — Full page-by-page layout
- [[03-workflows/individual-journey]] — Journey that defines Individual sidebar structure
- [[03-workflows/recruiter-journey]] — Journey that defines Recruiter sidebar structure
- [[03-workflows/business-journey]] — Journey that defines Business sidebar structure

## References

- Source: `13-raw/articles/dashboard-layouts.md`
