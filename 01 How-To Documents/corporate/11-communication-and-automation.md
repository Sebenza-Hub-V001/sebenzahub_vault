---
title: "Chapter 11 — Communication and automation"
type: concept
created: 2026-04-26
updated: 2026-04-26
tags: [how-to, corporate, communication, unified-inbox, email-templates, brand-voice, approvals, ai]
status: active
user-types: [business]
---

# Chapter 11 — Communication and automation

The hiring conversation happens across email, WhatsApp, in-platform threads, and (for internal users) a separate set of approval threads on offers, hires, and high-stakes decisions. The **Communication & Automation** sidebar group has four pages that pull all of that into one place: a unified candidate inbox, a maintained library of email templates, the AI Brand Voice profile that keeps automated messages on-brand, and the platform's internal approvals routing.

The pages you'll use:

- **Unified Inbox** ([https://www.sebenzahub.co.za/dashboard/business/unified-inbox](https://www.sebenzahub.co.za/dashboard/business/unified-inbox)) — multi-channel candidate threads, all in one view.
- **Email Templates** ([https://www.sebenzahub.co.za/dashboard/business/email-templates](https://www.sebenzahub.co.za/dashboard/business/email-templates)) — the canned messages your team sends out.
- **Brand Voice** ([https://www.sebenzahub.co.za/dashboard/business/brand-voice](https://www.sebenzahub.co.za/dashboard/business/brand-voice)) — the per-organisation voice profile the AI features write against.
- **Approvals** ([https://www.sebenzahub.co.za/dashboard/business/approvals](https://www.sebenzahub.co.za/dashboard/business/approvals)) — in-platform approval routing for non-offer decisions.

## Bring multi-channel candidate conversations together

### Unified Inbox — _Tier: Premium · WhatsApp via Sebenza-managed bot_

**Where it lives.** [https://www.sebenzahub.co.za/dashboard/business/unified-inbox](https://www.sebenzahub.co.za/dashboard/business/unified-inbox), in the **Communication & Automation** sidebar group.

**What it does.** Unified Inbox brings every candidate-facing channel — email, WhatsApp, and the platform-internal thread — into a single view, threaded against the candidate record. A recruiter replying in the inbox doesn't pick the channel; the system replies on whatever channel the candidate last used, and the conversation is captured against the candidate regardless.

**Why it matters.** SA candidates respond to WhatsApp at rates email simply cannot match — interview confirmations, offer reminders, and scheduling exchanges that would die in an inbox get answered on WhatsApp. Without a unified view, recruiters either pick a channel and miss responses on the other, or chase across three apps. The Unified Inbox fixes this and keeps the audit trail of the whole exchange in one place.

**How to use it.**

1. WhatsApp itself is configured by your Sebenza account manager — they set up the Sebenza-managed sender, get the message templates approved on the WhatsApp Business API side, and configure the per-organisation routing rules. You don't provision a number yourself.
2. Once enabled, candidate-facing WhatsApp messages flow through the Unified Inbox alongside email — recruiters reply from the same thread regardless of channel, and the conversation is captured against the candidate record.
3. From **Settings → Notifications**, tune which event classes route to which channel for internal users: routine events on email only, time-critical on email + SMS, urgent (interview cancelled, offer rejected) on all channels.

![[c-ch08-notification-channels-matrix.png]]

4. Train recruiters on the channel rules so the noise level is predictable. Multi-channel done badly is just more spam; done well, it's the signal that gets through when it matters.

**During the trial.** WhatsApp campaigns have a per-trial cap of **50 messages** to control external API spend. Plenty for a real evaluation; not enough to run a 5,000-candidate broadcast. After conversion, the cap is governed by your plan and consumption.

## Maintain the email templates

### Email Templates — _Tier: Standard_

**Where it lives.** [https://www.sebenzahub.co.za/dashboard/business/email-templates](https://www.sebenzahub.co.za/dashboard/business/email-templates), in the **Communication & Automation** sidebar group.

**What it does.** Email Templates is the maintained library of canned messages the team sends — application acknowledgements, screening invitations, interview confirmations, rejections, offer-stage updates, follow-ups. Each template uses placeholders (candidate name, role, recruiter name, scheduling link) so a single template adapts to every candidate and requisition.

**Why it matters.** Without a template library, every recruiter writes their own version of the same message and the candidate experience becomes inconsistent — some candidates get a thoughtful rejection, others get nothing. Templates make the baseline experience consistent and free recruiter time for the messages that genuinely benefit from a custom touch.

**How to use it.**

1. Build the core template set: application acknowledgement, screening invitation, interview confirmation, post-interview update, rejection (warm, neutral, fast), offer-stage update.
2. Use placeholders for everything that varies — `{{candidate_name}}`, `{{role}}`, `{{recruiter_name}}`, `{{scheduling_link}}`. The system populates them when the message sends.
3. Pair the template with the **Brand Voice** profile (next section) so any AI-generated additions to the template stay on-brand.
4. Review the rejection template specifically — the rejection message is the most-read piece of writing your TA team produces, and a thoughtless one is the most damaging. Get it right.

## Keep AI text on-brand

### Brand Voice — _Tier: Premium_

**Where it lives.** [https://www.sebenzahub.co.za/dashboard/business/brand-voice](https://www.sebenzahub.co.za/dashboard/business/brand-voice), in the **Communication & Automation** sidebar group.

**What it does.** Brand Voice is the per-organisation profile that shapes every AI text feature — tone, formality level, banned words, signature phrases, and example paragraphs. Once it's tuned, AI JD Writer (covered in [[01 How-To Documents/corporate/05-posting-jobs|Chapter 5]]), Content Repurpose (also Chapter 5), AI Questions (covered in [[01 How-To Documents/corporate/08-interviewing|Chapter 8]]), and AI-generated candidate communication all sound like you wrote them.

**Why it matters.** AI features default to bland, generic prose. Without a voice profile, your AI-generated job descriptions sound like every other AI-generated job description; with one, they sound like your company. For brand-sensitive employers, this is the difference between "use the AI" and "the AI saves real time".

**When to use it.** Set it up once, in the first month. The first round produces output that feels close-but-off; the third round is where the model genuinely picks up your voice. Treat it as a small ongoing investment that you tune quarterly as your tone evolves, not as set-and-forget config.

While the AI is working you'll see a multi-phase **AI Progress Messaging** indicator — drafting, validating, scoring, finalising — so you know the model is progressing rather than wondering if the page has hung.

## Route the non-offer approvals

### Approvals — _Tier: Standard_

**Where it lives.** [https://www.sebenzahub.co.za/dashboard/business/approvals](https://www.sebenzahub.co.za/dashboard/business/approvals), in the **Communication & Automation** sidebar group.

**What it does.** Approvals is the in-platform routing for the non-offer decisions that need a sign-off — opening a requisition above-headcount, escalating a hire to executive review, approving a non-standard contract clause, releasing a candidate from a guarantee period. (Offer-letter approvals are handled separately on the Offer Approvals page, covered in [[01 How-To Documents/corporate/09-making-offers|Chapter 9]].)

**Why it matters.** Without an approvals routing layer, sign-offs happen in email, get lost, and become "did anyone actually approve this?" forensic exercises. In-platform approvals keep the decision, the rationale, and the approver's identity attached to the underlying object permanently.

**How to use it.**

1. Configure the approval policies for the events that need them — typically requisition-open above-headcount, contract clause exceptions, special-case rehires, and any control your Risk and Audit committee has asked for.
2. When a triggering event happens, the approval auto-routes to the configured approvers. They approve or reject from the Approvals page.
3. Decisions are captured against the underlying object (requisition, candidate, offer) for the audit trail covered in [[01 How-To Documents/corporate/12-compliance-and-audit-trail|Chapter 12]].

## Checklist

- [ ] WhatsApp is enabled (via your Sebenza account manager) and the Unified Inbox is the recruiter's primary candidate-conversation surface
- [ ] Notification routing is tuned: email for routine, SMS for time-critical, multi-channel for urgent
- [ ] The Email Templates library covers application acknowledgement, screening, interview, rejection, and offer-stage messages
- [ ] Brand Voice has been set up and tuned at least once; AI features are producing on-brand output
- [ ] Approvals routing covers the non-offer decisions your governance framework requires sign-off for

## Features covered in this chapter

| # | Feature | Tier | Route |
|---|---------|------|-------|
| 1 | Unified Inbox | Premium · WhatsApp via Sebenza-managed bot | [https://www.sebenzahub.co.za/dashboard/business/unified-inbox](https://www.sebenzahub.co.za/dashboard/business/unified-inbox) |
| 2 | Email Templates | Standard | [https://www.sebenzahub.co.za/dashboard/business/email-templates](https://www.sebenzahub.co.za/dashboard/business/email-templates) |
| 3 | Brand Voice | Premium | [https://www.sebenzahub.co.za/dashboard/business/brand-voice](https://www.sebenzahub.co.za/dashboard/business/brand-voice) |
| 4 | Approvals | Standard | [https://www.sebenzahub.co.za/dashboard/business/approvals](https://www.sebenzahub.co.za/dashboard/business/approvals) |

## Next chapter

[[01 How-To Documents/corporate/12-compliance-and-audit-trail|Chapter 12 — Compliance and audit trail]]

## References

- [[01 How-To Documents/corporate/05-posting-jobs|Chapter 5 — Posting jobs]]
- [[01 How-To Documents/corporate/08-interviewing|Chapter 8 — Interviewing]]
- [[01 How-To Documents/corporate/09-making-offers|Chapter 9 — Making offers]]
- [[01 How-To Documents/corporate/12-compliance-and-audit-trail|Chapter 12 — Compliance and audit trail]]
