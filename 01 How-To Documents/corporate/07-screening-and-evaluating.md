---
title: "Chapter 7 — Screening and evaluating"
type: concept
created: 2026-04-26
updated: 2026-04-26
tags: [how-to, corporate, screening, video-interviews, scorecards, background-checks, ai]
status: active
user-types: [business]
---

# Chapter 7 — Screening and evaluating

Once applications are landing in the pipeline (covered in [[01 How-To Documents/corporate/06-receiving-applications|Chapter 6]]), the next job is to compress 100 applications into a shortlist of 10 with as little manual work as possible — and to get a defensible record of the decisions you made along the way. The **Screen & Evaluate** sidebar group has four pages, plus the embedded AI Candidate Summary on every record.

The pages you'll use:

- **Screening Bot** (`/dashboard/business/screening-bot`) — conversational pre-screen at the Applied stage.
- **Video Interviews** (`/dashboard/business/video-interviews`) — async one-way and live two-way video interviews.
- **Scorecards** (`/dashboard/business/scorecards`) — structured interview feedback against a competency framework.
- **Background Checks** (`/dashboard/business/background-checks`) — third-party verification before extending an offer.
- **AI Candidate Summary** — embedded on every candidate record (no standalone page).

## Compress the first call with a bot

### Screening Bot — _Tier: Premium_

**Where it lives.** `/dashboard/business/screening-bot`, in the **Screen & Evaluate** sidebar group.

**What it does.** A conversational pre-screen that runs at the **Applied** stage, asks the qualifying questions you'd otherwise ask on a first phone screen (notice period, salary expectation, must-have qualifications, work eligibility, location), and surfaces a structured result on the candidate record. You configure the question set per role family using **Screening Roles** (covered in [[01 How-To Documents/corporate/05-posting-jobs|Chapter 5]]); the bot handles tone and follow-up clarification.

**Why it matters.** The recruiter time spent on first phone screens is the single biggest time tax in volume hiring. The bot doesn't replace the phone screen for a senior or scarce-skill role — but for the high-applicant volume roles where most candidates fail on a basic must-have, it removes the work entirely and surfaces only the candidates worth a real call.

**When to use it.**

- Volume hiring where recruiter time on first screens is the bottleneck. Removes the worst time tax in any high-applicant-count role.
- Skip it for executive search and scarce-skill engineering — the candidate experience is the recruitment.

While the AI is working you'll see a multi-phase **AI Progress Messaging** indicator — drafting, validating, scoring, finalising — so you know the model is progressing rather than wondering if the page has hung.

## Run video interviews

### Video Interviews — _Tier: Premium_

**Where it lives.** `/dashboard/business/video-interviews`, in the **Screen & Evaluate** sidebar group.

**What it does.** Schedules and hosts video interviews against candidate records — both async one-way (the candidate records answers to set questions on their own time) and live two-way (synchronous panel interviews). Recordings, transcripts, and the link to the relevant scorecard are kept against the candidate record.

**Why it matters.** Async one-way video is the cheapest way to get a structured first-round signal on a candidate without a recruiter on the call — useful for high-volume roles where 50 candidates need a basic communication and motivation check. Live video is just calendar-integrated video for the panel interviews you were going to do anyway, with the difference that everything stays attached to the candidate record rather than scattered across Zoom recordings nobody can find.

**How to use it.**

1. From the candidate record or the pipeline, schedule a video interview. Choose async (set the questions and a deadline) or live (pick attendees and a time slot).
2. For async, the candidate gets a link, records their answers, and the recording lands back on the record. Reviewers watch on their own time and leave a scorecard.
3. For live, the interview is calendar-invited to attendees with the meeting link. Recording is available with consent.
4. Pair video with a scorecard (next section). The recording is evidence; the scorecard is the structured judgement.

## Capture interview feedback structurally

### Scorecards — _Tier: Standard_

**Where it lives.** `/dashboard/business/scorecards`, in the **Screen & Evaluate** sidebar group.

**What it does.** Scorecards are the structured feedback form interviewers fill out against a competency framework. Each scorecard ties the rating, written feedback, and interviewer to a specific candidate, requisition, and stage — and the aggregated view shows the panel's collective verdict before you make the offer call.

**Why it matters.** Unstructured feedback ("seemed fine, would hire") is how hiring decisions become legally indefensible and how interviewers anchor on the wrong things. Scorecards force the interviewer to rate against the competencies that matter, give written rationale, and let the panel's verdict be aggregated rather than averaged in someone's head. They're also the input for the hiring-to-performance loop covered in [[01 How-To Documents/corporate/13-workforce-and-hr|Chapter 13]].

**How to use it.**

1. Define a scorecard template per role family — the competencies (technical, behavioural, leadership) you want to rate, on a consistent scale (typically 1–4 with no neutral midpoint).
2. Attach the relevant scorecard to each interview round. Interviewers see the scorecard alongside the candidate record and complete it in the platform rather than in email.
3. Once the panel has all submitted, the aggregate view shows individual ratings, written feedback, and the average. Disagreement (e.g., one strong-no on a panel of three strong-yeses) is surfaced rather than averaged out.
4. **For interviewers who are not full team members,** use the scorecard-only flow. They can leave structured feedback without consuming a Team Member seat — set this up in [[01 How-To Documents/corporate/03-setting-up-your-org|Chapter 3]].

## Verify before you offer

### Background Checks — _Tier: Standard · per-check fees_

**Where it lives.** `/dashboard/business/background-checks`, in the **Screen & Evaluate** sidebar group.

**What this feature is.** Background Checks is the page where you order verification on a candidate before extending an offer — criminal record, credit, qualification, employment history, and reference checks — and where the results, timestamps, and consent records are kept for audit. The platform integrates with third-party verification providers; you order the package, the candidate completes consent, the provider runs the check, and the result lands back on the candidate record.

**Why it matters.** SA hiring at any scale needs verification — qualifications get embellished, criminal records get hidden, and the cost of a bad senior hire is far higher than the cost of the check. Doing it inside the platform keeps the consent record, the result, and the audit trail tied to the candidate, which is what you need when an EE audit asks "what verification did you do before this hire?".

**How to use it.**

1. From the candidate record, click **Run background check** and pick the package — typically Criminal + Credit for permanent hires, plus Qualifications for senior or regulated roles.
2. The candidate receives a consent request via email. They cannot proceed without explicit consent — this is a POPIA requirement and the platform records the consent against the candidate record with a timestamp.
3. The verification provider runs the check. Turnaround varies: criminal record checks are typically 24–48 hours, qualification verification can take a week.
4. The result lands on the candidate record with a status (clear / flagged / failed). Flagged results need a human review before you proceed; the system does not auto-reject.
5. The Audit Trail (covered in [[01 How-To Documents/corporate/12-compliance-and-audit-trail|Chapter 12]]) records who ordered the check, when consent was captured, and when the result returned.

**During the trial.** Background Checks have a per-trial cap of **2 checks**. After two, you'll be prompted to upgrade to a paid plan to run more. This protects against trial abuse — the verification API costs real money per call.

**POPIA reality.** Background checks are processing of personal information by an Operator on your behalf. Your relationship with the verification provider is governed by the Sebenza-managed contract; the consent record on the candidate side is the part you have to do correctly, and the platform makes that part mechanical.

## Read the candidate faster with AI

### AI Candidate Summary — _Tier: Premium_

**Where it lives.** Embedded on every candidate record across the dashboard. There is no standalone page.

**What it does.** A one-paragraph summary that pulls the highlights from CV, application answers, and any captured screening conversation — strengths, gaps, interesting context. Updates as the candidate moves through the pipeline.

**When to use it.** Every time you open a candidate record after the first screen. Saves the recruiter and the hiring manager from re-reading the same CV across stages, which is what causes interviewer fatigue and inconsistent rating.

**A note on judgement.** AI Candidate Summary and the Screening Bot are good at narrowing 200 candidates to a shortlist of 20. They are not good at picking the one you should hire. Use them for the first kind of work; make the second yourself.

## Checklist

- [ ] Screening Bot is configured and running on every volume role; bypassed for executive search
- [ ] Video Interviews are linked to a scorecard for every round; recordings stay on the candidate record
- [ ] Scorecard templates exist per role family with competencies that match the rest of the framework (and align to the Performance Management framework in Chapter 13)
- [ ] Background Checks are run before every offer; consent is captured before any third-party data flows
- [ ] AI Candidate Summary is being used to compress re-reads, not to make decisions

## Features covered in this chapter

| # | Feature | Tier | Route |
|---|---------|------|-------|
| 1 | Screening Bot | Premium | `/dashboard/business/screening-bot` |
| 2 | Video Interviews | Premium | `/dashboard/business/video-interviews` |
| 3 | Scorecards | Standard | `/dashboard/business/scorecards` |
| 4 | Background Checks | Standard · per-check fees · trial cap of 2 | `/dashboard/business/background-checks` |
| 5 | AI Candidate Summary | Premium | embedded on candidate records |

## Next chapter

[[01 How-To Documents/corporate/08-interviewing|Chapter 8 — Interviewing]]

## References

- [[02-concepts/application-lifecycle]] — Candidate lifecycle and stage model
- [[01 How-To Documents/corporate/06-receiving-applications|Chapter 6 — Receiving applications]]
- [[01 How-To Documents/corporate/08-interviewing|Chapter 8 — Interviewing]]
- [[01 How-To Documents/corporate/12-compliance-and-audit-trail|Chapter 12 — Compliance and audit trail]]
- [[01 How-To Documents/corporate/13-workforce-and-hr|Chapter 13 — Workforce and HR]]
