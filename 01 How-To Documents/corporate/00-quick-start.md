---
title: "Quick Start — 15 minutes to your first requisition draft"
type: concept
created: 2026-04-27
updated: 2026-04-27
tags: [how-to, corporate, quick-start, activation]
status: active
user-types: [business]
---

# Quick Start — 15 minutes to your first requisition draft

The full Corporate manual has 15 chapters covering ATS, internal mobility, vendor management, workforce planning, HRIS integration, and SA compliance. You don't need any of that on day one. This page gives you the **bare minimum** — three actions that take fifteen minutes and get the platform from "empty org" to "real organisation with a real requisition".

If you only ever do these three things, your account is functional. Everything else — RBAC, SSO, branding, vendor management, HRIS sync, EE reporting — is necessary but not urgent. Come back to the full manual when you're ready to operationalise it.

> **What you'll have at the end:** an organisation with one teammate invited (or skipped if you're solo for now), the basic company branding stub filled in, and one job saved as a draft requisition.
>
> **What you won't have yet:** SSO, granular RBAC, white-labelling, HRIS sync, vendor management, EE reports, internal mobility, or any approval workflows. That's deliberate — get a real requisition shape in the system first, then layer the enterprise plumbing on top.

## Before you start: who should be doing this?

You're an **Admin** on the Corporate (Business) account — typically the head of Talent Acquisition or HR. Don't start the rest of this quick start until you know that. The Admin role is what unlocks the team-invite, branding, and billing pages. If you're not the Admin, hand this to whoever is.

You also get a **30-day Premium trial** automatically. Everything in this quick start is covered by the trial, so don't worry about cost yet — [[01 How-To Documents/corporate/04-trial-and-billing-lifecycle|Chapter 4]] explains how the trial converts when it ends.

## The three steps

### 1. Sign up and choose Business role (3 minutes)

Sign up and pick **Business** as your role. Use a real work email — your team-invite emails will reference this domain.

You'll land on `/dashboard/business` (the corporate dashboard). The full account-creation walkthrough is in [[01 How-To Documents/corporate/02-creating-your-account|Chapter 2]].

> ⚠️ **Your role is locked after onboarding.** Business stays Business. If you also need to test the candidate or recruiter experience, sign up with a different email. [[01 How-To Documents/corporate/02-creating-your-account|Chapter 2]] covers the implications.

### 2. Either invite one teammate or skip (3 minutes)

Click **Settings** in the sidebar → **Team Members** → **Invite member**.

Enter one work email and pick the role:

- **Admin** — full access, including billing and integrations. Pick this if your finance contact is different from you and they need to convert the trial later.
- **Member** — the default. Can run requisitions, see candidates, send messages.
- **Viewer** — read-only. Useful for hiring managers who only need to see the pipeline.

If you're truly the only person on day one, skip this — you can always invite later. The full team-setup walkthrough including granular RBAC, SSO, and seat-counting strategy is in [[01 How-To Documents/corporate/03-setting-up-your-org|Chapter 3]].

> **Don't invite occasional interviewers as team members.** Use the lighter interviewer scorecard flow instead — [[01 How-To Documents/corporate/07-screening-and-evaluating|Chapter 7]] and [[01 How-To Documents/corporate/08-interviewing|Chapter 8]] cover it. Standard plans get 5 seats; you don't want to burn one on someone who scores two interviews a quarter.

### 3. Fill in branding basics and create one requisition draft (9 minutes)

**Branding (3 min):** Settings → **Company Branding**. Drop in your logo and your primary brand colour. That's enough. Apply rates jump immediately the moment your career page stops looking generic. The full white-label and brand-customisation walkthrough is in [[01 How-To Documents/corporate/03-setting-up-your-org|Chapter 3]].

**Requisition (6 min):** Click **Post Jobs** in the sidebar → **New Requisition**.

Fill in only the basics:

- Job title
- Department / hiring manager (your name is fine for now)
- Location (and remote / hybrid / onsite)
- A short job description — paste in any existing JD, or click the AI JD Writer to see what it generates from a few prompts
- **Save as draft.** Don't publish yet.

The full requisition flow with screening criteria, distribution channels, EE targets, and approval routing is in [[01 How-To Documents/corporate/05-posting-jobs|Chapter 5]].

## Stop here

You're done. Org, optionally a teammate, branding stub, and one requisition draft. Fifteen minutes.

Before you go any further:

- **Don't** wire up SSO yet. SSO works best when your roles and team are settled, and SSO setup involves your IT team — not something to do in your first session. [[01 How-To Documents/corporate/03-setting-up-your-org|Chapter 3]] covers it properly.
- **Don't** wire up HRIS sync yet (SuccessFactors, Workday, BambooHR, Sage HR). Get one or two real hires through the platform first so you can see the data shape before you sync it. [[01 How-To Documents/corporate/13-workforce-and-hr|Chapter 13]] covers it.
- **Don't** start adding agencies as vendors yet. Vendor management gets its own chapter for a reason — it's a structured workflow involving POs, performance, and compliance. [[01 How-To Documents/corporate/10-vendor-management-and-sourcing|Chapter 10]] is the right starting point when you're ready.
- **Don't** worry about EE reports, B-BBEE, or POPIA configuration in your first session. They activate at specific moments — quarterly reporting, audits, candidate data export requests. [[01 How-To Documents/corporate/12-compliance-and-audit-trail|Chapter 12]] covers them.
- **Don't** convert your trial yet. You have 30 days. Use the platform first, then decide. [[01 How-To Documents/corporate/04-trial-and-billing-lifecycle|Chapter 4]] explains the lifecycle.

## What to do next

Pick one of these depending on what you want:

| If you want to... | Read |
|-------------------|------|
| Understand what Corporate is for and how it differs from Recruiter | [[01 How-To Documents/corporate/01-what-sebenza-hub-is-for-corporates|Chapter 1]] |
| Set up the org properly: RBAC, SSO, branding, notifications | [[01 How-To Documents/corporate/03-setting-up-your-org|Chapter 3]] |
| Understand the trial and when to convert | [[01 How-To Documents/corporate/04-trial-and-billing-lifecycle|Chapter 4]] |
| Publish the requisition and start receiving applications | [[01 How-To Documents/corporate/05-posting-jobs|Chapter 5]] and [[01 How-To Documents/corporate/06-receiving-applications|Chapter 6]] |
| Manage the agencies you contract | [[01 How-To Documents/corporate/10-vendor-management-and-sourcing|Chapter 10]] |
| Operate compliance, audit, EE, B-BBEE, POPIA | [[01 How-To Documents/corporate/12-compliance-and-audit-trail|Chapter 12]] |
| Read the whole manual properly | [[01 How-To Documents/corporate/index|The Corporate Training Manual index]] |

## Checklist

- [ ] Account created with role **Business** (Admin)
- [ ] One teammate invited (or skipped intentionally)
- [ ] Logo and primary brand colour added under Company Branding
- [ ] One requisition created and saved as draft (not published)
- [ ] You've decided what to do next, or scheduled time later this week to come back

## References

- [[01 How-To Documents/corporate/index|Corporate Training Manual index]] — the full 15-chapter guide
- [[03-workflows/business-journey]] — the full corporate hiring journey
- [[02-concepts/compliance]] — POPIA, B-BBEE, Employment Equity context (when you're ready)
