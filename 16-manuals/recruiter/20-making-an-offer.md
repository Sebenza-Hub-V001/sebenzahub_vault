---
title: "Chapter 20 — Making an offer"
type: concept
created: 2026-04-09
updated: 2026-04-09
tags: [manual, recruiter, offers, approvals, negotiation]
status: draft
user-types: [recruiter]
---

# Chapter 20 — Making an offer: templates, approvals, predictor, negotiation

Making an offer is the moment everything converges — the candidate, the client, the engagement terms, the compensation package, the legal compliance, the approval chain — into one document that either gets accepted (revenue) or declined (back to the pipeline). Sebenza Hub has 11 distinct pages dedicated to the offer lifecycle. This chapter walks through them in the order you'll actually use them.

## The 11 offer pages, mapped

| Page | When you'll use it |
|---|---|
| `/dashboard/recruiter/offers` | The master list of all offers; daily check-in |
| `/dashboard/recruiter/offer-templates` | Build reusable templates (set up once) |
| `/dashboard/recruiter/offer-letters` | Generate the final letter document |
| `/dashboard/recruiter/offer-benchmarking` | Check market data before proposing terms |
| `/dashboard/recruiter/offer-predictor` | AI prediction of acceptance probability |
| `/dashboard/recruiter/offer-approvals` | Routing offers through your approval chain |
| `/dashboard/recruiter/offer-timeline` | Track the offer lifecycle for one candidate |
| `/dashboard/recruiter/offer-negotiation` | Manage back-and-forth on terms |
| `/dashboard/recruiter/offer-compare` | Side-by-side modelling of package alternatives |
| `/dashboard/recruiter/offer-analytics` | Acceptance rates, time-to-accept, decline reasons |
| `/dashboard/recruiter/offer-compliance` | Auto-validate against legal and policy requirements |

You won't visit all 11 every day. The daily flow uses about four; the rest are setup, analysis, or specialist tools.

## Step 1 — Before you create the offer: benchmark and predict

Two pages save you from making a bad offer:

### Offer Benchmarking

Open `/dashboard/recruiter/offer-benchmarking`, enter the role title, location, seniority, and sector. The platform pulls market compensation data and shows you:

- The 25th, 50th, and 75th percentile total compensation for the role
- Comparable benefits packages
- Bonus and equity norms for the sector
- Recent placements at similar roles (anonymised)

If your client's proposed offer is below the 25th percentile, you have a problem you need to address with the client *before* sending the offer to the candidate. An offer that's significantly below market gets declined — you'll have wasted weeks of work.

### Offer Predictor

Open `/dashboard/recruiter/offer-predictor`, enter the proposed offer details, and the AI returns an **acceptance probability** (0–100%) based on:

- The candidate's stated salary expectations
- The candidate's recent activity (engaged with you vs ghosting)
- Market benchmarks for similar roles
- The competitiveness of the package
- Notice period and start date alignment with the candidate's situation

The predictor isn't infallible — it's a probabilistic estimate. But if it returns 30% acceptance probability, take the warning seriously. Either improve the offer or have a frank conversation with the candidate before sending.

## Step 2 — Create the offer

Open `/dashboard/recruiter/offers` and click **+ New offer**. The form pulls data from the candidate's application, the linked job, and the client engagement automatically — you're filling in gaps, not starting from scratch.

### Required fields

| Field | What to put |
|---|---|
| **Candidate** | Auto-populated from the application |
| **Job title** | The exact title that goes on the letter |
| **Salary amount** | Annual CTC (cost-to-company), in cents internally — display in your currency |
| **Salary type** | annual_ctc / monthly / hourly |
| **Currency** | Defaults to ZAR |
| **Start date** | When the candidate begins |
| **Notice period** | What the candidate owes their current employer (informational, drives the start date) |

### Optional but important fields

- **Bonus** — signing bonus, annual bonus, performance bonus (specify type and amount)
- **Equity** — for tech and startup roles; specify the structure
- **Commission** — for sales and revenue-generating roles
- **Benefits** — medical aid, pension, leave allowance, learning budget, etc.
- **Remote policy** — onsite / hybrid / remote
- **Conditions** — anything contingent (background check clearance, reference check, probation period)
- **Expires at** — offer expiry date (typical: 5–10 working days)

## Step 3 — Use a template

Don't write offer letters from scratch. Use `/dashboard/recruiter/offer-templates` to build templates for common scenarios:

- Permanent perm offer template
- Contract offer template
- Executive offer template
- Conditional offer (probation period or background check pending)

Each template is parameterised — when you generate a letter from a template, the candidate name, salary, dates, and other fields are merged in automatically. The Offer Letters page (`/offer-letters`) is where the merged document is generated and stored.

Templates save you from inconsistencies and from forgetting to include legally important language (probation clauses, restraint of trade, IP assignment, etc.).

## Step 4 — Approval chain

Most offers need approval before they can be sent. The approval chain (set up in Chapter 7) routes offers based on rules:

- Offers above R500,000 base → Manager approval
- Offers above R1,500,000 base → Admin approval
- Offers for a new client → Manager approval
- Offers with non-standard terms → Admin approval

Open `/dashboard/recruiter/offer-approvals` to see all offers awaiting approval. As an approver, you'll see each offer with the full context, the reason it routed to you, and an approve / reject / request-changes action.

The offer status during this phase is `pending_approval`. Once approved, it moves to `draft` (ready to send) or directly to `sent` if you approved and sent in one action.

### The audit trail

Every approval decision is logged in the approval audit trail. Six months later, if a client questions the fee or the terms, you have:

- Who approved the offer
- When
- At what amount
- Whether anyone was delegated to
- Whether escalation was triggered

This is the defence mechanism for fee disputes (Chapter 28).

## Step 5 — Send the offer

Once approved, open the offer and click **Send**. The system:

1. Generates the final letter from the template
2. Stores it on the offer record
3. Sends it to the candidate (typically email + in-platform notification)
4. Sets the status to `sent`
5. Records `sentAt` timestamp
6. Starts the expiry countdown
7. Notifies you when the candidate views the letter (`viewedAt`)

## Step 6 — The offer timeline

`/dashboard/recruiter/offer-timeline` shows you the lifecycle of a single offer at a glance:

- Created (when, by whom)
- Approved (by whom, when, at what amount)
- Sent (when)
- Viewed (when the candidate opened it)
- Negotiation (if it happened)
- Final response (accepted / declined / expired)
- Time elapsed at each stage

Use it to spot problems. If an offer has been sent for 4 days and not viewed, the candidate may not be receiving emails. Resend, call them, or ask if there's a better channel.

## Step 7 — Negotiation (if needed)

`/dashboard/recruiter/offer-negotiation` is the negotiation workspace. When a candidate counters, you log the counter, the system tracks:

- Each round of back-and-forth
- The package details at each round
- Communication transcripts (sentiment-analysed)
- AI negotiation strategy suggestions
- The compensation package per round

The platform's AI surfaces negotiation tactics: "the candidate has emphasised flexibility three times — consider a remote-friendly clause as a non-cash concession" or "their counter is 8% above the original — well within your client's authorised band."

Each round increments `negotiationRounds`. Rounds beyond 3 are usually a sign that one side is unrealistic — escalate to the client to either approve a better package or pull the offer.

### Offer Compare

While negotiating, `/dashboard/recruiter/offer-compare` lets you model different package alternatives side by side:

- Package A: Higher base, lower bonus
- Package B: Lower base, higher bonus, equity
- Package C: Original + signing bonus

Show this to the client to support a counter-offer decision. Show simplified versions to the candidate to give them choice between packages with the same total value.

## Step 8 — Compliance check

`/dashboard/recruiter/offer-compliance` auto-validates every offer against:

- **Legal pay bands** — minimum wage, sectoral determinations
- **Employment Equity targets** — alerts if this offer worsens demographic representation against the client's EE plan
- **B-BBEE scoring impact** — how this hire contributes to the client's B-BBEE scorecard
- **Internal policy** — your agency's own offer rules

A failing compliance check doesn't block the offer, but it surfaces a warning the approver must explicitly acknowledge. **Don't override compliance warnings without documented justification** — that's how agencies end up in front of CCMA hearings.

## Step 9 — Acceptance and beyond

When the candidate accepts, the offer status becomes `accepted`, the application moves to the Placed stage in the Pipeline, and the platform triggers placement creation (Chapter 21). When they decline, the status becomes `declined`, the decline reason is captured, and the candidate moves to a re-engagement pool for future opportunities.

The decline reason goes into your Offer Analytics (`/dashboard/recruiter/offer-analytics`) which shows:

- Acceptance rate by job, by recruiter, by client, by sector
- Time-to-accept (how long candidates take to respond)
- Decline reason categories (compensation, location, role fit, competing offer, family / personal)
- Trend over time

Watch the decline reasons. If "competing offer" is your top decline reason, your time-to-offer is too slow and faster competitors are beating you. If "compensation" dominates, your benchmarking is off and you're consistently under-pricing.

## Pro tips

- **Always benchmark before proposing.** The 5 minutes you spend in Offer Benchmarking saves you from sending a doomed offer.
- **Use the predictor as a sanity check, not a gate.** A 70%+ predictor score is "go ahead". A sub-50% score is a warning — investigate before sending.
- **Standardise on 5–7 day expiries.** Shorter and you panic the candidate; longer and they shop you around. Five working days is the sweet spot for SA market.
- **Don't haggle on small numbers.** A R10,000 difference in base salary on a R900,000 offer is 1.1%. Concede it and move on. Save your negotiation capital for the things that actually matter to the candidate.
- **Keep negotiation transcripts inside the platform.** Every back-and-forth that happens over WhatsApp or personal email is a gap in your audit trail. The unified inbox (Chapter 22) keeps it all together.
- **Send offers Tuesday–Thursday.** Friday offers sit unread over the weekend. Monday offers compete with the candidate's "I should be productive this week" mood. Mid-week is highest acceptance.

## Checklist

- [ ] You've benchmarked the role before proposing terms
- [ ] You've run the offer through the predictor and addressed any acceptance probability under 60%
- [ ] You're using a template, not writing letters from scratch
- [ ] The offer has gone through the approval chain you set up in Chapter 7
- [ ] You've reviewed and addressed any compliance warnings
- [ ] You know how to handle a counter-offer using Negotiation and Offer Compare
- [ ] You'll log the decline reason if the offer gets declined

## Next chapter

[[16-manuals/recruiter/21-recording-a-placement|Chapter 21 — Recording a placement and revenue]]

## References

- [[02-concepts/application-lifecycle]] — Offer status enum
- [[02-concepts/compliance]] — EE and B-BBEE compliance considerations
- [[16-manuals/recruiter/07-team-setup|Chapter 7 — Team setup (approval chains)]]
- [[16-manuals/recruiter/09-engagement-terms|Chapter 9 — Engagement terms]]
- [[16-manuals/recruiter/21-recording-a-placement|Chapter 21 — Recording a placement and revenue]]
