---
title: "Chapter 10 — AI tooling for corporates"
type: concept
created: 2026-04-26
updated: 2026-04-26
tags: [how-to, corporate, ai, screening, search, content]
status: active
user-types: [business]
---

# Chapter 10 — AI tooling for corporates

Sebenza Hub ships eight AI features inside the Business product. They sit at three points in the hiring journey: drafting and distributing the role (Job Description Writer, Content Repurpose, Brand Voice), finding and qualifying candidates (AI Search, Screening Bot, AI Questions, Predictive Hiring), and reviewing the inputs faster (AI Candidate Summary). None of them replace human judgement. All of them shave the hours you used to spend on the obvious yes/no work so you can spend it on the real decisions.

This chapter walks through each one, in the order you encounter them in a typical requisition.

While any AI feature is working, you'll see a multi-phase **AI Progress Messaging** indicator — drafting, validating, scoring, finalising — so you know the model is progressing rather than wondering if the page has hung. On longer operations (full-pipeline scoring, large-database search) the message updates as each phase completes.

## Draft the job description

### AI JD Writer — _Tier: Premium_

**Where it lives.** `/dashboard/business/ai-writer`, in the **Post Jobs** sidebar group.

**What it does.** Given a role title, a department, and a few seed bullet points (responsibilities, must-have skills, level), the AI JD Writer produces a structured job description: summary, responsibilities, requirements, nice-to-haves, and a benefits block. Output respects your **Brand Voice** profile (see below) so the result reads like your company, not generic LLM prose.

**When to use it.** When you're spinning up a new requisition and don't have a maintained JD library — most corporates don't, even when they think they do. Treat the output as a strong first draft your hiring manager edits, not a final document.

## Distribute the role

### Content Repurpose — _Tier: Premium_

**Where it lives.** `/dashboard/business/content-repurpose`, in the **Post Jobs** sidebar group.

**What it does.** Takes a published job and produces channel-shaped variants: a LinkedIn post, a shorter X/Twitter version, a WhatsApp broadcast snippet, and an internal Slack message. Each variant respects the platform's character and formatting limits and the **Brand Voice** profile.

**When to use it.** Every time you publish a role you intend to push beyond the career page. Saves the recruiter an hour of reformatting and produces sharper, on-brand copy than most people write at 4pm.

### Brand Voice — _Tier: Premium_

**Where it lives.** `/dashboard/business/brand-voice`, in the **Communication & Automation** sidebar group.

**What it does.** Brand Voice is the per-organisation profile that shapes every other AI text feature — tone, formality level, banned words, signature phrases, and example paragraphs. Once it's tuned, AI JD Writer, Content Repurpose, and AI-generated candidate communication all sound like you wrote them.

**When to use it.** Set it up once, in the first month, and tune it quarterly. The first round produces output that feels close-but-off; the third round is where the model genuinely picks up your voice. Treat it as a small ongoing investment, not a set-and-forget config.

## Find candidates

### AI Search — _Tier: Premium_

**Where it lives.** `/dashboard/business/ai-search`, in the **Vendor & Sourcing** sidebar group.

**What it does.** Natural-language search across your active pipelines, your Talent CRM, and the platform's broader candidate base. Type "senior backend engineer in Cape Town with payment-systems experience and Afrikaans" and get a ranked list with the rationale for each match. Filters layer on top — location, salary band, last activity, demographic for EE-aware sourcing — and each result links back to the candidate record.

**When to use it.** When a hiring manager describes the candidate they want in conversation, not in keywords. AI Search reads the description; keyword search forces you to translate it. Use both: AI Search for the wide cast, traditional search to verify the model isn't missing literal matches.

## Qualify candidates

### Screening Bot — _Tier: Premium_

**Where it lives.** `/dashboard/business/screening-bot`, in the **Screen & Evaluate** sidebar group.

**What it does.** A conversational pre-screen that runs at the **Applied** stage, asks the qualifying questions you'd otherwise ask on a first phone screen (notice period, salary expectation, must-have qualifications, work eligibility, location), and surfaces a structured result on the candidate record. You configure the question set per role family; the bot handles tone and follow-up clarification.

**When to use it.** Volume hiring where the recruiter time on first screens is the bottleneck. Removes the worst time tax in any high-applicant-count role. For executive search and scarce-skill engineering, skip it — the candidate experience is the recruitment.

### AI Questions — _Tier: Premium_

**Where it lives.** `/dashboard/business/ai-questions`, in the **Interview** sidebar group.

**What it does.** Generates interview questions tailored to the role and the specific candidate's CV — competency-based for the must-haves, scenario-based for the behavioural dimensions, and probing follow-ups for any CV gap or unusual signal. Output is structured so an interviewer can take it into the room as-is.

**When to use it.** When you don't have a maintained interview kit per role family, or when a CV throws something unusual the standard kit doesn't cover. Pair it with the **Interview Kits** library for the standard backbone — AI Questions adds the candidate-specific layer.

## Review faster

### AI Candidate Summary

**Where it lives.** Embedded on every candidate record across the dashboard. There is no standalone page.

**What it does.** A one-paragraph summary that pulls the highlights from CV, application answers, and any captured screening conversation — strengths, gaps, interesting context. Updates as the candidate moves through the pipeline.

**When to use it.** Every time you open a candidate record after the first screen. Saves the recruiter and the hiring manager from re-reading the same CV across stages, which is what causes interviewer fatigue and inconsistent rating.

### Predictive Hiring — _Tier: Premium_

**Where it lives.** `/dashboard/business/predictive-hiring`, in the **Make Offer** sidebar group.

**What it does.** Scores candidates on role-fit and likely-to-accept signals using the platform's historical data, and flags pipeline patterns at the requisition level (e.g., "candidates from this source convert at half the rate"). Different from **Predictive Analytics** (Chapter 8): Predictive Hiring is about the next decision on this candidate; Predictive Analytics is about the trajectory of the requisition.

**When to use it.** As input to the offer conversation, not as the verdict. A candidate the model flags as low-likelihood to accept is one to overpay slightly or move on from quickly, not one to negotiate hard with. Treat the score as a prior; weight it against your own read of the candidate.

## A note on judgement

The AI in this product is good at the tasks where the cost of a wrong answer is low and the cost of a slow answer is high — narrowing 200 candidates to 20, drafting the first version of a JD, generating the candidate-specific layer of an interview. It is not good at the tasks where the cost of a wrong answer is high and the answer is genuinely ambiguous — the final hiring decision, the offer level, the cultural-fit call. Use it for the first kind. Make the second kind yourself.

## Features covered in this chapter

| # | Feature | Tier | Route |
|---|---------|------|-------|
| 1 | AI JD Writer | Premium | `/dashboard/business/ai-writer` |
| 2 | Content Repurpose | Premium | `/dashboard/business/content-repurpose` |
| 3 | Brand Voice | Premium | `/dashboard/business/brand-voice` |
| 4 | AI Search | Premium | `/dashboard/business/ai-search` |
| 5 | Screening Bot | Premium | `/dashboard/business/screening-bot` |
| 6 | AI Questions | Premium | `/dashboard/business/ai-questions` |
| 7 | AI Candidate Summary | Premium | embedded on candidate records |
| 8 | Predictive Hiring | Premium | `/dashboard/business/predictive-hiring` |

## Next chapter

[[01 How-To Documents/corporate/11-compliance-and-audit-trail|Chapter 11 — Compliance and audit trail]]

## References

- [[01 How-To Documents/corporate/04-your-first-requisition|Chapter 4 — Your first requisition]]
- [[01 How-To Documents/corporate/08-integrations-and-reporting|Chapter 8 — Integrations and reporting]]
- [[01 How-To Documents/corporate/12-trial-and-billing-lifecycle|Chapter 12 — Trial and billing lifecycle]]
- [[02-concepts/ai-features]] — How the AI surface is structured across the platform
