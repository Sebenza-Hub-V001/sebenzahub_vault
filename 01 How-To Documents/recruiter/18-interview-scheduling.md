---
title: "Chapter 18 — Interview scheduling and interview kits"
type: concept
created: 2026-04-09
updated: 2026-04-20
tags: [how-to, recruiter, interviews, scheduling, calendar, scorecards, ai-questions]
status: draft
user-types: [recruiter]
---

# Chapter 18 — Interview scheduling and interview kits

Interview scheduling is one of the most underrated time sinks in recruitment. The classic flow — email the candidate, wait, email the hiring manager, wait, find a time, email back, wait — eats hours per role. Sebenza Hub's scheduling tools collapse this to minutes when used properly. This chapter walks through the scheduling flow, the AI question generator that fills your interview kits, and the scorecards (with AI suggestions) that turn loose interviews into structured, comparable data.

## Where it lives

| Page | What it does |
|---|---|
| `/dashboard/recruiter/scheduling` | Main scheduling page — see and manage interviews |
| `/dashboard/recruiter/self-scheduling` | Generate self-scheduling links candidates can use |
| `/dashboard/recruiter/interview-kits` | Build and manage interview question kits |
| `/dashboard/recruiter/hiring-manager` | The portal where corporate clients give feedback |

## Calendar integration (set this up first)

Before you schedule a single interview, integrate your calendar. Go to `/dashboard/recruiter/settings` → Integrations and connect:

- **Google Calendar** — for Google Workspace users
- **Outlook / Microsoft 365** — for Microsoft Exchange users
- **Zoom** — for video meeting links
- **Microsoft Teams** — same purpose
- **Google Meet** — same purpose

Once connected, the platform reads your calendar availability and creates meetings on your behalf. Without integration, you'll be back-and-forth on email forever.

If your team is on different calendar providers, that's fine — each user connects their own. The platform finds the intersection.

## Scheduling — the core feature

### Interview Scheduling — _Tier: Standard_

**What this feature is.** Automated interview scheduling with Google Calendar / Outlook sync, time-zone handling, video-link generation, and reminder flow. Handles the back-and-forth so you don't have to.

**Why it matters.** Scheduling back-and-forth is the biggest recurring admin drain in recruitment. Automated scheduling reclaims 3–5 hours per week per recruiter — time that goes back into sourcing or screening, not into calendar Tetris.

**How to use it.** From any candidate's record at the Interview stage, click **Schedule**. Pick the interview type, the interviewers, the duration. The platform finds a time that works for all parties and sends the invites.

## The four scheduling modes

There are four ways to schedule an interview, listed from least to most efficient:

### 1. Manual one-shot

The traditional flow. You pick a time, manually invite all parties, manually send the calendar invite. Useful when:
- The interview is unusual (e.g. exec dinner, in-person tour)
- You're scheduling outside normal hours
- The candidate or interviewer is offline / not on email

### 2. Recruiter-proposed times

You pick 3–5 candidate-friendly times from your calendar, the system sends them to the candidate, the candidate picks one. The system confirms with everyone. Useful for:
- High-stakes interviews where you want to influence the time
- Senior candidates you're courting (more attentive UX)

### 3. Self-scheduling links — `/dashboard/recruiter/self-scheduling`

The most powerful and most underused mode. Two features cover this: Self-Scheduling does the booking; Scheduling Links is the shareable URL layer that makes it work without an account.

#### Self-Scheduling — _Tier: Standard_

**What this feature is.** Candidates book their own interview slots from your available times via a shareable link, with no phone tag.

**Why it matters.** Candidates prefer to self-book and interviewers prefer not to coordinate. Self-scheduling speeds the pipeline by 2–3 days while improving candidate experience — and it's what eliminates 80% of the scheduling email volume.

**How to use it.** Set up self-scheduling links per interview type (30-min screen, 60-min technical, 90-min panel) in `/dashboard/recruiter/self-scheduling`. Add the link to every outreach email and template.

#### Scheduling Links — _Tier: Standard_

**What this feature is.** Self-service scheduling links that candidates can use to book time without creating an account on the platform.

**Why it matters.** Zero-friction booking is the difference between 60% and 90% scheduling completion. Links remove the excuse of "I meant to book but forgot to sign up."

**How to use it.** Generated automatically when you create a self-scheduling type. Each link is a unique URL you paste into emails, WhatsApp, or your email signature.

### 4. Sequence-driven scheduling

When automation rules (Chapter 23) detect a candidate has reached the Interview stage, they automatically email the candidate with a self-scheduling link. The recruiter never has to think about it. This is the goal state — it should handle 70%+ of your interviews if your sequences are configured.

## Interview kits — `/dashboard/recruiter/interview-kits`

An **interview kit** is a structured guide for an interview: the questions to ask, the criteria to evaluate, the time budget per section, and the scorecard to fill in afterwards. Kits make every interview consistent across interviewers, defensible to clients, and far more useful for downstream comparison.

### AI Interview Questions — _Tier: Standard_

**What this feature is.** AI-generated behavioural, technical, and situational interview questions tailored to the role.

**Why it matters.** Generic interview questions produce generic signal. Role-specific questions generated in seconds mean every interview is actually discriminating, even when the interviewer is a junior recruiter who hasn't built up a question bank of their own.

**How to use it.** When building an interview kit, click **Generate questions** for each section. Specify role, seniority, focus area (technical depth / behavioural / culture). The AI returns 5–10 questions per section. Review, edit, attach to the kit.

### Anatomy of a good kit

A typical kit for a senior backend developer interview:

1. **Introduction (5 min)** — interviewer intro, role overview, candidate background check
2. **Technical depth (20 min)** — 3 prepared questions on system design, debugging, architecture
3. **Practical problem (20 min)** — a coding or whiteboard exercise
4. **Behavioural / culture (10 min)** — STAR-format questions on collaboration and conflict
5. **Candidate questions (5 min)**
6. **Wrap-up (5 min)** — explain next steps, set expectations on response time

Each section has its own scorecard criteria. The interviewer fills the scorecard *during* the interview, not after — the scoring is part of the interview, not an afterthought.

### Building a kit

1. Open `/dashboard/recruiter/interview-kits`.
2. Click **+ New interview kit**.
3. Pick a template (e.g. "Senior Engineering Interview") or start blank.
4. Add sections with time budgets and questions.
5. Attach the relevant scorecard template (Chapter 17).
6. Save and assign to a job (or set as the default for that job's interview stage).

When you schedule an interview against this job, the kit is automatically attached and visible to whoever is interviewing.

## Scorecards — the structured evaluation layer

Every kit attaches to a scorecard. Two features cover this — Scorecards is the form itself, and Scorecard Suggestions is the AI that improves your rubrics over time.

### Scorecards — _Tier: Standard_

**What this feature is.** Custom structured evaluation forms for interview scoring, with competency rubrics, rating scales, and required responses per criterion.

**Why it matters.** Scorecards force interviewers to evaluate on the same dimensions, which is the foundation of structured hiring. Without them, every interviewer hires "people like me" and you can't defend a shortlist to the client.

**How to use it.** Build templates in `/dashboard/recruiter/scorecards`. 5–8 criteria per scorecard (technical depth, communication clarity, problem-solving, culture fit, motivation). Define what each rating level means — vague rating definitions let bias creep back in. Attach to the relevant interview kit. Every interviewer fills the scorecard *during* the interview, not after.

### Scorecard Suggestions — _Tier: Standard_

**What this feature is.** AI-generated scorecard improvement suggestions — missing dimensions, weak rubrics, ambiguous rating levels.

**Why it matters.** Poorly-designed scorecards produce noise instead of signal. Suggestions help you iterate to high-signal rubrics without needing an industrial / organisational psychology background.

**How to use it.** Open any scorecard template and click **Get suggestions**. The AI flags ambiguous criteria and proposes rewrites. Apply selectively — keep your own language where it carries meaning your team understands.

## Panel templates and multi-interviewer rounds

For panel interviews:

1. From the scheduling page, choose **Panel interview**.
2. Add the interviewers from your team.
3. The system finds a time that works for all of them simultaneously (or, if no slot exists in the next two weeks, surfaces the conflict).
4. Each interviewer gets the same kit, but you can assign sections per interviewer (e.g. interviewer A handles technical, interviewer B handles culture).
5. Each interviewer fills in their portion of the scorecard.
6. The platform aggregates the scores into a panel result.

**Panel templates** save the typical setup. If you always run the same three-person panel for senior dev interviews, save the template once and reuse it.

## The Hiring Manager Portal — `/dashboard/recruiter/hiring-manager`

When the client (corporate hiring manager) needs to be in the loop, you give them access to the Hiring Manager Portal. They get:

- A list of candidates you've shortlisted, with key info
- The interview schedule for their role
- A simplified scorecard for them to fill out after each interview
- A messaging channel to you (kept inside the platform, not over email)

The portal is sandboxed — they only see candidates and roles they've been granted access to. They never see your other clients, your other candidates, or your internal notes.

Use the portal whenever a client wants to be involved in interviewing or feedback. It saves you from being the email bottleneck between the client and their candidates.

## Time zone and working hours

Set these correctly *once* and they save you forever:

- **Your time zone** in `/dashboard/recruiter/settings` → Profile
- **Your working hours** (when you're available for interviews) in Settings → Calendar
- **Buffer times** before and after meetings (to give yourself recovery time)
- **Maximum interviews per day** (e.g. cap at 4 — beyond this you start fatiguing and scoring everyone the same)

The candidate's time zone is detected from their profile. The platform handles conversion automatically — you'll always see times in your local zone, and the candidate sees them in theirs.

## Interview status enum

Each interview has a status that updates as it progresses:

| Status | Meaning |
|---|---|
| `scheduled` | Calendar invite sent |
| `confirmed` | Candidate explicitly confirmed attendance |
| `completed` | Interview happened |
| `cancelled` | Cancelled by either party |
| `rescheduled` | Moved to a new date/time |
| `no_show` | Candidate didn't attend |

The `no_show` status is important — it feeds the candidate's engagement score and the agency's reliability tracking. Don't mark as cancelled if the candidate just didn't show up; mark as `no_show` and the system handles the rest (suppression flag, reliability impact, automated follow-up).

## Pro tips

- **Self-scheduling links eliminate 80% of scheduling email.** If you take only one thing from this chapter, set up self-scheduling and put the link in every outreach email.
- **Interview kits make new team members productive in days, not months.** A junior recruiter following a kit conducts a 4/5 interview from day one. Without a kit, they conduct 2/5 interviews for a year.
- **Always add a buffer.** A 30-minute interview followed immediately by another 30-minute interview is how you mistakenly call the second candidate by the first candidate's name.
- **Cap interviews per day.** Past 4–5 in a day, your judgment degrades. The platform lets you set a cap; use it.
- **Pre-read the candidate.** Five minutes of reading their CV before the interview is the highest-leverage prep you can do. The interview kit's first section reminds you to do it; respect the reminder.
- **Score during the interview, not after.** Memory is unreliable; your scorecard at hour 4 of a marathon day is closer to fiction than fact unless you scored as you went.

## Checklist

- [ ] You've integrated at least one calendar (Google or Outlook)
- [ ] You've integrated at least one video provider (Zoom, Teams, or Meet)
- [ ] You've created at least one self-scheduling link and added it to your outreach emails
- [ ] You've built at least one interview kit with AI-generated questions
- [ ] You have at least one scorecard template attached to a job
- [ ] You've run Scorecard Suggestions on your default scorecard at least once
- [ ] Your time zone, working hours, and daily interview cap are set
- [ ] You're using `no_show` status correctly (not "cancelled")

## Features covered in this chapter

| # | Feature | Tier |
|---|---------|------|
| 144 | AI Interview Questions | Standard |
| 145 | Interview Scheduling | Standard |
| 146 | Self-Scheduling | Standard |
| 149 | Scorecards | Standard |
| 150 | Scheduling Links | Standard |
| 152 | Scorecard Suggestions | Standard |

## Next chapter

[[01 How-To Documents/recruiter/19-video-interviews|Chapter 19 — Video interviews and AI video analysis]]

## References

- [[02-concepts/application-lifecycle]] — Where interview sits in the full flow
- [[01 How-To Documents/recruiter/16-the-pipeline|Chapter 16 — The Pipeline]]
- [[01 How-To Documents/recruiter/17-screening-tools|Chapter 17 — Screening tools (scorecards)]]
- [[01 How-To Documents/recruiter/19-video-interviews|Chapter 19 — Video interviews]]
