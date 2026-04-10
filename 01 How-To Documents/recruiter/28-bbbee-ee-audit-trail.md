---
title: "Chapter 28 — B-BBEE, EE Reports, Audit Trail, Approval Workflows"
type: concept
created: 2026-04-09
updated: 2026-04-09
tags: [how-to, recruiter, bbbee, ee, audit, compliance]
status: draft
user-types: [recruiter]
---

# Chapter 28 — B-BBEE, EE Reports, Audit Trail, and Approval Workflows

POPIA (Chapter 27) protects individual privacy. **This** chapter is about the other half of South African compliance — Employment Equity, Broad-Based Black Economic Empowerment, immutable audit trails for fee defence, and the approval workflows that protect you from your own team's mistakes. These are not exciting tools, but they're the difference between an agency that survives a regulator's visit and one that doesn't.

## Where it lives

| Page | Purpose |
|---|---|
| `/dashboard/recruiter/bbbee` | B-BBEE compliance and reporting |
| `/dashboard/recruiter/ee-reports` | Employment Equity reports |
| `/dashboard/recruiter/audit-trail` | Immutable activity log |
| `/dashboard/recruiter/approval-workflows` | Configure and review approval chains |

## 1. Employment Equity (EE) Reports — `/dashboard/recruiter/ee-reports`

The Employment Equity Act requires designated employers (50+ employees, or specific revenue thresholds) to report annually on workforce demographics, pipeline representation, and progress against EE targets. The Department of Employment and Labour audits these reports and can fine non-compliance.

As a recruiter, you don't file the EE report yourself — your **client** does, and they file based on their workforce. But your placements feed their numbers. If you've consistently placed only one demographic into your client's roles, you're hurting their EE compliance and they will hold you accountable.

### What the EE Reports page shows

For each client (and aggregated across all clients), the report shows:

- **Hiring demographics** by occupational level (Top management → Senior management → Professionally qualified → Skilled → Semi-skilled → Unskilled)
- **Pipeline representation at each stage** — application pool, screened, interviewed, offered, placed
- **Progress against the client's EE targets** (set in the client's EE plan)
- **Year-over-year trend**
- **Comparison to industry benchmarks**

### Generating a report

1. Open `/dashboard/recruiter/ee-reports`.
2. Pick the time range (typically a financial year or calendar year).
3. Pick the client (or "all clients").
4. The report generates as a PDF in Department of Employment and Labour-ready format.
5. Send to the client to include in their submission.

### Why this matters commercially

A client whose EE numbers improve year-over-year — and who can show you helped — is a client who renews. A client whose numbers worsen blames the recruiter who placed them. EE Reports are the proof of your contribution. Generate them quarterly so you have the data when the client asks.

## 2. B-BBEE — `/dashboard/recruiter/bbbee`

B-BBEE (Broad-Based Black Economic Empowerment) is a separate framework — it scores companies on transformation across multiple "pillars" (ownership, management control, skills development, enterprise development, socio-economic development). Companies need a B-BBEE level (1 best, 8 worst) to qualify for government tenders, supply major corporates, and access procurement preferences.

### Your B-BBEE level (the agency)

You have your own agency B-BBEE level, set in the agency profile (Chapter 5). It affects:

- Whether clients can use you for procurement (most large corporates prefer Level 1–4 suppliers)
- Your trust badges (the `bbbee_certified` badge requires a current certificate — Chapter 6)
- Your ability to bid on government work
- The B-BBEE score you contribute to your clients' scorecards

Keep your level current. When your B-BBEE certificate expires, your trust tier drops and your eligibility for client procurement changes.

### Your placed candidates' B-BBEE status

Beyond your own level, the platform tracks the B-BBEE status of every candidate you've placed. This feeds your client's "skills development" and "management control" pillars:

- Placing PDI candidates into management roles boosts the client's management control pillar
- Placing candidates into learnerships and skills programmes boosts the skills development pillar
- The aggregate of all your placements determines how much you contribute to each client's scorecard

### Generating a B-BBEE report for a client

Same as EE Reports:

1. Open `/dashboard/recruiter/bbbee`.
2. Pick the client and time range.
3. Generate the report.
4. Send to the client.

The report shows: total placements made, demographic breakdown by occupational level, contribution to each pillar, and year-over-year trend.

### What clients actually use this for

When your client renews their B-BBEE certification (annually), they need to provide evidence of their transformation contribution. Your B-BBEE report is one piece of that evidence. A Tier A client whose B-BBEE rating dropped from Level 2 to Level 4 because your placements weren't transformation-aligned is a client you'll lose.

## 3. Audit Trail — `/dashboard/recruiter/audit-trail`

The Audit Trail is the immutable activity log for your entire agency. Every action that happens on the platform is recorded:

- User logins and logouts
- Records created, edited, deleted
- Stage changes in the Pipeline
- Messages sent
- Offers approved
- Documents uploaded
- Permissions granted or revoked
- Settings changed
- Data exports
- DSAR fulfilments

The trail is immutable — once written, it cannot be altered. Even an Admin user cannot edit historical entries. This is the architecture that makes the audit defensible to a third party.

### How to search the audit trail

1. Open `/dashboard/recruiter/audit-trail`.
2. Filter by:
   - **Date range**
   - **User** (who performed the action)
   - **Action type** (create, edit, delete, send, approve, etc.)
   - **Object** (candidate, job, offer, client, etc.)
   - **Specific record ID** (e.g. all activity on candidate Thandi M's record)
3. Each entry shows: timestamp, user, action, object, before/after state where applicable, IP address.

### Three scenarios where the audit trail saves you

**Scenario 1: A client disputes a fee.**

Six months after the placement, the client's CFO questions whether you actually had an exclusive engagement when you placed the candidate. Open the audit trail filtered to that engagement. You can show:

- When the engagement record was created
- The approval chain that signed it off
- Every change to the engagement terms over time
- The job creation, the candidate submission, the offer, the acceptance
- Every step timestamped, every actor identified

That's a defence the client cannot argue with.

**Scenario 2: A candidate alleges discrimination.**

The candidate claims you rejected them based on a protected characteristic. Open the audit trail filtered to their record. You can show:

- The exact reason code recorded at rejection
- The screening criteria they failed
- The scorecard scores they received
- The pattern of decisions across other candidates (was this consistent or unique?)
- The recruiter who made the decision and what their general pattern looks like

If your team has been disciplined about reject reasons and scorecards, the audit trail is your shield. If they haven't, the audit trail is your evidence of the gap.

**Scenario 3: An employee leaves and you suspect data theft.**

A team member leaves abruptly and you suspect they took candidate data with them. Open the audit trail filtered to that user. You can see:

- Every export they ran
- Every record they viewed in their last 30 days
- Any unusual access patterns (large volume of records viewed in a short window)
- Whether they downloaded CVs or candidate lists

This is the evidence trail for a CCMA referral or a civil claim.

### Why "immutable" matters

If the audit trail could be edited, it wouldn't be evidence. The platform enforces immutability at the database level — there is no API call, no admin override, no superuser shortcut to modify a historical entry. You can add new entries (correcting an error in a record creates a new audit entry, not a modification of the old one), but you can't unwrite the past.

## 4. Approval Workflows — `/dashboard/recruiter/approval-workflows`

Approval workflows were introduced in Chapter 7 (Team setup) for offer approvals. This page is where you actually configure them and where approvers see their queue.

### What you can route through approval

- **Offers** above a salary threshold
- **Engagement contracts** with non-standard terms
- **Custom permission grants** (a recruiter requesting access they don't have by default)
- **Data exports** of candidate information
- **Discount approvals** (when fees are reduced from the standard)
- **Refunds and credit notes**

### Configuring a workflow

1. Open `/dashboard/recruiter/approval-workflows`.
2. Click **+ New workflow**.
3. Define the trigger (e.g. "any offer with base salary > R750k").
4. Define the approval chain (e.g. "Manager → Admin if amount > R1.5m").
5. Set delegation rules (who can approve in someone's absence).
6. Set escalation rules (what happens if an approver doesn't respond in 48 hours).
7. Save.

### The approval audit log

Every approval decision is recorded:

- Who approved (or rejected)
- When
- At what amount or what state
- Whether they delegated
- Any notes the approver added
- The escalation history if it bounced up the chain

This `approval_audit_log` is part of the broader audit trail and is your defence in any "who said you could do that?" conversation.

## How these four tools work together

A client questions a placement six months later. Here's the integrated defence:

1. **EE Report** shows the client what your placements contributed to their EE numbers. Often this alone resolves the dispute — the client realises they were better off with you than they thought.
2. **B-BBEE Report** shows transformation contribution. Same logic.
3. **Approval Workflows log** shows that the offer that resulted in the disputed placement went through your standard approval chain, with their hiring manager's approval at the time.
4. **Audit Trail** shows the full history end-to-end. Engagement signed → job posted → candidate sourced → screened → interviewed → offered → accepted → placed. Every step timestamped and signed off.

That's an unargueable defence. Without these tools, "we did everything right" is your word against theirs. With them, it's evidence.

## Pro tips

- **Generate EE and B-BBEE reports quarterly, not annually.** Quarterly cadence catches problems while you can still fix them. Annual generation catches problems after the year is over.
- **Audit the approval log monthly.** Look for offers approved without going through the chain (someone bypassing the rules). Catch and correct early.
- **Don't grant audit trail access casually.** The audit trail contains sensitive operational data. Only Admins and approvers should have access by default.
- **Train your team that the audit trail is real.** When team members know everything they do is logged immutably, behaviour improves. This isn't surveillance — it's accountability. Frame it that way.
- **The audit trail is evidence, but only if you cite it.** When a dispute arises, *show* the relevant audit trail entries to the client. Don't just say "we have records." Pull them up.

## Checklist

- [ ] You know how to generate an EE report for a client
- [ ] You know how to generate a B-BBEE report
- [ ] You've reviewed the audit trail at least once for a real action you took
- [ ] You understand the audit trail is immutable
- [ ] Your offer approval workflow is configured (Chapter 7)
- [ ] You have a quarterly EE/B-BBEE reporting routine

## Next chapter

[[16-how-tos/recruiter/29-career-site-brand|Chapter 29 — Career Site, Brand Page, and Job Boards]]

## References

- [[02-concepts/compliance]] — POPIA, B-BBEE, Employment Equity legal context
- [[16-how-tos/recruiter/07-team-setup|Chapter 7 — Team setup (approval chains)]]
- [[16-how-tos/recruiter/27-popia-in-practice|Chapter 27 — POPIA in practice]]
- [[16-how-tos/recruiter/29-career-site-brand|Chapter 29 — Career Site, Brand Page, and Job Boards]]
