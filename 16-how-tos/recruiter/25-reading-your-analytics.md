---
title: "Chapter 25 — Reading your analytics"
type: concept
created: 2026-04-09
updated: 2026-04-09
tags: [how-to, recruiter, analytics, kpi, dashboard]
status: draft
user-types: [recruiter]
---

# Chapter 25 — Reading your analytics: KPI Dashboard and the four key reports

You can run an agency on instinct for a year, maybe two. After that, the things you don't measure start killing you quietly — fill rates dropping, fees shrinking, clients churning, recruiters underperforming — and instinct can't catch any of it. This chapter is about the four reports that, used weekly, tell you everything you need to know about whether your agency is healthy.

## Where it lives

| Page | What it shows |
|---|---|
| `/dashboard/recruiter/kpi-dashboard` | Headline metrics — placements, revenue, fill rate, time-to-fill |
| `/dashboard/recruiter/analytics` | Detailed recruitment analytics dashboard |
| `/dashboard/recruiter/predictive-analytics` | Forecasting — what's likely to happen next |
| `/dashboard/recruiter/requirement-check` | Per-job pipeline audit — where candidates are dropping out |

## The four-report rhythm

You don't need to look at every dashboard every day. You need a tight rhythm where each report has a moment in your week:

| Report | Frequency | Time spent |
|---|---|---|
| **KPI Dashboard** | Weekly (Monday) | 10 min |
| **Recruitment Analytics** | Monthly (1st Monday) | 30 min |
| **Predictive Analytics** | Monthly (mid-month) | 20 min |
| **Requirement Check** | Per role, when stuck | 10 min ad hoc |

That's roughly 90 minutes per month on analytics. The agencies that actually look at their numbers are the ones that survive year five.

## 1. KPI Dashboard — your weekly health check

The KPI Dashboard is the headline view. Open it Monday morning before you do anything else.

### What it shows

- **Placements** this week / month / quarter / year
- **Revenue** generated, with breakdown by client / sector / recruiter
- **Time-to-fill** average and trend
- **Fill rate** (placements / jobs opened)
- **Submission-to-interview ratio**
- **Submission-to-offer ratio**
- **Submission-to-placement ratio** (the ultimate ratio)
- **Average fee per placement**
- **Active jobs** count
- **Pipeline value** (forecasted revenue from open roles)
- **Retention rate** (placements still active at 90 / 180 / 365 days)

### How to read it in 10 minutes

1. **Glance at the headline placement number for the week.** Up vs last week? Down? If down, why?
2. **Scan the trend lines.** Anything declining for 3 weeks straight is a problem you need to investigate.
3. **Check pipeline value vs last week.** If pipeline value is declining and placements are flat, your future is shrinking even though your present looks OK.
4. **Look at top clients by revenue.** Anyone dropping? Pick up the phone today.
5. **Check fill rate.** If it's below your historical average, the next step is the Requirement Check (below) on the slowest jobs.

That's the routine. Not "stare at every chart." A focused 10-minute scan, then act on what stands out.

### The numbers that lie

Not every metric is honest. Watch out for:

- **Revenue without retention.** A placement counts as revenue immediately, but if the candidate leaves in 60 days you lose the fee. Always read revenue alongside retention rate.
- **Submission count without quality.** Submitting 50 candidates this month sounds great until you see only 3 reached interview. Submission-to-interview ratio is the quality signal.
- **Average fee.** A few executive placements skew the average upward and hide a soft mid-market. Look at the median, not just the average.
- **Pipeline value.** Inflated by jobs that aren't really moving. Cross-check with stage age in the Pipeline (Chapter 16) — pipeline value from stagnant jobs isn't real value.

## 2. Recruitment Analytics — `/dashboard/recruiter/analytics`

The Recruitment Analytics page is where you go monthly to understand *patterns*, not just snapshots.

### What it shows

- **Pipeline conversion funnel** — applicants → screened → interviewed → offered → placed, with conversion percentages between each stage
- **Time spent per stage** — where candidates linger
- **Source effectiveness** — which sourcing channels (AI Search, LinkedIn, direct, referrals) actually produce placements
- **Recruiter performance** — placements, fill rate, time-to-fill per team member
- **Client performance** — placements per client, revenue per client, retention per client
- **Sector breakdown** — where you're winning and where you're not
- **Trend over 12 months** — long-arc patterns that weekly views miss

### Questions to ask monthly

Each month, walk through these questions and see if the data gives you a clear answer:

1. **Where in the funnel are we losing the most candidates, and why?**
2. **Which sourcing channel has the best placement rate, and are we investing time there proportionally?**
3. **Which sector has the worst time-to-fill, and what's the bottleneck?**
4. **Which recruiter is underperforming, and is it a coaching problem or a desk allocation problem?**
5. **Which client has had the biggest revenue drop, and have we addressed it?**

If you can't answer one of these from the data, that's a sign your data hygiene is off — usually missing reject reasons or stale stage assignments. Fix the data and the answer becomes visible.

## 3. Predictive Analytics — `/dashboard/recruiter/predictive-analytics`

Predictive Analytics is forecasting. It uses your historical patterns to project:

- **Next month's expected placements** (range, not single number)
- **Next quarter's expected revenue**
- **Forecasted fill rate** for the current open roles
- **At-risk roles** — open jobs the model predicts won't fill in time
- **Client churn risk** — clients whose engagement signals predict they'll leave
- **Recruiter capacity warnings** — team members heading toward overload or underutilisation

### Use it to make decisions, not just to watch

Predictive Analytics is only useful if you act on it:

- **At-risk role flagged?** Discuss with the client about widening the brief, increasing the salary, or extending the timeline.
- **Client churn risk flagged?** Schedule a check-in this week, not next month.
- **Recruiter overload warning?** Reassign some of their roles to a colleague before they burn out.
- **Recruiter underload warning?** Either give them more roles or have a development conversation.

The predictions are probabilistic — they're not certainties. Use them as an early warning system, not as predetermined outcomes.

## 4. Requirement Check — `/dashboard/recruiter/requirement-check`

The Requirement Check is the ad-hoc tool you reach for when one specific role is stuck. Open it for a job that isn't filling, and it audits the pipeline:

- **How many candidates applied?**
- **How many were rejected at each step?**
- **Which screening criterion is doing the most rejecting?**
- **What's the median match score of applicants vs the role's required skills?**
- **Where are candidates dropping out (own choice, your reject, employer reject)?**
- **Specific signals** — "85% of applicants fail the SQL knockout question" or "median candidate is 8 years experience but the JD requires 12+, so the realistic pool is small" or "salary band is below market median for this role and location"

### What to do with the diagnosis

The Requirement Check usually surfaces one of three problems:

1. **The screening is too tight** — relax a knockout, broaden the experience requirement, accept candidates with fewer years but stronger projects
2. **The role isn't competitive** — go back to the client and discuss raising the salary, expanding the location, or relaxing a non-essential requirement
3. **The role is fine but the sourcing is too narrow** — add more channels, run a passive candidate sequence, expand the geographic search

The output is actionable, not just observational. Use it that way.

## Other analytics pages worth knowing about

The four reports above cover 90% of analytics needs. The remaining specialist pages:

- `/dashboard/recruiter/team-dna` — team capability and capacity analysis (Chapter 26)
- `/dashboard/recruiter/disagreements` (Panel Analysis) — interviewer calibration (Chapter 26)
- `/dashboard/recruiter/engagement` — candidate engagement scores
- `/dashboard/recruiter/diversity` — demographic analytics (Chapter 26)

## Pro tips

- **Numbers without action are wallpaper.** Looking at dashboards without making decisions is a waste of time. Every report review should end with "what am I changing because of this?"
- **Track the trend, not the level.** A 30-day fill rate of 28 days means nothing in isolation. A 30-day fill rate that was 22 last quarter and is 28 this quarter is a 27% degradation and a real problem.
- **Cross-reference reports.** If KPI Dashboard says revenue is up but retention is dropping, that's a future revenue cliff. Don't read reports in isolation.
- **Share the dashboard in team meetings.** A team that sees the numbers weekly becomes data-literate fast. A team that doesn't develops fictions about what's working.
- **Set targets.** Numbers without targets are descriptive. Numbers with targets are diagnostic. Set quarterly targets for placements, revenue, fill rate, and submission-to-placement ratio. Review them every Monday.

## Checklist

- [ ] You have a Monday morning routine that includes 10 minutes on the KPI Dashboard
- [ ] You've scheduled a monthly 30-minute analytics review
- [ ] You know your historical baseline for fill rate, time-to-fill, and submission-to-placement ratio
- [ ] You've used Requirement Check at least once on a stuck role
- [ ] You're cross-referencing revenue with retention
- [ ] You have quarterly targets for the key metrics

## Next chapter

[[16-how-tos/recruiter/26-diversity-panel-ai|Chapter 26 — Diversity, panel analysis, and AI Intelligence]]

## References

- [[02-concepts/ai-features]] — AI behind predictive analytics
- [[16-how-tos/recruiter/16-the-pipeline|Chapter 16 — The Pipeline]]
- [[16-how-tos/recruiter/21-recording-a-placement|Chapter 21 — Recording a placement]]
- [[16-how-tos/recruiter/26-diversity-panel-ai|Chapter 26 — Diversity, panel analysis, and AI Intelligence]]
