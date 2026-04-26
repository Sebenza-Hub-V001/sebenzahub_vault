---
title: "Chapter 12 — Compliance and audit trail"
type: concept
created: 2026-04-26
updated: 2026-04-26
tags: [how-to, corporate, compliance, popia, bbbee, employment-equity, audit]
status: active
user-types: [business]
---

# Chapter 12 — Compliance and audit trail

SA hiring is a regulated activity. POPIA governs what you can do with candidate personal information; B-BBEE governs how the demographics of who you employ are scored against your scorecard; Employment Equity governs whether the demographics of who you hire match the plan you filed with the Department of Employment and Labour. None of these are optional. All of them assume you can produce evidence on request — not next quarter, today.

Sebenza Hub gives you four pages dedicated to that evidence: POPIA Compliance, B-BBEE, Employment Equity, and the Audit Trail. This chapter walks through each one at a user level. None of these pages replaces your legal counsel or your B-BBEE verification agency — they capture and surface the data those parties need.

## POPIA Compliance

**Where it lives.** `/dashboard/business/popia-compliance`, in the **Compliance & Governance** sidebar group.

**What it does.** Centralises the POPIA controls that touch candidate data: consent records (who consented to what processing, and when), data subject access request (DSAR) handling, retention policy configuration (how long candidate records survive after a hire / a rejection / a year of inactivity), and the standard Operator paperwork register for the third parties that process candidate data on your behalf (background-check providers, your HRIS, your Sebenza-managed WhatsApp bot). It's the page you open when the Information Regulator asks "show me your POPIA controls".

**When to use it.**

- **At setup.** Configure the retention policy, document the lawful basis you're relying on for each processing purpose, and load the Operator agreements that already exist with the third parties Sebenza integrates with.
- **On every DSAR.** Candidates have the right to ask what data you hold and request deletion. The page gives you the workflow to action a request and the evidence that you did.
- **Quarterly.** Review the Operator register against your live integrations. Any new vendor that receives candidate data needs an Operator agreement on file before they're processing.

## B-BBEE

**Where it lives.** `/dashboard/business/bbbee`, in the **Compliance & Governance** sidebar group.

**What it does.** B-BBEE scoring is multi-element (ownership, management control, skills development, ESD, socio-economic development). The piece this page handles is the part hiring touches directly: **management control demographics** — the racial and gender composition of management, executive, and other reporting categories — and **employment of designated groups** — Black, female, and disabled headcount as the verification agency will measure it. It pulls live demographic data from the platform and projects forward against your hiring plan.

**When to use it.**

- **Annually, ahead of verification.** Your verification agency will ask for the data this page already aggregates. Pull a snapshot for the verification window.
- **Quarterly.** Use the projection view to see whether your hiring rate keeps you on the scorecard band you're targeting. If the projection shows you slipping a level, that's the trigger to adjust the hiring mix while there's still time.

## Employment Equity

**Where it lives.** `/dashboard/business/employment-equity`, in the **Compliance & Governance** sidebar group.

**What it does.** Manages the EE plan filed with the Department of Employment and Labour and the EE reports submitted annually. Captures the targets per occupational level and demographic dimension, tracks actuals against targets across the year, and produces the EEA2 / EEA4-style outputs the department expects. Pulls candidate and hire data from the same platform so the report doesn't disagree with your operational hiring data.

**When to use it.**

- **Once a year, at plan setup.** Load the EE plan you've filed, with the per-level targets agreed with the EE Committee.
- **Monthly.** Review actuals against plan. The Diversity Analytics view in [[01 How-To Documents/corporate/14-analytics-and-reporting|Chapter 14]] is the operational lens; this page is the regulatory lens. They should agree.
- **At report submission time.** Generate the EEA-format outputs and compare them to what you'd report manually before submitting.

## Audit Trail

**Where it lives.** `/dashboard/business/audit-trail`, in the **Compliance & Governance** sidebar group.

**What it does.** A read-only log of every consequential action across the platform — who logged in, who created or edited a requisition, who advanced or rejected a candidate, who exported data, who changed a permission, who ordered a background check, who triggered an AI tool call. Each entry is timestamped, attributed to a user, and immutable. It's the page that answers "who did what, when?" without anyone having to remember.

**Why this matters at audit time.** Internal Audit, your B-BBEE verifier, and a POPIA enforcement notice all converge on the same question: produce the evidence that controls were followed. Without an audit trail, the answer is a forensic exercise across email and Slack. With one, the answer is a filtered query.

**A note on AI actions.** The audit trail captures the **tool_calls** every AI feature makes — the model didn't just produce output, it called specific functions against your data, and each of those calls is logged. When a candidate or a regulator asks "what did the AI do with my information?", the audit trail is where the answer comes from. This is increasingly material for enterprise risk and compliance teams as AI features take on more of the operational load.

**When to use it.**

- **On any incident.** Suspected unauthorised access, a candidate complaint, an internal control test — the audit trail is the first place to look.
- **Quarterly.** Sample-test entries against expected user behaviour. Outliers (a recruiter exporting 5,000 candidate records on a weekend) deserve a conversation.
- **At access reviews.** Cross-reference the audit trail against the current Team Members list to find dormant or orphaned accounts that should be deactivated.

## Honest limits

These pages aggregate, surface, and preserve the data you need for compliance. They do not replace:

- Your lawyer, for POPIA interpretation.
- Your B-BBEE verification agency, for scorecard verification.
- Your EE Committee, for plan negotiation.
- Your Internal Audit team, for control testing.

What they do, that the spreadsheet-based incumbents don't, is make the data continuously available rather than reconstructed annually. That alone changes the conversation from a forensic one to a managerial one.

## Checklist

- [ ] POPIA retention policy configured; Operator agreements loaded; DSAR workflow tested
- [ ] B-BBEE management control and designated-group projections reviewed quarterly
- [ ] Employment Equity plan loaded with per-level targets; monthly actuals tracked
- [ ] Audit Trail reviewed quarterly with sample-test of high-risk action types
- [ ] Anyone with platform access knows that AI tool calls are logged alongside human actions

## Features covered in this chapter

| # | Feature | Tier | Route |
|---|---------|------|-------|
| 1 | POPIA Compliance | Standard | `/dashboard/business/popia-compliance` |
| 2 | B-BBEE | Standard | `/dashboard/business/bbbee` |
| 3 | Employment Equity | Standard | `/dashboard/business/employment-equity` |
| 4 | Audit Trail | Standard | `/dashboard/business/audit-trail` |

## Next chapter

[[01 How-To Documents/corporate/13-workforce-and-hr|Chapter 13 — Workforce and HR]]

## References

- [[02-concepts/compliance]] — POPIA, B-BBEE, EE context
- [[01 How-To Documents/corporate/06-receiving-applications|Chapter 6 — Receiving applications]]
- [[01 How-To Documents/corporate/07-screening-and-evaluating|Chapter 7 — Screening and evaluating]]
- [[01 How-To Documents/corporate/14-analytics-and-reporting|Chapter 14 — Analytics and reporting]]
