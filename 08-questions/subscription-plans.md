---
title: "What are the 18 subscription plans and their pricing?"
type: question
created: 2026-04-07
updated: 2026-04-09
tags: [billing, plans, pricing, monetisation, question]
status: active
confidence: high
---

> **✅ RESOLVED 2026-04-09 via codebase grep** — see Resolution section at the bottom.

# What are the 18 subscription plans and their pricing?

## The Question

The platform has 18 subscription plans. What are they, what does each include, and what's the pricing structure?

## What We Know

- `plans` table in database (managed by Admin)
- `feature_entitlements` table controls which features each plan includes
- `GET /api/plans` returns available plans
- Admin manages plans at `/admin/plans`
- There are separate plan categories for Individuals, Recruiters, and Businesses
- Credits system exists alongside subscriptions

### From Features Inventory ([[09-sources/features-inventory-2026-04-07]])
- **157 seeded features**: 42 Individual, 86 Recruiter, 29 Business/Admin
- Features are either `boolean` (on/off per plan) or `metered` (usage-limited per plan)
- **Individual metered features:** CV storage, AI interview, AI coaching, AI CV review, cover letter generator
- **Recruiter metered features:** job posts, AI interviews, AI screening, AI coaching, WhatsApp messages, featured listings, video interview hours, active talent pools, active sequences, API calls
- Admin has sophisticated feature management: dynamic pricing, entitlement sandbox, feature lifecycle, revenue attribution

### From SEO Plan ([[09-sources/seo-plan-2026-04-07]])
- Pricing page meta suggests: *"From Free to Enterprise"*
- Description mentions: *"Individual from R99/mo, Recruiter from R999/mo, Corporate from R1,999/mo"*
- Currency: South African Rand (ZAR)

### Estimated Plan Distribution (18 plans)
Given 3 user types and typical SaaS tiering:
- **Individual:** Free, Basic (~R99/mo), Pro (~R199/mo), Premium (~R399/mo) = 4 plans
- **Recruiter:** Solo (~R999/mo), Team (~R1,999/mo), Agency (~R3,999/mo), Enterprise (custom) = 4 plans
- **Business:** Starter (~R1,999/mo), Professional (~R3,999/mo), Enterprise (~R7,999/mo), Custom = 4 plans
- **Add-ons / special:** Could account for remaining 6 plans (annual variants, trial plans, etc.)

**Confidence:** medium for existence and pricing range; low for exact plan names and feature mapping.

## Investigation Steps

- [x] Review features inventory for metered vs boolean features → confirmed
- [x] Check SEO plan for pricing hints → found R99/R999/R1,999 starting prices
- [ ] Read the `plans` table definition in schema.ts for field details
- [ ] Check for seed data that pre-populates plans
- [ ] Read the pricing page component for displayed tiers
- [ ] Check feature_entitlements for plan-to-feature mapping

## Resolution (2026-04-09)

**Source:** `server/seed-plans.ts` defines all 9 plan seeds explicitly. The "18 plans" comes from 9 seeds × 2 intervals (monthly + annual). Currency is ZAR throughout.

### The 9 plan seeds (× 2 intervals = 18 plans)

| Product | Tier | Monthly | Annual (per month) | Description |
|---|---|---|---|---|
| Individual | Free | R0 | R0 | Get started with job searching and 1 CV |
| Individual | Standard | R99 | R79 | AI-powered tools for serious job seekers |
| Individual | Premium | R199 | R159 | Unlimited access with priority applications |
| Recruiter | Free | R0 | R0 | 3 job posts and basic candidate search |
| Recruiter | Standard | R999 | R799 | Professional recruiting with AI screening |
| Recruiter | Premium | R2,499 | R1,999 | Full platform access for agencies and teams |
| Corporate | Free | R0 | R0 | 5 job posts and basic applicant tracking |
| Corporate | Standard | R1,999 | R1,599 | Full ATS with AI screening for growing teams |
| Corporate | Premium | R4,999 | R3,999 | Enterprise-grade hiring with compliance and white-label |

### Plan structure

- **3 products** (Individual, Recruiter, Corporate) — note: "Corporate" in the seed file = "Business" in the user-facing taxonomy.
- **3 tiers** per product (Free, Standard, Premium) — no "Enterprise" tier in the seed file. Custom enterprise deals are presumably handled outside the standard plan rows.
- **2 billing intervals** per (product, tier) combo — monthly and annual. Annual saves ~20% vs monthly.

### Per-feature metering (from features inventory)

Subscriptions only get you so far — many AI and bulk features are also credit- or limit-metered on top of the plan:

- **Individual metered:** CV storage, AI interview, AI coaching, AI CV review, cover letter generator
- **Recruiter metered:** job posts, AI interviews, AI screening, AI coaching, WhatsApp messages, featured listings, video interview hours, active talent pools, active sequences, API calls
- **Business metered:** TBD — not yet extracted

The metered limits per plan tier are stored in `feature_entitlements` and managed by Admin at `/admin/features`.

### Open follow-ups (minor)

- Exact metered limits per plan tier (e.g. "how many AI interviews does Recruiter Standard include?") — would require dumping the seeded `feature_entitlements` data.
- Whether there's an unlisted "Enterprise" or "Custom" tier handled outside `seed-plans.ts`.
- Confirmation that "Corporate" in code = "Business" in product copy (high confidence based on Admin manages Corporate plans for Business users).

## References

- [[02-concepts/billing-system]] — Billing overview
- [[01-entities/admin-user]] — Plan management
- [[01 How-To Documents/recruiter/04.5-how-we-charge]] — User-facing recruiter billing chapter
- Source: [[09-sources/features-inventory-2026-04-07]]
- Source: [[09-sources/seo-plan-2026-04-07]]
- Code: `server/seed-plans.ts` (full plan structure)
