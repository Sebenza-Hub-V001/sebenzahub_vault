---
title: "Billing System"
type: concept
created: 2026-04-07
updated: 2026-04-07
tags: [billing, payments, subscriptions, plans, credits]
sources: [repo-audit-2026-04-07]
status: active
confidence: medium
---

# Billing System

Sebenza Hub uses a tiered subscription model with 18 plans, credits, usage metering, and South African payment processing.

## Subscription Plans

18 plans across the user types, managed by Admin at `/admin/plans`. Plans are stored in the `plans` table and entitlements in `feature_entitlements`.

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

## Individual Account Features

Per the [[sources/individual-feature-guide-pdf-2026-04-07|Job Seeker Feature Guide (PDF)]], the Individual's Account section exposes two user-facing features:

- **Billing** — View current plan, upgrade for premium features, manage payment methods, download invoices, track subscription status
- **Settings** — Control profile visibility, manage email/push notifications, connect external accounts (LinkedIn, GitHub), configure job search preferences

These align with the endpoints documented above (`/api/me/billing/*`) and the settings tabs documented on [[entities/individual-user]].

## Open Questions

- What are the 18 specific plans and their pricing?
- What features are credit-metered vs included in plans?
- Is Peach Payments confirmed or is there another gateway?
- How does the referral program work (credits, free months, etc.)?

## References

- [[entities/admin-user]] — Billing management
- [[entities/individual-user]] — Individual billing features
- [[workflows/individual-journey]] — Billing in the Individual journey (Step 13)
- [[entities/sebenza-hub]] — Platform overview
- [[concepts/rbac]] — `billing:view`, `billing:manage` permissions
- Source: [[sources/repo-audit-2026-04-07]]
- Source: [[sources/individual-feature-guide-pdf-2026-04-07]]
