---
title: "Recruiter Journey: The Complete Agency Experience"
type: concept
created: 2026-04-07
updated: 2026-04-08
tags: [workflow, recruiter, journey, placement, revenue, analytics, compliance, brand]
sources: [repo-audit-2026-04-07, recruitment-features-2026-04-07, recruiter-journey-gap-analysis]
status: active
confidence: high
user-types: [recruiter]
dashboard-path: /dashboard/recruiter/*
---

# Recruiter Journey: The Complete Agency Experience

The complete experience of a recruitment agency on Sebenza Hub — from signup through sourcing, placing, and building a sustainable agency business. The **recruitment path** (Steps 1–10) is the primary journey. **Parallel tracks** run alongside it: communication at scale, analytics, compliance, and brand building. These tracks activate at specific pressure points — candidate ghosting, a compliance audit, declining fill rates — and feed back into the recruitment path.

```
                    ┌───────────────────────────────────────────────────┐
                    │           RECRUITMENT PATH (Steps 1–10)           │
                    │  Signup → Profile → Clients → Jobs → Source →    │
                    │  Screen → Interview → Offer → Place → Retain     │
                    └───────┬──────────┬──────────┬──────────┬─────────┘
                            │          │          │          │
               ┌────────────┘    ┌─────┘    ┌─────┘    ┌────┘
               ▼                 ▼          ▼          ▼
      ┌────────────────┐ ┌───────────┐ ┌──────────┐ ┌──────────────┐
      │ Communication  │ │ Analytics │ │Compliance│ │Brand & Growth│
      │ & Automation   │ │ & Intel   │ │& Govern. │ │              │
      │ (at scale)     │ │ (on data) │ │ (always) │ │ (to attract) │
      └───────┬────────┘ └─────┬─────┘ └────┬─────┘ └──────┬───────┘
              │                │             │              │
              └────────────────┼─────────────┼──────────────┘
                               ▼
                     ┌─────────────────────┐
                     │   Revenue Engine    │
                     │   (the business)    │
                     └─────────────────────┘
```

---

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

See [[02-concepts/authentication]] for technical details.

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

**AI-generated profile assets:**
- **DNA Card** — speed, quality, diversity, retention scores (0–100)
- **Reputation Score** — NPS, satisfaction, responsiveness breakdown
- **Competitive Benchmarking** — percentile ranking vs sector peers
- **Capacity Signal** — Available / Limited / At Capacity per sector

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
  └─ Collect hiring manager feedback via /hiring-manager-portal
```

## Step 8: Make Offer

```
/dashboard/recruiter/offers
    ↓
Create offer:
  ├─ From template or custom (/offer-templates)
  ├─ Salary, benefits, start date, conditions
  ├─ Compliance check (auto-validates against pay bands, EE, B-BBEE)
  ├─ Benchmark against market data (/offer-benchmarking)
  └─ AI predicts acceptance probability (/offer-predictor)
    ↓
Approval workflow (/offer-approvals):
  ├─ Route through approval chain (manager → dept head → exec)
  ├─ Each approver has max authorized amount
  └─ Delegation and escalation supported
    ↓
Send to candidate → Track on /offer-timeline: viewed, accepted, negotiation, declined
    ↓
Negotiation (if needed) via /offer-negotiation:
  ├─ Counter-offer rounds with communication logging
  ├─ Sentiment analysis on conversations
  ├─ AI negotiation strategy and coaching
  ├─ Compensation package tracking per round
  └─ /offer-compare — model different package scenarios
    ↓
/offer-analytics — Track acceptance rates, time-to-accept, decline reasons
/offer-compliance — Auto-validate legal and policy requirements
```

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
  ├─ Request testimonials and case studies
  └─ /referrals — Leverage placed candidates for referrals
    ↓
Re-engage talent pool:
  ├─ /re-engagement — Win back passive candidates
  ├─ /sequences — Automated nurture campaigns
  └─ /recruitment-marketing — Employer brand campaigns
    ↓
Post-hire onboarding:
  ├─ Create onboarding checklists for placed candidates
  ├─ Assign tasks to client HR/IT/managers
  ├─ Send welcome materials, collect documents
  └─ Track completion before day one
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

---

# Parallel Tracks

These tracks run alongside the recruitment path. They activate at pressure points — not as steps you walk through in order, but as responses to what's happening in your agency.

---

## Track A: Communication & Automation — "I'm drowning in admin"

Recruiters send 50–100 messages per day across email, WhatsApp, and platform inbox. These tools prevent that from consuming your entire day.

### Scenario: Candidates are going cold between stages

```
Pipeline shows 12 candidates stuck in "Screening" for 5+ days
    ↓
What's happening? Candidates aren't hearing from you.
    ↓
/sequences → Build an automated nurture sequence:
  ├─ Day 0: "Application received, here's what happens next"
  ├─ Day 3: "We're reviewing your profile — update on [date]"
  ├─ Day 7: "Still interested? Please confirm availability"
  └─ Exit rule: candidate moves to Interview stage → stop sequence
    ↓
/email-templates → Create templates for each stage transition
  ├─ Application acknowledgement
  ├─ Interview invitation
  ├─ Rejection (with tone analysis — AI catches unintended harshness)
  └─ Offer letter
    ↓
Result: candidates stay warm, response rate increases
```

### Scenario: You're managing 30 active candidates across WhatsApp and email

```
Messages scattered across WhatsApp, Gmail, platform inbox
    ↓
/unified-inbox → Single view of ALL candidate communications
  ├─ Email, SMS, WhatsApp, in-platform — all in one thread
  ├─ Every message logged to candidate profile automatically
  └─ Any team member can pick up a conversation with full context
    ↓
/smart-messaging → AI assists at speed:
  ├─ AI suggests responses based on conversation context
  ├─ Tone analysis prevents blunt rejections or overly casual exec outreach
  ├─ Sentiment detection flags disengaged candidates
  └─ Keyboard shortcuts for power users
    ↓
WhatsApp at scale:
  ├─ /whatsapp-command-center — Manage all WA conversations, assign to team
  └─ /whatsapp-campaigns — Bulk WA messages for job promotion or re-engagement
      (within WhatsApp Business API guidelines)
```

### Scenario: You want to eliminate repetitive tasks entirely

```
/workflow-automation → Build rules:
  ├─ "When candidate reaches Interview → send calendar invite + interview kit"
  ├─ "When job open 30 days with <5 applicants → escalate to manager"
  ├─ "When offer accepted → trigger onboarding checklist"
  └─ "When candidate inactive 6 months → add to re-engagement sequence"
    ↓
/chatbot → Deploy on career site:
  ├─ Answers candidate FAQs 24/7
  ├─ Guides through application process
  ├─ Collects initial information
  └─ Routes complex queries to a recruiter
    ↓
FEEDBACK LOOP: Less admin → more time on sourcing and client relationships
```

See [[02-concepts/whatsapp-integration]] for WhatsApp Business API details.

---

## Track B: Analytics & Intelligence — "Am I actually performing well?"

Analytics activate when something feels off — fill rates dropping, clients unhappy, revenue stalling — or when you need to prove ROI to leadership.

### Scenario: Your client asks "why is this role taking so long?"

```
/analytics → Recruitment analytics dashboard
  ├─ Time-to-fill for this role vs your average
  ├─ Pipeline conversion: 200 applicants → 15 screened → 3 interviewed → 0 offered
  └─ Bottleneck identified: massive drop at screening stage
    ↓
/requirement-check → Auto-audit the pipeline:
  ├─ "85% of applicants fail the SQL knockout question"
  ├─ "Salary band is 20% below market for this location"
  └─ Decision: relax SQL requirement OR increase salary → discuss with client
    ↓
/predictive-analytics → Forecast:
  ├─ "At current conversion rates, expect 6 more weeks to fill"
  ├─ "Expanding to remote candidates would 3x the qualified pipeline"
  └─ Present data to client → reset expectations or adjust brief
```

### Scenario: Your interview panels are inconsistent

```
Two interviewers scored the same candidate 4/5 and 2/5
    ↓
/panel-analysis → Review interviewer patterns:
  ├─ Interviewer A consistently scores 15% higher than team average
  ├─ Interviewer B scores lower on female candidates (bias flag)
  └─ Calibration needed — both interviewers need coaching
    ↓
/scorecards → Review evaluation criteria:
  ├─ Are criteria clear enough? Or too subjective?
  └─ Tighten scoring rubric → more consistent outcomes
    ↓
/diversity-analytics → Check full-funnel demographics:
  ├─ Application pool: 40% female
  ├─ Interview stage: 25% female ← drop-off here
  ├─ Offer stage: 20% female
  └─ Root cause: either biased screening or biased panels → investigate
```

### Scenario: You need to prove your agency's value to a client

```
Client review meeting coming up
    ↓
/kpi-dashboard → Pull your numbers:
  ├─ Placements this quarter, revenue generated
  ├─ Average time-to-fill vs industry benchmark
  ├─ Submission-to-interview ratio (quality signal)
  └─ Candidate NPS scores for this client's roles
    ↓
/team-dna → Show team composition analysis:
  ├─ Recruiter strengths, specialisations, capacity
  └─ "We assigned your fintech roles to our finance-specialist recruiter"
    ↓
/engagement-score → Show candidate engagement:
  ├─ Composite score: email opens, response times, assessment completion
  ├─ "Your roles had 85% candidate engagement — top quartile"
  └─ High engagement = your employer brand is strong
    ↓
/candidate-nps → Show candidate experience:
  ├─ NPS surveys after application, interview, offer stages
  └─ "92% of candidates rated the process positively"
    ↓
FEEDBACK LOOP: Data-backed client conversations → stronger relationships → more mandates
```

### Scenario: AI gives you a shortcut on every candidate

```
50 CVs to review for a senior role
    ↓
/ai-candidate-summary → AI generates one-page summaries:
  ├─ Key strengths, risk assessment, fit analysis
  ├─ Interview talking points, role requirement comparison
  └─ 10 seconds to read vs 7 minutes per full CV
    ↓
/ai-intelligence → Pattern-based insights surface:
  ├─ "3 candidates have competing offers — prioritise outreach"
  ├─ "This candidate's engagement score is declining — they may drop out"
  └─ "Skill gap detected: none of your shortlist has AWS certification"
    ↓
FEEDBACK LOOP: Faster decisions → faster fills → more revenue
```

See [[02-concepts/ai-features]] for the full AI capability map.

---

## Track C: Compliance & Governance — "The EE audit is next month"

South African recruitment has serious compliance requirements. These tools run continuously in the background, but they become urgent when an audit, a data request, or a regulatory change hits.

### Scenario: Department of Labour requests your EE report

```
/ee-reports → Employment Equity reporting:
  ├─ Hiring demographics by occupational level
  ├─ Pipeline representation at each stage
  ├─ Progress against EE targets
  └─ Generate Department of Labour-ready report
    ↓
/diversity → DEI metrics dashboard:
  ├─ Representation across all roles and clients
  ├─ Where diverse candidates drop off in your pipeline
  └─ Actionable recommendations to improve
    ↓
Already had data? → Because /blind-hiring was enabled at screening
  └─ Demographics were captured but hidden from evaluators until now
```

### Scenario: A candidate submits a POPIA data access request

```
Candidate emails: "I want to see all data you hold on me"
    ↓
/compliance → POPIA compliance tools:
  ├─ Consent records — when and what they consented to
  ├─ Data inventory — every field stored about this candidate
  ├─ Data retention policies — what's due for deletion
  └─ Generate data subject access report
    ↓
/audit-trail → Immutable action log:
  ├─ Search by candidate → see every action taken
  ├─ Who viewed their profile, when, from where
  ├─ Every message sent, every stage change
  └─ Evidence for regulatory response
```

### Scenario: A client questions whether your fee was legitimate

```
Client disputes the placement fee amount
    ↓
/audit-trail → Full history:
  ├─ Engagement terms agreed (date, amount, conditions)
  ├─ Candidate submission to this role (date, approval)
  ├─ Interview scheduling and feedback
  ├─ Offer creation, approval chain, acceptance
  └─ Every step documented — no "he said, she said"
    ↓
/approval-workflows → Show the approval chain:
  ├─ Who approved the offer, at what amount
  ├─ Delegation records if someone was out
  └─ Timestamped, immutable
    ↓
/bbbee → B-BBEE compliance:
  ├─ Your agency's B-BBEE level (Level 1–8)
  ├─ B-BBEE status of placed candidates
  └─ Transformation contribution reports for client's scorecard
```

See [[02-concepts/compliance]] for POPIA, B-BBEE, and Employment Equity details.

---

## Track D: Brand & Growth — "I need more candidates and clients"

Brand & Growth activates when your pipeline is thin, when you're entering a new market, or when you want to shift from reactive sourcing to candidates finding you.

### Scenario: You're spending too much time sourcing — candidates should be finding you

```
/career-site → Build a branded careers page:
  ├─ Your branding, job listings auto-published
  ├─ Team stories, culture content
  ├─ Track visitor-to-applicant conversion
  └─ /chatbot deployed on the site → engages visitors 24/7
    ↓
/brand → Public agency brand page:
  ├─ Agency values, team bios, case studies
  ├─ Client testimonials (from smart testimonial engine)
  └─ Shareable link for outreach and social
    ↓
/job-board-integrations → One-click multi-board distribution:
  ├─ Pnet, CareerJunction, Adzuna — publish simultaneously
  ├─ Track cost-per-application by board
  └─ Consolidate all applications back into platform
    ↓
FEEDBACK LOOP: Stronger brand → inbound candidates → less cold sourcing
```

### Scenario: You're expanding into a new city or sector

```
Client asks: "Can you recruit for us in Durban?"
    ↓
/location-intel → Geographic talent intelligence:
  ├─ Talent density for target roles in Durban
  ├─ Competing employers hiring for similar roles
  ├─ Expected salary ranges (vs Joburg/Cape Town)
  └─ Cost-of-living comparison
    ↓
Decision: enough talent to service this client?
  ├─ Yes → proceed, adjust salary expectations
  └─ No → advise client on remote hiring or relocation packages
    ↓
/recruitment-marketing → Launch targeted campaign:
  ├─ Email, social media, paid channels — targeting Durban talent
  ├─ Track reach, engagement, application conversion
  └─ WhatsApp campaigns for high-response outreach
```

### Scenario: Your best source of candidates is your existing candidates

```
/referrals → Structured referral programme:
  ├─ Share referral links with placed candidates
  ├─ Track who referred whom
  ├─ Manage referral bonuses
  └─ Measure effectiveness: referral hires vs other sources
    ↓
/candidate-nps → Survey candidates at each stage:
  ├─ Positive NPS → ask for referral
  ├─ Negative NPS → fix the experience before it damages your brand
  └─ Track NPS by recruiter → coaching opportunity
    ↓
/reference-checks → Automated reference collection:
  ├─ Send digital reference forms to referees
  ├─ Track completion, flag inconsistencies
  └─ No manual phone calls — consistent and auditable
    ↓
FEEDBACK LOOP: Happy candidates refer friends → pipeline grows organically
```

---

## Supporting Infrastructure

These features support the tracks above but don't drive their own narrative.

### Billing (`/billing`)

Subscription and payment management. View plan, manage payment methods, download invoices, track usage, upgrade. See [[02-concepts/billing-system]].

### Settings (`/settings`)

Team members and roles, SSO, integrations, email domains, pipeline stage customisation, notification preferences. Proper configuration ensures the platform works the way your agency works.

### Rapid Workflow (`/rapid-workflow`)

Streamlined process for urgent fills — compresses sourcing, screening, and scheduling by combining steps and removing non-essential gates. Activates when a client needs someone yesterday.

---

## How It All Connects

```
RECRUITMENT:  Signup → Profile → Clients → Jobs → Source → Screen → Interview → Offer → Place → Retain
                │         │         │        │       │        │         │          │       │        │
                │         │         │        │       │        │         │          │       │        │
COMMUNICATION:  │    Smart Msg   Sequences  │    Unified   Auto-     Self-     Offer    Onboard  Re-engage
                │         │         │        │     Inbox   Chatbot   Schedule   Letter   Checklist  │
                │         │         │        │       │        │         │          │       │        │
ANALYTICS:      │    DNA Card   Client     Req.  Engage-  Panel    Diversity   Offer    KPI     Candidate
                │         │     Pipeline   Check  Score   Analysis  Analytics  Predict  Dash      NPS
                │         │         │        │       │        │         │          │       │        │
COMPLIANCE:     │    B-BBEE    Contracts    │    POPIA     Blind    Audit      Offer     EE      Data
                │    Level     Documents    │    Consent   Hiring   Trail     Compliance Report  Retention
                │         │         │        │       │        │         │          │       │        │
BRAND:          │    Brand    Client     Career  Job     Recruit.  Location     │     Referrals   │
                │    Page     Testim.    Site    Boards  Marketing   Intel      │        │        │
                │         │         │        │       │        │         │          │       │        │
                ▼         ▼         ▼        ▼       ▼        ▼         ▼          ▼       ▼        ▼
             [Each feeds back into the recruitment path — more candidates, faster fills, better data]
```

## Key Touchpoints with Other User Types

| Stage | Interacts With |
|-------|---------------|
| Candidate sourced | Individual job seekers |
| Job posted for client | Business hiring teams |
| Candidate submitted to client | Business (via Hiring Manager Portal) |
| Offer extended | Individual (candidate) + Business (approval) |
| Placement recorded | Business (revenue event) |
| Platform moderated | Sebenza Hub Admin team |
| WhatsApp communications | WhatsApp Business API |

## References

- [[02-concepts/application-lifecycle]] — Pipeline stages
- [[02-concepts/ai-features]] — AI tools for recruiters
- [[02-concepts/compliance]] — POPIA, B-BBEE, Employment Equity
- [[02-concepts/whatsapp-integration]] — WhatsApp Business API
