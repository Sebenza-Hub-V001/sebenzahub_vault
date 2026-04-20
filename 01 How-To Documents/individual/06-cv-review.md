---
title: "Chapter 6 — Running CV Review"
type: concept
created: 2026-04-09
updated: 2026-04-20
tags: [how-to, individual, cv, ai, cv-review, bullet-writer]
status: active
user-types: [individual]
---

# Chapter 6 — Running CV Review

You have a CV in the system. Before you start applying to jobs, run it through CV Review. This is the first AI feature you should use, and it's also one of the highest-value: most CVs get rejected in seconds because of fixable problems, and CV Review surfaces those problems before a recruiter ever sees them.

Plan on about 20 minutes — most of that spent actually acting on the feedback, which is the point.

![[13-raw/screenshots/i-ch06-cv-review-nav.png]]

## What CV Review actually checks

CV Review reads your CV and returns structured feedback across four areas:

| Area | What it checks |
|------|----------------|
| **Clarity** | Is the structure scannable in 15 seconds? Are sections clearly labelled? Is the summary doing real work or filler? |
| **Keywords** | Does the CV contain the terms recruiters and ATS systems search for in your target role? |
| **Achievement quantification** | Are your bullet points results-led with numbers, or are they vague responsibilities? |
| **ATS compatibility** | Will an Applicant Tracking System (the software many employers use to screen CVs) be able to read it cleanly? |

It also flags **gaps recruiters notice**: missing dates, unexplained employment gaps, weak summaries, generic objective statements, oversized formatting choices that confuse parsers.

The feedback is *specific*. It points at the exact bullet point or section it has a problem with, and tells you what to do about it.

## Step 1 — Run the review

### AI CV Review — _Tier: Metered — Standard: 3/mo · Premium: unlimited_

**What this feature is.** AI CV Review is a section-by-section scoring of your CV — summary, experience, education, skills — with specific suggestions to strengthen weak bullets, add metrics, and remove fluff. Each run produces a numerical score plus a structured report you can act on directly.

**Why it matters.** Most candidates rewrite their CV before every senior application, and the metering matches that cadence. The jump from a 62 to an 88 on your CV score is usually 2–3 rewrites with this tool — Standard's 3/month covers a focused rewrite cycle, Premium goes unlimited for people who tailor per-application.

**How to use it.**

1. Go to **CV Review** (`/dashboard/individual/cv-review`).
2. Pick the CV you want reviewed. If you have more than one CV from Chapter 5, start with your default.
3. Click **Run review**. The AI takes about 30 seconds to a minute to process.
4. The review appears as a structured report with sections you can expand and collapse.

![[13-raw/screenshots/i-ch06-cv-review-select-dialog.png]]

Standard gives you 3 reviews per month, Premium is unlimited. Free tier users can't run the review at all — the upgrade prompt appears when you click Run.

## Step 2 — Read the review properly

The instinct most people have when they see AI feedback is to skim, feel mildly attacked, and close the tab. Don't do that. Read the feedback the way you'd read notes from a friend in HR who already gets paid to do this: assume the criticism is right unless you have a specific reason to disagree.

![[13-raw/screenshots/i-ch06-cv-review-score-card.png]]

Work through it section by section. For each piece of feedback, ask:

1. **Is the criticism accurate?** Re-read the bullet point or section it's flagging. Does the problem actually exist?
2. **Is the suggested fix the right fix?** Sometimes the AI proposes a specific rewrite. Sometimes you'll have a better one. Use whichever is stronger.
3. **Can I act on it now?** Most fixes are 30 seconds of editing. Do them while the feedback is in front of you.

## Step 3 — Make the changes

Open My CVs in another tab. Edit the CV directly. Common changes you'll make:

- **Tighten the summary.** The AI will almost always tell you your summary is generic. It probably is. Rewrite it to say *what role you want* and *one specific reason you're a good fit*.
- **Quantify bullet points.** Where you wrote "Managed customer support team," add the team size, the volume of tickets, or the metric you owned. If you don't remember the exact number, use a defensible estimate.
- **Add missing keywords.** If the AI says your CV is missing terms a recruiter would search for, work them in *naturally* — don't keyword-stuff. One mention each, in context.
- **Fix the ATS-breaking formatting.** Tables, text boxes, headers/footers, columns, and fancy fonts can confuse ATS parsers. The AI will tell you which ones to remove.

The bullet-quantification step is the one most people fumble. There's a separate tool for that.

### Resume Bullet Writer — _Tier: Standard_

**What this feature is.** Resume Bullet Writer rewrites vague experience bullets — "Managed social media" — into impact bullets — "Grew LinkedIn followers 340% in 6 months, driving 42 qualified inbound leads" — using your actual details. You feed it the weak bullet plus any context you have, and it returns a tighter, results-led version.

**Why it matters.** The difference between a CV that gets interviews and one that doesn't is the bullets — specifically whether they show impact in numbers. Most candidates know their bullets are weak but freeze when asked to rewrite them. This tool unsticks that, transforming average CVs into ones that actually generate interviews.

**How to use it.**

1. Inside CV Review, when a bullet gets flagged as weak, look for the **Rewrite this bullet** action — that opens Bullet Writer with the bullet pre-loaded.
2. Add any extra context the AI doesn't have (the actual numbers, the team size, the specific outcome). The more truth you give it, the better the rewrite.
3. Pick from the suggested rewrites, or use one as a starting point and edit. Paste the final version back into your CV.
4. Repeat for every weak bullet in the same review pass — don't switch contexts back and forth.

![[13-raw/screenshots/i-ch06-bullet-writer-before-after.png]]

You can also call Bullet Writer directly from My CVs without going through Review, but pairing the two is faster.

## Step 4 — Re-run the review

After you've made changes, run CV Review *again* on the same CV. Two reasons:

1. To confirm the issues you fixed are actually gone
2. To catch any new issues introduced by your edits (it happens — a rewritten summary can introduce new problems)

You're done when the review either shows no major issues or only flags things you've made a deliberate decision to leave as they are.

## How often to re-run CV Review

- **Always** after a major rewrite
- **Always** before tailoring a CV for a specific application (Chapter 11)
- **Periodically** as your experience grows — every few months, or after you've added a new role

You don't need to run it every week. Once your CV is in good shape, leave it alone until something material changes.

## What CV Review *doesn't* do

Be aware of the limits:

- It doesn't know your industry's nuances. A great CV in academia looks different from a great CV in advertising. Take its formatting advice with that in mind.
- It doesn't know which of your bullet points are most impressive *for the role you want*. That's your judgement call.
- It doesn't replace a human reviewer. If you have someone in your network who hires for the kind of role you're going after, ask them to look at the CV too. AI feedback plus a human eye is much better than either alone.
- It can't fix a thin CV. If you genuinely don't have enough experience or relevant skills, the issue isn't your CV — it's your underlying profile. Skip ahead to Chapter 17 ("I'm not getting responses") and Chapter 19 ("I need to level up") for that conversation.

## Troubleshooting

| Problem | What to do |
|---------|------------|
| Review didn't pick up changes I made | Re-save the CV in My CVs first, then re-run |
| Review keeps suggesting the same thing I already addressed | Re-read your edit — the AI may be right that the underlying problem isn't fully fixed |
| Review feels generic / unhelpful | Try running it on a single specific CV version rather than your "kitchen sink" master |
| Review flags ATS issues I don't know how to fix | Switch to a CV Templates layout (Chapter 5), which is built ATS-friendly by default |

## Checklist

- [ ] Ran CV Review on at least one CV
- [ ] Read the feedback properly, end to end
- [ ] Made at least three substantive edits based on the feedback
- [ ] Used Bullet Writer to rewrite at least two weak bullets
- [ ] Re-ran the review and confirmed the issues are addressed
- [ ] You feel comfortable that your CV would survive a 15-second recruiter scan

## Features covered in this chapter

| # | Feature | Tier |
|---|---------|------|
| 1 | AI CV Review | Metered — Standard: 3/mo · Premium: unlimited |
| 2 | Resume Bullet Writer | Standard |

## Next chapter

[[01 How-To Documents/individual/07-skills-credentials-video|Chapter 7 — Adding skills, credentials, and a video intro]]

## References

- [[02-concepts/ai-features]] — AI capabilities
- [[01 How-To Documents/individual/05-uploading-a-cv|Chapter 5]] — Where your CV came from
