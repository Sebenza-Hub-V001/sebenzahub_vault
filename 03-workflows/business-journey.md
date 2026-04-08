---
title: "Business Journey: The Complete Employer Experience"
type: concept
created: 2026-04-07
updated: 2026-04-08
tags: [workflow, business, journey, hiring, employer, hr, vendor, compliance]
sources: [repo-audit-2026-04-07, business-journey-gap-analysis]
status: active
confidence: high
user-types: [business]
dashboard-path: /dashboard/business/*
---

# Business Journey: The Complete Employer Experience

The complete experience of an employer on Sebenza Hub — from signup through hiring (directly or via Recruiter vendors) to managing your workforce long-term. The **hiring path** (Steps 1–7) is the primary journey. **Parallel tracks** handle the operational breadth: sourcing beyond the job board, vendor management, communication at scale, and workforce planning. These activate at specific pressure points — a role that won't fill, a vendor underperforming, a compliance audit.

```
                    ┌───────────────────────────────────────────────┐
                    │           HIRING PATH (Steps 1–7)             │
                    │  Signup → Configure → Post → Receive →       │
                    │  Screen → Interview → Offer                   │
                    └───────┬──────────┬──────────┬────────────────┘
                            │          │          │
               ┌────────────┘    ┌─────┘    ┌─────┘
               ▼                 ▼          ▼
      ┌────────────────┐ ┌───────────┐ ┌──────────────┐
      │ Vendor Mgmt &  │ │ Comms &   │ │ Compliance   │
      │ Active Sourcing│ │ Automation│ │ & Governance  │
      │ (to fill roles)│ │ (at scale)│ │ (always on)   │
      └───────┬────────┘ └─────┬─────┘ └──────┬───────┘
              │                │               │
              └────────────────┼───────────────┘
                               ▼
                     ┌─────────────────────┐
                     │  Workforce & HR     │
                     │  (post-hire loop)   │
                     └─────────────────────┘
```

---

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

See [[02-concepts/authentication]] for technical details.

## Step 2: Configure Organization

```
/dashboard/business/settings
    ↓
Company settings:
  ├─ /profile — Company profile (logo, description, website)
  ├─ /sso-config — SSO configuration (if enterprise — SAML/OIDC)
  ├─ Interview settings (calendar provider, video, working hours, timezone)
  ├─ Compliance settings (EE data capture, POPIA consent text, data retention)
  └─ Integration settings (Slack webhook, ATS provider via /hris-integration)
    ↓
Build team:
  /dashboard/business/team
  ├─ Invite HR managers, hiring managers
  ├─ Assign roles (owner, admin, manager, viewer, recruiter)
  ├─ Set granular permissions per role
  └─ Custom role definitions per organization
```

See [[02-concepts/multi-tenancy]] and [[02-concepts/rbac]] for details.

## Step 3: Post Jobs

```
/dashboard/business/jobs → Create Job
    ↓
Define job:
  ├─ Title, description, requirements
  ├─ Salary range, benefits, location
  ├─ Skills (must-have / nice-to-have)
  ├─ Employment type, experience level
  ├─ /ai-writer → AI generates JD from brief
  └─ Import from Word doc template
    ↓
Configure screening criteria:
  ├─ /screening-roles — Pre-configured screening criteria per role type
  ├─ /screening-bot — Chatbot template for auto-screening
  ├─ /interview-kits — Structured interview guides
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
│ → Auto AI-scored (aiMatchScore)      │
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
  ├─ /screening-bot → AI chatbot screens candidates automatically
  ├─ /video-interviews → Async video screening (candidates record responses)
  ├─ /scorecards → Structured evaluation forms
  ├─ /background-checks → Background verification
  └─ AI screens and scores all applicants (knockout detection)
    ↓
Shortlist candidates → move to Interview stage
```

See [[01-entities/screening-system]] for details.

## Step 6: Interview

```
/dashboard/business/scheduling
    ↓
Schedule interviews:
  ├─ Calendar integration (Google, Zoom, Teams)
  ├─ /self-scheduling → Candidates book their own slots
  ├─ /interview-kits → Structured guides for interviewers
  └─ Panel assignments
    ↓
Conduct & evaluate:
  ├─ /video-interviews → Live or async video
  ├─ /scorecards → Fill during/after interview
  ├─ /ai-questions → AI generates role-specific questions
  └─ Hiring manager feedback collected in pipeline
```

## Step 7: Make Offer

```
/dashboard/business/offers
    ↓
Create offer:
  ├─ /offer-templates → Select pre-built template or create custom
  ├─ Salary, benefits, start date, conditions
  ├─ /predictive-hiring → AI predicts acceptance probability
  └─ Compliance check (auto-validates EE, B-BBEE, pay bands)
    ↓
Approval workflow (/offer-approvals):
  ├─ Route through approval chain (manager → dept head → exec)
  ├─ Configurable per role level or salary threshold
  └─ Tracked with timestamps
    ↓
/offer-letters → Generate branded letter with dynamic fields
    ↓
Send to candidate → track response
    ↓
If accepted → Hired! 🎉 → trigger onboarding
If negotiation → counter-offer rounds
If declined → back to pipeline
```

See [[01-entities/offer-system]] for full lifecycle details.

---

# Parallel Tracks

These tracks run alongside the hiring path. They activate at pressure points specific to employers — a role that won't fill through the job board alone, vendor agencies underperforming, compliance deadlines, or workforce planning for the next quarter.

---

## Track A: Vendor Management & Active Sourcing — "The job board isn't enough"

Businesses can hire directly (Steps 3–7) or through Recruiter vendors. This track activates when direct applications aren't sufficient, or when you want to proactively source rather than wait.

### Scenario: You posted a role 3 weeks ago and have 5 weak applicants

```
Direct applications aren't cutting it → two paths:
    ↓
PATH 1: Bring in a Recruiter vendor
  /vendors → Manage third-party recruiter relationships
    ├─ Browse available recruiters (with DNA Cards, trust tiers, placement stats)
    ├─ Invite a recruiter to work your role
    ├─ Set engagement terms (fee %, payment terms, guarantee)
    └─ Track their submissions vs direct applications
      ↓
  Recruiter sources candidates → submits to your job
    ├─ Submissions appear in your /pipeline tagged as "agency"
    ├─ You evaluate alongside direct applicants — same scorecards, same process
    └─ If hired → recruiter earns placement fee
      ↓
  Monitor vendor performance:
    ├─ Submission-to-interview ratio (quality signal)
    ├─ Time-to-submit (speed signal)
    └─ Placement success rate → decide whether to renew engagement
    ↓
PATH 2: Source candidates yourself
  /candidate-sourcing → Multi-channel sourcing tools
    ├─ /ai-search → Natural language: "senior accountant in Pretoria, SAICA qualified"
    ├─ /talent-crm → Build relationships with passive candidates over time
    └─ Browse candidate database with filters
      ↓
  Found someone promising?
    ├─ Invite to apply → enters your pipeline
    └─ Add to talent CRM for future roles
```

### Scenario: Your recruiter vendor isn't delivering

```
Recruiter submitted 10 candidates, you interviewed 1, hired 0
    ↓
/vendors → Review performance data:
  ├─ This recruiter's submission quality: 10% interview rate (low)
  ├─ Compare to other vendors: average is 40% interview rate
  └─ Are they sending the wrong profiles, or is your brief unclear?
    ↓
Decision:
  ├─ Brief is unclear → rewrite JD with /ai-writer, share updated brief
  ├─ Recruiter mismatch → disengage, try a different vendor
  └─ Market is thin → /predictive-analytics → "Limited talent pool in this location"
      → consider remote hiring or adjust requirements
```

### Direct Hire vs. Through Recruiter — decision framework:

| Factor | Go Direct | Use Recruiter |
|--------|-----------|---------------|
| Role type | Junior / high-volume | Senior / specialist / urgent |
| Applicant flow | Strong inbound | Weak inbound |
| Internal team | Has dedicated HR | No sourcing capacity |
| Cost sensitivity | High (no fees) | Can absorb placement fee |
| Speed needed | Standard | Urgent |

---

## Track B: Communication & Automation — "We're losing candidates to slow responses"

Employers compete for candidates with response time. These tools prevent the most common failure: candidates going cold because nobody replied for a week.

### Scenario: Candidates drop out before you even interview them

```
/analytics shows: 30% of shortlisted candidates withdraw before interview
    ↓
Root cause: average time from application to first contact = 8 days
    ↓
/email-templates → Create templates for instant responses:
  ├─ Application received (auto-send on apply)
  ├─ Shortlisted — scheduling interview (auto-send on stage change)
  ├─ Not progressing (rejection with feedback)
  └─ Offer details
    ↓
/screening-bot → Deploy on your job listings:
  ├─ Engages every applicant within minutes (24/7)
  ├─ Asks qualifying questions, scores responses
  └─ Qualified candidates auto-move to screening stage
    ↓
Result: first contact drops from 8 days to same-day
  → withdrawal rate drops → more candidates reach interview
```

### Scenario: Your hiring team is spread across email, WhatsApp, and the platform

```
HR manager messaged a candidate on WhatsApp
Hiring manager emailed the same candidate separately
Neither knows what the other said
    ↓
/unified-inbox → Single view of ALL candidate communications
  ├─ Email, WhatsApp, platform messages — one thread per candidate
  ├─ Every message logged to candidate profile
  └─ Any team member can see full context before reaching out
    ↓
/approvals → Automate decision routing:
  ├─ "When hiring manager approves → auto-send interview invite"
  ├─ "When offer exceeds R50K → route to finance for approval"
  └─ No more "did anyone follow up with that candidate?"
```

---

## Track C: Compliance & Governance — "The audit is next quarter"

South African employers face ongoing compliance obligations. These tools run in the background but become critical at audit time or when handling sensitive data requests.

### Scenario: Annual EE report due to Department of Labour

```
/employment-equity → Employment Equity reporting:
  ├─ Hiring demographics by occupational level
  ├─ Representation across your workforce
  ├─ Progress against EE targets
  └─ Generate Department of Labour-ready report
    ↓
/diversity-analytics → Full-funnel DEI view:
  ├─ Where diverse candidates drop off in your pipeline
  ├─ Stage-by-stage demographic breakdown
  └─ "20% of applicants are female, but only 8% reach offer stage" → investigate
    ↓
Already tracking? → Because compliance settings (Step 2) captured EE data
  └─ POPIA consent text configured → data collection is lawful
```

### Scenario: Employee raises a POPIA concern

```
"I want to know what data you hold on me from when I applied"
    ↓
/popia-compliance → POPIA tools:
  ├─ Consent records — when, what, how consent was given
  ├─ Data inventory — every field stored
  ├─ Data retention policy — what's due for deletion
  └─ Generate data subject access report
    ↓
/audit-trail → Immutable action log:
  ├─ Every profile view, every stage change, every message
  └─ Evidence-grade trail for regulatory response
```

### Scenario: B-BBEE scorecard needs recruitment data

```
/bbbee → B-BBEE compliance tracking:
  ├─ B-BBEE status of recent hires
  ├─ Transformation contribution from hiring
  └─ Generate report for company's B-BBEE scorecard submission
```

See [[02-concepts/compliance]] for POPIA, B-BBEE, and Employment Equity details.

---

## Track D: Workforce & HR — "We hired them, now what?"

This track is **unique to Business users**. Recruiters and Individuals don't have these features. It activates post-hire and runs continuously as your workforce evolves.

### Scenario: Your CFO leaves — who's ready to step up?

```
/succession-planning → Identify replacement candidates:
  ├─ Map critical roles and who could fill them
  ├─ Gap analysis: what does each successor need to develop?
  └─ Link to internal mobility or external hiring
    ↓
/internal-job-board → Post the role internally first:
  ├─ Visible only to current employees
  ├─ Internal candidates apply through the same pipeline
  └─ If no internal fit → promote externally (back to Step 3)
    ↓
/workforce-planning → Plan the downstream impact:
  ├─ If you promote internally, you now have ANOTHER vacancy
  ├─ Forecast headcount needs for the quarter
  └─ Budget impact of backfill hiring
```

### Scenario: You have 15 contractors and no visibility

```
/contract-workers → Manage contractors and temps:
  ├─ Track contract start/end dates, renewal status
  ├─ Monitor cost vs permanent hire
  └─ Flag contracts approaching expiry
    ↓
Decision: renew, convert to permanent, or end?
  ├─ Convert to permanent → create offer (Step 7)
  ├─ Renew → extend contract terms
  └─ End → plan replacement if role still needed
```

### Scenario: You want to understand team composition before hiring

```
/team-dna → Team composition analysis:
  ├─ Skills distribution across your team
  ├─ Diversity metrics within the team
  ├─ Working style and strength analysis
  └─ "Your team is heavy on execution, light on strategy"
    ↓
Next hire decision:
  ├─ Hire for complement (fill the strategy gap)
  ├─ Not just "who has the right skills" but "who makes the team better"
  └─ Feed this into the JD when posting the role (Step 3)
```

### Scenario: Performance reviews reveal skill gaps across the org

```
/performance → Track employee performance:
  ├─ Review cycles, ratings, feedback
  ├─ Identify underperformers and high-potentials
  └─ Skill gaps surfaced across teams
    ↓
Response options:
  ├─ Training → (no learning hub for Business — consider external)
  ├─ Hire for the gap → back to Step 3
  └─ Restructure → /workforce-planning
    ↓
/hris-integration → Sync with external HR systems:
  ├─ Push hire data to payroll/HRIS
  ├─ Pull org structure into Sebenza Hub
  └─ Keep both systems in sync
```

---

## Supporting Infrastructure

### Analytics (`/analytics`, `/custom-reports`, `/predictive-analytics`)

Recruitment metrics (time-to-hire, cost-per-hire, pipeline conversion), custom dashboards, and predictive forecasting. These feed into every parallel track but don't drive their own narrative — they're the data layer.

### Billing (`/billing`)

Subscription and payment management. See [[02-concepts/billing-system]].

### Settings (`/settings`, `/sso-config`)

Company-wide configuration: team members, permissions, SSO, integrations, compliance settings. Covered in Step 2 but revisited as the org grows.

---

## How It All Connects

```
HIRING PATH:  Signup → Config → Post → Receive → Screen → Interview → Offer
                │         │       │       │         │         │          │
                │         │       │       │         │         │          │
VENDOR/SOURCE:  │      Vendors  AI JD   Recruiter  │         │       Predict
                │         │     Writer   Submits    │         │       Accept
                │         │       │     AI Search   │         │          │
                │         │       │       │         │         │          │
COMMUNICATION:  │       Email     │     Screening  Unified  Self-     Offer
                │      Templates  │       Bot      Inbox   Schedule  Letter
                │         │       │       │         │         │          │
COMPLIANCE:     │      EE/POPIA   │       │       Audit     │       Offer
                │      Settings   │       │       Trail     │      Approve
                │         │       │       │         │         │          │
                ▼         ▼       ▼       ▼         ▼         ▼          ▼
              [Hire] → Onboard → Performance → Succession → Workforce Plan
                                    │              │              │
                              TRACK D: WORKFORCE & HR (post-hire loop)
```

## Key Touchpoints with Other User Types

| Stage | Interacts With |
|-------|---------------|
| Job posted | [[01-entities/individual-user]] (sees listing) + [[01-entities/recruiter-user]] (sees mandate) |
| Direct application | Individual |
| Recruiter submission | Recruiter (vendor) |
| Interview | Individual (candidate) |
| Offer | Individual + internal approvers |
| Vendor management | [[01-entities/recruiter-user]] |
| Platform moderated | [[01-entities/admin-user]] |

## References

- [[01-entities/business-user]] — Full feature list and data model
- [[01-entities/recruiter-user]] — Vendor agencies
- [[01-entities/individual-user]] — Candidates
- [[01-entities/offer-system]] — Offer lifecycle
- [[01-entities/screening-system]] — Screening tools
- [[02-concepts/application-lifecycle]] — Pipeline stages
- [[02-concepts/multi-tenancy]] — Organization model
- [[02-concepts/rbac]] — Permission system
- [[02-concepts/compliance]] — POPIA, B-BBEE, Employment Equity
- [[02-concepts/ai-features]] — AI tools for Business
- [[02-concepts/billing-system]] — Billing architecture
- [[09-sources/business-journey-gap-analysis-2026-04-08]] — Gap analysis that prompted this rewrite
