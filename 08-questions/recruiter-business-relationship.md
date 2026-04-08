---
title: "How is the Recruiter-Business vendor relationship established?"
type: question
created: 2026-04-07
updated: 2026-04-07
tags: [recruiter, business, vendor, relationship, question]
status: active
---

# How is the Recruiter-Business vendor relationship established?

## The Question

When a Recruiter wants to work with a Business (employer) as a vendor/supplier, how does the relationship get established? Specifically:

1. Does the Business invite the Recruiter, or does the Recruiter request access?
2. Is there an approval/verification step?
3. How are fee terms negotiated and stored?
4. Can multiple Recruiters compete for the same Business's jobs?

## What We Know

From the codebase audit:

- `corporateClients` table exists on the **Recruiter** side — Recruiters create client records
- `corporateClientEngagements` stores fee terms (percentage, fixed, hybrid)
- `corporateClientContacts` stores multiple contacts per client
- Business users have a `/vendors` page for "vendor management"
- There's no apparent "invitation" or "connection request" flow in the schema

## Current Assessment

Based on [[09-sources/recruitment-features-2026-04-07]], the Recruiter side has a full **Revenue Engine** that confirms the Recruiter-driven model:

1. **Client Pipeline** — CRM-style pipeline for tracking client relationships (prospect → active). Recruiters manage outreach, track deals, log meetings and proposals.
2. **Submissions** — Recruiters submit candidate profiles to clients and track feedback.
3. **Placements** — End-to-end tracking from confirmed offer through start date and guarantee period, with invoicing triggers.
4. **KPI Dashboard** — Tracks submissions sent, interviews arranged, placements made.

The Business side has a **Vendor Management** page (`/dashboard/business/vendor-management`) which likely shows Recruiters who have submitted candidates. The AI enhancement audit ([[09-sources/ai-enhancement-opportunities-2026-04-07]]) identifies "AI Vendor Scoring" as a future feature: *"AI predicts vendor performance based on historical data. Cost optimization: 'Vendor A charges 20% more but delivers 35% faster.'"*

**Updated assessment:** Recruiters unilaterally create client records and manage the relationship from their side. Businesses see Recruiters as "vendors" and can track their performance. There is no mutual "connection request" flow — Recruiters pursue Businesses as sales leads. Fee terms (percentage, fixed, hybrid) are stored in `corporateClientEngagements`.

**Confidence:** medium — confirmed by feature documentation, but connection flow still needs code-level verification.

## Investigation Steps

- [x] Review recruitment features documentation for client management → confirmed via Revenue Engine features
- [x] Check AI enhancement audit for vendor management plans → confirmed vendor scoring as future AI feature
- [ ] Read the vendor management page code (`/dashboard/business/vendor-management`)
- [ ] Verify if there's any invite/approval mechanism in the API

## References

- [[01-entities/recruiter-user]] — Client management and Revenue Engine features
- [[01-entities/business-user]] — Vendor management
- [[02-concepts/multi-tenancy]] — Organization relationships
- Source: [[09-sources/recruitment-features-2026-04-07]]
- Source: [[09-sources/ai-enhancement-opportunities-2026-04-07]]
