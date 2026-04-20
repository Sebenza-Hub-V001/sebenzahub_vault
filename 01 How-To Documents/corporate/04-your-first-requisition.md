---
title: "Chapter 4 — Your first requisition"
type: concept
created: 2026-04-20
updated: 2026-04-20
tags: [how-to, corporate, ats, requisitions, onboarding]
status: active
user-types: [business]
---

# Chapter 4 — Your first requisition

A requisition is the unit of work in a corporate hiring system: one approved role, one budget, one pipeline, one hire (usually). This chapter walks you through running your first one end-to-end using the applicant tracking system, then handing the new hire to onboarding.

Three features power this chapter: **Basic Applicant Tracking** for any team that just needs structured pipelines, **Full Applicant Tracking** for enterprises that have outgrown the defaults, and **Onboarding Checklists** for the first 30 days after the offer is signed.

## Decide which ATS tier you're on

Most Corporate customers start on **Standard** with Basic Applicant Tracking and upgrade to **Premium / Full Applicant Tracking** once they're running 50+ concurrent requisitions or need stage customisation per role family. There is no harm in starting on Basic — the data model is the same, so an upgrade later doesn't lose history.

| If… | Use |
|-----|-----|
| You're running fewer than 20 concurrent requisitions and standard stages work | **Basic Applicant Tracking** |
| You need custom stages per role family (engineering vs sales vs warehouse) | **Full Applicant Tracking** |
| You need automation rules (auto-advance after 5 days, auto-reject after no response) | **Full Applicant Tracking** |
| You report SLAs to a Talent Acquisition leader | **Full Applicant Tracking** |
| You report cross-requisition metrics to your board | **Full Applicant Tracking** |

## Start with Basic ATS

### Basic Applicant Tracking — _Tier: Standard_

**What this feature is.** Basic Applicant Tracking gives you structured pipelines for every requisition with a fixed set of default stages: applied, screened, interviewed, offered, hired. Candidates move between stages as they progress; the audit trail records every move with the user who did it and the timestamp.

**Why it matters.** Without an ATS, hiring lives in spreadsheets and email — which means no audit trail when EE reporting is due, no consistency across hiring managers, and no way to tell where the bottleneck is. Basic ATS is the floor: it's what makes any other corporate hiring feature possible. See [[02-concepts/application-lifecycle]] for the underlying model.

**How to use it.**

1. Go to **Requisitions → Create new**.

![[13-raw/screenshots/c-ch04-create-requisition-form.png]]

2. Fill in the role details: title, department, location, employment type (permanent / contract — see [[01 How-To Documents/corporate/05-contract-workers|Chapter 5]] for contract), salary band, hiring manager.
3. Select sourcing channels — internal job board only (see [[01 How-To Documents/corporate/06-internal-mobility|Chapter 6]]), external job boards, or your engaged recruitment agencies (see [[01 How-To Documents/corporate/07-vendor-management|Chapter 7]]).
4. Publish the requisition. Candidates start landing in the **Applied** stage.
5. Open the requisition's Pipeline view to see all candidates grouped by stage. Drag a candidate to the next stage to advance them, or click in for the full record.

![[13-raw/screenshots/c-ch04-basic-ats-pipeline-view.png]]

6. At each stage, leave structured notes (covered in Chapter 3 — Team Collaboration). Use scorecards for interview feedback so the decision rationale is preserved.
7. When you're ready to offer, advance the candidate to **Offered**. The offer letter workflow is built in.
8. When the candidate accepts, advance to **Hired**. This triggers the onboarding checklist (see below).

The default stages cover most office-based hiring. If you find them limiting (e.g., your sales hiring needs an extra "ride-along" stage, your engineering hiring needs separate "tech screen" and "system design" stages), that's the signal to move to Full ATS.

## Scale up to Full ATS

### Full Applicant Tracking — _Tier: Premium_

**What this feature is.** Full Applicant Tracking is the complete enterprise ATS: custom stages per role family, automation rules (auto-advance, auto-reject, auto-message based on signals), SLA tracking with alerts, and cross-requisition reporting. It's the feature set that replaces Greenhouse, Lever, or SmartRecruiters.

**Why it matters.** Enterprises running 100+ concurrent requisitions can't operate on a fixed five-stage pipeline. Engineering hiring is fundamentally different from sales hiring is fundamentally different from warehouse hiring. Full ATS lets each role family run the pipeline that fits, while preserving cross-requisition reporting so the TA leader still sees one consolidated view.

**How to use it.**

1. Go to **Settings → Pipeline Templates**.
2. Create a template per role family (Engineering, Sales, Warehouse, Executive, etc.). For each, define the stages in order: e.g., Engineering = Applied → Recruiter Screen → Tech Screen → System Design → Onsite → Offer → Hired.

![[13-raw/screenshots/c-ch04-full-ats-custom-stages-editor.png]]

3. For each stage, set the automation rules:
   - **Auto-advance:** if no decision in N days and no scorecard logged, escalate to the hiring manager.
   - **Auto-reject:** if candidate doesn't respond to scheduling within N days, move to Rejected with a templated message.
   - **Auto-message:** when a candidate moves to a stage, send a templated update.

![[13-raw/screenshots/c-ch04-automation-rules-builder.png]]

4. Set SLA targets per stage (e.g., Recruiter Screen ≤ 3 days, Tech Screen scheduled ≤ 5 days). The system will alert when SLAs slip.
5. When you create a new requisition, choose the appropriate pipeline template. The stages, automation rules, and SLA targets all inherit.
6. Use the **Cross-Requisition Reporting** view (under Analytics) to see funnel conversion, time-in-stage, and source effectiveness across every active req. This is what feeds the board pack.

Don't go wild with custom stages on day one. Start with the default 5-stage template, find the actual gaps from a month of running real reqs, then add the stages you genuinely need. Pipeline templates are easy to over-engineer.

For deeper analytics on top of Full ATS, see [[01 How-To Documents/corporate/08-integrations-and-reporting|Chapter 8]].

## Hand off to onboarding

### Onboarding Checklists — _Tier: Standard_

**What this feature is.** Onboarding Checklists are pre-built templates of tasks for the first 30, 60, or 90 days of a new hire — paperwork, IT provisioning, training enrolment, manager check-ins, and first-month goal setting. The checklist auto-triggers when a candidate moves to **Hired** and is shared with the new joiner, their manager, and HR.

**Why it matters.** Roughly half of new hires who quit in their first year cite poor onboarding. A structured checklist is the single lowest-effort, highest-impact intervention on the early-attrition curve. Without it, every manager onboards differently, things get missed, and the new hire's first impression is chaos.

**How to use it.**

1. Go to **Settings → Onboarding Templates**.
2. Start with the default template (paperwork → IT setup → role training → first-30-day goals → 30/60/90 check-ins). Adjust to your reality:
   - Add company-specific paperwork (POPIA consent, EE declaration, conflict-of-interest disclosure).
   - Add IT provisioning items that match your stack (Slack, Jira, AWS, etc.).
   - Add role-specific training (sales bootcamp, engineering onboarding, compliance modules).
3. For each task, set the owner (new hire / manager / HR / IT) and the due date relative to start day (e.g., "Day 1", "Day 7", "Day 30").
4. Create separate templates per role family if onboarding genuinely differs (engineering needs Jira / GitHub setup; sales needs CRM / quota provisioning).
5. When a candidate hits **Hired**, the system asks which template to apply and the start date. Once confirmed, the checklist auto-shares with the new hire, manager, and HR.
6. Track completion from the Onboarding dashboard. Overdue tasks alert the owner; consistently overdue patterns are a signal that the template is unrealistic and should be tuned.

![[13-raw/screenshots/c-ch04-onboarding-checklist.png]]

The first version of your template will be wrong — usually too ambitious for week one and too sparse for week three. Tune it based on completion data after the first three hires.

## Checklist

- [ ] You've decided whether to start on Basic ATS or jump straight to Full ATS
- [ ] You've created and published your first requisition
- [ ] You're using the Pipeline view daily and leaving decisions as comments on candidate records
- [ ] If on Full ATS: pipeline templates are defined per role family, with automation rules and SLA targets
- [ ] Onboarding templates are configured per role family, owned and due-dated correctly
- [ ] First hired candidate's onboarding checklist is live and tracked

## Features covered in this chapter

| # | Feature | Tier |
|---|---------|------|
| 1 | Basic Applicant Tracking | Standard |
| 2 | Full Applicant Tracking | Premium |
| 3 | Onboarding Checklists | Standard |

## Next chapter

[[01 How-To Documents/corporate/05-contract-workers|Chapter 5 — Contract workers]]

## References

- [[02-concepts/application-lifecycle]] — Candidate lifecycle and stage model
- [[01 How-To Documents/corporate/05-contract-workers|Chapter 5 — Contract workers]]
- [[01 How-To Documents/corporate/06-internal-mobility|Chapter 6 — Internal mobility]]
- [[01 How-To Documents/corporate/07-vendor-management|Chapter 7 — Vendor management]]
- [[03-workflows/business-journey]] — End-to-end corporate hiring journey
