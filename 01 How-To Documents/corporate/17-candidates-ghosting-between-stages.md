---
title: "Chapter 17 — \"Candidates are ghosting between stages\""
type: concept
created: 2026-04-28
updated: 2026-04-28
tags: [how-to, corporate, troubleshooting, ghosting, engagement, scenario, sequences, re-engagement]
status: active
user-types: [business]
---

# Chapter 17 — "Candidates are ghosting between stages"

You sourced them. You screened them. They were enthusiastic in the first call. Then — silence. They stopped opening emails, stopped replying to WhatsApp, stopped showing up. Ghosting is the most demoralising failure mode in corporate hiring because it feels personal even when it isn't. This chapter is about the diagnostic, the prevention, and the recovery.

## What ghosting actually looks like

Open the Pipeline ([[01 How-To Documents/corporate/06-receiving-applications|Chapter 6]]) and filter to **Stage age > 5 days**. Look at each card. The candidates you can identify as "ghosting" usually share these patterns:

- They were responsive at the start, then progressively slower
- Their last message was non-committal ("Let me think about it")
- They've stopped opening your emails (visible in the Engagement Score)
- The platform's sentiment analysis flagged a decline in their messages
- Calls go to voicemail; messages go unread

![[c-ch17-stage-age-stuck-cards.png]]

If 5+ candidates show this pattern in a week, it's not random — it's a systemic issue.

## Why candidates ghost

Six common causes, in rough order of frequency:

### 1. They got a competing offer

The most common cause. They didn't tell you because they felt bad about the time you'd invested. They simply went silent.

**Detection:** Predictive Hiring (Ch.9) returned low acceptance probability. Or the candidate was strong and senior — those are the ones with multiple options.

**Prevention:** Move faster. Reduce time-to-offer. Be the first credible offer they receive. Corporate processes can't always match a startup's speed, but 2 weeks faster is achievable for most teams just by removing one redundant interview round.

### 2. The process is too slow

Long gaps between stages signal indifference to the candidate. After 2 weeks of silence between screening and interview, even motivated candidates lose interest.

**Detection:** Stage age in the Pipeline. Anything sitting at 7+ days at one stage is at high risk.

**Prevention:** The 30-second response rule. Even when you don't have an update, send a "still in review, expect news by [date]" message. Silence kills. Hiring-manager engagement is the most common bottleneck in corporate hiring; chase it actively.

### 3. The role didn't match what they expected

What you described in the first call doesn't match what they're seeing in the JD or the interview process. They're not interested in the actual role.

**Detection:** Their engagement was high until they read the JD or had the first interview, then dropped. Specific moment, specific cause.

**Prevention:** Be honest in the first call. Don't oversell to keep them interested. The candidate who walks away after an honest first call is better than the candidate who ghosts after stage 4 (and tells five friends about a bad experience).

### 4. Salary expectations are misaligned

You didn't ask, or they hedged, or the salary in the JD isn't what you discussed. They've decided it's not worth their time but won't tell you.

**Detection:** They went quiet after seeing the salary or the offer band signal. They were active until then.

**Prevention:** Ask the salary question early. First call, no later. "What's your minimum acceptable total compensation for a move?" Don't take "depends" as an answer. For corporate hiring, also flag the salary band early in the recruiter screen so the candidate self-selects out if there's a mismatch.

### 5. They got a counter-offer from their current employer

They told their boss they were leaving. Their boss matched or exceeded the move. They decided to stay. Embarrassed, they ghost you.

**Detection:** Senior candidates who were close to offer, then suddenly went silent in week 4–6 of the process.

**Prevention:** Address the counter-offer risk explicitly during the offer conversation. "What will you do if your current employer offers you a counter?" The honest answer tells you whether to bother proceeding.

### 6. Personal life intervened

Family issue, health issue, sudden change in circumstances. Recruitment isn't their priority anymore. They didn't tell you because it's personal.

**Detection:** Hard to detect upfront. Often comes with a brief explanatory message later.

**Prevention:** None — but soft re-engagement after 30 days often re-activates them when life settles down. Keep them in the Talent CRM with a "do not contact for 30 days" note rather than deleting them.

## The detection signals to watch

The platform has three signals that predict ghosting before it happens:

### Engagement Score (covered in Ch.6 / Ch.14)

A declining engagement score is the strongest leading indicator. A candidate whose score has dropped 20+ points in two weeks is two weeks away from ghosting.

**Action:** When you see the decline, intervene. Phone call from the hiring manager beats another email from the recruiter.

**Try: Candidate Engagement Scorer _(Standard)_.** Why this helps in this scenario: it's the underlying feature that produces the Engagement Score — responsiveness, enthusiasm, reciprocation rolled into one drop-off-risk number per candidate. Full coverage in [[01 How-To Documents/corporate/06-receiving-applications|Chapter 6]].

![[c-ch17-engagement-score-heatmap.png]]

### Sentiment analysis (in the Unified Inbox)

The Unified Inbox flags messages with declining or negative sentiment. A candidate whose sentiment has shifted from positive to neutral is on the path.

**Action:** Read the message that triggered the flag. Often it's a small concern you can address before it festers — sometimes it's something a hiring manager said in an interview that the candidate is now stewing on.

![[c-ch17-sentiment-flag-inbox.png]]

### Stage age in the Pipeline

Days stuck at one stage. Beyond 5–7 days at any stage, the risk of ghosting climbs sharply.

**Action:** Daily Pipeline triage. The "stuck > 2 days, my requisitions" filter is your morning starting view (Ch.6).

## Stage-specific ghosting patterns

Different stages produce different ghosting causes:

| Stage | Common cause |
|---|---|
| **Sourced → first response** | They never had real interest; cold outreach didn't land |
| **First call → screened** | Salary surprise, role surprise, scheduling friction with hiring manager |
| **Screened → interviewed** | Process is too slow; they got a competing offer; hiring manager is dragging on the shortlist review |
| **Interview → second interview** | Bad first interview experience (interviewer was rude, late, unprepared) |
| **Interview → offer** | Salary insecurity; they suspect the offer will be too low |
| **Offer sent → response** | Better offer elsewhere; counter-offer from current employer |
| **Offer accepted → start date** | "Buyer's remorse" — they're regretting the move |

![[c-ch17-dropoff-funnel-stages.png]]

The cause changes by stage, so the fix changes too. Ghosting at the final stage is a different problem than ghosting at first response.

## The prevention rituals

Three habits prevent 80% of ghosting:

### 1. The 30-second response rule

Every inbound candidate message gets a response within 30 seconds, even if the response is "Got your message, will reply properly by EOD." Silence is the #1 cause of disengagement. For corporate teams with multiple recruiters, the Unified Inbox (Ch.11) makes this achievable as long as someone owns the inbox during business hours.

### 2. Status updates between stages

After every interaction, send a "what happens next and when" message. "I'll be in touch by Wednesday with the next step" — and then deliver on Wednesday or apologise for the delay.

**Try: Email Sequences _(Premium)_.** Why this helps in this scenario: automated multi-touch sequences with conditional branches (responded / opened-but-no-reply / cold) handle the status-update cadence so silence stops being your default state. Full setup in [[01 How-To Documents/corporate/11-communication-and-automation|Chapter 11]].

![[c-ch17-recovery-sequence-day1-day8.png]]

### 3. Fast follow-ups

Schedule a follow-up the moment you finish a conversation. Not "I'll remember to follow up" — actually create the task in the platform. Manual memory fails; system memory doesn't. For corporate teams, this is also where Workflow Automation (Ch.11) earns its keep — auto-create the follow-up task on every stage change.

## The recovery playbook

Sometimes a candidate has already gone silent. The recovery sequence:

### Day 1 — light touch

Send a single, low-pressure message. "Hi [name], haven't heard from you in a few days — everything OK on your side? No pressure either way, just want to make sure you're not stuck waiting on me for something."

### Day 4 — direct check-in

If no response, one more message. Be more direct. "Hi [name], following up — I want to make sure I'm not assuming you're still interested in the [role title] role. If your circumstances have changed, totally fine — just let me know either way so I can plan next steps."

### Day 8 — final touch (optional channel switch)

Last attempt, ideally on a different channel. If you've been emailing, try WhatsApp (with consent) or LinkedIn. Keep it brief. "Last note from me on this one — if I don't hear back, I'll assume timing isn't right and put your profile on pause. All the best whatever you decide."

### After Day 8 — let go

Move the candidate to the Talent CRM with a re-engagement tag (Ch.10). Don't keep messaging. Pursuing harder makes you look desperate. Let them come back to you when they're ready.

The fact that you handled the ghost gracefully — without pressure, without guilt, without final-attempt drama — is what makes them reachable in three months when their situation changes. For corporate hiring, where you'll often have multiple roles open at the same skill level over a year, this matters more than it does for one-off agency placements.

## What NOT to do

- **Don't send guilt messages.** "After all the time I invested in you" is the fastest way to ensure you never hear from them again — and ensure the story they tell about your employer brand is "they were pushy when I went quiet".
- **Don't escalate to their current employer.** Ever. Career-ending move for the candidate, brand-ending move for you.
- **Don't blast them with sequences.** Daily emails for two weeks is harassment, not persistence.
- **Don't take it personally.** Most ghosting is about the candidate's situation, not your value. Your reaction matters more than the ghost itself.

## Pro tips

- **The Engagement Score is your superpower.** Watch it. Act on declines before they become ghosts.
- **The 30-second response rule prevents more ghosting than any other tactic.** It's that simple.
- **Honesty in the first call is the best ghost insurance.** Honest descriptions filter out the people who'd ghost; oversold descriptions attract them.
- **Document why each ghost happened** in their record. Patterns emerge — you may discover that your ghost rate is concentrated at one stage or one hiring manager, which points to a fixable cause.
- **A graceful let-go preserves the future relationship.** Pursue too hard and you lose them forever; let go cleanly and they often come back.
- **Hiring-manager dragging is the silent ghost-cause.** When candidates ghost between Screened and Interviewed, the cause is more often a hiring manager who took 9 days to look at the shortlist than the candidate themselves losing interest. Track HM responsiveness as part of your weekly Recruitment Analytics review.

## Features referenced in this chapter

| # | Feature | Tier | Used at step |
|---|---------|------|--------------|
| 1 | Candidate Engagement Scorer | Standard | Detection — Engagement Score |
| 2 | Email Sequences | Premium | Prevention — status updates |
| 3 | Workflow Automation | Premium | Prevention — auto-create follow-up tasks |

## Checklist

- [ ] You're using the Engagement Score as a leading indicator
- [ ] You're applying the 30-second response rule across the TA team
- [ ] Recruiters send status updates between stages, not just when they have news
- [ ] You have a recovery sequence ready (Day 1 / Day 4 / Day 8)
- [ ] You move ghosted candidates to the Talent CRM with a re-engagement tag, not delete them
- [ ] You don't send guilt messages or pursue past Day 8
- [ ] Hiring-manager responsiveness is tracked as part of TA leadership reporting

## Next chapter

[[01 How-To Documents/corporate/18-hiring-managers-unhappy-with-calibre|Chapter 18 — "Hiring managers are unhappy with the calibre"]]

## References

- [[01 How-To Documents/corporate/06-receiving-applications|Chapter 6 — Receiving applications (Pipeline + Engagement Score)]]
- [[01 How-To Documents/corporate/10-vendor-management-and-sourcing|Chapter 10 — Vendor management and sourcing (Talent CRM)]]
- [[01 How-To Documents/corporate/11-communication-and-automation|Chapter 11 — Communication and automation (Sequences, Workflow)]]
- [[01 How-To Documents/corporate/14-analytics-and-reporting|Chapter 14 — Analytics and reporting]]
- [[01 How-To Documents/corporate/16-time-to-fill-creeping-up|Chapter 16 — Time-to-fill creeping up]]
- [[01 How-To Documents/corporate/18-hiring-managers-unhappy-with-calibre|Chapter 18 — Hiring managers unhappy with calibre]]
