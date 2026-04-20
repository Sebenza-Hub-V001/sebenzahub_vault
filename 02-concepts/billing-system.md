---
title: "Billing System"
type: concept
created: 2026-04-07
updated: 2026-04-20
tags: [billing, payments, subscriptions, plans, credits, entitlements]
sources: [repo-audit-2026-04-07, whatsapp-bot-training-manual-v2-2026-04-11, repo-sync-2026-04-20]
status: active
confidence: medium
---

# Billing System

Sebenza Hub uses a tiered subscription model with 18 plans, credits, usage metering, and South African payment processing.

## Subscription Plans

18 plans across the user types, managed by Admin at `/admin/plans`. Plans are stored in the `plans` table and entitlements in `feature_entitlements`.

**Centralised pricing (2026-04-11):** Pricing constants moved into a shared `plans.ts` data file — dashboards for all 3 user types render from a single `DashboardPlanCards.tsx` component (`b359c31`, `48542e6`).

**Feature entitlements seeded (2026-04-13):** `feature_entitlements` now seeded with plan↔feature links automatically (`cc94cfc`). Unified AI Governance and billing registries (`9cd04fd`) — no more divergence between what features a plan claims and what Governance tracks.

**Checkout persistence (2026-04-11):** `checkoutId` now persists across payment retries so interrupted flows resume correctly (`570b679`).

## Key Billing Endpoints

All under `/api/me/billing/*`:

| Endpoint | Purpose |
|----------|---------|
| `GET /preferences` | Billing preferences |
| `GET /payment-methods` | Payment methods on file |
| `POST /payment-methods` | Add payment method |
| `GET /invoices` | Invoice history |
| `GET /subscription-history` | Plan change history |
| `GET /usage-history` | Feature usage tracking |
| `GET /spending-summary` | Spending overview |
| `GET /credits` | Credit balance |
| `POST /credits/purchase` | Buy credits |
| `POST /credits/spend` | Spend credits |
| `GET /credits/history` | Credit transaction history |
| `GET /referral` | Referral program |
| `POST /referral/invite` | Send referral invite |
| `GET /roi` | ROI calculation |
| `GET /plan-recommendation` | AI plan recommendation |
| `POST /pause` | Pause subscription |
| `GET /financial-health` | Financial health score |
| `GET /budget-forecast` | Budget forecasting |
| `GET /tax-summary` | Tax summary (SA VAT) |
| `GET /cost-intelligence` | Cost optimization suggestions |

## Credits System

Some features are metered via credits:
- Users purchase credits
- Credits are spent when using specific features (e.g., AI operations, background checks)
- Credit history tracked for transparency

## Payment Processing

Likely uses **Peach Payments** (South African payment gateway) based on the SA market focus. ZAR is the default currency.

## Admin Billing

Admin has full control at `/admin/billing`:
- Revenue analytics
- Payment gateway configuration
- Plan management
- Invoice management
- Coupon/discount codes
- Churn prevention tools

## Feature Entitlements

The `feature_entitlements` table controls which features each plan includes. Admin configures this at `/admin/features`. Feature access is checked at runtime:
- `GET /api/me/entitlements` — Returns what the current user's plan allows

## Business Billing Dashboard

As of April 2026, Business users now have a dedicated billing management page (`BusinessBilling.tsx`) for corporate subscription management.

### Shared Plan Cards Component

A new shared `DashboardPlanCards.tsx` component (189 lines) provides a consistent plan selection and display UI across all three user dashboards (Individual, Recruiter, Business). Plan features and pricing data are centralised in `client/src/data/plans.ts` (229 lines, 18 plans defined).

This refactoring replaced duplicated billing code in `RecruiterBilling.tsx` and `IndividualBilling.tsx`, reducing each by ~78 lines.

## Open Questions

- What are the 18 specific plans and their pricing tiers?
- What features are credit-metered vs included in plans?
- Is Peach Payments confirmed or is there another gateway?
- How does the referral program work (credits, free months, etc.)?

## References

- [[02-concepts/rbac]] — `billing:view`, `billing:manage` permissions
- [[03-workflows/individual-journey]] — Billing in the Individual journey
- [[03-workflows/recruiter-journey]] — Billing in the recruiter journey
- [[03-workflows/business-journey]] — Billing in the Business journey
- Source: repo sync 2026-04-20 — Centralised pricing, feature entitlements seeding, unified AI-Governance/billing registries
