---
title: "Chapter 5 — Contract workers"
type: concept
created: 2026-04-20
updated: 2026-04-20
tags: [how-to, corporate, contract, contingent, workforce, compliance]
status: active
user-types: [business]
---

# Chapter 5 — Contract workers

SA corporates run anywhere from 20% to 40% of their workforce on contract, fixed-term, or temporary contracts — and most are managing them in a separate system from permanent hiring. Sebenza Hub treats contract hiring as a first-class workflow alongside permanent hiring, with the distinct compliance, payment, and end-date tracking that contract workers actually need.

This chapter covers a single feature in depth.

### Contract Workers — _Tier: Premium_

**What this feature is.** Contract Workers is a parallel hiring track inside the same platform — same candidate database, same pipelines, same RBAC, but with a distinct workflow tuned for contract hiring: contract type (fixed-term / consultant / temp), contract end-date tracking, payment terms, supplier of record (you, an EOR, a labour broker), and the compliance flags SA labour law actually cares about.

**Why it matters.** Most ATS products were built around permanent hiring and either ignore contract workers entirely or bolt them on as a half-feature. The result: SA corporates run permanent hiring in their ATS and contract hiring in spreadsheets, with no unified view of total workforce, no consistent candidate database, and no audit trail when CCMA disputes land. Unifying contract hiring into the same platform is the competitive advantage against pure ATS vendors — and it's how you actually answer the board's "what's our total contingent workforce exposure?" question without three days of spreadsheet wrangling.

**How to use it.**

1. Go to **Requisitions → Create new** and set **Employment type** to one of: Fixed-Term Contract, Independent Contractor, Temporary (labour broker), or Consultant.

![[c-ch05-contract-worker-form.png]]

2. Fill in contract-specific fields:
   - **Contract length** (e.g., 6 months, 12 months) and **end date**.
   - **Renewal eligibility** — is this contract renewable, or is it locked to its end date?
   - **Supplier of record** — is the worker paid directly by you, by an Employer of Record (EOR), or via a labour broker? This drives compliance and payment workflow.
   - **Hourly / daily / monthly rate** instead of annual salary.
   - **Project / cost centre** the contract is billed against (often distinct from the permanent headcount budget — see [[01 How-To Documents/corporate/09-workforce-planning|Chapter 9]]).
3. The pipeline runs the same way as permanent hiring (see [[01 How-To Documents/corporate/04-your-first-requisition|Chapter 4]]) but with a contract-specific offer letter template covering: contract end date, notice period for early termination, IP assignment, confidentiality, and supplier-of-record clauses where relevant.
4. When the candidate is hired, they appear in the **Contract Workers** dashboard separately from permanent staff. End-date tracking starts immediately — you'll receive alerts at 60, 30, and 7 days before contract end so you can decide on renewal, conversion to permanent, or controlled offboarding.
5. For renewal, run the contract through your standard renewal workflow (typically a single approval). For conversion to permanent, the system carries forward the candidate record, the performance history (if you're using [[01 How-To Documents/corporate/06-internal-mobility|Performance Management]]), and the work history into a new permanent requisition.
6. Use the **Contract Workers** dashboard to see your total active contract headcount by department, supplier of record, end-date proximity, and cost. This is the view your CFO and your Risk committee will both ask for.

![[c-ch05-contract-end-date-dashboard.png]]

**Compliance reality.** SA labour law treats fixed-term and temporary employment differently from permanent (Section 198 of the Labour Relations Act, the labour broker regulations, and the dependent-contractor tests). Sebenza Hub captures the data and surfaces the alerts; it does not give legal advice. The platform helps you not lose track; it does not replace your labour law counsel. For the underlying compliance model see [[02-concepts/compliance]].

![[c-ch05-section-198-compliance-alert.png]]

**The conversion question.** Contract-to-permanent conversion is one of the highest-value moves in workforce planning — you've already de-risked the candidate by working with them. The Contract Workers feature makes conversion mechanical (the candidate, performance, and work history carry forward); the decision still requires the budget conversation, which is covered in [[01 How-To Documents/corporate/09-workforce-planning|Chapter 9]].

## Checklist

- [ ] You're on Premium (Contract Workers requires it)
- [ ] You've created at least one contract requisition with the right employment type, end date, and supplier of record
- [ ] The Contract Workers dashboard shows your active contract headcount and end-date alerts
- [ ] You've decided your renewal-vs-conversion-vs-offboard policy and documented it
- [ ] Your labour law counsel has reviewed your contract templates

## Features covered in this chapter

| # | Feature | Tier |
|---|---------|------|
| 1 | Contract Workers | Premium |

## Next chapter

[[01 How-To Documents/corporate/06-internal-mobility|Chapter 6 — Internal mobility]]

## References

- [[02-concepts/compliance]] — POPIA, B-BBEE, EE, and labour law context
- [[01 How-To Documents/corporate/04-your-first-requisition|Chapter 4 — Your first requisition]]
- [[01 How-To Documents/corporate/06-internal-mobility|Chapter 6 — Internal mobility]]
- [[01 How-To Documents/corporate/09-workforce-planning|Chapter 9 — Workforce planning]]
