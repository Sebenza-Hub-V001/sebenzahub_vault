---
title: "Admin Dashboard"
type: entity
created: 2026-04-08
updated: 2026-04-08
tags: [dashboard, admin, platform, layout]
sources: [dashboard-layouts]
status: active
user-types: [admin]
dashboard-path: /admin/*
---

# Admin Dashboard

**File:** `client/src/pages/admin/AdminDashboard.tsx`
**Route:** `/admin/*`
**Total Pages:** 24

> Sidebar organised into Operations Path → Parallel Tracks → Supporting, with glowing headers and a thick divider separating primary path from parallel tracks.

---

## OPERATIONS PATH

### Monitor (3 pages)

| Page | Route |
|------|-------|
| Overview | `/admin/overview` |
| Platform Health | `/admin/platform-health` |
| Usage Analytics | `/admin/usage-analytics` |

### Manage Users (5 pages)

| Page | Route |
|------|-------|
| Recruiters | `/admin/recruiters` |
| Businesses | `/admin/businesses` |
| Individuals | `/admin/individuals` |
| Candidates | `/admin/candidates` |
| Roles | `/admin/roles` |

### Content & Jobs (3 pages)

| Page | Route |
|------|-------|
| CVs | `/admin/cvs` |
| Job Aggregator | `/admin/job-aggregator` |
| SEO | `/admin/seo` |

### Billing & Plans (3 pages)

| Page | Route |
|------|-------|
| Billing | `/admin/billing` |
| Plans | `/admin/plans` |
| Features | `/admin/features` |

---

## PARALLEL TRACKS

### AI Governance (3 pages)

| Page | Route |
|------|-------|
| AI Command Center | `/admin/ai-monitoring` |
| AI Features Setup | `/admin/features-setup` |
| Bias Auditing | `/admin/bias-auditing` |

### Trust & Safety (2 pages)

| Page | Route |
|------|-------|
| Fraud Detection | `/admin/fraud` |
| Compliance Reports | `/admin/compliance-reports` |

### Platform Config (4 pages)

| Page | Route |
|------|-------|
| White-Label | `/admin/white-label` |
| Languages | `/admin/multi-language` |
| WhatsApp | `/admin/whatsapp` |
| Data Migration | `/admin/data-migration` |

---

## SUPPORTING

### Knowledge Base (3 pages)

| Page | Route |
|------|-------|
| Knowledge Base | `/admin/wiki` |
| Wiki Viewer | `/admin/wiki/:id` |
| Wiki Page | `/admin/wiki/:id/page/:slug` |

### Account (1 page)

| Page | Route |
|------|-------|
| Admin Profile | `/admin/profile` |

## References

- [[01-entities/admin-user]] — Entity page with data model
- [[02-concepts/ai-features]] — AI governance and monitoring
- [[02-concepts/billing-system]] — Plans and feature entitlements
- [[02-concepts/compliance]] — Compliance reporting
