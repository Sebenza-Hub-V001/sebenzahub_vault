---
title: "Chapter 12 — Tracking applications and follow-ups"
type: concept
created: 2026-04-09
updated: 2026-04-20
tags: [how-to, individual, applications, tracking, application-tracking, analytics-dashboard]
status: active
user-types: [individual]
---

# Chapter 12 — Tracking applications and follow-ups

You've started applying. Within a couple of weeks you'll have somewhere between five and twenty live applications, each one in a different stage, with different people, on different timelines. Without a system, you will lose track. With a system, you'll know exactly where things stand and when to nudge.

This is the chapter where Sebenza Hub stops being a job board and starts being a CRM for your own job hunt. Use it.

## The base feature: Application Tracking

Before you get into the kanban boards and analytics, the foundation is the simple status list — every application you've made, where it sits today, what the recruiter has done with it.

### Application Tracking — _Tier: see Pricing_

**What this feature is.** Application Tracking is a status list of every job you've applied to, showing the recruiter's pipeline stage for each one — received, reviewed, shortlisted, interviewed, rejected, offered. The same record is visible to both you and the recruiter, so the status you see is the actual status, not a guess.

**Why it matters.** Job seekers apply to dozens of roles in parallel, and losing track means missed interviews and rescinded offers. Keeping tracking accessible on the entry tier is a trust signal — Sebenza Hub gets paid when you get hired, not when you click apply, and the tracker is the proof of that. Without this, the platform would be just another job board.

**How to use it.** Open **My Applications** (`/dashboard/individual/applications`) — the flat list view. Sort by date, status, or company. Click into any application to see full detail and history. This view is your daily ground truth; everything else in this chapter is built on top of it.

![[i-ch12-my-applications-list.png]]

> **Cross-reference:** The **Application Portal** (the multi-tab control centre with kanban, wellbeing, momentum, and ghost detection) is introduced in Chapter 11. This chapter focuses on what you do with the data once you can see it.

## The pages you'll be living in

The Track Applications section of the dashboard has nine pages, but you only need three of them daily:

| Page | What it's for | How often you'll use it |
|------|---------------|-------------------------|
| **My Applications** (`/applications`) | Flat list of every application, sortable | Almost every visit |
| **Application Tracker** (`/application-tracker`) | Visual pipeline (kanban) view | A few times a week |
| **Inbox** (`/inbox`) | Messages from recruiters and employers | Every visit |

The other six pages are useful but not essential right away:

- **Application Analytics** — patterns and success rates (covered below)
- **Notes & Tags** — per-application personal notes
- **Reminders** — follow-up reminders (covered below)
- **Application Portal** — multi-tab applications control centre (introduced in Chapter 11; deeper section below)
- **Candidate Hub** — eight-tab career command centre (deeper section below)
- **Experience Surveys** — post-interview feedback you give to the platform

## Understanding the pipeline stages

Every application moves through stages. Some applications skip stages, some get stuck, some go backwards. Here's the meaning of each:

| Status | What it actually means |
|--------|------------------------|
| **Applied** | You submitted. Nobody has done anything yet. Default state. |
| **Shortlisted** | A recruiter or employer flagged you for further review. Good news. |
| **Screening** | Active screening — CV review, screening chatbot, background check, or competency test |
| **Interview** | An interview is scheduled. See Part 4. |
| **Offer** | You've been offered the role. See Chapter 15. |
| **Hired** | You accepted. The job is yours. |
| **Rejected** | You're out of consideration at this stage. |
| **Withdrawn** | You pulled out (or you were withdrawn) |

### What "stuck in Applied" actually means

If an application sits at `Applied` for more than a week, one of three things is happening:

1. **The employer hasn't reviewed yet.** Common, especially for high-volume roles. Wait a bit longer.
2. **You've been silently passed over** and the employer isn't updating statuses. Also common.
3. **It's a ghost listing.** Check the ghost-risk score on the original job listing.

You can't always tell which one. But the right move is the same in all three cases: set a follow-up reminder, then move on with other applications.

## Application Tracker (the kanban view)

Open **Application Tracker** (`/dashboard/individual/application-tracker`). It shows your applications grouped into pipeline columns: New, Screening, Interview, Offer, Placed, Rejected, Withdrawn.

This view is the most useful one when you have more than three or four applications running. You can:

- See at a glance how many are in each stage
- Spot stuck applications (anything in `New` or `Screening` for too long)
- Notice when you have nothing in interview stage (a sign you need to apply more, or apply better)
- Notice when you have *many* in interview stage (a sign to slow down on new applications and focus on prep)

![[i-ch12-application-tracker-kanban.png]]

Look at it once or twice a week, not every day.

## Application Notes

Open any application from My Applications and you'll see a Notes section. Use it. Write down:

- **Why you applied.** "Saw it because it explicitly listed PostgreSQL — that's my strong skill."
- **What's specific about this one.** "Recruiter is Khanyi from Acme. Mentioned they're hiring for two parallel teams."
- **Anything you should remember if interviewed.** "Pitch the team-of-six experience, not the IC work."
- **Things you noticed about the JD that might come up.** "They emphasised 'fast-paced' three times — be ready for that question."

Notes are private. They're for future-you, who is going to walk into an interview three weeks from now and not remember why this one mattered.

## Tags

Tags are short labels you attach to applications. Use them to group across the kanban: priority, theme, source, anything you want.

Some tag systems that work:

- **Priority**: `dream-job`, `solid`, `backup`
- **Source**: `auto-match`, `referral`, `manual-search`
- **Status notes**: `referred`, `ghosted`, `recruiter-engaged`

Don't over-engineer this. Three or four consistent tags beat fifteen one-off ones.

## Follow-up reminders

Go to **Follow-up Reminders** (`/dashboard/individual/follow-up-reminders`).

The platform can remind you to follow up on an application after a set period of silence. Standard cadence:

| Days since applied | What to do |
|--------------------|------------|
| **7 days** | Polite check-in — only if the JD said something like "we'll get back to you within a week" |
| **10–14 days** | Polite check-in for most other roles |
| **3–4 weeks** | Final follow-up. If still silent, consider it dead. |

Set the reminder when you submit the application (Chapter 11 ends; Chapter 12 begins). Don't try to remember.

### How to follow up well

When the reminder fires, send a short message via the Inbox:

> "Hi [name], I just wanted to check on the status of my application for [role]. I'm still very interested and happy to provide any additional information you need. Best, [your name]."

That's it. Don't pitch, don't summarise your CV, don't apologise. The point is to surface that you're still around without being annoying. One follow-up is fine; two is the maximum; three crosses into nuisance.

If they don't respond to the second follow-up, mark the application as effectively dead and move on. Don't waste emotional energy on silence.

## The Inbox

**Inbox** (`/dashboard/individual/inbox`) is where recruiters and employers reach you, and where you reply. It's a threaded messaging interface, like email but tied to specific applications.

A few things to know:

- **Reply quickly when contacted by a real recruiter.** A reply within a day signals you're engaged. A reply after a week signals you're not.
- **Keep messages short and professional.** No emojis. No filler.
- **Treat every recruiter contact as the start of an interview.** What you write shapes their first impression of you as much as your CV does.
- **Use the inbox, not personal email.** Replies through the platform get logged on the application — your future self can see the full thread when reviewing the application.

## Application Analytics

### Analytics Dashboard (Individual) — _Tier: see Pricing_

**What this feature is.** The Analytics Dashboard tracks trends over time across your job hunt: application-to-response ratio, interview-to-offer conversion, skill-test percentiles, and how many recruiters have viewed your profile. Every metric is benchmarked so a number means something — "12% response rate" tells you whether you're above or below the typical candidate in your role band.

**Why it matters.** Data turns a frustrating, vibes-based job search into a diagnosable problem. "You got 40 profile views but no responses — your CV isn't matching" is far more actionable than guessing why nothing's working. Most candidates spend months making the same mistakes invisibly; the dashboard makes the mistakes visible enough to fix.

**How to use it.**

Open **Application Analytics** (`/dashboard/individual/application-analytics`) once you have at least 10 applications. Before that, the data is too thin to be useful.

It shows:

- **Application volume over time** — how active you've been
- **Stage distribution** — what fraction are in each pipeline stage
- **Response rate** — the share of applications that get any human response
- **Time-to-response** — how long employers typically take to come back
- **Success rate by source** — Auto Match vs Manual Search vs Favourites
- **Success rate by industry / role / company size** — patterns in what's working

Use it to course-correct. If your response rate is below 5% across 20 applications, something is wrong — that's your cue to revisit Chapter 17 (troubleshooting). If response rates are fine but you're stuck at the screening stage, the problem is the CV or the cover letter rather than the targeting.

![[i-ch12-analytics-dashboard.png]]

Don't open Analytics every day. Look at it every two or three weeks, when you have enough new data to learn from.

## Application Portal and Candidate Hub

These two pages look similar at first glance and are easy to confuse. They are different surfaces for different uses, and you'll touch each weekly.

### Application Portal (`/dashboard/individual/portal`)

The Application Portal is your day-to-day applications control centre. It opens on three tabs — **Applications**, **Offers**, **Analytics** — with both list and kanban views of the applications tab. Above the tabs, the page surfaces:

- A **wellbeing check-in** card so you can record how the search is going. The platform uses the trend over time to flag burnout signs (rejection streaks, late-night application bursts, weekly volume).
- **Ghost-job alerts** for applications that look stale, dormant, or unlikely to move.
- A **momentum gauge** with current streak, longest streak, and weekly application velocity over the last 8 weeks.
- AI-drafted communications — follow-ups, status nudges, polite reminders — that you can edit before sending.

Open the Portal whenever you need to act on a specific application: change a stage, draft a follow-up, log an offer. It's the surface where work happens.

### Candidate Hub (`/dashboard/individual/candidate-hub`)

The Candidate Hub is the wider career command centre. It uses eight tabs — **Overview**, **Intelligence**, **Applications**, **Practice Arena**, **Wellbeing**, **Skills**, **Profile & Docs**, **Achievements** — to pull together everything that's happening across your hunt: AI recommendations, recent application activity, momentum, weekly velocity, ghost alerts, practice prep, skill progress, profile completeness, and badges.

If you only had time to look at one page per session, the Candidate Hub is the one — it's calibrated to surface "what needs attention now" rather than asking you to know where to look.

A reasonable rhythm: open the **Candidate Hub** to plan the session, then drop into the **Application Portal** to do the work.

![[i-ch12-candidate-hub-overview.png]]

## A weekly tracking ritual

Once a week, sit down for 15 minutes and:

1. Open **Candidate Hub**. See what needs attention.
2. Open **Application Tracker**. Move things forward where you can. Spot stuck applications.
3. Open **Inbox**. Reply to anything that's been sitting more than 24 hours.
4. Set follow-up reminders on anything that hit the 7- or 14-day mark.
5. Update **Notes** on anything you have new context about.
6. Every other week, glance at **Application Analytics**.

This takes less than 20 minutes and prevents the "I have no idea where any of my applications are" feeling that kills job hunts.

## Checklist

- [ ] Visited My Applications and confirmed every application is showing the correct status
- [ ] Visited the Application Tracker and identified each application's stage
- [ ] Set follow-up reminders for any application stuck in `Applied` for more than a week
- [ ] Added a personal note to at least one application
- [ ] Replied to any messages in your Inbox
- [ ] (paid tiers) Opened Application Analytics once you have 10+ applications
- [ ] You have a weekly tracking ritual you'll actually stick to

## Features covered in this chapter

| # | Feature |
|---|---------|
| 1 | Application Tracking |
| 2 | Analytics Dashboard (Individual) |

## Part 3 complete

You've found jobs, applied to them, and put a tracking system in place. You know where every application is and what needs attention. You're now ready for what happens *after* the application — interviews and offers in Part 4.

## Next chapter

[[01 How-To Documents/individual/13-interview-simulator|Chapter 13 — Using the Interview Simulator]]

## References

- [[02-concepts/application-lifecycle]] — Status enum, full pipeline
- [[03-workflows/individual-journey]] — Step 5 (Track Applications)
- [[01 How-To Documents/individual/13-interview-simulator|Chapter 13 — Using the Interview Simulator]]
