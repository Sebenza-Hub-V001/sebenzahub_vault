---
title: "Chapter 16 — The Pipeline (Kanban)"
type: concept
created: 2026-04-09
updated: 2026-04-09
tags: [manual, recruiter, pipeline, kanban, daily-workflow]
status: draft
user-types: [recruiter]
---

# Chapter 16 — The Pipeline (Kanban): your daily workspace

If you only opened one page in Sebenza Hub every morning, it should be the Pipeline. This is where every candidate for every active job sits, organised by stage, with everything you need to move them forward visible at a glance. Most successful recruiters spend 60% of their platform time here.

This chapter walks through how to read the Pipeline, how to move candidates through it efficiently, and the daily routine that turns it into a habit instead of a chore.

## Where it lives

`/dashboard/recruiter/pipeline` — the master Kanban board for your entire agency.

## The Kanban view

The Pipeline is laid out as columns, one per stage. The default stage set:

| Stage | What's here |
|---|---|
| **New** | Just applied, not yet reviewed |
| **Screening** | Under active screening (chatbot, tests, manual review) |
| **Interview** | Scheduled for or in the interview process |
| **Offer** | Offer extended, awaiting response |
| **Placed** | Candidate accepted and started (or starting) |
| **Rejected** | Rejected at any stage |
| **Withdrawn** | Candidate withdrew |

Each column shows a stack of candidate cards. Each card shows:

- Candidate name (or anonymised ID if blind hiring is on)
- The job they're applied to
- AI match score (the number that helps you prioritise)
- Last activity timestamp
- Stage age (how long they've been stuck in the current stage)
- Quick-action icons (notes, schedule, message, reject)

You can drag and drop a card from one column to another to advance the candidate. The status updates instantly, the audit trail records the move, and any automation rules tied to the new stage fire (e.g. an "interview scheduled" auto-message).

## How to read the Pipeline at a glance

The Pipeline tells you four things in 30 seconds:

1. **How healthy is each job?** A job with 50 candidates in New, 5 in Screening, and 0 in Interview is in trouble — the screening stage is the bottleneck.
2. **Where are people stuck?** Cards with high *stage age* (e.g. 7+ days in Screening) are problems. They're ghosting either you or the platform.
3. **Where's your next placement coming from?** Cards in Offer with strong match scores are your imminent revenue. If that column is empty, your forecast is empty.
4. **What did you ignore yesterday?** Sort by last activity ascending — the cards at the top haven't been touched in days. They need attention now.

## Filters that matter

The Pipeline has filters at the top. The five you'll use most:

| Filter | What it does |
|---|---|
| **Job** | Show only candidates for one specific job |
| **Recruiter** | Show only candidates owned by one team member (yours) |
| **Stage** | Show only candidates in one stage (e.g. only Interview) |
| **Source** | Filter by where the candidate came from (direct, AI Search, LinkedIn, etc.) |
| **AI score range** | Show only high-scoring matches |

A common daily filter combo: **My candidates** + **Stages: Screening, Interview, Offer**. That's your action-required list — everything that's mid-flight and needs attention.

## Bulk actions

For high-volume roles, single-card actions are too slow. Bulk actions let you select multiple cards (shift-click or drag-select) and:

- Move them to another stage
- Send a bulk template message (sequences if you want multi-step)
- Tag them
- Reject with a reason
- Assign to a different team member
- Add to a talent pool

The two bulk actions that save the most time:

1. **Bulk-reject the New column with a polite template.** After your first review pass, reject the obvious "no"s in batch with a respectful message. Don't leave them ghosted — that hurts your candidate NPS (Chapter 6).
2. **Bulk-tag for talent pool harvesting.** Strong candidates who didn't fit *this* role often fit a future role. Bulk-tag them as `future-fit:senior-dev` and they'll surface in your saved searches and Talent Rediscovery.

## The daily Pipeline routine

The agencies that win run a tight daily routine. This is the one to copy:

### Morning (15 minutes, first thing)

1. **Open the Pipeline filtered to "My candidates" + "Stage age > 2 days"**. These are your stuck candidates. Action each one — message, schedule, escalate, or reject. Five minutes.
2. **Open Stage: Offer**. Any cards waiting on a candidate response? Send a follow-up. Any cards waiting on you to send an offer? Send it now. Two minutes.
3. **Open Stage: Interview**. Any interviews today? Confirm them. Any feedback from yesterday's interviews not yet logged? Log it. Three minutes.
4. **Open Stage: New, sorted by AI score descending.** Review the top 5 highest-scoring new applications. Move them to Screening or reject. Five minutes.

### Midday (10 minutes)

5. **Quick check on detractor signals**. Any candidate NPS responses or warning flags from this morning? Address them while they're fresh.

### End of day (10 minutes)

6. **Plan tomorrow.** Which 5 candidates need your attention first thing tomorrow? Pin them or add a follow-up reminder.

That's 35 minutes a day on the Pipeline itself. Everything else (sourcing, client management, analytics) sits *around* the Pipeline routine, not instead of it.

## Stage configuration

You can customise the stages in `/dashboard/recruiter/settings` → Pipeline. Common customisations:

- **Add an "Internal Review" stage** between Screening and Interview, for the hand-off when a manager validates the recruiter's shortlist
- **Add a "Client Review" stage** between Screening and Interview, for when the corporate client reviews your shortlist before agreeing to interview
- **Split "Interview" into "Interview Round 1" and "Interview Round 2"** for multi-stage interview processes
- **Add a "Placed — In Notice" stage** between Offer and Placed, for the awkward window when the candidate has accepted but hasn't started yet

Don't go overboard with stages. Five to seven is the sweet spot; more than ten and the Kanban becomes unreadable.

## Pipeline as the source of truth

A candidate's stage in the Pipeline is the **single source of truth** for where they are. Don't keep parallel notes in spreadsheets or email folders — the Pipeline is the record everyone on your team relies on, including your KPI Dashboard, your audit trail, and your client reporting.

If a stage move doesn't reflect reality, fix it. If your team is moving cards inconsistently (one person uses "Interview" loosely, another only after first round confirmed), have the conversation and standardise.

## Pro tips

- **Stage age is your most important metric.** A pipeline with no stage-age problems means everyone's moving. A pipeline littered with 14-day stuck cards means your process is broken. Stage age is more diagnostic than total volume.
- **Resist the urge to add candidates to multiple stages "just in case".** A candidate has one stage. Move them when reality moves them. Don't pre-promote.
- **Don't reject without a reason code.** When you reject, pick a reason (skills mismatch, salary, location, ghosted, withdrew). The reason codes feed your analytics — without them, you can't diagnose why your funnel converts the way it does.
- **Screen-share the Pipeline in team meetings.** It's the most honest view of agency activity. If your weekly team meeting starts with "let's open the Pipeline and walk through it", everyone is anchored to reality immediately.
- **Don't multi-task in the Pipeline.** Filter to one job, work it, switch. Trying to juggle 6 jobs simultaneously in one view is how candidates get forgotten.

## Checklist

- [ ] You've opened the Pipeline at least once and understand the column layout
- [ ] You've drag-and-dropped a candidate from one stage to another to test the flow
- [ ] You've set up the "My candidates + stage age > 2 days" filter as your daily starting view
- [ ] You have a daily morning ritual of 15 minutes on the Pipeline
- [ ] You're using reject reason codes consistently
- [ ] You haven't added 12 custom stages on day one (resist the urge)

## Next chapter

[[16-manuals/recruiter/17-screening-tools|Chapter 17 — Screening tools]]

## References

- [[02-concepts/application-lifecycle]] — Stage definitions and status enum
- [[16-manuals/recruiter/15-screening-config|Chapter 15 — Screening configuration at the job level]]
- [[16-manuals/recruiter/17-screening-tools|Chapter 17 — Screening tools]]
- [[16-manuals/recruiter/06-ai-profile-assets|Chapter 6 — AI profile assets (NPS feeds back here)]]
