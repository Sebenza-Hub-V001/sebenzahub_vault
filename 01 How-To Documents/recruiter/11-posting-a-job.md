---
title: "Chapter 11 — Posting a job"
type: concept
created: 2026-04-09
updated: 2026-04-20
tags: [how-to, recruiter, jobs, posting, ai-jd-writer, bias-detection, compliance, salary-benchmark, seo, distribution, whatsapp, job-boards, ai-insights]
status: draft
user-types: [recruiter]
---

# Chapter 11 — Posting a job (with AI JD Writer)

Every placement starts with a job. A well-written job post attracts the right candidates and filters out the wrong ones; a sloppy one floods you with applications you have to manually reject. Sebenza Hub gives you a structured job creation flow plus the **AI JD Writer**, which generates a first draft from a brief if you give it one. This chapter walks through the full flow.

![[r-ch11-job-list-status.png]]

## Where it lives

[https://www.sebenzahub.co.za/dashboard/recruiter/jobs](https://www.sebenzahub.co.za/dashboard/recruiter/jobs) — the master list of every job in your agency. Click **+ New job** to create one. The AI JD Writer lives at [https://www.sebenzahub.co.za/dashboard/recruiter/ai-writer](https://www.sebenzahub.co.za/dashboard/recruiter/ai-writer) and can also be invoked from inside the new-job form.

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

## Step 2 — Write the JD with AI

Inside the new-job form there's a **Generate with AI** button. Click it and paste your client brief. Four AI features work together at this stage — one to generate the whole thing, one to write the company description, one to surgically rewrite specific sections, and one to swap tone.

### AI JD Generator — _Tier: Standard_

**What this feature is.** AI JD Generator produces a complete first-draft job description from a role title, seniority, and a short brief. It outputs the role summary, responsibilities, must-have requirements, nice-to-haves, suggested salary range, and a first set of screening knockout questions — all in inclusive phrasing with bias detection running in the background.

**Why it matters.** Writing a JD from scratch takes 45–60 minutes. Generation takes 60 seconds. That's 10 hours a week back per recruiter, plus a higher-quality baseline JD than most teams write under time pressure on a Friday afternoon.

**How to use it.**

1. In the new-job form, click **Generate with AI**.
2. Paste the client brief (one paragraph is enough — title, seniority, must-haves, salary band, location).
3. The output drops into the form fields. **Always edit.** The AI is good at structure and weak on company-specific nuance — your client knows their team and culture, and the AI doesn't.
4. The generator is metered (Chapter 4.5) — don't burn quota by regenerating from scratch endlessly. Generate once, then use the section regenerator below for surgical fixes.

![[r-ch11-ai-jd-generator-output.png]]

### AI Company Description — _Tier: Standard_

**What this feature is.** AI Company Description scrapes the client's website URL and generates a fresh "About the company" block for the JD — current copy, not the 2019 mission statement everyone copy-pastes.

**Why it matters.** "About the company" sections are the most stale part of every JD on the market. AI generation produces current, compelling copy in seconds, which is a material uplift to application quality — especially for clients whose own websites haven't been touched in two years.

**How to use it.** In the JD form, paste the client URL into the **About the company** block and click **Generate**. Edit until it sounds like the client, not like marketing copy.

### JD Section Regenerator — _Tier: Standard_

**What this feature is.** JD Section Regenerator regenerates a single section of the JD — summary, responsibilities, requirements, or benefits — without touching the rest. You keep the parts that are good and iterate the parts that aren't.

**Why it matters.** Full regeneration loses the bits that were already right. Section-level control lets you iterate to a strong JD in five minutes instead of starting over three times. It's also how you keep AI quota consumption low — regenerating one block costs a fraction of a full generation.

**How to use it.** Hover over any section header in the JD form and click the small **Regenerate** icon. Optionally add a short prompt ("make this more senior", "add more emphasis on collaboration"). The section refreshes; everything else stays.

### JD Tone Rewriter — _Tier: Standard_

**What this feature is.** JD Tone Rewriter rewrites the JD in a different tone — formal, casual, inclusive, startup-y — while preserving the underlying requirements. The skills, salary, and qualifications stay; the voice changes.

**Why it matters.** Tone signals culture: a formal JD attracts different candidates than a casual one. Rewriting lets you A/B test tones for the same role or quickly match a new client's employer brand without rewriting the whole post from scratch.

**How to use it.** Click **Rewrite tone** at the top of the JD form. Pick a target tone from the dropdown (Formal, Casual, Inclusive, Startup, Executive). Preview the rewrite before accepting — sometimes a tone shift breaks a specific phrase you cared about.

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

## Step 3.5 — Validate the JD before publishing

A first draft passes a vibe check; what catches you out is the bias phrase you didn't notice, the BCEA-non-compliant requirement you copy-pasted, the salary that's 20% under market, or the title nobody actually searches for. Four validators run on demand against the JD draft.

### Bias Detection & Inclusivity Scoring — _Tier: Standard_

**What this feature is.** Bias Detection scans the JD text for gendered language ("rockstar", "ninja"), age-coded phrases ("digital native", "recent grad"), and culturally exclusionary terms, then scores inclusivity and suggests rewrites.

**Why it matters.** Biased JDs narrow the candidate pool by 30–50% and create EE compliance risk. Automated scoring makes inclusivity a checklist item before you publish, not a regret after the candidate complaints arrive.

**How to use it.** In the JD form, click **Run inclusivity check**. Each flagged phrase shows the issue and a suggested rewrite — accept, edit, or dismiss with reason. Aim for an inclusivity score of 80+ before publishing.

![[r-ch11-bias-detection-highlights.png]]

### JD Compliance Check — _Tier: Standard_

**What this feature is.** JD Compliance Check runs the JD against South African labour law — BCEA, EEA, LRA — and flags discriminatory requirements, missing protected-class language, and clauses that contravene SA employment standards.

**Why it matters.** A single non-compliant JD can trigger a CCMA referral and reputational damage. Automated checking turns what would be a 2-hour specialist legal review into a 5-second gate before publish — which means it actually happens for every role, not just the ones someone remembers to flag.

**How to use it.** Click **Run compliance check**. Issues are categorised by severity (block / warning / info). Block-level issues prevent publish until resolved. Most warnings are about phrasing — fix or document the exception.

![[r-ch11-jd-compliance-flags.png]]

### JD Salary Benchmark — _Tier: Standard_

**What this feature is.** JD Salary Benchmark compares the salary range you've entered against market data for the same role, seniority, and location — drawing from Sebenza Hub's platform-wide compensation data and external benchmarks.

**Why it matters.** Under-priced roles don't fill and over-priced roles blow client budgets. Catching pricing errors in the JD-writing flow — before you publish and before the client gets attached to a number — is the cheapest place to fix them.

**How to use it.** With the salary range filled in, click **Benchmark salary**. The output shows the market median, P25–P75 range, and where your range sits. If you're under, push back to the client now — not after a month of zero applications.

![[r-ch11-salary-benchmark-chart.png]]

### JD SEO Analysis — _Tier: Standard_

**What this feature is.** JD SEO Analysis evaluates the JD for search-engine visibility — keyword density, title optimisation, structured-data completeness, and how well it'll rank when candidates Google "[role] jobs in [city]".

**Why it matters.** Most candidates find jobs via Google, not directly on a job board. An SEO-optimised JD can triple organic reach at zero marginal cost — and the changes the analyser suggests are usually small (better title, one more relevant keyword in the first paragraph, a missing meta description).

**How to use it.** Click **Run SEO analysis**. The output gives a score and a short list of fixes. Apply the obvious ones; ignore the ones that would hurt readability for candidates.

## Step 4 — Publish and distribute

The JD is written and validated. Time to publish — and decide which channels carry it. Four features handle the distribution layer.

### Job Postings — _Tier: Metered — Free: 1/mo · Standard: 10/mo · Premium: unlimited_

**What this feature is.** Job Postings is the create-edit-publish flow for job records on Sebenza Hub. A posting is the canonical record of an open role — visible in candidate search, eligible for matching, and the anchor that every application, screening result, and placement ties back to. Metered monthly so pricing aligns with actual hiring volume.

**Why it matters.** Postings are the core unit of recruiter revenue. Metering by month creates clean upgrade triggers as desks scale — Free is for evaluating, Standard for working solo desks, Premium for multi-recruiter teams running multiple mandates.

**How to use it.** You've already built the posting in Steps 1–3. Save as draft first, preview the public-facing version, then click **Publish**. The status flips to **active** and the published timestamp is recorded. If you're at your monthly cap, the publish button is blocked until you close, archive, or upgrade — plan ahead so you don't get caught on a Friday afternoon trying to post an urgent role.

![[r-ch11-publish-channel-selector.png]]

### Job Board Integrations — _Tier: Standard_

**What this feature is.** Job Board Integrations publishes a single posting to Pnet, CareerJunction, and other South African job boards in one click — no double-entry, no separate logins.

**Why it matters.** External boards are still where most SA candidates search. Removing double-entry keeps application data unified in one Sebenza Hub pipeline instead of fragmented across four board inboxes — which is the whole point of having an ATS.

**How to use it.** In the JD form's **Distribution** section, tick the boards you want to publish to. First-time setup connects each board's account once via Chapter 29. After that, every new job has the toggles ready to flip.

![[r-ch11-job-board-integrations-panel.png]]

### CSV/Pnet/CJ/Adzuna Export — _Tier: Standard_

**What this feature is.** CSV/Pnet/CJ/Adzuna Export bulk-exports job listings in formats specific to Pnet, CareerJunction, Adzuna, or generic CSV — for syndication to boards that don't have a direct integration, or for posting via a partner's account.

**Why it matters.** The same role is usually syndicated across 4–6 boards. Built-in export removes the double-entry that pushes recruiters toward competitor ATSs and lets you syndicate to long-tail boards that don't have an API.

**How to use it.** Open the jobs list, multi-select the postings to export, click **Export**, pick the target format. The file downloads ready to upload to the destination board.

### WhatsApp Job Distribution — _Tier: Premium_

**What this feature is.** WhatsApp Job Distribution pushes job postings to subscribed WhatsApp candidate communities — segmented by sector, location, or seniority — using the platform's WhatsApp Business API integration.

**Why it matters.** WhatsApp is the dominant channel for blue-collar and entry-level SA talent and increasingly for mid-tier roles too. Recruiters who reach via WhatsApp tap candidate pools their LinkedIn-only competitors literally can't see.

**How to use it.** In **Distribution**, toggle **WhatsApp** and pick the audience segment(s). Standard WhatsApp template message charges apply per recipient (passed through with metering, see Chapter 4.5). Chapter 24 covers WhatsApp at scale in detail.

### External Job Application Redirection — _Tier: Standard_

Some jobs are hosted on the client's own ATS or careers site, but you still want them in your Sebenza Hub catalogue for visibility, search, and analytics. The platform supports this without losing tracking on the candidates who apply.

To mark a job as externally hosted:

1. In the job form's **Application** section, toggle **External application**.
2. Paste the **redirect URL** — the exact page on the client's site where the candidate completes their application.
3. Save and publish as normal.

When a candidate clicks **Apply** on the public job listing, they are redirected to the external URL instead of the in-platform apply flow. Sebenza Hub still records the redirect as a tracked application event — so you can see how many candidates clicked through, which sources they came from, and (if the client's ATS supports the return webhook) capture the application data when they land back on the candidate record. For listings that don't pass data back, you'll see redirect clicks but not full application detail.

Use this when: the client mandates their own application form; a regulated role requires their compliance flow; or you need the visibility on Sebenza Hub but the actual capture happens elsewhere.

## Step 5 — Save as draft, then publish

Always save as draft first, preview the public-facing version, then publish. The preview shows you what a candidate will actually see — typos and weird formatting jump out instantly.

When you're ready, click **Publish**. The status flips to **active**, the published timestamp is recorded, and the job appears on every channel you selected.

## Step 6 — Monitor the live job

Posting is the start. Knowing whether it's actually going to fill — early enough to fix it — is the whole game.

### Job AI Insights — _Tier: Standard_

**What this feature is.** Job AI Insights is the per-job analysis layer: candidate pipeline quality, time-to-fill projection, market supply and demand signals, and red-flag detection (wrong salary, wrong location, over-restrictive requirements). It runs continuously against every active posting and surfaces issues as they emerge.

**Why it matters.** Recruiters often don't realise a role is going to struggle until week 3, when there are still no good shortlist candidates and the client is asking why. Up-front insights flag the red flags on day 1 — so you can renegotiate the salary band or relax the experience requirement before the role goes stale.

**How to use it.** Open any active job and click the **AI Insights** tab. The panel shows current pipeline health, projected time-to-fill, and any flagged risks with suggested fixes. Re-check weekly during the first month of any role.

![[r-ch11-job-ai-insights-dashboard.png]]

## Pro tips

- **One job per role.** Don't combine "Senior Dev OR Tech Lead" into one post — it confuses the matching algorithm and the candidates. Two posts.
- **Salary visibility increases application quality.** Hidden salaries get more applications but more mismatched ones. Visible ranges filter out anyone whose expectations don't fit.
- **Knockout questions save you hours.** A single well-chosen knockout (e.g. "Do you have a valid SA work permit?") rejects 30%+ of unqualified applications before they even reach your inbox.
- **Edit the AI draft.** AI-generated descriptions are spotted instantly by experienced candidates and look generic. Twenty minutes of editing makes the post feel real.
- **Re-publish refreshed jobs every 30 days.** Old jobs sink in search rankings. If a role is taking longer than 30 days, archive and re-post with a refreshed description.

## Checklist

- [ ] You've linked the job to the right client
- [ ] You've used AI JD Generator for a first draft, AI Company Description for the about block, and edited both
- [ ] You've run Bias Detection, JD Compliance Check, JD Salary Benchmark, and JD SEO Analysis before publishing
- [ ] You've set salary range and visibility deliberately
- [ ] You've added at least one knockout question
- [ ] You've previewed the public-facing version before publishing
- [ ] You've published to the right channels (Sebenza job board, integrated boards, exports, WhatsApp if applicable)
- [ ] You're aware of your plan's active-job limit and not at the cap
- [ ] You've checked the Job AI Insights tab on the live posting

## Features covered in this chapter

| # | Feature | Tier |
|---|---------|------|
| 1 | AI JD Generator | Standard |
| 2 | AI Company Description | Standard |
| 3 | JD Section Regenerator | Standard |
| 4 | JD Tone Rewriter | Standard |
| 5 | Bias Detection & Inclusivity Scoring | Standard |
| 6 | JD Compliance Check | Standard |
| 7 | JD Salary Benchmark | Standard |
| 8 | JD SEO Analysis | Standard |
| 9 | Job Postings | Metered — Free: 1/mo · Standard: 10/mo · Premium: unlimited |
| 10 | Job Board Integrations | Standard |
| 11 | CSV/Pnet/CJ/Adzuna Export | Standard |
| 12 | WhatsApp Job Distribution | Premium |
| 13 | Job AI Insights | Standard |

## Next chapter

[[01 How-To Documents/recruiter/12-talent-pools-crm|Chapter 12 — Talent Pools and Talent CRM]]

## References

- [[02-concepts/ai-features]] — AI JD Writer capabilities
- [[02-concepts/application-lifecycle]] — Status enum and pipeline stages
- [[01 How-To Documents/recruiter/12-talent-pools-crm|Chapter 12 — Talent Pools and Talent CRM]]
- [[01 How-To Documents/recruiter/14-sourcing-channels|Chapter 14 — Sourcing channels]]
- [[01 How-To Documents/recruiter/15-screening-config|Chapter 15 — Screening configuration at the job level]]
- [[01 How-To Documents/recruiter/04.5-how-we-charge|Chapter 4.5 — How Sebenza Hub charges you]]
