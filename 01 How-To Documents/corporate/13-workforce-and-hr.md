---
title: "Chapter 13 — Workforce and HR"
type: concept
created: 2026-04-26
updated: 2026-04-26
tags: [how-to, corporate, workforce-planning, hris, internal-mobility, performance, succession, contract, team-dna]
status: active
user-types: [business]
---

# Chapter 13 — Workforce and HR

The **Workforce & HR** sidebar group is everything that sits above and around the requisition — how the requisition got planned, where the demographic and headcount data flows from and to, how internal candidates compete for the same roles, how performance feeds back into hiring quality, and how succession plans get built off real data instead of vibes. Seven pages, sequenced to build on each other.

The pages you'll use:

- **HRIS Integration** ([https://www.sebenzahub.co.za/dashboard/business/hris-integration](https://www.sebenzahub.co.za/dashboard/business/hris-integration)) — bidirectional sync with SuccessFactors / Workday / BambooHR / Sage HR.
- **Workforce Planning** ([https://www.sebenzahub.co.za/dashboard/business/workforce-planning](https://www.sebenzahub.co.za/dashboard/business/workforce-planning)) — headcount forecast, capacity model, budget alignment.
- **Internal Job Board** ([https://www.sebenzahub.co.za/dashboard/business/internal-job-board](https://www.sebenzahub.co.za/dashboard/business/internal-job-board)) — private employees-only board with manager routing.
- **Performance** ([https://www.sebenzahub.co.za/dashboard/business/performance](https://www.sebenzahub.co.za/dashboard/business/performance)) — review cycles and competency framework.
- **Succession Planning** ([https://www.sebenzahub.co.za/dashboard/business/succession-planning](https://www.sebenzahub.co.za/dashboard/business/succession-planning)) — successor mapping for critical roles.
- **Contract Workers** ([https://www.sebenzahub.co.za/dashboard/business/contract-workers](https://www.sebenzahub.co.za/dashboard/business/contract-workers)) — fixed-term, contractor, temp workforce as a first-class track.
- **Team DNA** ([https://www.sebenzahub.co.za/dashboard/business/team-dna](https://www.sebenzahub.co.za/dashboard/business/team-dna)) — the composition profile of teams, used in hiring and succession.

## Wire to your HRIS

### HRIS Integration — _Tier: Premium_

**Where it lives.** [https://www.sebenzahub.co.za/dashboard/business/hris-integration](https://www.sebenzahub.co.za/dashboard/business/hris-integration), in the **Workforce & HR** sidebar group.

**What this feature is.** HRIS Integration provides bidirectional data flow between Sebenza Hub and the major SA HRIS systems — SAP SuccessFactors, Workday, BambooHR, Sage HR. Hires created in Sebenza flow into the HRIS automatically; org structure and headcount data flows back from the HRIS into Sebenza.

**Why it matters.** Without HRIS sync, every hire becomes a manual re-key into the HRIS — which produces typos, missed onboarding triggers, and demographic data that doesn't reconcile across systems. For any enterprise with a real HRIS, integration is table stakes; without it, the ATS becomes a data-integrity disaster within a quarter.

**How to use it.**

1. Open HRIS Integration and choose your HRIS vendor.

![[c-ch08-hris-integration-config.png]]

2. Provide the API credentials your HRIS team supplies. The exact mechanism varies by vendor (OAuth for Workday, API key for BambooHR, certificate-based for SuccessFactors).
3. Configure the field mapping: which Sebenza fields correspond to which HRIS fields. The system ships with default mappings per HRIS that cover most cases; customise where your HRIS has non-standard fields.
4. Choose the sync direction per object: hires (Sebenza → HRIS), org structure and active employee list (HRIS → Sebenza), open requisitions (depends on which system is the source of truth).
5. Test with a non-production hire first. Verify the new hire appears in the HRIS with the right department, manager, start date, and demographic data before going live.
6. Monitor the **Sync Health** dashboard for errors. Most issues are field-mapping mismatches that surface on a specific record type; fix the mapping and replay.

## Plan the workforce

### Workforce Planning — _Tier: Premium_

**Where it lives.** [https://www.sebenzahub.co.za/dashboard/business/workforce-planning](https://www.sebenzahub.co.za/dashboard/business/workforce-planning), in the **Workforce & HR** sidebar group.

**What this feature is.** Workforce Planning is the strategic layer that sits above the requisition system: headcount forecasting (by department, role family, location, and time period), capacity modelling (current team output vs target), budget alignment (every planned hire mapped to a budget line and approved by Finance), and scenario modelling (what happens to capacity and budget if revenue grows 20%, contracts 10%, or stays flat). It's integrated with the requisition system, so as you hire, the plan updates in real time.

**Why it matters.** Hiring without a plan produces two failure modes that cost real money. The first is overspend — hiring above plan because the requisition system has no concept of the budget. The second is capacity gaps — under-hiring because nobody noticed the plan needed an upward revision. A workforce planning tool integrated with the requisition system means the plan is living: every requisition draws against a planned slot, every hire moves the actual line closer to the planned line, and the variance is visible to Finance and HR weekly, not yearly. This is the difference between HR-as-admin and HR-as-strategy.

**How to use it.**

1. Go to **Workforce Planning → Build plan** at the start of your fiscal year (or whenever you're ready). Import your existing org structure from the HRIS (above) so the starting headcount is correct.

![[c-ch09-workforce-planning-dashboard.png]]

2. For each department / role family / location, set the **target headcount by quarter** for the planning horizon (typically 12 months, with the next quarter at fine grain and outer quarters at coarser grain).

![[c-ch09-headcount-forecast-chart.png]]

3. For each planned slot, capture:
   - **Role family** (Engineering, Sales, Operations, etc.)
   - **Seniority band** (junior / mid / senior / lead)
   - **Permanent vs contract** (links to **Contract Workers** below for the contract budget)
   - **Budget line** the slot is funded from, **all-in annual cost** (salary + benefits + on-costs), and the **Finance approval** status
   - **Start-by date** — when the slot needs to be filled to deliver the business outcome
4. Get Finance approval for each planned slot before opening the requisition. Sebenza Hub blocks requisition creation against unapproved planned slots — this is the control that prevents over-hiring.
5. As requisitions are created and hires happen, the system updates the **plan vs actual** view automatically. Each filled slot moves the actual headcount line; each open requisition counts as committed spend against budget.
6. Run scenario modelling for the planning conversations. The system supports common scenarios — revenue +20% / -10% / flat — and shows the resulting headcount and budget implications. Use these as the spine of the quarterly business review with the CFO.

![[c-ch09-capacity-vs-budget-alignment.png]]

7. Review the plan monthly with the relevant business leaders.

**The integration that makes this work.** Workforce Planning is only as useful as its integration with the rest of the system. The HRIS connection (above) gives you the starting headcount; the requisition system (covered in [[01 How-To Documents/corporate/05-posting-jobs|Chapter 5]]) draws against planned slots; Contract Workers (below) captures the contingent budget; Internal Job Board and Succession Planning (below) close loops on internal-vs-external sourcing; Vendor Management ([[01 How-To Documents/corporate/10-vendor-management-and-sourcing|Chapter 10]]) attributes external-hire spend back to the budget line. Without these wired up, Workforce Planning is just another deck.

**Honest tradeoffs.** Workforce Planning is the most administratively heavy feature in the Corporate product. Setting up the initial plan with budget lines and Finance approvals is a real project — typically two to four weeks for a 500-person organisation, longer for groups with multiple operating companies. The payoff is structural: you don't run that exercise again, you maintain it.

**Forecasting accuracy.** First-year forecasts will be wrong. They're always wrong. The point isn't perfect forecasts — it's a defensible plan that updates as reality differs from forecast. After a year of running real plan-vs-actual data, your forecasting accuracy improves measurably.

## Run a real internal mobility programme

### Internal Job Board — _Tier: Premium_

**Where it lives.** [https://www.sebenzahub.co.za/dashboard/business/internal-job-board](https://www.sebenzahub.co.za/dashboard/business/internal-job-board), in the **Workforce & HR** sidebar group.

**What this feature is.** The Internal Job Board is a private, employees-only job board with role-visibility rules (e.g., "Director-level and above hidden from the general listing"), manager routing (so an employee's current manager is notified when they apply), and an internal-only application flow that runs through a parallel pipeline from external candidates.

**Why it matters.** Internal mobility programmes that live in a policy document and not a tool produce three failure modes: employees don't know what's open, managers find out their report applied somewhere else from the offer letter, and HR can't report on internal-vs-external hire mix. A dedicated internal board makes the programme operational rather than aspirational. It's also the cheapest way to lift retention — employees who see growth paths internally don't update their LinkedIn.

**How to use it.**

1. Open the Internal Job Board page and enable it for your organisation.
2. Set the default visibility rule. Most enterprises start with "All non-confidential roles visible to all employees" and then add exceptions: confidential executive searches, succession-only roles, and roles tagged for a specific business unit.
3. Configure the manager-routing policy. Standard setup: when an employee applies, their direct manager is notified within 24 hours. Some companies prefer the manager only finds out at offer stage to avoid retaliation risk — pick the policy that matches your culture.
4. When you create a requisition (Chapter 5), choose **Internal first**, **Internal + External**, or **External only**. Most roles should be Internal + External; a smaller number (executive search, niche specialist) will be External only.
5. Internal applicants flow into a parallel pipeline tagged "Internal". They get reviewed under the same scorecard process as external candidates but with the additional context of their internal performance history (Performance, below).

![[c-ch06-internal-job-board-list.png]]

6. Run a quarterly review of internal-vs-external hire ratio. If less than 20% of hires are internal, the programme has a discoverability problem (employees don't know what's posted) or a credibility problem (employees who applied previously felt punished for it). Both are fixable; both require attention.

**The credibility test.** The first internal applicant who feels they were treated worse than an external candidate will tell five colleagues, and the programme dies. Train hiring managers explicitly: internal candidates get a real interview, real feedback, and real follow-through. Without that, the board exists but the programme doesn't.

## Run performance

### Performance — _Tier: Premium_

**Where it lives.** [https://www.sebenzahub.co.za/dashboard/business/performance](https://www.sebenzahub.co.za/dashboard/business/performance), in the **Workforce & HR** sidebar group.

**What this feature is.** Performance is the employee performance tracking and review tool inside Sebenza Hub — review cycles, ratings, manager and peer feedback, and competency scorecards — integrated with hiring history. The interview scorecards used to *hire* someone become traceable to how they actually *perform*, closing the loop on hiring quality.

**Why it matters.** Most ATS products end at the offer letter. The hiring decision then disappears into a separate performance system, and there is no way to ask "the candidates we rated 'strong hire' on the team-fit scorecard — how are they performing two years in?" Without that loop, hiring quality is a guess. With it, you can measurably tune your scorecards, your interview questions, and your sourcing channels based on what actually predicts performance. It's also what makes Succession Planning defensible: the readiness bands are anchored in performance data, not on whoever the boss likes.

**How to use it.**

1. Configure your review cycles — annual, biannual, or quarterly. Most enterprises run annual with a mid-year light touch.
2. Define your competency framework. Reuse the competencies from your interview scorecards (covered in [[01 How-To Documents/corporate/07-screening-and-evaluating|Chapter 7]]) if at all possible — this is what creates the hiring-to-performance loop. Common frameworks: role-specific technical competencies + a shared set of leadership / collaboration competencies.
3. For each review cycle, define the inputs: self-review, manager review, peer feedback (optional), upward feedback (optional). Light is better than heavy — every additional input increases the time tax and reduces the response rate.
4. Run the cycle. Managers complete reviews against the framework; the system aggregates ratings; the result is a per-employee competency profile.

![[c-ch06-performance-management-review.png]]

5. Use the **Hiring-to-Performance Report** (under Analytics — see [[01 How-To Documents/corporate/14-analytics-and-reporting|Chapter 14]]) to compare interview scorecard ratings against actual first-year performance. Patterns emerge: certain interviewers are systematically over-rating; certain scorecard dimensions are predictive while others aren't; certain sourcing channels produce stronger performers. Tune accordingly.
6. Feed performance data into Succession Planning (next section) by linking the employee's performance profile to their succession candidate record. Readiness assessments become defensible.

**This is a long game.** Performance produces useful insights after one full review cycle (a year for most enterprises). On day one, the data is empty. Don't expect to wire this up Monday and have insights Friday — set the framework now, run the cycles, and the insights compound.

## Build a succession pipeline

### Succession Planning — _Tier: Premium_

**Where it lives.** [https://www.sebenzahub.co.za/dashboard/business/succession-planning](https://www.sebenzahub.co.za/dashboard/business/succession-planning), in the **Workforce & HR** sidebar group.

**What this feature is.** Succession Planning is the workforce tool for identifying internal successors for key roles before those roles open up. You map each critical role to one or more potential successors, track their development progress, and run a structured annual review. When the role opens, the successor is already identified, partially developed, and ready to interview.

**Why it matters.** Sudden senior exits are a board-level risk and SA corporates have repeatedly been caught off guard by them. A succession plan that lives in a Word document somewhere is no plan at all — it's an aspiration that decays the moment the org chart changes. A live succession tool turns the annual planning exercise into ongoing practice and gives you a real answer when the board asks "if your CFO leaves tomorrow, what happens?"

**How to use it.**

1. Identify your **critical roles** — the roles where a sudden exit creates material business risk. Typically: every C-level, every direct report to the CEO, and any specialist role with a single point of failure (e.g., the only person who knows the legacy billing system).
2. For each critical role, map one to three potential successors from your existing employee base. For each successor, capture: their readiness band (Ready Now / Ready 1–2 Years / Ready 3+ Years), their development gaps, and the development actions in flight.
3. Link succession candidates to their performance history (above) so the readiness assessment is anchored in real data, not vibes.

![[c-ch06-succession-planning-chart.png]]

4. Review the plan quarterly with the relevant business leaders. Things change: people leave, gaps close, new critical roles emerge, readiness bands shift.
5. When a critical role opens, run the succession plan first. The successor either gets the role, gets a development plan toward it (with an interim leader), or — if you discover at this point that nobody is actually ready — you've learned that your succession plan was wishful thinking and you go external. Either way, you've learned something.

**Honest tradeoffs.** Succession planning produces uncomfortable conversations: people identified as successors expect promotion timelines; people *not* identified as successors find out and react. Have the people-policy conversation about transparency before you turn this on. Some organisations share readiness bands with the successor; some don't; both can work, but the choice has to be deliberate.

## Run contract workers as a first-class track

### Contract Workers — _Tier: Premium_

**Where it lives.** [https://www.sebenzahub.co.za/dashboard/business/contract-workers](https://www.sebenzahub.co.za/dashboard/business/contract-workers), in the **Workforce & HR** sidebar group.

**What this feature is.** Contract Workers is a parallel hiring track inside the same platform — same candidate database, same pipelines, same RBAC, but with a distinct workflow tuned for contract hiring: contract type (fixed-term / consultant / temp), contract end-date tracking, payment terms, supplier of record (you, an EOR, a labour broker), and the compliance flags SA labour law actually cares about.

**Why it matters.** Most ATS products were built around permanent hiring and either ignore contract workers entirely or bolt them on as a half-feature. The result: SA corporates run permanent hiring in their ATS and contract hiring in spreadsheets, with no unified view of total workforce, no consistent candidate database, and no audit trail when CCMA disputes land. Unifying contract hiring into the same platform is the competitive advantage against pure ATS vendors — and it's how you actually answer the board's "what's our total contingent workforce exposure?" question without three days of spreadsheet wrangling.

**How to use it.**

1. When creating a requisition (Chapter 5), set **Employment type** to one of: Fixed-Term Contract, Independent Contractor, Temporary (labour broker), or Consultant.

![[c-ch05-contract-worker-form.png]]

2. Fill in contract-specific fields:
   - **Contract length** (e.g., 6 months, 12 months) and **end date**.
   - **Renewal eligibility** — is this contract renewable, or is it locked to its end date?
   - **Supplier of record** — is the worker paid directly by you, by an Employer of Record (EOR), or via a labour broker? This drives compliance and payment workflow.
   - **Hourly / daily / monthly rate** instead of annual salary.
   - **Project / cost centre** the contract is billed against (often distinct from the permanent headcount budget — see Workforce Planning above).
3. The pipeline runs the same way as permanent hiring (Chapters 5–9) but with a contract-specific offer letter template covering: contract end date, notice period for early termination, IP assignment, confidentiality, and supplier-of-record clauses where relevant.
4. When the candidate is hired, they appear in the **Contract Workers** dashboard separately from permanent staff. End-date tracking starts immediately — you'll receive alerts at 60, 30, and 7 days before contract end so you can decide on renewal, conversion to permanent, or controlled offboarding.
5. For renewal, run the contract through your standard renewal workflow (typically a single approval). For conversion to permanent, the system carries forward the candidate record, the performance history (if you're using Performance, above), and the work history into a new permanent requisition.
6. Use the **Contract Workers** dashboard to see your total active contract headcount by department, supplier of record, end-date proximity, and cost. This is the view your CFO and your Risk committee will both ask for.

![[c-ch05-contract-end-date-dashboard.png]]

**Compliance reality.** SA labour law treats fixed-term and temporary employment differently from permanent (Section 198 of the Labour Relations Act, the labour broker regulations, and the dependent-contractor tests). Sebenza Hub captures the data and surfaces the alerts; it does not give legal advice. The platform helps you not lose track; it does not replace your labour law counsel. For the underlying compliance model see [[02-concepts/compliance]].

![[c-ch05-section-198-compliance-alert.png]]

**The conversion question.** Contract-to-permanent conversion is one of the highest-value moves in workforce planning — you've already de-risked the candidate by working with them. The Contract Workers feature makes conversion mechanical (the candidate, performance, and work history carry forward); the decision still requires the budget conversation in Workforce Planning above.

## Read the team's composition

### Team DNA — _Tier: Premium_

**Where it lives.** [https://www.sebenzahub.co.za/dashboard/business/team-dna](https://www.sebenzahub.co.za/dashboard/business/team-dna), in the **Workforce & HR** sidebar group.

**What it does.** Team DNA is the composition profile of teams across the organisation — the mix of skills, seniority, tenure, and competency strengths that makes up each department, function, or sub-team. It's the lens you use to spot when a team is over-indexed in one capability and underweight in another, or when an open requisition is the chance to deliberately rebalance.

**Why it matters.** Most hiring decisions get made one role at a time, and the cumulative effect on team composition is invisible until something breaks (the team is all generalists and there's nobody to deepen the technical bench; the team is all senior and nobody can do entry-level work). Team DNA makes the composition visible while there's still time to do something about it.

**When to use it.**

- Annually as part of workforce planning — what does each team need to look like in 12 months and what's the gap from now?
- When briefing a senior or critical hire — Team DNA is the input that turns "we need a strong engineer" into "we need a strong engineer who specifically deepens our payments expertise because the rest of the team is platform-leaning".
- Alongside Succession Planning — readiness bands often look different against a Team DNA snapshot than against a generic "are they ready?" check.

## Checklist

- [ ] HRIS is live, sync-healthy, and reconciles to the source of truth
- [ ] Workforce Planning has a starting headcount, target headcount per quarter, budget lines with Finance approval, and a monthly review with business leaders
- [ ] Internal Job Board is enabled with a clear visibility policy and manager-routing rule
- [ ] Performance cycles are configured with a competency framework that overlaps with interview scorecards
- [ ] Critical roles are identified with one to three potential successors each, anchored to performance data, with a quarterly review
- [ ] Contract Workers are tracked with end-date alerts; conversion-vs-renewal-vs-offboard policy is documented
- [ ] Team DNA is reviewed annually and used as input on senior hires

## Features covered in this chapter

| # | Feature | Tier | Route |
|---|---------|------|-------|
| 1 | HRIS Integration | Premium | [https://www.sebenzahub.co.za/dashboard/business/hris-integration](https://www.sebenzahub.co.za/dashboard/business/hris-integration) |
| 2 | Workforce Planning | Premium | [https://www.sebenzahub.co.za/dashboard/business/workforce-planning](https://www.sebenzahub.co.za/dashboard/business/workforce-planning) |
| 3 | Internal Job Board | Premium | [https://www.sebenzahub.co.za/dashboard/business/internal-job-board](https://www.sebenzahub.co.za/dashboard/business/internal-job-board) |
| 4 | Performance | Premium | [https://www.sebenzahub.co.za/dashboard/business/performance](https://www.sebenzahub.co.za/dashboard/business/performance) |
| 5 | Succession Planning | Premium | [https://www.sebenzahub.co.za/dashboard/business/succession-planning](https://www.sebenzahub.co.za/dashboard/business/succession-planning) |
| 6 | Contract Workers | Premium | [https://www.sebenzahub.co.za/dashboard/business/contract-workers](https://www.sebenzahub.co.za/dashboard/business/contract-workers) |
| 7 | Team DNA | Premium | [https://www.sebenzahub.co.za/dashboard/business/team-dna](https://www.sebenzahub.co.za/dashboard/business/team-dna) |

## Next chapter

[[01 How-To Documents/corporate/14-analytics-and-reporting|Chapter 14 — Analytics and reporting]]

## References

- [[02-concepts/compliance]] — POPIA, B-BBEE, EE, and labour law context
- [[01 How-To Documents/corporate/05-posting-jobs|Chapter 5 — Posting jobs]]
- [[01 How-To Documents/corporate/07-screening-and-evaluating|Chapter 7 — Screening and evaluating]]
- [[01 How-To Documents/corporate/10-vendor-management-and-sourcing|Chapter 10 — Vendor management and sourcing]]
- [[01 How-To Documents/corporate/14-analytics-and-reporting|Chapter 14 — Analytics and reporting]]
- [[03-workflows/business-journey]] — End-to-end corporate hiring journey
