---
title: "Chapter 7 — Team setup: members, roles, and approval chains"
type: concept
created: 2026-04-09
updated: 2026-04-20
tags: [how-to, recruiter, team, roles, permissions, rbac, collaboration, coaching, benchmarking]
status: draft
user-types: [recruiter]
---

# Chapter 7 — Team setup: members, roles, and approval chains

Almost every agency outgrows the solo phase eventually. When that happens, you stop being the only person clicking around the platform and start having to think about *who can do what*. Sebenza Hub has a real role and permission system — not just "owner" and "everyone else" — and getting it right early avoids painful migrations later.

This chapter covers what each role can do, how to invite people, how to set up approval chains for offers and contracts, and how to think about team structure for typical agency sizes.

## Where it lives

Team setup lives at:

- `/dashboard/recruiter/team` — invite, list, and deactivate team members
- `/dashboard/recruiter/approval-workflows` — configure approval chains for offers and other regulated actions

## The six built-in roles

Every membership in your agency has one of these six roles. They're listed from most to least permissive.

| Role | What they can do |
|---|---|
| **Owner** | Everything. Cannot be removed. The original signup is automatically the Owner; you can transfer Owner to another user but you can't have zero owners. |
| **Admin** | Almost everything. Can manage team members, manage billing, manage clients, manage all jobs and candidates. Cannot remove the Owner. Use for trusted senior leadership. |
| **Manager** | Manages a team within the agency — can manage candidates, jobs, and pipeline activity. Cannot manage billing or invite admins. Use for desk leads and team leaders. |
| **Recruiter** | The day-to-day workhorse role. Can source candidates, post jobs, run screening, conduct interviews, send offers (subject to approval chain). Cannot manage clients or billing. |
| **Viewer** | Read-only access to everything within their scope. Use for stakeholders who need visibility but shouldn't change anything (executives, auditors, advisors). |
| **Member** | The default for newly invited users. Limited to viewing their own assigned candidates and jobs. Effectively a constrained Recruiter — useful when you're hiring junior staff or contractors. |

Each role bundles a sensible set of permissions across the platform — Jobs, Candidates, Pipeline, Interviews, Offers, Clients, Billing, Analytics, Team, Communications, Data, Audit. When you invite someone, you pick the role at invitation time. The role you assign sets what they can do; you don't need to tick individual permissions.

## Inviting a team member

### Team Members — _Tier: Metered — Standard: 5 · Premium: unlimited_

**What this feature is.** Team Members lets you add recruiters, managers, hiring managers, and viewers to your agency organisation, each with their own login, profile, and permission set. Seats are metered — Standard includes 5 active members, Premium is unlimited. (This feature is technically part of the Corporate seat-metering model, but agencies use the same mechanism — a seat is a seat regardless of organisation type.)

**Why it matters.** Recruitment is rarely a solo sport once you grow past one desk. Metering on seats aligns cost with team size in a predictable way and prevents the surprise of being charged per-feature for every active person. If you're a solo today on Standard, you have 4 seats in reserve for when you grow.

**How to use it.**

1. Go to `/dashboard/recruiter/team`.
2. Click **Invite member**.
3. Enter their full name and email address.
4. Pick a role from the dropdown.
5. Click **Send invitation**.

The invitee receives an email with a magic link. They click it, set up their account (or log in if they already have one on a different agency), and they're added to your team. Their first session lands on the recruiter dashboard with the permissions of the role you assigned.

![[r-ch07-team-invite-form.png]]

> **Important:** A user can belong to multiple agency organisations. If you invite someone who already has a Sebenza Hub Recruiter account at another agency, they can accept and switch between agencies via a context picker in the top nav. They don't need a new email address.

## Approval chains (for offers and other regulated actions)

Some actions in Sebenza Hub need a second pair of eyes before they go live. The most important is **offer creation** — sending an offer letter to a candidate is a binding act for your client and a commitment for your agency, so it almost always needs approval.

Approval chains are configured at `/dashboard/recruiter/approval-workflows`. The basic shape:

1. **Trigger:** an action that requires approval (typical: any offer above R500,000 base salary; any offer for a new client; any offer with non-standard payment terms).
2. **Approver:** the role or specific user who must approve (typical: Manager, then Admin if above a threshold).
3. **Threshold:** the condition that activates this rule (typical: salary band, fee amount, or client tier).
4. **Action if rejected:** rework, escalate, or block.

Each approver has a maximum authorised amount they can sign off on. If an offer exceeds their limit, it auto-escalates to the next person in the chain.

**Delegation** is supported — if an approver is on leave, they can delegate their approval authority to another user for a date range.

The approval audit trail (`approval_audit_log`) records every approval, rejection, delegation, and escalation. This is what you'll use to defend a fee or an offer if a client ever disputes the chain of authority. (More on this in Chapter 28.)

## How the team actually works together

Roles and permissions decide who *can* do what. The next feature is what your team uses to *actually do it together* — share candidates, leave notes, tag colleagues, and decide as a group instead of in side-channel chats.

### Team Collaboration — _Tier: Standard_

**What this feature is.** Team Collaboration lets team members share candidates, comment on profiles, @-mention each other, leave structured scorecard feedback, and follow an activity feed of what's happening across the desk. Conversations live next to the candidate record, not in Slack.

**Why it matters.** Hiring is a team sport and the decisions that matter (advance / reject / extend offer) almost always involve at least two people. In-platform collaboration captures the decision context where the work actually lives — so when someone asks "why did we pass on her in March?" the answer is one click away instead of a Slack search.

**How to use it.**

1. On any candidate page, use the **Comments** panel to leave notes for the team.
2. Type `@name` to mention a colleague — they get a notification in their preferred channel (Chapter 4).
3. Use **Share with team** to give specific members visibility on a private candidate.
4. The dashboard's **Team activity** feed surfaces what's happened across the agency in the last 24 hours.

![[r-ch07-collaboration-mention-feed.png]]

## Benchmarks and recruiter performance

Once you have more than one recruiter, you need a way to manage performance that isn't just "going off vibes." The next two features turn team management into a data conversation.

### Recruiter Benchmark — _Tier: Premium_

**What this feature is.** Recruiter Benchmark compares each recruiter's performance against industry standards on placement rate, time-to-fill, and candidate quality — both inside your agency and against anonymised platform-wide data for similar sectors and seniority.

**Why it matters.** Recruiters benchmark themselves against rumour and LinkedIn posts, which is how good people convince themselves they're underperforming and weak people convince themselves they're crushing it. Data benchmarking turns "am I any good?" into a concrete answer — and gives you the evidence that retains your top performers when competitors come knocking.

**How to use it.** From the team management page, open **Benchmarks**. Each recruiter has their own benchmark card showing their numbers against agency average and platform average. Share the card with the recruiter directly — transparency is the point.

![[r-ch07-recruiter-benchmark-chart.png]]

### Recruiter DNA — _Tier: Premium_

**What this feature is.** Recruiter DNA profiles the strengths, sweet spots, and comparative performance of every recruiter on your team. It surfaces patterns — "Sipho fills mid-market fintech roles 40% faster than agency average; struggles with executive search" — that take a manager months of observation to spot manually.

**Why it matters.** Agency leaders currently manage by feel and assign roles by who's available. DNA profiling turns that into a deliberate routing decision — the right role goes to the recruiter most likely to fill it well, not the one whose desk is least full. The result is faster fills, better retention, and clearer career conversations.

**How to use it.** Open `/dashboard/recruiter/team-dna` (Manager or Admin only). The dashboard shows each recruiter's profile in radar form alongside their sweet-spot sectors and seniority bands. Use it when assigning new mandates and as a long-term coaching reference.

## Practical role setups by agency size

There's no single right structure, but here are sensible defaults:

### Solo recruiter (you alone)

You're the Owner. No team members. No approval chain. Don't waste time setting up roles you don't need.

### Small team (2–4 recruiters)

- **You** — Owner
- **One Admin** — your business partner or operations lead. Can manage billing, clients, and team in your absence.
- **2–3 Recruiters** — the people doing the day-to-day desk work.
- **No approval chain yet** — at this size, real-time hallway conversation is faster than software approvals.

### Medium agency (5–15 recruiters)

- **You** — Owner
- **1 Admin** — ops lead
- **2–3 Managers** — desk leads, each running a team of 2–4 recruiters
- **8–12 Recruiters** — the workhorses
- **1–2 Viewers** — your accountant, your B-BBEE consultant, anyone who needs read-only visibility
- **Approval chain enabled** — offers above your average fee threshold need Manager approval; offers above 1.5× average need Admin approval. The threshold protects you from a junior recruiter accidentally committing the agency to a bad deal.

### Large agency (15+ recruiters)

- **You** — Owner (often a managing director who doesn't run desks anymore)
- **2–3 Admins** — leadership team
- **5+ Managers** — one per sector or geography
- **15+ Recruiters** across sectors
- **Multiple Viewers** — executives, auditors, finance
- **Multi-stage approval chains** — offers go Recruiter → Manager → Admin, with escalation thresholds. Custom role definitions for specialist functions (sourcers, researchers, account managers).

## Two things to set up on day one (even as a solo)

Even if you're a solo recruiter today, do these two things now — you'll thank yourself later:

1. **Confirm you're the Owner** in `/dashboard/recruiter/team`. The role should say "Owner". If for some reason it doesn't (rare bug, or you accepted an existing invite by mistake), fix it immediately.
2. **Decide who your "in case of bus" person is** — the person you'd want to inherit access if something happened to you. Even if you don't add them as an Admin yet, write down who that person is and how they'd take over. Sebenza Hub has account recovery procedures for incapacitated owners, but they're slow; planning ahead saves a week of friction.

## Note on team size and your plan

Your subscription plan caps how many team members you can invite. If you hit the cap, the invite button greys out and you'll be prompted to either upgrade your plan or remove an existing member to free a seat. The exact cap per plan is visible in `/dashboard/recruiter/billing` → Plan details.

## Checklist

- [ ] You understand the six built-in roles and what each can do
- [ ] You've decided which role each current team member should have
- [ ] You've invited at least one trusted Admin (or noted that you're staying solo for now)
- [ ] You know where to set up approval chains when you grow into needing them
- [ ] You've identified your "in case of bus" person, even if not yet invited
- [ ] You know which seat-metering tier you're on and how many seats you have left
- [ ] (Premium) You've reviewed Benchmarks and Recruiter DNA at least once

## Features covered in this chapter

| # | Feature | Tier |
|---|---------|------|
| 1 | Team Members | Metered — Standard: 5 · Premium: unlimited |
| 2 | Team Collaboration | Standard |
| 3 | Recruiter Benchmark | Premium |
| 4 | Recruiter DNA | Premium |

## Next chapter

[[01 How-To Documents/recruiter/08-adding-clients|Chapter 8 — Adding corporate clients]]

## References

- [[02-concepts/multi-tenancy]] — Organisation and team architecture
- [[01 How-To Documents/recruiter/06-ai-profile-assets|Chapter 6 — AI profile assets]]
- [[01 How-To Documents/recruiter/08-adding-clients|Chapter 8 — Adding corporate clients]]
