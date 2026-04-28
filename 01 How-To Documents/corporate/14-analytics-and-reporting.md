---
title: "Chapter 14 — Analytics and reporting"
type: concept
created: 2026-04-26
updated: 2026-04-28
tags: [how-to, corporate, analytics, predictive, diversity, custom-reports, reporting, panel-analysis, ai-intelligence]
status: active
user-types: [business]
---

# Chapter 14 — Analytics and reporting

The **Analytics** sidebar group is where the operational signal becomes a number a TA leader can act on and a board pack can ship. Four pages, sequenced from descriptive (what happened) to predictive (what's about to happen) to demographic (whether your funnel is fair) to prescriptive (the output you ship).

Two further analytics surfaces ride on top of the Analytics group and get covered here for completeness:

- **Team DNA** lives in the Workforce & HR group ([[01 How-To Documents/corporate/13-workforce-and-hr|Chapter 13]]) but answers an analytics question — *what's the shape of our hiring team?* — so it gets a callback in this chapter.
- **AI Candidate Summary** and **Engagement Score** are embedded on records and on the Pipeline ([[01 How-To Documents/corporate/06-receiving-applications|Chapter 6]]) — they're the always-on intelligence layer that the Analytics pages don't replace.

The pages you'll use:

- **Recruitment Analytics** ([https://www.sebenzahub.co.za/dashboard/business/analytics](https://www.sebenzahub.co.za/dashboard/business/analytics)) — the live operational dashboard.
- **Predictive Analytics** ([https://www.sebenzahub.co.za/dashboard/business/predictive-analytics](https://www.sebenzahub.co.za/dashboard/business/predictive-analytics)) — forward-looking projection of pipelines and offers.
- **Diversity Analytics** ([https://www.sebenzahub.co.za/dashboard/business/diversity-analytics](https://www.sebenzahub.co.za/dashboard/business/diversity-analytics)) — the demographic funnel for EE / B-BBEE.
- **Custom Reports** ([https://www.sebenzahub.co.za/dashboard/business/custom-reports](https://www.sebenzahub.co.za/dashboard/business/custom-reports)) — drag-and-drop report builder for the things the standard pages don't show.

## The four-report rhythm

You don't need to look at every dashboard every day. You need a tight rhythm where each report has a moment in your week:

| Report | Frequency | Time spent |
|---|---|---|
| **Recruitment Analytics — headline view** | Weekly (Monday) | 10 min |
| **Recruitment Analytics — deep-dive** | Monthly (1st Monday) | 30 min |
| **Predictive Analytics** | Weekly (mid-week) | 20 min |
| **Diversity Analytics** | Monthly | 20 min |
| **Custom Reports — board pack** | Monthly (auto-scheduled) | 0 min (delivered) |

Roughly two hours per month on analytics. The TA functions that hit their KPIs are the ones that actually run this rhythm, not the ones that produce the most beautiful annual report.

## See your data live

### Recruitment Analytics — _Tier: Standard (surface) · Premium (deeper drill-downs and BI export)_

**Where it lives.** [https://www.sebenzahub.co.za/dashboard/business/analytics](https://www.sebenzahub.co.za/dashboard/business/analytics), in the **Analytics** sidebar group.

**What this feature is.** Recruitment Analytics surfaces the operational hiring metrics every TA leader is measured on: time-to-hire, funnel conversion (applied → interviewed → offered → hired), source analytics (which channels produce hires), and per-requisition performance. It's a live view, not a monthly extract. Premium unlocks the deeper drill-downs — cross-period comparisons (this quarter vs same quarter last year), cohort analysis, funnel decomposition by source / role / hiring manager / demographic, and ad-hoc filter combinations — plus BI export to PowerBI / Tableau for analysis you can't do in the dashboard.

**Why it matters.** HR leaders are increasingly held accountable for hiring KPIs at executive level. A live dashboard turns the monthly board-pack compilation from a day's work into a screenshot. More importantly, it turns hiring from a reactive function (reporting on what happened) into a proactive one (spotting bottlenecks while there's time to fix them). Premium drill-downs are where you answer the ad-hoc question the CEO sends at 6pm — "why is our Engineering hiring slower than Sales?" — without three days of data wrangling.

### What it shows

The default view shows organisation-level metrics for the current quarter:

- **Hires** this week / month / quarter / year
- **Time-to-hire** average and trend
- **Fill rate** (hires / requisitions opened)
- **Funnel conversion ratios**: application-to-interview, interview-to-offer, offer-acceptance
- **Source effectiveness** — which channels (direct, internal mobility, vendor agency, AI Search, referral) actually produce hires
- **Per-requisition performance** — drill into any req for its own conversion shape
- **Per-recruiter performance** — hires, fill rate, time-to-hire per TA team member
- **Per-hiring-manager performance** — interview rate, offer rate, retention of their hires
- **Active requisitions** count
- **Pipeline value** — forecasted hires from open reqs over the next 60 days
- **Retention rate** — hires still active at 90 / 180 / 365 days

### How to read it in 10 minutes

1. **Glance at the headline hires number for the week.** Up vs last week? Down? If down, why?
2. **Scan the trend lines.** Anything declining for 3 weeks straight is a problem you need to investigate — usually with the Bottleneck View below.
3. **Check pipeline value vs last week.** If pipeline value is declining and hires are flat, your future is shrinking even though your present looks OK.
4. **Look at top requisitions by stagnation.** Anything not moving for 14+ days? That's tomorrow's missed-target.
5. **Check fill rate.** If it's below your historical average, the next step is the Predictive Analytics view to see which open reqs are likely to slip and need intervention.

That's the routine. Not "stare at every chart." A focused 10-minute scan, then act on what stands out.

### The Bottleneck View

Use the **Bottleneck View** to see which stages have the longest dwell time. Long dwell at "Recruiter Screen" usually means under-resourced TA; long dwell at "Hiring Manager Review" usually means manager engagement is the issue. The Bottleneck View is the most useful single drill-down on the page — get familiar with it.

![[c-ch14-bottleneck-view-stage-dwell.png]]

### The numbers that lie

Not every metric is honest. Watch out for:

- **Hires without retention.** A hire counts immediately, but if the candidate leaves in 60 days the function did the work twice. Always read hires alongside retention rate.
- **Application volume without quality.** 500 applications this month sounds great until you see only 8 reached interview. Application-to-interview ratio is the quality signal.
- **Time-to-hire average.** A few unusually fast or slow hires skew the average. Look at the median, not just the average. Better still: look at the distribution.
- **Pipeline value.** Inflated by reqs that aren't really moving. Cross-check with stage age in the Pipeline ([[01 How-To Documents/corporate/06-receiving-applications|Chapter 6]]) — pipeline value from stagnant reqs isn't real value.

### Questions to ask monthly

Each month, walk through these questions and see if the data gives you a clear answer:

1. **Where in the funnel are we losing the most candidates, and why?**
2. **Which sourcing channel has the best hire rate, and are we investing time there proportionally?**
3. **Which department / function has the worst time-to-hire, and what's the bottleneck?**
4. **Which recruiter or hiring manager is underperforming, and is it a coaching problem or a load problem?**
5. **Which requisitions had the biggest delay between offer and acceptance, and what's the offer-experience signal?**
6. **Which sourcing channel produced the most retention-positive hires (still here at 12 months), and are we leaning into it?**

If you can't answer one of these from the data, that's a sign your data hygiene is off — usually missing reject reasons or stale stage assignments. Fix the data and the answer becomes visible.

### How to use it

1. Open Recruitment Analytics. The default view shows organisation-level metrics for the current quarter.

![[c-ch08-analytics-dashboard-hero.png]]

2. Filter by department, role family, or hiring manager to drill into the part of the funnel you care about.
3. Set up the dashboard as a saved view for your weekly TA standup and your monthly leadership update. The same view becomes the conversation starter both times.
4. **On Premium** — for ad-hoc questions, build a drill-down view, save it as a personal report, and share the link with the asker. Configure scheduled exports (S3, Azure Blob, or a direct BI connector) under **Settings → Data Export**. Frequency is configurable — daily for active datasets, weekly for slower-moving ones.

![[c-ch08-advanced-analytics-drilldown.png]]

5. **Cohort analysis is the highest-leverage view.** Common starter question: "Of candidates we hired in Q1, what percentage are still here at 12 months?" If the answer is below 80%, your hiring quality has a problem worth investigating before scaling further.

![[c-ch14-cohort-analysis-retention.png]]

## Predict where the pipeline is going

### Predictive Analytics — _Tier: Premium_

**Where it lives.** [https://www.sebenzahub.co.za/dashboard/business/predictive-analytics](https://www.sebenzahub.co.za/dashboard/business/predictive-analytics), in the **Analytics** sidebar group.

**What this feature is.** Predictive Analytics takes your historical hiring data and projects forward — likely time-to-fill on each open requisition, predicted offer-acceptance rate by candidate signal, source channels that historically convert best for the role family. It's the forward-looking layer on top of the descriptive analytics covered above.

**Why it matters.** Standard analytics tell you what happened. Predictive Analytics tells you what's about to happen — which open reqs are likely to slip their target date, which candidates in the current pipeline are likely to accept, which sourcing channels to lean into for the next sprint. For a TA leader running 100+ concurrent reqs, the difference between reactive and proactive is exactly this view.

**Different from Predictive Hiring.** Predictive Analytics is about the trajectory of the requisition; **Predictive Hiring** (covered in [[01 How-To Documents/corporate/09-making-offers|Chapter 9]]) is about the next decision on a specific candidate. They share the underlying model; they answer different questions.

### What it shows

- **Next month's expected hires** (range, not single number)
- **Next quarter's expected fill rate** for the current open reqs
- **At-risk requisitions** — open reqs the model predicts won't fill in time
- **Hiring-manager engagement risk** — managers whose responsiveness signals predict offer slippage
- **Recruiter capacity warnings** — TA team members heading toward overload or underutilisation
- **Source channel projection** — which channels are projected to convert best for the role families currently open

### Use it to make decisions, not just to watch

Predictive Analytics is only useful if you act on it:

- **At-risk requisition flagged?** Discuss with the hiring manager about widening the brief, increasing the salary band, or extending the timeline. Use the Requirement Restriction Analyzer (Ch.6) for the data-backed conversation.
- **Hiring-manager engagement risk?** Schedule a check-in this week, not next month. Engagement decay at the manager level is the leading cause of offer-stage drop-off.
- **Recruiter overload warning?** Reassign some of their reqs to a colleague before they burn out. Burnout at the recruiter level produces poor candidate experiences that show up in NPS three months later.
- **Recruiter underload warning?** Either give them more reqs or have a development conversation.

The predictions are probabilistic — they're not certainties. Use them as an early warning system, not as predetermined outcomes.

![[c-ch14-predictive-analytics-forecast.png]]

While the AI is working you'll see a multi-phase **AI Progress Messaging** indicator — drafting, validating, scoring, finalising — so you know the model is progressing rather than wondering if the page has hung.

## Track diversity and equity outcomes

### Diversity Analytics — _Tier: Standard_

**Where it lives.** [https://www.sebenzahub.co.za/dashboard/business/diversity-analytics](https://www.sebenzahub.co.za/dashboard/business/diversity-analytics), in the **Analytics** sidebar group.

**What this feature is.** Diversity Analytics is the dedicated home for funnel views that slice your hiring data by the demographic dimensions Employment Equity and B-BBEE care about — race, gender, disability status, age band — across the funnel from application to hire. It is where you see the EE and B-BBEE conversion patterns rather than the operational time-to-hire numbers that live on Recruitment Analytics.

**Why it matters.** EE and B-BBEE compliance is not just an annual reporting exercise — it's a hiring discipline. Diversity Analytics gives the TA leader and the HRBP a live view of the demographic funnel so the patterns are visible while there's still time to act, not after year-end when the report shows the gap. If your EE plan targets 30% representation in a specific category and your funnel is showing 8% at the offer stage, you want to see that in March, not the following March.

This is the most important page in the chapter for any organisation operating in South Africa. EE legislation, B-BBEE scorecards, and CCMA risk all converge on whether your funnels are honestly representative or quietly discriminatory.

### What it shows

For every requisition, every department, and your organisation overall, the Diversity dashboard breaks down:

- **Race** (per the SA EE categories: African, Coloured, Indian, White, plus 'Other')
- **Gender**
- **Disability status** (where disclosed)
- **Age band**

Crucially, it shows these breakdowns **at every stage of the funnel**:

```
Application pool: 45% female, 40% PDI*
       ↓
Screening pass:   30% female, 25% PDI    ← drop-off here
       ↓
Interview stage:  25% female, 20% PDI
       ↓
Offer stage:      20% female, 15% PDI
       ↓
Hired:            18% female, 12% PDI
```

*PDI = Previously Disadvantaged Individuals, the SA EE category.

### Reading the funnel

The pattern above tells a story: the application pool was reasonably balanced, but the **biggest drop happens at screening**. That's where bias is entering your funnel. Either:

- The Screening Roles knockout questions are filtering disproportionately
- The CV screen is biased (consciously or not)
- The Screening Bot is producing skewed scores
- The auto-scoring AI is biased against the demographics that dropped out

Diversity Analytics doesn't tell you *which* of these is the cause — but it tells you exactly *where* to investigate. Once you know screening is the leak, you go back to the screening tools ([[01 How-To Documents/corporate/07-screening-and-evaluating|Chapter 7]]) and audit each one with the same demographic filter applied.

![[c-ch14-diversity-funnel-stage-dropoff.png]]

### What "good" looks like

There's no single "right" diversity number — it depends on the talent pool for the role, your EE plan targets, and the realistic candidate availability. But there are bad signs that always need attention:

- **Sharp drop at one stage** — bias is entering at that stage
- **Final hire rates worse than the application pool** — your funnel is filtering out diversity
- **Year-over-year decline** — your hiring is becoming less diverse over time, regardless of EE plan targets
- **Worse than peer organisations in the same sector** — competitive benchmark you're underperforming on

### Connection to EE compliance

Your organisation has an EE plan with specific targets. The Diversity dashboard lets you filter by department, role family, or hiring manager to see exactly where representation is being built or eroded. Catch this monthly, not at year-end. The same data feeds the Employment Equity and B-BBEE compliance pages covered in [[01 How-To Documents/corporate/12-compliance-and-audit-trail|Chapter 12]] — Diversity Analytics is the operational view; the compliance pages are the reporting view. They should agree.

### How to use it

1. Open Diversity Analytics and review the funnel view by demographic dimension.
2. Apply the same filters you use on Recruitment Analytics (department, role family, hiring manager) to drill into specific parts of the operation.
3. Compare the dimensions against your EE plan targets. The gap between target and actual is your operational signal.
4. Use the per-stage view to find where the funnel narrows for a specific demographic. Funnels often look fine at applied and break at recruiter screen — that's where the intervention has to happen.

## Always-on intelligence (embedded, not its own page)

Several analytics surfaces don't have a dedicated Analytics-group page; they're embedded where you'll use them. Document them here so the analytics picture is complete:

### AI Candidate Summary — _Tier: Premium · embedded on every candidate record_

A one-page summary the AI generates per candidate covering: key strengths, risk assessment (gaps, red flags, things to verify), fit analysis against the open requisition, suggested interview talking points, and a comparison against the role requirements. A summary takes 10 seconds to read vs 7 minutes to read a full CV. For high-volume hiring, this 40× speedup is the difference between reviewing 50 CVs in a day and reviewing 5.

Covered in detail as part of [[01 How-To Documents/corporate/07-screening-and-evaluating|Chapter 7]].

### Pattern detection across your data — _Tier: Premium · surfaces in dashboard alerts_

The "intelligence" part is the cross-candidate insights:

- *"3 of your shortlisted candidates have competing offers — prioritise outreach today"*
- *"This candidate's engagement score has been declining for 2 weeks — they may drop out"*
- *"Skill gap detected: none of your senior dev shortlist has AWS certification, which the hiring manager just added as a requirement"*
- *"Hire retention at Department X has been 60% over the last year — investigate before more requisitions there"*

These are insights you'd never spot manually because they require querying across hundreds of records simultaneously. The AI does it continuously and surfaces what matters in dashboard alerts. Use the alerts to direct your attention; don't outsource your judgment.

### Engagement Score — _Tier: Standard · embedded on Pipeline cards_

The Engagement Score is a composite per-candidate metric showing how engaged each candidate is with you. It rolls up email open rates, response times, assessment completion, interview attendance, message sentiment, and application completion. A high engagement score (80+) means the candidate is actively engaged and worth pushing forward. A declining score is a leading indicator that they're losing interest — fix it before they ghost.

Covered in detail as part of [[01 How-To Documents/corporate/06-receiving-applications|Chapter 6]] (the Pipeline routine).

### Team DNA — _Tier: Premium · lives in Workforce & HR_

Team DNA is the analytics view of your TA team and the broader hiring panel. It shows each team member's strengths (sourcing speed, screening quality, interview consistency), their specialisations (which sectors and seniority levels they perform best in), their capacity (current load vs historical norm), and your team's coverage gaps (areas where you're thin and need to hire or train).

Covered in detail in [[01 How-To Documents/corporate/13-workforce-and-hr|Chapter 13]] alongside the rest of the workforce-data tools — but conceptually it's an analytics surface and worth running quarterly as part of the analytics rhythm.

## Ship it to the board

### Custom Reports — _Tier: Premium_

**Where it lives.** [https://www.sebenzahub.co.za/dashboard/business/custom-reports](https://www.sebenzahub.co.za/dashboard/business/custom-reports), in the **Analytics** sidebar group.

**What this feature is.** Custom Reports is a drag-and-drop report builder for the metrics, filters, and formats your board specifically wants — not the metrics Sebenza thought you'd want. Reports can be scheduled (auto-delivered to the right people on the right cadence) and exported as PDF, Excel, or pushed via API to a downstream system.

**Why it matters.** Every HR leader has a set of metrics their board cares about that doesn't quite fit any pre-built dashboard. Without a custom builder, you're either waiting for Sebenza to build the report you need or you're rebuilding it manually in Excel every month. Custom Reports closes the gap so the board pack assembles itself.

**How to use it.**

1. Open Custom Reports and choose your data source (requisitions, candidates, hires, vendor performance, EE demographics, scorecard data, performance ratings).

![[c-ch08-custom-reports-builder.png]]

2. Drag in the dimensions and metrics you want. Apply filters (e.g., "completed hires only", "this fiscal year", "Engineering and Product departments").
3. Choose the output format — table, chart (bar / line / pie), or pivot.
4. Save the report and configure scheduled delivery: recipients, format (PDF / XLSX), and cadence (weekly / monthly / quarterly). The report lands in inboxes on schedule with no manual step.
5. Build the standard board pack as a single scheduled report set. The TA leader's monthly update becomes an automatic artifact.

![[c-ch14-custom-report-scheduled-delivery.png]]

### The hiring-to-performance loop — the report most teams skip

The most powerful report you can build in Custom Reports — and the one most teams ignore for too long — is the hiring-to-performance loop. Pair the interview scorecards (covered in [[01 How-To Documents/corporate/07-screening-and-evaluating|Chapter 7]]) with the performance ratings (covered in [[01 How-To Documents/corporate/13-workforce-and-hr|Chapter 13]]) and ask: which scorecard ratings actually predicted strong first-year performance? Patterns emerge. Certain interviewers systematically over-rate. Certain scorecard dimensions are predictive while others aren't. Certain sourcing channels produce stronger performers. Tune your interviews, your scorecards, and your sourcing channels accordingly. This is the report that turns hiring from a guess into an engineering discipline — and it only exists because the platform owns both ends.

## AI cost in ZAR

The Predictive and Usage Analytics tabs on the analytics page show **ZAR alongside USD on every metered AI line**. The underlying model layer charges in fractions of a US dollar; finance teams plan and budget in rand. Both numbers are visible at a glance so you don't have to do mental conversions while reading the dashboard.

Practically: when you're sizing an experiment, comparing two prompt strategies, or sanity-checking the TA function's monthly AI spend, the ZAR figure is the one to anchor on.

> **Cost-per-request is volume-weighted, not arithmetic mean.** When the dashboard shows "average cost per AI call" or "average cost per screening run", that average is weighted by the number of calls, not a simple mean of per-call cost. One unusually expensive run won't drag your displayed average up the way an arithmetic mean would. The number you see is closer to "what an additional call typically costs you right now" — useful for forecasting, not skewed by outliers.

## Pro tips

- **Numbers without action are wallpaper.** Looking at dashboards without making decisions is a waste of time. Every report review should end with "what am I changing because of this?"
- **Track the trend, not the level.** A 30-day time-to-hire of 28 days means nothing in isolation. A 30-day time-to-hire that was 22 last quarter and is 28 this quarter is a 27% degradation and a real problem.
- **Cross-reference reports.** If Recruitment Analytics says hires are up but retention is dropping, that's a future quality cliff. Don't read reports in isolation.
- **Share the dashboard in TA standups.** A team that sees the numbers weekly becomes data-literate fast. A team that doesn't develops fictions about what's working.
- **Set targets.** Numbers without targets are descriptive. Numbers with targets are diagnostic. Set quarterly targets for hires, time-to-hire, fill rate, retention rate, and demographic representation. Review them every Monday.
- **Diversity Analytics is not optional.** SA EE law makes this a legal requirement, not a nice-to-have. Build it into your monthly routine.
- **The hiring-to-performance loop is the highest-ROI report.** Build it. Run it twice a year minimum.

## Checklist

- [ ] Recruitment Analytics is the default home page for your TA team's weekly meeting
- [ ] You have a Monday morning routine that includes 10 minutes on Recruitment Analytics
- [ ] If on Premium: Recruitment Analytics is exporting to your BI stack on schedule, and ad-hoc drill-downs are saved as personal reports
- [ ] Predictive Analytics is reviewed weekly to surface slipping requisitions before they slip
- [ ] Diversity Analytics is reviewed monthly against EE plan targets; gaps surface in March, not the following March
- [ ] Board pack is a scheduled Custom Report, not a manual artifact
- [ ] The hiring-to-performance loop has been built as a Custom Report and at least one tuning action has been taken from it
- [ ] You're cross-referencing hires with retention
- [ ] You have quarterly targets for the key metrics
- [ ] AI Candidate Summary is being read on every shortlist
- [ ] Engagement Score declines on Pipeline cards trigger a personal hiring-manager touch within 48 hours
- [ ] Team DNA is run quarterly and informs req allocation across the TA team

## Features covered in this chapter

| # | Feature | Tier | Route |
|---|---------|------|-------|
| 1 | Recruitment Analytics | Standard (surface) · Premium (drill-downs and BI export) | [https://www.sebenzahub.co.za/dashboard/business/analytics](https://www.sebenzahub.co.za/dashboard/business/analytics) |
| 2 | Predictive Analytics | Premium | [https://www.sebenzahub.co.za/dashboard/business/predictive-analytics](https://www.sebenzahub.co.za/dashboard/business/predictive-analytics) |
| 3 | Diversity Analytics | Standard | [https://www.sebenzahub.co.za/dashboard/business/diversity-analytics](https://www.sebenzahub.co.za/dashboard/business/diversity-analytics) |
| 4 | Custom Reports | Premium | [https://www.sebenzahub.co.za/dashboard/business/custom-reports](https://www.sebenzahub.co.za/dashboard/business/custom-reports) |
| 5 | AI Candidate Summary (callback) | Premium | _embedded on candidate records (Ch.7)_ |
| 6 | Pattern detection alerts | Premium | _surface in dashboard_ |
| 7 | Engagement Score (callback) | Standard | _embedded on Pipeline cards (Ch.6)_ |
| 8 | Team DNA (callback) | Premium | _Workforce & HR group (Ch.13)_ |

## Next chapter

[[01 How-To Documents/corporate/15-knowledge-base|Chapter 15 — Knowledge base]]

## References

- [[02-concepts/ai-features]] — AI behind predictive analytics
- [[02-concepts/compliance]] — Employment Equity legal context
- [[01 How-To Documents/corporate/06-receiving-applications|Chapter 6 — Receiving applications]]
- [[01 How-To Documents/corporate/07-screening-and-evaluating|Chapter 7 — Screening and evaluating]]
- [[01 How-To Documents/corporate/09-making-offers|Chapter 9 — Making offers]]
- [[01 How-To Documents/corporate/12-compliance-and-audit-trail|Chapter 12 — Compliance and audit trail]]
- [[01 How-To Documents/corporate/13-workforce-and-hr|Chapter 13 — Workforce and HR]]
