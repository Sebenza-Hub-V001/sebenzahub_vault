---
title: "Recruiter Journey: Signup → Placement Fee"
type: concept
created: 2026-04-07
updated: 2026-04-07
tags: [workflow, recruiter, journey, placement, revenue]
sources: [repo-audit-2026-04-07]
status: active
confidence: high
---

# Recruiter Journey: Signup → Placement Fee

The complete end-to-end journey of a recruitment agency on Sebenza Hub, from signup to earning placement fees.

## Step 1: Signup & Onboarding

```
Enter email → magic link → verify → /onboarding
    ↓
Select "Recruiter" role
    ↓
OnboardingRecruiter form:
  ├─ Agency name (required)
  ├─ Website, email, phone
  ├─ Sectors (multi-select from industries)
  └─ Verification proof URL (optional B-BBEE/POPIA docs)
    ↓
System creates:
  ├─ recruiterProfiles record
  ├─ organizations record (type = "agency")
  └─ memberships record (user as owner)
    ↓
Redirect to /dashboard/recruiter/profile
```

## Step 2: Build Agency Profile

```
/dashboard/recruiter/profile
    ↓
Complete rich profile (60+ fields):
  ├─ Agency branding (logo, cover photo, description)
  ├─ Team members (invite via /roles)
  ├─ Credentials (certifications, awards, languages)
  ├─ Performance stats (placements, success rate, time-to-fill)
  ├─ Commercial terms (fee %, payment terms, guarantee period)
  ├─ B-BBEE level + POPIA compliance declaration
  ├─ Video introduction (AI-analyzed)
  ├─ Case studies (challenge → approach → result)
  └─ Request client testimonials (smart testimonial engine)
    ↓
AI Profile Coach generates improvement suggestions
    ↓
Trust tier starts at Bronze → earn upgrades via activity
```

## Step 3: Add Corporate Clients

```
/dashboard/recruiter/clients
    ↓
POST /api/corporate-clients
  ├─ Company name, industry, tier, status
  ├─ Add contacts (multiple per client)
  └─ Set engagement terms:
      ├─ Fee structure (% / fixed / hybrid)
      ├─ Payment terms (upfront / 50-50 / on-placement)
      └─ Guarantee period
    ↓
Track client relationship:
  ├─ /client-pipeline — Opportunities with this client
  ├─ Call notes — Log interactions
  ├─ Client meetings — Schedule check-ins
  ├─ Client documents — Contracts, NDAs
  └─ Client satisfaction — NPS surveys
```

## Step 4: Post Jobs (for Clients)

```
/dashboard/recruiter/jobs → Create Job
    ↓
Define job:
  ├─ Title, description, requirements
  ├─ Salary range, benefits, location
  ├─ Skills required (must-have / nice-to-have)
  ├─ Employment type, experience level
  └─ AI JD Writer can generate description from brief
    ↓
Publish → Job visible to Individuals on job board
    ↓
Configure screening:
  ├─ Screening criteria (knockout questions, weights)
  ├─ Screening chatbot template
  ├─ Assessment bundle (competency tests)
  └─ WhatsApp Apply (optional)
```

## Step 5: Source Candidates

```
Multiple sourcing channels:
    ↓
┌─ Direct applications ───────────────────┐
│  Individuals apply through job board     │
│  → Auto AI-scored (aiMatchScore)         │
└──────────────────────────────────────────┘
    ↓
┌─ AI Search & Discovery ─────────────────┐
│  /ai-search — Natural language search    │
│  /talent-discovery — Find passive talent │
│  /talent-rediscovery — Re-engage past    │
│  /candidate-sourcing — Multi-channel     │
└──────────────────────────────────────────┘
    ↓
┌─ LinkedIn Leads ─────────────────────────┐
│  /linkedin-leads — Import from LinkedIn  │
│  AI scores and enriches leads            │
│  Nurture sequences (email/WA/LinkedIn)   │
│  Convert to candidate when qualified     │
└──────────────────────────────────────────┘
    ↓
┌─ Talent Pool ────────────────────────────┐
│  /talent-pool — Segmented candidate pools│
│  /talent-crm — Full CRM relationship mgmt│
└──────────────────────────────────────────┘
```

See [[01-entities/linkedin-integration]] for LinkedIn details.

## Step 6: Screen & Evaluate

```
/dashboard/recruiter/pipeline (Kanban view)
    ↓
Screening stage:
  ├─ AI auto-screens CVs (scoring + knockout detection)
  ├─ Screening chatbot interviews candidates
  ├─ Send competency tests (from test library)
  ├─ Order background checks
  ├─ Blind hiring mode (hide demographics)
  └─ Scorecard evaluation
    ↓
Compare candidates:
  ├─ /comparison — Side-by-side comparison matrix
  ├─ /scorecards — Structured evaluation forms
  ├─ /culture-fit — Culture alignment analysis
  └─ /ranking — AI-powered ranking
```

See [[01-entities/screening-system]] for details.

## Step 7: Interview

```
/dashboard/recruiter/scheduling
    ↓
Schedule:
  ├─ Calendar integration (Google, Zoom, Teams)
  ├─ Self-scheduling links for candidates
  ├─ Interview kits (structured guides)
  └─ Panel templates (interviewer assignments)
    ↓
Conduct:
  ├─ Video interviews (async or live)
  ├─ Video analysis (AI performance scoring)
  ├─ Fill scorecards during/after
  └─ Collect hiring manager feedback
```

## Step 8: Make Offer

```
/dashboard/recruiter/offers
    ↓
Create offer:
  ├─ From template or custom
  ├─ Salary, benefits, start date, conditions
  ├─ Compliance check (auto-validates against pay bands, EE, B-BBEE)
  ├─ Benchmark against market data
  └─ AI predicts acceptance probability
    ↓
Approval workflow:
  ├─ Route through approval chain (manager → dept head → exec)
  ├─ Each approver has max authorized amount
  └─ Delegation and escalation supported
    ↓
Send to candidate → Track: viewed, accepted, negotiation, declined
    ↓
Negotiation (if needed):
  ├─ Counter-offer rounds with communication logging
  ├─ Sentiment analysis on conversations
  ├─ AI negotiation strategy and coaching
  └─ Compensation package tracking per round
```

See [[01-entities/offer-system]] for details.

## Step 9: Placement & Revenue

```
Candidate accepts offer → status = "Hired"
    ↓
Record placement:
  ├─ /placements — Track start date, retention
  └─ Placement linked to client engagement
    ↓
Earn placement fee:
  ├─ POST /api/corporate-clients/{clientId}/revenue
  ├─ Revenue type: placement_fee
  ├─ Amount based on engagement terms (% of salary or fixed)
  └─ Status: pending → confirmed
    ↓
Track on KPI Dashboard:
  ├─ /kpi-dashboard — Revenue, placements, time-to-fill
  ├─ /analytics — Recruitment performance metrics
  └─ /predictive-analytics — Forecast future revenue
```

## Step 10: Ongoing Relationship

```
Post-placement:
  ├─ Check-in with placed candidate (via call notes)
  ├─ Client satisfaction survey
  ├─ Retention monitoring (guarantee period)
  └─ Request testimonials and case studies
    ↓
Re-engage talent pool:
  ├─ /re-engagement — Win back passive candidates
  ├─ /sequences — Automated nurture campaigns
  └─ /recruitment-marketing — Employer brand campaigns
```

## Revenue Model Summary

```
Recruiter sources Individual
    → Submits to Business client's job
    → Business interviews and hires
    → Recruiter earns fee (tracked in clientRevenue)
    → Fee types: percentage of salary, fixed, hybrid
    → Payment: upfront, 50/50, or on-placement
```

## References

- [[01-entities/recruiter-user]] — Full feature list
- [[01-entities/individual-user]] — Candidates being sourced
- [[01-entities/business-user]] — Client companies
- [[01-entities/offer-system]] — Offer management
- [[01-entities/screening-system]] — Screening tools
- [[01-entities/linkedin-integration]] — LinkedIn sourcing
- [[02-concepts/application-lifecycle]] — Pipeline stages
