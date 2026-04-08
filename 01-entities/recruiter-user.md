---
title: "Recruiter (Talent Agency)"
type: entity
created: 2026-04-07
updated: 2026-04-07
tags: [user-type, recruiter, agency, talent]
sources: [repo-audit-2026-04-07]
status: active
confidence: high
---

# Recruiter (Talent Agency)

The **Recruiter** represents a recruitment agency or independent recruiter on Sebenza Hub. They source candidates (Individuals), manage relationships with corporate clients (Businesses), post jobs on behalf of clients, and earn placement fees. This is the supply-side intermediary of the marketplace.

**Role value in database:** `"recruiter"`
**Organization type:** `"agency"`

## Dashboard Routes

All Recruiter features live under `/dashboard/recruiter/*`.

## Features by Category

### Core Recruitment

| Feature | Route | Description |
|---------|-------|-------------|
| Jobs | `/jobs` | Post, edit, publish jobs to multiple channels |
| Pipeline | `/pipeline` | Visual recruitment funnel (Kanban board) |
| Candidates | `/candidates` | Manage candidate database |
| Applications | `/applications` | Review incoming applications |
| Submissions | `/submissions` | Track candidates submitted to client jobs |

### AI-Powered Sourcing

| Feature | Route | Description |
|---------|-------|-------------|
| AI Search | `/ai-search` | AI-powered candidate discovery |
| Talent Discovery | `/talent-discovery` | Find passive candidates |
| Talent CRM | `/talent-crm` | Full CRM for talent relationships |
| Talent Pool | `/talent-pool` | Create and segment talent pools |
| Talent Rediscovery | `/talent-rediscovery` | Re-engage past candidates |
| LinkedIn Leads | `/linkedin-leads` | Import and manage LinkedIn leads |
| Candidate Sourcing | `/candidate-sourcing` | Multi-channel sourcing tools |
| Location Intel | `/location-intel` | Geographic candidate analysis |

### Screening & Assessment

| Feature           | Route                | Description                                    |
| ----------------- | -------------------- | ---------------------------------------------- |
| Screening Chatbot | `/screening-chatbot` | Automated initial screening via chatbot        |
| Tests             | `/tests`             | Administer skill/competency tests              |
| Test Library      | `/test-library`      | Pre-built test catalogue                       |
| Test Templates    | `/test-templates`    | Create reusable test templates                 |
| Scorecards        | `/scorecards`        | Structured evaluation forms                    |
| Culture Fit       | `/culture-fit`       | Assess cultural alignment                      |
| Blind Hiring      | `/blind-hiring`      | Remove bias (hide names, photos, demographics) |
| Background Checks | `/background-checks` | Order background verification                  |

### Interviews

| Feature | Route | Description |
|---------|-------|-------------|
| Scheduling | `/scheduling` | Interview scheduling with calendar integration |
| Self-Scheduling | `/self-scheduling` | Candidate self-service booking |
| Interview Kits | `/interview-kits` | Structured interview guides |
| Video Interviews | `/video-interviews` | Asynchronous video interviews |
| Video Analysis | `/video-analysis` | AI analysis of video performance |

### Offer Management

| Feature | Route | Description |
|---------|-------|-------------|
| Offers | `/offers` | Full offer lifecycle management |
| Offer Letters | `/offer-letters` | Generate and send offer letters |
| Offer Templates | `/offer-templates` | Pre-built offer templates |
| Offer Analytics | `/offer-analytics` | Acceptance rates, time-to-accept |
| Offer Negotiation | `/offer-negotiation` | Manage salary negotiations |
| Offer Benchmarking | `/offer-benchmarking` | Market compensation data |
| Offer Approvals | `/offer-approvals` | Approval workflow for offers |
| Offer Predictor | `/offer-predictor` | Predict offer acceptance probability |
| Offer Compliance | `/offer-compliance` | Legal compliance checks |
| Offer Compare | `/offer-compare` | Compare multiple offers side-by-side |
| Offer Timeline | `/offer-timeline` | Track offer milestones |

### Client Management (Revenue Engine)

| Feature | Route | Description |
|---------|-------|-------------|
| Clients | `/clients` | Manage corporate client relationships |
| Client Pipeline | `/client-pipeline` | Track client opportunities |
| Hiring Manager Portal | `/hiring-manager-portal` | Client-facing portal |
| Placements | `/placements` | Track successful placements |
| KPI Dashboard | `/kpi-dashboard` | Revenue and performance metrics |
| Call Notes | `/call-notes` | CRM call logging |
| Feedback | `/feedback` | Collect client and candidate feedback |
| Referrals | `/referrals` | Employee referral programs |
| Rapid Workflow | `/rapid-workflow` | Streamlined workflow for fast recruiting |

### Communication & Automation

| Feature | Route | Description |
|---------|-------|-------------|
| Unified Inbox | `/unified-inbox` | Cross-channel messaging (email, WhatsApp) |
| Email Templates | `/email-templates` | Pre-built email templates |
| Sequences | `/sequences` | Automated email/message sequences |
| Chatbot | `/chatbot` | Conversational bot management |
| Workflow Automation | `/workflow-automation` | Set up hiring automation rules |
| Re-Engagement | `/re-engagement` | Win back passive candidates |
| Recruitment Marketing | `/recruitment-marketing` | Marketing campaigns |
| WhatsApp Apply | `/whatsapp-apply` | Enable WhatsApp job applications — see [[01-entities/whatsapp-bot]] |
| WhatsApp Campaigns | `/whatsapp-campaigns` | WhatsApp bulk messaging — see [[01-entities/whatsapp-bot]] |
| WhatsApp Bot | `/whatsapp-bot` | WhatsApp chatbot — see [[01-entities/whatsapp-bot]] |

### Analytics & Compliance

| Feature | Route | Description |
|---------|-------|-------------|
| Analytics | `/analytics` | Recruitment analytics dashboard |
| Predictive Analytics | `/predictive-analytics` | Forecast hiring needs |
| Predictive Hiring | `/predictive-hiring` | Predict hiring success |
| Diversity | `/diversity` | DEI metrics and reporting |
| EE Reports | `/ee-reports` | Employment Equity reports |
| B-BBEE | `/bbbee` | B-BBEE compliance reporting |
| Compliance | `/compliance` | Compliance dashboard |
| Audit Trail | `/audit-trail` | Track all actions and changes |
| Approval Workflows | `/approval-workflows` | Configurable approval chains |

### External Integrations

| Feature | Route | Description |
|---------|-------|-------------|
| Job Board Integrations | `/job-board-integrations` | Pnet, CareerJunction, Adzuna |
| Career Site | `/career-site` | Build custom careers page |
| Brand | `/brand` | Public agency profile page |

## Data Model

The Recruiter has the **richest profile** in the system (60+ fields):

- **`users`** — Base account
- **`recruiterProfiles`** — Extensive profile with:
  - Agency details (name, size, founded year, headquarters)
  - Credentials (certifications, languages, awards)
  - Performance stats (total placements, success rate, avg time-to-fill, retention rate)
  - Commercial terms (fee structure, payment terms, guarantee period)
  - Compliance (B-BBEE level, POPIA status, registration/VAT numbers)
  - AI features:
    - **DNA Card** — Speed, quality, diversity, retention scores (0–100)
    - **Reputation Score** — NPS, satisfaction, responsiveness breakdown
    - **Market Intelligence** — Province data, sector rankings
    - **Trust Tier** — Bronze → Silver → Gold → Platinum
    - **Competitive Benchmarking** — Percentile vs sector peers
    - **Capacity Signal** — Available / Limited / At Capacity per sector
    - **Video Introduction** — With AI analysis of tone and talking points
    - **Case Studies** — Challenge → Approach → Result format
    - **Smart Testimonials** — Request and display client testimonials

### Client Management Tables

- **`corporateClients`** — Business clients of the agency
- **`corporateClientContacts`** — Multiple contacts per client
- **`corporateClientEngagements`** — Fee agreements and terms
- **`clientNotes`** — Activity log (calls, emails, meetings)
- **`clientDocuments`** — Contracts, proposals, NDAs
- **`clientMeetings`** — Scheduled interactions
- **`clientRevenue`** — Revenue tracking per client
- **`clientSatisfaction`** — CSAT surveys

## Onboarding Flow

1. Enter email → receive magic link
2. Click link → verify → create session
3. Select "Recruiter" role on `/onboarding`
4. Fill onboarding form:
   - Agency name (required), website, email, phone
   - Sectors (multi-select from industries)
   - Verification proof URL (optional B-BBEE/POPIA docs)
5. System creates:
   - `recruiterProfiles` record
   - `organizations` record (type = "agency")
   - `memberships` record (user as admin of org)
6. Redirect to `/dashboard/recruiter/profile`

## Key Interactions

- **With Individuals** — Source, screen, interview, submit to client jobs
- **With Businesses** — Manage as clients, submit candidates, earn placement fees
- **With AI** — AI search, candidate matching, JD writing, screening automation, predictive hiring
- **With Admin** — Subject to verification, compliance monitoring

## Revenue Model

Recruiters earn through placement fees:

```
Recruiter sources Individual → Submits to Business client job
→ Business interviews → Business hires
→ Recruiter earns placement fee (% of salary or fixed)
→ Revenue recorded in clientRevenue table
```

Fee structures: percentage-based, fixed, or hybrid. Payment terms: upfront, 50/50, or on-placement.

## Open Questions

- How is the recruiter verification process managed? Is it manual (admin) or automated?
- What triggers trust tier upgrades (bronze → silver → gold → platinum)?
- How do recruiters compete for the same Business client's jobs?

## References

- [[01-entities/individual-user]] — Candidates that recruiters source
- [[01-entities/business-user]] — Corporate clients of recruiters
- [[02-concepts/application-lifecycle]] — The hiring pipeline
- [[02-concepts/multi-tenancy]] — Organization model for agencies
- [[02-concepts/ai-features]] — AI tools for recruiters
- [[02-concepts/compliance]] — B-BBEE, POPIA requirements
- [[01-entities/whatsapp-bot]] — WhatsApp bot (recruiter has 16 dedicated tabs)
- [[01-entities/offer-system]] — Offer management
- [[01-entities/screening-system]] — Screening and evaluation
- [[01-entities/linkedin-integration]] — LinkedIn lead import
- [[06-comparisons/user-type-comparison]] — Feature comparison
- Source: [[09-sources/repo-audit-2026-04-07]]
- Source: [[09-sources/recruitment-features-2026-04-07]]
