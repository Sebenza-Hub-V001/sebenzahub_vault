---
title: "Chapter 4 — The recruiter dashboard"
type: concept
created: 2026-04-09
updated: 2026-04-20
tags: [how-to, recruiter, dashboard, navigation, analytics, billing, notifications]
status: draft
user-types: [recruiter]
---

# Chapter 4 — The recruiter dashboard: Recruitment Path and Parallel Tracks

You've just finished onboarding and landed on `/dashboard/recruiter/profile`. Before you start clicking around, take ten minutes to understand the dashboard layout. The recruiter side of Sebenza Hub has roughly 100 pages organised into an 8-step Recruitment Path and four Parallel Tracks — knowing how they're grouped will save you hours of hunting.

![[r-ch04-dashboard-full-view.png]]

## The three sections of the sidebar

The left sidebar is divided into three sections, in this order from top to bottom:

1. **Recruitment Path** — the linear journey from agency profile to placement.
2. **Parallel Tracks** — the four "always-on" sets of tools that support the path.
3. **Supporting** — knowledge base, billing, settings.

A thick visual divider separates the Recruitment Path from the Parallel Tracks. This is intentional. The Recruitment Path is what you walk through to make a placement; the Parallel Tracks are tools you reach for at specific moments.

## The Recruitment Path (in order)

The path follows the actual sequence of work in an agency:

| Step | Sidebar group | What you do here |
|------|---------------|------------------|
| 1 | Agency Profile | Fill out who your agency is — branding, credentials, performance, terms |
| 2 | Clients | Add and manage corporate clients |
| 3 | Post Jobs | Create and publish jobs (your own or for clients) |
| 4 | Source Candidates | Find candidates through 8 different sourcing tools |
| 5 | Screen & Evaluate | Pipeline (Kanban), screening tools, scorecards, tests |
| 6 | Interview | Scheduling, interview kits, video, hiring manager portal |
| 7 | Make Offer | Templates, approvals, negotiation, predictor, analytics |
| 8 | Place & Retain | Submissions, placements, KPIs, post-hire onboarding |

Some groups have a single page; others have many. **Source Candidates** has 8 pages (each is a different sourcing channel); **Make Offer** has 11 (the offer lifecycle is rich). Don't try to learn them all on day one — the guide takes you through them in order in Parts 2–5.

![[r-ch04-recruitment-path-sidebar.png]]

## The four Parallel Tracks

Below the divider you'll find:

- **Communication & Automation** (9 pages) — Unified Inbox, sequences, templates, chatbot, WhatsApp, workflow automation. You'll start using this on Day 2 once you have your first candidates.
- **Analytics & Intelligence** (7 pages) — KPI Dashboard, predictive analytics, team DNA, panel analysis, engagement scores, diversity, requirement check. You'll start using this in Week 2 when you have data to look at.
- **Compliance & Governance** (5 pages) — POPIA, B-BBEE, EE Reports, Audit Trail, Approval Workflows. You'll touch these monthly for routine reporting and during audits.
- **Brand & Growth** (5 pages) — Career Site, Brand Page, Job Boards, Recruitment Marketing, Location Intel. You'll set these up in your first month and revisit when you're growing or entering new markets.

The Parallel Tracks are not optional, but they don't need attention every day. They activate at specific moments — when you're drowning in messages, when fill rates drop, when an audit lands, when you're trying to win a new client.

![[r-ch04-parallel-tracks-sidebar.png]]

## Supporting

At the bottom you'll find:

- **Knowledge Base** — your own internal wikis (notes, processes, playbooks for your team). Different from Sebenza Hub's product documentation.
- **Billing** — your subscription, invoices, usage.
- **Settings** — team members, integrations, pipeline customisation, notification preferences.

You can ignore Knowledge Base on day one. Billing and Settings you'll touch within your first week.

## What the dashboard actually shows you

Two features are wired into the dashboard from day one — one tells you how your desk is performing, the other tells you what you're spending. Both are free on every plan. Get familiar with both before you start posting jobs.

### Basic Analytics — _Tier: Free_

**What this feature is.** Basic Analytics shows job views, applicant counts, and the headline recruitment metrics at the job and desk level. It's the always-on summary block on your dashboard — no setup required, populated automatically as activity flows in.

**Why it matters.** Every recruiter wants to know "how's my desk doing?" without opening a separate analytics page. Free basics anchor that question inside Sebenza Hub instead of pushing you to spreadsheets — which is the only way the daily check-in habit forms. Deeper analytics (time-to-hire, funnel conversion, cost-per-hire) are covered in Chapter 25.

**How to use it.** Runs automatically. Open `/dashboard/recruiter` and the metrics tiles are at the top. Click any tile to drill into the underlying job or applicant list.

### Billing & Usage Limits — _Tier: Free (all paying users)_

**What this feature is.** Billing & Usage Limits shows your current plan, invoices, payment methods, and — most importantly — real-time consumption of every metered feature against your monthly cap. Everything commercial about your account lives at `/dashboard/recruiter/billing`.

**Why it matters.** No one wants a surprise bill. Transparent usage-vs-limit tracking is what stops you from hitting a paywall in the middle of a sprint and what tells you when an upgrade would save money compared to credit top-ups. Chapter 4.5 explains the commercial model in detail; this is where you watch it.

**How to use it.** Bookmark `/dashboard/recruiter/billing` from day one. Check the *Usage history* tab weekly during your first month so you learn which metered features you actually consume. The *Plan recommendation* card flags when your usage pattern suggests an upgrade.

![[r-ch04-billing-usage-page.png]]

## Notifications — set them once, on day one

The dashboard is also where you tell Sebenza Hub how to reach you when something needs your attention. Configure notification channels now so interview reminders, offer deadlines, and candidate replies never sit in a tab you forgot to open.

### Email Notifications — _Tier: Free_

**What this feature is.** Email Notifications send alerts and updates to your inbox — new matches, application status changes, messages from candidates and clients, scheduling events. The default channel for every account.

**Why it matters.** Email is the baseline notification channel everyone expects. Free access ensures no recruiter misses a critical update — interview time, offer acceptance, client reply — just because of their plan tier.

**How to use it.** Go to `/dashboard/recruiter/settings` → **Notifications** and toggle the event types you want emailed. Defaults are sensible; tighten or loosen per your inbox tolerance.

### SMS Notifications — _Tier: Standard_

**What this feature is.** SMS Notifications deliver time-critical alerts to your mobile — interview reminders, offer deadlines, 2FA codes, urgent client replies.

**Why it matters.** SMS has a ~98% open rate and reaches you without data. For time-critical moments (interview in 2 hours, candidate accepted overnight), SMS is the only channel that reliably gets through — and the same applies when SMS goes out to candidates on your behalf.

**How to use it.** In **Notifications**, add a verified mobile number and tick the events you want via SMS. Keep the list short — every channel deserves a deliberate choice, not a check-everything default.

### All Notification Channels — _Tier: Premium_

**What this feature is.** Full channel coverage — email, SMS, push, and WhatsApp — with per-event channel rules. You can route candidate messages to WhatsApp, offer deadlines to SMS, and dashboard digests to email all from one config.

**Why it matters.** Different people prefer different channels, and a senior recruiter on a busy day needs every channel available to reach high-priority candidates and clients. Multi-channel routing is the power-user setting that turns notifications from noise into signal.

**How to use it.** In **Notifications**, switch the view to **Per-event channels** and pick the channel for each event type. Set quiet hours to suppress non-urgent channels overnight.

![[r-ch04-notifications-settings.png]]

## Your first 30 minutes

Don't try to use everything. Here's the right order for your first half-hour:

1. **Stay on `/profile` and fill in the rich agency profile basics** (5–10 minutes; you can perfect it later). Chapter 5 walks through this in detail. The reason this comes first: nothing else looks credible until your profile is complete.
2. **Skip to `/clients` and add at least one client** (2 minutes). Even if you're a solo agency and your "client" is yourself for direct hires, the system needs at least one client before you can post a job that has commercial meaning. Chapter 8 covers this properly.
3. **Go to `/jobs` and create a job draft** (5 minutes). Don't publish it yet — just see how the form works. Chapter 11 walks through this properly. Save as draft.
4. **Open `/pipeline`** (2 minutes). It will be empty. That's fine. This is where you'll spend most of your daily time once candidates start flowing in. Chapter 16 explains the Kanban view.
5. **Visit `/settings`** (5 minutes) and check who's listed as a team member, what notifications are on, and whether your time zone is correct.

That's it. Don't sign up for AI Search, don't import LinkedIn leads, don't run a WhatsApp campaign. None of that is useful until your profile, clients, and jobs are real.

## AI progress messaging — what those status updates mean

When you trigger an AI feature (screening a CV, generating a JD, running video analysis, scoring a candidate), you'll see a multi-phase status indicator instead of a generic spinner: typically **drafting → validating → scoring → finalising**, with the active phase highlighted. This isn't decorative — it tells you what the platform is actually doing on your behalf.

Two practical effects:

- **You know whether it's stuck.** A spinner that hasn't moved in 30 seconds could be doing real work or could be hung. The phase indicator makes the difference visible — if you've been on "validating" for two minutes, that's a real problem worth reporting; if it's moved through three phases, it's just a slow run.
- **Feature chapters don't need to repeat it.** Every AI feature in this manual uses the same progress pattern. When chapter 17 says "AI screening runs against every application", or chapter 19 says "video analysis runs automatically on every recorded interview", that's the same drafting → validating → scoring → finalising flow you saw on the dashboard.

## Two patterns to watch out for

1. **The "shiny tools" trap.** Sebenza Hub has Predictive Hiring, Video Analysis, Offer Predictor, AI Intelligence, Team DNA, and a dozen other AI features. They're all useful — but they're useful *after* you have data to feed them. On day one, they have nothing to predict. Resist the urge to enable them all immediately. Part 11 covers them properly once you have a baseline.
2. **The "everything at once" trap.** New users sometimes try to set up automation, sequences, the chatbot, the career site, the brand page, and the WhatsApp integration all in their first session. None of this works without real candidates and real client jobs. Build the recruitment path first; layer the tracks on top once it's flowing.

## Checklist

- [ ] You can identify the three sidebar sections: Recruitment Path, Parallel Tracks, Supporting
- [ ] You understand the path is linear (Steps 1–8) and the tracks are situational
- [ ] You've spent your first 30 minutes on profile + client + job draft, not on shiny AI tools
- [ ] You've checked Settings for time zone and notifications
- [ ] You've bookmarked `/dashboard/recruiter/billing` → *Usage history*
- [ ] You've configured at least Email Notifications (and SMS if you're on Standard or above)

## Features covered in this chapter

| # | Feature | Tier |
|---|---------|------|
| 1 | Basic Analytics | Free |
| 2 | Billing & Usage Limits | Free (all paying users) |
| 3 | Email Notifications | Free |
| 4 | SMS Notifications | Standard |
| 5 | All Notification Channels | Premium |

## Next chapter

[[01 How-To Documents/recruiter/04.5-how-we-charge|Chapter 4.5 — How Sebenza Hub charges you]]

## References

- [[03-workflows/recruiter-journey]] — The full recruitment path with scenarios
- [[01 How-To Documents/recruiter/04.5-how-we-charge|Chapter 4.5 — How Sebenza Hub charges you]]
- [[01 How-To Documents/recruiter/05-agency-profile|Chapter 5 — Your agency profile]]
