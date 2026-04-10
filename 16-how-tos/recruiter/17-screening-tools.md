---
title: "Chapter 17 — Screening tools"
type: concept
created: 2026-04-09
updated: 2026-04-09
tags: [how-to, recruiter, screening, scorecards, blind-hiring, tests]
status: draft
user-types: [recruiter]
---

# Chapter 17 — Screening tools: chatbot, tests, scorecards, blind hiring, background checks

Chapter 15 was about *configuring* screening at the job level. This chapter is about *using* the screening tools day-to-day — what each one does, when to reach for it, and how to combine them into a defensible, efficient screening process.

## The seven screening tools

Sebenza Hub gives you seven tools that operate in the screening stage of the Pipeline. They split into two groups:

**Automated (run themselves):**

- **Screening Chatbot** — conversational AI screen
- **AI Auto-Scoring** — match scoring on every application
- **Background Checks** — third-party verification (paid)

**Human-driven (you use them):**

- **Scorecards** — structured evaluation forms
- **Tests / Assessments** — competency tests from the library
- **Culture Fit assessment** — culture alignment questionnaire
- **Blind Hiring mode** — hide demographic data during evaluation

You'll use a combination on every role. The right combination depends on the role's seniority, volume, and risk profile.

## 1. Screening Chatbot — `/dashboard/recruiter/screening-chatbot`

The chatbot runs automatically right after a candidate applies (if you enabled it in the job's screening config — Chapter 15). It conducts a 5–10 minute conversational interview, captures the responses, scores them, and adds the result to the candidate's record.

Use the **Screening Chatbot** page to:

- Review chatbot conversations in detail
- Edit your chatbot templates for future jobs
- Export chatbot transcripts for your records
- Override the AI's recommendation for a specific candidate

The chatbot doesn't replace human judgment — it filters out the obviously misaligned and gives you a starting impression of everyone else.

## 2. Tests / Assessments — `/dashboard/recruiter/tests`

The Tests page is where you administer competency tests and review results. You can:

- **Send a test** to a specific candidate (or bulk-send to a group)
- **Review submitted tests** with auto-scored results
- **Compare candidates** across the same test for relative ranking
- **Browse the Test Library** (`/test-library`) for pre-built tests
- **Create custom tests** in Test Templates (`/test-templates`)

### When to test

- **Always for technical roles** where skill verification matters
- **Always when the client asks for it** (it's part of your shortlist deliverable)
- **Sometimes for cognitive ability** at junior/graduate levels
- **Rarely for senior individual contributors** — the test result tells you less than 30 minutes of conversation
- **Never for executive roles** — sending an exec a personality quiz is patronising

### Test fatigue

Don't over-test. Three short tests is OK; six tests is hostile and your completion rate craters. Pick the one or two tests that *actually predict* job performance for this role and skip the rest.

## 3. Scorecards — `/dashboard/recruiter/scorecards`

Scorecards are structured evaluation forms — a defined set of criteria, each with a rating scale and space for notes. They turn vague impressions ("seemed sharp") into recorded data ("technical depth: 4/5; communication: 3/5; culture fit: 4/5").

### Why structured scoring matters

- **Consistency** — same criteria applied to every candidate, so comparisons are honest
- **Defensibility** — when a client asks why you shortlisted Candidate A over Candidate B, you have data instead of gut feel
- **Bias reduction** — structured scoring is measurably less biased than free-form notes
- **Calibration** — when two interviewers score the same candidate differently, you can spot the discrepancy and recalibrate (Chapter 26)

### Building a scorecard

1. Open `/dashboard/recruiter/scorecards`.
2. Click **+ New scorecard template**.
3. Add criteria. For most roles, 5–8 criteria works — fewer is too coarse, more is too fiddly. Examples:
   - Technical depth (1–5)
   - Communication clarity (1–5)
   - Problem-solving approach (1–5)
   - Culture fit (1–5)
   - Motivation / interest in the role (1–5)
4. Define each rating level (what does "3/5" mean for "Technical depth"?). Vague rating definitions = bias creeps back in.
5. Save as a template, attach to the relevant job(s).

### Filling out scorecards

Every interviewer should complete the scorecard within 24 hours of the interview, ideally within an hour. Memory fades fast and "I'll do it tomorrow" turns into "I'll just write a quick note" which kills calibration.

## 4. Culture Fit — `/dashboard/recruiter/culture-fit`

Culture Fit is a structured assessment of cultural alignment between the candidate and the client's workplace. It produces:

- A culture alignment score
- Strengths (what the candidate brings)
- Risks (where misalignment may cause friction)

It draws on the candidate's stated work style, values, and preferences, plus the client's culture profile (which you maintain on the client record — Chapter 8).

### A warning on culture fit

"Culture fit" is the most dangerous phrase in recruitment. Used badly, it becomes a euphemism for "looks like the existing team" — and that's how you build homogeneous, biased pipelines that fail diversity audits (Chapter 28).

The platform's Culture Fit tool tries to mitigate this by focusing on **work style alignment** (collaboration vs solo, structured vs autonomous, fast vs deliberate) rather than personality or background. **Use the work-style framing**, not the "do they fit in" framing. Your future self defending an EE audit will thank you.

## 5. Blind Hiring — `/dashboard/recruiter/blind-hiring`

Blind Hiring mode hides demographic data from evaluators during the screening stage. Specifically, it hides:

- Name
- Photo
- Gender
- Race / ethnicity
- Age (or birth date)
- University attended (a proxy for socioeconomic background)

What's still visible: skills, experience, scorecards, test results.

### When to use it

- **Always for the first review pass** of any role where you've committed to diversity targets
- **For client mandates with specific EE goals**
- **When you suspect your team's screening is biased** and you want a clean A/B comparison

### What it doesn't do

Blind hiring at the screening stage doesn't help if you turn it off at interview stage. The bias just gets pushed forward. Either commit fully (blind through to offer) or use it as a discrete first-pass filter and accept the trade-off.

The platform's Diversity Analytics (Chapter 26) tells you whether blind hiring is actually moving your numbers.

## 6. Background Checks — `/dashboard/recruiter/background-checks`

Background checks are paid third-party verifications. Sebenza Hub integrates with SA-relevant providers; you order checks per candidate from the candidate's record.

Typical checks:

- **ID verification** (against Home Affairs)
- **Criminal record** (SAPS)
- **Credit check** (for finance / regulated roles)
- **Education verification**
- **Employment verification**
- **Professional registration** (e.g. SAICA, HPCSA)

Each check has a cost (visible before you order). Some require explicit candidate consent to comply with POPIA — the platform handles the consent capture flow; you just have to confirm before triggering the check.

### When to order

- **At the offer stage**, not at the screening stage. Background checks are expensive — only run them on candidates you're seriously about to offer.
- **For client-mandated checks** — some clients require all hires to clear specific checks before placement.
- **For regulated industries** (financial services, healthcare, education) where compliance is mandatory.

### Privacy note

Background check results contain sensitive personal data. They're stored encrypted and access is logged in the audit trail (Chapter 28). Don't export them, don't email them, don't store them outside the platform.

## 7. AI Auto-Scoring (recap from Chapter 15)

AI auto-scoring runs in the background on every application. You don't actively use it — you read it. It surfaces in the Pipeline as the match score on each candidate card.

The same warning from Chapter 15: **don't use AI scores as the sole criterion**. They're a sorting aid, not a decision.

## A defensible screening sequence

For a typical mid-level role, here's a sequence that combines the tools well:

1. **Application** — knockout questions auto-reject unqualified
2. **Auto** — Screening Chatbot runs, scores responses, AI auto-scoring assigns a match score
3. **Recruiter triage** (5 min/candidate) — review chatbot transcript and AI score, decide who advances
4. **Test** (sent automatically to advancing candidates) — competency test, auto-scored
5. **Recruiter scorecard** — fill out a screening scorecard for everyone who passed the test
6. **Shortlist for interview** — top scorecard scores advance
7. **Background check** — only for the candidate(s) you're offering

Each layer has a purpose. Each layer rejects a smaller, more carefully-selected portion of the funnel. By the time someone reaches a background check, you're confident enough to spend money on verification.

## Pro tips

- **Standardise scorecards across your team.** Different scorecards for different recruiters means no useful comparison. One scorecard per role family, used by everyone.
- **Calibrate panels regularly.** When two interviewers score the same candidate 4/5 and 2/5, that's a calibration problem (Chapter 26 covers Panel Analysis). Coach the outliers.
- **Don't rely on a single tool.** Chatbot alone is too thin. Tests alone miss culture. Scorecards alone miss verification. Combine.
- **Order background checks once, late.** Don't burn money checking everyone — only check the people you're committed to.
- **Audit your screening for bias quarterly.** Run Diversity Analytics on your last 100 screenings. If demographics drop sharply at one stage, that stage has a bias problem.

## Checklist

- [ ] You know which screening tools are automatic vs manual
- [ ] You have at least one scorecard template built and assigned to a job
- [ ] You understand when to test and when to skip testing
- [ ] You've decided whether blind hiring applies to your current roles
- [ ] You only order background checks for candidates you're about to offer
- [ ] You audit screening for bias regularly via Diversity Analytics

## Next chapter

[[16-how-tos/recruiter/18-interview-scheduling|Chapter 18 — Interview scheduling and interview kits]]

## References

- [[02-concepts/ai-features]] — AI capabilities in screening
- [[02-concepts/compliance]] — POPIA, EE, and bias auditing context
- [[16-how-tos/recruiter/15-screening-config|Chapter 15 — Configuring screening at the job level]]
- [[16-how-tos/recruiter/16-the-pipeline|Chapter 16 — The Pipeline]]
- [[16-how-tos/recruiter/18-interview-scheduling|Chapter 18 — Interview scheduling]]
