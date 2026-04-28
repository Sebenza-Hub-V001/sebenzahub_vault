---
title: "Chapter 18 — \"Hiring managers are unhappy with the calibre\""
type: concept
created: 2026-04-28
updated: 2026-04-28
tags: [how-to, corporate, troubleshooting, hiring-manager, calibre, scenario, predictive-hiring, requirement-analyzer, scorecards]
status: active
user-types: [business]
---

# Chapter 18 — "Hiring managers are unhappy with the calibre"

This is the conversation every TA leader dreads. The hiring manager has interviewed your shortlist and they're disappointed. They might say it gently ("we were hoping for stronger candidates") or directly ("none of these are what we asked for"). Either way, it's the moment your relationship with the hiring manager and your read of the role both come into question.

This chapter is about diagnosing why the disconnect happened and how to handle the conversation in a way that keeps the relationship and improves the next round.

## The first rule: don't get defensive

Your instinct will be to defend the candidates, the recruiter, or the brief. Don't. The hiring manager is telling you something useful — they've seen something you missed, or you've heard something they didn't say clearly. Your job in the first conversation is to **understand**, not to defend.

A defensive TA function loses the relationship with the function it's hiring for. A curious TA function saves it.

## The diagnostic conversation

When a hiring manager raises concerns, the goal of the first conversation is to extract specific information you can act on. Not feelings — data.

### Questions to ask

These are the right questions, in roughly this order:

1. **"Can you tell me which candidate gave you the most concern, and what specifically?"** (Specifics over generalities. You can't fix "they weren't great"; you can fix "they couldn't talk through the database design.")

2. **"What were you hoping to see that wasn't there?"** (Surfaces the gap between your understanding of the brief and theirs.)

3. **"Was it consistent across the candidates, or was one a particular outlier?"** (Tells you whether the problem is systemic or one bad submission.)

4. **"Has anything changed in what you're looking for since we agreed the brief?"** (Often, yes — and the hiring manager hasn't told you yet.)

5. **"Looking at the JD we agreed to, is there anything you'd update now?"** (Polite way of saying "is the brief itself still right?")

6. **"Who else interviewed them on your side, and is there a chance the panel had different criteria?"** (Sometimes the disconnect is *inside* the hiring team, not between TA and the hiring manager.)

Take notes. Verbatim if possible. You'll need them for the next step.

## Three patterns this conversation usually uncovers

### Pattern 1 — The brief drifted upward

You agreed to "5+ years experience, Postgres, working knowledge of AWS." The hiring manager is now interviewing as if they need "10+ years experience, deep Postgres internals, AWS solution architecture." The brief crept upward without anyone updating the JD or the Screening Roles configuration ([[01 How-To Documents/corporate/07-screening-and-evaluating|Chapter 7]]).

**Fix:** Schedule a re-brief meeting. Walk through the original JD, identify what's changed, agree to a new JD in writing. Update the platform's requisition record and the Screening Roles entry. Restart sourcing against the new criteria.

**Pro tip:** Don't blame the hiring manager for the drift. Frame it as a normal recalibration: "Briefs naturally evolve as you start interviewing — let's update so the next batch is on target."

### Pattern 2 — TA misread the original brief

The recruiter thought "senior backend developer" meant tech lead level. The hiring manager meant individual contributor with deep experience. You've been sourcing the wrong shape of person from day one.

**Fix:** Apologise once, briefly, and move on. Long apologies are uncomfortable for everyone. Focus on getting the brief right going forward, not on relitigating the misread.

**Pro tip:** Use a Job Intake Scorecard on the next brief. The intake scorecard exists to prevent exactly this kind of misread — fill it in carefully and review it back to the hiring manager before sourcing starts. For corporate hiring, codify the intake checklist in your Knowledge Base ([[01 How-To Documents/corporate/15-knowledge-base|Chapter 15]]) so every recruiter on the team uses the same one.

**Try: Predictive Hiring _(Premium)_.** Why this helps in this scenario: it predicts on-the-job success and retention risk for each shortlisted candidate against your historical hiring patterns — so you can rank by likely outcomes, not just CV match. Lives at [https://www.sebenzahub.co.za/dashboard/business/predictive-hiring](https://www.sebenzahub.co.za/dashboard/business/predictive-hiring), covered in [[01 How-To Documents/corporate/09-making-offers|Chapter 9]].

![[c-ch18-predictive-hiring-rank.png]]

### Pattern 3 — The hiring manager's expectations are unrealistic

The hiring manager wants a "senior dev with 12 years' experience, R600k–R800k budget, fully remote, immediate start." That candidate doesn't exist at that price. You're not failing to find them; they're not findable.

**Fix:** This is the hardest conversation. You need to push back, with evidence.

- **Pull Competitive Heat Map** ([[01 How-To Documents/corporate/10-vendor-management-and-sourcing|Chapter 10]]) for this role and location. Show the hiring manager what the realistic salary range is.
- **Pull Search Market Pulse** (Ch.10) for the talent pool size at their salary band.
- **Pull Predictive Analytics** ([[01 How-To Documents/corporate/14-analytics-and-reporting|Chapter 14]]) showing realistic time-to-fill for this kind of role at this salary.
- **Show the data, then make the choice clear:** "Here are the trade-offs. We can find someone in your salary band, but you'll need to relax X. Or we can find your ideal profile, but the salary needs to be Y. Which trade-off works for you?"

**Pro tip:** Don't try to soften the message. Hiring managers respect TA functions that tell them the truth backed by data. They don't respect TA functions that keep submitting hope-and-pray candidates against an impossible brief.

**Try: Requirement Restriction Analyzer _(Standard)_.** Why this helps in this scenario: it scores each requirement on the JD for how much it shrinks the candidate pool, so you can show the hiring manager exactly which "nice-to-have" is killing the calibre conversation. Run it before the difficult conversation, not during. Surfaces from any requisition's Pipeline (Ch.6).

![[c-ch18-requirement-restriction-evidence.png]]

## After the diagnostic: the recovery plan

Once you understand the problem, deliver a written recovery plan within 24 hours. Format:

```
[Hiring Manager name] — Senior Developer Role — Recovery Plan

What we heard from your feedback:
- Specific concern 1
- Specific concern 2
- Specific concern 3

What we're changing:
- [Concrete change 1, with reasoning]
- [Concrete change 2, with reasoning]
- [Concrete change 3, with reasoning]

What stays the same:
- [Item 1] — because [reasoning]
- [Item 2] — because [reasoning]

What we need from you:
- [Confirmation of new criteria]
- [Any additional information needed]
- [Decision on any trade-offs you're being asked to accept]

Next milestone:
- New shortlist of 4–6 candidates by [date]
- Re-interview with revised brief
```

A written recovery plan does three things:

1. **Demonstrates you listened.** It mirrors back exactly what the hiring manager said.
2. **Forces specificity.** Vague feedback turns into concrete actions.
3. **Creates accountability** for both sides. The hiring manager knows what's coming; TA knows what's expected.

The recovery plan also goes into the Audit Trail (Ch.12) automatically — which becomes valuable when an EE audit asks "show me how this requisition was managed when concerns were raised about candidate calibre".

## Use scorecards to depersonalise the next round

When calibre is the complaint, the next round must come with scorecards (Ch.7) attached and the panel debrief done in-platform — not in email or Slack. Scorecards force interviewers to rate against the same competencies and write rationale that's auditable. They depersonalise the calibre conversation: instead of "I didn't like them", the discussion becomes "they scored 2 on Technical Depth and 4 on Communication — what does that tell us about the role and the panel's calibration?"

![[c-ch18-scorecard-panel-disagreement.png]]

For repeat calibre disputes with the same hiring manager, use Panel Analysis findings (covered in [[01 How-To Documents/corporate/14-analytics-and-reporting|Chapter 14]] as Disagreement Analyzer) to surface whether one specific interviewer is consistently scoring lower than the panel average — that's a calibration conversation, not a candidate-quality conversation.

![[c-ch18-disagreement-analyzer-pattern.png]]

## When to push back vs accept

Some hiring-manager expectations are unrealistic. Some are reasonable but uncomfortable for TA. Here's how to tell the difference:

| Pushback warranted | Accept and adapt |
|---|---|
| Salary is below market and you have data | Tone of feedback is harsh but content is fair |
| Timeline is mathematically impossible | Brief is more demanding than you initially understood |
| Required skills don't exist together at scale | Hiring manager wants more interviews per shortlist |
| Location is too restrictive for the talent pool | Hiring manager wants more frequent updates on progress |

Push back on the things you have data to challenge. Accept the things that are about *how* you work together — those are the hiring manager's prerogative.

## The follow-up cadence

After delivering the recovery plan and resourcing the next round:

- **Day 3:** Quick update — "we've started sourcing against the new criteria, will have first results by Friday"
- **Day 7:** First real progress — "here's what the new shortlist is looking like"
- **Day 14:** Either the new shortlist is delivered, or you have a conversation about why it's slower than expected (don't surprise them)

Aggressive communication during a recovery period rebuilds trust. Silence destroys it.

## When to escalate

Some hiring-manager relationships have too much accumulated friction to recover at the recruiter level. Signs that warrant TA-leader or HRBP escalation:

- **Multiple recovery cycles already** for previous requisitions with the same hiring manager
- **The hiring manager is using the unhappy moment to demand TA does work outside the platform's defined process**
- **The hiring manager's panel is misaligned** internally and TA is being scapegoated
- **The brief keeps changing and never stabilises** — you can't hit a moving target

When the relationship needs reset, the right move is structured intervention via the HRBP for the function. Have an honest conversation about the friction. Either agree to a hard reset on the brief, the panel, or the process — or the HRBP and the function leader take the conversation one level up. Document everything in the Audit Trail (Ch.12).

A reset relationship is better than a brittle one that produces three more bad shortlists before everyone gives up.

## Pro tips

- **Capture the specifics.** Vague hiring-manager feedback ("we want better candidates") is not actionable. Press for examples until you have concrete data.
- **Don't argue in the first conversation.** Listen. Take notes. Acknowledge. Defend your process in writing in the recovery plan, not in real-time.
- **Use data to push back.** "I think you're being unrealistic" is a fight. "Here's the salary benchmark and the talent density data" is a conversation.
- **The written recovery plan rebuilds more relationships than any in-person apology.** Apologies fade; documents stay.
- **Track recovery patterns across hiring managers.** If the same complaint comes from multiple managers, the issue is in your TA process, not in any one manager's expectations. That's a TA-leader conversation, not a recruiter one.
- **Don't take it personally.** Hiring-manager unhappiness almost always reflects pressure they're under (board commitments, project deadlines, missed targets), not malice toward TA.

## Features referenced in this chapter

| # | Feature | Tier | Used at step |
|---|---------|------|--------------|
| 1 | Predictive Hiring | Premium | Pattern 2 — rank by likely outcome |
| 2 | Requirement Restriction Analyzer | Standard | Pattern 3 — back push-back with data |
| 3 | Competitive Heat Map | Premium | Pattern 3 — salary and market evidence |
| 4 | Search Market Pulse | Premium | Pattern 3 — talent pool size evidence |
| 5 | Scorecards | Standard | Recovery — depersonalise the next round |
| 6 | Disagreement Analyzer | Premium | Recovery — surface panel calibration issues |

## Checklist

- [ ] You know the diagnostic question set for unhappy hiring-manager conversations
- [ ] You can recognise the three patterns (brief drift, misread, unrealistic expectations)
- [ ] You have a recovery plan template ready to use
- [ ] You know when to push back with data vs when to accept and adapt
- [ ] You document recovery cycles in the requisition record and Audit Trail (Ch.12)
- [ ] Scorecards are attached to every interview round so calibre conversations have data
- [ ] Repeated friction with one hiring manager triggers HRBP / TA-leader escalation, not recruiter persistence

## Next chapter

[[01 How-To Documents/corporate/19-advanced-and-ai-orchestration|Chapter 19 — Advanced and AI orchestration]]

## References

- [[01 How-To Documents/corporate/05-posting-jobs|Chapter 5 — Posting jobs (intake)]]
- [[01 How-To Documents/corporate/07-screening-and-evaluating|Chapter 7 — Screening and evaluating (Scorecards)]]
- [[01 How-To Documents/corporate/09-making-offers|Chapter 9 — Making offers (Predictive Hiring)]]
- [[01 How-To Documents/corporate/10-vendor-management-and-sourcing|Chapter 10 — Vendor management and sourcing]]
- [[01 How-To Documents/corporate/12-compliance-and-audit-trail|Chapter 12 — Compliance and audit trail]]
- [[01 How-To Documents/corporate/14-analytics-and-reporting|Chapter 14 — Analytics and reporting]]
- [[01 How-To Documents/corporate/19-advanced-and-ai-orchestration|Chapter 19 — Advanced and AI orchestration]]
