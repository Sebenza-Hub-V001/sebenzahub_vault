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

Based on the recruitment features documentation ([[09-sources/recruitment-features-2026-04-07]]), the reputation system is informed by several measurable signals:

### Confirmed Input Signals
- **Placement tracking** — success rates by recruiter, client, and role type (from Placements feature)
- **Candidate NPS** — Net Promoter Score surveys at application, interview, and offer stages (from Candidate NPS feature)
- **Engagement Score** — composite based on email opens, response times, assessment completion, interview attendance
- **KPI Dashboard** — calls made, submissions sent, interviews arranged, offers extended, placements made
- **Scorecard analysis** — interviewer calibration and consistency tracking (from Panel Analysis)
- **Diversity Analytics** — demographic representation across pipeline stages

### Reputation Breakdown Fields (from schema)
- `candidateNps` (0–100)
- `clientSatisfaction` (0–100)
- `placementRetention` (0–100)
- `responsiveness` (0–100)

The AI enhancement audit ([[09-sources/ai-enhancement-opportunities-2026-04-07]]) mentions `scoreCandidateEngagement()` as an existing AI function — this may feed into trust scoring.

**Updated assessment:** Trust tiers are likely calculated from the `reputationBreakdown` JSONB fields (candidateNps, clientSatisfaction, placementRetention, responsiveness), with thresholds determining Bronze/Silver/Gold/Platinum. The exact thresholds and whether calculation is automatic or admin-triggered still needs code verification.

**Confidence:** medium — input signals confirmed, but calculation algorithm and trigger mechanism need code-level verification.

## Investigation Steps

- [x] Review recruitment features for reputation-related signals → confirmed NPS, engagement, KPIs
- [x] Check AI enhancement audit for scoring functions → found `scoreCandidateEngagement()`
- [ ] Search for "trustTier" or "trustScore" calculation in server routes
- [ ] Check if there's a cron job or trigger that recalculates tiers
- [ ] Look for admin endpoints that manually set trust tiers

## References

- [[01-entities/recruiter-user]] — Trust tier fields on profile
- Source: [[09-sources/recruitment-features-2026-04-07]]
- Source: [[09-sources/ai-enhancement-opportunities-2026-04-07]]
