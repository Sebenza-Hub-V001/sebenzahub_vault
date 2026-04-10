---
title: "Chapter 9 — Engagement terms: fees, payment, guarantee"
type: concept
created: 2026-04-09
updated: 2026-04-09
tags: [how-to, recruiter, engagements, fees, contracts]
status: draft
user-types: [recruiter]
---

# Chapter 9 — Engagement terms: fees, payment, guarantee

A client record (Chapter 8) is the relationship. An **engagement** is the commercial agreement on top of it. Engagements record what you'll get paid, how, when, and under what conditions. They exist as separate records because the same client can have multiple engagements over time — different fee structures for different mandates, renewals, expansions into new sectors, or restructured terms when a relationship matures.

This chapter explains how to set up engagements and the three categories you must understand: **fee structure**, **payment terms**, and **engagement type** (exclusive / preferred / contingent).

## Where it lives

Engagements are managed inside each client's detail page. Open `/dashboard/recruiter/clients`, click a client, then go to the **Engagements** tab. Click **+ New engagement**.

## The three categories of an engagement

### 1. Fee structure — how you'll get paid

| Type | What it means | When to use it |
|---|---|---|
| **Percentage** | You earn a percentage of the placed candidate's first-year base salary. Industry standard is 15–25%. | The default for permanent placements. Aligns your incentives with the candidate's seniority — senior placements pay more. |
| **Retainer / Fixed** | Client pays a fixed fee, usually in stages: 1/3 on engagement, 1/3 on shortlist, 1/3 on placement. The fee is the same whether the role pays R600k or R6m. | Executive search, exclusive mandates, or roles where the salary is unpredictable. Locks in revenue regardless of outcome speed. |
| **Hybrid** | A reduced retainer plus a smaller percentage on placement. Reduces client risk while keeping your upside. | Strategic clients where you want to share risk — you take a smaller upfront in exchange for better terms or exclusivity. |

In the engagement form:

- **Fee percent** — only set if the structure is percentage or hybrid. Real-number field, e.g. 18.5.
- **Retainer amount** — only set if the structure is retainer or hybrid. Integer, in your currency's smallest unit. The default currency is **ZAR**; you can override per engagement.

### 2. Payment terms — when you'll get paid

The payment terms field is a free text field but the standard SA agency vocabulary is:

- **Upfront** — full fee paid before you start work. Rare. Used for high-volume mandates from a known client.
- **50/50** — half on engagement, half on placement. Common for retainer arrangements.
- **On placement** — full fee invoiced when the candidate accepts the offer. The default for contingent percentage work.
- **Net 30 after start** — invoice on start date, payable within 30 days. The most common terms once you're past the contingent-only phase.
- **Net 60 / Net 90** — extended terms. Larger corporates may insist on these. Be honest with yourself about whether you can carry the cash gap.

Match your payment terms to your cash flow. If you're a small agency that can't carry 60-day terms across 10 placements, you cannot accept Net 60 from large corporates. Saying "yes" to terms you can't sustain bankrupts more agencies than losing clients does.

### 3. Engagement type — exclusivity (this is the big one)

Sebenza Hub records three engagement types via the `exclusivity` field on the job intake scorecard:

| Type | What it means | Fill probability | Typical fee uplift |
|---|---|---|---|
| **Exclusive** | The client commits to using *only* your agency for this role. No other agencies, no internal sourcing, until the role is closed or a defined period expires. | Highest — you have full control of the pipeline | +25–50% over contingent rates |
| **Preferred** | You're the preferred supplier but the client may still use other agencies in parallel. You typically get a head start (24–48 hours) and right of first refusal. | Medium-high | +10–20% over contingent rates |
| **Contingent** | The client works with multiple agencies simultaneously. Whichever agency presents the successful candidate first earns the fee. Speed matters more than depth. | Medium-low — you're competing | Standard rates, often the lowest |

> **Important — Sebenza Hub does NOT enforce exclusivity.** This field is a *recruiter-side categorisation* of the commercial arrangement, used by the platform to compute job fillability scores, estimated fees, and your prioritisation. The platform doesn't stop another agency from submitting a candidate to "your" exclusive client — exclusivity is enforced by your contract with the client, not by software.

The implication: **always have a written engagement contract** that spells out exclusivity, the period it covers, and what happens if the client violates it. The Sebenza Hub field tells the platform what kind of mandate this is for analytics purposes; the contract tells the lawyers what to do if it goes wrong.

## Other engagement fields

| Field | What to put |
|---|---|
| **Agreement type** | A short descriptor of the agreement category. Use it to tag engagements as e.g. "permanent placement", "executive search", "RPO", "contract-to-perm". |
| **Currency** | Defaults to ZAR. Override for cross-border engagements (USD, EUR, GBP). |
| **Start date** | When this engagement becomes effective. |
| **End date** | When this engagement expires. Optional — leave blank for open-ended relationships, set a date for term-limited mandates or exclusive periods. |
| **Status** | Defaults to *active*. Other values: *pending*, *expired*, *terminated*. |

## The guarantee period

Your **guarantee period** isn't on the engagement record itself — it's on your agency profile (Chapter 5). It's the same for every engagement unless overridden in the contract.

A guarantee period is the window in which you commit to replacing a placed candidate free if they leave. Standard values:

- **3 months** — the SA market default
- **6 months** — competitive, used by mid-tier agencies to differentiate
- **12 months** — premium executive search positioning
- **No guarantee** — only acceptable for very specific commercial reasons (high-volume contingent at deeply discounted fees)

The longer your guarantee, the more carefully you must screen — every replacement during the guarantee period costs you the original fee in opportunity cost. A 6-month guarantee with poor screening is worse than a 3-month guarantee with disciplined evaluation.

## Multiple engagements per client

A single client can have many engagements over time. Common patterns:

- A **legacy contingent** engagement from when you first started working with them, plus a newer **exclusive** engagement for a strategic role.
- Different engagements for different **business units** within a large client (e.g. the SA office on one engagement, the African expansion on another with different fee terms).
- An **expired** engagement still on the record for historical reference, plus an **active** renewal with updated terms.

Don't delete old engagements when you sign new ones — set them to *expired* so the history is preserved. Your audit trail (Chapter 28) and your KPI Dashboard (Chapter 25) both depend on engagement history being intact.

## How engagements feed the rest of the platform

Once an engagement exists, the platform uses it for:

- **Estimated fee calculation** on every job linked to this client. The job intake scorecard pulls fee percent and salary range to estimate what each role is worth.
- **Revenue tracking** — when a placement happens against this client, the platform records the revenue line in `clientRevenue` using the engagement's fee terms.
- **KPI Dashboard** — your projected pipeline value is the sum of (open jobs × estimated fee × fill probability) across all engagements.
- **Compliance and audit** — the engagement record is the source of truth for any client disputes about fees or scope. (Chapter 28.)

## Pro tips

- **Set up the engagement BEFORE you start work.** Verbal agreements leave you defenceless when the client questions a fee six months later.
- **Be specific about exclusivity periods.** "Exclusive for 30 days" is enforceable; "exclusive" with no end date is contestable.
- **Match the engagement type to the actual contract.** If your contract says "preferred supplier" but you set the engagement to "exclusive", the platform's analytics will mislead you.
- **Currency hygiene matters.** If you place a candidate in London and the engagement is in GBP, set the currency on the engagement record so the revenue line is correct.
- **Review engagements quarterly.** Status drift is real — engagements you set up in January are often expired by April but still marked active. Quarterly cleanup keeps your dashboard honest.

## Checklist

- [ ] You've created at least one engagement against your top client
- [ ] You've picked a fee structure that matches your actual contract
- [ ] You've specified payment terms you can actually carry on cash flow
- [ ] You've set the engagement type honestly (exclusive / preferred / contingent)
- [ ] If exclusive, you have an end date and a written contract enforcing it
- [ ] You understand that Sebenza Hub doesn't enforce exclusivity — your contract does

## Next chapter

[[16-how-tos/recruiter/10-managing-client-relationships|Chapter 10 — Managing client relationships]]

## References

- [[02-concepts/compliance]] — POPIA implications for client data
- [[16-how-tos/recruiter/08-adding-clients|Chapter 8 — Adding corporate clients]]
- [[16-how-tos/recruiter/10-managing-client-relationships|Chapter 10 — Managing client relationships]]
