---
title: "Recruiter How-To Guide — Plan & Outline"
type: question
created: 2026-04-09
updated: 2026-04-09
tags: [training, how-to, recruiter, documentation, planning]
sources: [recruitment-features-2026-04-07, recruiter-journey-gap-analysis-2026-04-08]
status: active
confidence: high
user-types: [recruiter]
---

# Recruiter How-To Guide — Plan & Outline

This page captures the plan for the **Recruiter user how-to guide** and tracks open questions before each part is drafted. The how-to guide itself lives in `16-how-tos/recruiter/`.

## Goal

Produce a task-oriented how-to guide that takes a brand-new recruitment agency from signup to a profitable, repeatable recruiting practice on Sebenza Hub. The how-to guide should be readable end-to-end by someone who has never used the platform, while also functioning as a reference for established users who need to look up a specific workflow.

## Source material

Same shape as the Individual how-to — the wiki already contains the raw material. The how-to guide is a *reshape* into user-facing language, not a research project.

| Existing wiki page | Role for the how-to guide |
|--------------------|---------------------|
| [[01-entities/recruiter-user]] | Master feature inventory (101 pages across 11 categories) |
| [[03-workflows/recruiter-journey]] | End-to-end journey: 10 recruitment steps + 4 parallel tracks (the spine) |
| [[15-dashboards/recruiter-dashboard]] | UI surface — Recruitment Path / Parallel Tracks / Supporting groupings drive chapter ordering |
| [[02-concepts/application-lifecycle]] | Pipeline model |
| [[02-concepts/authentication]] | Magic-link login |
| [[02-concepts/ai-features]] | AI capabilities |
| [[02-concepts/billing-system]] | Plans, credits, premium features |
| [[02-concepts/compliance]] | POPIA, B-BBEE, EE |
| [[02-concepts/whatsapp-integration]] | WhatsApp Business API context |
| [[02-concepts/multi-tenancy]] | Agency org model, team roles |

## Approach

1. **The Recruitment Path is the spine.** Parts 1–5 walk Steps 1–10 of the journey from signup to placement.
2. **Parallel tracks become Parts 6–9** (not just sidebars) — recruiters need them in depth, not as JIT callouts. Communication, Analytics, Compliance, and Brand each get their own part.
3. **Write to outcomes, not features.** "Place a senior developer in under 30 days" beats "use the Pipeline page."
4. **Scenarios over screenshots.** Each chapter opens with the realistic scenario it solves. The recruiter journey doc already has these — adapt them.
5. **Defer power-user features** (Predictive Hiring, Rapid Workflow, Team DNA) to Part 11.
6. **Every chapter ends with a checklist** the user can self-verify against.
7. **Cross-link only inside `16-how-tos/recruiter/`, `02-concepts/`, `03-workflows/`** per the [[CLAUDE]] cross-site link rule. No leaking to internal-only folders.

## Outline (34 chapters)

```
Part 1 — Getting Started (5 chapters)
  1. What Sebenza Hub is for recruiters
  2. Creating your account (Recruiter role)
  3. Agency onboarding: setting up your organisation
  4. The recruiter dashboard: Recruitment Path and Parallel Tracks
  4.5. How Sebenza Hub charges you (plans, credits, metering)

Part 2 — Build Your Agency (3 chapters)
  5. Your agency profile (the rich profile)
  6. AI profile assets: DNA Card, Reputation Score, Trust Tier
  7. Team setup: inviting members, roles, and approval chains

Part 3 — Win and Manage Clients (3 chapters)
  8. Adding corporate clients
  9. Engagement terms: fees, payment, guarantee
 10. Managing client relationships: pipeline, notes, satisfaction

Part 4 — Post Jobs and Source Talent (5 chapters)
 11. Posting a job (with AI JD Writer)
 12. Sourcing channels: AI Search, Talent Discovery, Sourcing
 13. LinkedIn Leads and Talent Rediscovery
 14. Talent Pools and Talent CRM
 15. Configuring screening at the job level

Part 5 — Screen, Interview, Offer, Place (6 chapters)
 16. The Pipeline (Kanban) — your daily workspace
 17. Screening tools: chatbot, tests, scorecards, blind hiring, background checks
 18. Interview scheduling and interview kits
 19. Video interviews and AI video analysis
 20. Making an offer: templates, approvals, predictor, negotiation
 21. Recording a placement and revenue

Part 6 — Communication at Scale (3 chapters)
 22. Unified Inbox and message management
 23. Email templates, sequences, and the chatbot
 24. WhatsApp at scale: Apply, Command Center, Campaigns

Part 7 — Analytics and Intelligence (2 chapters)
 25. Reading your analytics: KPI Dashboard and the four key reports
 26. Diversity, panel analysis, and AI Intelligence

Part 8 — Compliance and Governance (2 chapters)
 27. POPIA in practice: data subject access requests
 28. B-BBEE, EE Reports, Audit Trail, Approval Workflows

Part 9 — Brand and Growth (2 chapters)
 29. Career Site, Brand Page, Job Board Integrations
 30. Recruitment Marketing, Referrals, Candidate NPS

Part 10 — When You're Stuck (3 chapters)
 31. "My fill rate is dropping"
 32. "Candidates are ghosting between stages"
 33. "My client is unhappy with the calibre"

Part 11 — Advanced (Optional) (1 chapter)
 34. Predictive Hiring, Rapid Workflow, and the path to Platinum trust
```

## Open Questions

All 5 blocking questions resolved 2026-04-09 via codebase grep at `C:\Users\User\Desktop\Sebenza_Hub_Claude\Sebenza_Hub_Claude_V2`. Summary below; full details in the linked question pages.

- ✅ **Verification process (Chs 3, 6).** Manual admin review via `organizations.isVerified` flag and `/admin/recruiters` route. Trust badges are *separately* auto-calculated on every profile read (`GET /api/recruiter-profile/trust-score`).
- ✅ **Trust tier thresholds (Ch 6).** Resolved — see [[08-questions/trust-tier-calculation]]. Tier = 7-badge count: Bronze 0–2 badges, Silver 3–4, Gold 5, Platinum 6–7. The 7 badges are listed in the question page; six auto-calculate from profile fields.
- ✅ **Pricing tiers (Ch 4.5, 11, 17, 19, 20).** Resolved — see [[08-questions/subscription-plans]]. Recruiter has Free (R0), Standard (R999/mo or R799/mo annual), Premium (R2,499/mo or R1,999/mo annual). Metered features list confirmed.
- ✅ **Multi-recruiter competition (Ch 9).** Resolved via `jobIntakeScorecard.exclusivity` field (`shared/schema.ts:7450`). Three values: `exclusive`, `preferred`, `contingent`. Sebenza Hub does **not** enforce exclusivity — it's a recruiter-side categorisation of the engagement type, used to score job fillability and estimated fee. Each agency owns its own org-scoped jobs and submissions; there's no cross-agency visibility.
- ✅ **Team roles (Ch 7).** Resolved — see [[02-concepts/rbac]]. Six organization roles: Owner, Admin, Manager, Recruiter, Viewer, Member. Plus 40+ granular permissions across categories. Plus `roleDefinitions` for custom org-specific role templates. Plus separate `teamMembers.role` enum (member, reviewer, approver, admin).
- ⏳ **Screenshots.** Same as Individual — captured per chapter as drafts are reviewed.

## Status

- [x] Plan filed (this page)
- [x] `16-how-tos/recruiter/` scaffold created
- [x] Part 1 (Chapters 1–4 + 4.5) drafted
- [x] Part 2 (Chapters 5–7) drafted
- [x] Part 3 (Chapters 8–10) drafted
- [x] Part 4 (Chapters 11–15) drafted
- [x] Part 5 (Chapters 16–21) drafted
- [x] Part 6 (Chapters 22–24) drafted
- [x] Part 7 (Chapters 25–26) drafted
- [x] Part 8 (Chapters 27–28) drafted
- [x] Part 9 (Chapters 29–30) drafted
- [x] Part 10 (Chapters 31–33) drafted
- [x] Part 11 (Chapter 34) drafted
- [ ] Screenshots captured

## References

- [[16-how-tos/individual/index]] — Sibling Individual how-to (same shape, smaller scope)
- [[16-how-tos/recruiter/index]] — Recruiter how-to table of contents
- [[03-workflows/recruiter-journey]] — Source spine
- [[01-entities/recruiter-user]] — Feature inventory
- [[15-dashboards/recruiter-dashboard]] — UI grouping
- [[CLAUDE]] — Two-Site Publish rules
