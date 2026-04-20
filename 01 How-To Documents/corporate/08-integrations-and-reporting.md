---
title: "Chapter 8 — Integrations and reporting"
type: concept
created: 2026-04-20
updated: 2026-04-20
tags: [how-to, corporate, analytics, hris, api, notifications, support, reporting]
status: active
user-types: [business]
---

# Chapter 8 — Integrations and reporting

This chapter wires Sebenza Hub into the rest of your tech stack and your operational rhythm. Eleven features, sequenced as a journey: see your data → interrogate it → ship it to the board → tune your notifications → wire to your HRIS and broader stack → pick the support tier that matches your risk profile.

This is the longest chapter in the book because it's the one that earns the platform its enterprise label. Treat it as reference material — set up the basics in your first month, layer the rest as you mature.

## See your data

### Analytics Dashboard — _Tier: Standard_

**What this feature is.** The Analytics Dashboard surfaces the operational hiring metrics every TA leader is measured on: time-to-hire, funnel conversion (applied → interviewed → offered → hired), source analytics (which channels produce hires), and per-requisition performance. It's a live view, not a monthly extract.

**Why it matters.** HR leaders are increasingly held accountable for hiring KPIs at executive level. A live dashboard turns the monthly board-pack compilation from a day's work into a screenshot. More importantly, it turns hiring from a reactive function (reporting on what happened) into a proactive one (spotting bottlenecks while there's time to fix them).

**How to use it.**

1. Go to **Analytics → Dashboard**. The default view shows organisation-level metrics for the current quarter.

![[13-raw/screenshots/c-ch08-analytics-dashboard-hero.png]]

2. Filter by department, role family, or hiring manager to drill into the part of the funnel you care about.
3. Use the **Bottleneck View** to see which stages have the longest dwell time. Long dwell at "Recruiter Screen" usually means under-resourced TA; long dwell at "Hiring Manager Review" usually means manager engagement is the issue.
4. Set up the dashboard as a saved view for your weekly team meeting and your monthly leadership update. The same view becomes the conversation starter both times.
5. If the standard metrics don't match what your leadership cares about, that's the trigger to move to Advanced Analytics and Custom Reports.

## Interrogate it

### Advanced Analytics — _Tier: Premium_

**What this feature is.** Advanced Analytics gives you deep drill-down across every dimension of the data — cross-period comparisons (this quarter vs same quarter last year), cohort analysis, funnel decomposition by source / role / hiring manager / demographic, and ad-hoc filter combinations. It also opens up data export to BI tools (PowerBI, Tableau) for analysis you can't do in the dashboard.

**Why it matters.** Standard dashboards answer the questions you already knew to ask. Advanced Analytics is where you answer the ad-hoc question the CEO sends at 6pm — "why is our Engineering hiring slower than Sales?" — without three days of data wrangling. It's also the export hose to your enterprise BI stack, so the same numbers appear in your board pack as in your HR dashboard.

**How to use it.**

1. Go to **Analytics → Advanced** and pick the dimensions you want to slice by. The query builder is point-and-click; you don't need SQL.
2. For ad-hoc questions, build the view, save it as a personal report, and share the link with the asker. The next time the question comes up, the report is one click away.
3. For BI integration, configure a scheduled export under **Settings → Data Export**. You can export to S3, Azure Blob, or a direct BI connector (PowerBI, Tableau). Frequency is configurable — daily for active datasets, weekly for slower-moving ones.
4. Cohort analysis is the highest-leverage view in this module. Common starter question: "Of candidates we hired in Q1, what percentage are still here at 12 months?" If the answer is below 80%, your hiring quality has a problem worth investigating before scaling further.

![[13-raw/screenshots/c-ch08-advanced-analytics-drilldown.png]]

## Ship it to the board

### Custom Reports — _Tier: Premium_

**What this feature is.** Custom Reports is a drag-and-drop report builder for the metrics, filters, and formats your board specifically wants — not the metrics Sebenza thought you'd want. Reports can be scheduled (auto-delivered to the right people on the right cadence) and exported as PDF, Excel, or pushed via API to a downstream system.

**Why it matters.** Every HR leader has a set of metrics their board cares about that doesn't quite fit any pre-built dashboard. Without a custom builder, you're either waiting for Sebenza to build the report you need or you're rebuilding it manually in Excel every month. Custom Reports closes the gap so the board pack assembles itself.

**How to use it.**

1. Go to **Reports → Build new** and choose your data source (requisitions, candidates, placements, vendor performance, EE demographics).

![[13-raw/screenshots/c-ch08-custom-reports-builder.png]]

2. Drag in the dimensions and metrics you want. Apply filters (e.g., "completed hires only", "this fiscal year", "Engineering and Product departments").
3. Choose the output format — table, chart (bar / line / pie), or pivot.
4. Save the report and configure scheduled delivery: recipients, format (PDF / XLSX), and cadence (weekly / monthly / quarterly). The report lands in inboxes on schedule with no manual step.
5. Build the standard board pack as a single scheduled report set. The TA leader's monthly update becomes an automatic artifact.

## Tune your notifications

The notifications block governs how Sebenza Hub talks to your team. Match the channel to the urgency: email for routine, SMS for time-critical, full multi-channel for high-priority candidates and senior recruiters.

### Email Notifications — _Tier: Free_

**What this feature is.** Email Notifications deliver alerts and updates to your team's inbox — new applications, status changes, scheduled reminders, @-mentions, and report deliveries. It's the baseline channel and is included on every plan, including Free.

**Why it matters.** Email is the universal channel — every team member has it, every team member checks it. Free access ensures critical updates (an interview scheduled, an offer accepted) never get blocked by plan tier. Skipping email entirely is rarely the right move; the question is which other channels to layer on top.

**How to use it.**

1. Go to **Settings → Notifications** and review the default per-event email rules.
2. Disable noisy events (e.g., "candidate viewed your job posting") for most users — these add inbox clutter without driving action.
3. Enable critical events (interview scheduling, offer status, @-mentions) for everyone.
4. Each team member can override their personal preferences from their own Settings → Notifications page.

### SMS Notifications — _Tier: Standard_

**What this feature is.** SMS Notifications send time-critical alerts via SMS — interview reminders to candidates, offer-deadline reminders, two-factor authentication codes for sensitive actions, and urgent escalations to recruiters.

**Why it matters.** SMS has roughly a 98% open rate and reaches recipients without data or wifi — a meaningful concern for SA candidates who may not be on data when an interview reminder is due. For genuinely time-critical moments ("interview in two hours", "offer expires today"), SMS is the only channel that reliably gets through.

**How to use it.**

1. Go to **Settings → Notifications → SMS** and select which events trigger SMS.
2. The recommended starter set: interview reminders to candidates (T-24h and T-2h), offer-acceptance deadline reminder (T-24h), two-factor authentication for offer signing.
3. SMS costs money per message — review the volume estimate the system shows before enabling, and don't SMS every event or you'll spend more than the platform costs.
4. Candidates can opt out of non-critical SMS; respect the opt-out.

### All Notification Channels — _Tier: Premium_

**What this feature is.** All Notification Channels unlocks the full set — email, SMS, push (web and mobile), and WhatsApp — with per-event channel rules. Different events can route to different channels, and different users can have different channel preferences.

**Why it matters.** High-priority candidates (executive search, scarce-skill engineering, urgent backfills) need every channel available to reach them. Senior recruiters managing high-value pipelines need real-time push, not delayed email. Multi-channel is the power-user feature for organisations where some hires really do matter more than others.

**How to use it.**

1. Go to **Settings → Notifications → Channels** and enable WhatsApp and Push.
2. WhatsApp setup requires a Sebenza-managed sender or your own WhatsApp Business number; the system walks you through provisioning.
3. Define channel rules per event class: routine events on email only, time-critical on email + SMS, urgent (interview cancelled, offer rejected, requisition critical) on all channels.

![[13-raw/screenshots/c-ch08-notification-channels-matrix.png]]

4. Train recruiters on the channel rules so the noise level is predictable. Multi-channel done badly is just more spam; done well, it's the signal that gets through when it matters.

## Wire to your HRIS

### HRIS Integration — _Tier: Premium_

**What this feature is.** HRIS Integration provides bidirectional data flow between Sebenza Hub and the major SA HRIS systems — SAP SuccessFactors, Workday, BambooHR, Sage HR. Hires created in Sebenza flow into the HRIS automatically; org structure and headcount data flows back from the HRIS into Sebenza.

**Why it matters.** Without HRIS sync, every hire becomes a manual re-key into the HRIS — which produces typos, missed onboarding triggers, and demographic data that doesn't reconcile across systems. For any enterprise with a real HRIS, integration is table stakes; without it, the ATS becomes a data-integrity disaster within a quarter.

**How to use it.**

1. Go to **Settings → Integrations → HRIS** and choose your HRIS vendor.

![[13-raw/screenshots/c-ch08-hris-integration-config.png]]

2. Provide the API credentials your HRIS team supplies. The exact mechanism varies by vendor (OAuth for Workday, API key for BambooHR, certificate-based for SuccessFactors).
3. Configure the field mapping: which Sebenza fields correspond to which HRIS fields. The system ships with default mappings per HRIS that cover most cases; customise where your HRIS has non-standard fields.
4. Choose the sync direction per object: hires (Sebenza → HRIS), org structure and active employee list (HRIS → Sebenza), open requisitions (depends on which system is the source of truth).
5. Test with a non-production hire first. Verify the new hire appears in the HRIS with the right department, manager, start date, and demographic data before going live.
6. Monitor the **Sync Health** dashboard for errors. Most issues are field-mapping mismatches that surface on a specific record type; fix the mapping and replay.

### API Access — _Tier: Premium_

**What this feature is.** API Access provides programmatic access to the Sebenza Hub data — candidates, jobs, pipelines, events — through a REST API with rate limits, scoped tokens, and webhooks. It's the integration surface for everything that isn't a packaged HRIS connector: custom internal tools, BI ETL, Slack bots, the bespoke onboarding system your IT team built.

**Why it matters.** Enterprises don't run on packaged integrations alone. Every enterprise has at least one internal tool or workflow that needs Sebenza data — and without API access, that workflow either doesn't exist or runs on a fragile CSV export. API access is the enabler of the broader ecosystem and is one of the strongest retention drivers: customers who've integrated Sebenza into their own stack don't churn.

**How to use it.**

1. Go to **Settings → API** and generate a token. Scope the token to the specific permissions your integration needs — read-only on candidates is very different from read-write on offers.

![[13-raw/screenshots/c-ch08-api-key-management.png]]

2. Read the API documentation linked from the same page. Endpoints are versioned; rate limits are per token.
3. For event-driven integrations, configure webhooks for the events you care about: candidate.hired, offer.accepted, requisition.published. Webhooks deliver to your endpoint with retry logic and a signed payload.
4. Treat tokens like secrets. Rotate them on a schedule (typically 90 days) and revoke immediately on staff changes that affect integration ownership.
5. Monitor your token's rate-limit usage from the API dashboard. If you're consistently hitting limits, the right answer is usually a smarter integration design (events instead of polling), not a higher limit.

## Pick your support tier

Support tier is mostly a function of risk tolerance and operational hours. The honest framing: you can run on Email Support if you're prepared to wait 24–48h on routine issues. If a broken feature on Wednesday cannot wait until Friday, you need Priority. If you need a named human contact and quarterly check-ins, you need Dedicated.

### Email Support — _Tier: Free_

**What this feature is.** Email-based customer support with a 24–48 hour response SLA on business days. Open a ticket from any page; replies arrive in your inbox.

**Why it matters.** Free support sets the baseline that the platform stands behind its product. For low-stakes issues (cosmetic bugs, "how do I…" questions), this is enough. For mission-critical operational issues during a hiring sprint, it isn't.

**How to use it.**

1. Click the **Support** link in the footer or in Settings.
2. Describe the issue with screenshots and the URL where it occurred. Vague tickets get vague responses.
3. Track the ticket from your support history.

### Priority Support — _Tier: Standard_

**What this feature is.** Priority Support gives faster response times (target same business day), priority queue handling, and a dedicated support address. Tickets are visibly tagged Priority in the support team's queue and treated as such.

**Why it matters.** Paying customers can't run a hiring sprint with a 48-hour SLA on broken integrations. Priority Support is both a value-add and a friction-reducer that keeps customers on Standard from churning when they hit their first real problem.

**How to use it.**

1. Open tickets the same way as Email Support; they automatically get Priority treatment by virtue of your plan tier.
2. For genuinely urgent issues (e.g., "candidates can't apply"), flag the ticket as Urgent. The Urgent flag should be reserved for issues that block hiring — using it for everything dilutes its meaning.

### Dedicated Support — _Tier: Premium_

**What this feature is.** Dedicated Support assigns a named account manager (AM) who knows your account, your integrations, and your hiring rhythm. Comes with scheduled quarterly check-ins, implementation support for new features, and a priority support channel into the engineering team for genuinely critical issues.

**Why it matters.** Enterprise customers expect a human contact, not a ticket queue. The AM is the person who knows that your annual EE reporting deadline is in March and proactively prepares; the person who connects you with engineering when a deep technical question comes up; the person who tells you about new features before you find out from the changelog. Customers with a named AM churn at a fraction of the rate of those without.

**How to use it.**

1. Your AM is assigned during onboarding. They reach out for a kickoff and schedule the recurring check-in.
2. Use the check-ins to surface gaps, request features, and get heads-up on the product roadmap.
3. Route genuinely critical issues to your AM directly — they triage into the engineering escalation channel. Use this sparingly to preserve the channel's signal.
4. When your AM changes (it happens), insist on a proper handover call. A new AM with no context is worse than the old one.

## Checklist

- [ ] Analytics Dashboard is the default home page for your TA team's weekly meeting
- [ ] If on Premium: Advanced Analytics is exporting to your BI stack on schedule
- [ ] Board pack is a scheduled Custom Report, not a manual artifact
- [ ] Notification rules are tuned (email for routine, SMS for time-critical, multi-channel for urgent)
- [ ] HRIS integration is live, sync-healthy, and reconciles to your HRIS source of truth
- [ ] API tokens are scoped, rotated, and monitored for rate-limit usage
- [ ] You're on the support tier that matches your operational risk tolerance, not the cheapest one

## Features covered in this chapter

| # | Feature | Tier |
|---|---------|------|
| 1 | Analytics Dashboard | Standard |
| 2 | Advanced Analytics | Premium |
| 3 | Custom Reports | Premium |
| 4 | Email Notifications | Free |
| 5 | SMS Notifications | Standard |
| 6 | All Notification Channels | Premium |
| 7 | HRIS Integration | Premium |
| 8 | API Access | Premium |
| 9 | Email Support | Free |
| 10 | Priority Support | Standard |
| 11 | Dedicated Support | Premium |

## Next chapter

[[01 How-To Documents/corporate/09-workforce-planning|Chapter 9 — Workforce planning]]

## References

- [[02-concepts/billing-system]] — Plan tiers and metering model
- [[01 How-To Documents/corporate/04-your-first-requisition|Chapter 4 — Your first requisition]]
- [[01 How-To Documents/corporate/09-workforce-planning|Chapter 9 — Workforce planning]]
