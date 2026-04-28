---
title: "Chapter 6 — Receiving applications"
type: concept
created: 2026-04-26
updated: 2026-04-26
tags: [how-to, corporate, applications, pipeline, candidates, ats]
status: active
user-types: [business]
---

# Chapter 6 — Receiving applications

Once a requisition is live, applications start landing. The **Receive Applications** sidebar group has three pages and they map to three different jobs to be done: a flat list of incoming applications, the kanban-style pipeline view of the requisition, and the durable candidate database. You'll move between all three many times a day — knowing which one to use when is the single biggest productivity gain a TA team makes in their first month.

The pages you'll use:

- **Applications** ([https://www.sebenzahub.co.za/dashboard/business/applications](https://www.sebenzahub.co.za/dashboard/business/applications)) — the flat list of every application across all requisitions, filterable and sortable. The triage view.
- **Pipeline** ([https://www.sebenzahub.co.za/dashboard/business/pipeline](https://www.sebenzahub.co.za/dashboard/business/pipeline)) — the per-requisition kanban: candidates grouped by stage, drag-to-advance.
- **Candidates** ([https://www.sebenzahub.co.za/dashboard/business/candidates](https://www.sebenzahub.co.za/dashboard/business/candidates)) — the candidate database. Same person may have applied to multiple roles; this is the unified record.

## Triage what's coming in

### Applications — _Tier: Standard_

**What this feature is.** Applications is the cross-requisition inbox of every application that's landed in the system, with filters for requisition, source, demographic, screening result, and stage. It's where the recruiter starts the day to see what's new and what needs attention.

**Why it matters.** Without a single triage view, recruiters either work requisition-by-requisition (and miss volume) or scan email (and miss context). The Applications view is the cheapest productivity win — five minutes of scanning replaces an hour of clicking through individual reqs.

**How to use it.**

1. Open **Applications** and filter to the period you're triaging (typically last 24 hours or last 7 days for a Monday catch-up).
2. Sort by source if you want to see how each channel is performing in real time — you'll often spot a misconfigured external job board within hours rather than at month-end.
3. Click into individual applications to view the candidate record, their screening result, and the requisition they applied to. From there you advance them in the pipeline (next section) or reject with a templated message.

![[c-ch06-applications-triage-view.png]]

4. If applications from a specific source are uniformly poor quality, that's the trigger to pause that channel rather than train recruiters to ignore it.

![[c-ch06-source-effectiveness-breakdown.png]]

## Run the pipeline

### Pipeline — _Tier: Standard_

**What this feature is.** Pipeline is the per-requisition kanban view: candidates grouped by stage (Applied, Screened, Interviewed, Offered, Hired on the default; custom stages on Full ATS — see [[01 How-To Documents/corporate/05-posting-jobs|Chapter 5]]). You drag candidates across columns to advance them; the audit trail records every move with the user and timestamp.

**Why it matters.** The pipeline is the daily operational view of a requisition. It's where the recruiter spends most of their morning, the hiring manager glances at progress before standups, and the TA leader spots a stuck stage. Spreadsheets and email threads cannot show "where is each candidate right now?" at a glance — the pipeline does. If you only opened one page in Sebenza Hub every morning, this should be it.

**How to use it.**

1. Open the requisition's Pipeline view from the Jobs page or by clicking through from Applications.

![[c-ch04-basic-ats-pipeline-view.png]]

2. Drag a candidate to the next stage to advance them, or click in for the full record.
3. At each stage, leave structured notes and use @-mentions to pull the right person into the thread (set up in [[01 How-To Documents/corporate/03-setting-up-your-org|Chapter 3]]). Use scorecards (covered in [[01 How-To Documents/corporate/07-screening-and-evaluating|Chapter 7]]) for interview feedback so the decision rationale is preserved.
4. When you're ready to offer, advance the candidate to **Offered** — the offer flow lives in [[01 How-To Documents/corporate/09-making-offers|Chapter 9]].
5. When the candidate accepts, advance to **Hired**. This triggers any onboarding checklist you've configured.

The Pipeline view is also where the bottleneck of any requisition is most visible. If candidates pile up at "Recruiter Screen" the issue is recruiter capacity; if they pile up at "Hiring Manager Review" the issue is manager engagement. The shape of the column heights tells you where to push.

### How to read the Pipeline at a glance

The Pipeline tells you four things in 30 seconds:

1. **How healthy is each requisition?** A requisition with 50 candidates in Applied, 5 in Screened, and 0 in Interviewed is in trouble — the screening stage is the bottleneck.
2. **Where are people stuck?** Cards with high *stage age* (e.g. 7+ days in Screened) are problems. They're either ghosting your hiring managers or being ignored.
3. **Where's your next hire coming from?** Cards in Offered with strong match scores are your imminent fills. If that column is empty, your forecast is empty.
4. **What did you ignore yesterday?** Sort by last activity ascending — the cards at the top haven't been touched in days. They need attention now.

Each card on the Kanban shows:

- Candidate name (or anonymised ID if blind hiring is on)
- The requisition they applied to
- AI match score (the number that helps you prioritise)
- Last activity timestamp
- Stage age (how long they've been stuck in the current stage)
- Quick-action icons (notes, schedule, message, reject)

![[c-ch06-pipeline-card-anatomy.png]]

### Candidate Engagement Scorer — _Tier: Standard_

**What this feature is.** The Engagement Scorer rates each candidate's engagement throughout the pipeline — responsiveness, enthusiasm, reciprocation — and flags those whose signals predict drop-off.

**Why it matters.** You lose candidates silently in week 2 of a 4-week process. By the time you notice they've gone quiet, they've usually accepted somewhere else. Engagement scoring surfaces the cooling-off candidates while there's still time to intervene — a personal call from the hiring manager at the right moment is the most cost-effective intervention any TA team has.

**How to use it.** The score sits on each candidate card next to the AI match score. Filter the Pipeline by **Engagement: declining** once a day — anyone in that bucket gets a personal call or WhatsApp from the hiring manager, not another templated email. If you're already messaging via the Unified Inbox ([[01 How-To Documents/corporate/11-communication-and-automation|Chapter 11]]), the sentiment indicator there is the same signal in real-time.

![[c-ch06-engagement-score-card.png]]

### Requirement Restriction Analyzer — _Tier: Standard_

**What this feature is.** AI scans a requisition's requirements and flags criteria that are unnecessarily restricting your candidate pool — "5+ years" when 3 would do, "degree required" when work-sample would do, location bands narrower than the role actually needs.

**Why it matters.** Every nice-to-have your hiring manager treats as a must-have cuts the funnel. The Analyzer shows the hiring manager — in concrete numbers — how much each constraint is costing them, which is the conversation you can't have on gut feel alone. It's also one of the few hiring-manager-facing tools that materially shifts conversations about what's "essential" because it converts judgment to data.

**How to use it.** Open any requisition that's stalling for volume in the Pipeline and click **Analyze requirements**. The platform reports which criteria are doing the heaviest rejecting and what the candidate count would look like with each one relaxed. Take the report into your next hiring-manager check-in when you need them to soften a requirement.

![[c-ch06-requirement-restriction-flags.png]]

## Filters that matter

The Pipeline has filters at the top. The five you'll use most:

| Filter | What it does |
|---|---|
| **Requisition** | Show only candidates for one specific requisition |
| **Recruiter** | Show only candidates owned by one team member |
| **Stage** | Show only candidates in one stage (e.g. only Interviewed) |
| **Source** | Filter by where the candidate came from (direct, AI Search, vendor agency, internal mobility) |
| **AI score range** | Show only high-scoring matches |

A common daily filter combo: **My candidates** + **Stages: Screened, Interviewed, Offered**. That's your action-required list — everything that's mid-flight and needs attention.

![[c-ch06-pipeline-filters-bar.png]]

## Bulk actions

For high-volume requisitions, single-card actions are too slow. Bulk actions let you select multiple cards (shift-click or drag-select) and:

- Move them to another stage
- Send a bulk template message
- Tag them
- Reject with a reason
- Assign to a different team member or hiring manager
- Add to the candidate database with a tag for future re-engagement

The two bulk actions that save the most time:

1. **Bulk-reject the Applied column with a polite template.** After your first review pass, reject the obvious "no"s in batch with a respectful message. Don't leave them ghosted — that hurts your employer brand and shows up in candidate NPS scores six months later.
2. **Bulk-tag for future-fit harvesting.** Strong candidates who didn't fit *this* requisition often fit a future one. Bulk-tag them as `future-fit:senior-engineer` and they'll surface in your saved searches when the next senior engineering req opens.

![[c-ch06-bulk-actions-menu.png]]

## The daily Pipeline routine

The TA functions that hit their fill rates run a tight daily routine. This is the one to copy:

### Morning (15 minutes, first thing)

1. **Open the Pipeline filtered to "My requisitions" + "Stage age > 2 days"**. These are your stuck candidates. Action each one — message, schedule, escalate to the hiring manager, or reject. Five minutes.
2. **Open Stage: Offered**. Any cards waiting on a candidate response? Send a follow-up. Any cards waiting on you to push the offer through approvals? Push it now. Two minutes.
3. **Open Stage: Interviewed**. Any interviews today? Confirm them. Any feedback from yesterday's interviews not yet logged on a scorecard? Chase the interviewer. Three minutes.
4. **Open Stage: Applied, sorted by AI score descending.** Review the top 5 highest-scoring new applications. Move them to Screened or reject. Five minutes.

### Midday (10 minutes)

5. **Engagement check.** Filter by **Engagement: declining** — anyone cooling off gets a personal touch from the hiring manager (not the recruiter), today.

### End of day (10 minutes)

6. **Plan tomorrow.** Which 5 candidates need your attention first thing tomorrow? Pin them or add a follow-up reminder.

That's 35 minutes a day on the Pipeline itself. Everything else (sourcing, vendor management, analytics) sits *around* the Pipeline routine, not instead of it.

## Stage configuration (Full ATS)

You can customise the stages in Settings ([https://www.sebenzahub.co.za/dashboard/business/settings](https://www.sebenzahub.co.za/dashboard/business/settings)) → Pipeline. Common customisations for corporate hiring:

- **Add a "HM Review" stage** between Screened and Interviewed, for the hand-off when a hiring manager validates the recruiter's shortlist before scheduling
- **Split "Interviewed" into "Interview Round 1" and "Interview Round 2 (Panel)"** for multi-stage interview processes — the norm for senior or specialised roles
- **Add a "Reference / Background Check" stage** between Interviewed and Offered, for the verification window that's a hard gate in regulated sectors
- **Add a "Hired — In Notice" stage** between Offered and Hired, for the awkward window when the candidate has accepted but hasn't started yet — useful for HRBPs running onboarding prep

Don't go overboard with stages. Five to seven is the sweet spot; more than ten and the Kanban becomes unreadable. Resist the urge to encode every approval gate as its own stage — most are better handled as required-actions on a candidate record.

![[c-ch06-stage-config-settings.png]]

## Pipeline as the source of truth

A candidate's stage in the Pipeline is the **single source of truth** for where they are. Don't keep parallel notes in spreadsheets, Slack threads, or email folders — the Pipeline is the record everyone on the team relies on, including your KPI dashboards, your audit trail (see [[01 How-To Documents/corporate/12-compliance-and-audit-trail|Chapter 12]]), and your EE reporting.

If a stage move doesn't reflect reality, fix it. If your team is moving cards inconsistently (one recruiter uses "Interviewed" loosely, another only after first round confirmed), have the conversation and standardise. This is a TA-leader responsibility, not a recruiter one.

## Pro tips

- **Stage age is your most important metric.** A pipeline with no stage-age problems means everyone's moving. A pipeline littered with 14-day stuck cards means your process is broken. Stage age is more diagnostic than total volume.
- **Resist the urge to add candidates to multiple stages "just in case".** A candidate has one stage. Move them when reality moves them. Don't pre-promote.
- **Don't reject without a reason code.** When you reject, pick a reason (skills mismatch, salary, location, ghosted, withdrew, internal candidate selected). The reason codes feed your analytics — without them, you can't diagnose why your funnel converts the way it does, and you can't defend your EE numbers if asked.
- **Screen-share the Pipeline in TA standups.** It's the most honest view of function activity. If your weekly TA meeting starts with "let's open the Pipeline and walk through it", everyone is anchored to reality immediately.
- **Don't multi-task in the Pipeline.** Filter to one requisition, work it, switch. Trying to juggle 6 reqs simultaneously in one view is how candidates get forgotten.

## Manage the candidate database

### Candidates — _Tier: Standard_

**What this feature is.** Candidates is the durable, cross-requisition database of every person who has ever applied to your organisation, plus anyone added directly through sourcing. Each candidate has a single record with their CV, contact details, application history (every requisition they've applied to), screening results, scorecards, and audit history.

**Why it matters.** The candidate, not the application, is the long-term object. Someone who applied to your Senior Engineer role last year and didn't get it might be a perfect fit for a different role this year — but only if their record is preserved and findable. The Candidates database is what turns a hiring system into a talent pool.

**How to use it.**

1. Open **Candidates** to see the unified candidate list. Filter by skills, location, last activity, or any tag you've applied.
2. Click into a candidate record to see their full history — every application, every interaction, every scorecard. The record is the single source of truth on this person across your organisation.
3. Use the candidate record as the place to leave context that should outlive any one requisition: "spoke with on Senior PM role in June, passed on us for offer competition reasons, would consider us for VP role in 2027". That context is what makes re-engagement work.
4. Candidates flagged as "do not contact" or who have issued a POPIA deletion request are honoured at the database level — you cannot accidentally re-target them through any sourcing tool. See [[01 How-To Documents/corporate/12-compliance-and-audit-trail|Chapter 12]] for the POPIA mechanics.

For active sourcing across the database with natural-language search, AI Search is covered in [[01 How-To Documents/corporate/10-vendor-management-and-sourcing|Chapter 10]].

## Checklist

- [ ] The Applications view is the start-of-day habit for recruiters, not the requisition list
- [ ] Pipeline is being used daily; decisions are left as comments and scorecard entries on the candidate record
- [ ] Channel performance is reviewed weekly from the Applications source breakdown — bad channels get paused rather than tolerated
- [ ] Candidate records carry context that outlives the requisition (notes, tags, "don't contact" flags)
- [ ] POPIA deletion requests are actioned through the Candidates database, not by editing individual applications
- [ ] You've opened the Pipeline and drag-and-dropped a candidate from one stage to another to test the flow
- [ ] You have a daily morning ritual of 15 minutes on the Pipeline
- [ ] You're using reject reason codes consistently
- [ ] You filter by Engagement: declining at least once a day
- [ ] You've run Requirement Restriction Analyzer on any requisition that's stuck for volume

## Features covered in this chapter

| # | Feature | Tier | Route |
|---|---------|------|-------|
| 1 | Applications | Standard | [https://www.sebenzahub.co.za/dashboard/business/applications](https://www.sebenzahub.co.za/dashboard/business/applications) |
| 2 | Pipeline | Standard | [https://www.sebenzahub.co.za/dashboard/business/pipeline](https://www.sebenzahub.co.za/dashboard/business/pipeline) |
| 3 | Candidates | Standard | [https://www.sebenzahub.co.za/dashboard/business/candidates](https://www.sebenzahub.co.za/dashboard/business/candidates) |
| 4 | Candidate Engagement Scorer | Standard | _embedded on the Pipeline_ |
| 5 | Requirement Restriction Analyzer | Standard | _per-requisition Pipeline action_ |

## Next chapter

[[01 How-To Documents/corporate/07-screening-and-evaluating|Chapter 7 — Screening and evaluating]]

## References

- [[02-concepts/application-lifecycle]] — Candidate lifecycle and stage model
- [[01 How-To Documents/corporate/05-posting-jobs|Chapter 5 — Posting jobs]]
- [[01 How-To Documents/corporate/07-screening-and-evaluating|Chapter 7 — Screening and evaluating]]
- [[01 How-To Documents/corporate/10-vendor-management-and-sourcing|Chapter 10 — Vendor management and sourcing]]
- [[01 How-To Documents/corporate/12-compliance-and-audit-trail|Chapter 12 — Compliance and audit trail]]
