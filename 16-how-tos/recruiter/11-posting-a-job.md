---
title: "Chapter 11 — Posting a job"
type: concept
created: 2026-04-09
updated: 2026-04-09
tags: [how-to, recruiter, jobs, posting, ai-jd-writer]
status: draft
user-types: [recruiter]
---

# Chapter 11 — Posting a job (with AI JD Writer)

Every placement starts with a job. A well-written job post attracts the right candidates and filters out the wrong ones; a sloppy one floods you with applications you have to manually reject. Sebenza Hub gives you a structured job creation flow plus the **AI JD Writer**, which generates a first draft from a brief if you give it one. This chapter walks through the full flow.

## Where it lives

`/dashboard/recruiter/jobs` — the master list of every job in your agency. Click **+ New job** to create one. The AI JD Writer lives at `/dashboard/recruiter/ai-writer` and can also be invoked from inside the new-job form.

## Before you click "New job"

Have these things in front of you:

- **Which client this job is for.** You added clients in Chapter 8 — pick the right one. If it's a direct hire for your own agency, use your placeholder "Internal Hires" client.
- **A brief from the client.** Even a one-paragraph email like "we need a senior backend dev, R900k–R1.1m, hybrid Cape Town, must have Postgres" is enough for the AI JD Writer.
- **The fee structure** for this engagement (Chapter 9). The platform calculates estimated fee from this — getting it right matters for your KPI Dashboard.

## Step 1 — Pick the client and basics

The job creation form starts with the linkages and the headline information:

| Field | What to put |
|---|---|
| **Client** | The corporate client this role is for. Required. |
| **Job title** | The exact title that will appear to candidates. Match the title the client uses internally — recruiters often invent shinier titles, but candidates filter on what they search for. |
| **Reference number** | Auto-generated, but you can override if you have your own numbering scheme. |
| **Status** | Defaults to *draft*. You'll publish later. |

The status enum: **draft** (not visible) → **active** (published, accepting applications) → **on_hold** (paused) → **closed** (no longer accepting) → **archived** (hidden from search). You'll mostly toggle between draft → active → closed.

## Step 2 — Use the AI JD Writer (recommended)

Inside the new-job form there's a **Generate with AI** button. Click it and paste your client brief.

The AI JD Writer takes your brief and generates a structured first draft of:

- The role description (responsibilities, what they'll do)
- Required skills (must-have)
- Nice-to-have skills
- Required experience level
- Suggested salary range (based on market data for similar roles in similar locations)
- A first-pass set of screening knockout questions

The output appears in the form fields and you can edit anything you want. **Always edit it.** The AI is good at structure and bad at company-specific nuance — your client knows their team and culture, and the AI doesn't.

The AI JD Writer is metered (Chapter 4.5) — each generation counts against your AI quota for the month. Don't burn quota by regenerating endlessly. Generate once, edit by hand from there.

## Step 3 — Fill in the structured fields

The form is organised into sections that map to the JSONB fields stored on the job record. Fill in what's relevant; skip what isn't.

### Core (required)

- **Description** — the body text of the job post. Aim for 300–600 words. Longer than 800 and candidates skim; shorter than 200 and they don't know what they're applying for.
- **Responsibilities** — bulleted list of what the person will actually do.
- **Requirements** — must-have qualifications, experience, certifications.
- **Nice-to-have** — preferred but not required.

### Compensation

- **Salary range** — minimum and maximum CTC (cost-to-company), in your currency.
- **Salary visibility** — show / hide / range only. Hidden salaries get fewer applications but better-matched ones.
- **Bonus structure** — signing bonus, performance bonus, commission.
- **Benefits** — medical aid, pension, leave allowance, etc.

### Role details

- **Employment type** — permanent / contract / contract-to-perm / internship.
- **Seniority level** — junior / intermediate / senior / lead / executive.
- **Location** — city, province, country.
- **Remote policy** — onsite / hybrid / fully remote. Hybrid jobs should specify days per week.
- **Department** — the team within the client company.

### Application

- **Application deadline** — when applications close. Optional; leave blank for rolling.
- **Application instructions** — anything special the candidate needs to do.
- **Contact for queries** — usually you, the recruiter.

### Vetting (the screening configuration)

This section sets up screening at the job level. Chapter 15 covers it in full. At minimum:

- **Knockout questions** — yes/no questions that auto-reject if answered "no". Example: "Do you have at least 5 years of Postgres experience?"
- **Screening chatbot** — flip on if you want the AI chatbot to do an initial conversational screen.
- **Assessment bundle** — competency tests to send (optional).
- **WhatsApp Apply** — flip on to let candidates apply via WhatsApp (Chapter 24).

### Compliance

- **B-BBEE preference** — if the role has EE targets, set them here. Used for diversity analytics.
- **EE category** — the Employment Equity occupational level for this role.

### Branding

- **Use client branding** — shows the client logo and colours on the public job post.
- **Use agency branding** — shows your agency branding (default for confidential searches).

## Step 4 — Configure publication channels

Once the job is filled in, decide where it gets published:

- **Sebenza Hub job board** — visible to all Individuals on the platform. Free, included in your plan.
- **Career site** — published to your branded careers page (Chapter 29) automatically.
- **External job boards** — Pnet, CareerJunction, Adzuna. Each board has its own configuration in Job Board Integrations (Chapter 29). Some boards charge per posting; see your billing page.
- **LinkedIn** — if you have the LinkedIn integration enabled.

Multi-board distribution happens automatically once you flip the relevant toggles.

## Step 5 — Save as draft, then publish

Always save as draft first, preview the public-facing version, then publish. The preview shows you what a candidate will actually see — typos and weird formatting jump out instantly.

When you're ready, click **Publish**. The status flips to **active**, the published timestamp is recorded, and the job appears on every channel you selected.

## A note on job posts as metered features

Each plan tier caps how many **active** jobs you can have at once (Chapter 4.5):

- **Free tier:** 3 active jobs
- **Standard:** higher cap (visible in your billing page)
- **Premium:** higher still

If you hit the cap, you'll be blocked from publishing new jobs until you close existing ones, archive completed roles, or upgrade. Plan ahead — don't get caught on a Friday afternoon trying to post an urgent role with a full pipeline.

## Pro tips

- **One job per role.** Don't combine "Senior Dev OR Tech Lead" into one post — it confuses the matching algorithm and the candidates. Two posts.
- **Salary visibility increases application quality.** Hidden salaries get more applications but more mismatched ones. Visible ranges filter out anyone whose expectations don't fit.
- **Knockout questions save you hours.** A single well-chosen knockout (e.g. "Do you have a valid SA work permit?") rejects 30%+ of unqualified applications before they even reach your inbox.
- **Edit the AI draft.** AI-generated descriptions are spotted instantly by experienced candidates and look generic. Twenty minutes of editing makes the post feel real.
- **Re-publish refreshed jobs every 30 days.** Old jobs sink in search rankings. If a role is taking longer than 30 days, archive and re-post with a refreshed description.

## Checklist

- [ ] You've linked the job to the right client
- [ ] You've used the AI JD Writer for a first draft and then edited it
- [ ] You've set salary range and visibility deliberately
- [ ] You've added at least one knockout question
- [ ] You've previewed the public-facing version before publishing
- [ ] You've published to the right channels (job board, career site, external boards)
- [ ] You're aware of your plan's active-job limit and not at the cap

## Next chapter

[[16-how-tos/recruiter/12-sourcing-channels|Chapter 12 — Sourcing channels: AI Search, Talent Discovery, Sourcing]]

## References

- [[02-concepts/ai-features]] — AI JD Writer capabilities
- [[02-concepts/application-lifecycle]] — Status enum and pipeline stages
- [[16-how-tos/recruiter/12-sourcing-channels|Chapter 12 — Sourcing channels]]
- [[16-how-tos/recruiter/15-screening-config|Chapter 15 — Screening configuration at the job level]]
- [[16-how-tos/recruiter/04.5-how-we-charge|Chapter 4.5 — How Sebenza Hub charges you]]
