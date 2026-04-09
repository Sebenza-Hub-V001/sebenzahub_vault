---
title: "Chapter 21 — Career DNA and Opportunity Weights"
type: concept
created: 2026-04-09
updated: 2026-04-09
tags: [manual, individual, career-dna, advanced]
status: draft
user-types: [individual]
---

# Chapter 21 — Career DNA and Opportunity Weights

By the time you reach this chapter, the platform already knows what you can do (skills), where you are (location), what level you work at (experience), and what kind of role you want (target title). What it still doesn't know is *how you actually want to work* and *what you'll trade off when two jobs are otherwise similar*. Career DNA and Opportunity Weights are how you tell it.

These two settings don't show up in the basic onboarding flow. They live in **Settings** (`/dashboard/individual/settings`) and they change how Auto Match (Chapter 9) ranks jobs for you. Configured well, they make the difference between matches that are *technically* fits and matches that are *actually* what you want.

## Career DNA — what kind of professional you are

Career DNA is a set of personal-style attributes the platform uses to colour your profile beyond skills and titles. It captures things like:

| Attribute | What it covers |
|-----------|----------------|
| **Work values** | What you're most motivated by — impact, compensation, growth, stability, autonomy, recognition |
| **Communication style** | Direct, diplomatic, written-first, verbal-first |
| **Work pace** | Fast-paced, steady, varied, deadline-driven |
| **Team preference** | Solo, small team, large team, cross-functional |
| **Leadership style** | Hands-on, delegating, coaching, strategic, none-of-the-above |
| **Risk tolerance** | Low (stable, predictable) to high (startup, ambiguous) |

The exact attribute set may evolve, but the principle stays the same: Career DNA describes the *kind* of work environment that suits you, not just the role you're qualified for.

### Why this matters for matching

Two jobs with identical titles and responsibilities can be wildly different to live in. A "Senior Engineer" at a hierarchical bank is a different daily reality from a "Senior Engineer" at a 20-person startup. Skills-based matching alone won't separate them. Career DNA gives the platform a way to.

When you set Career DNA accurately, Auto Match starts surfacing roles that fit your *style*, not just your CV. That sharply reduces the number of "great on paper, awful in practice" matches.

### How to fill it in well

There are three failure modes to avoid:

1. **Aspirational answers.** Don't write down what you wish you were. Write down what you actually are. If you want stability, say so — even if "high risk tolerance" sounds more impressive.
2. **Default answers.** Don't accept all the middle-of-the-range options just to finish quickly. The middle is where matching becomes useless.
3. **One-time answers.** Career DNA is not write-once. Re-visit it every 6–12 months. People genuinely change.

### A useful exercise

Before filling in Career DNA, think about three jobs you've had (or three roles you've observed closely):

- One you genuinely loved
- One you tolerated
- One you hated

For each, ask: what was the work environment like? What was the team like? What was the pace? What did the leadership look like? What did the company value?

The patterns from the loved job should map directly into your Career DNA settings. The hated job tells you what to *avoid* — set the opposite values, not just neutral.

## Opportunity Weights — how to score trade-offs

Opportunity Weights are a separate set of sliders that tell the AI how to score trade-offs *between* attributes when comparing jobs. Career DNA describes who you are; Opportunity Weights describe how you'd choose between two jobs that score differently on different dimensions.

Typical dimensions:

| Dimension | Higher weight means |
|-----------|---------------------|
| **Salary** | The platform prioritises higher-paying roles, even if other dimensions are weaker |
| **Culture fit** | The platform prioritises roles that match your Career DNA, even if salary is lower |
| **Growth / learning** | The platform prioritises roles where you'd learn new things or move up |
| **Stability** | The platform prioritises established companies, predictable roles |
| **Location / commute** | The platform prioritises proximity or remote work |
| **Mission / purpose** | The platform prioritises roles whose stated mission aligns with your values |

You set a weight (typically 0–10 or 0–100%) for each. The total is normalised — the weights are *relative*, not absolute. A weight of 8 on salary and 8 on culture means you value them equally; an 8 on salary and 2 on culture means salary matters four times as much.

### How to set them honestly

Most people overstate "growth", "mission", and "culture" and understate "salary". This is because the first three feel virtuous and the last feels mercenary. **Don't do this.** The AI uses whatever you tell it. If you say culture matters more than salary, it will surface culture-fit jobs at lower pay — and you'll bounce off them when you see the number.

A useful self-test: imagine you have two real offers in front of you:

- **Offer A**: 30% more money, 70% culture-fit on your Career DNA
- **Offer B**: market salary, 95% culture-fit on your Career DNA

Which one would you actually take? Your answer tells you the real ratio between salary and culture in your weights. Use that ratio.

Repeat this exercise for each pair (salary vs growth, salary vs stability, growth vs stability, etc.) until your weights reflect your real preferences.

### Common combinations

A few patterns that show up:

| Pattern | Likely use case |
|---------|-----------------|
| Salary heavy, growth medium, others low | Maximising income, possibly to clear a financial goal |
| Culture and growth heavy, salary medium | Mid-career professional optimising for fulfilment |
| Stability heavy, salary medium, others low | Family-supporting, prioritising predictability |
| Growth and mission heavy, salary lower | Early career, building skills and reputation |
| Location heavy, others medium | Optimising for life setup over work setup |

None of these is right or wrong. The point is to be honest about which one is yours.

## How Career DNA and Weights affect matching

Once both are set, Auto Match (Chapter 9) re-scores jobs against the combined model:

- **Skills + experience** still drive whether you're qualified
- **Career DNA** tunes which qualified roles get prioritised
- **Opportunity Weights** decide how qualified, well-fit roles get ranked against each other

You should see a noticeable shift in your top Auto Match results within a day or two. If the new top results feel more like jobs you'd actually take, your settings are right. If they feel weirder or worse, something is mis-tuned — go back and review.

## Tuning over time

Set Career DNA and Opportunity Weights once. Then check them every 3 months (or after any major life event) and ask:

- Has my situation changed? (Promoted, married, had a kid, moved cities, paid off something, got into something.)
- Are the matches still feeling right? If they've gone stale, the issue is usually your weights, not the AI.
- Am I being honest, or has aspiration crept back in?

Don't fiddle constantly. Each tuning round should be deliberate. Quarterly is plenty.

## Career DNA + Autopilot

If you ever turn on Autopilot (Chapter 20), well-set Career DNA and Opportunity Weights are your first line of defence against bad auto-applications. The AI applies on your behalf using these signals — so the better-tuned they are, the safer Autopilot is.

Don't enable Autopilot before you've set these. The two work together.

## A common failure: matching is fine but you're still applying poorly

Sometimes people set Career DNA and Opportunity Weights well, get great matches, and then ignore them — applying to everything Auto Match shows them rather than just the top-ranked. If that's you, the issue isn't the matching; it's the discipline. Re-read Chapter 9 (search modes) and Chapter 10 (favourites) to fix the workflow.

## Checklist

- [ ] Filled in Career DNA honestly, not aspirationally
- [ ] Set Opportunity Weights to reflect real trade-offs (test against a hypothetical pair of offers)
- [ ] Re-checked your Auto Match results after the changes
- [ ] You have a date in 3 months to re-tune
- [ ] You're not enabling Autopilot before this is done

## Next chapter

[[16-manuals/individual/22-market-radar|Chapter 22 — Market Radar]]

## References

- [[01-entities/individual-user]] — Career DNA, Opportunity Weights (in `individualSettings`)
- [[16-manuals/individual/09-search-modes|Chapter 9]] — How matching uses these settings
- [[16-manuals/individual/20-autopilot|Chapter 20]] — Why these settings matter before enabling auto-apply
