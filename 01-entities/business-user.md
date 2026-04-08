---
title: "Business (Employer / Corporate HR)"
type: entity
created: 2026-04-07
updated: 2026-04-08
tags: [user-type, business, employer, corporate, hr]
sources: [repo-audit-2026-04-07, features-inventory-2026-04-07]
status: active
confidence: high
dashboard-path: /dashboard/business/*
endpoint-count: 15
---

# Business (Employer / Corporate HR)

The **Business** user represents a company or employer on Sebenza Hub. They post jobs, hire directly, manage their HR team, and optionally work with [[01-entities/recruiter-user|Recruiters]] as vendors. This is the demand side of the marketplace — the ones paying for talent.

**Role value in database:** `"business"`
**Organization type:** `"employer"`

## Dashboard Routes

All Business features live under `/dashboard/business/*`. **Total pages: 15.**

> **Note:** The Business dashboard is the **leanest** of the four dashboards. Many recruitment features (pipeline, offers, screening, interviews, AI tools, analytics, compliance) that are available to Recruiters are **not yet built** as dedicated Business pages. Businesses currently rely on a streamlined subset focused on job posting, team management, and HR/workforce operations.

## Features by Category

### Core Operations

| Feature | Route | Description |
|---------|-------|-------------|
| Home | `/home` | Business dashboard overview |
| Dashboard | `/dashboard` | Main business dashboard |
| Jobs | `/jobs` | Post and manage job listings |
| Applications | `/applications` | View all applications across the org |

### HR & Workforce Management

| Feature | Route | Description |
|---------|-------|-------------|
| Team | `/team` | Manage HR/hiring team members and permissions |
| Internal Job Board | `/internal-job-board` | Post internal-only positions |
| HRIS Integration | `/hris-integration` | Connect to external HR systems |
| Workforce Planning | `/workforce-planning` | Plan headcount and skill gaps |
| Performance Management | `/performance-management` | Track employee performance |
| Succession Planning | `/succession-planning` | Identify replacement candidates |
| Contract Workers | `/contract-workers` | Manage contractors and temps |

### Analytics & Reporting

| Feature | Route | Description |
|---------|-------|-------------|
| Custom Reports | `/custom-reports` | Build custom dashboards and reports |

### Settings & Configuration

| Feature | Route | Description |
|---------|-------|-------------|
| Settings | `/settings` | Company-wide settings |
| SSO Config | `/sso-config` | Single sign-on configuration |
| Vendor Management | `/vendor-management` | Manage third-party vendor relationships |

## Features Not Yet Built (from Recruiter parity)

The following features exist on the Recruiter dashboard but are **not yet available** as dedicated Business pages. Businesses may access some of these through shared components or API endpoints, but they lack dedicated dashboard routes:

| Category | Missing Features |
|----------|-----------------|
| Recruitment Pipeline | Pipeline (Kanban), Candidates database, Submissions |
| Offers | Offer management, Offer letters, Offer templates, Offer approvals |
| Screening | Screening bot, Screening roles, Scorecards, Background checks |
| Interviews | Interview kits, Video interviews, Scheduling, Self-scheduling |
| AI Tools | AI search, AI questions, AI writer, Predictive hiring |
| Communication | Unified inbox, Email templates |
| Sourcing | Talent CRM, Candidate sourcing |
| Analytics | Analytics dashboard, Diversity analytics, Predictive analytics |
| Compliance | Audit trail, B-BBEE reporting, POPIA compliance, Employment equity |
| Account | Profile page, Billing page |

## Data Model

Unlike Individuals and Recruiters who have dedicated profile tables, the Business user is modeled through the **organization/membership system**:

- **`users`** — Base account (role = "business")
- **`organizations`** — The company entity (name, industry, size, B-BBEE level, etc.)
- **`memberships`** — Links users to organizations with roles:
  - `owner` — Full control
  - `admin` — Administrative access
  - `manager` — Team management
  - `viewer` — Read-only access
  - `recruiter` — Limited to recruitment functions
- **`teamMembers`** — Team invitations and member management with fine-grained permissions
- **`roleDefinitions`** — Custom role templates per organization

### Organization Settings Tables

- **`interviewSettings`** — Calendar/video provider, working hours, timezone
- **`complianceSettings`** — EE data capture, POPIA consent text, data retention
- **`organizationIntegrations`** — Slack, ATS provider connections

## Onboarding Flow

The Business onboarding is the **lightest** of the three main user types:

1. Enter email → receive magic link
2. Click link → verify → create session
3. Select "Business" role on `/onboarding`
4. Fill onboarding form:
   - First name, last name, phone
   - Company name, industry, sub-industry
5. System creates:
   - Updates user (role = "business", onboardingComplete = true)
   - Creates `organizations` record (type = "employer")
   - Creates default `memberships` record
6. Redirect to `/dashboard/business/home`

## Key Interactions

- **With Individuals** — Receive direct applications, interview, hire
- **With Recruiters** — Use as vendors/suppliers; recruiters submit candidates to Business jobs
- **With AI** — JD generation, candidate search, predictive hiring, screening automation
- **With Admin** — Subject to compliance monitoring, feature access control

## How Businesses Work With Recruiters

```
Business posts job → visible to Recruiters as client opportunities
Recruiter sources candidates → submits to Business job
Business reviews → interviews → hires
Recruiter earns placement fee (tracked in clientRevenue)
```

The relationship is tracked via:
- `corporateClients` — The Business as a client of a Recruiter agency
- `corporateClientEngagements` — Fee terms and agreement
- Business views recruiter submissions alongside direct applications

## vs. Recruiter Features

Business and Recruiter share many features (pipeline, offers, interviews, screening) but differ in:

| Capability | Recruiter (86 pages) | Business (15 pages) |
|------------|-----------|----------|
| Dashboard pages | 86 built | 15 built |
| Client management | Yes (managing Business clients) | No |
| Placement fees | Earns fees | Pays fees |
| Internal HR | No | Yes (HRIS, workforce planning, succession) |
| Team management | Agency team | HR team with approval workflows |
| SSO | No | Yes |
| Vendor management | No | Yes (manages Recruiter vendors) |
| Recruitment pipeline | Full pipeline, screening, offers | Not yet built as dedicated pages |

See [[06-comparisons/user-type-comparison]] for the full matrix.

## Open Questions

- How does the Business-Recruiter vendor relationship get established? Does the Business invite recruiters, or do recruiters request access?
- What's the SSO provider support? (SAML, OIDC, specific providers?)
- How does workforce planning integrate with job posting?
- When will recruitment pipeline features (offers, screening, interviews) be built out for Business users?

## References

- [[03-workflows/business-journey]] — Complete journey: 7 hiring steps + 4 parallel tracks
- [[01-entities/individual-user]] — Job seekers who apply to Business jobs
- [[01-entities/recruiter-user]] — Agencies that submit candidates to Businesses
- [[02-concepts/multi-tenancy]] — Organization model
- [[02-concepts/rbac]] — Permission system for team members
- [[02-concepts/application-lifecycle]] — Hiring flow
- [[02-concepts/compliance]] — B-BBEE, POPIA, EE requirements
- [[02-concepts/billing-system]] — Billing and subscription management
- [[06-comparisons/user-type-comparison]] — Feature comparison
- Source: [[09-sources/repo-audit-2026-04-07]]
- Source: [[09-sources/business-journey-gap-analysis-2026-04-08]]
- Source: [[09-sources/features-inventory-2026-04-07]]
