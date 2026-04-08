---
title: "Recruiter Dashboard"
type: entity
created: 2026-04-08
updated: 2026-04-08
tags: [dashboard, recruiter, agency, layout]
sources: [dashboard-layouts]
status: active
user-types: [recruiter]
dashboard-path: /dashboard/recruiter/*
---

# Recruiter Dashboard

**File:** `client/src/pages/dashboard/recruiter/RecruiterDashboard.tsx`
**Route:** `/dashboard/recruiter/*`
**Total Pages:** 101

> Sidebar organised into Recruitment Path → Parallel Tracks → Supporting, with glowing headers and a thick divider separating primary path from parallel tracks.

See [[03-workflows/recruiter-journey]] for the full journey with scenarios.

---

## RECRUITMENT PATH

### Agency Profile (1 page)

| Page | Route |
|------|-------|
| Profile | `/dashboard/recruiter/profile` |

### Clients (3 pages)

| Page | Route |
|------|-------|
| Clients | `/dashboard/recruiter/clients` |
| Client Pipeline | `/dashboard/recruiter/client-pipeline` |
| Call Notes | `/dashboard/recruiter/call-notes` |

### Post Jobs (2 pages)

| Page | Route |
|------|-------|
| Jobs | `/dashboard/recruiter/jobs` |
| AI JD Writer | `/dashboard/recruiter/ai-writer` |

### Source Candidates (8 pages)

| Page | Route |
|------|-------|
| Candidates | `/dashboard/recruiter/candidates` |
| Talent CRM | `/dashboard/recruiter/talent-crm` |
| AI Sourcing | `/dashboard/recruiter/candidate-sourcing` |
| Talent Discovery | `/dashboard/recruiter/talent-discovery` |
| Rediscovery | `/dashboard/recruiter/talent-rediscovery` |
| LinkedIn Leads | `/dashboard/recruiter/linkedin-leads` |
| Talent Pools | `/dashboard/recruiter/talent-pool` |
| AI Search | `/dashboard/recruiter/ai-search` |

### Screen & Evaluate (13 pages)

| Page | Route |
|------|-------|
| Pipeline | `/dashboard/recruiter/pipeline` |
| Screening Roles | `/dashboard/recruiter/roles` |
| Compare | `/dashboard/recruiter/comparison` |
| Compare Detail | `/dashboard/recruiter/comparison/:id` |
| Scorecards | `/dashboard/recruiter/scorecards` |
| Screening Bot | `/dashboard/recruiter/screening-chatbot` |
| Culture Fit Intel | `/dashboard/recruiter/culture-fit` |
| Predictive Hiring | `/dashboard/recruiter/predictive-hiring` |
| AI Intelligence | `/dashboard/recruiter/candidate-summary` |
| Tests | `/dashboard/recruiter/tests` |
| Test Library | `/dashboard/recruiter/test-library` |
| Test Templates | `/dashboard/recruiter/test-templates` |
| Background Checks | `/dashboard/recruiter/background-checks` |
| Blind Hiring | `/dashboard/recruiter/blind-hiring` |

### Interview (7 pages)

| Page | Route |
|------|-------|
| Scheduling | `/dashboard/recruiter/scheduling` |
| Self-Scheduling | `/dashboard/recruiter/self-scheduling` |
| Interview Kits | `/dashboard/recruiter/interview-kits` |
| Video Interviews | `/dashboard/recruiter/video-interviews` |
| Video Analysis | `/dashboard/recruiter/video-analysis` |
| AI Questions | `/dashboard/recruiter/ai-questions` |
| Manager Portal | `/dashboard/recruiter/hiring-manager` |

### Make Offer (11 pages)

| Page | Route |
|------|-------|
| Offers | `/dashboard/recruiter/offers` |
| Offer Letters | `/dashboard/recruiter/offer-letters` |
| Offer Templates | `/dashboard/recruiter/offer-templates` |
| Benchmarking | `/dashboard/recruiter/offer-benchmarking` |
| Offer Approvals | `/dashboard/recruiter/offer-approvals` |
| Offer Timeline | `/dashboard/recruiter/offer-timeline` |
| Negotiations | `/dashboard/recruiter/offer-negotiation` |
| Offer Compare | `/dashboard/recruiter/offer-compare` |
| Offer Analytics | `/dashboard/recruiter/offer-analytics` |
| Offer Compliance | `/dashboard/recruiter/offer-compliance` |
| Offer Predictor | `/dashboard/recruiter/offer-predictor` |

### Place & Retain (9 pages)

| Page | Route |
|------|-------|
| Submissions | `/dashboard/recruiter/submissions` |
| Placements | `/dashboard/recruiter/placements` |
| KPI Dashboard | `/dashboard/recruiter/kpi-dashboard` |
| Rapid Workflow | `/dashboard/recruiter/rapid-workflow` |
| Onboarding | `/dashboard/recruiter/onboarding` |
| Referrals | `/dashboard/recruiter/referrals` |
| Candidate NPS | `/dashboard/recruiter/feedback` |
| Re-Engagement | `/dashboard/recruiter/re-engagement` |
| Reference Checks | `/dashboard/recruiter/reference-checks` |

---

## PARALLEL TRACKS

### Communication & Automation (9 pages)

| Page | Route |
|------|-------|
| Unified Inbox | `/dashboard/recruiter/unified-inbox` |
| Inbox | `/dashboard/recruiter/inbox` |
| Chatbot | `/dashboard/recruiter/chatbot` |
| Email Templates | `/dashboard/recruiter/email-templates` |
| Sequences | `/dashboard/recruiter/sequences` |
| WhatsApp Apply | `/dashboard/recruiter/whatsapp-apply` |
| WhatsApp Command Center | `/dashboard/recruiter/whatsapp-bot` |
| WA Campaigns | `/dashboard/recruiter/whatsapp-campaigns` |
| Automation | `/dashboard/recruiter/workflow-automation` |

### Analytics & Intelligence (7 pages)

| Page | Route |
|------|-------|
| Overview | `/dashboard/recruiter/analytics` |
| Predictive | `/dashboard/recruiter/predictive-analytics` |
| Team DNA | `/dashboard/recruiter/team-dna` |
| Panel Analysis | `/dashboard/recruiter/disagreements` |
| Engagement Score | `/dashboard/recruiter/engagement` |
| Diversity Analytics | `/dashboard/recruiter/diversity` |
| Requirement Check | `/dashboard/recruiter/requirement-check` |

### Compliance & Governance (5 pages)

| Page | Route |
|------|-------|
| Approvals | `/dashboard/recruiter/approval-workflows` |
| Audit Trail | `/dashboard/recruiter/audit-trail` |
| B-BBEE | `/dashboard/recruiter/bbbee` |
| Employment Equity | `/dashboard/recruiter/ee-reports` |
| POPIA Compliance | `/dashboard/recruiter/compliance` |

### Brand & Growth (5 pages)

| Page | Route |
|------|-------|
| Career Site | `/dashboard/recruiter/career-site` |
| Marketing | `/dashboard/recruiter/recruitment-marketing` |
| Job Boards | `/dashboard/recruiter/job-board-integrations` |
| Brand Page | `/dashboard/recruiter/brand` |
| Location Intel | `/dashboard/recruiter/location-intel` |

---

## SUPPORTING

### Knowledge Base (3 pages)

| Page | Route |
|------|-------|
| My Wikis | `/dashboard/recruiter/wiki` |
| Wiki Viewer | `/dashboard/recruiter/wiki/:id` |
| Wiki Page | `/dashboard/recruiter/wiki/:id/page/:slug` |

### Account (2 pages)

| Page | Route |
|------|-------|
| Billing | `/dashboard/recruiter/billing` |
| Settings | `/dashboard/recruiter/settings` |

## References

- [[03-workflows/recruiter-journey]] — Full journey with scenarios
- [[01-entities/recruiter-user]] — Entity page with data model
