---
title: "Chapter 16 — \"My time-to-fill is creeping up\""
type: concept
created: 2026-04-28
updated: 2026-04-28
tags: [how-to, corporate, troubleshooting, time-to-fill, scenario, market-pulse, screening-intel, requirement-analyzer]
status: active
user-types: [business]
---

# Chapter 16 — "My time-to-fill is creeping up"

![[c-ch16-time-to-fill-trend-chart.png]]

This is the most common alarm bell in corporate TA. You glance at your Recruitment Analytics ([[01 How-To Documents/corporate/14-analytics-and-reporting|Chapter 14]]) and time-to-fill is up — not catastrophically, but consistently for the last 4–6 weeks. Hiring managers are starting to notice. The instinct is to push harder on sourcing. Don't. Diagnose first, then act.

This chapter walks through the diagnostic process and the most common root causes, in the order you should check them.

## The 5-step diagnostic

When time-to-fill (or fill rate) drifts, these are the questions to answer in this order:

### Step 1 — Is the drift real or noise?

Open Recruitment Analytics and look at the trend, not the snapshot.

- **One bad week** is noise. Don't react.
- **Three weeks of consistent drift** is signal. Continue diagnosing.
- **Seasonality** matters — December and January in SA are dead months for hiring. Compare year-on-year, not just week-on-week.
- **Sample size** matters — if your function usually closes 4 hires a month, slipping to 3 isn't a 25% decline, it's normal variance.

### Step 2 — Where in the funnel is the drift happening?

Open the **Pipeline conversion funnel** in Recruitment Analytics. Compare this period to your historical baseline:

```
Stage                 Historical    Current    Change
Applied → Screened     35%           35%       OK
Screened → Interviewed 40%           20%       ⚠️ HALVED
Interviewed → Offered  60%           55%       OK
Offered → Hired        85%           75%       slight drop
```

In this example, the drift is between Screened and Interviewed. That's where you investigate, not at sourcing or offers.

![[c-ch16-funnel-conversion-comparison.png]]

The funnel **localises** the problem. Without it, you're guessing — and TA leaders who guess waste budget on the wrong fix.

### Step 3 — Run Requirement Restriction Analyzer on stuck requisitions

From the Pipeline (covered in [[01 How-To Documents/corporate/06-receiving-applications|Chapter 6]]), open each requisition that's been open longer than your average time-to-fill and click **Analyze requirements**. The tool tells you:

- Which screening criterion is doing the most rejecting
- Whether the median candidate matches the role's requirements
- Whether the salary band is competitive
- Whether the location is too restrictive

You're looking for patterns across multiple requisitions, not just one. If three requisitions all show "85%+ rejected at the SQL knockout question" — that knockout is the problem, not the sourcing.

**Try: Requirement Restriction Analyzer _(Standard)_.** Why this helps in this scenario: it scores each requirement on the JD for how much it shrinks the candidate pool, so you can show the hiring manager exactly which "nice-to-have" is killing the time-to-fill. Pair with the hiring-manager conversation in [[01 How-To Documents/corporate/18-hiring-managers-unhappy-with-calibre|Chapter 18]].

![[c-ch16-requirement-restriction-flags.png]]

### Step 4 — Check sourcing channel effectiveness

In Recruitment Analytics, look at **source effectiveness** — which channels brought you hires last quarter vs this one. If your top channel has gone quiet (LinkedIn algorithm change, Talent CRM gone stale, AI Search returning weak matches), that's the cause.

**Try: Search Market Pulse _(Premium)_.** Why this helps in this scenario: it analyses your saved-search criteria against live SA market signals — candidate supply, demand shifts, salary movement, geographic hotspots — so you can see whether the channel went quiet or whether the market moved. Run it from any saved search on AI Search ([[01 How-To Documents/corporate/10-vendor-management-and-sourcing|Chapter 10]]).

**Try: Competitive Heat Map _(Premium)_.** Why this helps in this scenario: it tells you what other employers are recruiting for similar candidates in your region and at what salary bands — so you know if your offer or sourcing footprint is now off-market. Surface from any AI Search result.

![[c-ch16-search-market-pulse.png]]

### Step 5 — Check team-level patterns

Use Team DNA (covered in [[01 How-To Documents/corporate/13-workforce-and-hr|Chapter 13]]) to see if the drift is concentrated in one or two recruiters or hiring managers. If everyone's metrics are slipping, it's a process or market problem. If only one person is, it's a coaching problem.

## The 8 common root causes

By the time you've worked through the diagnostic, the cause usually fits one of these patterns:

### 1. Screening is too tight

**Symptom:** Big drop between Screened and Interviewed stages. Requisitions have plenty of applicants but very few advance.

**Fix:** Relax one knockout question per stuck requisition. Re-run and watch the volume increase. If quality stays acceptable, leave it relaxed and update the role-family Screening Roles entry ([[01 How-To Documents/corporate/07-screening-and-evaluating|Chapter 7]]).

### 2. Salary band is below market

**Symptom:** Predictive Hiring returns low acceptance probabilities. Candidates accept interviews but decline offers. Decline reasons skew toward "competing offer" or "compensation."

**Fix:** Use Competitive Heat Map (Ch.10) for the affected roles. If you're below the 25th percentile, go back to the hiring manager (and finance) and have the salary conversation. Don't keep submitting candidates against a doomed offer.

### 3. Sourcing channel has gone dry

**Symptom:** Top sourcing channel from last quarter is producing fewer or weaker candidates this quarter. Application volume is down across multiple requisitions.

**Fix:** Diversify. If LinkedIn used to be your top channel and has gone quiet, lean harder on AI Search of your existing database (Ch.10), the Talent CRM (Ch.10), internal mobility (Ch.13), or a vendor agency (Ch.10).

### 4. Stage-age has crept up

**Symptom:** Time-to-fill has slowly increased (e.g. from 28 days to 40 days). Candidates are getting picked off by competitors before you can move them forward.

**Fix:** Audit your stage age in the Pipeline (Ch.6). Anything that consistently takes 4+ days at one stage is a process problem. Common culprits in corporate hiring: slow hiring-manager feedback after interviews, unclear next steps after panel debrief, slow Finance approvals on offers.

### 5. Hiring-manager expectations have shifted

**Symptom:** A specific hiring manager's requisitions have become harder to fill. Other managers' reqs are normal.

**Fix:** Have the difficult conversation ([[01 How-To Documents/corporate/18-hiring-managers-unhappy-with-calibre|Chapter 18]]). The brief may have drifted upward, the manager's read of the role may have changed, or the panel may now be applying a stricter bar than the original brief warranted. Address it directly, not by sourcing harder.

### 6. The market has shifted

**Symptom:** All your engineering reqs are slow. Or all your senior reqs. Or all your reqs in one city. The pattern is sector-wide, not requisition-specific.

**Fix:** This is real. Markets cycle. Use Competitive Heat Map (Ch.10) and Predictive Analytics (Ch.14) to confirm. Once confirmed, broaden your sourcing surface (run AI Search across adjacent skill profiles), or have honest conversations with hiring managers about realistic timelines.

### 7. A team member is underperforming

**Symptom:** Team DNA (Ch.13) shows one recruiter's metrics have declined. Their candidates are stuck more often than the team average.

**Fix:** Coaching conversation. Look at their Pipeline — are they slow at responding? Are their scorecards thin? Are they hoarding candidates without progressing them? The pattern in their data tells you what to coach.

### 8. Your AI tools have drifted

**Symptom:** AI match scores look reasonable but the candidates they're surfacing don't actually convert. AI screening is recommending people who fail at interview.

**Fix:** Audit the requirement tagging on your reqs — if requirements are mis-tagged at posting time, the AI optimises for the wrong thing. Re-tag and rerun. Also check that the Screening Roles configuration is current — outdated criteria produce outdated shortlists.

## The action sequence

Once you've diagnosed:

1. **Pick the single highest-impact cause** from the diagnosis. Don't try to fix everything at once.
2. **Make the fix.** Loosen the knockout, have the hiring-manager conversation, retag the requirements, coach the recruiter — whichever applies.
3. **Wait two weeks** and re-check the metric. Two weeks is the minimum window to see signal vs noise on a fix.
4. **If improved, leave it.** If not improved, move to the next-highest-impact cause and repeat.

Don't change five things at once. You'll have no idea which fix worked.

## When to escalate

Some time-to-fill drifts aren't your problem to solve alone:

- **Market-wide downturn** — talk to executive leadership about cost discipline and pipeline focus
- **Major hiring-manager engagement issue** across multiple managers — this is an HRBP / TA leader conversation, not a recruiter one
- **Legal / compliance issue** affecting hiring (e.g. EE plan target slip, B-BBEE certificate impact) — talk to your compliance lead
- **Predictive Analytics shows the trend continuing** for 8+ weeks — this isn't a tactical fix, it's a strategic conversation with the executive team about budget, headcount, or compensation strategy

## Pro tips

- **Track baselines.** Without knowing your historical time-to-fill, you can't tell whether you're drifting. Spend 30 minutes establishing your baselines for time-to-fill, fill rate, and conversion ratios per role family.
- **Don't react to one bad week.** Noise is noise. Wait for signal.
- **Cross-check with team perception.** Sometimes the data shows a drift your team has already felt and discussed at lunch. Their qualitative read is usually right; the data just confirms it.
- **Fix one thing at a time.** Multiple simultaneous changes destroy your ability to learn from the result.
- **Document the diagnosis.** Even if you fix it quickly, write down what was wrong and what worked. Six months later when it happens again, you'll thank yourself.

## Features referenced in this chapter

| # | Feature | Tier | Used at step |
|---|---------|------|--------------|
| 1 | Requirement Restriction Analyzer | Standard | Step 3 — quantify over-restriction |
| 2 | Search Market Pulse | Premium | Step 4 — confirm market shift |
| 3 | Competitive Heat Map | Premium | Step 4 — current-market role view |
| 4 | Team DNA | Premium | Step 5 — team-level patterns |

## Checklist

- [ ] You've confirmed the drift is real (not noise) using trend, not snapshot
- [ ] You've localised the problem using the funnel conversion view
- [ ] You've run Requirement Restriction Analyzer on stuck requisitions
- [ ] You've checked sourcing channel effectiveness against Search Market Pulse
- [ ] You've checked team-level patterns via Team DNA
- [ ] You've picked one fix and waited two weeks before judging it
- [ ] You've documented the diagnosis for next time

## Next chapter

[[01 How-To Documents/corporate/17-candidates-ghosting-between-stages|Chapter 17 — "Candidates are ghosting between stages"]]

## References

- [[01 How-To Documents/corporate/06-receiving-applications|Chapter 6 — Receiving applications]]
- [[01 How-To Documents/corporate/10-vendor-management-and-sourcing|Chapter 10 — Vendor management and sourcing]]
- [[01 How-To Documents/corporate/13-workforce-and-hr|Chapter 13 — Workforce and HR]]
- [[01 How-To Documents/corporate/14-analytics-and-reporting|Chapter 14 — Analytics and reporting]]
- [[01 How-To Documents/corporate/17-candidates-ghosting-between-stages|Chapter 17 — Candidates ghosting]]
- [[01 How-To Documents/corporate/18-hiring-managers-unhappy-with-calibre|Chapter 18 — Hiring managers unhappy with calibre]]
