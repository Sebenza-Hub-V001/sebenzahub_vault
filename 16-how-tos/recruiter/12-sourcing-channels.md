---
title: "Chapter 12 — Sourcing channels"
type: concept
created: 2026-04-09
updated: 2026-04-09
tags: [how-to, recruiter, sourcing, ai-search, talent-discovery]
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

## 1. AI Search — your database, in plain English

**Page:** `/dashboard/recruiter/ai-search`

AI Search lets you query your own candidate database in natural language. Instead of building Boolean filters or scrolling lists, you type a request and the AI retrieves the closest matches:

> *"Senior Python developers in Cape Town with fintech experience and at least 7 years"*

The AI parses your request, searches across CVs, profiles, skills, sectors, locations, and seniority indicators, and returns a ranked list. Each result shows:

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
- **Save your searches.** Recurring needs (e.g. "senior backend devs in Cape Town") should be saved searches that surface new candidates as they're added to your database.

## 2. Talent Discovery — passive candidates outside your database

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

## 3. Candidate Sourcing — multi-channel cold outreach

**Page:** `/dashboard/recruiter/candidate-sourcing`

Candidate Sourcing is the multi-channel campaign tool. Where Talent Discovery helps you *identify* passive candidates, Candidate Sourcing helps you *reach them at scale* across email, LinkedIn, WhatsApp, and any integrated channel.

The flow:

1. Build a target audience (filters or imported list)
2. Craft a multi-step sequence (Day 0 cold message, Day 4 follow-up, Day 10 final touch)
3. Pick channels per step (Day 0 email, Day 4 LinkedIn message, Day 10 WhatsApp if consent)
4. Launch the sequence
5. Track responses; reply rates feed back into your candidate engagement scores

### When to use it

- **You have a clear, large target audience** (e.g. "all SQL DBAs in Gauteng with 5+ years")
- **The role isn't urgent** — sequences need time to play out
- **You want to build a long-term funnel** — sourcing campaigns also feed your talent pool

### When NOT to use it

- **Single-candidate outreach** — overkill. Just email them.
- **Without POPIA-compliant consent** for the channels you're using. WhatsApp messages without opt-in are a legal risk; email is generally fine for B2B but check your scenario.

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
- [ ] You understand the difference between Talent Discovery (identify) and Candidate Sourcing (reach)
- [ ] You know your plan's caps on AI Search queries and active sequences
- [ ] You're tagging new candidates so future searches find them

## Next chapter

[[16-how-tos/recruiter/13-linkedin-leads-rediscovery|Chapter 13 — LinkedIn Leads and Talent Rediscovery]]

## References

- [[02-concepts/ai-features]] — AI capabilities behind these tools
- [[02-concepts/compliance]] — POPIA implications for cold outreach
- [[16-how-tos/recruiter/13-linkedin-leads-rediscovery|Chapter 13 — LinkedIn Leads and Talent Rediscovery]]
- [[16-how-tos/recruiter/14-talent-pools-crm|Chapter 14 — Talent Pools and Talent CRM]]
- [[16-how-tos/recruiter/04.5-how-we-charge|Chapter 4.5 — How Sebenza Hub charges you]]
