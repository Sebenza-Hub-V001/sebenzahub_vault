---
title: "Chapter 10 — Managing client relationships"
type: concept
created: 2026-04-09
updated: 2026-04-09
tags: [manual, recruiter, clients, crm, relationships]
status: draft
user-types: [recruiter]
---

# Chapter 10 — Managing client relationships

Adding a client (Chapter 8) and setting up an engagement (Chapter 9) are one-time events. **Managing the relationship** is the work that happens every week, every month, every year you keep the client. This chapter covers the tools Sebenza Hub gives you to keep relationships healthy and the cadence you should aim for.

The agencies that fail aren't the ones that can't source candidates — it's the ones that lose clients faster than they win them. The cost of acquiring a new client is roughly 5–10× the cost of keeping an existing one. The platform has a CRM-grade set of tools for this; this chapter explains how to use them without it becoming bureaucratic overhead.

## The four tools you'll use most

| Tool | Page | What you'll use it for |
|---|---|---|
| **Client Pipeline** | `/dashboard/recruiter/client-pipeline` | Tracking opportunities at each client (potential mandates, in-flight roles, deals being negotiated) |
| **Call Notes** | `/dashboard/recruiter/call-notes` | Logging every phone call, email, meeting, or message with a client |
| **Client Meetings** | (inside each client page) | Scheduling check-ins, QBRs, contract reviews |
| **Client Satisfaction** | (inside each client page → Feedback) | Sending NPS surveys and reading the responses |

There's also Documents (covered in Chapter 8) and Revenue (covered briefly here). Together these are your CRM.

## Client Pipeline — opportunities, not jobs

The Client Pipeline is *not* the same as the candidate Pipeline (Chapter 16). The candidate pipeline tracks individuals moving through hiring stages. The client pipeline tracks **opportunities** moving through deal stages — discussions about future mandates, RFPs, retainer negotiations, expansion conversations.

Typical client pipeline stages:

1. **Discovery** — first conversations about a potential mandate
2. **Qualified** — they've confirmed budget, timeline, and decision-maker
3. **Proposing** — you've sent terms / a proposal
4. **Negotiating** — back-and-forth on commercials
5. **Won** — engagement signed, ready to start work
6. **Lost** — deal didn't happen (record the reason)
7. **Paused** — postponed by the client

Each opportunity has an estimated value, an expected close date, and a probability. The sum of (value × probability) across all opportunities is your **forecasted pipeline** — what you expect to win in the coming weeks. Watch this number weekly. If it's flat or declining for a month, you have a business development problem before you have a recruitment problem.

## Call Notes — write everything down

Call Notes is a free-form activity log. Every interaction with a client should be logged here:

- Phone calls (with date, duration, and summary)
- Emails (the important ones — not every back-and-forth, but every substantive exchange)
- Meetings (with attendees and outcomes)
- Follow-ups (what you committed to do, by when)
- Status changes (if a client tells you they're moving from active to paused, log it)

The note types available: `note`, `call`, `email`, `meeting`, `follow_up`, `status_change`. Pick the right type — it makes the timeline filterable later.

Each note has:

- **Subject** — a short summary line
- **Content** — the full notes
- **Pinned** — flip on for notes you want to keep at the top of the client's timeline
- **Author** — auto-recorded from your account

### The 30-second rule

The hardest part of using Call Notes well is that nobody wants to type up a long memo after a 5-minute call. So don't. **Use the 30-second rule:** every call gets a note within 30 seconds of hanging up, even if the note is just three lines:

> Subject: Q4 hiring plan check-in
> Sarah confirmed they're opening 4 senior dev roles in October. Wants 2 in Cape Town, 2 remote. I committed to send a sourcing approach by Friday. She mentioned the previous agency was too slow on shortlists.

That note is 30 seconds of typing. It captures the commitment, the context, the implicit warning ("too slow"), and the date. In three months when you're trying to remember why you took on those roles, this note is gold.

## Client Meetings — schedule the rhythm

Sporadic relationship management is worse than no relationship management. Schedule the cadence and stick to it:

| Client tier | Recommended cadence | Meeting type |
|---|---|---|
| **Tier A (top 5–10)** | Monthly check-in + Quarterly Business Review | 30 min check-in, 60 min QBR |
| **Tier B (working clients)** | Quarterly check-in | 30 min |
| **Tier C (transactional)** | Twice-yearly catch-up | 30 min |
| **Dormant (re-engagement)** | Six-monthly outreach | Email + optional call |

Schedule these in advance — book a year of QBRs in January for all your Tier A clients. The platform's Client Meetings feature integrates with your calendar (Chapter 18 has the full calendar integration story) and sends reminders.

QBR agenda (steal this):

1. What we delivered last quarter (placements, time-to-fill, quality scores)
2. What's open right now (live mandates, status of each)
3. Their hiring plans for next quarter
4. Any feedback (good or bad) on the relationship
5. Any expansion opportunities (other teams, other locations, new sectors)

A QBR that doesn't generate at least one new opportunity for the next quarter is a wasted QBR.

## Client Satisfaction (NPS) — the early warning system

Client satisfaction surveys go out automatically at key moments — after a placement, after a quarter of work, after a major milestone. The platform sends them via the Feedback feature (`/dashboard/recruiter/feedback`).

The score that matters most is **NPS** (Net Promoter Score), a 0–10 rating that asks "how likely are you to recommend us?" Industry interpretation:

- **9–10 (Promoters)** — they'd recommend you. Ask for testimonials and referrals.
- **7–8 (Passives)** — neutral. They'll keep working with you but won't actively recommend you. Investigate why they're not promoters.
- **0–6 (Detractors)** — at risk. **This is your early warning.** A detractor is six months away from churning unless you intervene.

When a detractor score lands, the platform flags it on your dashboard. **Respond within 48 hours.** Pick up the phone, ask what went wrong, and address it. The detractor → churn path is recoverable if you act fast; ignored detractors become lost clients with a story about how you didn't care.

NPS also feeds into your Reputation Score (Chapter 6). Detractors don't just hurt the relationship — they hurt your AI credibility scores too.

## Client Revenue tracking

Every placement that happens against a client engagement creates a revenue line. You can see the rolling total per client in their detail page → Revenue tab. This is your honest record of what each client is worth to you.

A common eye-opening exercise: sort your client list by total revenue and look at the bottom 50%. How much time do you spend on those clients vs the top 20%? The platform's KPI Dashboard (Chapter 25) makes this analysis easy.

If a Tier A client's revenue has been declining quarter-over-quarter, they're at risk. Treat it like a detractor NPS — investigate immediately.

## A weekly client management routine

Don't let CRM become bureaucracy. Use a tight 30-minute weekly routine:

1. **Monday morning (15 min):** Open Client Pipeline. Review every opportunity in Negotiating or Proposing. For each, what's the next action and who owns it? Update.
2. **Monday morning (5 min):** Open the call notes timeline filtered to "follow_up". Anything overdue? Action it today.
3. **Friday afternoon (5 min):** Open the client list sorted by Last activity. Any Tier A or Tier B clients you haven't touched in 3+ weeks? Send a quick email or schedule a call for next week.
4. **Friday afternoon (5 min):** Review any new NPS responses. Detractor? Phone call on Monday.

That's your CRM rhythm. Half an hour a week keeps the relationships healthy. Skipping it for a month means losing a client per quarter you didn't have to lose.

## Pro tips

- **Pin the important notes.** Pricing conversations, escalations, scope changes — pin them so they're always at the top of the timeline.
- **WhatsApp consent matters.** Check the `whatsappConsent` flag on a contact before messaging them on WhatsApp. POPIA isn't optional. (Chapter 27 has more.)
- **Use status changes deliberately.** Moving a client from active to dormant is a real signal — don't do it casually. But do do it accurately.
- **Don't share contact details across agencies.** Even if you've left another agency and brought clients with you, your relationship history stays at the previous agency. Start fresh in your current organisation.

## Checklist

- [ ] Client Pipeline has at least one opportunity in it (or you've noted that you're 100% on existing mandates)
- [ ] Call Notes has at least one entry — you're in the habit
- [ ] You've scheduled monthly check-ins for your top 3 clients
- [ ] You know how to read NPS responses and how to respond to a detractor
- [ ] You have a weekly 30-minute CRM routine you'll actually do

## Next chapter

[[16-manuals/recruiter/11-posting-a-job|Chapter 11 — Posting a job (with AI JD Writer)]]

## References

- [[02-concepts/compliance]] — POPIA consent for client communications
- [[16-manuals/recruiter/08-adding-clients|Chapter 8 — Adding corporate clients]]
- [[16-manuals/recruiter/09-engagement-terms|Chapter 9 — Engagement terms]]
- [[16-manuals/recruiter/11-posting-a-job|Chapter 11 — Posting a job]]
