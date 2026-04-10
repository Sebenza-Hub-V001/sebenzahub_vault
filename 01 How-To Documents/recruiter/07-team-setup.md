---
title: "Chapter 7 — Team setup: members, roles, and approval chains"
type: concept
created: 2026-04-09
updated: 2026-04-09
tags: [how-to, recruiter, team, roles, permissions, rbac]
status: draft
user-types: [recruiter]
---

# Chapter 7 — Team setup: members, roles, and approval chains

Almost every agency outgrows the solo phase eventually. When that happens, you stop being the only person clicking around the platform and start having to think about *who can do what*. Sebenza Hub has a real role and permission system — not just "owner" and "everyone else" — and getting it right early avoids painful migrations later.

This chapter covers what each role can do, how to invite people, how to set up approval chains for offers and contracts, and how to think about team structure for typical agency sizes.

## Where it lives

Team setup is split across two pages:

- `/dashboard/recruiter/settings` → **Team Members** tab — invite, list, deactivate
- `/dashboard/recruiter/roles` — define custom roles and configure permissions

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

These roles are checked across **40+ granular permissions** organised by category: Jobs, Candidates, Pipeline, Interviews, Offers, Clients, Billing, Analytics, Team, Communications, Data, Audit. You don't usually need to think about individual permissions — the role bundles them sensibly. But if you do need a custom permission set, that's what custom role definitions are for.

## Inviting a team member

1. Go to `/dashboard/recruiter/settings` → **Team Members**.
2. Click **Invite member**.
3. Enter their full name and email address.
4. Pick a role from the dropdown.
5. (Optional) Assign a custom permission set instead of the default role permissions.
6. Click **Send invitation**.

The invitee receives an email with a magic link. They click it, set up their account (or log in if they already have one on a different agency), and they're added to your team. Their first session lands on the recruiter dashboard with the permissions of the role you assigned.

> **Important:** A user can belong to multiple agency organisations. If you invite someone who already has a Sebenza Hub Recruiter account at another agency, they can accept and switch between agencies via a context picker in the top nav. They don't need a new email address.

## Custom role definitions

The six built-in roles cover most needs, but if your agency has an unusual structure (e.g. a "Sourcing Specialist" who can source and screen but never directly contact candidates), you can build a custom role:

1. Go to `/dashboard/recruiter/roles`.
2. Click **New role definition**.
3. Name the role (e.g. "Sourcing Specialist").
4. Pick which built-in role it inherits from (start point for permissions).
5. Tick or untick individual permissions to customise.
6. Save.

The custom role is now available in the team invitation dropdown. Existing members can also be reassigned to it from the team list.

Custom roles are scoped to your organisation only — they don't affect other agencies on the platform. If you delete a custom role, members assigned to it fall back to the built-in role it inherited from.

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

1. **Confirm you're the Owner** in `/dashboard/recruiter/settings` → Team Members. The role should say "Owner". If for some reason it doesn't (rare bug, or you accepted an existing invite by mistake), fix it immediately.
2. **Decide who your "in case of bus" person is** — the person you'd want to inherit access if something happened to you. Even if you don't add them as an Admin yet, write down who that person is and how they'd take over. Sebenza Hub has account recovery procedures for incapacitated owners, but they're slow; planning ahead saves a week of friction.

## Note on team size and your plan

Your subscription plan caps how many team members you can invite. If you hit the cap, the invite button greys out and you'll be prompted to either upgrade your plan or remove an existing member to free a seat. The exact cap per plan is visible in `/dashboard/recruiter/billing` → Plan details.

## Checklist

- [ ] You understand the six built-in roles and what each can do
- [ ] You've decided which role each current team member should have
- [ ] You've invited at least one trusted Admin (or noted that you're staying solo for now)
- [ ] You know where to set up approval chains when you grow into needing them
- [ ] You've identified your "in case of bus" person, even if not yet invited

## Next chapter

[[16-how-tos/recruiter/08-adding-clients|Chapter 8 — Adding corporate clients]]

## References

- [[02-concepts/multi-tenancy]] — Organisation and team architecture
- [[16-how-tos/recruiter/06-ai-profile-assets|Chapter 6 — AI profile assets]]
- [[16-how-tos/recruiter/08-adding-clients|Chapter 8 — Adding corporate clients]]
