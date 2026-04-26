---
title: "Chapter 31 — \"My fill rate is dropping\""
type: concept
created: 2026-04-09
updated: 2026-04-20
tags: [how-to, recruiter, troubleshooting, fill-rate, scenario, market-pulse, screening-intel]
status: draft
user-types: [recruiter]
---

# Chapter 31 — "My fill rate is dropping"

This is the most common alarm bell in agency recruitment. You glance at your KPI Dashboard (Chapter 25) and your fill rate is down — not catastrophically, but consistently for the last 4–6 weeks. The instinct is to panic-source. Don't. Diagnose first, then act.

This chapter walks through the diagnostic process and the most common root causes, in the order you should check them.

## The 5-step diagnostic

When fill rate drops, these are the questions to answer in this order:

### Step 1 — Is the drop real or noise?

Open `/dashboard/recruiter/kpi-dashboard` and look at the trend, not the snapshot.

- **One bad week** is noise. Don't react.
- **Three weeks of consistent decline** is signal. Continue diagnosing.
- **Seasonality** matters — December and January in SA are dead months for hiring. Compare year-on-year, not just week-on-week.
- **Sample size** matters — if you usually do 2 placements a month, dropping to 1 isn't a 50% decline, it's normal variance.

### Step 2 — Where in the funnel is the drop happening?

Open the **Pipeline conversion funnel** in `/dashboard/recruiter/analytics`. Compare this period to your historical baseline:

```
Stage             Historical    Current    Change
Applied → Screen    35%           35%       OK
Screen → Interview  40%           20%       ⚠️ HALVED
Interview → Offer   60%           55%       OK
Offer → Placed      85%           75%       slight drop
```

In this example, the drop is between Screening and Interview. That's where you investigate, not at sourcing or offers.

![[r-ch31-fill-rate-trend-diagnostic.png]]

The funnel **localises** the problem. Without it, you're guessing.

### Step 3 — Run Requirement Check on stuck jobs

Open `/dashboard/recruiter/requirement-check` for each job that's been open longer than your average time-to-fill. The tool tells you:

- Which screening criterion is doing the most rejecting
- Whether the median candidate matches the role's requirements
- Whether the salary band is competitive
- Whether the location is too restrictive

You're looking for patterns across multiple jobs, not just one. If three jobs all show "85%+ rejected at the SQL knockout question" — that knockout is the problem, not the sourcing.

**Try: #97 Job AI Insights _(Standard)_.** Why this helps in this scenario: it surfaces day-1 red flags on each affected job — wrong salary, wrong location, over-restrictive criteria — without you having to deduce them from the funnel. Full detail: covered alongside job posting in [[01 How-To Documents/recruiter/11-posting-a-job|Chapter 11]].

**Try: #131 Requirement Restriction Analyzer _(Standard)_.** Why this helps in this scenario: it scores each requirement on the Job Description for how much it shrinks the candidate pool, so you can show the client exactly which "nice-to-have" is killing the fill rate. Pair with the client conversation in [[01 How-To Documents/recruiter/33-client-unhappy-calibre|Chapter 33]].

![[r-ch31-requirement-restriction-flags.png]]

### Step 4 — Check sourcing channel effectiveness

In `/dashboard/recruiter/analytics`, look at **source effectiveness** — which channels brought you placements last quarter vs this one. If your top channel has gone quiet (LinkedIn algorithm change, Talent Pool gone stale, AI Search returning weak matches), that's the cause.

**Try: #114 Search Market Pulse _(Premium)_.** Why this helps in this scenario: it analyses your saved-search criteria against live SA market signals — candidate supply, demand shifts, salary movement, geographic hotspots — so you can see whether the channel went quiet or whether the market moved. Run it from any saved search on `/dashboard/recruiter/candidates` (full walkthrough in [[01 How-To Documents/recruiter/12-sourcing-channels|Chapter 12]]).

**Try: #134 Screening Market Intelligence _(Premium)_.** Why this helps in this scenario: it tells you what candidates for the affected role *currently* look like — salary bands, supply depth, competitor activity — so you know if your offer or sourcing footprint is now off-market. Surface inside the screening config covered in [[01 How-To Documents/recruiter/15-screening-config|Chapter 15]].

### Step 5 — Check team-level patterns

Use Team DNA (Chapter 26) to see if the drop is concentrated in one or two recruiters. If everyone's fill rate is down, it's a process or market problem. If only one recruiter is down, it's a coaching problem.

## The 8 common root causes

By the time you've worked through the diagnostic, the cause usually fits one of these patterns:

### 1. Screening is too tight

**Symptom:** Big drop between Screening and Interview stages. Jobs have plenty of applicants but very few advance.

**Fix:** Relax one knockout question per stuck job. Rerun and watch the volume increase. If quality stays acceptable, leave it relaxed.

### 2. Salary band is below market

**Symptom:** Offer Predictor returns low acceptance probabilities. Candidates accept interviews but decline offers. Decline reasons skew toward "competing offer" or "compensation."

**Fix:** Run Offer Benchmarking (Chapter 20) on the affected roles. If you're below the 25th percentile, go back to the client and have the salary conversation. Don't keep submitting candidates to a doomed offer.

### 3. Sourcing channel has gone dry

**Symptom:** Top sourcing channel from last quarter is producing fewer or weaker candidates this quarter. Application volume is down across multiple jobs.

**Fix:** Diversify. If LinkedIn used to be your top channel and has gone quiet, lean harder on AI Search of your existing database (Chapter 12), Talent Rediscovery (Chapter 13), or paid recruitment marketing (Chapter 30).

### 4. Time-to-fill has crept up

**Symptom:** Time-to-fill has slowly increased (e.g. from 28 days to 40 days). Candidates are getting picked off by competitors before you can move them forward.

**Fix:** Audit your stage age in the Pipeline (Chapter 16). Anything that consistently takes 4+ days at one stage is a process problem. Common culprits: slow client feedback, unclear next steps after interview, slow approval chains for offers.

### 5. Client expectations have shifted

**Symptom:** A specific client's roles have become harder to fill. Other clients are normal.

**Fix:** Have the difficult conversation (Chapter 33). The client's brief may have drifted upward, the market may have tightened, or their internal hiring process may have slowed. Address it directly, not by sourcing harder.

### 6. The market has shifted

**Symptom:** All your fintech roles are slow. Or all your senior roles. Or all your roles in one city. The pattern is sector-wide, not job-specific.

**Fix:** This is real. Markets cycle. Use Location Intel (Chapter 29) and Predictive Analytics (Chapter 25) to confirm. Once confirmed, broaden your sectors (run Talent Discovery in adjacent areas), or have honest conversations with clients about realistic timelines.

### 7. A team member is underperforming

**Symptom:** Team DNA shows one recruiter's metrics have declined. Their candidates are stuck more often than the team average.

**Fix:** Coaching conversation. Look at their Pipeline — are they slow at responding? Are their scorecards thin? Are they hoarding candidates without progressing them? The pattern in their data tells you what to coach.

### 8. Your AI tools have drifted

**Symptom:** AI match scores look reasonable but the candidates they're surfacing don't actually convert. AI screening is recommending people who fail at interview.

**Fix:** Audit the requirement tagging on your jobs — if requirements are mis-tagged, the AI optimises for the wrong thing. Re-tag and rerun.

## The action sequence

Once you've diagnosed:

1. **Pick the single highest-impact cause** from the diagnosis. Don't try to fix everything at once.
2. **Make the fix.** Loosen the knockout, have the client conversation, retag the requirements, coach the recruiter — whichever applies.
3. **Wait two weeks** and re-check the metric. Two weeks is the minimum window to see signal vs noise on a fix.
4. **If improved, leave it.** If not improved, move to the next-highest-impact cause and repeat.

Don't change five things at once. You'll have no idea which fix worked.

## When to escalate

Some fill rate drops aren't your problem to solve alone:

- **Market-wide downturn** — talk to leadership about cost discipline and pipeline focus
- **Major client churning** — talk to the account owner immediately
- **Legal/compliance issue** affecting hiring — talk to your compliance lead
- **Predictive Analytics shows the trend continuing** for 8+ weeks — this isn't a tactical fix, it's a strategic conversation

## Pro tips

- **Track baselines.** Without knowing your historical fill rate, you can't tell whether you're dropping. Spend 30 minutes establishing your baselines for fill rate, time-to-fill, conversion ratios.
- **Don't react to one bad week.** Noise is noise. Wait for signal.
- **Cross-check with team perception.** Sometimes the data shows a drop your team has already felt and discussed at lunch. Their qualitative read is usually right; the data just confirms it.
- **Fix one thing at a time.** Multiple simultaneous changes destroy your ability to learn from the result.
- **Document the diagnosis.** Even if you fix it quickly, write down what was wrong and what worked. Six months later when it happens again, you'll thank yourself.

## Features referenced in this chapter

| # | Feature | Tier | Used at step |
|---|---------|------|--------------|
| 97 | Job AI Insights | Standard | Step 3 — diagnose stuck jobs |
| 131 | Requirement Restriction Analyzer | Standard | Step 3 — quantify over-restriction |
| 114 | Search Market Pulse | Premium | Step 4 — confirm market shift |
| 134 | Screening Market Intelligence | Premium | Step 4 — current-market role view |

## Checklist

- [ ] You've confirmed the drop is real (not noise) using trend, not snapshot
- [ ] You've localised the problem using the funnel conversion view
- [ ] You've run Requirement Check on stuck jobs
- [ ] You've checked sourcing channel effectiveness
- [ ] You've checked team-level patterns
- [ ] You've picked one fix and waited two weeks before judging it

## Next chapter

[[01 How-To Documents/recruiter/32-candidates-ghosting|Chapter 32 — "Candidates are ghosting between stages"]]

## References

- [[01 How-To Documents/recruiter/16-the-pipeline|Chapter 16 — The Pipeline]]
- [[01 How-To Documents/recruiter/25-reading-your-analytics|Chapter 25 — Reading your analytics]]
- [[01 How-To Documents/recruiter/26-diversity-panel-ai|Chapter 26 — Team DNA and analytics]]
- [[01 How-To Documents/recruiter/32-candidates-ghosting|Chapter 32 — Candidates ghosting]]
- [[01 How-To Documents/recruiter/33-client-unhappy-calibre|Chapter 33 — Client unhappy with calibre]]
