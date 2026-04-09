---
title: "Chapter 20 — Autopilot and auto-apply"
type: concept
created: 2026-04-09
updated: 2026-04-09
tags: [manual, individual, autopilot, advanced]
status: active
user-types: [individual]
---

# Chapter 20 — Autopilot and auto-apply safeguards

> ⚠️ **Partial draft.** This chapter covers the *concept* of Autopilot and the principles you should apply if you turn it on, but the *exact platform behaviour* — rate limits, approval gates, override mechanisms, and what gets auto-generated on your behalf — is still being documented. Do not enable Autopilot in production until the open question in [[08-questions/individual-training-manual-plan]] is resolved and this chapter is filled in. If you do enable it in the meantime, set the most conservative settings available and review every action it takes.

## What Autopilot is

Autopilot is a Sebenza Hub feature that lets the platform act on your behalf in the job application process. The configuration lives in your `individualSettings` and includes options for:

- **Auto-apply** — submitting applications to matching jobs without you clicking each one
- **Auto-cover-letter** — generating a cover letter per application
- **Auto-follow-up** — sending follow-up messages on a schedule

The promise: more applications, faster, with less effort. The risk: applications going out in your name that you wouldn't have sent yourself — to wrong-fit roles, with off-brand cover letters, to ghost listings, or in bursts that look spammy to recruiters.

## Why you should be careful

Auto-apply is the most powerful feature in this manual and the easiest one to misuse. The reason is structural: the value of an application is not its existence — it's your *attention* to it. A hand-written cover letter referencing a specific JD detail is signal. A generic AI-generated cover letter on a wrong-fit job is noise. Autopilot can scale either, depending on how it's tuned.

The risks specifically:

| Risk | What it looks like |
|------|---------------------|
| Wrong-fit applications | Apply to roles that don't match your real preferences, lowering your visible match average |
| Off-brand cover letters | The cover letter says something about you you wouldn't have said |
| Burst patterns | Twenty applications in five minutes — recruiters notice this |
| Ghost-job applications | Auto-apply to flagged ghost listings because filters didn't catch them |
| Sub-quality CV selection | The wrong CV version attached to a role that needed a tailored one |
| Loss of mental tracking | You stop knowing where you've applied, which makes follow-up impossible |

## The principles to apply

Even before the operational details are documented, these principles will hold up regardless of what Autopilot does specifically:

1. **Set the highest possible match-score threshold.** If Autopilot can be configured with a minimum match score (say, 80+), use the highest setting. You'd rather have it do nothing than do something wrong.
2. **Restrict Autopilot to a narrow set of filters** — one specific role, one location, one experience level. Never let it loose across "all jobs in my field."
3. **Always review what Autopilot has done.** Set a daily check-in to look at applications it submitted. If it submitted anything you wouldn't have, tighten the rules immediately.
4. **Disable auto-apply for any job with a non-trivial ghost-risk score** if the option exists.
5. **Don't let auto-cover-letter run unattended on senior or specialised roles.** These need a human voice.
6. **Cap the daily volume.** Even if the platform doesn't enforce a cap, set one for yourself — somewhere between 3 and 8 auto-applications per day is plausible. More than that and quality collapses.
7. **Treat auto-follow-up cautiously.** Generic "checking in" messages from your account, in volume, can damage your reputation with recruiters. One follow-up per application, well-spaced, is the maximum acceptable cadence.

## When Autopilot makes sense

Even with its risks, there are situations where Autopilot can be a good fit:

- **You're applying to high-volume, standardised roles** where customisation barely matters (entry-level, retail, contact centre)
- **You're searching while employed** and don't have time for daily manual application sessions
- **You've already validated your targeting and CV** in Part 5 and are confident the inputs are good
- **You're in a thin market** where seeing every new listing fast is more valuable than applying with care

## When Autopilot is the wrong tool

- **You're early in your search** and still figuring out what works
- **You're applying to senior, specialised, or rare roles** where each application is a real conversation
- **Your profile or CV needs more work** (Part 2 isn't done)
- **You haven't identified your direction yet** (Chapter 18)
- **You haven't validated any responses on manual applications** — Autopilot will scale a bad pipeline as fast as a good one

## What to do until this chapter is complete

Until the open question is resolved and the operational specifics here are documented:

1. **Don't enable any Autopilot feature** unless you've already had success with manual applications and know exactly what you want it to do.
2. **If you must enable something**, start with the most restrictive setting available, watch it for a week, and only loosen it after you've reviewed every single action.
3. **Check back on this chapter periodically** — once we have the operational details, the chapter will tell you which exact settings to use and what the safeguards already are.
4. **Read [[16-manuals/individual/21-career-dna|Chapter 21]] first** — Career DNA and Opportunity Weights tighten the AI matching that Autopilot uses, which makes the entire thing safer.

## Open question

The detailed open question being tracked:

> How does the auto-apply (Autopilot) feature work in practice? What rate limits, approval gates, and override mechanisms exist? What exactly does auto-cover-letter generate? What does auto-follow-up send and on what schedule?

Tracked in [[08-questions/individual-training-manual-plan]] and originally raised in [[01-entities/individual-user]].

## Checklist

- [ ] You understand that Autopilot is high-risk if misused
- [ ] You've decided whether your situation is one where Autopilot might fit
- [ ] If enabling, you've set the most conservative settings available
- [ ] You have a daily review ritual planned for actions Autopilot took
- [ ] You're aware this chapter is partial and will be updated

## Next chapter

[[16-manuals/individual/21-career-dna|Chapter 21 — Career DNA and Opportunity Weights]]

## References

- [[01-entities/individual-user]] — Autopilot Config (in `individualSettings`)
- [[08-questions/individual-training-manual-plan]] — Open question tracking
