---
title: "Chapter 9 — Making offers"
type: concept
created: 2026-04-26
updated: 2026-04-28
tags: [how-to, corporate, offers, offer-letters, approvals, predictive-hiring, salary-calculator, paye, ai]
status: active
user-types: [business]
---

# Chapter 9 — Making offers

The offer is the moment everything before it gets converted (or not). The **Make Offer** sidebar group has six pages and they cover the offer end-to-end: the live list of in-flight offers, the letter your candidate signs, the templates the letters are built from, the approval routing that gates the letter going out, the predictive layer that gives you a prior on whether the offer will land, and the SARS-aligned salary calculator that turns the package number into the candidate's take-home and the employer's true cost.

The pages you'll use, in the order you'll reach for them:

- **Offers** ([https://www.sebenzahub.co.za/dashboard/business/offers](https://www.sebenzahub.co.za/dashboard/business/offers)) — the active offer list and per-offer detail.
- **Offer Templates** ([https://www.sebenzahub.co.za/dashboard/business/offer-templates](https://www.sebenzahub.co.za/dashboard/business/offer-templates)) — the per-role-family template the letters are generated from.
- **Offer Letters** ([https://www.sebenzahub.co.za/dashboard/business/offer-letters](https://www.sebenzahub.co.za/dashboard/business/offer-letters)) — the document the candidate signs, generated from the template.
- **Predictive Hiring** ([https://www.sebenzahub.co.za/dashboard/business/predictive-hiring](https://www.sebenzahub.co.za/dashboard/business/predictive-hiring)) — the AI prior on offer-acceptance and role-fit, consulted before you route for approval.
- **Offer Approvals** ([https://www.sebenzahub.co.za/dashboard/business/offer-approvals](https://www.sebenzahub.co.za/dashboard/business/offer-approvals)) — the routing that gets the right approvers on the letter before it sends.
- **Salary Calculator (ZA)** ([https://www.sebenzahub.co.za/dashboard/business/salary-calculator](https://www.sebenzahub.co.za/dashboard/business/salary-calculator)) — the SARS-aligned PAYE / UIF / SDL / two-pot model that converts a basic into the candidate's take-home and the employer's full cost.

## Run the offer

### Offers — _Tier: Standard_

**Where it lives.** [https://www.sebenzahub.co.za/dashboard/business/offers](https://www.sebenzahub.co.za/dashboard/business/offers), in the **Make Offer** sidebar group.

**What it does.** Offers is the live list of every in-flight offer across the organisation. Each row shows the candidate, the role, the offer amount, the approval state, the letter status, and the time since the last action. Click in for the per-offer detail: full package, approval thread, communications history, signed documents.

**Why it matters.** Offers lost to neglect are the most expensive failures in hiring — every day an offer sits without a response is a day a competing offer can land. The Offers list makes the in-flight state visible so nothing falls off the radar.

**How to use it.**

1. From the candidate record, advance the candidate to **Offered**. The offer object is created with the package details from the requisition.

![[c-ch09-offers-list-overview.png]]

2. Track all in-flight offers from the Offers list. Sort by time-since-action to surface offers that are slipping.
3. Use the per-offer detail page to manage the negotiation thread, surface approver decisions, and confirm acceptance.

![[c-ch09-offer-detail-page.png]]

## Maintain the templates

### Offer Templates — _Tier: Standard_

**Where it lives.** [https://www.sebenzahub.co.za/dashboard/business/offer-templates](https://www.sebenzahub.co.za/dashboard/business/offer-templates), in the **Make Offer** sidebar group.

**What it does.** Offer Templates is the maintained library of letter templates per role family or contract type — permanent, fixed-term, independent contractor, executive. Each template is the legally-approved language with placeholders for role / package / start date that the letter generator fills in.

**Why it matters.** Templates are how your legal counsel's review compounds across hundreds of offers rather than getting redone every time. Without templates, every offer is a one-off legal review (which doesn't happen, so the legal exposure compounds instead). You build the template once, then every letter generates from it.

**How to use it.**

1. Get your legal counsel to draft the canonical templates for your contract types — permanent, fixed-term, independent contractor, executive.
2. Load each template with the placeholders the letter generator expects (role, package components, start date, end date for contract, notice period, IP and confidentiality clauses).

![[c-ch09-offer-template-editor.png]]

3. Review the template library annually with legal counsel. SA labour law shifts; the templates need to reflect it.

## Generate the letter

### Offer Letters — _Tier: Standard_

**Where it lives.** [https://www.sebenzahub.co.za/dashboard/business/offer-letters](https://www.sebenzahub.co.za/dashboard/business/offer-letters), in the **Make Offer** sidebar group.

**What it does.** Offer Letters generates the candidate-facing offer document from the per-role-family template you maintained above, populated with the specific package, role, and start date. The candidate signs in-platform; the signed PDF lands on the candidate record and the audit trail captures every step.

**Why it matters.** Hand-rolled offer letters are a clause-omission disaster waiting to happen, and signed documents lost in email become the document nobody can find when HR needs it nine months later. In-platform generation keeps the language consistent with what your legal counsel approved and keeps the signed copy attached to the record permanently.

**How to use it.**

1. From the offer detail, click **Generate letter**. The system populates the appropriate template with the role, package, start date, and any contract-specific clauses.
2. Review the generated letter. Hand-edit specific clauses where needed but keep the core legal language untouched — that's why the template exists.
3. Send to the candidate for signature. They sign in-platform; you don't need DocuSign as a separate system.

![[c-ch09-offer-letter-generator.png]]

4. The signed document lands on the candidate record and is referenced from the Offers list.

![[c-ch09-offer-letter-signed.png]]

## Use the AI prior on acceptance

### Predictive Hiring — _Tier: Premium_

**Where it lives.** [https://www.sebenzahub.co.za/dashboard/business/predictive-hiring](https://www.sebenzahub.co.za/dashboard/business/predictive-hiring), in the **Make Offer** sidebar group.

**What it does.** Scores candidates on role-fit and likely-to-accept signals using the platform's historical data, and flags pipeline patterns at the requisition level (e.g., "candidates from this source convert at half the rate"). Different from **Predictive Analytics** (covered in [[01 How-To Documents/corporate/14-analytics-and-reporting|Chapter 14]]): Predictive Hiring is about the next decision on this candidate; Predictive Analytics is about the trajectory of the requisition.

**When to use it.** Before you route the offer for approval. A low-likelihood-to-accept score is the moment to either overpay slightly, sharpen the package, or pull the offer entirely — *not* the moment to push it through Finance and hope. Treat the score as a prior; weight it against your own read of the candidate.

While the AI is working you'll see a multi-phase **AI Progress Messaging** indicator — drafting, validating, scoring, finalising — so you know the model is progressing rather than wondering if the page has hung.

**A note on judgement.** The AI here is good at the population-level pattern (this source converts worse, this kind of candidate is harder to land). It is not the final word on a specific offer. Make the call yourself — the model's score is a prior, not a verdict.

![[c-ch09-predictive-hiring-acceptance-score.png]]

## Route the approvals

### Offer Approvals — _Tier: Standard_

**Where it lives.** [https://www.sebenzahub.co.za/dashboard/business/offer-approvals](https://www.sebenzahub.co.za/dashboard/business/offer-approvals), in the **Make Offer** sidebar group.

**What it does.** Offer Approvals is the routing layer that gates an offer letter from going out until the right approvers (hiring manager, finance, HR, the next-level manager for above-band offers) have signed off. Approvers see the offer, the package, and the rationale; they approve, reject, or push back in-platform.

**Why it matters.** Out-of-band offers — above the salary band, above headcount, with non-standard clauses — are the source of compensation drift and budget surprises. Routing the approval through the platform makes "did Finance approve this?" a one-click answer rather than a chase.

**How to use it.**

1. Configure the approval rules in the offer policy: standard offers route to hiring manager only; offers above-band or above-headcount escalate to a defined approver chain.
2. Every offer auto-routes when generated. Approvers see the offer in the Approvals page and can approve or reject from there.

![[c-ch09-offer-approvals-routing.png]]

3. Letters cannot be sent until all required approvers have signed off — the platform enforces the routing rather than relying on the recruiter to remember.

## Model the package before you generate the letter

### Salary Calculator (ZA) — _Tier: Standard_

**Where it lives.** [https://www.sebenzahub.co.za/dashboard/business/salary-calculator](https://www.sebenzahub.co.za/dashboard/business/salary-calculator), the last item in the **Make Offer** sidebar group.

**What it does.** A SARS-aligned salary calculator for the **2026/2027 tax year** (1 March 2026 – 28 February 2027) that runs in three modes:

- **Gross → Net** — enter the monthly basic and see PAYE, UIF, effective rate, marginal rate, annual rebate, medical scheme tax credit, and the candidate's monthly take-home.
- **Cost-to-Company** — adds employer UIF, employer SDL, employer medical and pension contributions, bonus accrual, and the indicative cost of fringe benefits to surface the full payroll burden and a single cost multiplier.
- **Net → Gross** — enter a target take-home; the system solves backwards for the basic that delivers it under the candidate's tax profile.

It models age-based PAYE rebates, medical aid scheme tax credits (members + dependants), retirement contributions across **RA / provident / pension** with the combined 27.5% / R350,000 deductible cap and the **two-pot September-2024 split** (2/3 retirement, 1/3 savings), travel allowance with the 80/20 default vs. logbook 20/80 split, **company car** and **accommodation** fringe benefits, and the **13th cheque** under the annualised method.

**Why it matters.** Two failure modes drive offer disputes: the candidate sees the gross and assumes the take-home; the budget owner sees the basic and forgets that UIF, SDL, employer medical, employer pension, and bonus accrual sit on top. The calculator closes both gaps — _before_ the letter is generated and routed for approval — so the package isn't renegotiated when the first payslip arrives or when Finance audits the actual payroll burden three months later.

**How to use it.**

1. Use **Gross → Net** to validate what the candidate will actually bank. Enter the monthly basic, the candidate's age (drives the secondary / tertiary rebate at 65 and 75), medical aid members and dependants (drives the medical scheme credit), and any retirement contributions, travel allowance, fringe benefits, or 13th cheque that form part of the package.

![[c-ch09-salary-calculator-gross-to-net.png]]

2. Switch to **Cost-to-Company** before the offer goes for Finance approval (Offer Approvals, above). The CTC view exposes employer UIF (1%, capped at the UIF ceiling), employer SDL (1% of payroll if SDL-liable), employer medical and pension contributions, bonus accrual, and the indicative employer cost of fringe benefits. The cost multiplier (e.g., **1.18×**) is the number Finance plans against — not the basic.

![[c-ch09-salary-calculator-cost-to-company.png]]

3. Use **Net → Gross** when a candidate is anchored on a take-home target ("I can't move for less than R30,000 net"). The reverse calculation iterates to find the basic that delivers the chosen net under the candidate's tax profile. Feed the resulting basic into Offer Templates as the package number rather than guessing and reworking the package after the candidate runs the maths themselves.

![[c-ch09-salary-calculator-net-to-gross.png]]

4. For candidates with retirement contributions, look at the **two-pot split** panel. From September 2024, every new contribution splits 2/3 to the retirement component (locked until retirement) and 1/3 to the savings component (one withdrawal per tax year). Surface this on the offer summary — it changes how candidates compare offers from employers who haven't aligned their retirement defaults.

5. Watch the **deductible cap** warning. Retirement contributions above 27.5% of remuneration (or R350,000/year, whichever is lower) are not tax-deductible — the calculator flags the excess in amber. Lift it to the candidate before they make over-contributions they can't write off.

**Notes and caveats.**

- The fringe-benefit numbers are the **SARS taxable values** — 3.5% of determined value for company cars (3.25% with a maintenance plan) and the Section 9 formula for accommodation. The employer's true acquisition cost (lease, depreciation, rent) can differ, which is why the CTC view labels these as _indicative_.
- The travel-allowance taxable portion defaults to **0.8** (no logbook). Switch to **0.2** only if the candidate maintains a SARS-compliant logbook proving more than 80% business use — without the logbook, SARS holds the 80% taxable assumption and the candidate ends up with a tax bill on assessment.
- The **SDL toggle** in CTC mode is on by default. Turn it off only for organisations with a total annual payroll under **R500,000** (the SDL exemption threshold).
- All calculations use SARS published rates for the 2026/2027 tax year. Re-run any time SARS releases an in-year update — the rates table refreshes server-side, so you don't need to redo the maths by hand.

## Hand off to onboarding and the new hire

When the candidate accepts and the offer letter is signed, advance them to **Hired** in the pipeline. From here:

- Onboarding flows out of the Hired event (start date, manager, IT triggers). Most teams configure this in the Workforce & HR surface — see [[01 How-To Documents/corporate/13-workforce-and-hr|Chapter 13]] for HRIS sync and Performance Management cycle setup.
- The hire becomes a reconciled record in your HRIS via the integration — also covered in [[01 How-To Documents/corporate/13-workforce-and-hr|Chapter 13]].

## Checklist

- [ ] Offer Templates exist per contract type, reviewed annually with legal counsel
- [ ] Offer Approvals rules route every above-band or above-headcount offer through Finance / next-level
- [ ] Offer Letters are generated in-platform, signed in-platform, and land on the candidate record
- [ ] Predictive Hiring is used as a prior on offer-acceptance, not as the decision
- [ ] Salary Calculator has been run in CTC mode and the cost multiplier shared with Finance _before_ the approval routing
- [ ] Net → Gross has been used to anchor on the candidate's take-home target whenever they're anchored on a net number
- [ ] Hired candidates flow through to HRIS sync and onboarding without manual re-keying

## Features covered in this chapter

| # | Feature | Tier | Route |
|---|---------|------|-------|
| 1 | Offers | Standard | [https://www.sebenzahub.co.za/dashboard/business/offers](https://www.sebenzahub.co.za/dashboard/business/offers) |
| 2 | Offer Templates | Standard | [https://www.sebenzahub.co.za/dashboard/business/offer-templates](https://www.sebenzahub.co.za/dashboard/business/offer-templates) |
| 3 | Offer Letters | Standard | [https://www.sebenzahub.co.za/dashboard/business/offer-letters](https://www.sebenzahub.co.za/dashboard/business/offer-letters) |
| 4 | Predictive Hiring | Premium | [https://www.sebenzahub.co.za/dashboard/business/predictive-hiring](https://www.sebenzahub.co.za/dashboard/business/predictive-hiring) |
| 5 | Offer Approvals | Standard | [https://www.sebenzahub.co.za/dashboard/business/offer-approvals](https://www.sebenzahub.co.za/dashboard/business/offer-approvals) |
| 6 | Salary Calculator (ZA) | Standard | [https://www.sebenzahub.co.za/dashboard/business/salary-calculator](https://www.sebenzahub.co.za/dashboard/business/salary-calculator) |

## Next chapter

[[01 How-To Documents/corporate/10-vendor-management-and-sourcing|Chapter 10 — Vendor management and sourcing]]

## References

- [[01 How-To Documents/corporate/08-interviewing|Chapter 8 — Interviewing]]
- [[01 How-To Documents/corporate/13-workforce-and-hr|Chapter 13 — Workforce and HR]]
- [[01 How-To Documents/corporate/14-analytics-and-reporting|Chapter 14 — Analytics and reporting]]
- [[03-workflows/business-journey]] — End-to-end corporate hiring journey
