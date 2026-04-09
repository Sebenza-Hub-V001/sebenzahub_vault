---
title: "Chapter 27 — POPIA in practice"
type: concept
created: 2026-04-09
updated: 2026-04-09
tags: [manual, recruiter, popia, privacy, compliance]
status: draft
user-types: [recruiter]
---

# Chapter 27 — POPIA in practice: data subject access requests, consent, and the rules you can't break

POPIA — the Protection of Personal Information Act — is South Africa's data protection law. It applies to every recruitment agency that handles candidate data, which is to say all of them. POPIA isn't a checkbox you tick during onboarding; it's a continuous obligation. This chapter covers what you actually have to do day-to-day, what to do when a candidate sends a data access request, and the things that get agencies fined.

## Where it lives

`/dashboard/recruiter/compliance` is the master POPIA compliance page. From here you can access consent records, data inventory, retention policies, and the data subject access request workflow.

## The five POPIA principles you need to remember

POPIA has many sections; for recruiters, these five rules cover 90% of practical compliance:

### 1. You need consent before processing personal information

Every candidate in your database must have given consent — either by applying to a job (implicit consent for that application) or by signing up to your platform (explicit consent for ongoing communication). Cold sourcing has a higher bar: you can collect public information without consent, but you can't *contact* the person without it (the first message is the consent ask).

### 2. You can only collect data for a specific, lawful purpose

If you're recruiting for a sales role, you don't need the candidate's medical history. Collect only what's relevant. The famous example: never ask for a candidate's marital status, number of children, or religious beliefs — they're irrelevant to almost every role and asking is itself a POPIA violation.

### 3. The candidate has the right to know what you hold

Any candidate can ask: "What personal information do you have about me?" You must respond within a defined window (typically 30 days) with a complete answer.

### 4. The candidate has the right to correct and to delete

Wrong data must be correctable. Candidates who exercise their "right to be forgotten" must have their data deleted (with limited exceptions for legal record-keeping).

### 5. You must protect the data

Encryption, access controls, audit logging, breach notification. Sebenza Hub handles most of the technical side — but you still have to use it correctly (don't export data to your personal Drive, don't email CVs to your Gmail, don't share login credentials).

## Consent capture — what the platform does for you

Sebenza Hub captures consent at multiple touchpoints automatically:

- **At signup** — every candidate accepts the platform's POPIA notice
- **At application** — every job application has a consent checkbox
- **At video recording** — explicit consent before any video starts (Chapter 19)
- **At background check** — explicit consent before any check is ordered (Chapter 17)
- **At WhatsApp opt-in** — `whatsappConsent` flag on every contact (Chapter 24)

Each consent is timestamped, version-stamped (so you can prove which version of your privacy notice they agreed to), and stored in the audit trail.

You don't have to manually capture consent — but you do have to honour it. If a candidate hasn't given WhatsApp consent, **don't message them on WhatsApp**, no matter how convenient.

## Handling a data subject access request (DSAR)

A DSAR is when a candidate asks for everything you hold on them. They might do this because:

- They're curious
- They're job-hunting elsewhere and want their record
- They're frustrated with you and exploring legal options
- They're complying with their own organisation's audit

Whatever the reason, you must respond. Here's the workflow.

### Step 1 — Verify the request

The request usually arrives by email. Verify it's actually from the candidate (not someone impersonating them). The platform helps by accepting DSARs through an authenticated channel — when a candidate logs into the platform and submits a request, identity is already verified.

### Step 2 — Acknowledge within 48 hours

Send an acknowledgement that you've received the request and will respond within the legal window (30 days under POPIA, often shorter under your privacy policy). The platform has a template for this.

### Step 3 — Gather the data

Open `/dashboard/recruiter/compliance` and trigger a **Data Subject Access Report** for that candidate. The platform automatically compiles:

- Their candidate profile
- Every job they've applied to and the application data
- Every interview they've had with you
- Every message exchanged across every channel
- Every test or assessment they've taken
- Every scorecard filled out about them
- Every interaction with you logged in the activity timeline
- Their consent records (what they consented to and when)

This is the "everything we hold" answer.

### Step 4 — Review for sensitive third-party content

Before sending the report, scan it for:

- **References from third parties** — you may have permission to *use* a reference but not to *share* it back to the subject. Redact carefully.
- **Internal notes about the candidate** — your private scorecards and notes are part of the record. The candidate has a right to see them. (This is the moment recruiters realise they should have been writing kinder notes all along.)
- **Other candidates' data** — if your messages reference other candidates (e.g. "Thandi is much stronger than Sarah for this role"), redact the third-party names.

### Step 5 — Send the report

Send via a secure channel (the platform's DSAR delivery is encrypted). Include:

- The compiled report
- A plain-language summary
- An explanation of how to request corrections or deletion
- A note on retention — how long you'll keep the data and why

### Step 6 — Log the response

The platform records the DSAR fulfilment in the audit trail. You don't have to do this manually, but verify it happened.

## The right to be forgotten — deletion requests

Sometimes the candidate asks you to delete their data, not just see it. This is the "right to be forgotten." Under POPIA:

- You **must delete** the data unless you have a legal reason to keep it
- **Legal reasons to keep data** include: ongoing legal proceedings, statutory record-keeping requirements (some financial roles require records for 5–7 years), and legitimate business interests that outweigh the candidate's privacy interest (rare and high bar)
- **Anonymisation is sometimes allowed** instead of deletion — you remove the identifying information but keep the aggregate data for statistics

The platform's DSAR workflow includes a deletion option. When you trigger it:

1. The candidate's record is marked for deletion
2. A 7-day cooling-off window runs (in case the candidate changes their mind or you discover a legal reason to retain)
3. After the window, the data is hard-deleted from active systems
4. Backups are purged according to the platform's retention schedule
5. The deletion is logged in the audit trail (the only record that survives is "user X requested deletion on date Y and it was completed on date Z")

### When NOT to delete

Some examples where you legitimately have to refuse a deletion request:

- The candidate is currently in litigation with one of your clients (preserve evidence)
- A regulatory body has required record retention (financial services typically 5 years)
- Your engagement contract with the client requires you to maintain the placement record for the guarantee period

In these cases, respond explaining *why* you're refusing and citing the legal basis. Don't just ignore the request.

## Data retention

POPIA requires that you don't keep data "longer than necessary." Sebenza Hub helps with this through retention policies:

- **Active candidates** — retained as long as they're in your database and actively engaged
- **Dormant candidates (no activity 2+ years)** — flagged for review; you can choose to keep, anonymise, or delete
- **Rejected applications** — typically deleted after 12–24 months unless the candidate consented to longer retention for future roles
- **Placed candidates** — retained for the duration of the guarantee period plus the legal record-keeping window
- **Exited candidates (DSAR-deleted)** — only the deletion log remains

Configure your retention policy at `/dashboard/recruiter/compliance` → Retention. Don't set it to "forever" — that's a POPIA violation waiting to happen.

## Common POPIA mistakes recruiters make

| Mistake | What to do instead |
|---|---|
| **Sharing CVs over personal email** | Always use the platform's submission flow — it logs and audits |
| **Asking for photos with applications** | Don't ask. Photos aren't relevant to job performance and they enable bias |
| **Asking for ID numbers upfront** | Only collect at the offer or background check stage, never at application |
| **Storing CVs in Dropbox / Drive** | Always store in the platform — Dropbox isn't audited or encrypted to POPIA standards |
| **Forwarding candidate WhatsApp screenshots** | Don't. Use the Unified Inbox (Chapter 22) for any sharing |
| **Keeping rejected candidates "just in case"** | Set a retention policy and stick to it |
| **Sending bulk emails without an unsubscribe link** | Always include opt-out — even for B2B recruitment outreach |
| **Recording video interviews without explicit consent** | Always get the consent confirmation; the platform enforces this |
| **Discussing candidate details in non-encrypted channels** | If you need to discuss, use the platform's internal messaging, not personal Slack/WhatsApp |

## Pro tips

- **Read your own privacy notice.** Most recruiters have never read the privacy notice they're asking candidates to consent to. Read yours; if you can't explain it in plain language, it's wrong.
- **Have a DSAR template response ready.** Don't write it from scratch when the first request lands — you'll panic. Write it once and store it as a template.
- **Train your team.** Everyone who touches candidate data needs to know POPIA basics. 30 minutes of training prevents 90% of mistakes.
- **Audit your retention quarterly.** Run a report on what's about to age out under your retention policy. Decide what to keep, anonymise, or delete *before* the deadline.
- **The Information Regulator is real.** South Africa's Information Regulator can fine companies up to R10 million for serious POPIA breaches. They've started enforcing seriously since 2023. Don't be the agency that becomes a precedent.

## Checklist

- [ ] You can find the POPIA compliance page in the dashboard
- [ ] You know what to do if a candidate sends a DSAR
- [ ] You have a retention policy configured
- [ ] You only collect information that's relevant to the role
- [ ] You always check `whatsappConsent` before WhatsApp messaging
- [ ] You store CVs and candidate data only in the platform, never personal email or Drive
- [ ] Your team has had at least one POPIA briefing

## Next chapter

[[16-manuals/recruiter/28-bbbee-ee-audit-trail|Chapter 28 — B-BBEE, EE Reports, Audit Trail, Approval Workflows]]

## References

- [[02-concepts/compliance]] — Full POPIA architecture and legal context
- [[16-manuals/recruiter/24-whatsapp-at-scale|Chapter 24 — WhatsApp at scale]]
- [[16-manuals/recruiter/26-diversity-panel-ai|Chapter 26 — Diversity, panel analysis, and AI Intelligence]]
- [[16-manuals/recruiter/28-bbbee-ee-audit-trail|Chapter 28 — B-BBEE, EE, Audit Trail]]
