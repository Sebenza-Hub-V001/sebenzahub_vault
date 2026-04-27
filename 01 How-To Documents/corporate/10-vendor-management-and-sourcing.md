---
title: "Chapter 10 — Vendor management and sourcing"
type: concept
created: 2026-04-20
updated: 2026-04-26
tags: [how-to, corporate, vendor-management, agencies, sourcing, talent-crm, ai-search, compliance]
status: active
user-types: [business]
---

# Chapter 10 — Vendor management and sourcing

You don't only hire from people who apply. The **Vendor & Sourcing** sidebar group covers the three places candidates come from outside the inbound flow: the recruitment agencies you contract, the long-running Talent CRM you're building from past applicants and outbound research, and the AI Search layer that lets you find specific candidates in either pool with natural language.

The pages you'll use:

- **Vendor Management** ([https://www.sebenzahub.co.za/dashboard/business/vendors](https://www.sebenzahub.co.za/dashboard/business/vendors)) — the agency registry, POs, performance, and compliance.
- **Talent CRM** ([https://www.sebenzahub.co.za/dashboard/business/talent-crm](https://www.sebenzahub.co.za/dashboard/business/talent-crm)) — the durable database of candidates worth engaging with over time.
- **AI Search** ([https://www.sebenzahub.co.za/dashboard/business/ai-search](https://www.sebenzahub.co.za/dashboard/business/ai-search)) — natural-language candidate search across pipelines, the CRM, and the platform's broader base.

## Manage your external agencies

### Vendor Management — _Tier: Premium_

**Where it lives.** [https://www.sebenzahub.co.za/dashboard/business/vendors](https://www.sebenzahub.co.za/dashboard/business/vendors), in the **Vendor & Sourcing** sidebar group.

**What this feature is.** Vendor Management is the central registry for every external recruitment agency you engage with. Each vendor record holds the engagement terms (fee structure, exclusivity, guarantee period), the active POs, the performance metrics (submissions, interview rate, placement rate, time-to-fill), the compliance status (POPIA agreement signed, B-BBEE certificate on file, MSA in date), and the payment history. When you publish a requisition to one or more agencies, this is where the work happens.

**Why it matters.** The transparency alone typically recovers 5–10% of agency spend — when every agency knows that performance is being measured side-by-side, the duplicate submissions stop, the panic-fee invoices get questioned, and the agencies that genuinely deliver float to the top. Beyond cost, it gives you a single place to enforce POPIA terms across vendors (so candidate data isn't being passed around in unencrypted emails) and a defensible position when the next labour-broker / EE audit asks "show me your vendor governance".

**How to use it.**

1. Go to **Vendors → Add new** for each agency you currently engage with. For each, capture:
   - **Agency name**, primary contact, and corporate email (the one your invoices arrive from).
   - **Master Services Agreement (MSA)** — upload the signed PDF and the expiry date. The system alerts when MSA renewal is due.
   - **Engagement terms** — placement fee structure (% of first-year package, flat fee, retained), guarantee period (typical SA market: 90 days), exclusivity (none / sector-specific / role-specific), and payment terms (typical: 30 days from start date).
   - **Compliance docs** — POPIA candidate-data-handling agreement (mandatory), B-BBEE certificate, tax clearance, professional indemnity insurance certificate.
2. When publishing a requisition to agencies (see [[01 How-To Documents/corporate/05-posting-jobs|Chapter 5]]), choose which vendors get it. For each selected vendor, raise a **PO** (auto-generated from the engagement terms) so commercial expectations are explicit upfront.

![[c-ch07-po-creation-form.png]]

3. Vendor submissions land in the requisition pipeline tagged with the source vendor. Each candidate is attributed back to the agency that sent them, which is what makes performance measurement work.
4. The **Vendor Performance** dashboard shows per-vendor: submission volume, submit-to-interview rate, interview-to-offer rate, offer-acceptance rate, time-to-fill, and per-placement cost. Use this for the quarterly vendor review — the agencies in the bottom quartile either improve or get rotated out.

![[c-ch07-agency-performance-comparison.png]]

5. When a placement happens, the system links the placement record to the source vendor and the PO. Invoice approval becomes a one-click confirmation against a real placement, not a forensic exercise across email threads.
6. The **Compliance Status** dashboard shows every vendor's MSA expiry, POPIA agreement status, B-BBEE certificate status, and tax clearance status with a red-yellow-green light. Vendors with expired compliance are blocked from new POs until they refresh.

![[c-ch07-vendor-compliance-status.png]]

**The duplicate-submission problem.** Two agencies submitting the same candidate is one of the most contentious issues in SA agency hiring. Vendor Management dedupes candidates across vendors at submission time and surfaces the conflict — the system records the first submission as authoritative, and the second agency is notified before they invest more effort. This single feature usually pays for the platform within the first quarter.

**The exclusivity question.** Some enterprises run an agency rotation with no exclusivity; others give exclusivity per role to drive agency engagement. The system supports both. The honest tradeoff: open competition produces more submissions but lower per-agency engagement; per-role exclusivity produces deeper engagement but slower fills. Pick a policy, configure it once, and let the system enforce it consistently.

**POPIA across vendors.** Every agency you engage is processing your candidate data on your behalf, which makes them a "Operator" under POPIA. The MSA needs to include the standard Operator obligations; without that signed agreement on file, you're carrying the regulatory risk yourself. Vendor Management makes this status visible and refuses POs against non-compliant vendors. See [[02-concepts/compliance]] for the underlying POPIA model.

## Build a long-running talent pool

### Talent CRM — _Tier: Premium_

**Where it lives.** [https://www.sebenzahub.co.za/dashboard/business/talent-crm](https://www.sebenzahub.co.za/dashboard/business/talent-crm), in the **Vendor & Sourcing** sidebar group.

**What it does.** Talent CRM is the durable, cross-requisition database of candidates worth staying in touch with over time — silver-medalists from previous interview rounds, candidates from outbound research, referrals that didn't have an open role at the time, alumni you'd consider rehiring. Each contact has a record with the relationship history, tags, last interaction, and a pipeline state independent of any single requisition.

**Why it matters.** The application database (covered in [[01 How-To Documents/corporate/06-receiving-applications|Chapter 6]]) is reactive — it captures who shows up. The Talent CRM is the proactive layer where you maintain relationships with candidates worth the long game. For senior, scarce-skill, and executive roles, the CRM is where most of the actual hires come from over a 12-month horizon.

**How to use it.**

1. Add candidates to the CRM from one of three places: silver-medalists from a closed requisition (one-click "add to talent pool"), outbound contacts from sourcing research, and referrals from existing employees.
2. Tag aggressively — role family, seniority, location, scarce-skill flags, "open to a chat" status. Tags are how you find the right people when a real role opens.
3. Maintain a regular touch cadence with the high-value contacts (typically a check-in every 6–12 months). The CRM tracks last interaction so the cadence doesn't slip.
4. When a relevant requisition opens, query the CRM by tags first — that warm pool will produce a higher offer-acceptance rate than any fresh outbound.
5. POPIA matters here: candidates in the CRM are still subject to POPIA retention and DSAR rules. See [[01 How-To Documents/corporate/12-compliance-and-audit-trail|Chapter 12]] for the controls. A "do not contact" flag in the CRM blocks any further outreach automatically.

## Find specific candidates fast

### AI Search — _Tier: Premium_

**Where it lives.** [https://www.sebenzahub.co.za/dashboard/business/ai-search](https://www.sebenzahub.co.za/dashboard/business/ai-search), in the **Vendor & Sourcing** sidebar group.

**What it does.** Natural-language search across your active pipelines, your Talent CRM, and the platform's broader candidate base. Type "senior backend engineer in Cape Town with payment-systems experience and Afrikaans" and get a ranked list with the rationale for each match. Filters layer on top — location, salary band, last activity, demographic for EE-aware sourcing — and each result links back to the candidate record.

**Why it matters.** Hiring managers don't describe candidates in keywords; they describe them in scenarios. AI Search reads the description; keyword search forces you to translate it. For specialist or senior roles, the difference between AI Search and traditional Boolean is the difference between a five-minute shortlist and a two-day database trawl.

**When to use it.**

- When a hiring manager describes the candidate they want in conversation rather than in a structured list.
- For scarce-skill roles where the relevant pool is hidden behind unusual experience combinations.
- Use both: AI Search for the wide cast, traditional search to verify the model isn't missing literal matches.

While the AI is working you'll see a multi-phase **AI Progress Messaging** indicator — drafting, validating, scoring, finalising — so you know the model is progressing rather than wondering if the page has hung.

## Checklist

- [ ] Every active agency vendor is in the registry with engagement terms, MSA, and compliance docs
- [ ] POs are raised automatically for every vendor-published requisition
- [ ] Vendor submissions are deduped across vendors at submission time
- [ ] Quarterly vendor review uses the Vendor Performance dashboard, not vibes
- [ ] No vendor with expired POPIA / MSA / B-BBEE compliance can receive a new PO
- [ ] Invoice approval is a one-click confirmation against a real placement record
- [ ] Talent CRM has tags and a touch cadence for the senior / scarce-skill contacts you want to keep warm
- [ ] AI Search is being used as the primary search layer for hiring-manager descriptions; keyword search backs it up

## Features covered in this chapter

| # | Feature | Tier | Route |
|---|---------|------|-------|
| 1 | Vendor Management | Premium | [https://www.sebenzahub.co.za/dashboard/business/vendors](https://www.sebenzahub.co.za/dashboard/business/vendors) |
| 2 | Talent CRM | Premium | [https://www.sebenzahub.co.za/dashboard/business/talent-crm](https://www.sebenzahub.co.za/dashboard/business/talent-crm) |
| 3 | AI Search | Premium | [https://www.sebenzahub.co.za/dashboard/business/ai-search](https://www.sebenzahub.co.za/dashboard/business/ai-search) |

## Next chapter

[[01 How-To Documents/corporate/11-communication-and-automation|Chapter 11 — Communication and automation]]

## References

- [[02-concepts/compliance]] — POPIA, B-BBEE, EE context
- [[01 How-To Documents/corporate/05-posting-jobs|Chapter 5 — Posting jobs]]
- [[01 How-To Documents/corporate/06-receiving-applications|Chapter 6 — Receiving applications]]
- [[01 How-To Documents/corporate/11-communication-and-automation|Chapter 11 — Communication and automation]]
- [[01 How-To Documents/corporate/12-compliance-and-audit-trail|Chapter 12 — Compliance and audit trail]]
- [[03-workflows/business-journey]] — End-to-end corporate hiring journey
