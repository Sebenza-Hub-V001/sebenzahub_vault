---
title: "Chapter 7 — Vendor management"
type: concept
created: 2026-04-20
updated: 2026-04-20
tags: [how-to, corporate, vendor-management, agencies, procurement, compliance]
status: active
user-types: [business]
---

# Chapter 7 — Vendor management

Most SA enterprises use somewhere between five and ten recruitment agencies and manage them in email and a shared spreadsheet. The result: nobody knows which agency is currently engaged on which roles, performance comparisons are vibes-based, agency invoices arrive without anyone able to confirm the placement happened, and POPIA compliance across vendors is whoever-shouted-loudest. This chapter sets up a single source of truth.

This chapter covers a single feature in depth.

### Vendor Management — _Tier: Premium_

**What this feature is.** Vendor Management is the central registry for every external recruitment agency you engage with. Each vendor record holds the engagement terms (fee structure, exclusivity, guarantee period), the active POs, the performance metrics (submissions, interview rate, placement rate, time-to-fill), the compliance status (POPIA agreement signed, B-BBEE certificate on file, MSA in date), and the payment history. When you publish a requisition to one or more agencies, this is where the work happens.

**Why it matters.** The transparency alone typically recovers 5–10% of agency spend — when every agency knows that performance is being measured side-by-side, the duplicate submissions stop, the panic-fee invoices get questioned, and the agencies that genuinely deliver float to the top. Beyond cost, it gives you a single place to enforce POPIA terms across vendors (so candidate data isn't being passed around in unencrypted emails) and a defensible position when the next labour-broker / EE audit asks "show me your vendor governance".

**How to use it.**

1. Go to **Vendors → Add new** for each agency you currently engage with. For each, capture:
   - **Agency name**, primary contact, and corporate email (the one your invoices arrive from).
   - **Master Services Agreement (MSA)** — upload the signed PDF and the expiry date. The system alerts when MSA renewal is due.
   - **Engagement terms** — placement fee structure (% of first-year package, flat fee, retained), guarantee period (typical SA market: 90 days), exclusivity (none / sector-specific / role-specific), and payment terms (typical: 30 days from start date).
   - **Compliance docs** — POPIA candidate-data-handling agreement (mandatory), B-BBEE certificate, tax clearance, professional indemnity insurance certificate.
2. When publishing a requisition to agencies (see [[01 How-To Documents/corporate/04-your-first-requisition|Chapter 4]]), choose which vendors get it. For each selected vendor, raise a **PO** (auto-generated from the engagement terms) so commercial expectations are explicit upfront.
3. Vendor submissions land in the requisition pipeline tagged with the source vendor. Each candidate is attributed back to the agency that sent them, which is what makes performance measurement work.
4. The **Vendor Performance** dashboard shows per-vendor: submission volume, submit-to-interview rate, interview-to-offer rate, offer-acceptance rate, time-to-fill, and per-placement cost. Use this for the quarterly vendor review — the agencies in the bottom quartile either improve or get rotated out.
5. When a placement happens, the system links the placement record to the source vendor and the PO. Invoice approval becomes a one-click confirmation against a real placement, not a forensic exercise across email threads.
6. The **Compliance Status** dashboard shows every vendor's MSA expiry, POPIA agreement status, B-BBEE certificate status, and tax clearance status with a red-yellow-green light. Vendors with expired compliance are blocked from new POs until they refresh.

**The duplicate-submission problem.** Two agencies submitting the same candidate is one of the most contentious issues in SA agency hiring. Vendor Management dedupes candidates across vendors at submission time and surfaces the conflict — the system records the first submission as authoritative, and the second agency is notified before they invest more effort. This single feature usually pays for the platform within the first quarter.

**The exclusivity question.** Some enterprises run an agency rotation with no exclusivity; others give exclusivity per role to drive agency engagement. The system supports both. The honest tradeoff: open competition produces more submissions but lower per-agency engagement; per-role exclusivity produces deeper engagement but slower fills. Pick a policy, configure it once, and let the system enforce it consistently.

**POPIA across vendors.** Every agency you engage is processing your candidate data on your behalf, which makes them a "Operator" under POPIA. The MSA needs to include the standard Operator obligations; without that signed agreement on file, you're carrying the regulatory risk yourself. Vendor Management makes this status visible and refuses POs against non-compliant vendors. See [[02-concepts/compliance]] for the underlying POPIA model.

## Checklist

- [ ] Every active agency vendor is in the registry with engagement terms, MSA, and compliance docs
- [ ] POs are raised automatically for every vendor-published requisition
- [ ] Vendor submissions are dedupes across vendors at submission time
- [ ] Quarterly vendor review uses the Vendor Performance dashboard, not vibes
- [ ] No vendor with expired POPIA / MSA / B-BBEE compliance can receive a new PO
- [ ] Invoice approval is a one-click confirmation against a real placement record

## Features covered in this chapter

| # | Feature | Tier |
|---|---------|------|
| 1 | Vendor Management | Premium |

## Next chapter

[[01 How-To Documents/corporate/08-integrations-and-reporting|Chapter 8 — Integrations and reporting]]

## References

- [[02-concepts/compliance]] — POPIA, B-BBEE, EE context
- [[01 How-To Documents/corporate/04-your-first-requisition|Chapter 4 — Your first requisition]]
- [[01 How-To Documents/corporate/08-integrations-and-reporting|Chapter 8 — Integrations and reporting]]
- [[03-workflows/business-journey]] — End-to-end corporate hiring journey
