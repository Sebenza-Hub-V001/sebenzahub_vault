---
title: "Chapter 5 — Uploading or building a CV"
type: concept
created: 2026-04-09
updated: 2026-04-28
tags: [how-to, individual, cv, profile, resume-upload, ai-parsing, skill-inference, soft-skills, cv-builder, templates, signatures, cv-insights, batch-tailor, job-radar, interview-prep, sa-readiness]
status: active
user-types: [individual]
---

# Chapter 5 — Uploading or building a CV

Your CV is the single most important thing on your profile. Sebenza Hub does not replace it with the platform's profile fields — it works *alongside* it. Recruiters look at both. Some employers will only ever read the CV file itself. So before you do anything else in Part 2, you need a CV in the system.

This chapter walks you through six features that work together the moment you put a CV into the platform: the upload itself, the parser that reads it, the skill inference that fills in what you left out, the soft-skills detection that adds what you can't articulate yourself, the in-app CV Builder for designing the look, and the profile record that all of it flows into.

## A word on your profile before we start

Everything in this chapter writes into your Profile — the core record Sebenza Hub keeps about you.

### Profile Management — _Tier: see Pricing_

**What this feature is.** Your profile is the home-base record holding your personal details, contact info, role preferences, documents, and privacy settings. It's not a separate thing you set up once and forget — every feature downstream of this chapter (matching, search, applications, AI tools) reads from it.

**Why it matters.** Without a complete profile, nothing else on the platform works. Recruiters can't find you. The AI has nothing to reason over. Applications go out half-filled. This is why profile editing is free on every plan — the cost of a half-complete profile is borne by you in missed roles, not by Sebenza Hub.

**How to use it.** You already filled in the basics during onboarding (Chapter 3). You'll revisit your Profile at [https://www.sebenzahub.co.za/dashboard/individual/profile](https://www.sebenzahub.co.za/dashboard/individual/profile) throughout your time on the platform — whenever you change phone number, move cities, finish a qualification, or shift what kind of role you're chasing. For this chapter you don't need to do anything in Profile directly — uploading a CV (and confirming the overwrite prompt) populates most of what's missing automatically.

## Decide which route you're on

Pick one:

| If… | Take this route |
|-----|-----------------|
| You already have a recent CV in PDF or Word format | **Upload route** (Step 1A) |
| You have an old CV that's badly out of date | **Upload route, then heavily edit in My CVs** |
| You don't have a CV at all | **Build route** (Step 1B) |
| Your CV is in a format you're embarrassed by | **Upload route, then redesign it in CV Builder** |

Both routes take 10–20 minutes. The build route takes longer but produces a more polished result. The upload route is faster and lets the AI parser populate your profile fields automatically.

## The My CVs page at a glance

Open **My CVs**: [https://www.sebenzahub.co.za/dashboard/individual/cvs](https://www.sebenzahub.co.za/dashboard/individual/cvs)

Whichever route you take below, you'll land here either before or after. The page is a hub, not just a list — it shows stats across all your CVs and gives you AI tools that work *over* the CVs you've already saved:

- **Stat cards** — Total CVs, Default CV, average completeness across all CVs, and when any of them was last updated. A quick way to spot a stale CV before a recruiter does.
- **Toolbar** — five entry points across the top:
  - **Upload Resume** — opens [Resume Upload](https://www.sebenzahub.co.za/dashboard/individual/resume-upload) (Step 1A below)
  - **Build CV** — opens an in-page wizard to create a CV from scratch (Step 1B below)
  - **Insights** — analytics dialog covering section completeness, skills distribution, experience timeline, and AI improvement suggestions (Step 4)
  - **Batch Tailor** — generates up to five tailored CV variants in one go from a list of job titles and descriptions (Step 4)
  - **Job Radar** — scans active jobs in the system and ranks how well each one matches a specific CV (Step 4)
- **CV cards** — every saved CV shown with a circular completeness score, key facts, and a per-card menu (the three-dot icon) containing **Interview Prep**, **SA Readiness**, **Version History**, **Job Radar** for that CV, **Duplicate**, and **Delete**.

Steps 1–3 below get a CV into the system. Step 4 is where the hub features earn their place.

## Step 1A — Upload an existing CV

### Resume Upload — _Tier: see Pricing_

**What this feature is.** Resume Upload lets you drop an existing PDF or Word CV straight into your profile. The file is stored, indexed, and used as source material for everything downstream — parsing, matching, AI review, applications.

**Why it matters.** Most South African job seekers already have a CV on their phone or hard drive. Forcing you to retype it by hand would kill the session. Upload is free on every plan so that even a casual first-time visitor can get real value within 30 seconds of landing on the platform.

**How to use it.**

1. Open **Resume Upload**: [https://www.sebenzahub.co.za/dashboard/individual/resume-upload](https://www.sebenzahub.co.za/dashboard/individual/resume-upload)
2. Click **Upload New Resume**. Before the file picker opens, the platform asks: *"Replace profile information?"* This is important — read the next paragraph before answering.
3. Drag and drop your CV file, or click to browse. PDF, DOC and DOCX formats are supported.

![[ch05-resume-upload-dialog.png]]

4. Watch the progress bar. Parsing happens asynchronously: the file is uploaded to a queue, the AI parser picks it up, and the page polls for status every couple of seconds. The status messaging walks you through the phases — drafting, validating, scoring, finalising — so you can see the work in flight rather than staring at a silent spinner. Most CVs finish in 30–60 seconds; very long CVs can take a minute or two.

**The "Replace profile?" prompt.** The default answer is *Yes, replace my profile* — and that's the right answer if your uploaded CV is a true reflection of who you are right now. The platform will delete your existing work experience, education and skills entries and rebuild them from the CV. If you've already entered partial data during onboarding and the CV doesn't include something you typed in (a side project, a recent qualification), choose *No, keep my current profile* — the platform will still parse the CV and store it, but your profile fields stay untouched. You can mix and match later inside Profile.

**Re-uploading the same file is fast.** The platform recognises the file by content hash and reuses the previous AI analysis instead of re-running the parse. If the parser has improved since your last upload, you'll see updated results the next time the underlying analysis is refreshed.

Once the file lands and parsing completes, three AI features fire automatically — you don't start them, they start themselves. The next three sections describe what they do while you watch the progress messages.

### AI Resume Parsing — _Tier: see Pricing_

**What this feature is.** AI Resume Parsing takes your uploaded resume and extracts structured data — name, contact, experience, education, skills, certifications, languages, references — then pre-populates your profile fields with what it found. Everything downstream depends on this being clean.

**Why it matters.** Manual data entry is the single biggest reason users abandon onboarding. Parsing compresses a 30-minute setup into 30 seconds, and every AI feature that comes later — matching, screening, career coaching — depends on having structured data to reason over. A great CV in PDF form is useless to the matching engine until it's parsed into fields.

**How to use it.** It runs as soon as the upload completes. The PDF text extractor used to struggle with concatenated tokens (CVs that came back as "Strongcommunicationskills" because the original PDF had no whitespace markers) — the platform now reconstructs whitespace using positional layout data, so older PDFs parse much more cleanly than they did a few months ago. **Always review the parsed fields before continuing.** AI parsers are good but not perfect. Common mistakes to watch for:

- Job titles that combine two roles into one
- Dates parsed from a different format than yours expected
- Skills added too aggressively — things you only mentioned in passing
- Past employers misspelled or truncated

Accept the parts that are right. Edit the parts that are wrong *before* moving on. You will not get a second chance to do this cleanly — once parsed values are in your profile, fixing them later is more annoying than catching them now.

If you uploaded a CV months ago and the parsing was poor, the simplest fix is to re-upload the same file — the platform's parser improves over time, and a fresh upload runs against the current version.

### AI Skill Inference — _Tier: see Pricing_

**What this feature is.** Skill Inference reads the experience descriptions on your CV and infers the skills you never explicitly listed. "Managed a team of 8" becomes *leadership*, *performance management*, *coaching*. "Built and deployed a pricing model" becomes *Python*, *statistics*, *business modelling*. These skills get added to your profile as inferred (not self-declared).

**Why it matters.** Candidates systematically under-list their own skills — either because they assume the obvious ones don't count or because they can't name what they do. Inference surfaces the hidden strengths and lifts your match scores against jobs you'd otherwise never have appeared in. This is the single biggest reason your match scores will go up on Day 2 vs Day 1.

**How to use it.** It runs automatically after parsing. Open the **Skills** section of your profile after the upload completes. You'll see two groups: self-declared skills (the ones you typed in during onboarding) and inferred skills (the ones Sebenza Hub found in your CV text). Review the inferred ones — most will be correct, a few will be wrong or too generous. Remove anything you can't honestly back up in an interview. Leaving bad inferred skills on your profile is how you get matched into roles you'll fail at.

### Soft Skills Detection — _Tier: see Pricing_

**What this feature is.** Soft Skills Detection is a separate analysis that reads your CV content, self-descriptions, and any cover letter text to detect soft-skill signals — communication, collaboration, initiative, resilience, adaptability. It produces a soft-skills profile that sits alongside your technical skills.

**Why it matters.** South African recruiters increasingly screen for culture fit, and most candidates describe their soft skills badly or not at all. Detection evens the playing field — introverts, non-native English speakers, and people who find self-promotion uncomfortable don't lose roles on writing skill alone. The soft-skills profile is what recruiters see in the "beyond the CV" section of your record.

**How to use it.** Like skill inference, it runs automatically — but only if you're on Premium. On Standard you get parsed fields and inferred skills; soft-skills detection is the upgrade trigger when you decide that interview-grade culture-fit signals are worth paying for. If you are on Premium, find the results under the **Soft Skills** tab of your profile after upload completes. Review them the same way — keep the accurate ones, remove anything you can't support with a concrete example.

## Step 1B — Build a CV from scratch (or redesign one you uploaded)

### CV Creation & Editing — _Tier: see Pricing_

**What this feature is.** The in-app CV Builder is two surfaces working in lockstep. **My CVs** ([https://www.sebenzahub.co.za/dashboard/individual/cvs](https://www.sebenzahub.co.za/dashboard/individual/cvs)) is where the *content* lives — sections, bullets, dates, skills. **CV Builder** ([https://www.sebenzahub.co.za/dashboard/individual/cv-templates](https://www.sebenzahub.co.za/dashboard/individual/cv-templates)) is where the *look* lives — template, layout, accent colours, fonts, density, export. Content stays in sync between the two: edit a bullet in My CVs and it appears in the Builder preview immediately.

**Why it matters.** Serious job seekers apply to 20–50 roles with different emphasis — a generalist CV underperforms a tailored one every time. The Free tier gives you one CV because that's all a casual visitor needs. The moment you find yourself rewriting your CV for a specific role, you've hit the natural upgrade trigger — Standard unlocks 5 versions, Premium goes unlimited.

**How to use it.**

1. Open **My CVs**: [https://www.sebenzahub.co.za/dashboard/individual/cvs](https://www.sebenzahub.co.za/dashboard/individual/cvs). Click **Build CV** in the toolbar across the top of the page. The wizard pops up — fill it in section by section: personal details, summary, work history, education, skills, certifications, languages, references. Most fields will already be pre-populated from onboarding and (if you uploaded a CV) from the parser. You're filling in the gaps.

![[ch05-cv-builder-personal-info.png]]

2. Save. The new CV appears as a card on the My CVs grid alongside any others.
3. Open the **CV Builder**: [https://www.sebenzahub.co.za/dashboard/individual/cv-templates](https://www.sebenzahub.co.za/dashboard/individual/cv-templates) — to design the look. The Builder has four tabs across the top:
   - **Gallery** — 5 polished templates (described below)
   - **Signatures** — 10 role-native layouts (described below)
   - **Content** — reorder sections, hide sections, control which fields are visible
   - **Favourites** — up to 5 saved looks you can reapply to any CV
4. Pick a Gallery template *or* a Signature, then refine it in the **Tweaks** bar (accent colour, secondary accent, font, density). The preview updates live.
5. Use the **Export** menu in the top-right when you're done: PDF (A4, recruiter-ready), DOCX (editable Word document), or Print.

#### Gallery — five polished templates

The Gallery tab is the safe choice. Five clean, ATS-friendly designs that work for almost any role. Pick the one that matches the kind of role you're going after, **not** the role you have today.

| Template | Layout | When to pick it |
|----------|--------|-----------------|
| **Professional** | Single column, dark grey header | Finance, legal, government, corporate roles where conservatism is a virtue |
| **Modern** | Two-column with skills sidebar | Tech, marketing, startups — anywhere a small visual lift helps |
| **Creative** | Single column with amber/orange gradient header | Design, advertising, media — roles where personality matters |
| **Minimalist** | Single column, typography-focused, maximum whitespace | Senior roles, consulting, anywhere "let the content speak" reads as confident |
| **Executive** | Single column, dark header with amber accents | Senior management, board appointments, leadership tracks |

#### Signatures — ten role-native layouts

The Signatures tab is for when a Gallery template feels too generic for the kind of work you do. Each Signature is a deliberately styled layout that mimics a document a hiring manager in that field already recognises. Use these when you want the format itself to signal that you understand the world you're applying into.

| Signature | Suited for | What makes it different |
|-----------|------------|-------------------------|
| **Boardroom Dossier** | Executive | Commanding, quiet dark-rail typography for senior leadership, board appointments, C-suite dossiers |
| **The Ledger** | Senior Finance / CA(SA) | Double-ruled financial styling with tabular numbers — reads like an audit document |
| **README.md Terminal** | Engineering / Specialist | IDE-inspired monospace layout for engineers and technical specialists who think in Markdown |
| **Gazette Record** | Government / DPSA | Government-gazette serif styling for public-service, municipal and DPSA applications |
| **Patient Chart** | Healthcare / Education | Clinical folder aesthetic for doctors, nurses, teachers and care professionals |
| **Safety Placard** | Trades | Hi-vis trade-card layout for artisans, electricians, plumbers and skilled trades |
| **Polaroid Lookbook** | Graduate / Early Creative | Cork-board polaroid spread for graduates and early-career creatives |
| **Till Receipt** | Retail / Hospitality | Receipt-style monospace layout for retail, hospitality and front-line services |
| **ID Card · Pictograms** | General Worker | ID-card plus pictogram abilities layout for general workers and operators |
| **Reference Booklet** | Domestic | Handwritten-feel booklet layout for domestic workers, drivers and childminders |

The Signatures are the biggest reason to spend ten minutes in CV Builder rather than emailing the same generic Word doc to every recruiter. A trades CV that looks like a hi-vis safety placard cuts through visual noise on a foreman's screen in a way no generic template will.

#### Tweaks — the look layer

Whichever template or signature you pick, the **Tweaks** bar lets you personalise the look without leaving the page:

- **Accent** and **secondary accent** — two hex colours that flow into the header gradient, section headings, and card borders
- **Font** — a small set of curated typefaces tuned for printing
- **Density** — tighten or loosen the spacing if your CV is one line short of a clean page break

Tweaks save automatically and follow the CV around, so the same CV always looks the same when you reopen it.

#### Favourites — save a look once, reuse it

If you build five tailored CVs for five role types, you don't want to reset the colours and font every time. Once you have a look you like, hit **Save look** in the Tweaks bar — it goes into the Favourites tab as a named preset (up to 5). Apply it to any other CV in one click. This is what makes per-role tailoring fast instead of fiddly.

#### Content tab — what's on the CV vs what's in the file

The Content tab controls which sections appear on the rendered CV and in what order. The 15 sections available are: Header & Contact, Summary, Work Experience, Education, Metrics & Impact, Skills, Certifications, Languages, References, Governance, Projects, Volunteering, Awards, Memberships, Courses, and Hobbies/Interests. The first three are required; the rest are optional and can be reordered or hidden per CV. Hiding here doesn't delete the data from your profile — it just keeps it off this particular CV file, so you can have a "compliance-heavy" CV and a "front-of-house" CV from the same underlying record.

#### Export

The **Export** menu (top-right of the Builder header) produces three outputs:

- **PDF** — A4, full-fidelity rendering. This is the file you attach to applications.
- **DOCX** — a real editable Word document with proper styling, not a rasterised PDF. Useful when a recruiter asks for "the Word version" or runs the CV through a customer's ATS that prefers Word input.
- **Print** — opens the browser print dialog for hard copies.

Filenames default to your CV title with spaces stripped, so save your CVs with names you'd be comfortable seeing land on a recruiter's desktop.

## Step 2 — Save with a clear filename

Once your CV is built or uploaded, give it a name in My CVs that you'll recognise three months from now:

- ✅ "Standard CV — 2026"
- ✅ "Senior PM — Cape Town"
- ✅ "Tech-focused — Modern template"
- ❌ "CV"
- ❌ "Resume final final v2"

My CVs keeps a version history per CV (every save, every AI rewrite, every duplicate is a versioned snapshot you can restore from), so you can see older iterations of the same CV — but a clear name still saves you time when you're choosing which one to attach to an application.

## Step 3 — Create a second CV (paid tiers)

If you're applying to more than one type of role, create a second CV tailored to the second type. This is where the CV Creation & Editing metering kicks in — see Pricing for the exact CV count on each tier.

Example setup for a mid-career candidate with multiple CVs available:

- **CV 1** — your default, broad-coverage version
- **CV 2** — emphasises your individual contributor work, downplays management
- **CV 3** — emphasises team-building, strategy, hiring; downplays technical depth
- **CV 4** — same content, Gazette Record signature, trimmed of private-sector jargon
- **CV 5** — kept in reserve for that one role you really want

You don't have to do this on day one. But the moment you find yourself rewriting your CV for one specific application, save the rewrite as a new version instead of overwriting the original. My CVs is built for exactly this — duplicate any existing CV from its card menu, rename it, and you're editing a fresh copy with the original safe.

## Step 4 — Use the My CVs hub

Once you have at least one CV saved, the toolbar at the top of [My CVs](https://www.sebenzahub.co.za/dashboard/individual/cvs) becomes useful. The three features below work *over* the CVs you've already built — they don't replace Steps 1–3, they extend them.

### CV Insights — _Tier: see Pricing_

**What this feature is.** Insights is an analytics dialog that opens over your My CVs page when you click **Insights** in the toolbar. It shows four panels per selected CV: section completeness as a radar chart, skills distribution as a bar chart, your experience timeline, and AI-generated improvement suggestions.

**Why it matters.** A CV that *feels* complete and a CV the platform *measures* as complete are not always the same thing. Insights surfaces the gaps — a missing summary, a skills section that's all soft skills with no hard ones, a 7-year-old role with no bullets — before they cost you matches. The improvement suggestions tell you what to fix first.

**How to use it.** Click **Insights** in the toolbar. Pick a CV from the dropdown if you have more than one. Read the radar to see which sections are pulling your completeness down, glance at the skills bar to check the technical-vs-soft balance, and act on the top suggestion. This is a 2-minute health check, not a full review — for a deeper analysis, that's what [CV Review](https://www.sebenzahub.co.za/dashboard/individual/cv-review) (next chapter) is for.

### Batch Tailor — _Tier: see Pricing_

**What this feature is.** Batch Tailor generates up to five tailored CV variants in a single run. You give it a base CV and a list of target jobs (job title + a paste of the job description), and it produces a tailored "About Me" rewrite plus emphasis adjustments per job. Each variant is saved as a new CV in My CVs.

**Why it matters.** The single biggest determinant of an application's success is whether the CV is tailored to the role. Most candidates don't tailor because the per-application overhead feels too high. Batch Tailor inverts the economics — set up five tailorings once, walk away, and come back to five role-ready CVs sitting in your My CVs grid.

**How to use it.** Click **Batch Tailor** in the toolbar. Pick the source CV the variants should be derived from. For each target role (up to five), paste a job title and the relevant chunk of the job description. Run it. Each variant lands as a new CV — review and adjust before applying. **The variants are starting points, not finished CVs** — read them, fix the parts the AI got wrong, save. They count against your CV quota the same way any other CV does.

### Job Radar — _Tier: see Pricing_

**What this feature is.** Job Radar scans active job postings on the platform and ranks them by how well they match the CV you point it at. For each match it shows a percentage match score, the salary range (where available), the employment type, and which keywords in the job posting matched and which were missing from the CV.

**Why it matters.** Auto Match (Chapter 9) ranks jobs against your *profile*. Job Radar ranks them against a *specific CV* — useful when you have multiple tailored CVs and want to know which roles each one is strongest for. The missing-keyword list also tells you what to add to your CV to widen the match.

**How to use it.** Click **Job Radar** in the toolbar (or on a CV card's three-dot menu, to scope the radar to that specific CV). The Radar opens as a side panel listing matched jobs with score badges. Sort by score, scan the missing keywords, then either apply directly or take the keyword feedback back into Step 1B to tighten the CV.

### Per-CV actions

Each CV card on the grid has a three-dot menu (top-right of the card) with extra actions:

- **Interview Prep** — generates a tailored interview question kit (Behavioural, Technical, Situational, Culture Fit) for a specific job role you're applying for, using this CV as context. This is the fast pre-application kit — different from the full mock-session [Interview Simulator](https://www.sebenzahub.co.za/dashboard/individual/interview-simulator) covered in Chapter 14.
- **SA Readiness** — checks the CV against South African hiring conventions (POPIA-compliant personal info, B-BBEE / Employment Equity demographics, ID number formatting) and flags anything that's wrong or missing for the local market. Worth running once on each CV before you start applying.
- **Version History** — every save, every AI rewrite, every duplicate is a versioned snapshot. Open the history to compare versions and restore an older one if a recent edit went wrong.
- **Duplicate** — one-click copy of a CV. Use it before tailoring so the original stays untouched.
- **Job Radar (per-CV)** — same Radar as the toolbar version, but pre-scoped to this card's CV.

## What the platform does for you behind the scenes

Once a CV is saved and the AI features have run:

- The file becomes selectable when you apply to jobs (Chapter 12)
- Parsed fields populate your profile
- Inferred skills (and, on Premium, soft skills) feed into **Auto Match** (Chapter 9) to score job recommendations
- Both sets of skills power **CV Review** (Chapter 6), the next chapter
- The same structured data drives match scores and missing-skill lists on every application you submit from here on
- Every save is captured in version history, so you can always roll back

Skipping this chapter and going straight to job applications means none of those features have anything to work with.

## What you do *not* need to do yet

- **CV Review** — that's the next chapter, and it's much more useful once you've already uploaded something
- **Cover letters** — those are per-application (Chapter 12)
- **Tailoring per individual job** — overkill at this stage; that's also a Chapter 12 concern
- **Picking a Signature for every CV** — start with a Gallery template; you can always restyle later

## Checklist

- [ ] Uploaded an existing CV **or** created one in My CVs
- [ ] Decided whether to overwrite your profile from the CV (the prompt before upload)
- [ ] Reviewed the AI-parsed fields and corrected any mistakes
- [ ] Reviewed the inferred skills and removed anything you can't honestly back up
- [ ] Reviewed the detected soft skills the same way (paid tiers only)
- [ ] Opened CV Builder and chosen a Gallery template *or* a Signature
- [ ] Tweaked accent colour and font to taste
- [ ] Exported a PDF (and DOCX if you expect to be asked for it)
- [ ] Saved the CV with a clear filename you'll recognise later
- [ ] Optionally (paid tiers): created a second CV for a different type of role
- [ ] Optionally: ran **Insights** to spot completeness gaps
- [ ] Optionally: tried **Batch Tailor** if you're applying to multiple role types
- [ ] Optionally: ran **Job Radar** to see which active jobs match this CV
- [ ] Optionally: ran **SA Readiness** on each CV before you start applying

## Features covered in this chapter

| # | Feature |
|---|---------|
| 1 | Profile Management |
| 2 | CV Creation & Editing |
| 3 | Resume Upload |
| 4 | AI Resume Parsing |
| 5 | AI Skill Inference |
| 6 | Soft Skills Detection |
| 7 | CV Insights |
| 8 | Batch Tailor |
| 9 | Job Radar |
| 10 | Interview Prep (per-CV) |
| 11 | SA Readiness |

## Next chapter

[[01 How-To Documents/individual/06-cv-review|Chapter 6 — Running CV Review]]

## References

- [[03-workflows/individual-journey]] — Step 3 (Build Profile)
- [[01 How-To Documents/individual/06-cv-review|Chapter 6 — Running CV Review]]
