---
title: "Chapter 14 — Talent Pools and Talent CRM"
type: concept
created: 2026-04-09
updated: 2026-04-09
tags: [how-to, recruiter, talent-pool, crm, segmentation]
status: draft
user-types: [recruiter]
---

# Chapter 14 — Talent Pools and Talent CRM

Sourcing chapters 12 and 13 are about *finding* candidates. This chapter is about *keeping them organised once you've found them*. Talent Pools group candidates by characteristic; Talent CRM tracks the relationship over time. Together they're the difference between an agency that re-sources from scratch every month and an agency that compounds its database into a moat.

## The two halves of database management

| Concept | Purpose | Page |
|---|---|---|
| **Talent Pools** | Segmentation. Group candidates by skill, sector, seniority, geography, or any combination. Pools are containers. | `/dashboard/recruiter/talent-pool` |
| **Talent CRM** | Relationship tracking. Notes, history, status, last contact, communication log. CRM is per-candidate. | `/dashboard/recruiter/talent-crm` |

You'll use them together: a pool is a *list* of candidates that matches a criterion; the CRM is what you do *with* each candidate inside that list.

## Talent Pools

A talent pool is a saved, named segment of your candidate database. Examples:

- "Senior Backend Developers — Cape Town"
- "Data scientists with healthcare experience"
- "Sales executives ready for a move (NPS 9+)"
- "Past finalists for fintech roles 2024"
- "Candidates we want to re-engage in Q2"

Pools are dynamic by default — they re-evaluate based on the criteria, so a new candidate matching "Senior Backend Developers — Cape Town" automatically lands in the pool the moment they're added to your database.

### Creating a pool

1. Go to `/dashboard/recruiter/talent-pool`.
2. Click **+ New pool**.
3. Name the pool descriptively. "Senior Devs CPT" is fine; "Pool 1" is not.
4. Define the criteria:
   - **Skills** — required and nice-to-have
   - **Seniority** — junior / intermediate / senior / lead / executive
   - **Sectors** — which industries
   - **Location** — cities, provinces, remote eligibility
   - **Last activity** — only candidates active within X months
   - **Tags** — any tags you've applied (this is where tagging discipline pays off)
   - **Status** — active job seeker, passive, placed elsewhere
5. Save. The pool now lists every matching candidate in your database.
6. (Optional) Pin the pool to your dashboard for quick access.

### Pools as metered features

**Active pools count against your plan limit** (Chapter 4.5). Each plan tier caps how many pools you can keep active simultaneously. The right strategy:

- **Free / Standard:** maintain 5–10 highly-targeted pools for the segments you actually fill roles in.
- **Premium:** 20+ pools, including some experimental ones.
- **Beyond cap:** consolidate. Two near-duplicate pools should become one.

If a pool hasn't been opened in 90 days, archive it. It's freeing up a seat for a more useful pool.

### Smart pool patterns

These pool structures pay off for most agencies:

| Pool name | Purpose |
|---|---|
| **Top 50** | Your absolute strongest candidates across all sectors. Manually curated. The first place to look for any premium role. |
| **Active job seekers — [sector]** | Per sector, candidates who marked themselves as actively looking. High-conversion outreach pool. |
| **Recent placements awaiting check-in** | Candidates placed in the last 90 days who you should be relationship-building with for retention and referrals. |
| **Cold for 12 months** | Candidates with no activity for a year — ripe for Talent Rediscovery (Chapter 13). |
| **High NPS promoters** | Candidates who rated you 9–10. They're your best source of referrals. |

## Talent CRM

Where Pools is segmentation, **Talent CRM** is relationship management. Open `/dashboard/recruiter/talent-crm` and you see a CRM-style view of your candidate database with:

- **Activity timeline** per candidate — every interaction, message, status change, application
- **Notes** — your private observations, never visible to the candidate
- **Tags** — searchable labels you apply (skills, fit, sentiment)
- **Status** — relationship status: active, passive, placed, paused, lost
- **Last contact** — when you last reached out
- **Next follow-up** — your scheduled next action (with a reminder)
- **Communication log** — every email, WhatsApp, and platform message sent

### Why CRM-grade tracking matters

Most recruiters track candidate relationships in their head, in their inbox, or in a spreadsheet. The result: by year three of running an agency, the database is a graveyard of half-remembered conversations and stale notes. Sebenza Hub's Talent CRM forces structure on what would otherwise become entropy.

The candidates who become long-term assets are the ones with:

- Consistent activity logged
- Notes that capture *why* you formed your impression
- Tags that make them findable later
- A scheduled next-touch so they don't drift out of your awareness

A candidate without notes is a candidate you'll forget. A forgotten candidate is a wasted source.

### A "candidate health" rhythm

Weekly, do two CRM reviews:

1. **Top 50 health check** (10 minutes) — open your Top 50 pool, scan for any candidates with no activity in 60+ days, send a quick "how's the search going?" to the ones who haven't moved.
2. **Next-follow-up review** (10 minutes) — open the CRM filtered to "follow-ups due this week", action each one (send the message, log the call, or push the date forward with a reason).

Twenty minutes per week. That's it. The agencies that compound their database into a moat are the ones that do this religiously.

## How Pools and CRM work together

Typical workflow on a new role:

1. **Open the relevant pool** — "Senior Devs CPT". Lists 47 matching candidates.
2. **Sort by last activity** — most recent first. The 12 candidates active in the last 30 days are your immediate outreach list.
3. **Open each candidate in the CRM view** to see notes and history. "Spoke last in March, wasn't ready to move, said try again in Q3." Q3 is now — perfect timing.
4. **Send a personalised message** with full context (notes are right there) and log it as an activity in the CRM.
5. **Schedule the next follow-up** if they don't respond in a week.

This is recruitment as a CRM business, not a job-board business. It's the difference between agencies that survive 18 months and agencies that survive 18 years.

## Pro tips

- **Tags are the foundation.** Without tags, pools and CRM searches are weak. Develop a consistent tag vocabulary (e.g. `tech_stack:python`, `level:senior`, `location:cpt`, `availability:active`) and use it religiously.
- **Notes should capture the why, not the what.** "Said no" is useless. "Said no — wants to stay another year for stock vesting, open after April 2027" is gold.
- **Pin your most-used pools** to your dashboard. Friction kills habits; one click to your Top 50 makes the daily check-in actually happen.
- **Don't let CRM become busywork.** If you're spending more than 30 minutes a week in CRM hygiene, you're over-tracking. The point is to capture enough signal to make future searches productive, not to log every keystroke.
- **Audit your tags every quarter.** Tag vocabulary drifts. "Cape Town" / "CPT" / "cape-town" all coexisting is normal but reduces search quality. Standardise periodically.

## Checklist

- [ ] You've created at least 3 named pools that match the segments you actually recruit for
- [ ] Your Top 50 pool exists (even if you have to seed it manually)
- [ ] You have a tag vocabulary written down somewhere your team can reference
- [ ] You've spent 20 minutes this week in Talent CRM (Top 50 + follow-ups)
- [ ] You understand that pool count is metered by plan

## Next chapter

[[16-how-tos/recruiter/15-screening-config|Chapter 15 — Configuring screening at the job level]]

## References

- [[16-how-tos/recruiter/12-sourcing-channels|Chapter 12 — Sourcing channels]]
- [[16-how-tos/recruiter/13-linkedin-leads-rediscovery|Chapter 13 — LinkedIn Leads and Talent Rediscovery]]
- [[16-how-tos/recruiter/15-screening-config|Chapter 15 — Configuring screening at the job level]]
- [[16-how-tos/recruiter/04.5-how-we-charge|Chapter 4.5 — How Sebenza Hub charges you]]
