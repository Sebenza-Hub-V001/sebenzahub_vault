---
title: "Chapter 5 — Posting jobs"
type: concept
created: 2026-04-26
updated: 2026-04-26
tags: [how-to, corporate, jobs, requisitions, ai, screening-roles]
status: active
user-types: [business]
---

# Chapter 5 — Posting jobs

A requisition is the unit of work in a corporate hiring system: one approved role, one budget, one pipeline, one hire (usually). This chapter is about getting that role drafted, configured, and published — the four tools in the **Post Jobs** sidebar group.

The pages you'll use:

- **Jobs** ([https://www.sebenzahub.co.za/dashboard/business/jobs](https://www.sebenzahub.co.za/dashboard/business/jobs)) — the requisition list and the create/edit form.
- **AI JD Writer** ([https://www.sebenzahub.co.za/dashboard/business/ai-writer](https://www.sebenzahub.co.za/dashboard/business/ai-writer)) — drafts the job description from a few seed inputs.
- **Screening Roles** ([https://www.sebenzahub.co.za/dashboard/business/screening-roles](https://www.sebenzahub.co.za/dashboard/business/screening-roles)) — defines the qualifying questions and screening criteria attached to the role.
- **Content Repurpose** ([https://www.sebenzahub.co.za/dashboard/business/content-repurpose](https://www.sebenzahub.co.za/dashboard/business/content-repurpose)) — turns the published role into channel-shaped variants for distribution.

Read end-to-end the first time. After that, treat each section as reference — most teams will draft a JD with the AI, configure screening, publish, and only then think about distribution.

## Decide which ATS tier you're on

Most Corporate customers start on **Standard** with Basic Applicant Tracking and upgrade to **Premium / Full Applicant Tracking** once they're running 50+ concurrent requisitions or need stage customisation per role family. There is no harm in starting on Basic — the data model is the same, so an upgrade later doesn't lose history.

| If… | Use |
|-----|-----|
| You're running fewer than 20 concurrent requisitions and standard stages work | **Basic Applicant Tracking** |
| You need custom stages per role family (engineering vs sales vs warehouse) | **Full Applicant Tracking** |
| You need automation rules (auto-advance after 5 days, auto-reject after no response) | **Full Applicant Tracking** |
| You report SLAs to a Talent Acquisition leader | **Full Applicant Tracking** |
| You report cross-requisition metrics to your board | **Full Applicant Tracking** |

## Create a requisition

### Jobs — _Tier: Standard (Basic ATS) · Premium (Full ATS)_

**What this feature is.** The Jobs page is the requisition register and the create / edit form. Each requisition holds the role details, the sourcing channels it's published to, the pipeline stages, the team responsible, and the audit trail for every action against it.

**Why it matters.** Without a structured requisition, hiring lives in spreadsheets and email — which means no audit trail when EE reporting is due, no consistency across hiring managers, and no way to tell where the bottleneck is. The Jobs register is the floor: it's what makes any other corporate hiring feature possible. See [[02-concepts/application-lifecycle]] for the underlying model.

**How to use it.**

1. Go to **Jobs → Create new**.

![[c-ch04-create-requisition-form.png]]

2. Fill in the role details: title, department, location, employment type (permanent / contract — see [[01 How-To Documents/corporate/13-workforce-and-hr|Chapter 13]] for contract), salary band, hiring manager.
3. Select sourcing channels — internal job board only (covered in [[01 How-To Documents/corporate/13-workforce-and-hr|Chapter 13]]), external job boards, or your engaged recruitment agencies (see [[01 How-To Documents/corporate/10-vendor-management-and-sourcing|Chapter 10]]).
4. Publish the requisition. Candidates start landing in the **Applied** stage — what happens to them next is covered in [[01 How-To Documents/corporate/06-receiving-applications|Chapter 6]].

The default stages cover most office-based hiring. If you find them limiting (e.g., your sales hiring needs an extra "ride-along" stage, your engineering hiring needs separate "tech screen" and "system design" stages), that's the signal to move to Full ATS.

## Scale up to Full ATS

### Full Applicant Tracking — _Tier: Premium_

**What this feature is.** Full Applicant Tracking is the complete enterprise ATS: custom stages per role family, automation rules (auto-advance, auto-reject, auto-message based on signals), SLA tracking with alerts, and cross-requisition reporting. It's the feature set that replaces Greenhouse, Lever, or SmartRecruiters.

**Why it matters.** Enterprises running 100+ concurrent requisitions can't operate on a fixed five-stage pipeline. Engineering hiring is fundamentally different from sales hiring is fundamentally different from warehouse hiring. Full ATS lets each role family run the pipeline that fits, while preserving cross-requisition reporting so the TA leader still sees one consolidated view.

**How to use it.**

1. Go to **Settings → Pipeline Templates**.
2. Create a template per role family (Engineering, Sales, Warehouse, Executive, etc.). For each, define the stages in order: e.g., Engineering = Applied → Recruiter Screen → Tech Screen → System Design → Onsite → Offer → Hired.

![[c-ch04-full-ats-custom-stages-editor.png]]

3. For each stage, set the automation rules:
   - **Auto-advance:** if no decision in N days and no scorecard logged, escalate to the hiring manager.
   - **Auto-reject:** if candidate doesn't respond to scheduling within N days, move to Rejected with a templated message.
   - **Auto-message:** when a candidate moves to a stage, send a templated update.

![[c-ch04-automation-rules-builder.png]]

4. Set SLA targets per stage (e.g., Recruiter Screen ≤ 3 days, Tech Screen scheduled ≤ 5 days). The system will alert when SLAs slip.
5. When you create a new requisition, choose the appropriate pipeline template. The stages, automation rules, and SLA targets all inherit.
6. Cross-requisition metrics flow through to the analytics surface covered in [[01 How-To Documents/corporate/14-analytics-and-reporting|Chapter 14]].

Don't go wild with custom stages on day one. Start with the default 5-stage template, find the actual gaps from a month of running real reqs, then add the stages you genuinely need. Pipeline templates are easy to over-engineer.

## Draft the job description with AI

### AI JD Writer — _Tier: Premium_

**Where it lives.** [https://www.sebenzahub.co.za/dashboard/business/ai-writer](https://www.sebenzahub.co.za/dashboard/business/ai-writer), in the **Post Jobs** sidebar group.

**What it does.** Given a role title, a department, and a few seed bullet points (responsibilities, must-have skills, level), the AI JD Writer produces a structured job description: summary, responsibilities, requirements, nice-to-haves, and a benefits block. Output respects your **Brand Voice** profile (covered in [[01 How-To Documents/corporate/11-communication-and-automation|Chapter 11]]) so the result reads like your company, not generic LLM prose.

**When to use it.** When you're spinning up a new requisition and don't have a maintained JD library — most corporates don't, even when they think they do. Treat the output as a strong first draft your hiring manager edits, not a final document.

While the AI is working you'll see a multi-phase **AI Progress Messaging** indicator — drafting, validating, scoring, finalising — so you know the model is progressing rather than wondering if the page has hung.

## Configure screening criteria

### Screening Roles — _Tier: Standard_

**Where it lives.** [https://www.sebenzahub.co.za/dashboard/business/screening-roles](https://www.sebenzahub.co.za/dashboard/business/screening-roles), in the **Post Jobs** sidebar group.

**What it does.** Screening Roles is where you define the qualifying questions and minimum criteria that attach to a role — work eligibility, notice period, salary expectation, must-have qualifications, location preferences. The criteria flow into the application form candidates fill out and into the screening tools in [[01 How-To Documents/corporate/07-screening-and-evaluating|Chapter 7]] (notably the Screening Bot).

**When to use it.** Set this up before you publish the role. Every requisition you publish without screening criteria forces the recruiter to re-ask the same five questions on every first call — which is the time tax that screening is meant to remove. Even a minimal set (work eligibility, notice period, expected salary) saves real recruiter hours per role.

**How to use it.**

1. Open Screening Roles and either pick a saved template or create one fresh.
2. Add the qualifying questions: free-text, multi-choice, or numeric (e.g., notice period in days). Mark the must-haves so candidates that fail them are surfaced visibly in the pipeline rather than getting lost.
3. Save the screening role and attach it to the requisition you're publishing. The same screening role can be reused across requisitions in the same role family.

## Distribute the role

### Content Repurpose — _Tier: Premium_

**Where it lives.** [https://www.sebenzahub.co.za/dashboard/business/content-repurpose](https://www.sebenzahub.co.za/dashboard/business/content-repurpose), in the **Post Jobs** sidebar group.

**What it does.** Takes a published job and produces channel-shaped variants: a LinkedIn post, a shorter X/Twitter version, a WhatsApp broadcast snippet, and an internal Slack message. Each variant respects the platform's character and formatting limits and your Brand Voice profile.

**When to use it.** Every time you publish a role you intend to push beyond the career page. Saves the recruiter an hour of reformatting and produces sharper, on-brand copy than most people write at 4pm.

## Checklist

- [ ] You've decided whether to start on Basic ATS or jump straight to Full ATS
- [ ] You've created and published your first requisition with a sourcing channel mix that matches the role
- [ ] The Brand Voice profile is set so AI JD Writer produces on-brand copy (configured in Chapter 11)
- [ ] A screening role with at least the basic qualifying questions is attached to every published role
- [ ] If on Full ATS: pipeline templates are defined per role family, with automation rules and SLA targets
- [ ] Content Repurpose has been used for any role distributed beyond the career page

## Features covered in this chapter

| # | Feature | Tier | Route |
|---|---------|------|-------|
| 1 | Jobs (requisition register) | Standard (Basic) · Premium (Full ATS) | [https://www.sebenzahub.co.za/dashboard/business/jobs](https://www.sebenzahub.co.za/dashboard/business/jobs) |
| 2 | AI JD Writer | Premium | [https://www.sebenzahub.co.za/dashboard/business/ai-writer](https://www.sebenzahub.co.za/dashboard/business/ai-writer) |
| 3 | Screening Roles | Standard | [https://www.sebenzahub.co.za/dashboard/business/screening-roles](https://www.sebenzahub.co.za/dashboard/business/screening-roles) |
| 4 | Content Repurpose | Premium | [https://www.sebenzahub.co.za/dashboard/business/content-repurpose](https://www.sebenzahub.co.za/dashboard/business/content-repurpose) |

## Next chapter

[[01 How-To Documents/corporate/06-receiving-applications|Chapter 6 — Receiving applications]]

## References

- [[02-concepts/application-lifecycle]] — Candidate lifecycle and stage model
- [[01 How-To Documents/corporate/06-receiving-applications|Chapter 6 — Receiving applications]]
- [[01 How-To Documents/corporate/10-vendor-management-and-sourcing|Chapter 10 — Vendor management and sourcing]]
- [[01 How-To Documents/corporate/11-communication-and-automation|Chapter 11 — Communication and automation]]
- [[01 How-To Documents/corporate/13-workforce-and-hr|Chapter 13 — Workforce and HR]]
- [[01 How-To Documents/corporate/14-analytics-and-reporting|Chapter 14 — Analytics and reporting]]
- [[03-workflows/business-journey]] — End-to-end corporate hiring journey
