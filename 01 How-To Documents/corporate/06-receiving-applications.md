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
4. If applications from a specific source are uniformly poor quality, that's the trigger to pause that channel rather than train recruiters to ignore it.

## Run the pipeline

### Pipeline — _Tier: Standard_

**What this feature is.** Pipeline is the per-requisition kanban view: candidates grouped by stage (Applied, Screened, Interviewed, Offered, Hired on the default; custom stages on Full ATS — see [[01 How-To Documents/corporate/05-posting-jobs|Chapter 5]]). You drag candidates across columns to advance them; the audit trail records every move with the user and timestamp.

**Why it matters.** The pipeline is the daily operational view of a requisition. It's where the recruiter spends most of their morning, the hiring manager glances at progress before standups, and the TA leader spots a stuck stage. Spreadsheets and email threads cannot show "where is each candidate right now?" at a glance — the pipeline does.

**How to use it.**

1. Open the requisition's Pipeline view from the Jobs page or by clicking through from Applications.

![[c-ch04-basic-ats-pipeline-view.png]]

2. Drag a candidate to the next stage to advance them, or click in for the full record.
3. At each stage, leave structured notes and use @-mentions to pull the right person into the thread (set up in [[01 How-To Documents/corporate/03-setting-up-your-org|Chapter 3]]). Use scorecards (covered in [[01 How-To Documents/corporate/07-screening-and-evaluating|Chapter 7]]) for interview feedback so the decision rationale is preserved.
4. When you're ready to offer, advance the candidate to **Offered** — the offer flow lives in [[01 How-To Documents/corporate/09-making-offers|Chapter 9]].
5. When the candidate accepts, advance to **Hired**. This triggers any onboarding checklist you've configured.

The Pipeline view is also where the bottleneck of any requisition is most visible. If candidates pile up at "Recruiter Screen" the issue is recruiter capacity; if they pile up at "Hiring Manager Review" the issue is manager engagement. The shape of the column heights tells you where to push.

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

## Features covered in this chapter

| # | Feature | Tier | Route |
|---|---------|------|-------|
| 1 | Applications | Standard | [https://www.sebenzahub.co.za/dashboard/business/applications](https://www.sebenzahub.co.za/dashboard/business/applications) |
| 2 | Pipeline | Standard | [https://www.sebenzahub.co.za/dashboard/business/pipeline](https://www.sebenzahub.co.za/dashboard/business/pipeline) |
| 3 | Candidates | Standard | [https://www.sebenzahub.co.za/dashboard/business/candidates](https://www.sebenzahub.co.za/dashboard/business/candidates) |

## Next chapter

[[01 How-To Documents/corporate/07-screening-and-evaluating|Chapter 7 — Screening and evaluating]]

## References

- [[02-concepts/application-lifecycle]] — Candidate lifecycle and stage model
- [[01 How-To Documents/corporate/05-posting-jobs|Chapter 5 — Posting jobs]]
- [[01 How-To Documents/corporate/07-screening-and-evaluating|Chapter 7 — Screening and evaluating]]
- [[01 How-To Documents/corporate/10-vendor-management-and-sourcing|Chapter 10 — Vendor management and sourcing]]
- [[01 How-To Documents/corporate/12-compliance-and-audit-trail|Chapter 12 — Compliance and audit trail]]
