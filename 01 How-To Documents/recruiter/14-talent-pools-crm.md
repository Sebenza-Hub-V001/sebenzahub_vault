---
title: "Chapter 14 — Talent Pools and Talent CRM"
type: concept
created: 2026-04-09
updated: 2026-04-20
tags: [how-to, recruiter, talent-pool, crm, segmentation, candidate-management, auto-tag, clustering, comparison, bulk-import, bulk-export]
status: draft
user-types: [recruiter]
---

# Chapter 14 — Talent Pools and Talent CRM

Sourcing chapters 12 and 13 are about *finding* candidates. This chapter is about *keeping them organised once you've found them*. Talent Pools group candidates by characteristic; Talent CRM tracks the relationship over time. Together they're the difference between an agency that re-sources from scratch every month and an agency that compounds its database into a moat.

## The base layer — Candidate Management

Before pools and CRM, there's the candidate record itself. Everything in this chapter sits on top of it.

### Candidate Management — _Tier: Free_

**What this feature is.** Candidate Management is the core record-keeping layer for every candidate in your database — view, filter, edit, take notes, apply tags, see history, manage contact info. It's the table-stakes ATS layer and it's free on every plan.

**Why it matters.** Candidate record management is table stakes. Making it free ensures recruiters actually store their work in Sebenza Hub instead of in emails and spreadsheets — which is what builds the data moat that pools, AI Search, and Talent Rediscovery all depend on.

**How to use it.** Open `/dashboard/recruiter/candidates`. Every candidate has a profile page with their CV, parsed skills, applications, notes, tags, and activity history. Edit any field, add notes, apply tags. The pools and CRM features below all act on the records you maintain here.

## The two halves of database management

| Concept | Purpose | Page |
|---|---|---|
| **Talent Pools** | Segmentation. Group candidates by skill, sector, seniority, geography, or any combination. Pools are containers. | `/dashboard/recruiter/talent-pool` |
| **Talent CRM** | Relationship tracking. Notes, history, status, last contact, communication log. CRM is per-candidate. | `/dashboard/recruiter/talent-crm` |

You'll use them together: a pool is a *list* of candidates that matches a criterion; the CRM is what you do *with* each candidate inside that list.

## Talent Pools

### Talent Pools — _Tier: Standard_

**What this feature is.** Talent Pools organises candidates into named, saved segments — by skill, sector, role, client, or stage — with bulk actions and notifications when new candidates match the pool's criteria. Pools are containers; everything inside acts in bulk.

**Why it matters.** Without pools, good candidates get lost the moment they're turned down for one role. Pools turn a one-shot application into a long-term relationship — and they're how agencies raise placements per candidate by 3–5× over the lifetime of the database.

**How to use it.** Use the create-a-pool flow below. The deeper "what to put in pools" patterns are covered after.

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

![[r-ch14-talent-pools-list.png]]

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

## AI features that keep pools healthy

Manual tagging and manual pool curation become impossible past about 1,000 candidates. Three AI features keep your pools current and surface insights you couldn't compute by hand.

### Auto-Tag Candidate — _Tier: Standard_

**What this feature is.** Auto-Tag Candidate runs on every new candidate ingested (CV upload, application, sourcing import) and applies skill, attribute, and role-fit tags automatically. Manual tagging on top is still possible; auto-tagging removes the chore work.

**Why it matters.** Manual tagging gets skipped by busy recruiters, which degrades search and pool quality over time. Auto-tagging maintains a clean, searchable database without anyone doing the work — which means pools stay accurate even as the database grows past where humans can keep up.

**How to use it.** Runs automatically on every new candidate. Review the auto-applied tags on a candidate's profile if you want to verify or adjust; otherwise it just works.

![[r-ch14-auto-tag-candidate.png]]

### AI Talent Pool Clustering — _Tier: Premium_

**What this feature is.** AI Talent Pool Clustering scans your candidate database and automatically clusters candidates into natural pools based on skills, experience patterns, and role-fit signals — surfacing groupings humans wouldn't have thought to create.

**Why it matters.** Manual pool organisation is essentially a full-time job at scale. AI clustering does it in seconds and discovers clusters humans miss — for example, "SA mid-market finance generalists with fintech exposure" might be a cluster of 47 highly-placeable candidates that no recruiter on your team had ever explicitly grouped.

**How to use it.** Open `/dashboard/recruiter/talent-pool` and click **Discover clusters**. Review the suggested pools; accept the ones that look useful, dismiss the rest. Accepted clusters become regular pools you can name and pin.

![[r-ch14-talent-pool-clustering.png]]

### Talent Pool Analysis — _Tier: Premium_

**What this feature is.** Talent Pool Analysis runs an AI-powered breakdown of any pool — average experience, skill distribution, demographic spread, gap vs target — and produces a one-screen summary you can send to a client or use internally for pitching.

**Why it matters.** Agencies sell "we have 400 CFOs in our pool" but usually can't characterise the pool's quality. Analysis turns a pool into a defensible claim — exact average tenure, exact skill coverage, exact diversity profile. Especially valuable for client pitches where credibility hinges on specifics.

**How to use it.** Open any pool → **Analyse**. The report shows distribution charts and a written summary. Export to PDF for client decks.

![[r-ch14-talent-pool-analysis.png]]

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

## Comparing candidates side-by-side

Pools and CRM tell you *who's there*. The next step is usually picking between two or three of them — and that's a separate feature.

### Side-by-Side Comparison — _Tier: Standard_

**What this feature is.** Side-by-Side Comparison puts 2–5 candidates next to each other across key attributes — skills, experience, test scores, interview feedback, salary expectations — in a single printable view.

**Why it matters.** Hiring managers need to defend their choice to panels and HR. A printable comparison replaces a 30-minute "why him not her" debate with a 2-minute visual that shows the trade-offs explicitly. Same value internally when you're picking who to put forward to a client.

**How to use it.** From any pool or candidate list, multi-select 2–5 candidates and click **Compare**. The comparison renders side-by-side; export to PDF for client meetings.

![[r-ch14-side-by-side-comparison.png]]

## Migrating data in and out

The platform has to handle both arrival (you've just signed up with 5,000 candidates from your old system) and departure (a client wants their data, an audit needs an export).

### CSV Bulk Import — _Tier: Standard_

**What this feature is.** CSV Bulk Import takes a spreadsheet of candidates with column mapping and deduplication and brings them into your Sebenza Hub database in one go. Supports the standard fields plus custom column mapping for non-standard CSVs.

**Why it matters.** Agencies switching from competitors arrive with a spreadsheet of thousands of candidates. Without bulk import, they don't switch — which is why this feature is a migration tool as much as a daily-use tool.

**How to use it.**

1. Open `/dashboard/recruiter/candidates` → **Import**.
2. Upload the CSV.
3. Map your columns to Sebenza Hub fields (the platform suggests mappings; review and adjust).
4. Run the dedupe check. Decide whether duplicates merge or skip.
5. Confirm and import. Auto-Tag runs on the imported records.

![[r-ch14-csv-bulk-import.png]]

### Bulk Export — _Tier: Standard_

**What this feature is.** Bulk Export lets you export candidate and job data in CSV or XLSX format — for external reporting, backups, client handovers, or compliance audits.

**Why it matters.** Clients sometimes demand the data back, and POPIA-aligned data subject access requests demand it too. Without bulk export, Sebenza Hub feels like a data prison — which drives churn. Bulk export is what makes the platform feel like a partner, not a hostage situation.

**How to use it.** From the candidate or job list, click **Export**, pick the columns and filters, choose CSV or XLSX. The file is generated and downloads (or emailed for very large exports).

## Pro tips

- **Tags are the foundation.** Without tags, pools and CRM searches are weak. Auto-Tag handles most of the work, but develop a consistent tag vocabulary (e.g. `tech_stack:python`, `level:senior`, `location:cpt`, `availability:active`) for the manual ones too — and use it religiously.
- **Notes should capture the why, not the what.** "Said no" is useless. "Said no — wants to stay another year for stock vesting, open after April 2027" is gold.
- **Pin your most-used pools** to your dashboard. Friction kills habits; one click to your Top 50 makes the daily check-in actually happen.
- **Don't let CRM become busywork.** If you're spending more than 30 minutes a week in CRM hygiene, you're over-tracking. The point is to capture enough signal to make future searches productive, not to log every keystroke.
- **Audit your tags every quarter.** Tag vocabulary drifts. "Cape Town" / "CPT" / "cape-town" all coexisting is normal but reduces search quality. Standardise periodically.

## Checklist

- [ ] You've created at least 3 named pools that match the segments you actually recruit for
- [ ] Your Top 50 pool exists (even if you have to seed it manually)
- [ ] You have a tag vocabulary written down somewhere your team can reference, on top of Auto-Tag
- [ ] You've run AI Talent Pool Clustering at least once to see what the AI surfaces (Premium)
- [ ] You've used Side-by-Side Comparison to defend a shortlist decision
- [ ] You've spent 20 minutes this week in Talent CRM (Top 50 + follow-ups)
- [ ] You understand that pool count is metered by plan
- [ ] You know how to bulk import (CSV) and bulk export (CSV/XLSX) when you need to

## Features covered in this chapter

| # | Feature | Tier |
|---|---------|------|
| 1 | Candidate Management | Free |
| 2 | Talent Pools | Standard |
| 3 | AI Talent Pool Clustering | Premium |
| 4 | Auto-Tag Candidate | Standard |
| 5 | Talent Pool Analysis | Premium |
| 6 | Side-by-Side Comparison | Standard |
| 7 | CSV Bulk Import | Standard |
| 8 | Bulk Export | Standard |

## Next chapter

[[01 How-To Documents/recruiter/15-screening-config|Chapter 15 — Configuring screening at the job level]]

## References

- [[01 How-To Documents/recruiter/12-sourcing-channels|Chapter 12 — Sourcing channels]]
- [[01 How-To Documents/recruiter/13-linkedin-leads-rediscovery|Chapter 13 — LinkedIn Leads and Talent Rediscovery]]
- [[01 How-To Documents/recruiter/15-screening-config|Chapter 15 — Configuring screening at the job level]]
- [[01 How-To Documents/recruiter/04.5-how-we-charge|Chapter 4.5 — How Sebenza Hub charges you]]
