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

## Investigation Steps

- [ ] Read the `plans` table definition in schema.ts for field details
- [ ] Check for seed data that pre-populates plans
- [ ] Read the pricing page component for displayed tiers
- [ ] Check feature_entitlements for plan-to-feature mapping

## References

- [[concepts/billing-system]] — Billing overview
- [[entities/admin-user]] — Plan management
