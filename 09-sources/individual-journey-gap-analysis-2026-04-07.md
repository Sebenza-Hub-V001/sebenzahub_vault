---
title: "Individual Journey Gap Analysis"
type: source
created: 2026-04-07
updated: 2026-04-07
tags: [individual, journey, gap-analysis, coverage]
sources: [individual-journey-gap-analysis]
status: active
confidence: high
---

# Individual Journey Gap Analysis

**Source:** `13-raw/articles/individual-journey-gap-analysis.md`
**Ingested:** 2026-04-07

## Summary

An audit of the [[03-workflows/individual-journey]] document against the full Individual feature set from [[09-sources/individual-features-2026-04-07]]. The journey covered ~40% of actual features — the linear "signup → hired" path — but missed the platform's breadth.

## Key Findings

- The journey document covers **10 feature areas well**: signup, onboarding, profile, CVs, credentials, video profile, job search (6 sub-features), applications (5 sub-features), interview scheduling/simulator, AI cover letter, salary negotiator
- **30+ features were missing** across 8 categories
- Total Individual feature surface: **57 main pages, 90+ with tabs**

## Coverage Gaps by Category

| Category | In Journey | Missing | Gap Severity |
|----------|-----------|---------|-------------|
| Profile & Identity | 4 of 6 | CV Templates, Skill Verifications (detail) | Low |
| Job Search | 6 of 6 | — | None |
| Applications | 5 of 10 | Application Portal, Candidate Hub, Experience Surveys, Messages (detail) | Medium |
| AI Tools | 2 of 4 | AI Coaching, CV Review (entire section) | High |
| Learning Hub | 1 of 14 | 13 sub-features (generic mention only) | Critical |
| Career Development | 0 of 6 | Entire section missing | Critical |
| Community | 1 of 6 | 5 sub-features (generic mention only) | High |
| Knowledge Base | 0 of 1 | Entire section missing | High |
| Account | 0 of 2 | Billing, Settings (detail) | Medium |

## Entities and Concepts Mentioned

- [[01-entities/individual-user]] — already documents most missing features
- [[01-entities/community-learning-hub]] — Learning Hub and Community depth
- [[02-concepts/ai-features]] — AI tools for Individuals
- [[02-concepts/billing-system]] — Account billing
- [[03-workflows/individual-journey]] — the document being audited

## Contradictions / Tensions

> ⚠️ **Tension:** The [[01-entities/individual-user]] page already lists all 57 features comprehensively, but [[03-workflows/individual-journey]] only covers 40% of them. This creates an inconsistency where the entity page promises features the journey doesn't explain.

**Resolution:** Expand the journey document to cover the full feature breadth, not just the linear hiring path.

## Open Questions

- Should the journey be restructured from linear (steps) to thematic (categories)?
- How do non-hiring features (Learning, Career Dev, Community) fit into a "journey" narrative?

## References

- [[03-workflows/individual-journey]] — Document being audited
- [[01-entities/individual-user]] — Full feature list
- [[09-sources/individual-features-2026-04-07]] — Detailed feature descriptions
- Source: `13-raw/articles/individual-journey-gap-analysis.md`
