---
title: "Chapter 6 — Running CV Review"
type: concept
created: 2026-04-09
updated: 2026-04-25
tags: [how-to, individual, cv, ai, cv-review, ats, bullet-writer, recruiter-lens, action-plan]
status: active
user-types: [individual]
---

# Chapter 6 — Running CV Review

You have a CV in the system. Before you start applying to jobs, run it through CV Review. This is the first AI feature you should use, and it's also one of the highest-value: most CVs get rejected in seconds because of fixable problems, and CV Review surfaces those problems before a recruiter ever sees them.

Plan on about 30 minutes the first time — most of that spent acting on the feedback, which is the point.

![[13-raw/screenshots/i-ch06-cv-review-nav.png]]

## What CV Review actually is

CV Review is not a single AI run. It's a **dashboard of fourteen analyses** that each look at your CV through a different lens — recruiter, ATS scanner, hiring manager, bias detector, interview coach. You run the ones that matter to you, in any order, and read the results in tabs that all sit in the same page.

The fourteen lenses are:

| # | Tab | What it does |
|---|-----|-------------|
| 1 | **Overview** | Section-by-section scoring (summary, experience, education, skills) with quick-win suggestions and a single overall score |
| 2 | **ATS Scanner** | Simulates an Applicant Tracking System parse — flags formatting that breaks parsers, missing sections, keyword density |
| 3 | **Keywords** | Compares your CV against role keywords for your target role; ranks each as critical, important, or nice-to-have |
| 4 | **Achievements** | Identifies vague responsibility-statements and rewrites them as quantified impact bullets, with example metrics |
| 5 | **Red Flags** | Surfaces what a sceptical recruiter notices: employment gaps, inconsistencies, length issues, common mistakes |
| 6 | **Readability** | Scores how easily a recruiter can absorb the CV in a 6–15 second scan |
| 7 | **Benchmark** | Compares your CV against industry averages and top performers in your target role; estimates salary impact |
| 8 | **Before/After** | Shows weak passages from your current CV next to AI-generated rewrites you can paste straight in |
| 9 | **Recruiter Lens** | The six-second pile decision — would a recruiter strong-yes, strong-no, or maybe this CV, and why |
| 10 | **JD Match** | Paste a real job description; see exactly which JD keywords your CV does and doesn't hit |
| 11 | **Action Plan** | A weekly schedule of fixes with projected score gains — what to do this week, next week, week three |
| 12 | **Narrative** | Scores the *story* the CV tells about your career path — does it look intentional or scattered? |
| 13 | **Bias Shield** | Detects content that might trigger unconscious bias (age, gender, language) and suggests neutral phrasings |
| 14 | **Interview Prep** | Predicts the questions a recruiter will ask based on what's on your CV; flags weak spots before the interview |

A **History** tab tracks every review run so you can see your score climb over time and confirm that yesterday's rewrites actually moved the needle.

## Step 1 — Open the dashboard and pick the CV

### AI CV Review — _Tier: Metered — Standard: 10/mo · Premium: 50/mo_

**What this feature is.** AI CV Review is the multi-lens scoring suite above. Each tab is a separate AI call against your CV — they share results but you only spend a credit on the tabs you actually run. Each run produces structured feedback you can act on directly inside the page.

**Why it matters.** Most candidates rewrite their CV before every senior application, and the metering matches that cadence. A focused rewrite cycle is usually 3–5 review runs across different tabs — Standard's 10/month covers two full rewrite passes per month, Premium's 50/month covers people who tailor a fresh CV per application.

**How to use it.**

1. Go to **CV Review** (`/dashboard/individual/cv-review`).
2. Pick the CV you want reviewed from the dropdown. If you have more than one CV from Chapter 5, start with your default.
3. Type in your **target role** (e.g. *Senior Product Manager*) and **target industry** (e.g. *FinTech*). A few of the tabs — Keywords, Benchmark, JD Match — won't do anything useful without these. Start with them filled in.
4. Click **Run Overview** to generate the baseline section-by-section score. The AI takes about 30 seconds to a minute. The Overview tab populates first; the score ring at the top of the page shows your overall number.
5. From there, click into any of the other 13 tabs. Each one runs its own analysis on demand — you don't pay for analyses you don't open.

![[13-raw/screenshots/i-ch06-cv-review-select-dialog.png]]

Free tier users can't run the review at all — the upgrade prompt appears when you click Run.

## Step 2 — Read the Overview properly

The instinct most people have when they see AI feedback is to skim, feel mildly attacked, and close the tab. Don't do that. Read the feedback the way you'd read notes from a friend in HR who already gets paid to do this: assume the criticism is right unless you have a specific reason to disagree.

![[13-raw/screenshots/i-ch06-cv-review-score-card.png]]

The Overview tab leads with **Quick Wins** — a small list of changes you can make in 30 seconds that move the score immediately. Do those first. Then work through the per-section scores. For each piece of feedback, ask:

1. **Is the criticism accurate?** Re-read the bullet point or section it's flagging. Does the problem actually exist?
2. **Is the suggested fix the right fix?** Sometimes the AI proposes a specific rewrite. Sometimes you'll have a better one. Use whichever is stronger.
3. **Can I act on it now?** Most fixes are 30 seconds of editing. Do them while the feedback is in front of you.

## Step 3 — Run the lenses that matter for your situation

You don't need to run all fourteen tabs every time. Pick the ones that match what you're trying to fix:

| Situation | Tabs to prioritise |
|-----------|-------------------|
| Your CV is being rejected silently and you suspect ATS issues | **ATS Scanner**, **Keywords**, **Readability** |
| You have the experience but the bullets read flat | **Achievements**, **Before/After**, **Narrative** |
| You're applying to a specific job and want to tailor | **JD Match**, **Keywords**, **Recruiter Lens** |
| You're at a senior level and worried about how the CV reads at a glance | **Recruiter Lens**, **Narrative**, **Benchmark** |
| You suspect you're being filtered out at first glance | **Recruiter Lens**, **Bias Shield**, **Red Flags** |
| You have interviews coming up | **Interview Prep**, **Red Flags**, **Achievements** |
| You don't know where to start | **Overview** → **Action Plan** (it tells you what to do for the next three weeks) |

The **Action Plan** tab is the one to bookmark. It takes your overview score and turns it into a weekly schedule of fixes with projected gains — week 1 these tasks, week 2 those, expected score after each week. It's the closest thing to a coach the platform has for CV work.

## Step 4 — Make the changes

Open My CVs in another tab (or the CV Builder if you want the live preview). Edit the CV directly. Common changes you'll make:

- **Tighten the summary.** The AI will almost always tell you your summary is generic. It probably is. Rewrite it to say *what role you want* and *one specific reason you're a good fit*.
- **Quantify bullet points.** Where you wrote "Managed customer support team," add the team size, the volume of tickets, or the metric you owned. If you don't remember the exact number, use a defensible estimate.
- **Add missing keywords.** If the Keywords tab says your CV is missing terms a recruiter would search for, work them in *naturally* — don't keyword-stuff. One mention each, in context.
- **Fix the ATS-breaking formatting.** Tables, text boxes, headers/footers, columns, and fancy fonts can confuse ATS parsers. The ATS Scanner tab will tell you exactly which to remove. The Gallery and most Signatures in CV Builder are ATS-friendly by default — switching template often fixes a cluster of issues at once.
- **Neutralise bias triggers.** If Bias Shield flags age-disclosing language ("over 20 years' experience"), school-elite signals, or gendered phrasings, swap to the suggested neutral version.

The bullet-quantification step is the one most people fumble. There's a separate tool for that.

### Resume Bullet Writer — _Tier: Standard_

**What this feature is.** Resume Bullet Writer rewrites vague experience bullets — "Managed social media" — into impact bullets — "Grew LinkedIn followers 340% in 6 months, driving 42 qualified inbound leads" — using your actual details. You feed it the weak bullet plus any context you have, and it returns a tighter, results-led version.

**Why it matters.** The difference between a CV that gets interviews and one that doesn't is the bullets — specifically whether they show impact in numbers. Most candidates know their bullets are weak but freeze when asked to rewrite them. This tool unsticks that, transforming average CVs into ones that actually generate interviews.

**How to use it.**

1. The fastest path is the **Before/After** tab in CV Review — it pre-loads the bullets it identified as weak and proposes rewrites side-by-side. Pick the rewrites you like, copy them out.
2. For one-off bullets, open Bullet Writer directly from the **Coaching** area of your dashboard. Paste the weak bullet, add any extra context the AI doesn't have (the actual numbers, the team size, the specific outcome). The more truth you give it, the better the rewrite.
3. Pick from the suggested rewrites, or use one as a starting point and edit. Paste the final version into your CV in My CVs.
4. Repeat for every weak bullet in the same review pass — don't switch contexts back and forth.

![[13-raw/screenshots/i-ch06-bullet-writer-before-after.png]]

## Step 5 — Re-run the review

After you've made changes, run the **Overview** again on the same CV. Two reasons:

1. To confirm the issues you fixed are actually gone
2. To catch any new issues introduced by your edits (it happens — a rewritten summary can introduce new problems)

The **History** tab keeps the full timeline of your runs, so you can confirm your score actually went from 62 → 78 → 88 across three rewrites and not just feel like it did.

You're done when the review either shows no major issues or only flags things you've made a deliberate decision to leave as they are.

## How often to re-run CV Review

- **Always** after a major rewrite
- **Always** before tailoring a CV for a specific application — pair the JD Match tab with a duplicate of your default CV (Chapter 11)
- **Periodically** as your experience grows — every few months, or after you've added a new role
- **Once before any interview** — Interview Prep is most valuable when the recruiter call is in two days, not two months

You don't need to run every tab every week. Once your CV is in good shape, leave it alone until something material changes.

## What CV Review *doesn't* do

Be aware of the limits:

- It doesn't know your industry's nuances at the level a senior practitioner would. A great CV in academia looks different from a great CV in advertising. Take its formatting advice with that in mind, and treat the Benchmark tab as a guide, not gospel.
- It doesn't know which of your bullet points are most impressive *for the role you want*. That's your judgement call.
- It doesn't replace a human reviewer. If you have someone in your network who hires for the kind of role you're going after, ask them to look at the CV too. AI feedback plus a human eye is much better than either alone.
- It can't fix a thin CV. If you genuinely don't have enough experience or relevant skills, the issue isn't your CV — it's your underlying profile. Skip ahead to Chapter 17 ("I'm not getting responses") and Chapter 19 ("I need to level up") for that conversation.

## Troubleshooting

| Problem | What to do |
|---------|------------|
| Review didn't pick up changes I made | Re-save the CV in My CVs first, then re-run the Overview |
| Review keeps suggesting the same thing I already addressed | Re-read your edit — the AI may be right that the underlying problem isn't fully fixed |
| Review feels generic / unhelpful | Make sure target role and target industry are filled in — most tabs are noticeably better with them |
| Review flags ATS issues I don't know how to fix | Switch to a Gallery or Signature layout in CV Builder (Chapter 5) — they're ATS-friendly by default |
| I'm out of monthly credits | Each tab is a separate run; you can spread a rewrite cycle across the start and end of the month, or upgrade to Premium for 50/month |
| Keywords / Benchmark / JD Match show empty results | These tabs need a target role + industry (Keywords, Benchmark) or a pasted JD (JD Match) before they have anything to analyse |

## Checklist

- [ ] Ran the Overview tab on at least one CV
- [ ] Read the feedback properly, end to end
- [ ] Ran at least three of the specialised tabs (ATS, Keywords, Achievements, Recruiter Lens, etc.)
- [ ] Made at least three substantive edits based on the feedback
- [ ] Used Bullet Writer (or the Before/After tab) to rewrite at least two weak bullets
- [ ] Re-ran the Overview and confirmed the score moved
- [ ] Looked at the Action Plan tab to plan the next round of changes
- [ ] You feel comfortable that your CV would survive a 15-second recruiter scan

## Features covered in this chapter

| # | Feature | Tier |
|---|---------|------|
| 1 | AI CV Review | Metered — Standard: 10/mo · Premium: 50/mo |
| 2 | Resume Bullet Writer | Standard |

## Next chapter

[[01 How-To Documents/individual/07-skills-credentials-video|Chapter 7 — Adding skills, credentials, and a video intro]]

## References

- [[02-concepts/ai-features]] — AI capabilities
- [[01 How-To Documents/individual/05-uploading-a-cv|Chapter 5]] — Where your CV came from
