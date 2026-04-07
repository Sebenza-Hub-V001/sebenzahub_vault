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

It appears Recruiters **unilaterally create** Business client records in their CRM, rather than there being a bidirectional "connection" like LinkedIn. The Business's vendor management page likely shows which Recruiters have submitted candidates to their jobs.

**Confidence:** low — needs code-level verification.

## Investigation Steps

- [ ] Read the vendor management page (`/dashboard/business/vendors`)
- [ ] Check if `corporateClients` has any `organizationId` FK linking to a Business org
- [ ] Look for any "vendor invite" or "agency connect" API endpoints
- [ ] Check if job postings have visibility controls for specific agencies

## References

- [[entities/recruiter-user]] — Client management features
- [[entities/business-user]] — Vendor management
- [[concepts/multi-tenancy]] — Organization relationships
