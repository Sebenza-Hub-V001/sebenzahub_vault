---
title: "How are recruiter trust tiers calculated?"
type: question
created: 2026-04-07
updated: 2026-04-09
tags: [recruiter, trust, gamification, reputation, question]
status: active
confidence: high
---

> **✅ RESOLVED 2026-04-09 via codebase grep** — see Resolution section at the bottom.

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

## Resolution (2026-04-09)

The trust tier is calculated from **7 verification badges**, not from the `reputationBreakdown` JSONB scores. The reputation scores feed into trust as soft signals, but the *tier itself* is purely a function of how many badges are earned out of seven.

**Source:** `server/routes.ts` lines 5625–5682 (FEATURE 10: Trust & Verification Badges).

### The 7 badges

| Badge | How it's earned (auto, from profile fields) |
|---|---|
| `identity_verified` | User has a verified email (auto on signup once email is confirmed) |
| `linkedin_verified` | `recruiterProfiles.linkedinVerified === true` |
| `bbbee_certified` | Both `bbbeeLevel` AND `bbbeeDocumentUrl` are set on the profile |
| `client_endorsed` | `testimonials.length >= 3` (at least 3 client testimonials) |
| `placement_proven` | `totalPlacements >= 10` |
| `retention_star` | `avgRetentionRate >= 85` (85%+ candidate retention) |
| `response_champion` | Listed in `allBadgeTypes` but **not** in the auto-calculation block — likely manual via `POST /api/recruiter-profile/verify-badge`, or tied to a responsiveness signal not visible in this snippet |

### Score and tier formula

```typescript
trustScore = Math.min(100, Math.round((earnedCount / 7) * 100))

trustTier = trustScore >= 85 ? "platinum"
         : trustScore >= 65 ? "gold"
         : trustScore >= 40 ? "silver"
         : "bronze"
```

### Tier thresholds

| Tier | Score | Badges (out of 7) |
|---|---|---|
| Bronze | 0–39 | 0–2 |
| Silver | 40–64 | 3–4 |
| Gold | 65–84 | 5 |
| Platinum | 85–100 | 6–7 |

### Recalculation triggers

- **On-demand:** `GET /api/recruiter-profile/trust-score` recomputes from current profile data on every call.
- **On badge change:** `POST /api/recruiter-profile/verify-badge` recomputes after adding/updating a badge.
- **No cron job** — there is no scheduled background recalc. The score updates whenever an endpoint touches it or when the recruiter views their profile.

### Important note: Candidate trust tier is a *separate* system

Individual users (candidates) also have a `trustTier` field on `candidateProfiles`, but it uses a completely different formula based on credential verification coverage (`server/routes.ts` lines 5014–5036). The thresholds even differ slightly (platinum >= 80 for candidates vs >= 85 for recruiters). Don't confuse the two when working on the Individual side of the wiki.

## References

- [[01-entities/recruiter-user]] — Trust tier fields on profile
- [[01 How-To Documents/recruiter/06-ai-profile-assets]] — Where this is documented user-facing (when drafted)
- Source: [[09-sources/recruitment-features-2026-04-07]]
- Source: [[09-sources/ai-enhancement-opportunities-2026-04-07]]
- Code: `server/routes.ts` lines 5625–5682 (recruiter trust)
- Code: `server/routes.ts` lines 5014–5036 (candidate trust — different system)
