---
title: "Business Journey: Signup → Hire"
type: concept
created: 2026-04-07
updated: 2026-04-07
tags: [workflow, business, journey, hiring, employer]
sources: [repo-audit-2026-04-07]
status: active
confidence: high
---

# Business Journey: Signup → Hire

The complete end-to-end journey of an employer on Sebenza Hub, from signup to making a hire — either directly or through a Recruiter vendor.

## Step 1: Signup & Onboarding (Lightest of All Roles)

```
Enter email → magic link → verify → /onboarding
    ↓
Select "Business" role
    ↓
OnboardingBusiness form (minimal):
  ├─ First name, last name, phone
  └─ Company name, industry, sub-industry
    ↓
System creates:
  ├─ User updated (role = "business", onboardingComplete = true)
  ├─ organizations record (type = "employer")
  └─ Default membership (user as owner)
    ↓
Redirect to /dashboard/business/home
```

## Step 2: Configure Organization

```
/dashboard/business/settings
    ↓
Company settings:
  ├─ Company profile (logo, description, website)
  ├─ SSO configuration (/sso-config) — if enterprise
  ├─ Interview settings (calendar provider, video, working hours, timezone)
  ├─ Compliance settings (EE data capture, POPIA consent text, data retention)
  └─ Integration settings (Slack webhook, ATS provider)
    ↓
Build team:
  /dashboard/business/team
  ├─ Invite HR managers, hiring managers
  ├─ Assign roles (owner, admin, manager, viewer)
  ├─ Set granular permissions per role
  └─ Custom role definitions
```

See [[concepts/multi-tenancy]] and [[concepts/rbac]] for details.

## Step 3: Post Jobs

```
/dashboard/business/jobs → Create Job
    ↓
Define job:
  ├─ Title, description, requirements
  ├─ Salary range, benefits, location
  ├─ Skills (must-have / nice-to-have)
  ├─ Employment type, experience level
  ├─ AI Writer generates JD from brief (/ai-writer)
  └─ Import from Word doc template
    ↓
Configure screening criteria:
  ├─ Screening bot template
  ├─ Interview kits
  └─ Assessment bundles
    ↓
Publish → Job visible on:
  ├─ Sebenza Hub job board (Individuals see it)
  ├─ Recruiter dashboards (if using vendor agencies)
  └─ External job boards (via integrations)
```

## Step 4: Receive Applications (Two Channels)

```
Channel 1: Direct Applications
┌──────────────────────────────────────┐
│ Individuals apply directly           │
│ → Auto AI-scored                     │
│ → Appear in /applications            │
└──────────────────────────────────────┘

Channel 2: Recruiter Submissions
┌──────────────────────────────────────┐
│ Recruiter vendors source candidates  │
│ → Submit to Business's job           │
│ → Appear alongside direct apps       │
│ → Source tagged as "agency"           │
└──────────────────────────────────────┘
    ↓
All applications visible in:
  /dashboard/business/applications
  /dashboard/business/pipeline (Kanban)
```

## Step 5: Screen & Evaluate

```
/dashboard/business/pipeline
    ↓
Screening:
  ├─ /screening-bot — AI chatbot screens candidates
  ├─ /screening-roles — Pre-configured screening criteria
  ├─ /video-interviews — Async video screening
  ├─ /scorecards — Evaluation forms
  └─ /background-checks — Verification
    ↓
Shortlist candidates → move to Interview stage
```

## Step 6: Interview

```
/dashboard/business/scheduling
    ↓
Schedule interviews:
  ├─ Calendar integration
  ├─ Self-scheduling links for candidates
  ├─ Interview kits with structured guides
  └─ Panel assignments
    ↓
Conduct & evaluate:
  ├─ Video interviews (live or async)
  ├─ Fill scorecards
  ├─ AI generates interview questions (/ai-questions)
  └─ Hiring manager feedback via portal
```

## Step 7: Make Offer

```
/dashboard/business/offers
    ↓
Create offer:
  ├─ From template or custom
  ├─ Salary, benefits, start date
  ├─ Route through approval chain (/approvals)
  └─ Compliance check (auto)
    ↓
Send to candidate → track response
    ↓
If accepted → Hired! 🎉
If negotiation → counter-offer rounds
If declined → back to pipeline
```

## Step 8: Post-Hire (HR Features)

Business users have unique HR capabilities:

```
After hiring:
  ├─ /performance — Track employee performance
  ├─ /succession-planning — Identify replacement candidates
  ├─ /workforce-planning — Plan future headcount
  ├─ /internal-job-board — Post internal-only positions
  ├─ /contract-workers — Manage contractors
  └─ /hris-integration — Sync with external HR systems
```

## Step 9: Analytics & Compliance

```
Ongoing:
  ├─ /analytics — Recruitment metrics (time-to-hire, cost-per-hire)
  ├─ /diversity-analytics — DEI metrics
  ├─ /predictive-analytics — Forecast hiring needs
  ├─ /custom-reports — Build custom dashboards
  ├─ /bbbee — B-BBEE compliance tracking
  ├─ /employment-equity — EE reporting
  ├─ /popia-compliance — Data protection
  └─ /audit-trail — Full action history
```

## Direct Hire vs. Through Recruiter

| Aspect | Direct Hire | Via Recruiter |
|--------|------------|---------------|
| Job posted by | Business | Business (or Recruiter on behalf) |
| Candidates sourced by | Self (job board, AI search) | Recruiter (sourcing, LinkedIn, talent pool) |
| Applications appear in | Business pipeline | Business pipeline (tagged as agency) |
| Screening by | Business team | Recruiter (pre-screened) or Business |
| Fee | None | Placement fee to Recruiter |
| Vendor management | N/A | `/vendors` page to track Recruiter performance |

## References

- [[entities/business-user]] — Full feature list
- [[entities/recruiter-user]] — Vendor agencies
- [[entities/individual-user]] — Candidates
- [[entities/offer-system]] — Offer management
- [[entities/screening-system]] — Screening tools
- [[concepts/application-lifecycle]] — Pipeline stages
- [[concepts/multi-tenancy]] — Organization model
- [[concepts/compliance]] — SA compliance requirements
