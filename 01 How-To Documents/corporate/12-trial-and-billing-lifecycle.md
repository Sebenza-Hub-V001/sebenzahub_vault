---
title: "Chapter 12 — Trial and billing lifecycle"
type: concept
created: 2026-04-26
updated: 2026-04-26
tags: [how-to, corporate, billing, trial, plans, conversion]
status: active
user-types: [business]
---

# Chapter 12 — Trial and billing lifecycle

Every new Business account starts on a **30-day Premium trial**, then lives the rest of its lifespan on whichever paid plan you convert to (or on the Free tier if you let the trial expire). This chapter walks through the lifecycle end-to-end so finance, the account owner, and the TA leader all share the same picture of what happens when.

## Day 0 — signup

You complete onboarding with a Business account (Chapter 2) and the platform automatically:

- Creates a subscription row pointing to the Premium plan for the Corporate product.
- Marks it as a trial with a 30-day end date.
- Unlocks every Premium feature for the duration.

You do not enter card details. You do not pick a plan. The trial is the default.

## Days 1–23 — full Premium access

During these three weeks the account behaves as a Premium customer in every meaningful way. Standout markers:

- **TrialBanner.** A persistent banner across the top of the dashboard shows the day-count remaining. It's there so the trial end is never a surprise.
- **Hard caps on real-cost items.** Three features that cost real external money per call have per-trial caps: **Background Checks** (2 per trial), **Bulk Export** (5 per trial), and **WhatsApp Campaigns** (50 messages per trial). All other Premium features are unmetered during the trial.
- **An UpgradeDialog on cap-hit.** If you hit a trial cap or trip a Premium gate that the trial doesn't grant (rare), a centralised upgrade dialog opens with the conversion path. Same dialog opens from the TrialBanner's "Upgrade now" action.

Use this window for a real evaluation. Stand up your team, post real requisitions, run a real pipeline, run the integrations you actually plan to use. Buyers who treat the trial as a real pilot get a real signal; buyers who poke at the dashboard for an hour on day 28 don't.

## Day 23 — 7-day reminder email

A reminder email lands in the account owner's inbox: "Your trial ends in 7 days." It's deduped (the system records that it sent it, so re-runs of the daily cron don't double-send). Use this email as the trigger to:

- Get the procurement decision in motion if it isn't already.
- Confirm the plan you'll convert to (Standard or Premium — see the comparison below).
- Have the billing contact ready to enter card details on the Billing page.

## Day 29 — 1-day reminder email

A second reminder lands: "Your trial ends tomorrow." Same dedup behaviour. By this point the conversion decision should be made.

## Day 30 — end of trial

Two paths:

- **You converted.** The trial subscription row is marked as converted, the paid subscription becomes the active one, and there's no functional change for the user — Premium features stay on, the TrialBanner disappears, and the Billing page shows the new paid status.
- **You did nothing.** The trial expires automatically. Status flips to expired, the account drops to the **Free** tier, and Premium features become read-only or hidden. You **do not lose data** — every requisition, candidate, application, comment, audit trail entry, and integration config remains intact. What changes is what you can do with them.

If you let it expire and want Premium back later, you can subscribe at any time. Re-trials on a fresh trial window are restricted to once every 6 months for the same account, so don't expect to bounce in and out.

## Conversion: how it actually happens

Conversion is a single action from the **Billing** page (`/dashboard/business/billing`):

1. Open the page. The TrialBanner and the page itself surface the conversion call-to-action.
2. Pick the plan you want to convert to. The default offered is Premium (the trial set the expectation); Standard is available if your operation doesn't need the Premium-only features.
3. Enter card details and confirm. The conversion happens at checkout — there's no separate "activate" step.

After confirmation, the platform:

- Records the conversion timestamp on the trial row (`trial_converted_at`).
- Activates the paid subscription pointing at the chosen plan.
- Removes the TrialBanner.
- Stops sending trial reminder emails.

## Plan tiers, in one table

| Tier | Who it's for | Headline features | Notes |
|------|-------------|-------------------|-------|
| **Free** | Post-expiry residual access | Limited candidate counts, Basic ATS, Email Notifications, Email Support | Read-only across most features that were Premium during the trial |
| **Standard** | Small TA functions, basic enterprise hiring | Basic ATS, Team Members (5 seats), role-on-invite RBAC, Company Branding, SMS Notifications, Analytics Dashboard, Diversity Analytics, Priority Support | The realistic floor for an active hiring team |
| **Premium** | Mid-to-large enterprises with a multi-stakeholder TA function | Everything in Standard plus Full ATS, granular RBAC (provisioned by Sebenza), SSO, white-labelling (provisioned by Sebenza), Vendor Management, Internal Job Board, Succession Planning, Performance Management, Workforce Planning, Advanced Analytics, Predictive Analytics, Custom Reports, HRIS Integration, API Access, all AI tooling, all notification channels, Dedicated Support | The configuration this guide is mostly written against |

## What to do before conversion

- **Confirm the seat count.** Premium is unlimited; Standard is 5. If you're a 12-person TA team, Premium is non-negotiable.
- **Identify your blocking Premium features.** SSO, granular RBAC, white-labelling, HRIS Integration, API Access, and Workforce Planning are Premium-only. If you need any of them, you're going to Premium regardless of the seat count.
- **Plan the conversion timing.** Convert before day 30. There is no benefit to running to the wire and there's a real cost to letting the account drop to Free for even a day — features go read-only, your team notices, and the rebuild of trust costs more than the time saved.

## Checklist

- [ ] Account owner has set a calendar reminder for day 7 of the trial — that's when the procurement decision needs to be in motion
- [ ] Billing contact has been identified and has card details ready ahead of conversion
- [ ] The plan tier you'll convert to has been agreed (Standard vs Premium) based on actual feature needs
- [ ] You converted before day 30 rather than letting the account drop to Free

## References

- [[01 How-To Documents/corporate/02-creating-your-account|Chapter 2 — Creating your account]]
- [[01 How-To Documents/corporate/03-setting-up-your-org|Chapter 3 — Setting up your organisation]]
- [[02-concepts/billing-system]] — Plan tiers and metering model
