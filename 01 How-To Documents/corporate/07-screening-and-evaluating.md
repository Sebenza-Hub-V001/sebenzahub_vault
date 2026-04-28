---
title: "Chapter 7 — Screening and evaluating"
type: concept
created: 2026-04-26
updated: 2026-04-28
tags: [how-to, corporate, screening, video-interviews, scorecards, background-checks, ai, ai-screening, ai-matching, batch-screening]
status: active
user-types: [business]
---

# Chapter 7 — Screening and evaluating

Once applications are landing in the pipeline (covered in [[01 How-To Documents/corporate/06-receiving-applications|Chapter 6]]), the next job is to compress 100 applications into a shortlist of 10 with as little manual work as possible — and to get a defensible record of the decisions you made along the way. This is the densest chapter in the manual, because Sebenza Hub has more screening surface area than any other workflow. The features split cleanly into four groups, each handled in its own section below:

1. **AI matching and screening** — the always-on engine that scores every CV against every requisition and returns a ranked shortlist with reasoning
2. **Configurable screening flow** — the per-role criteria (Screening Roles), the conversational chatbot, and the structured one-page summary
3. **Interviews and scorecards** — async one-way / live two-way video, plus the structured feedback form
4. **Verification** — third-party background checks before you make an offer

The pages you'll use, in the order you'll reach for them:

- **Screening Roles** ([https://www.sebenzahub.co.za/dashboard/business/screening-roles](https://www.sebenzahub.co.za/dashboard/business/screening-roles)) — the qualifying questions and screening criteria attached to each role family. Set up at posting time (see [[01 How-To Documents/corporate/05-posting-jobs|Chapter 5]]) and revisited from here as criteria evolve.
- **Screening Bot** ([https://www.sebenzahub.co.za/dashboard/business/screening-bot](https://www.sebenzahub.co.za/dashboard/business/screening-bot)) — conversational pre-screen at the Applied stage that runs the Screening-Roles question set.
- **Video Interviews** ([https://www.sebenzahub.co.za/dashboard/business/video-interviews](https://www.sebenzahub.co.za/dashboard/business/video-interviews)) — async one-way and live two-way video interviews.
- **Scorecards** ([https://www.sebenzahub.co.za/dashboard/business/scorecards](https://www.sebenzahub.co.za/dashboard/business/scorecards)) — structured interview feedback against a competency framework.
- **Background Checks** ([https://www.sebenzahub.co.za/dashboard/business/background-checks](https://www.sebenzahub.co.za/dashboard/business/background-checks)) — third-party verification before extending an offer.
- **AI Candidate Summary** — embedded on every candidate record (no standalone page).
- **AI Candidate Screening, Match Scoring, Resume vs JD Scoring, Batch Screening** — embedded on candidate records and accessible via per-card actions on the Pipeline.

## 1. AI matching and screening

Four always-on AI features score CVs against requisitions and surface as numbers on every candidate card. None of them have a dedicated sidebar item — they run constantly in the background and you interact with them from the Pipeline and the candidate record.

### AI Candidate Screening — _Tier: Premium · Metered_

**What this feature is.** Automated AI-powered CV screening that evaluates every applicant against the requisition's criteria and returns a ranked shortlist with reasoning per candidate.

**Why it matters.** Screening 300 CVs manually takes 10 hours; AI does it in 10 minutes with more consistency than any single recruiter. This is the biggest time-saver in the entire TA workflow. The metering aligns cost with the volume of requisitions you're actually screening — corporate plans typically include enough headroom for ongoing hiring without surprises, but high-season volume can tip you over the included tier.

**How to use it.** Runs automatically on every new application that passes knockouts. Open the requisition's screening workspace from the Pipeline to see the ranked list and the AI's reasoning per candidate. Override the rank where the reasoning misses context (e.g. internal candidate the AI doesn't know is a strong fit because of context outside the CV).

![[c-ch07-ai-candidate-screening-shortlist.png]]

### AI Resume vs JD Scoring — _Tier: Standard_

**What this feature is.** A targeted comparison of one specific resume against one specific job description, producing a percentage fit and a written explanation.

**Why it matters.** Hiring-manager calls always involve "is this person right for the role?" This is the one-click answer — faster than re-reading the CV, defensible to the hiring manager when they ask why you advanced a particular candidate. It's also the artifact you can attach to an audit trail entry that says "this candidate was advanced because of X, Y, Z" rather than "the recruiter's gut said yes".

**How to use it.** Click **Score against JD** on any candidate card. Useful when re-running an existing candidate (someone in the Candidates database from a previous req) against a new role, or when the hiring manager asks for a written rationale.

![[c-ch07-resume-vs-jd-scoring-card.png]]

### AI Candidate-Job Matching — _Tier: Premium · Metered_

**What this feature is.** AI-scored matching with detailed breakdowns across skills, experience, location, and culture fit — the underlying engine that powers candidate ranking on every Pipeline card.

**Why it matters.** Match scores are the single most useful number in a recruiter's day. They focus your attention on the right 10 of 200 candidates instead of forcing you to read all 200. The breakdown lets you defend the ranking when a hiring manager asks "why is this candidate ranked higher than that one?" with structured evidence rather than a guess.

**How to use it.** Surfaces automatically as the match score on every Pipeline card. Click into the score for the breakdown by dimension — useful when a candidate scores high overall but you want to understand which dimension is carrying the score (sometimes it's the location dimension carrying a weak skills match, which is a bad reason to advance).

### Batch Screening — _Tier: Premium · Metered_

**What this feature is.** Screens multiple candidates against a JD simultaneously, producing a ranked batch report you can review in one session.

**Why it matters.** High-volume requisitions (call centres, graduate programmes, retail) bring 500+ applications. Batch screening turns a multi-day review into a 20-minute one without losing quality. For corporate hiring, this is the feature that makes graduate-recruitment season feasible without doubling headcount.

**How to use it.** From the screening workspace, select multiple candidates → **Batch screen**. The report ranks them and groups them into advance / maybe / reject buckets you can act on with bulk actions on the Pipeline.

![[c-ch07-batch-screening-report.png]]

## 2. Configure the screening criteria

### Screening Roles — _Tier: Standard_

**Where it lives.** [https://www.sebenzahub.co.za/dashboard/business/screening-roles](https://www.sebenzahub.co.za/dashboard/business/screening-roles), in the **Screen & Evaluate** sidebar group.

**What it does.** Screening Roles is where the qualifying-question sets and screening criteria for each role family are maintained. The criteria attach to a requisition at posting time (see [[01 How-To Documents/corporate/05-posting-jobs|Chapter 5]]) and are reused across requisitions in the same family — Junior Engineering, Senior Engineering, Sales, Operations, Customer Support, Graduate Programme, etc. — so you're not redefining "what does a Senior Engineer screen for?" on every new req.

**Why it matters.** Without role-family criteria, every recruiter screens differently and the result is the wrong-people-advanced problem that destroys hiring-manager trust in the TA function. Centralising the criteria fixes this and makes the screening defensible — the audit trail shows exactly which question set each candidate was screened against.

**How to use it.**

1. Define a role family (e.g. "Senior Engineering") with the must-have criteria — work eligibility, notice period band, salary expectation band, the technical signal questions.
2. Attach the role-family screening criteria to each new requisition as you create it. The chatbot (next section) and the AI screening engine both consume the criteria automatically.
3. Revisit the criteria quarterly. Markets shift; what was a must-have a year ago may now be a nice-to-have, and the Requirement Restriction Analyzer in the Pipeline (Ch.6) will tell you when a criterion is doing more harm than good.

![[c-ch07-screening-roles-editor.png]]

### Screening Bot — _Tier: Premium_

**Where it lives.** [https://www.sebenzahub.co.za/dashboard/business/screening-bot](https://www.sebenzahub.co.za/dashboard/business/screening-bot), in the **Screen & Evaluate** sidebar group.

**What it does.** A conversational pre-screen that runs at the **Applied** stage, asks the qualifying questions you'd otherwise ask on a first phone screen (notice period, salary expectation, must-have qualifications, work eligibility, location), and surfaces a structured result on the candidate record. You configure the question set per role family using **Screening Roles**; the bot handles tone and follow-up clarification.

**Why it matters.** Recruiter time spent on first phone screens is the single biggest time tax in volume hiring. The bot doesn't replace the phone screen for a senior or scarce-skill role — but for the high-applicant volume requisitions where most candidates fail on a basic must-have, it removes the work entirely and surfaces only the candidates worth a real call.

**When to use it.**

- Volume hiring where recruiter time on first screens is the bottleneck. Removes the worst time tax in any high-applicant-count requisition.
- Skip it for executive search and scarce-skill engineering — at that level the candidate experience is the recruitment, and a chatbot first-touch feels patronising.

![[c-ch07-screening-bot-conversation.png]]

While the AI is working you'll see a multi-phase **AI Progress Messaging** indicator — drafting, validating, scoring, finalising — so you know the model is progressing rather than wondering if the page has hung.

### AI Candidate Summary — _Tier: Premium_

**Where it lives.** Embedded on every candidate record across the dashboard. There is no standalone page.

**What it does.** A one-paragraph summary that pulls the highlights from CV, application answers, and any captured screening conversation — strengths, gaps, interesting context. Updates as the candidate moves through the pipeline.

**When to use it.** Every time you open a candidate record after the first screen. Saves the recruiter and the hiring manager from re-reading the same CV across stages, which is what causes interviewer fatigue and inconsistent rating across a panel.

**A note on judgement.** AI Candidate Summary, the Screening Bot, and AI Candidate Screening are good at narrowing 200 candidates to a shortlist of 20. They are not good at picking the one you should hire. Use them for the first kind of work; make the second yourself.

![[c-ch07-ai-candidate-summary.png]]

## 3. Interviews and scorecards

### Video Interviews — _Tier: Premium_

**Where it lives.** [https://www.sebenzahub.co.za/dashboard/business/video-interviews](https://www.sebenzahub.co.za/dashboard/business/video-interviews), in the **Screen & Evaluate** sidebar group.

**What it does.** Schedules and hosts video interviews against candidate records — both async one-way (the candidate records answers to set questions on their own time) and live two-way (synchronous panel interviews). Recordings, transcripts, and the link to the relevant scorecard are kept against the candidate record.

**Why it matters.** Async one-way video is the cheapest way to get a structured first-round signal on a candidate without a recruiter on the call — useful for high-volume requisitions where 50 candidates need a basic communication and motivation check. Live video is just calendar-integrated video for the panel interviews you were going to do anyway, with the difference that everything stays attached to the candidate record rather than scattered across Zoom recordings nobody can find.

**How to use it.**

1. From the candidate record or the pipeline, schedule a video interview. Choose async (set the questions and a deadline) or live (pick attendees and a time slot).
2. For async, the candidate gets a link, records their answers, and the recording lands back on the record. Reviewers watch on their own time and leave a scorecard.
3. For live, the interview is calendar-invited to attendees with the meeting link. Recording is available with consent.
4. Pair video with a scorecard (next section). The recording is evidence; the scorecard is the structured judgement.

![[c-ch07-video-interview-async-recording.png]]

### Scorecards — _Tier: Standard_

**Where it lives.** [https://www.sebenzahub.co.za/dashboard/business/scorecards](https://www.sebenzahub.co.za/dashboard/business/scorecards), in the **Screen & Evaluate** sidebar group.

**What it does.** Scorecards are the structured feedback form interviewers fill out against a competency framework. Each scorecard ties the rating, written feedback, and interviewer to a specific candidate, requisition, and stage — and the aggregated view shows the panel's collective verdict before you make the offer call.

**Why it matters.** Unstructured feedback ("seemed fine, would hire") is how hiring decisions become legally indefensible and how interviewers anchor on the wrong things. Scorecards force the interviewer to rate against the competencies that matter, give written rationale, and let the panel's verdict be aggregated rather than averaged in someone's head. They're also the input for the hiring-to-performance loop covered in [[01 How-To Documents/corporate/13-workforce-and-hr|Chapter 13]] — without scorecards, you can't tell six months later whether your interviewers are good at predicting who'll perform.

**How to use it.**

1. Define a scorecard template per role family — the competencies (technical, behavioural, leadership) you want to rate, on a consistent scale (typically 1–4 with no neutral midpoint).
2. Attach the relevant scorecard to each interview round. Interviewers see the scorecard alongside the candidate record and complete it in the platform rather than in email.
3. Once the panel has all submitted, the aggregate view shows individual ratings, written feedback, and the average. Disagreement (e.g., one strong-no on a panel of three strong-yeses) is surfaced rather than averaged out — that disagreement is the conversation worth having before offering.

![[c-ch07-scorecard-panel-aggregate.png]]

4. **For interviewers who are not full team members,** use the scorecard-only flow. They can leave structured feedback without consuming a Team Member seat — set this up in [[01 How-To Documents/corporate/03-setting-up-your-org|Chapter 3]].

**Standardise scorecards across the function.** Different scorecards for different recruiters or hiring managers means no useful comparison across hires. One scorecard per role family, used by everyone — TA-leader responsibility to enforce.

## 4. Verification

### Background Checks — _Tier: Standard · per-check fees_

**Where it lives.** [https://www.sebenzahub.co.za/dashboard/business/background-checks](https://www.sebenzahub.co.za/dashboard/business/background-checks), in the **Screen & Evaluate** sidebar group.

**What this feature is.** Background Checks is the page where you order verification on a candidate before extending an offer — criminal record, credit, qualification, employment history, and reference checks — and where the results, timestamps, and consent records are kept for audit. The platform integrates with third-party verification providers; you order the package, the candidate completes consent, the provider runs the check, and the result lands back on the candidate record.

**Why it matters.** SA hiring at any scale needs verification — qualifications get embellished, criminal records get hidden, and the cost of a bad senior hire is far higher than the cost of the check. Doing it inside the platform keeps the consent record, the result, and the audit trail tied to the candidate, which is what you need when an EE audit asks "what verification did you do before this hire?" or when a regulator (financial-services FAIS, healthcare HPCSA) asks for the registered-professional check.

**How to use it.**

1. From the candidate record, click **Run background check** and pick the package — typically Criminal + Credit for permanent hires, plus Qualifications for senior or regulated roles.
2. The candidate receives a consent request via email. They cannot proceed without explicit consent — this is a POPIA requirement and the platform records the consent against the candidate record with a timestamp.

![[c-ch07-background-check-consent-flow.png]]

3. The verification provider runs the check. Turnaround varies: criminal record checks are typically 24–48 hours, qualification verification can take a week.
4. The result lands on the candidate record with a status (clear / flagged / failed). Flagged results need a human review before you proceed; the system does not auto-reject.

![[c-ch07-background-check-result.png]]

5. The Audit Trail (covered in [[01 How-To Documents/corporate/12-compliance-and-audit-trail|Chapter 12]]) records who ordered the check, when consent was captured, and when the result returned.

**When to order.** At the offer stage, not at screening. Background checks cost real money — only run them on candidates you're seriously about to offer. For client-mandated checks (regulated industries — financial services, healthcare, education), order earlier in the process; the cost is part of the cost of operating in those sectors.

**Privacy.** Results contain sensitive personal data. They're stored encrypted with access logged in the audit trail. Don't export, don't email, don't store outside the platform.

**During the trial.** Background Checks have a per-trial cap of **2 checks**. After two, you'll be prompted to upgrade to a paid plan to run more. This protects against trial abuse — the verification API costs real money per call.

**POPIA reality.** Background checks are processing of personal information by an Operator on your behalf. Your relationship with the verification provider is governed by the Sebenza-managed contract; the consent record on the candidate side is the part you have to do correctly, and the platform makes that part mechanical.

## How to combine the screening tools — a defensible sequence

For a typical mid-level corporate role, here's a sequence that combines the screening tools well:

1. **Application** — knockout questions on the requisition auto-reject the unqualified (configured in Screening Roles)
2. **Auto** — Screening Bot runs, AI Candidate Screening assigns rank, Engagement Scorer (covered in [[01 How-To Documents/corporate/06-receiving-applications|Chapter 6]]) starts watching
3. **Triage** — review chatbot transcripts and AI rank for the top 20 candidates; decide who advances using the AI Candidate Summary as your re-read aid, the Resume vs JD Scoring report as your defensible rationale
4. **Hiring-manager shortlist review** — the hiring manager reviews the shortlist (with summaries, not raw CVs) and confirms who they want to interview. Use the Hiring Manager Portal (covered in [[01 How-To Documents/corporate/19-advanced-and-ai-orchestration|Chapter 19]]) to keep this in-platform rather than email.
5. **Video interview round** — async one-way for the volume cut (top 20 → top 8), live two-way for the panel round (top 8 → top 3)
6. **Scorecards** — every interview leaves a scorecard. Aggregate view for the panel debrief.
7. **Background check** — only for the candidate(s) you're offering. Order at the offer-creation moment.

Each layer rejects a smaller, more carefully-selected portion of the funnel. By the time someone reaches a background check, you're confident enough to spend money on verification.

## Pro tips

- **Read AI screening outputs, don't worship them.** Override is always there. AI scores can be biased against unconventional career paths, gaps, and underrepresented backgrounds. Your Diversity Analytics ([[01 How-To Documents/corporate/14-analytics-and-reporting|Chapter 14]]) tracks whether your AI-assisted decisions are skewing demographics — if your AI-screened shortlist is significantly less diverse than the application pool, that's a signal to audit.
- **Don't rely on a single tool.** Chatbot alone is too thin (people game the question set). AI Candidate Screening alone misses context the CV doesn't show. Scorecards alone miss verification. Combine.
- **Order background checks once, late.** Don't burn money checking everyone — only the people you're committed to offering. The exception is regulated sectors where the check is mandatory at shortlist, not at offer.
- **Audit your screening for bias quarterly.** Run Diversity Analytics on your last 100 screenings. If demographics drop sharply at one stage, that stage has a bias problem — and it's almost always at the chatbot or at the hiring-manager shortlist review, not at the AI screening engine.
- **Keep Screening Roles fresh.** Quarterly review against the Requirement Restriction Analyzer is the difference between criteria that filter for fit and criteria that filter for "people who look like the last person we hired".

## Checklist

- [ ] Screening Roles are defined per role family and attached to live requisitions
- [ ] Screening Bot is configured and running on every volume requisition; bypassed for executive search
- [ ] AI Candidate Screening is being read on every shortlist; the override is being used where context warrants
- [ ] AI Candidate-Job Matching scores are visible on Pipeline cards and informing the daily triage
- [ ] Batch Screening is in use on the high-volume requisitions (graduate programmes, call centres, retail)
- [ ] Video Interviews are linked to a scorecard for every round; recordings stay on the candidate record
- [ ] Scorecard templates exist per role family with competencies that match the rest of the framework (and align to the Performance Management framework in Chapter 13)
- [ ] Background Checks are run before every offer; consent is captured before any third-party data flows
- [ ] AI Candidate Summary is being used to compress re-reads, not to make decisions
- [ ] Diversity Analytics is reviewed quarterly to detect bias drift in the screening funnel

## Features covered in this chapter

| # | Feature | Tier | Route |
|---|---------|------|-------|
| 1 | Screening Roles | Standard | [https://www.sebenzahub.co.za/dashboard/business/screening-roles](https://www.sebenzahub.co.za/dashboard/business/screening-roles) |
| 2 | Screening Bot | Premium | [https://www.sebenzahub.co.za/dashboard/business/screening-bot](https://www.sebenzahub.co.za/dashboard/business/screening-bot) |
| 3 | AI Candidate Screening | Premium · Metered | _embedded on candidate records and Pipeline_ |
| 4 | AI Resume vs JD Scoring | Standard | _per-card action on Pipeline_ |
| 5 | AI Candidate-Job Matching | Premium · Metered | _embedded as match score on every Pipeline card_ |
| 6 | Batch Screening | Premium · Metered | _from the screening workspace_ |
| 7 | AI Candidate Summary | Premium | _embedded on candidate records_ |
| 8 | Video Interviews | Premium | [https://www.sebenzahub.co.za/dashboard/business/video-interviews](https://www.sebenzahub.co.za/dashboard/business/video-interviews) |
| 9 | Scorecards | Standard | [https://www.sebenzahub.co.za/dashboard/business/scorecards](https://www.sebenzahub.co.za/dashboard/business/scorecards) |
| 10 | Background Checks | Standard · per-check fees · trial cap of 2 | [https://www.sebenzahub.co.za/dashboard/business/background-checks](https://www.sebenzahub.co.za/dashboard/business/background-checks) |

## Next chapter

[[01 How-To Documents/corporate/08-interviewing|Chapter 8 — Interviewing]]

## References

- [[02-concepts/application-lifecycle]] — Candidate lifecycle and stage model
- [[02-concepts/ai-features]] — AI capabilities in screening
- [[02-concepts/compliance]] — POPIA, EE, and bias auditing context
- [[01 How-To Documents/corporate/05-posting-jobs|Chapter 5 — Posting jobs]]
- [[01 How-To Documents/corporate/06-receiving-applications|Chapter 6 — Receiving applications]]
- [[01 How-To Documents/corporate/08-interviewing|Chapter 8 — Interviewing]]
- [[01 How-To Documents/corporate/12-compliance-and-audit-trail|Chapter 12 — Compliance and audit trail]]
- [[01 How-To Documents/corporate/13-workforce-and-hr|Chapter 13 — Workforce and HR]]
- [[01 How-To Documents/corporate/14-analytics-and-reporting|Chapter 14 — Analytics and reporting]]
- [[01 How-To Documents/corporate/19-advanced-and-ai-orchestration|Chapter 19 — Advanced and AI orchestration]]
