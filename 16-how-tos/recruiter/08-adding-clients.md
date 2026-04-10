---
title: "Chapter 8 — Adding corporate clients"
type: concept
created: 2026-04-09
updated: 2026-04-09
tags: [how-to, recruiter, clients, crm]
status: draft
user-types: [recruiter]
---

# Chapter 8 — Adding corporate clients

In Sebenza Hub, a **client** is a corporate buyer of your placement services — the company you submit candidates to and earn fees from. Clients are first-class records in the system, not just notes attached to jobs. Every job, every submission, every placement, and every revenue line ties back to a client. Get the client records right and the rest of the platform works; get them sloppy and your KPI Dashboard becomes meaningless.

This chapter walks through adding a client, adding contacts, setting client tier and status, and the principles behind keeping client records useful.

## Where it lives

`/dashboard/recruiter/clients` is the master list. Click **+ New client** to add one.

## The minimum to add a client

| Field | Required | What to put |
|---|---|---|
| **Name** | Yes | The client's official company name (e.g. "Standard Bank Group Limited"), not a shorthand. |
| **Industry** | No, but do it | The client's primary industry. Use the same vocabulary you used for your own sectors (Chapter 3). |
| **Tier** | No, but do it | A/B/C or your own categorisation — see below. |
| **Status** | No, defaults to *active* | active / prospect / dormant / lost / paused — see below. |
| **Website** | No | The client's website. Useful for the client page and for context in candidate research. |
| **Notes** | No | Free text. The story of the relationship. |
| **Rating** | No | A 0–5 rating you assign internally — your subjective measure of how good a client they are to work with. Useful for filtering. |

You can save with just the name. Everything else can be filled in later. But the more you add now, the more useful the client appears in searches, dashboards, and analytics.

## Client tier — your most important categorisation

Sebenza Hub doesn't enforce any specific tier vocabulary — the field is free text. But every successful agency uses *some* tier system to focus their attention. The most common:

- **Tier A** — your top 5–10 clients. They generate most of your revenue, you respond to them within hours, you treat their roles as priority. They get your best recruiters.
- **Tier B** — solid working relationships. Reliable but not strategic. You service them well, but they don't get the white-glove treatment.
- **Tier C** — opportunistic / transactional. One-off mandates, slow payers, low-volume relationships. You handle them, but they don't get priority attention.

A common rule: **80% of your revenue comes from your Tier A clients.** Spend 80% of your client-facing time on them. The platform's KPI Dashboard (Chapter 25) lets you slice your performance by tier so you can verify this is actually true for your agency.

You can use any vocabulary that fits — Strategic / Growth / Maintenance, or Platinum / Gold / Silver, or just Big / Medium / Small. Pick a vocabulary and stay consistent.

## Client status — where they sit in the lifecycle

The status field tracks where this client sits in your relationship lifecycle. Standard values:

| Status | Meaning |
|---|---|
| **prospect** | You're pursuing this client but haven't signed an engagement yet. They're in the pipeline but they haven't paid you anything. |
| **active** | An engagement is in place and either work is happening now or it's expected within the next 90 days. |
| **dormant** | An engagement was previously active but no work has happened in the last 90 days. Worth re-engaging. |
| **paused** | The client has explicitly asked you to pause for a defined period (hiring freeze, organisational change). |
| **lost** | The client moved to a competitor or stopped working with you. Keep the record so you have history. |

Be ruthless about flipping clients from active to dormant when work stops. An "active client list" of 200 clients where only 30 actually have current work is misleading; a real active list of 30 with the rest accurately marked dormant is honest.

## Adding contacts

A client isn't a person — it's a company with multiple humans inside. Every client should have at least one contact, and most clients should have several:

1. From the client's detail page, click **+ Contact**.
2. Enter:
   - **Full name** (required)
   - **Role / title** (e.g. "Head of Talent Acquisition")
   - **Email**
   - **Phone**
   - **WhatsApp consent** flag — flip on if they've explicitly consented to WhatsApp messages (POPIA matters here)
   - **Is primary** — flip on for your main day-to-day contact at this client

The first contact you add is automatically marked primary. You can change this later by editing another contact and flipping the flag.

### Why multiple contacts matter

A client with one contact is fragile. If your contact leaves, gets reorganised, or just goes on leave, you have nobody to talk to. Best practice is to have at least:

- The **primary contact** (your day-to-day relationship)
- The **economic buyer** (the person who signs off on fees — often Head of HR, CFO, or department head)
- The **hiring manager** for any active role (changes per role; add when you start a mandate)
- A **secondary contact** (someone you can reach if the primary is unavailable)

## Linking clients to jobs

When you create a job in `/jobs` (Chapter 11), you'll be asked which client it's for. The dropdown lists every active and prospect client you've added. **Always link a job to a client** — orphan jobs don't roll up into your KPI Dashboard, and you can't earn placement revenue against an unlinked job.

Direct hires for your own agency are a special case — create a "client" record for your own agency name (or a placeholder like "Internal Hires") so the linking still works.

## Documents — contracts, NDAs, proposals

Each client has a **Documents** tab where you can upload contracts, NDAs, proposals, SLAs, and invoices. Each document has a type (contract / proposal / nda / sla / invoice / other), an expiry date, and a status (active / expired / superseded / draft).

Upload your **signed engagement contract** here as soon as it exists. It becomes the legal record you reference when fee disputes happen (Chapter 28 covers the audit trail). Don't store contracts in your email or your local Drive — store them on the client record so anyone with client access can find them.

## The client list view

`/dashboard/recruiter/clients` shows all clients in a table. The columns you'll filter and sort on most:

- Name
- Tier (filter by A/B/C)
- Status (filter by active vs dormant)
- Last activity (sort to find clients you've ignored)
- Total revenue (sort to find your top clients)
- Open jobs (number of active mandates)

Use the **Last activity** sort regularly. A client you haven't touched in 60 days is at risk of going dormant. A client you haven't touched in 180 days probably is dormant — update the status to match reality.

## Pro tips

- **Add the client BEFORE you start sourcing candidates for them.** Sourcing without a client record means the candidates aren't tied to anything — you'll have to retroactively associate them when the deal materialises, and that's painful.
- **Use the notes field as a story.** Every client meeting, every contract negotiation, every win/loss reason — write it down. Your future self (or your successor at the agency) will thank you.
- **Tier and status are different.** A dormant Tier A client is still Tier A — they're just not active right now. Don't downgrade their tier just because they paused work; downgrade only if the relationship fundamentally weakens.
- **Don't pad the active list.** It's tempting to keep clients marked active because it makes your numbers look bigger. Don't. Honest dormant tracking gives you a much more useful re-engagement list (Chapter 31).

## Checklist

- [ ] You've added at least one client (even if it's a placeholder for direct hires)
- [ ] Every active client has at least one contact, with the primary flag set
- [ ] You've decided on a tier vocabulary and applied it
- [ ] You've uploaded at least one signed engagement contract to the Documents tab
- [ ] You understand that orphan jobs (no client link) won't roll up into your dashboard

## Next chapter

[[16-how-tos/recruiter/09-engagement-terms|Chapter 9 — Engagement terms: fees, payment, guarantee]]

## References

- [[02-concepts/multi-tenancy]] — Why each agency has its own client list
- [[16-how-tos/recruiter/09-engagement-terms|Chapter 9 — Engagement terms]]
- [[16-how-tos/recruiter/10-managing-client-relationships|Chapter 10 — Managing client relationships]]
