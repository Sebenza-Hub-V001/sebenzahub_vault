---
title: "Chapter 18 — Interview scheduling and interview kits"
type: concept
created: 2026-04-09
updated: 2026-04-09
tags: [how-to, recruiter, interviews, scheduling, calendar]
status: draft
user-types: [recruiter]
---

# Chapter 18 — Interview scheduling and interview kits

Interview scheduling is one of the most underrated time sinks in recruitment. The classic flow — email the candidate, wait, email the hiring manager, wait, find a time, email back, wait — eats hours per role. Sebenza Hub's scheduling tools collapse this to minutes when used properly. This chapter walks through the scheduling flow and the interview kits that make every interview consistent and defensible.

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

The most powerful and most underused mode. You generate a personal scheduling link tied to your calendar availability and the interview type. The candidate clicks the link and picks a time from your real availability. The meeting is created automatically.

Set up self-scheduling links per interview type:
- 30-minute initial screen
- 60-minute technical round
- 90-minute panel
- Custom durations as needed

Then **add the link to every outreach email** as a "book a time directly" option. The candidate response rate jumps significantly when they don't have to negotiate via email.

### 4. Sequence-driven scheduling

When automation rules (Chapter 23) detect a candidate has reached the Interview stage, they automatically email the candidate with a self-scheduling link. The recruiter never has to think about it. This is the goal state — it should handle 70%+ of your interviews if your sequences are configured.

## Interview kits — `/dashboard/recruiter/interview-kits`

An **interview kit** is a structured guide for an interview: the questions to ask, the criteria to evaluate, the time budget per section, and the scorecard to fill in afterwards. Kits make every interview consistent across interviewers, defensible to clients, and far more useful for downstream comparison.

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
- [ ] You've built at least one interview kit and attached it to a job
- [ ] Your time zone, working hours, and daily interview cap are set
- [ ] You're using `no_show` status correctly (not "cancelled")

## Next chapter

[[16-how-tos/recruiter/19-video-interviews|Chapter 19 — Video interviews and AI video analysis]]

## References

- [[02-concepts/application-lifecycle]] — Where interview sits in the full flow
- [[16-how-tos/recruiter/16-the-pipeline|Chapter 16 — The Pipeline]]
- [[16-how-tos/recruiter/17-screening-tools|Chapter 17 — Screening tools (scorecards)]]
- [[16-how-tos/recruiter/19-video-interviews|Chapter 19 — Video interviews]]
