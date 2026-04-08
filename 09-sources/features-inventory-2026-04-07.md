---
title: "Source: Features Inventory"
type: source
created: 2026-04-07
updated: 2026-04-07
tags: [platform, features, inventory, architecture]
sources: [features-inventory]
status: active
confidence: high
---

# Source: Features Inventory

**Raw file:** `13-raw/data/features-inventory.md`
**Ingested:** 2026-04-07

## Summary

A comprehensive inventory of every frontend page, seeded feature, and route in Sebenza Hub. This is the definitive map of the platform's surface area — 325 frontend pages across 9 route segments, 157 seeded features, and 18 subscription plans.

## Key Claims

- **325 frontend pages** across 9 route segments: Public (23), Individual (85), Recruiter (86), Business (15), Admin (104), Assessment (2), Verification (2), Public Profile (6), Showcase (2)
- **3,586 API endpoints** and **755 database tables**
- **157 seeded features**: 42 Individual, 86 Recruiter, 29 Business/Admin
- Feature types are either `boolean` (on/off) or `metered` (usage-limited per plan)
- Metered features for Individuals: CV storage, AI interview, AI coaching, AI CV review, cover letter generator
- Metered features for Recruiters: job posts, AI interviews, AI screening, AI coaching, WhatsApp messages, featured listings, video interview hours, active talent pools, active sequences, API calls
- **18 subscription plans** covering all user types
- Business dashboard is notably smaller (15 pages) vs Recruiter (86) — reflects different maturity levels
- Admin has the largest dashboard (104 pages) — heavy governance, AI monitoring, and feature management tooling

## Entities and Concepts Mentioned

- [[01-entities/sebenza-hub]] — Platform scale metrics
- [[01-entities/individual-user]] — 85 dashboard pages, 42 features
- [[01-entities/recruiter-user]] — 86 dashboard pages, 86 features
- [[01-entities/business-user]] — 15 dashboard pages
- [[01-entities/admin-user]] — 104 dashboard pages
- [[02-concepts/billing-system]] — 18 subscription plans, metered vs boolean features
- [[02-concepts/rbac]] — Granular role management (13+ admin role tabs)
- [[02-concepts/whatsapp-integration]] — 12 admin WhatsApp sub-pages

## Notable Observations

- The Admin WhatsApp section alone has 12 sub-pages — more than the entire Business dashboard. This underscores WhatsApp's strategic importance.
- Feature flags are managed through a sophisticated admin system with lifecycle, experimentation, dynamic pricing, and revenue attribution pages.
- The assessment system has only 2 public-facing pages but is powered by extensive backend infrastructure (300+ test templates per seeded data).

## Contradictions / Tensions

- The features inventory lists 325 frontend pages, but the earlier repo audit counted 464. The difference likely comes from counting methodology — the inventory may exclude dynamically generated sub-routes or modal pages.

> ⚠️ **Tension:** [[09-sources/repo-audit-2026-04-07]] counted 464 frontend pages, while this inventory lists 325. The ~139 difference may represent sub-components counted as pages in the audit but not as routes in this inventory.

## Open Questions

- What are the exact 18 subscription plans and their pricing? (See [[08-questions/subscription-plans]])
- How are the 157 seeded features distributed across plans?

## References

- [[01-entities/sebenza-hub]] — Platform entity
- [[02-concepts/billing-system]] — Subscription and feature gating
- [[09-sources/repo-audit-2026-04-07]] — Earlier codebase audit
