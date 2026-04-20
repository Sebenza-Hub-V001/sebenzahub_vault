---
title: "Chapter 12 — Sourcing channels"
type: concept
created: 2026-04-09
updated: 2026-04-20
tags: [how-to, recruiter, sourcing, ai-search, talent-discovery, candidate-search, talent-pool, market-pulse, linkedin]
status: draft
user-types: [recruiter]
---

# Chapter 12 — Sourcing channels: AI Search, Talent Discovery, Sourcing

Sebenza Hub has eight sourcing tools. They overlap, they have similar-sounding names, and the difference between them isn't obvious until you've used a few. This chapter is your decoder ring — what each tool is for, when to reach for which one, and the order to try them in for a typical role.

This chapter covers the three "core" sourcing tools: **AI Search**, **Talent Discovery**, and **Candidate Sourcing**. Chapters 13 and 14 cover the other five (LinkedIn Leads, Talent Rediscovery, Talent Pools, Talent CRM, and the Candidates database).

## The mental model

All eight tools answer the same question — "where is the next candidate for this job?" — but they look in different places:

| Where they look | Tool |
|---|---|
| Inside your existing candidate database | AI Search, Talent Rediscovery, Talent Pools, Talent CRM, Candidates |
| Outside your database (cold) | Talent Discovery, Candidate Sourcing |
| LinkedIn (a specific outside source) | LinkedIn Leads |

The right order for any new role is **inside-out**: search your existing data first (cheap, instant, candidates already know you), then expand to cold sourcing (slower, more expensive, candidates are starting from zero with you).

## 1. Search your existing database

Before any cold sourcing, search what you already have. Sebenza Hub layers four search features for the database — pick the right one for the depth you need.

### Basic Candidate Search — _Tier: Free_

**What this feature is.** Basic Candidate Search uses simple filters — keyword, location, role type, experience level — to query your candidate database. The starting-point search every recruiter has access to.

**Why it matters.** Every recruiter needs candidate search to evaluate the platform at all. Free basic search is the conversion tool — power users hit its limits within a week and upgrade to Advanced.

**How to use it.** Open `/dashboard/recruiter/candidates`, set the filters, run the search. If you find yourself wishing for boolean operators or skill weighting, you've outgrown Basic — move to Advanced.

![[13-raw/screenshots/r-ch12-candidate-search-results.png]]

### Advanced Candidate Search — _Tier: Standard_

**What this feature is.** Advanced Candidate Search adds full-text search, AI-powered match scoring across skills, experience, education, and certifications, plus boolean operators for power users.

**Why it matters.** Basic search surfaces 500 possible matches; Advanced narrows to the 20 actual candidates worth contacting. For any desk doing real volume, the time savings alone justify the Standard tier.

**How to use it.** Same `/dashboard/recruiter/candidates` page — Advanced filters appear once you're on Standard. Use boolean (`Python AND (fintech OR banking) NOT junior`) for precision, or AI Hybrid Search below for natural language.

### Full Candidate Database Access — _Tier: Premium_

**What this feature is.** Full Candidate Database Access removes the visibility cap on the candidate database — Premium users can search and contact passive candidates not actively applying, in addition to the active pool.

**Why it matters.** Passive candidates are the top 20% of the market; active ones are the bottom 80%. Full access is the feature agencies running retained-search desks pay for, because the senior candidates worth placing are almost never actively looking.

**How to use it.** With Premium active, the candidate search includes a **Passive** filter alongside the standard active filter. Treat passive results with care — outreach has to be more personalised, and consent rules still apply (Chapter 27).

### AI Hybrid Search — _Tier: Standard_

**What this feature is.** AI Hybrid Search combines AI semantic understanding with keyword matching — it finds candidates whose profiles use different words for the same concept ("Python dev" vs "backend engineer") while still respecting hard filters like location and seniority.

**Why it matters.** Pure keyword search misses semantic matches; pure semantic search returns too-broad results. Hybrid gets the best of both — it's the default search mode for any senior recruiter on the platform.

**How to use it.** Toggle **Hybrid** at the top of the candidate search. The query box accepts natural language; the filter sidebar still applies hard constraints.

![[13-raw/screenshots/r-ch12-ai-hybrid-search.png]]

### AI Job Search Parser — _Tier: Standard_

**What this feature is.** AI Job Search Parser takes a natural-language query — *"senior Python dev in Cape Town open to hybrid"* — and translates it into structured filters automatically (skill: Python, seniority: senior, location: Cape Town, remote: hybrid).

**Why it matters.** Junior recruiters never learn boolean syntax; senior recruiters forget which field is "location" vs "city". NL parsing removes the syntax tax and makes search faster for everyone — and surfaces a structured view of what the AI heard, so you can spot misinterpretations.

**How to use it.** Open AI Search at `/dashboard/recruiter/ai-search`, type your request in plain English, and the parsed filters appear above the results. Adjust the filters if the AI got something wrong, then re-run.

### Smart Search Suggestions — _Tier: Standard_

**What this feature is.** Smart Search Suggestions surface AI-generated tweaks to improve a search — synonym additions, filter relaxations, alternative keywords — when the current query returns 0 or too few results.

**Why it matters.** Most "0 results" searches are caused by one filter being too tight, but it's not always obvious which one. Suggestions tell you exactly which constraint to drop, converting dead-ends into live results without having to start the search over.

**How to use it.** Suggestions appear automatically below the results panel when the result count is low. Click any suggestion to apply it and re-run the search.

![[13-raw/screenshots/r-ch12-smart-search-suggestions.png]]

## 2. Saved searches and search-ops intelligence

Once you have searches you run repeatedly, the platform layers diagnostic and intelligence features on top so the searches don't decay or blindside you when the market shifts.

### Search Health Score — _Tier: Premium_

**What this feature is.** Search Health Score grades each saved search on effectiveness — too narrow, too broad, missing common synonyms, gone stale — and prompts fixes so the same search keeps delivering good candidates as the database evolves.

**Why it matters.** Recruiters set up a saved search once and never revisit it. Without scoring, the same search that returned 30 great candidates in January returns 5 mediocre ones by August and nobody notices. Health scoring catches the decay.

**How to use it.** Open **Saved searches** in the candidate search page. Each saved search shows a health score; click into any one with a low score to see specific fixes (add synonym, broaden seniority, drop an outdated certification filter).

### Search Market Pulse — _Tier: Premium_

**What this feature is.** Search Market Pulse runs a market-pulse analysis on your saved-search criteria — candidate supply, demand pressure, median salary movement, geographic hotspots — over the last 30/90/180 days.

**Why it matters.** Desks fail because the market moved, not because recruiters got worse at their jobs. Pulse surfaces those shifts early so the desk can pivot — a Cape Town fintech desk seeing a 22% supply drop should know in week 2, not in month 4 when billings crash.

**How to use it.** From any saved search, click **Market pulse**. The report shows trend lines and highlights material shifts. Set up a monthly pulse review for your top 3–5 saved searches.

![[13-raw/screenshots/r-ch12-market-pulse-chart.png]]

### Competitive Heat Map — _Tier: Premium_

**What this feature is.** Competitive Heat Map shows the competitive landscape for a given search profile — which other agencies and corporates are recruiting for similar candidates, in which locations, at what salary bands.

**Why it matters.** You can't compete on offer if you don't know what competitors are offering. Heat mapping is the "market intelligence" that senior recruiters currently buy separately from specialist vendors — having it inline with your search saves both the cost and the context-switch.

**How to use it.** From a search, click **Competitive heat map**. The map renders by location and shows competing employers, salary bands, and demand pressure. Use the insights when you advise a client on offer structure or talent timing.

![[13-raw/screenshots/r-ch12-competitive-heat-map.png]]

### Talent Pool Generator — _Tier: Standard_

**What this feature is.** Talent Pool Generator turns a free-text criterion — *"12 SA civil engineers with Aconex experience in Cape Town"* — into a saved talent-pool shortlist in one prompt-driven step.

**Why it matters.** Building pools manually is tedious and inconsistent across team members. AI generation compresses hours of search-save-tag work into a single prompt, and produces pools that are uniformly tagged and named so the team can actually find them again.

**How to use it.** Open `/dashboard/recruiter/talent-pool`, click **Generate pool**, type the criteria. The pool appears with all matching candidates pre-loaded. Chapter 14 covers what to do with pools after generation.

![[13-raw/screenshots/r-ch12-talent-pool-generator-dialog.png]]

## 3. AI Search — putting it together

**Page:** `/dashboard/recruiter/ai-search`

The AI Search page brings the Hybrid Search, Search Parser, and Smart Suggestions features together into a single natural-language interface against your database. You type a request, the parser extracts structure, hybrid search runs, suggestions appear if the result set is thin.

Each result shows:

- The candidate's name (or anonymised ID if blind hiring is on)
- Match score (0–100)
- Why they matched (which skills, which experience signals)
- Last activity (when they last engaged with the platform)
- Status (active job seeker, passive, placed elsewhere)

### When to use it

- **First action on any new role.** Always check your existing database before going cold.
- **Quick sanity-check on candidate availability** — "do I even have anyone who could do this?"
- **Late-stage backup search** when your active pipeline thins out

### When NOT to use it

- When you have very few candidates in your database. AI Search needs *something* to search; if your agency is brand new, the results will be sparse. Build the database first via Talent Discovery and direct applications.

### Pro tips

- **Specific beats broad.** "Senior PHP developer" returns hundreds of mediocre matches. "Senior PHP developer with WooCommerce and PSP integration experience in Johannesburg" returns five excellent matches.
- **Use the explain panel.** Each result has a "why this match" explanation — learn to read it. Sometimes AI Search includes a candidate for a reason that's wrong (an old CV, a stale skill tag), and the explanation reveals the bug.
- **Save your searches.** Recurring needs (e.g. "senior backend devs in Cape Town") should be saved searches that surface new candidates as they're added to your database — and then run a Search Health Score check on them quarterly.

## 4. Talent Discovery — passive candidates outside your database

**Page:** `/dashboard/recruiter/talent-discovery`

Talent Discovery finds **passive candidates** — people who aren't actively job-hunting but match a profile you describe. They're the most valuable category for senior roles, where the best candidates are usually already employed and not looking.

The flow:

1. Describe the role (or import from a job you've already created)
2. Set passive-friendliness criteria (e.g. "currently employed", "tenure 18+ months", "open to discussion only")
3. The AI suggests profiles from outside your platform database — public profiles, social signals, conference attendees, GitHub contributors, etc.
4. You review, save the ones worth pursuing, and trigger outreach

The AI doesn't violate POPIA — it surfaces publicly-available signals. But every outreach you send needs to comply with POPIA opt-out and consent rules (Chapter 27).

### When to use it

- **Senior or executive roles** where the best people are passively employed
- **Niche or scarce skills** where active candidates barely exist
- **Confidential searches** where you can't post the job publicly

### When NOT to use it

- **High-volume junior roles** — far too slow and expensive per candidate. Use direct applications and AI Search.
- **Roles where you need someone yesterday** — passive sourcing is a slow burn. It pays off over weeks, not days.

## 5. Multi-channel cold outreach

### Candidate Sourcing — _Tier: Standard_

**What this feature is.** Candidate Sourcing is the multi-channel sourcing and outreach toolset — LinkedIn, niche job boards, community channels — for reaching candidates outside your existing database. Where Talent Discovery helps you *identify* passive candidates, Candidate Sourcing helps you *reach them at scale*.

**Why it matters.** Sourcing is the top-of-funnel activity that determines what recruiters can place. Built-in sourcing tools replace 3–4 separate point tools (LinkedIn Recruiter, separate sequence software, niche-board accounts) and keep the data unified in one Sebenza Hub pipeline.

**How to use it.**

1. Open `/dashboard/recruiter/candidate-sourcing`.
2. Build a target audience (filters or imported list).
3. Craft a multi-step sequence (Day 0 cold message, Day 4 follow-up, Day 10 final touch).
4. Pick channels per step (Day 0 email, Day 4 LinkedIn message, Day 10 WhatsApp if consent).
5. Launch the sequence; reply rates feed back into your candidate engagement scores.

### When to use it

- **You have a clear, large target audience** (e.g. "all SQL DBAs in Gauteng with 5+ years")
- **The role isn't urgent** — sequences need time to play out
- **You want to build a long-term funnel** — sourcing campaigns also feed your talent pool

### When NOT to use it

- **Single-candidate outreach** — overkill. Just email them.
- **Without POPIA-compliant consent** for the channels you're using. WhatsApp messages without opt-in are a legal risk; email is generally fine for B2B but check your scenario.

## 6. LinkedIn as a sync target

### LinkedIn Sync — _Tier: Premium_

**What this feature is.** LinkedIn Sync pulls candidate profiles and leads from LinkedIn into Sebenza Hub, including enrichment of existing records (current role, latest activity, recent connections). It keeps your two systems in parity without you maintaining both manually.

**Why it matters.** LinkedIn is still the top source for senior candidates. Sync means you don't have to choose between "the data lives on LinkedIn" and "the data lives in Sebenza Hub" — it lives in both, with Sebenza Hub as the system of record. The Premium tier reflects the LinkedIn API cost.

**How to use it.** Connect your LinkedIn account in `/dashboard/recruiter/settings` → **Integrations**. Once connected, sync runs automatically — new leads from LinkedIn appear in your candidate database, and existing candidate records are enriched with current LinkedIn data. Chapter 13 covers the LinkedIn-specific lead-gen flow on top of this sync.

![[13-raw/screenshots/r-ch12-linkedin-sync.png]]

## The "first hour" sourcing routine

When you take on a new role, the right sequence in the first hour:

1. **5 min — AI Search** your existing database with a specific query. Save 5–10 strong matches.
2. **5 min — Talent Pools** (Chapter 14) — check if you already have a relevant pool you can pull from.
3. **10 min — Talent Rediscovery** (Chapter 13) — surface past candidates who fit but were placed elsewhere or paused.
4. **20 min — Talent Discovery** — build a passive shortlist if the role warrants it.
5. **20 min — Candidate Sourcing** — kick off a sequence if you'll need volume over the coming weeks.

That's your hour. By the end, you've checked every internal source and started two external channels. Most senior roles can be filled with the candidates this hour produces.

## Sourcing as a metered activity

Both Talent Discovery and Candidate Sourcing tap AI capacity that's metered against your plan (Chapter 4.5). The metered features that matter here:

- **AI Search** queries (some plans cap monthly AI search queries)
- **Active sourcing sequences** (cap on concurrently-running campaigns)
- **AI screening** (auto-scoring of new candidates surfaced by sourcing)

Watch your usage on `/dashboard/recruiter/billing` → Usage history. If you're regularly running out, that's the signal to upgrade.

## Pro tips

- **Inside before outside.** Your existing database is free, instant, and already engaged. Cold sourcing is slow and expensive. Always do AI Search first.
- **Don't burn AI Search on questions you can answer manually.** If you're looking for "candidates I spoke to last Tuesday", just open the candidates list with a date filter. Save AI Search for queries that need actual reasoning.
- **Tag everything.** Every candidate you find through sourcing should get tags (`tech_stack:python`, `location:cpt`, `level:senior`) so they're easy to find later. Untagged candidates are invisible to your future searches.
- **Sequences need real subject lines.** "Job opportunity" is filtered to spam. "Re: your Postgres talk at PyConZA" gets opened. The AI can help draft these, but you have to give it the context.

## Checklist

- [ ] You know which tool to reach for first on a new role (AI Search)
- [ ] You've run at least one AI Search query to see how it performs against your data
- [ ] You understand the difference between Basic, Advanced, Full DB Access, and Hybrid search
- [ ] You've set up at least one saved search and run a Search Health Score check on it
- [ ] You understand the difference between Talent Discovery (identify) and Candidate Sourcing (reach)
- [ ] LinkedIn Sync is connected (Premium) or you've noted it for when you upgrade
- [ ] You know your plan's caps on AI Search queries and active sequences
- [ ] You're tagging new candidates so future searches find them

## Features covered in this chapter

| # | Feature | Tier |
|---|---------|------|
| 1 | Basic Candidate Search | Free |
| 2 | Advanced Candidate Search | Standard |
| 3 | Full Candidate Database Access | Premium |
| 4 | AI Hybrid Search | Standard |
| 5 | AI Job Search Parser | Standard |
| 6 | Smart Search Suggestions | Standard |
| 7 | Search Health Score | Premium |
| 8 | Search Market Pulse | Premium |
| 9 | Competitive Heat Map | Premium |
| 10 | Talent Pool Generator | Standard |
| 11 | Candidate Sourcing | Standard |
| 12 | LinkedIn Sync | Premium |

## Next chapter

[[01 How-To Documents/recruiter/13-linkedin-leads-rediscovery|Chapter 13 — LinkedIn Leads and Talent Rediscovery]]

## References

- [[02-concepts/ai-features]] — AI capabilities behind these tools
- [[02-concepts/compliance]] — POPIA implications for cold outreach
- [[01 How-To Documents/recruiter/13-linkedin-leads-rediscovery|Chapter 13 — LinkedIn Leads and Talent Rediscovery]]
- [[01 How-To Documents/recruiter/14-talent-pools-crm|Chapter 14 — Talent Pools and Talent CRM]]
- [[01 How-To Documents/recruiter/04.5-how-we-charge|Chapter 4.5 — How Sebenza Hub charges you]]
