---
title: "Chapter 13 — Talent Rediscovery and LinkedIn Leads"
type: concept
created: 2026-04-09
updated: 2026-04-20
tags: [how-to, recruiter, linkedin, rediscovery, sourcing, re-engagement, ai-recommendations]
status: draft
user-types: [recruiter]
---

# Chapter 13 — Talent Rediscovery and LinkedIn Leads

These two tools are the **warm-but-not-yet-engaged** sources. Talent Rediscovery finds people *already* in your database who you've forgotten about. LinkedIn Leads brings people into your database from a single specific channel. Both are higher-yield than cold sourcing because the candidate has at least one prior touchpoint with you or with a context that makes you credible.

## Where they sit in the warm-to-cold order

By the time you reach this chapter you've already worked Talent Pools and Talent CRM (Chapter 12) — your warmest, most-engaged candidates. Cold sourcing channels (Chapter 14) are still ahead. The two tools in this chapter sit *between* the two extremes:

- **Talent Rediscovery** — the candidate *was* in your database for a previous role and has gone quiet. They're not cold; they're dormant. Reach for them first.
- **LinkedIn Leads** — the target has a LinkedIn profile that hints at fit; they're a "warm import" rather than a cold reach.

Used well, these two together fill 30–40% of your senior roles. Used poorly, they become a graveyard of unanswered outreach.

## 1. Three features for resurfacing past candidates

Past candidates are the cheapest source of qualified hires you have. Sebenza Hub layers three features on this — one to surface forgotten candidates against new roles, one to drive structured re-engagement, and one purpose-built for executive-level rediscovery.

### AI Candidate Recommendations — _Tier: Standard_

**What this feature is.** AI Candidate Recommendations surfaces the top candidates from your existing database for any open job you have published. It runs against your active postings continuously and pushes a ranked shortlist of "best-fit candidates you already know" into the job's pipeline view.

**Why it matters.** Most agencies forget about candidates after two weeks of no contact. AI recommendations re-surface forgotten candidates for new roles automatically — effectively finding free inventory on your existing book before you go cold sourcing. For most desks this is a 10–15% uplift in placements with zero new sourcing cost.

**How to use it.** Open any active job → **AI Recommendations** tab. Review the ranked candidates with their match reasoning. Move the strong ones into the pipeline; dismiss the wrong ones (the dismissals train the model).

![[r-ch13-ai-candidate-recommendations.png]]

### Candidate Re-Engagement — _Tier: Standard_

**What this feature is.** Candidate Re-Engagement generates AI-driven strategies and personalised messaging to reach out to past candidates for new roles — drawing on the candidate's history, the previous interaction, and the new role's fit.

**Why it matters.** Re-engagement is the highest-conversion outreach you can do because the candidate already knows you. Structured strategies and personalised messages lift response from cold past-candidate outreach dramatically — generic re-engagement emails get ignored, but a message that references the previous conversation gets a reply.

**How to use it.** From any past candidate's profile, click **Re-engage**. Pick the open role you want to talk about; the AI suggests a message that references the prior interaction (e.g. "you came second on the Naspers role in March 2024"). Edit, send, log.

![[r-ch13-candidate-reengagement.png]]

### Talent Rediscovery — _Tier: Premium_

**What this feature is.** Talent Rediscovery is the dedicated AI-driven view of your dormant database matched against every open role — a continuously updated "who in your database fits this brief?" answer for every active job. It's the most underused tool in the platform.

**Why it matters.** 90% of agency value sits in the existing database but is under-utilised. Rediscovery monetises inventory you've already paid for — the highest-margin feature on the recruiter side, because every candidate it resurfaces is one you don't have to source cold.

It surfaces candidates already in your database who:

- Matched a previous role but were not placed (they were strong but lost out)
- Were placed in a role 18–24 months ago and may now be open to a move
- Engaged with your agency in the past but went quiet (no recent activity)
- Are now a better match for an open role than they were when you first met them

**How to use it.** Open [https://www.sebenzahub.co.za/dashboard/recruiter/talent-rediscovery](https://www.sebenzahub.co.za/dashboard/recruiter/talent-rediscovery). The page shows your dormant candidates ranked by re-engagement potential, with the open job they best fit. Spend 15–20 minutes per week here; aim to re-engage 5–10 candidates per week. Then use Candidate Re-Engagement above to send the actual outreach.

![[r-ch13-talent-rediscovery-view.png]]

### Why it works (the pattern Rediscovery exploits)

Recruiters chronically under-leverage their existing database. The same pattern plays out everywhere:

- You sourced someone strong for Role X 18 months ago
- They didn't get Role X (someone else got the offer)
- You moved on; they moved on
- You never spoke again

That candidate is probably more experienced now, possibly looking again, and far more likely to respond to you (a known recruiter who treated them well) than to a cold outreach. Talent Rediscovery surfaces this pattern for every dormant candidate, every week.

### The right cadence

- Spend **15–20 minutes per week** on Talent Rediscovery. Not more, not less.
- Aim to re-engage 5–10 dormant candidates per week using Candidate Re-Engagement.
- Track the response rate — if it's above 25%, you're doing it right; if it's below 10%, your messages are too generic.

### When NOT to use it

- **As a substitute for fresh sourcing.** Rediscovery refills the pipeline; it doesn't replace new sourcing for high-volume roles.
- **For candidates who explicitly said "don't contact me again."** The platform should respect suppression lists, but always double-check before sending.

## 2. LinkedIn Leads

**Page:** [https://www.sebenzahub.co.za/dashboard/recruiter/linkedin-leads](https://www.sebenzahub.co.za/dashboard/recruiter/linkedin-leads)

LinkedIn Leads is the integration point between LinkedIn and Sebenza Hub. It pulls in people who match a target profile, scores and enriches them with AI, and lets you nurture them through sequences before converting them into full candidate records.

This page sits on top of **LinkedIn Sync** (covered in Chapter 14) — Sync brings the data in, LinkedIn Leads is what you do with it.

### The flow

```
Define a target profile in LinkedIn Leads
   ↓
Import matching profiles (manually or via the LinkedIn integration)
   ↓
AI scores and enriches each lead:
  ├─ Match score against your active jobs
  ├─ Inferred skills, sectors, seniority
  ├─ Engagement likelihood
  └─ Suggested outreach tone
   ↓
Lead enters the nurture sequence
   ↓
On positive response → convert to full candidate record
   ↓
Candidate enters the standard sourcing pool
```

### Setting up a lead source

1. Open [https://www.sebenzahub.co.za/dashboard/recruiter/linkedin-leads](https://www.sebenzahub.co.za/dashboard/recruiter/linkedin-leads) and click **+ New lead source**.
2. Pick the import method:
   - **Manual paste** — paste a list of LinkedIn URLs you've collected
   - **CSV upload** — upload a spreadsheet of leads (e.g. exported from LinkedIn Sales Navigator)
   - **API integration** — if you have the LinkedIn integration enabled, you can pull directly
3. Tag the source so you can later measure which lead sources actually convert. ("PyConZA 2025 attendee list", "LinkedIn group X", etc.)
4. Set the default nurture sequence (or create a new one).

![[r-ch13-linkedin-leads-import.png]]

### Nurturing leads

The platform's sequence engine (Chapter 23) sends multi-touch outreach automatically. A typical lead nurture:

- **Day 0** — light first touch via LinkedIn ("noticed your background in X, wanted to connect")
- **Day 4** — follow up with a specific role link if they didn't respond
- **Day 10** — final follow-up across a different channel (email)
- **Exit rule** — any reply pauses the sequence and routes to your inbox

The point of nurturing is *not* to close them on the first touch. Most leads respond on touch 2 or 3. Don't escalate aggressively; you're building a relationship, not running a sales blitz.

### When to use LinkedIn Leads

- **Senior and specialised roles** where LinkedIn is the dominant talent pool
- **Competitor poaching** — you've identified specific people at a specific competitor
- **Geographic expansion** — a new city where you don't have an existing database
- **Building your talent pool over time** — every lead that doesn't convert today is in your database for next quarter

### Compliance note

LinkedIn outreach is governed by both LinkedIn's own terms and POPIA. The platform's integration handles rate limiting and connection-request etiquette automatically, but **you** are responsible for the content of messages and for honouring opt-outs. A reply of "no thanks" or "please don't message me again" must be added to your suppression list immediately. Chapter 27 covers this.

## Pro tip: link the two tools

LinkedIn Leads brings new people in. Talent Rediscovery resurfaces old people. The same nurture sequences and the same outreach templates work for both — and the platform's analytics treat them similarly. Build one good "warm reach" sequence and reuse it for both contexts.

## Pro tips

- **Personal beats automated.** Sequences and AI-suggested messages get you in the door. The reply that converts is always the one you wrote yourself with five seconds of personalisation.
- **Re-engagement messages must reference history.** "Hi, we have a role for you" gets ignored. "Hi Thandi, you'll remember we spoke in March 2024 about the Naspers role — you came second by a hair. Just opened a similar role at Discovery — interested?" gets a reply.
- **Suppression hygiene.** Every "no" reply should immediately add to suppression. The platform helps but you have to actively click the right buttons.
- **Measure conversion, not response.** A lead that replies "thanks but no" is not a win — it's just polite. A lead that converts to a full candidate record (and ideally a placement) is the only metric that matters.

## Checklist

- [ ] You've imported at least one batch of LinkedIn leads (or know how to)
- [ ] You've set up a default nurture sequence for new leads
- [ ] You've checked AI Candidate Recommendations on each of your active jobs
- [ ] You've spent 15 minutes on Talent Rediscovery this week
- [ ] You've used Candidate Re-Engagement to send at least 5 personal re-engagement messages
- [ ] You understand the POPIA implications of cold outreach (Chapter 27)

## Features covered in this chapter

| # | Feature | Tier |
|---|---------|------|
| 1 | AI Candidate Recommendations | Standard |
| 2 | Candidate Re-Engagement | Standard |
| 3 | Talent Rediscovery | Premium |

## Next chapter

[[01 How-To Documents/recruiter/14-sourcing-channels|Chapter 14 — Sourcing channels: AI Search, AI Sourcing, Talent Discovery]]

## References

- [[02-concepts/compliance]] — POPIA, opt-outs, suppression lists
- [[02-concepts/ai-features]] — AI scoring and enrichment
- [[01 How-To Documents/recruiter/12-talent-pools-crm|Chapter 12 — Talent Pools and Talent CRM]]
- [[01 How-To Documents/recruiter/14-sourcing-channels|Chapter 14 — Sourcing channels]]
