---
title: "Chapter 17 — Screening tools"
type: concept
created: 2026-04-09
updated: 2026-04-20
tags: [how-to, recruiter, screening, scorecards, blind-hiring, tests, assessments, references, predictive, culture-fit]
status: draft
user-types: [recruiter]
---

# Chapter 17 — Screening tools: chatbot, tests, scorecards, blind hiring, references, background checks

Chapter 15 was about *configuring* screening at the job level. This chapter is about *using* the screening tools day-to-day — what each one does, when to reach for it, and how to combine them into a defensible, efficient screening process.

This is the longest chapter in the recruiter manual because Sebenza Hub has more screening surface area than any other workflow. The features split cleanly into six groups, each handled in its own section below:

1. **CV and JD matching** — the AI that scores resumes against jobs
2. **Predictive and fit** — models that look beyond the CV at success, culture, and location risk
3. **Screening flow** — the chatbot, market intelligence, and the recommender that tells you what to do next
4. **Assessments** — competency tests and the AI that scores essays
5. **References** — the post-shortlist verification step
6. **Bias reduction** — blind hiring as a structural safeguard

## Where it lives

The screening surface is spread across many pages, but the ones you'll touch most:

| Page | What it does |
|---|---|
| `/dashboard/recruiter/screening` | Master screening workspace per job |
| `/dashboard/recruiter/screening-chatbot` | Conversational AI screen |
| `/dashboard/recruiter/tests` | Competency test library and runs |
| `/dashboard/recruiter/scorecards` | Structured evaluation forms |
| `/dashboard/recruiter/culture-fit` | Culture alignment assessments |
| `/dashboard/recruiter/blind-hiring` | Demographic redaction toggle |
| `/dashboard/recruiter/references` | Reference check tracking and forms |
| `/dashboard/recruiter/background-checks` | Third-party verification |

## 1. CV and JD matching

Four features score CVs against jobs. They run constantly in the background and surface as numbers on every candidate card.

### AI Candidate Screening — _Tier: Metered — Standard: 50/mo · Premium: unlimited_

**What this feature is.** Automated AI-powered CV screening that evaluates every applicant against the job's criteria and returns a ranked shortlist with reasoning per candidate.

**Why it matters.** Screening 300 CVs manually takes 10 hours; AI does it in 10 minutes with more consistency than any single recruiter. This is the biggest time-saver in the entire recruiter workflow — and the metering aligns cost with the volume of roles you're actually screening.

**How to use it.** Runs automatically on every new application that passes knockouts. Open the job's screening workspace to see the ranked list and the AI's reasoning per candidate. Override the rank where the reasoning misses context.

![[13-raw/screenshots/r-ch17-ai-candidate-screening-shortlist.png]]

### AI Resume vs JD Scoring — _Tier: Standard_

**What this feature is.** A targeted comparison of one specific resume against one specific job description, producing a percentage fit and explanation.

**Why it matters.** Pipeline calls always involve "is this person right for the role?" This is the one-click answer — faster than reading the CV again, defensible to the hiring manager when they ask why you advanced a particular candidate.

**How to use it.** Click **Score against JD** on any candidate card. Useful when re-running an existing candidate against a new role, or when the hiring manager asks for a written rationale.

![[13-raw/screenshots/r-ch17-resume-vs-jd-scoring-card.png]]

### AI Candidate-Job Matching — _Tier: Metered — Standard: 100/mo · Premium: unlimited_

**What this feature is.** AI-scored matching with detailed breakdowns across skills, experience, location, and culture fit — the underlying engine that powers candidate ranking.

**Why it matters.** Match scores are the single most useful number in a recruiter's day. They focus your attention on the right 10 of 200 candidates instead of forcing you to read all 200.

**How to use it.** Surfaces automatically as the match score on every Pipeline card. Click into the score for the breakdown by dimension — useful when a candidate scores high overall but you want to understand which dimension is carrying the score.

### Batch Screening — _Tier: Metered — Standard: 10 batches/mo · Premium: unlimited_

**What this feature is.** Screens multiple candidates against a job description simultaneously, producing a ranked batch report you can review in one session.

**Why it matters.** High-volume roles (call centres, graduate programmes) bring 500+ applications. Batch screening turns a multi-day review into a 20-minute one without losing quality.

**How to use it.** From the screening workspace, select multiple candidates → **Batch screen**. The report ranks them and groups them into advance / maybe / reject buckets you can act on with bulk actions.

![[13-raw/screenshots/r-ch17-batch-screening-report.png]]

## 2. Predictive and fit

Three features look beyond what the CV says toward what's likely to happen if you hire the candidate.

### Predictive Hiring — _Tier: Premium_

**What this feature is.** AI predicts a candidate's likely on-the-job success and retention risk based on pattern-matching against historical hires in similar roles and contexts.

**Why it matters.** 30% of hires don't last a year — and the cost of a bad hire is roughly 1× annual salary. Prediction narrows that risk, which is why this is the single highest-leverage Premium feature for corporate clients with hiring budgets at stake.

**How to use it.** Visible on every shortlisted candidate's profile under **Predictive**. Read the score and the contributing factors before submitting to the client. Use it as a tie-breaker between two equally strong candidates, not as a gate.

![[13-raw/screenshots/r-ch17-predictive-hiring-risk-score.png]]

### Culture Fit Assessment — _Tier: Standard_

**What this feature is.** A 6-dimension AI cultural alignment analysis comparing the candidate's stated values and work style with the client's culture signals.

**Why it matters.** Culture fit drives retention more than skill fit, yet it's usually assessed on gut feel alone. A structured 6-dimension view makes culture decisions defensible — especially in panel debriefs where someone always has a "vibe" objection that can't be substantiated.

**How to use it.** Open `/dashboard/recruiter/culture-fit` for any shortlisted candidate. The output gives an alignment score, strengths the candidate brings, and risks where misalignment may cause friction. **Use the work-style framing**, not the "do they fit in" framing — culture fit used badly is how you build homogeneous, biased pipelines that fail diversity audits (Chapter 28).

![[13-raw/screenshots/r-ch17-culture-fit-radar-chart.png]]

### Location Intelligence — _Tier: Standard_

**What this feature is.** SA province-level geographic insights — commute feasibility, relocation propensity, local talent density for the role's location.

**Why it matters.** A candidate in Pretoria East applying for a Sandton role looks perfect on paper but may churn at month 3 over traffic. Location intelligence surfaces that risk early, before you've spent weeks shortlisting and interviewing.

**How to use it.** Surfaces automatically on the candidate card as a **Location risk** flag. For roles where on-site attendance matters, treat a high flag as a conversation point in the screening call, not an auto-reject — many candidates have plans to relocate they haven't mentioned.

![[13-raw/screenshots/r-ch17-location-intelligence-map.png]]

## 3. Screening flow

Three features move candidates through the screen — the chatbot does the conversational work, market intelligence sells the role, and the next-steps recommender removes decision fatigue.

### AI Screening Chatbot — _Tier: Standard_

**What this feature is.** A multi-turn AI chatbot that qualifies candidates through conversational screening — availability, salary, must-haves — before they hit the recruiter.

**Why it matters.** Recruiters waste 20% of their time on calls that should have been filtered out at intake. A chatbot handles the no-go conversations 24/7 so the recruiter only speaks to viable candidates.

**How to use it.** Configure templates per role family in `/dashboard/recruiter/screening-chatbot`. Enable the chatbot for a job from the screening config (Chapter 15). Review transcripts in the chatbot workspace and override the AI's recommendation when context warrants. Skip the chatbot for executive roles — at that level it feels patronising.

![[13-raw/screenshots/r-ch17-screening-chatbot-conversation.png]]

### Screening Next Steps — _Tier: Standard_

**What this feature is.** For each screened candidate, AI recommends the specific next step — advance, reject, ask for X, refer to pool — with reasoning.

**Why it matters.** Decision fatigue after 50 candidates leads to dropped good ones. Pre-baked recommendations remove the mental overhead while keeping you in control of the actual decision.

**How to use it.** Appears as a **Suggested action** button on every candidate card after screening completes. Treat it as a default you can confirm in one click — but the override is always there.

![[13-raw/screenshots/r-ch17-screening-next-steps-recommendation.png]]

### Screening Market Intelligence — _Tier: Premium_

**What this feature is.** Market intelligence specific to the role being screened: what comparable candidates look like, salary bands, supply depth, competitor activity.

**Why it matters.** Recruiters pitch roles to candidates better when they know what the market looks like. This turns every screening conversation into a pitching-advantage moment instead of a generic "tell me about your experience" call.

**How to use it.** Open the **Market** tab on the screening workspace before your screening call. Quote one specific market data point in the call ("we're seeing candidates with your background going for R900k–R1.1m in this sector right now") and your conversion goes up.

## 4. Assessments

Eight features cover competency testing — building tests, generating questions, recommending which test to use, sending invitations, scoring essays, tracking analytics, and proctoring.

### Test Builder — _Tier: Metered — Standard: 20/mo · Premium: unlimited_

**What this feature is.** Create MCQ, essay, code, and true/false assessments with branching logic and timers.

**Why it matters.** Off-the-shelf tests don't match niche roles. Custom test building means you can screen for client-specific competencies without buying separate assessment software for every gap.

**How to use it.** Open `/dashboard/recruiter/tests` → **+ New test**. Pick the format, add questions, set the timer, attach to a job. Save as a template if you'll reuse it.

![[13-raw/screenshots/r-ch17-test-builder-branching-logic.png]]

### AI Question Generator — _Tier: Standard_

**What this feature is.** AI-generated assessment questions by topic, difficulty, and question type — saves you writing them by hand.

**Why it matters.** Writing good questions is the slowest part of test-building. Generation compresses hours of work and reduces the "last year's test" problem of leaked questions doing the rounds among candidates.

**How to use it.** Inside Test Builder, click **Generate questions** for any section. Specify topic, difficulty, count, format. Review and edit before adding to the test.

### Test Templates Library — _Tier: Standard_

**What this feature is.** 15+ pre-built assessment templates for common roles — finance, accounting, software, admin, sales — ready to send.

**Why it matters.** Most roles don't need a custom test — a template is 90% of the way there. The library shortens setup from 30 minutes to 2 minutes, which is the difference between actually running tests and skipping them under time pressure.

**How to use it.** Open the template library inside `/dashboard/recruiter/tests`. Pick the closest match, clone, edit the few questions that need tailoring, attach to the job.

![[13-raw/screenshots/r-ch17-test-templates-library.png]]

### AI Test Recommender — _Tier: Standard_

**What this feature is.** AI recommends which assessments to run based on the job's requirements and your past hiring success.

**Why it matters.** Recruiters pick the same test out of habit even when the role doesn't need it. Recommendations align testing to the actual role and avoid wasting candidate time (and your test-credit budget) on irrelevant assessments.

**How to use it.** When attaching a test to a job, click **Recommend** instead of browsing. The AI proposes 1–3 tests with reasoning. Accept, swap, or override.

### Assessment Invitations — _Tier: Standard_

**What this feature is.** Token-based assessment invitations that let candidates complete tests without creating a login.

**Why it matters.** Every login screen loses 20%+ of candidates. Token invitations remove the friction and maintain high completion rates — especially for mobile-only candidates who never finish a sign-up flow.

**How to use it.** When you send a test, the platform generates a unique link. Email or WhatsApp it to the candidate. They click, complete, results land in your screening workspace. No account required.

### AI Essay Scoring — _Tier: Premium_

**What this feature is.** AI-powered automated scoring of candidate essay responses with rubric-aligned feedback per response.

**Why it matters.** Essays are the most predictive assessment format and the most expensive to score. AI scoring makes essays usable at scale — which unlocks better hiring decisions on roles where you currently default to MCQs because essays were too expensive to grade.

**How to use it.** Add essay questions to a test in Test Builder. Define the rubric (3–5 criteria). When candidates submit, the AI returns a score per criterion with the reasoning. Spot-check 1 in 10 against your own read to catch drift.

### Test Analytics — _Tier: Standard_

**What this feature is.** Score distributions, completion rates, time-to-complete, and per-question performance analytics for every test you run.

**Why it matters.** Tests go stale: question 7 stops discriminating between good and bad candidates. Analytics surface the dead questions so tests stay sharp instead of becoming a cargo-cult ritual.

**How to use it.** Open the **Analytics** tab on any test. Watch for questions where 95% of candidates get the same answer — those questions add zero signal. Replace them.

### Anti-Cheat Monitoring — _Tier: Premium_

**What this feature is.** Real-time anti-cheat detection during assessments — focus-loss, multiple-face, copy-paste, time anomalies — flagged on the candidate's submission.

**Why it matters.** Remote assessments are trivially cheated without proctoring — which destroys the signal. Monitoring preserves test validity and is the default expectation from corporate clients who are paying you to deliver verified candidates.

**How to use it.** Toggle **Anti-cheat** on when configuring the test. Candidates see a consent prompt before starting. Flagged events appear on the result with a confidence score; review the recording for any flagged candidate before deciding.

![[13-raw/screenshots/r-ch17-anti-cheat-monitoring-live.png]]

## 5. References

Five features cover the reference workflow end-to-end — tracking, the public form, AI question generation, summarisation, and the automated request system that ties it all together.

### Reference Checks — _Tier: Standard_

**What this feature is.** An automated reference request and collection system that drafts the email, sends it, follows up if no response, and stores responses against the candidate's record.

**Why it matters.** Reference admin is a major time sink that agencies typically delegate to junior staff. Automation removes the role entirely, which matters for low-margin desks where a junior reference-checker's salary eats your placement fee.

**How to use it.** From any candidate's record, open **References** → **Request**. Add the referee's email, pick the question template, send. The platform handles the follow-up cadence; you review the responses when they land.

### Reference Request Tracking — _Tier: Standard_

**What this feature is.** Track the status of every reference check request — sent, received, overdue, escalated.

**Why it matters.** References drop off the end of the pipeline because no one owns the follow-up. Tracking makes them a visible step in the process, which is the only way they get completed in time to support the offer.

**How to use it.** Open `/dashboard/recruiter/references`. Sort by status. Anything in **overdue** for 5+ days gets a personal nudge from you to the candidate ("could you remind your referee?") rather than another automated email.

### Public Reference Form — _Tier: Standard_

**What this feature is.** A token-based public reference form that referees complete without creating a login.

**Why it matters.** Referees are doing a favour; any friction tips them into "I'll get to it later" (which is never). Zero-login forms raise completion from 40% to 80%+, which is the difference between having references on the placement file and not.

**How to use it.** Generated automatically when you send a reference request. The referee receives a link, completes the form on any device, submits. Their answers attach to the candidate's record.

### AI Reference Questions — _Tier: Standard_

**What this feature is.** AI generates role-specific reference check questions that probe the competencies the hire actually needs.

**Why it matters.** Generic reference questions ("What are her strengths?") produce generic answers. Role-specific questions ("Describe a time she made a technical decision under uncertainty — what did she weigh?") produce discriminating answers — actual signal, not courtesy responses.

**How to use it.** When sending a reference request, click **Generate questions from JD**. The AI returns 5–8 role-specific questions you can edit before sending.

![[13-raw/screenshots/r-ch17-ai-reference-questions.png]]

### Reference Check Summary — _Tier: Standard_

**What this feature is.** AI-generated summary and analysis of reference responses, flagging inconsistencies and surfacing strength patterns across multiple referees.

**Why it matters.** Hiring managers skim reference reports and miss the signal. A 3-sentence summary with the key red flags surfaces what matters in 15 seconds of reading, which is roughly all the time a hiring manager will spend.

**How to use it.** Appears automatically on the candidate's record once 2+ reference responses are in. Forward the summary (not the raw transcripts) to the hiring manager unless they specifically ask for the full text.

![[13-raw/screenshots/r-ch17-reference-check-summary.png]]

## 6. Bias reduction

One feature, but a structural one: blind hiring removes demographic data from the screening view so evaluators decide on substance.

### Blind Hiring — _Tier: Standard_

**What this feature is.** A toggle that removes identifying information (name, photo, age, gender, race markers, university attended) during the screening stage so evaluators can't see them.

**Why it matters.** Blind hiring reduces bias measurably and is increasingly required by corporate clients with EE goals. One toggle replaces a manual CV-redaction workflow most teams do badly or skip entirely.

**How to use it.** Enable from `/dashboard/recruiter/blind-hiring` per role or per evaluator. What's still visible: skills, experience, scorecards, test results. **Commit fully** (blind through to interview) or use it as a discrete first-pass filter — turning it off mid-process just pushes the bias forward to a later stage.

![[13-raw/screenshots/r-ch17-blind-hiring-before-after.png]]

## How to combine the tools — a defensible sequence

For a typical mid-level role, here's a sequence that combines the screening tools well:

1. **Application** — knockouts auto-reject the unqualified (Chapter 15)
2. **Auto** — Screening Chatbot runs, AI Candidate Screening assigns rank, Engagement Scorer starts watching
3. **Triage** — review chatbot transcripts and AI rank for the top 20, decide who advances using Screening Next Steps as your starting point
4. **Test** — send the recommended assessment via token invitation, review with anti-cheat flags
5. **Culture & Predictive** — for shortlist candidates, read Culture Fit and Predictive Hiring outputs as supporting evidence
6. **Reference** — send AI-generated reference questions to 2 referees, read the summary
7. **Background check** — only for the candidate(s) you're offering (covered below)

Each layer rejects a smaller, more carefully-selected portion of the funnel. By the time someone reaches a background check, you're confident enough to spend money on verification.

## Background checks (the late-stage verification)

Background checks are paid third-party verifications. Sebenza Hub integrates with SA-relevant providers; you order them per candidate from the candidate's record. Typical checks: ID (Home Affairs), criminal (SAPS), credit, education, employment, professional registration (SAICA, HPCSA).

Each check has a cost (visible before you order) and some require explicit candidate consent under POPIA — the platform handles the consent flow.

**When to order.** At the offer stage, not at screening. Background checks are expensive — only run them on candidates you're seriously about to offer. For client-mandated checks (regulated industries — financial services, healthcare, education), order earlier in the process.

**Privacy.** Results contain sensitive personal data. They're stored encrypted with access logged in the audit trail. Don't export, don't email, don't store outside the platform.

## Pro tips

- **Standardise scorecards across your team.** Different scorecards for different recruiters means no useful comparison. One scorecard per role family, used by everyone.
- **Read AI screening outputs, don't worship them.** Override is always there. AI scores can be biased against unconventional career paths, gaps, and underrepresented backgrounds. Your Diversity Analytics (Chapter 26) tracks whether your AI-assisted decisions are skewing demographics.
- **Don't rely on a single tool.** Chatbot alone is too thin. Tests alone miss culture. Scorecards alone miss verification. Combine.
- **Order background checks once, late.** Don't burn money checking everyone — only the people you're committed to offering.
- **Audit your screening for bias quarterly.** Run Diversity Analytics on your last 100 screenings. If demographics drop sharply at one stage, that stage has a bias problem.
- **Use the recommended next-step button.** It's right 80% of the time and saves the cognitive load on the 20% where you'll override anyway.

## Checklist

- [ ] You know which screening tools are automatic vs manual
- [ ] You have at least one Test Templates Library template attached to a live role
- [ ] You've sent a reference request via the Public Reference Form workflow
- [ ] You've decided whether Blind Hiring applies to your current roles
- [ ] You've checked the Predictive Hiring score on your last shortlist
- [ ] You've used Culture Fit Assessment with the work-style framing, not "do they fit in"
- [ ] You only order background checks for candidates you're about to offer
- [ ] You audit screening for bias regularly via Diversity Analytics

## Features covered in this chapter

| # | Feature | Tier |
|---|---------|------|
| 118 | AI Candidate Screening | Metered — Standard: 50/mo · Premium: unlimited |
| 119 | AI Screening Chatbot | Standard |
| 120 | AI Candidate-Job Matching | Metered — Standard: 100/mo · Premium: unlimited |
| 121 | AI Resume vs JD Scoring | Standard |
| 123 | Predictive Hiring | Premium |
| 124 | Culture Fit Assessment | Standard |
| 125 | Location Intelligence | Standard |
| 132 | Batch Screening | Metered — Standard: 10 batches/mo · Premium: unlimited |
| 134 | Screening Market Intelligence | Premium |
| 135 | Screening Next Steps | Standard |
| 136 | Test Builder | Metered — Standard: 20/mo · Premium: unlimited |
| 137 | AI Question Generator | Standard |
| 138 | Test Templates Library | Standard |
| 139 | AI Test Recommender | Standard |
| 140 | Assessment Invitations | Standard |
| 141 | AI Essay Scoring | Premium |
| 142 | Test Analytics | Standard |
| 143 | Anti-Cheat Monitoring | Premium |
| 164 | Reference Request Tracking | Standard |
| 165 | Public Reference Form | Standard |
| 166 | AI Reference Questions | Standard |
| 167 | Reference Check Summary | Standard |
| 168 | Reference Checks | Standard |
| 200 | Blind Hiring | Standard |

## Next chapter

[[01 How-To Documents/recruiter/18-interview-scheduling|Chapter 18 — Interview scheduling and interview kits]]

## References

- [[02-concepts/ai-features]] — AI capabilities in screening
- [[02-concepts/compliance]] — POPIA, EE, and bias auditing context
- [[01 How-To Documents/recruiter/15-screening-config|Chapter 15 — Configuring screening at the job level]]
- [[01 How-To Documents/recruiter/16-the-pipeline|Chapter 16 — The Pipeline]]
- [[01 How-To Documents/recruiter/18-interview-scheduling|Chapter 18 — Interview scheduling]]
