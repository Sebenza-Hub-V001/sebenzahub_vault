---
title: "Chapter 9 — Workforce planning"
type: concept
created: 2026-04-20
updated: 2026-04-20
tags: [how-to, corporate, workforce-planning, headcount, budget, strategy]
status: active
user-types: [business]
---

# Chapter 9 — Workforce planning

Most SA enterprises run an annual headcount-planning exercise that produces a deck, then spend the rest of the year hiring against a plan that nobody updates as conditions change. The plan and the execution diverge within a quarter, and by Q3 nobody can answer "are we ahead or behind on hiring?" without a manual reconciliation. This chapter sets up workforce planning as a live, integrated discipline — not an annual deck.

This chapter covers a single feature in depth.

### Workforce Planning — _Tier: Premium_

**What this feature is.** Workforce Planning is the strategic layer that sits above the requisition system: headcount forecasting (by department, role family, location, and time period), capacity modelling (current team output vs target), budget alignment (every planned hire mapped to a budget line and approved by Finance), and scenario modelling (what happens to capacity and budget if revenue grows 20%, contracts 10%, or stays flat). It's integrated with the requisition system, so as you hire, the plan updates in real time.

**Why it matters.** Hiring without a plan produces two failure modes that cost real money. The first is overspend — hiring above plan because the requisition system has no concept of the budget. The second is capacity gaps — under-hiring because nobody noticed the plan needed an upward revision. A workforce planning tool integrated with the requisition system means the plan is living: every requisition draws against a planned slot, every hire moves the actual line closer to the planned line, and the variance is visible to Finance and HR weekly, not yearly. This is the difference between HR-as-admin and HR-as-strategy.

**How to use it.**

1. Go to **Workforce Planning → Build plan** at the start of your fiscal year (or whenever you're ready). Import your existing org structure from the HRIS (see [[01 How-To Documents/corporate/08-integrations-and-reporting|Chapter 8]]) so the starting headcount is correct.

![[c-ch09-workforce-planning-dashboard.png]]

2. For each department / role family / location, set the **target headcount by quarter** for the planning horizon (typically 12 months, with the next quarter at fine grain and outer quarters at coarser grain).

![[c-ch09-headcount-forecast-chart.png]]

3. For each planned slot, capture:
   - **Role family** (Engineering, Sales, Operations, etc.)
   - **Seniority band** (junior / mid / senior / lead)
   - **Permanent vs contract** (links to [[01 How-To Documents/corporate/05-contract-workers|Contract Workers]] for the contract budget)
   - **Budget line** the slot is funded from, **all-in annual cost** (salary + benefits + on-costs), and the **Finance approval** status
   - **Start-by date** — when the slot needs to be filled to deliver the business outcome
4. Get Finance approval for each planned slot before opening the requisition. Sebenza Hub blocks requisition creation against unapproved planned slots — this is the control that prevents over-hiring.
5. As requisitions are created and hires happen, the system updates the **plan vs actual** view automatically. Each filled slot moves the actual headcount line; each open requisition counts as committed spend against budget.
6. Run scenario modelling for the planning conversations. The system supports common scenarios — revenue +20% / -10% / flat — and shows the resulting headcount and budget implications. Use these as the spine of the quarterly business review with the CFO.

![[c-ch09-capacity-vs-budget-alignment.png]]

7. Review the plan monthly with the relevant business leaders. Things change: roles get cancelled, urgent hires get added, end dates on contracts shift. The plan needs to absorb those changes in real time, not at year-end.

**The integration that makes this work.** Workforce Planning is only as useful as its integration with the rest of the system. The HRIS connection (Chapter 8) gives you the starting headcount; the requisition system (Chapter 4) draws against planned slots; Contract Workers (Chapter 5) captures the contingent budget; Internal Mobility (Chapter 6) closes loops on internal-vs-external sourcing; Vendor Management (Chapter 7) attributes external-hire spend back to the budget line. Without these wired up, Workforce Planning is just another deck.

**Honest tradeoffs.** Workforce Planning is the most administratively heavy feature in the Corporate product. Setting up the initial plan with budget lines and Finance approvals is a real project — typically two to four weeks for a 500-person organisation, longer for groups with multiple operating companies. The payoff is structural: you don't run that exercise again, you maintain it. Organisations that aren't ready to commit to maintenance discipline get more value from running just the requisition system without the planning layer for a year, then layering in Workforce Planning once the operational habits are established.

**Forecasting accuracy.** First-year forecasts will be wrong. They're always wrong. The point isn't perfect forecasts — it's a defensible plan that updates as reality differs from forecast. After a year of running real plan-vs-actual data, your forecasting accuracy improves measurably. After two years, you have the data to argue back to the business leaders who set unrealistic targets. After three, workforce planning becomes a strategic conversation rather than a budget reconciliation.

## Checklist

- [ ] Starting headcount imported from HRIS, reconciled to the source of truth
- [ ] Target headcount set per department / role family / quarter for the planning horizon
- [ ] Each planned slot has a budget line, all-in cost, and Finance approval before any requisition opens against it
- [ ] Plan-vs-actual view is reviewed monthly with business leaders
- [ ] Scenario models exist for at least three revenue scenarios and inform the quarterly business review
- [ ] HRIS, requisition, contract, internal-mobility, and vendor data all flow into the plan view

## Features covered in this chapter

| # | Feature | Tier |
|---|---------|------|
| 1 | Workforce Planning | Premium |

## References

- [[01 How-To Documents/corporate/04-your-first-requisition|Chapter 4 — Your first requisition]]
- [[01 How-To Documents/corporate/05-contract-workers|Chapter 5 — Contract workers]]
- [[01 How-To Documents/corporate/06-internal-mobility|Chapter 6 — Internal mobility]]
- [[01 How-To Documents/corporate/07-vendor-management|Chapter 7 — Vendor management]]
- [[01 How-To Documents/corporate/08-integrations-and-reporting|Chapter 8 — Integrations and reporting]]
- [[03-workflows/business-journey]] — End-to-end corporate hiring journey
