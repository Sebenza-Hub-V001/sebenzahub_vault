---
title: "Business (Employer / Corporate HR)"
type: entity
created: 2026-04-07
updated: 2026-04-07
tags: [user-type, business, employer, corporate, hr]
sources: [repo-audit-2026-04-07]
status: active
confidence: high
---

# Business (Employer / Corporate HR)

The **Business** user represents a company or employer on Sebenza Hub. They post jobs, hire directly, manage their HR team, and optionally work with [[01-entities/recruiter-user|Recruiters]] as vendors. This is the demand side of the marketplace — the ones paying for talent.

**Role value in database:** `"business"`
**Organization type:** `"employer"`

## Dashboard Routes

All Business features live under `/dashboard/business/*`.

## Features by Category

### Core Operations

| Feature | Route | Description |
|---------|-------|-------------|
| Home | `/home` | Business dashboard overview |
| Jobs | `/jobs` | Post and manage job listings |
| Applications | `/applications` | View all applications across the org |
| Pipeline | `/pipeline` | Recruitment pipeline (Kanban) |
| Candidates | `/candidates` | Candidate database |
| Offers | `/offers` | Offer lifecycle management |
| Offer Letters | `/offer-letters` | Generate and send offers |
| Offer Templates | `/offer-templates` | Pre-built offer templates |
| Offer Approvals | `/offer-approvals` | Multi-step approval workflows |

### HR & Workforce Management

| Feature | Route | Description |
|---------|-------|-------------|
| Team | `/team` | Manage HR/hiring team members and permissions |
| Team DNA | `/team-dna` | Team composition analysis |
| Internal Job Board | `/internal-job-board` | Post internal-only positions |
| HRIS Integration | `/hris-integration` | Connect to external HR systems |
| Workforce Planning | `/workforce-planning` | Plan headcount and skill gaps |
| Performance Management | `/performance` | Track employee performance |
| Succession Planning | `/succession-planning` | Identify replacement candidates |
| Contract Workers | `/contract-workers` | Manage contractors and temps |

### Screening & Assessment

| Feature | Route | Description |
|---------|-------|-------------|
| Screening Bot | `/screening-bot` | Automated screening chatbot |
| Screening Roles | `/screening-roles` | Define role-based screening criteria |
| Interview Kits | `/interview-kits` | Structured interview guides |
| Video Interviews | `/video-interviews` | Asynchronous video interviews |
| Scorecards | `/scorecards` | Evaluation forms |
| Background Checks | `/background-checks` | Background verification |

### AI Tools

| Feature | Route | Description |
|---------|-------|-------------|
| AI Search | `/ai-search` | AI-powered candidate search |
| AI Questions | `/ai-questions` | Generate interview questions |
| AI Writer | `/ai-writer` | Generate job descriptions, content |
| Predictive Hiring | `/predictive-hiring` | Predict hiring success |

### Communication & Scheduling

| Feature | Route | Description |
|---------|-------|-------------|
| Unified Inbox | `/unified-inbox` | Centralized messaging |
| Email Templates | `/email-templates` | Pre-built email templates |
| Scheduling | `/scheduling` | Interview scheduling |
| Self-Scheduling | `/self-scheduling` | Candidate self-service booking |

### Sourcing

| Feature | Route | Description |
|---------|-------|-------------|
| Talent CRM | `/talent-crm` | CRM for talent management |
| Candidate Sourcing | `/candidate-sourcing` | Multi-channel sourcing |

### Analytics & Reporting

| Feature | Route | Description |
|---------|-------|-------------|
| Analytics | `/analytics` | Business recruitment analytics |
| Custom Reports | `/custom-reports` | Build custom dashboards |
| Diversity Analytics | `/diversity-analytics` | DEI metrics |
| Predictive Analytics | `/predictive-analytics` | Forecast hiring needs |
| Predictive Hiring | `/predictive-hiring` | Success prediction |
| Workforce Planning | `/workforce-planning` | Headcount planning |

### Compliance & Governance

| Feature | Route | Description |
|---------|-------|-------------|
| Audit Trail | `/audit-trail` | Track all actions |
| B-BBEE | `/bbbee` | B-BBEE compliance reporting |
| POPIA Compliance | `/popia-compliance` | Data protection compliance |
| Employment Equity | `/employment-equity` | EE statutory reporting |
| Approvals | `/approvals` | Configurable approval workflows |

### Settings & Configuration

| Feature | Route | Description |
|---------|-------|-------------|
| Settings | `/settings` | Company-wide settings |
| SSO Config | `/sso-config` | Single sign-on configuration |
| Profile | `/profile` | Company profile |
| Billing | `/billing` | Subscription and payments |
| Vendors | `/vendors` | Manage third-party vendor relationships |

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

| Capability | Recruiter | Business |
|------------|-----------|----------|
| Client management | Yes (managing Business clients) | No |
| Placement fees | Earns fees | Pays fees |
| Internal HR | No | Yes (HRIS, workforce planning, succession) |
| Team management | Agency team | HR team with approval workflows |
| SSO | No | Yes |
| Vendor management | No | Yes (manages Recruiter vendors) |

See [[06-comparisons/user-type-comparison]] for the full matrix.

## Open Questions

- How does the Business-Recruiter vendor relationship get established? Does the Business invite recruiters, or do recruiters request access?
- What's the SSO provider support? (SAML, OIDC, specific providers?)
- How does workforce planning integrate with job posting?

## References

- [[01-entities/individual-user]] — Job seekers who apply to Business jobs
- [[01-entities/recruiter-user]] — Agencies that submit candidates to Businesses
- [[02-concepts/multi-tenancy]] — Organization model
- [[02-concepts/rbac]] — Permission system for team members
- [[02-concepts/application-lifecycle]] — Hiring flow
- [[02-concepts/compliance]] — B-BBEE, POPIA, EE requirements
- [[06-comparisons/user-type-comparison]] — Feature comparison
- Source: [[09-sources/repo-audit-2026-04-07]]
