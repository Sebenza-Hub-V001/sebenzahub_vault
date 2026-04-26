---
title: "Chapter 9 — Making offers"
type: concept
created: 2026-04-26
updated: 2026-04-26
tags: [how-to, corporate, offers, offer-letters, approvals, predictive-hiring, ai]
status: active
user-types: [business]
---

# Chapter 9 — Making offers

The offer is the moment everything before it gets converted (or not). The **Make Offer** sidebar group has five pages and they cover the offer end-to-end: the live list of in-flight offers, the letter your candidate signs, the templates the letters are built from, the approval routing that gates the letter going out, and the predictive layer that gives you a prior on whether the offer will land.

The pages you'll use:

- **Offers** (`/dashboard/business/offers`) — the active offer list and per-offer detail.
- **Offer Letters** (`/dashboard/business/offer-letters`) — the document the candidate signs.
- **Offer Templates** (`/dashboard/business/offer-templates`) — the per-role-family template the letters are generated from.
- **Offer Approvals** (`/dashboard/business/offer-approvals`) — the routing that gets the right approvers on the letter before it sends.
- **Predictive Hiring** (`/dashboard/business/predictive-hiring`) — the AI prior on offer-acceptance and role-fit.

## Run the offer

### Offers — _Tier: Standard_

**Where it lives.** `/dashboard/business/offers`, in the **Make Offer** sidebar group.

**What it does.** Offers is the live list of every in-flight offer across the organisation. Each row shows the candidate, the role, the offer amount, the approval state, the letter status, and the time since the last action. Click in for the per-offer detail: full package, approval thread, communications history, signed documents.

**Why it matters.** Offers lost to neglect are the most expensive failures in hiring — every day an offer sits without a response is a day a competing offer can land. The Offers list makes the in-flight state visible so nothing falls off the radar.

**How to use it.**

1. From the candidate record, advance the candidate to **Offered**. The offer object is created with the package details from the requisition.
2. Track all in-flight offers from the Offers list. Sort by time-since-action to surface offers that are slipping.
3. Use the per-offer detail page to manage the negotiation thread, surface approver decisions, and confirm acceptance.

## Generate the letter

### Offer Letters — _Tier: Standard_

**Where it lives.** `/dashboard/business/offer-letters`, in the **Make Offer** sidebar group.

**What it does.** Offer Letters generates the candidate-facing offer document from the per-role-family template, populated with the specific package, role, and start date. The candidate signs in-platform; the signed PDF lands on the candidate record and the audit trail captures every step.

**Why it matters.** Hand-rolled offer letters are a clause-omission disaster waiting to happen, and signed documents lost in email become the document nobody can find when HR needs it nine months later. In-platform generation keeps the language consistent with what your legal counsel approved and keeps the signed copy attached to the record permanently.

**How to use it.**

1. From the offer detail, click **Generate letter**. The system populates the appropriate template with the role, package, start date, and any contract-specific clauses.
2. Review the generated letter. Hand-edit specific clauses where needed but keep the core legal language untouched — that's why the template exists.
3. Send to the candidate for signature. They sign in-platform; you don't need DocuSign as a separate system.
4. The signed document lands on the candidate record and is referenced from the Offers list.

## Maintain the templates

### Offer Templates — _Tier: Standard_

**Where it lives.** `/dashboard/business/offer-templates`, in the **Make Offer** sidebar group.

**What it does.** Offer Templates is the maintained library of letter templates per role family or contract type — permanent, fixed-term, independent contractor, executive. Each template is the legally-approved language with placeholders for role / package / start date that the letter generator fills in.

**Why it matters.** Templates are how your legal counsel's review compounds across hundreds of offers rather than getting redone every time. Without templates, every offer is a one-off legal review (which doesn't happen, so the legal exposure compounds instead).

**How to use it.**

1. Get your legal counsel to draft the canonical templates for your contract types — permanent, fixed-term, independent contractor, executive.
2. Load each template with the placeholders the letter generator expects (role, package components, start date, end date for contract, notice period, IP and confidentiality clauses).
3. Review the template library annually with legal counsel. SA labour law shifts; the templates need to reflect it.

## Route the approvals

### Offer Approvals — _Tier: Standard_

**Where it lives.** `/dashboard/business/offer-approvals`, in the **Make Offer** sidebar group.

**What it does.** Offer Approvals is the routing layer that gates an offer letter from going out until the right approvers (hiring manager, finance, HR, the next-level manager for above-band offers) have signed off. Approvers see the offer, the package, and the rationale; they approve, reject, or push back in-platform.

**Why it matters.** Out-of-band offers — above the salary band, above headcount, with non-standard clauses — are the source of compensation drift and budget surprises. Routing the approval through the platform makes "did Finance approve this?" a one-click answer rather than a chase.

**How to use it.**

1. Configure the approval rules in the offer policy: standard offers route to hiring manager only; offers above-band or above-headcount escalate to a defined approver chain.
2. Every offer auto-routes when generated. Approvers see the offer in the Approvals page and can approve or reject from there.
3. Letters cannot be sent until all required approvers have signed off — the platform enforces the routing rather than relying on the recruiter to remember.

## Use the AI prior on acceptance

### Predictive Hiring — _Tier: Premium_

**Where it lives.** `/dashboard/business/predictive-hiring`, in the **Make Offer** sidebar group.

**What it does.** Scores candidates on role-fit and likely-to-accept signals using the platform's historical data, and flags pipeline patterns at the requisition level (e.g., "candidates from this source convert at half the rate"). Different from **Predictive Analytics** (covered in [[01 How-To Documents/corporate/14-analytics-and-reporting|Chapter 14]]): Predictive Hiring is about the next decision on this candidate; Predictive Analytics is about the trajectory of the requisition.

**When to use it.** As input to the offer conversation, not as the verdict. A candidate the model flags as low-likelihood to accept is one to overpay slightly or move on from quickly, not one to negotiate hard with. Treat the score as a prior; weight it against your own read of the candidate.

While the AI is working you'll see a multi-phase **AI Progress Messaging** indicator — drafting, validating, scoring, finalising — so you know the model is progressing rather than wondering if the page has hung.

**A note on judgement.** The AI here is good at the population-level pattern (this source converts worse, this kind of candidate is harder to land). It is not the final word on a specific offer. Make the call yourself — the model's score is a prior, not a verdict.

## Hand off to onboarding and the new hire

When the candidate accepts and the offer letter is signed, advance them to **Hired** in the pipeline. From here:

- Onboarding flows out of the Hired event (start date, manager, IT triggers). Most teams configure this in the Workforce & HR surface — see [[01 How-To Documents/corporate/13-workforce-and-hr|Chapter 13]] for HRIS sync and Performance Management cycle setup.
- The hire becomes a reconciled record in your HRIS via the integration — also covered in [[01 How-To Documents/corporate/13-workforce-and-hr|Chapter 13]].

## Checklist

- [ ] Offer Templates exist per contract type, reviewed annually with legal counsel
- [ ] Offer Approvals rules route every above-band or above-headcount offer through Finance / next-level
- [ ] Offer Letters are generated in-platform, signed in-platform, and land on the candidate record
- [ ] Predictive Hiring is used as a prior on offer-acceptance, not as the decision
- [ ] Hired candidates flow through to HRIS sync and onboarding without manual re-keying

## Features covered in this chapter

| # | Feature | Tier | Route |
|---|---------|------|-------|
| 1 | Offers | Standard | `/dashboard/business/offers` |
| 2 | Offer Letters | Standard | `/dashboard/business/offer-letters` |
| 3 | Offer Templates | Standard | `/dashboard/business/offer-templates` |
| 4 | Offer Approvals | Standard | `/dashboard/business/offer-approvals` |
| 5 | Predictive Hiring | Premium | `/dashboard/business/predictive-hiring` |

## Next chapter

[[01 How-To Documents/corporate/10-vendor-management-and-sourcing|Chapter 10 — Vendor management and sourcing]]

## References

- [[01 How-To Documents/corporate/08-interviewing|Chapter 8 — Interviewing]]
- [[01 How-To Documents/corporate/13-workforce-and-hr|Chapter 13 — Workforce and HR]]
- [[01 How-To Documents/corporate/14-analytics-and-reporting|Chapter 14 — Analytics and reporting]]
- [[03-workflows/business-journey]] — End-to-end corporate hiring journey
