---
title: "Chapter 13 — LinkedIn Leads and Talent Rediscovery"
type: concept
created: 2026-04-09
updated: 2026-04-09
tags: [how-to, recruiter, linkedin, rediscovery, sourcing]
status: draft
user-types: [recruiter]
---

# Chapter 13 — LinkedIn Leads and Talent Rediscovery

These two tools are the **warm-but-not-yet-engaged** sources. LinkedIn Leads brings people into your database from a single specific channel. Talent Rediscovery finds people *already* in your database who you've forgotten about. Both are higher-yield than cold sourcing because the candidate has at least one prior touchpoint with you or with a context that makes you credible.

## Why they get their own chapter

Cold sourcing (Chapter 12) is slow and expensive. Internal database search (AI Search) is fast but limited to people already in your system. These two tools sit in between:

- **LinkedIn Leads** — the target has a LinkedIn profile that hints at fit; they're a "warm import" rather than a cold reach.
- **Talent Rediscovery** — the target *was* in your database for a previous role and has gone quiet. They're not cold; they're dormant.

Used well, these two together fill 30–40% of your senior roles. Used poorly, they become a graveyard of unanswered outreach.

## 1. LinkedIn Leads

**Page:** `/dashboard/recruiter/linkedin-leads`

LinkedIn Leads is the integration point between LinkedIn and Sebenza Hub. It pulls in people who match a target profile, scores and enriches them with AI, and lets you nurture them through sequences before converting them into full candidate records.

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

1. Open `/dashboard/recruiter/linkedin-leads` and click **+ New lead source**.
2. Pick the import method:
   - **Manual paste** — paste a list of LinkedIn URLs you've collected
   - **CSV upload** — upload a spreadsheet of leads (e.g. exported from LinkedIn Sales Navigator)
   - **API integration** — if you have the LinkedIn integration enabled, you can pull directly
3. Tag the source so you can later measure which lead sources actually convert. ("PyConZA 2025 attendee list", "LinkedIn group X", etc.)
4. Set the default nurture sequence (or create a new one).

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

## 2. Talent Rediscovery

**Page:** `/dashboard/recruiter/talent-rediscovery`

Talent Rediscovery is the most underused tool in the platform. It surfaces candidates already in your database who:

- Matched a previous role but were not placed (they were strong but lost out)
- Were placed in a role 18–24 months ago and may now be open to a move
- Engaged with your agency in the past but went quiet (no recent activity)
- Are now a better match for an open role than they were when you first met them

The AI compares your active jobs against every dormant candidate in your database and ranks the best re-engagement targets.

### Why it works

Recruiters chronically under-leverage their existing database. The same pattern plays out everywhere:

- You sourced someone strong for Role X 18 months ago
- They didn't get Role X (someone else got the offer)
- You moved on; they moved on
- You never spoke again

That candidate is probably more experienced now, possibly looking again, and far more likely to respond to you (a known recruiter who treated them well) than to a cold outreach. Talent Rediscovery surfaces this pattern for every dormant candidate, every week.

### How to use it

1. Open `/dashboard/recruiter/talent-rediscovery`.
2. The page shows your dormant candidates ranked by re-engagement potential, with the open job they best fit.
3. Click into a candidate to see:
   - When you last spoke to them
   - What role they were originally sourced for
   - Why the AI thinks they fit a current open role
   - Suggested re-engagement message tone (warm, professional, casual)
4. Send a re-engagement message — usually a personal note that references the previous interaction, not a generic "we have a role for you".

### The right cadence

- Spend **15–20 minutes per week** on Talent Rediscovery. Not more, not less.
- Aim to re-engage 5–10 dormant candidates per week.
- Track the response rate — if it's above 25%, you're doing it right; if it's below 10%, your messages are too generic.

### When NOT to use it

- **As a substitute for fresh sourcing.** Rediscovery refills the pipeline; it doesn't replace new sourcing for high-volume roles.
- **For candidates who explicitly said "don't contact me again."** The platform should respect suppression lists, but always double-check before sending.

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
- [ ] You've spent 15 minutes on Talent Rediscovery this week
- [ ] You have a habit of writing personal re-engagement messages, not generic ones
- [ ] You understand the POPIA implications of cold outreach (Chapter 27)

## Next chapter

[[16-how-tos/recruiter/14-talent-pools-crm|Chapter 14 — Talent Pools and Talent CRM]]

## References

- [[02-concepts/compliance]] — POPIA, opt-outs, suppression lists
- [[02-concepts/ai-features]] — AI scoring and enrichment
- [[16-how-tos/recruiter/12-sourcing-channels|Chapter 12 — Sourcing channels]]
- [[16-how-tos/recruiter/14-talent-pools-crm|Chapter 14 — Talent Pools and Talent CRM]]
