---
title: "Chapter 10 — Vendor management and sourcing"
type: concept
created: 2026-04-20
updated: 2026-04-28
tags: [how-to, corporate, vendor-management, agencies, sourcing, talent-crm, ai-search, hybrid-search, market-pulse, compliance]
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

**POPIA across vendors.** Every agency you engage is processing your candidate data on your behalf, which makes them an "Operator" under POPIA. The MSA needs to include the standard Operator obligations; without that signed agreement on file, you're carrying the regulatory risk yourself. Vendor Management makes this status visible and refuses POs against non-compliant vendors. See [[02-concepts/compliance]] for the underlying POPIA model.

## Build a long-running talent CRM

### Talent CRM — _Tier: Premium_

**Where it lives.** [https://www.sebenzahub.co.za/dashboard/business/talent-crm](https://www.sebenzahub.co.za/dashboard/business/talent-crm), in the **Vendor & Sourcing** sidebar group.

**What it does.** Talent CRM is the durable, cross-requisition database of candidates worth staying in touch with over time — silver-medalists from previous interview rounds, candidates from outbound research, referrals that didn't have an open role at the time, alumni you'd consider rehiring. Each contact has a record with the relationship history, tags, last interaction, status, and a pipeline state independent of any single requisition.

**Why it matters.** The application database (covered in [[01 How-To Documents/corporate/06-receiving-applications|Chapter 6]]) is reactive — it captures who shows up. The Talent CRM is the proactive layer where you maintain relationships with candidates worth the long game. For senior, scarce-skill, and executive roles, the CRM is where most of the actual hires come from over a 12-month horizon.

A CRM-style record holds:

- **Activity timeline** per candidate — every interaction, message, status change, application
- **Notes** — your private observations, never visible to the candidate
- **Tags** — searchable labels (skills, fit, sentiment)
- **Status** — relationship status: active, passive, placed, paused, lost, do-not-contact
- **Last contact** — when the TA team last reached out
- **Next follow-up** — scheduled next action with a reminder
- **Communication log** — every email, WhatsApp, and platform message sent

**How to use it.**

1. Add candidates to the CRM from one of three places: silver-medalists from a closed requisition (one-click "add to talent CRM"), outbound contacts from sourcing research, and referrals from existing employees.
2. Tag aggressively — role family, seniority, location, scarce-skill flags, "open to a chat" status. Tags are how you find the right people when a real role opens. Auto-Tag (next section) handles most of this for you.
3. Maintain a regular touch cadence with the high-value contacts (typically a check-in every 6–12 months). The CRM tracks last interaction so the cadence doesn't slip.
4. When a relevant requisition opens, query the CRM by tags first — that warm pool will produce a higher offer-acceptance rate than any fresh outbound.
5. POPIA matters here: candidates in the CRM are still subject to POPIA retention and DSAR rules. See [[01 How-To Documents/corporate/12-compliance-and-audit-trail|Chapter 12]] for the controls. A "do not contact" flag in the CRM blocks any further outreach automatically.

![[c-ch10-talent-crm-record-view.png]]

### Auto-Tag Candidate — _Tier: Standard_

**What this feature is.** Auto-Tag Candidate runs on every new candidate ingested (CV upload, application, sourcing import, vendor submission) and applies skill, attribute, and role-fit tags automatically. Manual tagging on top is still possible; auto-tagging removes the chore work.

**Why it matters.** Manual tagging gets skipped by busy recruiters, which degrades search and CRM quality over time. Auto-tagging maintains a clean, searchable database without anyone doing the work — which means the CRM stays accurate even as the database grows past where humans can keep up.

**How to use it.** Runs automatically on every new candidate. Review the auto-applied tags on a candidate's profile if you want to verify or adjust; otherwise it just works. The tags Auto-Tag produces feed directly into your AI Search results — better tags mean better search.

![[c-ch10-auto-tag-candidate.png]]

### Side-by-Side Comparison — _Tier: Standard_

**What this feature is.** Side-by-Side Comparison puts 2–5 candidates next to each other across key attributes — skills, experience, scorecard scores, salary expectations, location risk, source — in a single printable view.

**Why it matters.** Hiring managers need to defend their choice to panels and HR business partners. A printable comparison replaces a 30-minute "why him not her" debate with a 2-minute visual that shows the trade-offs explicitly. Same value internally when you're picking between three strong shortlist candidates and the decision needs to be auditable.

**How to use it.** From the Talent CRM or any candidate list, multi-select 2–5 candidates and click **Compare**. The comparison renders side-by-side; export to PDF for hiring-manager debriefs, panel reviews, or HRBP escalations.

![[c-ch10-side-by-side-comparison.png]]

### A "candidate health" rhythm

Weekly, run two CRM reviews:

1. **High-value contacts health check** (10 minutes) — open the Talent CRM filtered to senior/scarce-skill candidates with no activity in 60+ days. Send a quick "anything change for you?" to anyone who hasn't moved.
2. **Next-follow-up review** (10 minutes) — open the CRM filtered to "follow-ups due this week", action each one (send the message, log the call, or push the date forward with a reason).

Twenty minutes per week. That's it. The corporate TA functions that compound their database into a hiring advantage are the ones that do this religiously instead of treating the CRM as a one-time-use tool.

## How Vendor and CRM work together

A typical workflow on a new senior requisition:

1. **Open the Talent CRM**, filter by role family + senior level. The 12 candidates active in the last 90 days are your immediate outreach list — no agency fee, no cold conversation.
2. **In parallel, raise vendor POs** with the agencies you trust for that role family. They'll source against the brief while you work the warm CRM list.
3. **Use Side-by-Side Comparison** when shortlists from both sources converge — defensible decision, panel-ready output.

This is hiring as a relationship-database business, not a job-board business. It's the difference between TA functions that hit fill rates predictably and TA functions that scramble per-requisition.

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

![[c-ch10-ai-search-natural-language-results.png]]

### AI Hybrid Search — _Tier: Standard_

**What this feature is.** AI Hybrid Search combines AI semantic understanding with keyword matching — it finds candidates whose profiles use different words for the same concept ("Python dev" vs "backend engineer") while still respecting hard filters like location and seniority.

**Why it matters.** Pure keyword search misses semantic matches; pure semantic search returns too-broad results. Hybrid gets the best of both — it's the default search mode any senior recruiter on the platform should be using. The corporate TA case is even more pronounced because internal job titles drift in ways the rest of the market doesn't follow.

**How to use it.** Toggle **Hybrid** at the top of the AI Search page. The query box accepts natural language; the filter sidebar still applies hard constraints (location, salary band, demographics for EE-aware filters).

### AI Job Search Parser — _Tier: Standard_

**What this feature is.** AI Job Search Parser takes a natural-language query — *"senior Python dev in Cape Town open to hybrid"* — and translates it into structured filters automatically (skill: Python, seniority: senior, location: Cape Town, remote: hybrid).

**Why it matters.** Junior recruiters never learn boolean syntax; senior recruiters forget which field is "location" vs "city". NL parsing removes the syntax tax and makes search faster for everyone — and surfaces a structured view of what the AI heard, so you can spot misinterpretations before you act on a wrong shortlist.

**How to use it.** Type your request in plain English on AI Search. The parsed filters appear above the results. Adjust the filters if the AI got something wrong, then re-run.

### Smart Search Suggestions — _Tier: Standard_

**What this feature is.** Smart Search Suggestions surface AI-generated tweaks to improve a search — synonym additions, filter relaxations, alternative keywords — when the current query returns 0 or too few results.

**Why it matters.** Most "0 results" searches are caused by one filter being too tight, but it's not always obvious which one. Suggestions tell you exactly which constraint to drop, converting dead-ends into live results without having to start the search over. For corporate TA teams under deadline pressure on a hard-to-fill role, this is the feature that turns frustration into a workable shortlist.

**How to use it.** Suggestions appear automatically below the results panel when the result count is low. Click any suggestion to apply it and re-run the search.

### Search Health Score — _Tier: Premium_

**What this feature is.** Search Health Score grades each saved search on effectiveness — too narrow, too broad, missing common synonyms, gone stale — and prompts fixes so the same search keeps delivering good candidates as the database evolves.

**Why it matters.** Recruiters set up a saved search once and never revisit it. Without scoring, the same search that returned 30 great candidates in January returns 5 mediocre ones by August and nobody notices. Health scoring catches the decay — especially valuable for the standing searches you keep on senior or recurring requisitions.

**How to use it.** Open **Saved searches** on AI Search. Each saved search shows a health score; click into any one with a low score to see specific fixes (add synonym, broaden seniority, drop an outdated certification filter).

### Search Market Pulse — _Tier: Premium_

**What this feature is.** Search Market Pulse runs a market-pulse analysis on your saved-search criteria — candidate supply, demand pressure, median salary movement, geographic hotspots — over the last 30/90/180 days.

**Why it matters.** TA functions miss fill rates because the market moved, not because their recruiters got worse at their jobs. Pulse surfaces those shifts early so you can pivot — a Cape Town fintech req seeing a 22% supply drop should know in week 2, not in month 4 when the hiring manager is asking why it isn't filled.

**How to use it.** From any saved search, click **Market pulse**. The report shows trend lines and highlights material shifts. Set up a monthly pulse review for your top 3–5 saved searches as part of TA leadership reporting.

![[c-ch10-search-market-pulse.png]]

### Competitive Heat Map — _Tier: Premium_

**What this feature is.** Competitive Heat Map shows the competitive landscape for a given search profile — which other employers are recruiting for similar candidates, in which locations, at what salary bands.

**Why it matters.** You can't compete on offer if you don't know what competitors are offering. Heat mapping is the "market intelligence" that senior TA leaders currently buy separately from specialist vendors — having it inline with your search saves both the cost and the context-switch, and gives you live ammunition when hiring managers push back on salary band proposals.

**How to use it.** From any AI Search result, click **Competitive heat map**. The map renders by location and shows competing employers, salary bands, and demand pressure. Use the insights when you advise a hiring manager on salary or when you're preparing the offer benchmarking conversation in [[01 How-To Documents/corporate/09-making-offers|Chapter 9]].

![[c-ch10-competitive-heat-map.png]]

## Migrating data in and out

The platform has to handle both arrival (you've just signed up with 5,000 candidate records from your old ATS) and departure (a requisition closed, an audit needs an export, a candidate exercised their POPIA DSAR).

### CSV Bulk Import — _Tier: Standard_

**What this feature is.** CSV Bulk Import takes a spreadsheet of candidates with column mapping and deduplication and brings them into your Sebenza Hub database in one go. Supports the standard fields plus custom column mapping for non-standard CSVs.

**Why it matters.** Corporate TA functions switching from another ATS arrive with a spreadsheet of thousands of candidates. Without bulk import, the migration becomes a manual re-keying project that nobody actually finishes — which is why this feature is a migration tool as much as a daily-use tool.

**How to use it.**

1. Open [https://www.sebenzahub.co.za/dashboard/business/candidates](https://www.sebenzahub.co.za/dashboard/business/candidates) → **Import**.
2. Upload the CSV.
3. Map your columns to Sebenza Hub fields (the platform suggests mappings; review and adjust).

![[c-ch10-csv-bulk-import-mapping.png]]

4. Run the dedupe check. Decide whether duplicates merge or skip.
5. Confirm and import. Auto-Tag runs on the imported records so they're searchable from the moment they land.

### Bulk Export — _Tier: Standard_

**What this feature is.** Bulk Export lets you export candidate and requisition data in CSV or XLSX format — for external reporting, board packs, audit responses, or POPIA data subject access requests.

**Why it matters.** Auditors and DSAR-issuing candidates demand the data back, and EE reporting cycles need export-ready data. Without bulk export, Sebenza Hub feels like a data prison — which is the wrong feeling for an enterprise system. Bulk export is what makes the platform feel like a partner, not a hostage situation.

**How to use it.** From the candidate or requisition list, click **Export**, pick the columns and filters, choose CSV or XLSX. The file is generated and downloads (or emailed for very large exports). The Audit Trail (Chapter 12) records every export — which is what makes the export trail defensible during a POPIA enforcement notice.

## Pro tips

- **Tags are the foundation.** Without tags, CRM and AI Search are weak. Auto-Tag handles most of the work, but develop a consistent tag vocabulary (e.g. `tech_stack:python`, `level:senior`, `location:cpt`, `availability:active`) for the manual ones too — and use it religiously across the team.
- **Notes should capture the why, not the what.** "Said no" is useless. "Said no — wants to stay another year for stock vesting, open after April 2027" is gold a year from now.
- **Don't let CRM become busywork.** If you're spending more than 30 minutes a week in CRM hygiene, you're over-tracking. The point is to capture enough signal to make future searches productive, not to log every keystroke.
- **Audit your tags every quarter.** Tag vocabulary drifts. "Cape Town" / "CPT" / "cape-town" all coexisting is normal but reduces search quality. Standardise periodically.
- **AI Search isn't the only search.** Use it as the wide cast, then verify with traditional filters. Models can miss literal exact matches; humans can miss semantic matches. Combine.

## Checklist

- [ ] Every active agency vendor is in the registry with engagement terms, MSA, and compliance docs
- [ ] POs are raised automatically for every vendor-published requisition
- [ ] Vendor submissions are deduped across vendors at submission time
- [ ] Quarterly vendor review uses the Vendor Performance dashboard, not vibes
- [ ] No vendor with expired POPIA / MSA / B-BBEE compliance can receive a new PO
- [ ] Invoice approval is a one-click confirmation against a real placement record
- [ ] Talent CRM has tags and a touch cadence for the senior / scarce-skill contacts you want to keep warm
- [ ] Auto-Tag is reviewed weekly so tag drift doesn't degrade search quality
- [ ] Side-by-Side Comparison is your default for shortlist-decision debriefs with hiring managers
- [ ] AI Search is being used as the primary search layer for hiring-manager descriptions; keyword search backs it up
- [ ] AI Hybrid Search is the default search mode (not pure keyword)
- [ ] Saved searches have a Search Health Score above 70; ones below are fixed
- [ ] Search Market Pulse is part of monthly TA leadership reporting
- [ ] You know how to bulk import (CSV) and bulk export (CSV/XLSX) when you need to

## Features covered in this chapter

| # | Feature | Tier | Route |
|---|---------|------|-------|
| 1 | Vendor Management | Premium | [https://www.sebenzahub.co.za/dashboard/business/vendors](https://www.sebenzahub.co.za/dashboard/business/vendors) |
| 2 | Talent CRM | Premium | [https://www.sebenzahub.co.za/dashboard/business/talent-crm](https://www.sebenzahub.co.za/dashboard/business/talent-crm) |
| 3 | Auto-Tag Candidate | Standard | _runs automatically on every candidate_ |
| 4 | Side-by-Side Comparison | Standard | _multi-select on candidate list_ |
| 5 | AI Search | Premium | [https://www.sebenzahub.co.za/dashboard/business/ai-search](https://www.sebenzahub.co.za/dashboard/business/ai-search) |
| 6 | AI Hybrid Search | Standard | _toggle on AI Search_ |
| 7 | AI Job Search Parser | Standard | _automatic on AI Search_ |
| 8 | Smart Search Suggestions | Standard | _automatic on AI Search_ |
| 9 | Search Health Score | Premium | _per saved search_ |
| 10 | Search Market Pulse | Premium | _per saved search_ |
| 11 | Competitive Heat Map | Premium | _from AI Search results_ |
| 12 | CSV Bulk Import | Standard | _candidate list → Import_ |
| 13 | Bulk Export | Standard | _candidate / requisition list → Export_ |

## Next chapter

[[01 How-To Documents/corporate/11-communication-and-automation|Chapter 11 — Communication and automation]]

## References

- [[02-concepts/compliance]] — POPIA, B-BBEE, EE context
- [[02-concepts/ai-features]] — AI capabilities behind these tools
- [[01 How-To Documents/corporate/05-posting-jobs|Chapter 5 — Posting jobs]]
- [[01 How-To Documents/corporate/06-receiving-applications|Chapter 6 — Receiving applications]]
- [[01 How-To Documents/corporate/09-making-offers|Chapter 9 — Making offers]]
- [[01 How-To Documents/corporate/11-communication-and-automation|Chapter 11 — Communication and automation]]
- [[01 How-To Documents/corporate/12-compliance-and-audit-trail|Chapter 12 — Compliance and audit trail]]
- [[03-workflows/business-journey]] — End-to-end corporate hiring journey
