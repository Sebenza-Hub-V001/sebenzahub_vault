---
title: "Chapter 21 — Recording a placement and revenue"
type: concept
created: 2026-04-09
updated: 2026-04-09
tags: [how-to, recruiter, placement, revenue, kpi]
status: draft
user-types: [recruiter]
---

# Chapter 21 — Recording a placement and revenue

The candidate accepted the offer. This is the moment your work pays off — both literally (you've earned a placement fee) and structurally (the placement record is what feeds your KPI Dashboard, your retention tracking, your trust badges, and your client revenue history). This chapter walks through what happens when an acceptance lands and what *you* need to do to make sure the platform records it correctly.

## Where it lives

| Page | What it does |
|---|---|
| `/dashboard/recruiter/placements` | Master list of every placement with status and retention tracking |
| `/dashboard/recruiter/submissions` | Submission tracking — every candidate sent to a client job |
| `/dashboard/recruiter/onboarding` | Post-hire onboarding checklists you run with the placed candidate |
| `/dashboard/recruiter/kpi-dashboard` | Where the placement shows up in your headline metrics |

## What happens automatically when an offer is accepted

When a candidate clicks "Accept" on their offer (or you log their verbal acceptance and update the status), the platform triggers a chain of automated events:

1. **Offer status** flips to `accepted`
2. **Application status** moves to `Hired`
3. **Pipeline stage** moves to `placed`
4. **Placement record** is created in the placements table, linked to:
   - The candidate
   - The job
   - The original submission (if applicable)
   - The corporate client engagement
5. **Revenue line** is created in `clientRevenue` based on the engagement's fee terms (percentage of base salary, fixed retainer, or hybrid)
6. **Trust badge progress** is recalculated (you may have just crossed the threshold for `placement_proven` — Chapter 6)
7. **KPI Dashboard** metrics refresh (placements made, fill rate, time-to-fill, revenue)
8. **Audit trail** records the placement event with full context

That's 8 things happening from one button click. Most of it you don't need to think about. The parts you *do* need to think about are below.

## Step 1 — Verify the placement record

Open `/dashboard/recruiter/placements` and find the new entry. Check that:

- The **start date** is correct (the candidate's actual first day, not the offer date)
- The **fee amount** matches your engagement terms
- The **client** and **job** linkages are correct
- The **placement status** is set appropriately:
  - `pending_start` — accepted, hasn't started yet (the most common initial state)
  - `started` — first day complete
  - `in_guarantee` — within the guarantee period
  - `confirmed` — past the guarantee period, fully placed
  - `replacement` — original placement failed and you're replacing
  - `failed` — within guarantee, candidate left, no replacement coming

The platform sets the initial status, but you'll update it as the candidate moves through their first months in the role.

## Step 2 — Record the start date and notice period

The candidate may have a notice period at their current employer (typically 30 calendar days for SA, 90 days for senior roles). The actual start date is when they show up at the client, not when they accept the offer.

Set the `startDate` field on the placement to the *actual* start date. The platform uses this for:

- Time-to-fill calculations (offer accepted vs job created — short is good)
- Time-to-start calculations (offer accepted vs first day — long means notice period eats into your fill rate)
- Guarantee period start (the guarantee clock starts from the start date)
- Revenue recognition timing (some agencies invoice on offer; most invoice on start)

## Step 3 — Trigger post-hire onboarding

Open `/dashboard/recruiter/onboarding` and create an onboarding checklist for the placement. The checklist tracks tasks that need to happen between offer acceptance and the candidate's first day:

| Task | Owner | When |
|---|---|---|
| Send welcome pack to candidate | You (recruiter) | Within 48 hours of acceptance |
| Notify client HR / IT to provision the candidate | Client HR contact | Within 5 days |
| Confirm laptop / equipment ordering | Client IT | 1–2 weeks before start |
| Send first-day instructions to candidate | You | 3 days before start |
| Day-1 check-in with candidate | You | First day, end of day |
| Week-1 check-in with candidate | You | End of week one |
| 30-day check-in with candidate AND client | You | After 30 days |
| 90-day check-in (mid-guarantee) | You | After 90 days |

Most of these can be templated and reused per placement. The platform reminds you when each is due.

### Why post-hire onboarding matters

The first 90 days are the highest-risk window. A candidate who feels abandoned by their recruiter after the offer signs is a candidate who might quit during the guarantee period and cost you the entire fee. Twenty minutes of check-ins over the first 30 days dramatically reduces guarantee-period failures.

## Step 4 — Verify revenue recording

Open the placement and check the **Revenue** tab. You should see a revenue line with:

- **Amount** — calculated from your engagement terms
- **Currency** — usually ZAR
- **Type** — `placement_fee` (or other types like `retainer_milestone`, `success_fee`)
- **Status** — `pending` (not yet invoiced), `invoiced` (sent), `paid` (received), `disputed` (problem)
- **Linked engagement** — the engagement record from Chapter 9

If the calculated amount is wrong, the engagement terms are wrong. Don't manually override the revenue line — go back to the engagement record (Chapter 9), fix the fee terms, and the revenue recalculates.

### The revenue lifecycle

```
pending → invoiced → paid    (the happy path)
   ↓
   → disputed → resolved → invoiced → paid  (the rare case)
```

You'll mostly see pending and paid. Disputed should be rare; when it happens, the audit trail (Chapter 28) is your defence.

## Step 5 — Retention monitoring

During the guarantee period, the platform monitors the placement's status. The candidate's `placementRetention` reputation score is updated based on:

- Whether they're still in role at 30 / 60 / 90 / 180 / 365 days
- Whether they've explicitly indicated satisfaction or dissatisfaction
- Any flags raised during your check-ins
- Whether they've left and you've had to replace them

A high retention rate (85%+) earns you the `retention_star` trust badge (Chapter 6) automatically. A low retention rate hurts your DNA Card's Retention axis and your reputation score.

### What to do if a placement is at risk

If a candidate signals they're unhappy at the 30-day check-in, act fast:

1. **Have a real conversation** — what's wrong, what would fix it
2. **Talk to the client** — many "I want to leave" situations are fixable with a conversation between candidate and manager
3. **If unfixable, manage the exit** — start sourcing the replacement immediately so you have options before the guarantee window closes
4. **Update the placement status** to `at_risk` so your team and your dashboard reflect reality

A failed placement during guarantee is bad. A failed placement that surprises you because you weren't checking in is worse — it kills trust with the client.

## How placements feed your KPI Dashboard

`/dashboard/recruiter/kpi-dashboard` aggregates every placement into rolling metrics:

- **Placements this month / quarter / year**
- **Revenue generated** (with the breakdown by client, sector, recruiter)
- **Average time-to-fill** (job created → offer accepted)
- **Average time-to-start** (offer accepted → first day)
- **Fill rate** (placements / jobs opened)
- **Submission-to-interview ratio** (a quality signal)
- **Submission-to-offer ratio** (the conversion that matters)
- **Submission-to-placement ratio** (the ultimate ratio)
- **Average fee per placement**
- **Retention rate** (placements still active at 90 / 180 / 365 days)
- **Pipeline value** (forecasted revenue from open roles)

These are the numbers your client QBR (Chapter 10) is built on, the numbers your trust badges depend on, and the numbers your business decisions live or die by. Get the placement records right and the dashboard tells the truth. Get them sloppy and the dashboard becomes a fiction.

## Submissions vs placements

Don't confuse `/dashboard/recruiter/submissions` with `/dashboard/recruiter/placements`:

- A **submission** is sending a candidate's profile to a client for consideration. It happens before the interview stage.
- A **placement** is the result of a candidate being hired through your submission.

You'll have many submissions per placement — typically 10–20 submissions for every placement, depending on your conversion rates. Your submission-to-placement ratio is one of your most diagnostic metrics. Healthy SA recruiters sit around 1 placement per 8–15 submissions; below that means you're submitting too liberally.

## Pro tips

- **Update the start date when notice period changes.** Candidates renegotiate notice periods all the time. If the start moves, update the placement record so your time-to-fill metrics stay accurate.
- **Run the 90-day check-in religiously.** It's the single most leveraged 30 minutes you spend on a placement. Catch problems before they become guarantee failures.
- **Don't skip onboarding tasks because "the client handles that."** Your reputation is on the line until the candidate is firmly settled. The 90-day window is shared responsibility.
- **Mark replacements distinctly.** If a placement fails and you replace, create a new placement record linked to the original — don't just edit the original. The audit trail and your retention metrics depend on history being intact.
- **Use the candidate as a referral source post-placement.** A successfully-placed candidate is your best source of candidates for similar roles. Add them to your "placed candidates" pool and re-engage them every 6 months.
- **Review your KPI Dashboard weekly, not monthly.** Monthly is too late to course-correct. Weekly catches drift before it becomes a quarter you can't fix.

## Checklist

- [ ] You've verified the placement record after acceptance
- [ ] The actual start date (not the offer date) is set on the placement
- [ ] You've created a post-hire onboarding checklist
- [ ] You've verified the revenue line matches the engagement terms
- [ ] You have a 30 / 90 / 180 / 365-day check-in cadence planned
- [ ] You know your submission-to-placement ratio and what's healthy for your sector
- [ ] You review your KPI Dashboard at least weekly

## Next chapter

[[16-how-tos/recruiter/22-unified-inbox|Chapter 22 — Unified Inbox and message management]]

## References

- [[02-concepts/application-lifecycle]] — Where placement sits in the lifecycle
- [[16-how-tos/recruiter/09-engagement-terms|Chapter 9 — Engagement terms (fee structure feeds revenue)]]
- [[16-how-tos/recruiter/06-ai-profile-assets|Chapter 6 — AI profile assets (placements feed badges)]]
- [[16-how-tos/recruiter/20-making-an-offer|Chapter 20 — Making an offer]]
- [[16-how-tos/recruiter/22-unified-inbox|Chapter 22 — Unified Inbox]]
