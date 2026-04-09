---
title: "Individual Training Manual — Plan & Outline"
type: question
created: 2026-04-09
updated: 2026-04-09
tags: [training, manual, individual, documentation, planning]
sources: [individual-features-2026-04-07, individual-journey-gap-analysis-2026-04-07]
status: active
confidence: high
user-types: [individual]
---

# Individual Training Manual — Plan & Outline

This page captures the plan for the **Individual user training manual** and tracks open questions before each part is drafted. The manual itself lives in `16-manuals/individual/`.

## Goal

Produce a task-oriented training manual that takes a brand-new Individual user from signup to a successful first hire. The manual should be readable end-to-end by a true beginner, while also functioning as a reference for users who already know the basics and need to look up a specific task.

## Source material (already in the wiki)

The wiki already contains the raw material. The manual is a *reshape*, not a research project.

| Existing wiki page | Role for the manual |
|--------------------|---------------------|
| [[01-entities/individual-user]] | Master feature inventory (57 features in 6 categories) |
| [[03-workflows/individual-journey]] | End-to-end journey, hiring path + parallel tracks (the spine) |
| [[15-dashboards/individual-dashboard]] | UI surface — sidebar groupings drive chapter ordering |
| [[02-concepts/application-lifecycle]] | Pipeline model (Applied → Screening → Interview → Offer → Hired) |
| [[02-concepts/authentication]] | Magic-link login mechanics |
| [[02-concepts/ai-features]] | AI capabilities cited in scenario sidebars |
| [[02-concepts/billing-system]] | Credits, plans, premium features |
| [[02-concepts/compliance]] | POPIA consent narrative |
| [[01-entities/community-learning-hub]] | Learning + community chapters |
| [[01-entities/offer-system]] | Offer chapter |

## Approach

1. **Linear core, recipe periphery.** Parts 1–4 read top-to-bottom (signup → offer). Parts 5–6 are searchable recipes/troubleshooting.
2. **Spine = the hiring path** from `individual-journey.md` (Steps 1–7).
3. **Parallel tracks (AI, Learning, Community, Career Dev) appear as just-in-time sidebars**, not standalone chapters, until Part 6.
4. **Defer power-user features** (Autopilot, Career DNA, Market Radar, Opportunity Weights) to Part 6.
5. **Write to outcomes, not features.** Each section answers "what am I trying to achieve?" before "which button do I click?"
6. **Every chapter ends with a checklist** the user can self-verify against.
7. **Cross-link to the wiki**, do not duplicate it. The manual is for end users; the wiki is for the team.

## Outline

```
Part 1 — Getting Started
  1. What Sebenza Hub is and who it's for
  2. Creating your account (magic link)
  3. Onboarding: the 6 things you need to fill in
  4. Your first 10 minutes on the dashboard

Part 2 — Build Your Profile
  5. Uploading or building a CV
  6. Running CV Review (first AI touchpoint)
  7. Adding skills, credentials, and a video intro
  8. Privacy and POPIA: what recruiters can see

Part 3 — Find and Apply to Jobs
  9. Browse vs Auto Match vs Manual Search — which to use when
 10. Saving searches and favourites
 11. Applying: single application walkthrough
 12. Tracking applications and setting follow-ups

Part 4 — Interview and Offer
 13. Using the Interview Simulator
 14. Researching a company before an interview
 15. Receiving and responding to an offer
 16. Salary Negotiator

Part 5 — When You're Stuck (troubleshooting)
 17. "I'm not getting responses" → Skill Gap, CV Review, Coaching
 18. "I don't know what to apply for" → Career Path, Career Pulse
 19. "I need to level up" → Learning Hub, Learning Paths

Part 6 — Advanced (optional)
 20. Autopilot and auto-apply safeguards
 21. Career DNA and Opportunity Weights
 22. Market Radar
 23. Community and mentorship
```

## Open Questions (must resolve before drafting affected chapters)

- **Autopilot safeguards (Chapter 20).** How does auto-apply behave in practice? What rate limits, approval gates, and override mechanisms exist? Until this is documented, Chapter 20 cannot ship. *(Carried over from [[01-entities/individual-user]] open questions.)*
- **Pricing tiers (Chapters 4, 11, 16).** Which features require credits or a paid plan? Do CV Review, Interview Simulator, and Salary Negotiator have free-tier limits? Tracked in [[08-questions/subscription-plans]].
- **Learning path curation (Chapter 19).** How are paths assembled? Editorial, AI-generated, or both? Affects how confidently we can recommend them to beginners.
- **Screenshots.** All screenshots will need a re-capture pass — only one image (`Pasted image 20260408063435.png`) currently exists in the vault. Plan: capture in batches per chapter as drafts are reviewed.

## Status

- [x] Plan filed (this page)
- [x] `16-manuals/individual/` scaffold created
- [x] Part 1 (Chapters 1–4) drafted
- [x] Part 2 (Chapters 5–8) drafted
- [x] Part 3 (Chapters 9–12) drafted
- [x] Part 4 (Chapters 13–16) drafted
- [x] Part 5 (Chapters 17–19) drafted
- [x] Part 6 (Chapters 20–23) drafted — Ch 20 (Autopilot) is a *partial* draft pending the operational details from the open question; Ch 21–23 are full drafts
- [ ] Screenshots captured
- [ ] Recruiter manual planned (sibling to this one)
- [ ] Business manual planned
- [ ] Admin manual planned

## References

- [[16-manuals/individual/index]] — Manual table of contents
- [[16-manuals/individual/01-what-sebenza-hub-is]] — Chapter 1
- [[03-workflows/individual-journey]] — Source spine
- [[01-entities/individual-user]] — Feature inventory
- [[15-dashboards/individual-dashboard]] — UI grouping
