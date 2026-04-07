---
title: "How are recruiter trust tiers calculated?"
type: question
created: 2026-04-07
updated: 2026-04-07
tags: [recruiter, trust, gamification, reputation, question]
status: active
---

# How are recruiter trust tiers calculated?

## The Question

Recruiters have a trust tier system: Bronze → Silver → Gold → Platinum. What triggers upgrades? Is it automatic or admin-managed?

## What We Know

From `recruiterProfiles`:
- `trustTier` (varchar): "bronze", "silver", "gold", "platinum"
- `trustScore` (integer): Default 0
- `reputationScore` (integer): Overall reputation
- `reputationBreakdown` (JSONB): candidateNps, clientSatisfaction, placementRetention, responsiveness (each 0–100)
- `verificationBadges` (JSONB array): Earned, pending, or locked badges

## Current Assessment

Likely calculated from a combination of:
- Placement count and success rate
- Client satisfaction (NPS)
- Candidate satisfaction
- B-BBEE verification status
- Profile completeness

**Confidence:** low — the calculation logic needs to be found in server code.

## Investigation Steps

- [ ] Search for "trustTier" or "trustScore" calculation in server routes
- [ ] Check if there's a cron job or trigger that recalculates tiers
- [ ] Look for admin endpoints that manually set trust tiers

## References

- [[entities/recruiter-user]] — Trust tier fields on profile
