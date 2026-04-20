---
title: "Chapter 5 — Uploading or building a CV"
type: concept
created: 2026-04-09
updated: 2026-04-20
tags: [how-to, individual, cv, profile, resume-upload, ai-parsing, skill-inference, soft-skills]
status: active
user-types: [individual]
---

# Chapter 5 — Uploading or building a CV

Your CV is the single most important thing on your profile. Sebenza Hub does not replace it with the platform's profile fields — it works *alongside* it. Recruiters look at both. Some employers will only ever read the CV file itself. So before you do anything else in Part 2, you need a CV in the system.

This chapter walks you through six features that work together the moment you put a CV into the platform: the upload itself, the parser that reads it, the skill inference that fills in what you left out, the soft-skills detection that adds what you can't articulate yourself, the CV builder for when you don't have one, and the profile record that all of it flows into.

## A word on your profile before we start

Everything in this chapter writes into your Profile — the core record Sebenza Hub keeps about you.

### Profile Management — _Tier: Free_

**What this feature is.** Your profile is the home-base record holding your personal details, contact info, role preferences, documents, and privacy settings. It's not a separate thing you set up once and forget — every feature downstream of this chapter (matching, search, applications, AI tools) reads from it.

**Why it matters.** Without a complete profile, nothing else on the platform works. Recruiters can't find you. The AI has nothing to reason over. Applications go out half-filled. This is why profile editing is free on every plan — the cost of a half-complete profile is borne by you in missed roles, not by Sebenza Hub.

**How to use it.** You already filled in the basics during onboarding (Chapter 3). You'll revisit `/dashboard/individual/profile` throughout your time on the platform — whenever you change phone number, move cities, finish a qualification, or shift what kind of role you're chasing. For this chapter you don't need to do anything in Profile directly — uploading or building a CV populates most of what's missing automatically.

## Decide which route you're on

Pick one:

| If… | Take this route |
|-----|-----------------|
| You already have a recent CV in PDF or Word format | **Upload route** (Step 1A) |
| You have an old CV that's badly out of date | **Upload route, then heavily edit** |
| You don't have a CV at all | **Build route** (Step 1B) |
| Your CV is in a format you're embarrassed by | **Build route** — start fresh with a template |

Both routes take 10–20 minutes. The build route takes longer but produces a more polished result. The upload route is faster and lets the AI parser populate your profile fields automatically.

## Step 1A — Upload an existing CV

### Resume Upload — _Tier: Free_

**What this feature is.** Resume Upload lets you drop an existing PDF or Word CV straight into your profile. The file is stored, indexed, and used as source material for everything downstream — parsing, matching, AI review, applications.

**Why it matters.** Most South African job seekers already have a CV on their phone or hard drive. Forcing you to retype it by hand would kill the session. Upload is free on every plan so that even a casual first-time visitor can get real value within 30 seconds of landing on the platform.

**How to use it.**

1. Go to **Resume Upload** (`/dashboard/individual/resume-upload`).
2. Drag and drop your CV file, or click to browse. PDF and Word formats are supported.
3. Wait for the file to upload. You'll see a confirmation when it's stored.

![[13-raw/screenshots/ch05-resume-upload-dialog.png]]

As soon as the file lands, three AI features fire automatically — you don't start them, they start themselves. The next three sections describe what they do while you watch the progress spinner.

### AI Resume Parsing — _Tier: Standard_

**What this feature is.** AI Resume Parsing takes your uploaded resume and extracts structured data — name, contact, experience, education, skills, certifications — then pre-populates your profile fields with what it found. Everything downstream depends on this being clean.

**Why it matters.** Manual data entry is the single biggest reason users abandon onboarding. Parsing compresses a 30-minute setup into 30 seconds, and every AI feature that comes later — matching, screening, career coaching — depends on having structured data to reason over. A great CV in PDF form is useless to the matching engine until it's parsed into fields.

**How to use it.** After upload completes, the parser offers to populate your profile fields with what it found. **Always review the parsed fields before accepting them.** AI parsers are good but not perfect. Common mistakes to watch for:

- Job titles that combine two roles into one
- Dates parsed from a different format than yours expected
- Skills added too aggressively — things you only mentioned in passing
- Past employers misspelled or truncated

Accept the parts that are right. Edit the parts that are wrong *before* saving. You will not get a second chance to do this cleanly — once parsed values are in your profile, fixing them later is more annoying than catching them now.

### AI Skill Inference — _Tier: Standard_

**What this feature is.** Skill Inference reads the experience descriptions on your CV and infers the skills you never explicitly listed. "Managed a team of 8" becomes *leadership*, *performance management*, *coaching*. "Built and deployed a pricing model" becomes *Python*, *statistics*, *business modelling*. These skills get added to your profile as inferred (not self-declared).

**Why it matters.** Candidates systematically under-list their own skills — either because they assume the obvious ones don't count or because they can't name what they do. Inference surfaces the hidden strengths and lifts your match scores against jobs you'd otherwise never have appeared in. This is the single biggest reason your match scores will go up on Day 2 vs Day 1.

**How to use it.** It runs automatically after parsing. Open the **Skills** section of your profile after the upload completes. You'll see two groups: self-declared skills (the ones you typed in during onboarding) and inferred skills (the ones Sebenza Hub found in your CV text). Review the inferred ones — most will be correct, a few will be wrong or too generous. Remove anything you can't honestly back up in an interview. Leaving bad inferred skills on your profile is how you get matched into roles you'll fail at.

### Soft Skills Detection — _Tier: Standard_

**What this feature is.** Soft Skills Detection is a separate analysis that reads your CV content, self-descriptions, and any cover letter text to detect soft-skill signals — communication, collaboration, initiative, resilience, adaptability. It produces a soft-skills profile that sits alongside your technical skills.

**Why it matters.** South African recruiters increasingly screen for culture fit, and most candidates describe their soft skills badly or not at all. Detection evens the playing field — introverts, non-native English speakers, and people who find self-promotion uncomfortable don't lose roles on writing skill alone. The soft-skills profile is what recruiters see in the "beyond the CV" section of your record.

**How to use it.** Like skill inference, it runs automatically. Find the results under the **Soft Skills** tab of your profile after upload completes. Review them the same way — keep the accurate ones, remove anything you can't support with a concrete example.

## Step 1B — Build a CV from scratch

### CV Creation & Editing — _Tier: Metered — Free: 1 CV · Standard: 3 CVs · Premium: unlimited_

**What this feature is.** The in-app CV builder creates, edits, and stores multiple versions of your CV. Each version can be tailored for a different industry, role, or seniority level and exported to PDF or DOCX. You pick a template family, fill in the sections, and Sebenza Hub keeps every version under My CVs with version history.

**Why it matters.** Serious job seekers apply to 20–50 roles with different emphasis — a generalist CV underperforms a tailored one every time. The Free tier gives you one CV because that's all a casual visitor needs. The moment you find yourself rewriting your CV for a specific role, you've hit the natural upgrade trigger — Standard unlocks 3 versions, Premium goes unlimited.

**How to use it.**

1. Go to **CV Templates** (`/dashboard/individual/cv-templates`).
2. Browse the template library. There are five style families:
   - **Professional** — conservative, broadly applicable, safe choice for finance, legal, government
   - **Modern** — clean, slightly designed, good for tech, marketing, startups
   - **Creative** — visually distinctive, for design, advertising, media roles
   - **Minimalist** — sparse and elegant, lets the content speak
   - **Executive** — formal, leadership-oriented, for senior management roles
3. Pick a template that matches the kind of role you're going after, **not** the role you have today. If you're a developer applying to startups, pick Modern. If you're applying to law firms, pick Professional.
4. Click **Use this template**. You'll be taken to **My CVs** (`/dashboard/individual/cvs`) with the template loaded as a new CV.
5. Fill in each section: personal details, summary, work history, education, skills, references. Most fields are pre-populated from the data you entered during onboarding — you're filling in the gaps.

![[13-raw/screenshots/ch05-cv-builder-personal-info.png]]

**Tips for content, not formatting:**

- **Lead each role with the result, not the responsibility.** "Increased customer retention by 18% through a quarterly check-in programme" beats "Responsible for customer retention."
- **Quantify whatever you can.** Numbers anchor claims. Even rough ones ("managed a team of 6", "handled R2m in monthly transactions") give recruiters something concrete.
- **Tailor the summary to the kind of role you want next.** This is the one section a recruiter is guaranteed to read.

## Step 2 — Save with a clear filename

Once your CV is built or uploaded, give it a name in My CVs that you'll recognise three months from now:

- ✅ "Standard CV — 2026"
- ✅ "Senior PM — Cape Town"
- ✅ "Tech-focused — Modern template"
- ❌ "CV"
- ❌ "Resume final final v2"

Sebenza Hub keeps version history, so you can see older iterations of the same CV — but a clear name still saves you time when you're choosing which one to attach to an application.

## Step 3 — Create a second CV (Standard and above)

If you're applying to more than one type of role, create a second CV tailored to the second type. This is where the CV Creation & Editing metering kicks in: Free stops at 1, Standard gives you 3, Premium is unlimited.

Example setup for a mid-career candidate on Standard:

- **CV 1: Standard** — your default, broad-coverage version
- **CV 2: Senior IC** — emphasises your individual contributor work, downplays management
- **CV 3: People Lead** — emphasises team-building, strategy, hiring; downplays technical depth

You don't have to do this on day one. But the moment you find yourself rewriting your CV for one specific application, save the rewrite as a new version instead of overwriting the original. My CVs is built for exactly this.

## What the platform does for you behind the scenes

Once a CV is saved and the three AI features have run:

- The file becomes selectable when you apply to jobs (Chapter 11)
- Parsed fields populate your profile
- Inferred skills and soft-skills feed into **Auto Match** (Chapter 9) to score job recommendations
- Both sets of skills power **CV Review** (Chapter 6), the next chapter
- The same structured data drives match scores and missing-skill lists on every application you submit from here on

Skipping this chapter and going straight to job applications means none of those features have anything to work with.

## What you do *not* need to do yet

- **CV Review** — that's the next chapter, and it's much more useful once you've already uploaded something
- **Cover letters** — those are per-application (Chapter 11)
- **Tailoring per individual job** — overkill at this stage; that's also a Chapter 11 concern

## Checklist

- [ ] Uploaded an existing CV **or** built one from a template
- [ ] Reviewed the AI-parsed fields and corrected any mistakes
- [ ] Reviewed the inferred skills and removed anything you can't honestly back up
- [ ] Reviewed the detected soft skills the same way
- [ ] Saved the CV with a clear filename you'll recognise later
- [ ] Optionally (Standard and above): created a second CV for a different type of role

## Features covered in this chapter

| # | Feature | Tier |
|---|---------|------|
| 1 | Profile Management | Free |
| 2 | CV Creation & Editing | Metered — Free: 1 · Standard: 3 · Premium: unlimited |
| 3 | Resume Upload | Free |
| 4 | AI Resume Parsing | Standard |
| 5 | AI Skill Inference | Standard |
| 6 | Soft Skills Detection | Standard |

## Next chapter

[[01 How-To Documents/individual/06-cv-review|Chapter 6 — Running CV Review]]

## References

- [[03-workflows/individual-journey]] — Step 3 (Build Profile)
- [[01 How-To Documents/individual/06-cv-review|Chapter 6 — Running CV Review]]
