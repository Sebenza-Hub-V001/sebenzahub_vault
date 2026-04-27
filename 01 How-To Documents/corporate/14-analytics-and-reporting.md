---
title: "Chapter 14 — Analytics and reporting"
type: concept
created: 2026-04-26
updated: 2026-04-26
tags: [how-to, corporate, analytics, predictive, diversity, custom-reports, reporting]
status: active
user-types: [business]
---

# Chapter 14 — Analytics and reporting

The **Analytics** sidebar group is where the operational signal becomes a number a TA leader can act on and a board pack can ship. Four pages, sequenced from descriptive (what happened) to predictive (what's about to happen) to prescriptive (the output you ship).

The pages you'll use:

- **Recruitment Analytics** ([https://www.sebenzahub.co.za/dashboard/business/analytics](https://www.sebenzahub.co.za/dashboard/business/analytics)) — the live operational dashboard.
- **Predictive Analytics** ([https://www.sebenzahub.co.za/dashboard/business/predictive-analytics](https://www.sebenzahub.co.za/dashboard/business/predictive-analytics)) — forward-looking projection of pipelines and offers.
- **Diversity Analytics** ([https://www.sebenzahub.co.za/dashboard/business/diversity-analytics](https://www.sebenzahub.co.za/dashboard/business/diversity-analytics)) — the demographic funnel for EE / B-BBEE.
- **Custom Reports** ([https://www.sebenzahub.co.za/dashboard/business/custom-reports](https://www.sebenzahub.co.za/dashboard/business/custom-reports)) — drag-and-drop report builder for the things the standard pages don't show.

## See your data live

### Recruitment Analytics — _Tier: Standard (Standard surface) · Premium (deeper drill-downs and BI export)_

**Where it lives.** [https://www.sebenzahub.co.za/dashboard/business/analytics](https://www.sebenzahub.co.za/dashboard/business/analytics), in the **Analytics** sidebar group.

**What this feature is.** Recruitment Analytics surfaces the operational hiring metrics every TA leader is measured on: time-to-hire, funnel conversion (applied → interviewed → offered → hired), source analytics (which channels produce hires), and per-requisition performance. It's a live view, not a monthly extract. Premium unlocks the deeper drill-downs — cross-period comparisons (this quarter vs same quarter last year), cohort analysis, funnel decomposition by source / role / hiring manager / demographic, and ad-hoc filter combinations — plus BI export to PowerBI / Tableau for analysis you can't do in the dashboard.

**Why it matters.** HR leaders are increasingly held accountable for hiring KPIs at executive level. A live dashboard turns the monthly board-pack compilation from a day's work into a screenshot. More importantly, it turns hiring from a reactive function (reporting on what happened) into a proactive one (spotting bottlenecks while there's time to fix them). Premium drill-downs are where you answer the ad-hoc question the CEO sends at 6pm — "why is our Engineering hiring slower than Sales?" — without three days of data wrangling.

**How to use it.**

1. Open Recruitment Analytics. The default view shows organisation-level metrics for the current quarter.

![[c-ch08-analytics-dashboard-hero.png]]

2. Filter by department, role family, or hiring manager to drill into the part of the funnel you care about.
3. Use the **Bottleneck View** to see which stages have the longest dwell time. Long dwell at "Recruiter Screen" usually means under-resourced TA; long dwell at "Hiring Manager Review" usually means manager engagement is the issue.
4. Set up the dashboard as a saved view for your weekly team meeting and your monthly leadership update. The same view becomes the conversation starter both times.
5. **On Premium** — for ad-hoc questions, build a drill-down view, save it as a personal report, and share the link with the asker. Configure scheduled exports (S3, Azure Blob, or a direct BI connector) under **Settings → Data Export**. Frequency is configurable — daily for active datasets, weekly for slower-moving ones.

![[c-ch08-advanced-analytics-drilldown.png]]

6. Cohort analysis is the highest-leverage view in this module. Common starter question: "Of candidates we hired in Q1, what percentage are still here at 12 months?" If the answer is below 80%, your hiring quality has a problem worth investigating before scaling further.

## Predict where the pipeline is going

### Predictive Analytics — _Tier: Premium_

**Where it lives.** [https://www.sebenzahub.co.za/dashboard/business/predictive-analytics](https://www.sebenzahub.co.za/dashboard/business/predictive-analytics), in the **Analytics** sidebar group.

**What this feature is.** Predictive Analytics takes your historical hiring data and projects forward — likely time-to-fill on each open requisition, predicted offer-acceptance rate by candidate signal, source channels that historically convert best for the role family. It's the forward-looking layer on top of the descriptive analytics covered above.

**Why it matters.** Standard analytics tell you what happened. Predictive Analytics tells you what's about to happen — which open reqs are likely to slip their target date, which candidates in the current pipeline are likely to accept, which sourcing channels to lean into for the next sprint. For a TA leader running 100+ concurrent reqs, the difference between reactive and proactive is exactly this view.

**Different from Predictive Hiring.** Predictive Analytics is about the trajectory of the requisition; **Predictive Hiring** (covered in [[01 How-To Documents/corporate/09-making-offers|Chapter 9]]) is about the next decision on a specific candidate. They share the underlying model; they answer different questions.

**How to use it.**

1. Review the per-requisition forecast at the start of each week. Reqs flagged as likely to slip get attention before they actually slip.
2. Use the offer-acceptance prediction as input to the offer conversation — a candidate the model flags as low-likelihood to accept is one to overpay slightly or move on from quickly, not one to negotiate hard with.
3. Treat the model output as a prior, not a verdict. The signal is useful at the population level; individual predictions can and will be wrong.

While the AI is working you'll see a multi-phase **AI Progress Messaging** indicator — drafting, validating, scoring, finalising — so you know the model is progressing rather than wondering if the page has hung.

## Track diversity and equity outcomes

### Diversity Analytics — _Tier: Standard_

**Where it lives.** [https://www.sebenzahub.co.za/dashboard/business/diversity-analytics](https://www.sebenzahub.co.za/dashboard/business/diversity-analytics), in the **Analytics** sidebar group.

**What this feature is.** Diversity Analytics is the dedicated home for funnel views that slice your hiring data by the demographic dimensions Employment Equity and B-BBEE care about — race, gender, disability status, age band — across the funnel from application to hire. It is where you see the EE and B-BBEE conversion patterns rather than the operational time-to-hire numbers that live on Recruitment Analytics.

**Why it matters.** EE and B-BBEE compliance is not just an annual reporting exercise — it's a hiring discipline. Diversity Analytics gives the TA leader and the HRBP a live view of the demographic funnel so the patterns are visible while there's still time to act, not after year-end when the report shows the gap. If your EE plan targets 30% representation in a specific category and your funnel is showing 8% at the offer stage, you want to see that in March, not the following March.

**How to use it.**

1. Open Diversity Analytics and review the funnel view by demographic dimension. Apply the same filters you use on the main dashboard (department, role family, hiring manager) to drill into specific parts of the operation.
2. Compare the dimensions against your EE plan targets. The gap between target and actual is your operational signal.
3. Use the per-stage view to find where the funnel narrows for a specific demographic. Funnels often look fine at applied and break at recruiter screen — that's where the intervention has to happen.
4. The same data feeds the Employment Equity and B-BBEE compliance pages covered in [[01 How-To Documents/corporate/12-compliance-and-audit-trail|Chapter 12]]. Diversity Analytics is the operational view; the compliance pages are the reporting view. They should agree.

## Ship it to the board

### Custom Reports — _Tier: Premium_

**Where it lives.** [https://www.sebenzahub.co.za/dashboard/business/custom-reports](https://www.sebenzahub.co.za/dashboard/business/custom-reports), in the **Analytics** sidebar group.

**What this feature is.** Custom Reports is a drag-and-drop report builder for the metrics, filters, and formats your board specifically wants — not the metrics Sebenza thought you'd want. Reports can be scheduled (auto-delivered to the right people on the right cadence) and exported as PDF, Excel, or pushed via API to a downstream system.

**Why it matters.** Every HR leader has a set of metrics their board cares about that doesn't quite fit any pre-built dashboard. Without a custom builder, you're either waiting for Sebenza to build the report you need or you're rebuilding it manually in Excel every month. Custom Reports closes the gap so the board pack assembles itself.

**How to use it.**

1. Open Custom Reports and choose your data source (requisitions, candidates, placements, vendor performance, EE demographics).

![[c-ch08-custom-reports-builder.png]]

2. Drag in the dimensions and metrics you want. Apply filters (e.g., "completed hires only", "this fiscal year", "Engineering and Product departments").
3. Choose the output format — table, chart (bar / line / pie), or pivot.
4. Save the report and configure scheduled delivery: recipients, format (PDF / XLSX), and cadence (weekly / monthly / quarterly). The report lands in inboxes on schedule with no manual step.
5. Build the standard board pack as a single scheduled report set. The TA leader's monthly update becomes an automatic artifact.

## A note on the hiring-to-performance loop

The most powerful report you can build in Custom Reports — and the one most teams ignore for too long — is the hiring-to-performance loop. Pair the interview scorecards (covered in [[01 How-To Documents/corporate/07-screening-and-evaluating|Chapter 7]]) with the performance ratings (covered in [[01 How-To Documents/corporate/13-workforce-and-hr|Chapter 13]]) and ask: which scorecard ratings actually predicted strong first-year performance? Patterns emerge. Certain interviewers systematically over-rate. Certain scorecard dimensions are predictive while others aren't. Certain sourcing channels produce stronger performers. Tune your interviews, your scorecards, and your sourcing channels accordingly. This is the report that turns hiring from a guess into an engineering discipline — and it only exists because the platform owns both ends.

## Checklist

- [ ] Recruitment Analytics is the default home page for your TA team's weekly meeting
- [ ] If on Premium: Recruitment Analytics is exporting to your BI stack on schedule, and ad-hoc drill-downs are saved as personal reports
- [ ] Predictive Analytics is reviewed weekly to surface slipping requisitions before they slip
- [ ] Diversity Analytics is reviewed monthly against EE plan targets; gaps surface in March, not the following March
- [ ] Board pack is a scheduled Custom Report, not a manual artifact
- [ ] The hiring-to-performance loop has been built as a Custom Report and at least one tuning action has been taken from it

## Features covered in this chapter

| # | Feature | Tier | Route |
|---|---------|------|-------|
| 1 | Recruitment Analytics | Standard (surface) · Premium (drill-downs and BI export) | [https://www.sebenzahub.co.za/dashboard/business/analytics](https://www.sebenzahub.co.za/dashboard/business/analytics) |
| 2 | Predictive Analytics | Premium | [https://www.sebenzahub.co.za/dashboard/business/predictive-analytics](https://www.sebenzahub.co.za/dashboard/business/predictive-analytics) |
| 3 | Diversity Analytics | Standard | [https://www.sebenzahub.co.za/dashboard/business/diversity-analytics](https://www.sebenzahub.co.za/dashboard/business/diversity-analytics) |
| 4 | Custom Reports | Premium | [https://www.sebenzahub.co.za/dashboard/business/custom-reports](https://www.sebenzahub.co.za/dashboard/business/custom-reports) |

## Next chapter

[[01 How-To Documents/corporate/15-knowledge-base|Chapter 15 — Knowledge base]]

## References

- [[01 How-To Documents/corporate/07-screening-and-evaluating|Chapter 7 — Screening and evaluating]]
- [[01 How-To Documents/corporate/09-making-offers|Chapter 9 — Making offers]]
- [[01 How-To Documents/corporate/12-compliance-and-audit-trail|Chapter 12 — Compliance and audit trail]]
- [[01 How-To Documents/corporate/13-workforce-and-hr|Chapter 13 — Workforce and HR]]
