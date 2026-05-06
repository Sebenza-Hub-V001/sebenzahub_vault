---
title: "Business Dashboard"
type: entity
created: 2026-04-08
updated: 2026-05-06
tags: [dashboard, business, employer, layout]
sources: [dashboard-layouts, repo-sync-2026-05-06]
status: active
user-types: [business]
dashboard-path: /dashboard/business/*
---

# Business Dashboard

**File:** `client/src/pages/business/BusinessDashboard.tsx`
**Route:** `/dashboard/business/*`
**Total Pages:** 47 (snapshot 2026-04-28) — **6+ new pages added 2026-05-04** during the Business–Recruiter Alignment Phase 1 wave; this layout doc has not yet been re-walked against `BusinessDashboard.tsx`.

> Sidebar organised into Hiring Path → Parallel Tracks → Supporting, with glowing headers and a thick divider separating primary path from parallel tracks.

See [[03-workflows/business-journey]] for the full journey with scenarios.

---

## HIRING PATH

### Configure Organization (4 pages)

| Page | Route |
|------|-------|
| Overview | `/dashboard/business/home` |
| Team | `/dashboard/business/team` |
| Settings | `/dashboard/business/settings` |
| SSO Config | `/dashboard/business/sso-config` |

### Post Jobs (3 pages)

| Page | Route |
|------|-------|
| Jobs | `/dashboard/business/jobs` |
| AI JD Writer | `/dashboard/business/ai-writer` |
| Screening Roles | `/dashboard/business/screening-roles` |

### Receive Applications (3 pages)

| Page | Route |
|------|-------|
| Applications | `/dashboard/business/applications` |
| Pipeline | `/dashboard/business/pipeline` |
| Candidates | `/dashboard/business/candidates` |

### Screen & Evaluate (4 pages)

| Page | Route |
|------|-------|
| Screening Bot | `/dashboard/business/screening-bot` |
| Video Interviews | `/dashboard/business/video-interviews` |
| Scorecards | `/dashboard/business/scorecards` |
| Background Checks | `/dashboard/business/background-checks` |

### Interview (4 pages)

| Page | Route |
|------|-------|
| Scheduling | `/dashboard/business/scheduling` |
| Self-Scheduling | `/dashboard/business/self-scheduling` |
| Interview Kits | `/dashboard/business/interview-kits` |
| AI Questions | `/dashboard/business/ai-questions` |

### Make Offer (5 pages)

| Page | Route |
|------|-------|
| Offers | `/dashboard/business/offers` |
| Offer Letters | `/dashboard/business/offer-letters` |
| Offer Templates | `/dashboard/business/offer-templates` |
| Offer Approvals | `/dashboard/business/offer-approvals` |
| Predictive Hiring | `/dashboard/business/predictive-hiring` |

---

## PARALLEL TRACKS

### Vendor & Sourcing (3 pages)

| Page | Route |
|------|-------|
| Vendor Management | `/dashboard/business/vendors` |
| Talent CRM | `/dashboard/business/talent-crm` |
| AI Search | `/dashboard/business/ai-search` |

### Communication & Automation (3 pages)

| Page | Route |
|------|-------|
| Unified Inbox | `/dashboard/business/unified-inbox` |
| Email Templates | `/dashboard/business/email-templates` |
| Approvals | `/dashboard/business/approvals` |

### Compliance & Governance (4 pages)

| Page | Route |
|------|-------|
| Audit Trail | `/dashboard/business/audit-trail` |
| B-BBEE | `/dashboard/business/bbbee` |
| Employment Equity | `/dashboard/business/employment-equity` |
| POPIA Compliance | `/dashboard/business/popia-compliance` |

### Workforce & HR (7 pages)

| Page | Route |
|------|-------|
| HRIS Integration | `/dashboard/business/hris-integration` |
| Workforce Planning | `/dashboard/business/workforce-planning` |
| Internal Job Board | `/dashboard/business/internal-job-board` |
| Performance | `/dashboard/business/performance` |
| Succession Planning | `/dashboard/business/succession-planning` |
| Contract Workers | `/dashboard/business/contract-workers` |
| Team DNA | `/dashboard/business/team-dna` |

---

## SUPPORTING

### Analytics (4 pages)

| Page | Route |
|------|-------|
| Recruitment Analytics | `/dashboard/business/analytics` |
| Predictive Analytics | `/dashboard/business/predictive-analytics` |
| Diversity Analytics | `/dashboard/business/diversity-analytics` |
| Custom Reports | `/dashboard/business/custom-reports` |

### Knowledge Base (3 pages)

| Page | Route |
|------|-------|
| My Wikis | `/dashboard/business/wiki` |
| Wiki Viewer | `/dashboard/business/wiki/:id` |
| Wiki Page | `/dashboard/business/wiki/:id/page/:slug` |

## 2026-05-06 — Pending Sidebar Reconciliation

The Business–Recruiter Alignment Phase 1 wave (2026-05-04, migrations `0110`–`0113`) introduced new Business pages that need a confirmed home in the sidebar groups above. Pages added but not yet placed in this layout doc:

| Page | Likely group | Source |
|------|---|---|
| **BusinessBrandProfile** (`/brand-profile`) | Settings & Configuration (mirrors Recruiter brand pattern) — to confirm | `434c6332` |
| **BusinessIntegrationsApi** (`/integrations-api`) | Settings & Configuration | `434c6332` |
| **Cost Centers** (`/cost-centers`) | HR & Workforce Management — likely sits next to Performance / Approvals | `e1d0f8da` |
| **Salary Calculator** (`/salary-calculator`) | Hiring Path → Make Offer (or Supporting → Analytics) — to confirm | `de61788e` |
| **SCIM 2.0 endpoints** | Backend routes only (no sidebar entry) — Team page may surface SCIM status | `c97c18fb` |
| **Succession Planning workflows** | Already in `Workforce & HR` (route exists at `/succession-planning`); 2026-05-04 work formalised the workflow rather than adding a new page | `c97c18fb` |
| **Vendor Management with performance tracking** | Already in `Vendor & Sourcing` as Vendor Management; 2026-05-04 work added performance-tracking surfaces inside the existing page | `c97c18fb` |
| **Background Checks** (already exists) | Screen & Evaluate (already listed) — first external provider integrated 2026-04-23 | `1dc6af1c` |

**Action:** Re-walk `client/src/pages/business/BusinessDashboard.tsx` against this layout to confirm sidebar group, route, and label for each. See [[09-sources/repo-sync-2026-05-06]] for full commit-level detail and [[01-entities/business-user]] for the entity-level capture (which is current).

## References

- [[03-workflows/business-journey]] — Full journey with scenarios
- [[01-entities/business-user]] — Entity page with data model
- [[09-sources/repo-sync-2026-05-06]] — Business–Recruiter Alignment Phase 1, new Business pages
