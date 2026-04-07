---
title: "What are the 18 subscription plans and their pricing?"
type: question
created: 2026-04-07
updated: 2026-04-07
tags: [billing, plans, pricing, monetisation, question]
status: active
---

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

### From Features Inventory ([[sources/features-inventory-2026-04-07]])
- **157 seeded features**: 42 Individual, 86 Recruiter, 29 Business/Admin
- Features are either `boolean` (on/off per plan) or `metered` (usage-limited per plan)
- **Individual metered features:** CV storage, AI interview, AI coaching, AI CV review, cover letter generator
- **Recruiter metered features:** job posts, AI interviews, AI screening, AI coaching, WhatsApp messages, featured listings, video interview hours, active talent pools, active sequences, API calls
- Admin has sophisticated feature management: dynamic pricing, entitlement sandbox, feature lifecycle, revenue attribution

### From SEO Plan ([[sources/seo-plan-2026-04-07]])
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

## References

- [[concepts/billing-system]] — Billing overview
- [[entities/admin-user]] — Plan management
- Source: [[sources/features-inventory-2026-04-07]]
- Source: [[sources/seo-plan-2026-04-07]]
