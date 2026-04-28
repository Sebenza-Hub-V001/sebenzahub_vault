---
title: "Chapter 8 — Interviewing"
type: concept
created: 2026-04-26
updated: 2026-04-26
tags: [how-to, corporate, interviews, scheduling, ai-questions, interview-kits]
status: active
user-types: [business]
---

# Chapter 8 — Interviewing

Interviewing is where most hiring time disappears — calendar back-and-forth, panel coordination, manager prep on the way to the room, and inconsistent question sets across interviewers. The **Interview** sidebar group has four pages and they're sequenced to remove that disappearance: pick the time, let candidates self-serve where possible, hand interviewers a kit they can take into the room, and have the AI fill the candidate-specific gaps the standard kit doesn't cover.

The pages you'll use:

- **Scheduling** ([https://www.sebenzahub.co.za/dashboard/business/scheduling](https://www.sebenzahub.co.za/dashboard/business/scheduling)) — recruiter-driven scheduling with calendar integration.
- **Self-Scheduling** ([https://www.sebenzahub.co.za/dashboard/business/self-scheduling](https://www.sebenzahub.co.za/dashboard/business/self-scheduling)) — candidate picks a slot from a configured availability window.
- **Interview Kits** ([https://www.sebenzahub.co.za/dashboard/business/interview-kits](https://www.sebenzahub.co.za/dashboard/business/interview-kits)) — the maintained question bank and round structure per role family.
- **AI Questions** ([https://www.sebenzahub.co.za/dashboard/business/ai-questions](https://www.sebenzahub.co.za/dashboard/business/ai-questions)) — generates the candidate-specific layer of questions on top of the kit.

## Schedule the interview

### Scheduling — _Tier: Standard_

**Where it lives.** [https://www.sebenzahub.co.za/dashboard/business/scheduling](https://www.sebenzahub.co.za/dashboard/business/scheduling), in the **Interview** sidebar group.

**What it does.** Scheduling is the recruiter-driven interview calendar — see all upcoming and pending interviews across the team, pick a slot, invite the panel, and send the candidate a calendar invite with the meeting details. Integrates with your calendar provider so panel availability is real, not asserted.

**Why it matters.** Most interview slips happen at scheduling: the recruiter holds five back-and-forth emails with the candidate, the hiring manager declines on the morning of, the panel composition shifts, nobody updates the candidate. Centralised scheduling makes the state visible — every interview has a confirmed slot, a confirmed panel, and a confirmed candidate, or it's surfaced as pending with the blocker.

**How to use it.**

1. From the candidate record or the pipeline, click **Schedule interview**.
2. Pick the interview type (recruiter screen, hiring manager interview, panel, technical, executive). The system pulls the panel's calendar availability for the suggested slots.
3. Confirm the slot. The candidate gets a calendar invite with the meeting link and any prep materials; the panel gets the same invite plus the relevant Interview Kit.

![[c-ch08-scheduling-panel-availability.png]]

4. Reschedules are first-class — both the candidate and the panel see the same updated state, no email-thread chaos.

## Let candidates self-serve a slot

### Self-Scheduling — _Tier: Premium_

**Where it lives.** [https://www.sebenzahub.co.za/dashboard/business/self-scheduling](https://www.sebenzahub.co.za/dashboard/business/self-scheduling), in the **Interview** sidebar group.

**What it does.** Self-Scheduling lets the recruiter open a window of availability for a specific interview round and lets the candidate pick a slot from it. The recruiter sets the constraints (which panel members, which time windows, max number of interviews per day); the candidate sees only the slots that fit those constraints; the chosen slot becomes a calendar invite for everyone.

**Why it matters.** The single biggest scheduling time sink is calendar Tetris between recruiter, candidate, and panel. Self-scheduling shifts that burden to the candidate, who has the smallest schedule to coordinate, while preserving the constraints that matter to you. For volume roles where 30 interviews a week are normal, this is the difference between a recruiter spending two days on calendar vs two hours.

**When to use it.**

- Always for first-round screens and high-volume roles.
- Cautiously for senior or executive interviews where the candidate experience expects a white-glove scheduling touch from a recruiter.

![[c-ch08-self-scheduling-candidate-view.png]]

## Hand interviewers a kit

### Interview Kits — _Tier: Standard_

**Where it lives.** [https://www.sebenzahub.co.za/dashboard/business/interview-kits](https://www.sebenzahub.co.za/dashboard/business/interview-kits), in the **Interview** sidebar group.

**What it does.** Interview Kits is the maintained question bank and round structure per role family. Each kit defines the rounds (recruiter screen, technical, behavioural, panel, executive), the competencies each round is meant to assess, and the canonical question set the interviewer takes into the room. The kit is auto-attached to the calendar invite when an interview is scheduled.

**Why it matters.** Without a maintained kit, every interviewer makes up their own questions and the panel ends up triangulating on inconsistent signal. A maintained kit gets new interviewers up to a defensible standard fast, and over time it becomes the place the team improves the interview itself — when a question doesn't predict performance, you remove it.

**How to use it.**

1. Build a kit per role family. Reuse the competency framework from the Scorecards in [[01 How-To Documents/corporate/07-screening-and-evaluating|Chapter 7]] — interview, scorecard, and (eventually) performance review should share the same competency vocabulary.
2. For each round in the kit, pick the must-have questions and a pool of optional probes. Tag each question with the competency it's testing.
3. Pair the kit with the corresponding scorecard so the interviewer sees question and rating side-by-side in the room.

![[c-ch08-interview-kit-question-bank.png]]

4. Review the kit quarterly. Questions that nobody is using and competencies where the interview signal disagrees with first-year performance are the candidates for replacement.

## Add the candidate-specific layer

### AI Questions — _Tier: Premium_

**Where it lives.** [https://www.sebenzahub.co.za/dashboard/business/ai-questions](https://www.sebenzahub.co.za/dashboard/business/ai-questions), in the **Interview** sidebar group.

**What it does.** Generates interview questions tailored to the role and the specific candidate's CV — competency-based for the must-haves, scenario-based for the behavioural dimensions, and probing follow-ups for any CV gap or unusual signal. Output is structured so an interviewer can take it into the room as-is.

**When to use it.**

- When you don't have a maintained interview kit per role family — AI Questions gives you a credible starting point fast.
- When a CV throws something unusual the standard kit doesn't cover — the AI surfaces probes the kit wouldn't have.
- Pair it with the **Interview Kits** library for the standard backbone — AI Questions adds the candidate-specific layer rather than replacing the kit.

![[c-ch08-ai-questions-output.png]]

While the AI is working you'll see a multi-phase **AI Progress Messaging** indicator — drafting, validating, scoring, finalising — so you know the model is progressing rather than wondering if the page has hung.

## Checklist

- [ ] Scheduling is the only place interviews get booked — no side-channel calendar emails
- [ ] Self-Scheduling is on for first-round screens and volume roles; off for senior / executive
- [ ] An Interview Kit exists per active role family with rounds, questions, and competencies that match the scorecard framework
- [ ] AI Questions is being used as the candidate-specific top-up on top of the kit, not as the kit replacement
- [ ] The kit is reviewed quarterly against the hiring-to-performance loop in Chapter 13

## Features covered in this chapter

| # | Feature | Tier | Route |
|---|---------|------|-------|
| 1 | Scheduling | Standard | [https://www.sebenzahub.co.za/dashboard/business/scheduling](https://www.sebenzahub.co.za/dashboard/business/scheduling) |
| 2 | Self-Scheduling | Premium | [https://www.sebenzahub.co.za/dashboard/business/self-scheduling](https://www.sebenzahub.co.za/dashboard/business/self-scheduling) |
| 3 | Interview Kits | Standard | [https://www.sebenzahub.co.za/dashboard/business/interview-kits](https://www.sebenzahub.co.za/dashboard/business/interview-kits) |
| 4 | AI Questions | Premium | [https://www.sebenzahub.co.za/dashboard/business/ai-questions](https://www.sebenzahub.co.za/dashboard/business/ai-questions) |

## Next chapter

[[01 How-To Documents/corporate/09-making-offers|Chapter 9 — Making offers]]

## References

- [[01 How-To Documents/corporate/07-screening-and-evaluating|Chapter 7 — Screening and evaluating]]
- [[01 How-To Documents/corporate/09-making-offers|Chapter 9 — Making offers]]
- [[01 How-To Documents/corporate/13-workforce-and-hr|Chapter 13 — Workforce and HR]]
