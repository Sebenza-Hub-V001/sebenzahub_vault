---
title: "Chapter 11 — Communication and automation"
type: concept
created: 2026-04-26
updated: 2026-04-28
tags: [how-to, corporate, communication, unified-inbox, email-templates, sequences, chatbot, workflow-automation, brand-voice, approvals, ai]
status: active
user-types: [business]
---

# Chapter 11 — Communication and automation

The hiring conversation happens across email, WhatsApp, in-platform threads, and (for internal users) a separate set of approval threads on offers, hires, and high-stakes decisions. The **Communication & Automation** sidebar group has five pages that pull all of that into one place: a unified candidate inbox, a maintained library of email templates, the AI Brand Voice profile, the Content Repurpose tool that takes a JD and reshapes it for each distribution channel, and the platform's internal approvals routing.

Two further automation layers sit on top of these pages — **Email Sequences** (multi-touch nurture) and **Workflow Automation** (rule engine). They're discussed in this chapter because they're how templates and approvals stop being one-off tools and become the operational fabric of the TA function.

The pages you'll use:

- **Unified Inbox** ([https://www.sebenzahub.co.za/dashboard/business/unified-inbox](https://www.sebenzahub.co.za/dashboard/business/unified-inbox)) — multi-channel candidate threads, all in one view.
- **Email Templates** ([https://www.sebenzahub.co.za/dashboard/business/email-templates](https://www.sebenzahub.co.za/dashboard/business/email-templates)) — the canned messages your team sends out, plus the sequence builder.
- **Brand Voice** ([https://www.sebenzahub.co.za/dashboard/business/brand-voice](https://www.sebenzahub.co.za/dashboard/business/brand-voice)) — the per-organisation voice profile the AI features write against.
- **Content Repurpose** ([https://www.sebenzahub.co.za/dashboard/business/content-repurpose](https://www.sebenzahub.co.za/dashboard/business/content-repurpose)) — turns a published role into channel-shaped variants for distribution. Sits next to Brand Voice because it consumes the voice profile to keep social-channel posts on-brand.
- **Approvals** ([https://www.sebenzahub.co.za/dashboard/business/approvals](https://www.sebenzahub.co.za/dashboard/business/approvals)) — in-platform approval routing for non-offer decisions.

## Bring multi-channel candidate conversations together

### Unified Inbox — _Tier: Premium · WhatsApp via Sebenza-managed bot_

**Where it lives.** [https://www.sebenzahub.co.za/dashboard/business/unified-inbox](https://www.sebenzahub.co.za/dashboard/business/unified-inbox), in the **Communication & Automation** sidebar group.

**What it does.** Unified Inbox brings every candidate-facing channel — email, WhatsApp, and the platform-internal thread — into a single view, threaded against the candidate record. A recruiter replying in the inbox doesn't pick the channel; the system replies on whatever channel the candidate last used, and the conversation is captured against the candidate regardless.

**Why it matters.** SA candidates respond to WhatsApp at rates email simply cannot match — interview confirmations, offer reminders, and scheduling exchanges that would die in an inbox get answered on WhatsApp. Without a unified view, recruiters either pick a channel and miss responses on the other, or chase across three apps. The Unified Inbox fixes this and keeps the audit trail of the whole exchange in one place.

**How to use it.**

1. WhatsApp itself is configured by your Sebenza account manager — they set up the Sebenza-managed sender, get the message templates approved on the WhatsApp Business API side, and configure the per-organisation routing rules. You don't provision a number yourself.
2. Once enabled, candidate-facing WhatsApp messages flow through the Unified Inbox alongside email — recruiters reply from the same thread regardless of channel, and the conversation is captured against the candidate record.

![[c-ch11-unified-inbox-multichannel.png]]
3. From **Settings → Notifications**, tune which event classes route to which channel for internal users: routine events on email only, time-critical on email + SMS, urgent (interview cancelled, offer rejected) on all channels.

![[c-ch08-notification-channels-matrix.png]]

4. Train recruiters and hiring managers on the channel rules so the noise level is predictable. Multi-channel done badly is just more spam; done well, it's the signal that gets through when it matters.

**During the trial.** WhatsApp campaigns have a per-trial cap of **50 messages** to control external API spend. Plenty for a real evaluation; not enough to run a 5,000-candidate broadcast. After conversion, the cap is governed by your plan and consumption.

### Slack routing for WhatsApp events

If your team lives in Slack, WhatsApp conversation events can be routed there with full message context — not just a "you have a new message" ping but the actual candidate, role, and message body, so a teammate can pick up the thread without first opening Sebenza Hub. Configure the Slack integration once in your Settings (Account group) and pick the events you care about (new candidate WhatsApp, opt-out, escalation).

## Maintain the email templates

Templates are the foundation. Every other tool in this chapter — sequences, chatbot, workflow automation — uses templates as building blocks.

### Email Templates — _Tier: Standard_

**Where it lives.** [https://www.sebenzahub.co.za/dashboard/business/email-templates](https://www.sebenzahub.co.za/dashboard/business/email-templates), in the **Communication & Automation** sidebar group.

**What it does.** Email Templates is the maintained library of canned messages the team sends — application acknowledgements, screening invitations, interview confirmations, rejections, offer-stage updates, follow-ups. Each template uses placeholders (candidate name, role, recruiter name, scheduling link) so a single template adapts to every candidate and requisition.

**Why it matters.** Without a template library, every recruiter writes their own version of the same message and the candidate experience becomes inconsistent — some candidates get a thoughtful rejection, others get nothing. Templates make the baseline experience consistent and free recruiter time for the messages that genuinely benefit from a custom touch.

### The 10 templates every TA team needs

Build these once and reuse forever:

| # | Template | When you'll use it |
|---|---|---|
| 1 | **Application acknowledgement** | Sent automatically when a candidate applies; thank you, here's what happens next |
| 2 | **Initial screening invitation** | "Your CV looks promising — let's chat" |
| 3 | **Interview invitation** | Confirmed interview details |
| 4 | **Interview reminder** | 24 hours before |
| 5 | **Polite rejection (early stage)** | "We've decided to move forward with other candidates" with a kind framing |
| 6 | **Polite rejection (late stage)** | More personalised, specific feedback if appropriate |
| 7 | **Offer cover note** | Personal message that accompanies the formal offer letter |
| 8 | **Follow-up nudge** | "Just checking in — any questions?" |
| 9 | **Reference request** | Asking the candidate for referees |
| 10 | **Re-engagement (cold)** | Reaching out to a dormant CRM contact about a new role |

These cover 80% of your TA team's daily messaging. The other 20% is genuinely personal and shouldn't be templated.

### Building a template

1. Open [https://www.sebenzahub.co.za/dashboard/business/email-templates](https://www.sebenzahub.co.za/dashboard/business/email-templates).
2. Click **+ New template**.
3. Name the template (be descriptive — "Interview invite — Sandton office" beats "Template 7").
4. Pick the channel (email, in-platform, WhatsApp).
5. Write the subject line (for email).
6. Write the body using **merge fields**:
   - `{{candidate.firstName}}`
   - `{{requisition.title}}`
   - `{{hiringManager.name}}`
   - `{{interview.date}}`, `{{interview.time}}`, `{{interview.location}}`
   - `{{recruiter.firstName}}` (the TA team member sending the message)
7. Pair the template with the **Brand Voice** profile (next section) so any AI-generated additions to the template stay on-brand.

![[c-ch11-template-merge-fields-editor.png]]

8. Save and tag the template (e.g. `screening`, `interview`, `rejection`) so it's findable.

### Template hygiene

- **Sound human.** Templates that read like form letters are worse than no template. Add a personal touch placeholder line that the recruiter fills in before sending.
- **Test the merge fields.** Before publishing, preview the template with a real candidate's data. Misspelled merge field names render as raw `{{candidate.firstName}}` on the recipient's side and look terrible.
- **Audit quarterly.** Templates drift out of date as your processes change. Re-read all 10 every quarter and prune anything that no longer applies.
- **Don't have 50 templates.** Past 15–20, recruiters can't remember which one to use. Consolidate.
- **Tone-check rejection templates more than any others.** Rejected candidates tell their friends about you. A generic, harsh rejection costs you more than you think — including in the candidate NPS reflected in your employer-brand score.

## Multi-touch outreach with sequences

### Email Sequences — _Tier: Premium_

**Where it lives.** Inside the Email Templates surface — the sequence builder is the multi-step view of the templates page. Talk to your account manager if it isn't visible on your plan.

**What this feature is.** Automated multi-touch email campaigns with conditional branches based on candidate response — Day 0 first touch, Day 4 follow-up, Day 10 final touch, branching on responded / opened-but-didn't-respond / cold.

**Why it matters.** 60% of candidate responses happen after the third email. Sequences automate the multi-touch follow-ups recruiters know they should do but stop doing manually after the first week of a busy desk — which raises reply rates by 2–3×. For corporate TA teams chasing senior or scarce candidates from the Talent CRM, this is what makes the warm pool actually convert.

**The anatomy of a sequence**

```
Day 0:  Email — "Noticed your background in X, wanted to connect about a role"
Day 4:  In-platform message — "Following up on my email; 2 minutes for a chat?"
Day 10: WhatsApp (if consent) — "Last touch — let me know either way"
Exit:   Any reply pauses the sequence and routes to the inbox
```

The exit rule is crucial. A sequence that keeps sending after a candidate replies is the fastest way to torch your employer brand. **Always** set the exit rule.

### Building a sequence

1. Open the Email Templates page → **Sequences** tab.
2. Click **+ New sequence**.
3. Name the sequence (e.g. "Senior engineer — passive outreach Q3").
4. Add steps. For each step:
   - **Day** (relative to enrolment, e.g. Day 0, Day 4, Day 10)
   - **Channel** (email / WhatsApp / in-platform)
   - **Template** (pick from the template library)
   - **Send window** (e.g. weekdays only, 09:00–17:00 candidate's local time)
5. Set exit rules:
   - **Exit on reply** (default: yes)
   - **Exit on stage change** (e.g. exit when candidate moves to Interview)
   - **Exit on opt-out** (mandatory under POPIA — see [[01 How-To Documents/corporate/12-compliance-and-audit-trail|Chapter 12]])

![[c-ch11-sequence-builder-conditional-branches.png]]

6. Save.

### Enrolling candidates in a sequence

Once a sequence exists, you enroll candidates in it from:

- **Bulk enrollment** from the Pipeline (select multiple candidates → "Add to sequence")
- **Workflow automation** (a rule like "when a candidate is added to the Senior-Devs CRM tag, enroll in Sequence Y" — see Workflow Automation below)
- **Single enrollment** from a candidate's record

### Sequence count is metered

Active sequences count against your plan limit ([[01 How-To Documents/corporate/04-trial-and-billing-lifecycle|Chapter 4]]). Each plan caps how many sequences can be running concurrently. The right strategy for corporate TA: keep 3–5 always-on sequences for your common scenarios (passive outreach, post-interview follow-up, dormant CRM re-engagement) and rotate one-off sequences in and out as needed.

## Keep AI text on-brand

### Brand Voice — _Tier: Premium_

**Where it lives.** [https://www.sebenzahub.co.za/dashboard/business/brand-voice](https://www.sebenzahub.co.za/dashboard/business/brand-voice), in the **Communication & Automation** sidebar group.

**What it does.** Brand Voice is the per-organisation profile that shapes every AI text feature — tone, formality level, banned words, signature phrases, and example paragraphs. Once it's tuned, AI JD Writer (covered in [[01 How-To Documents/corporate/05-posting-jobs|Chapter 5]]), Content Repurpose (next section), AI Questions (covered in [[01 How-To Documents/corporate/08-interviewing|Chapter 8]]), and AI-generated candidate communication all sound like you wrote them.

**Why it matters.** AI features default to bland, generic prose. Without a voice profile, your AI-generated job descriptions sound like every other AI-generated job description; with one, they sound like your company. For brand-sensitive employers — financial services, professional services, anyone where the candidate experience is part of the value proposition — this is the difference between "use the AI" and "the AI saves real time".

**When to use it.** Set it up once, in the first month. The first round produces output that feels close-but-off; the third round is where the model genuinely picks up your voice. Treat it as a small ongoing investment that you tune quarterly as your tone evolves, not as set-and-forget config.

![[c-ch11-brand-voice-profile-editor.png]]

While the AI is working you'll see a multi-phase **AI Progress Messaging** indicator — drafting, validating, scoring, finalising — so you know the model is progressing rather than wondering if the page has hung.

## Reshape the JD for distribution

### Content Repurpose — _Tier: Premium_

**Where it lives.** [https://www.sebenzahub.co.za/dashboard/business/content-repurpose](https://www.sebenzahub.co.za/dashboard/business/content-repurpose), in the **Communication & Automation** sidebar group.

**What it does.** Content Repurpose takes a published requisition and produces channel-shaped variants for distribution — a short LinkedIn post, a longer career-page write-up, a tweet, a Slack channel announcement for internal mobility, a paragraph for an internal newsletter. Each variant is built off the source JD and tuned by the Brand Voice profile so the company's tone carries across channels.

**Why it matters.** Posting the same long JD on LinkedIn that you wrote for the careers page is how senior roles get ignored on social channels. Each channel has different conventions and different audiences; copying-and-pasting wastes either the channel or the JD. Content Repurpose closes that gap without adding a content writer to your TA team's headcount.

**How to use it.**

1. From any published requisition, click **Repurpose**.
2. Pick the channels you want variants for — LinkedIn (long), LinkedIn (short), Twitter / X, internal newsletter, Slack mobility post, careers-page micro-summary.
3. Review the variants. The Brand Voice profile shapes the output; you can adjust per-channel tone if a channel needs to land differently from the default.

![[c-ch11-content-repurpose-channel-variants.png]]

4. Publish from the Content Repurpose page directly to the integrated channels (LinkedIn) or copy-paste to the platforms that aren't directly integrated.

### Linda — the agent layer behind the AI

Many of the AI features in this chapter — sequences that adapt language per recipient, the chatbot escalation logic, content variants that need cross-channel context — are powered by **Linda**, the platform's agent layer. Think of her as the operating system that the AI features run on top of. When Linda is engaged for a task, the AI moves from canned responses to adaptive multi-step handling — she can hold context across turns, reach for the right tool when the input requires looking at the candidate record, and hand off to a human cleanly when she's outside her remit.

Two things to know:

- **Linda engages where it adds value, not everywhere.** Simple template merges still resolve through the standard merge engine. Linda steps in when a task requires looking at a record, reasoning across two requisitions, or chaining several actions together.
- **Every tool Linda invokes is logged.** Each tool call — the function name, the inputs, the outputs — lands in your Audit Trail (Chapter 12). When you review an AI-assisted decision later, you can see not just what was said but exactly what Linda did on the backend to produce the answer. That's how you defend AI-assisted decisions in a regulated context.

You don't configure Linda directly — she's wired into the AI features by the platform team. What you configure is the Brand Voice profile, the templates, the sequence steps, and the escalation triggers. Linda then operates within those constraints.

## Route the non-offer approvals

### Approvals — _Tier: Standard_

**Where it lives.** [https://www.sebenzahub.co.za/dashboard/business/approvals](https://www.sebenzahub.co.za/dashboard/business/approvals), in the **Communication & Automation** sidebar group.

**What it does.** Approvals is the in-platform routing for the non-offer decisions that need a sign-off — opening a requisition above-headcount, escalating a hire to executive review, approving a non-standard contract clause, releasing a candidate from a guarantee period. (Offer-letter approvals are handled separately on the Offer Approvals page, covered in [[01 How-To Documents/corporate/09-making-offers|Chapter 9]].)

**Why it matters.** Without an approvals routing layer, sign-offs happen in email, get lost, and become "did anyone actually approve this?" forensic exercises. In-platform approvals keep the decision, the rationale, and the approver's identity attached to the underlying object permanently — which is exactly what audit and risk-and-compliance functions ask for.

**How to use it.**

1. Configure the approval policies for the events that need them — typically requisition-open above-headcount, contract clause exceptions, special-case rehires, and any control your Risk and Audit committee has asked for.
2. When a triggering event happens, the approval auto-routes to the configured approvers. They approve or reject from the Approvals page.

![[c-ch11-approvals-routing-config.png]]

3. Decisions are captured against the underlying object (requisition, candidate, offer) for the audit trail covered in [[01 How-To Documents/corporate/12-compliance-and-audit-trail|Chapter 12]].

## Workflow Automation — the rule engine

Workflow Automation is the glue that connects the surfaces in this chapter — and across the rest of the dashboard — into operational fabric. It's a rule engine: **when X happens, do Y.** It's available as a Premium feature and is configured by your Sebenza account manager during the first month of paid usage, after the templates and sequences are stable.

### Common rules

| When | Do |
|---|---|
| A candidate moves to **Interviewed** stage | Send Template "Interview confirmation" + create calendar invite + notify hiring manager |
| A requisition is open **30+ days with <5 applicants** | Notify the recruiter and the TA leader; flag for Requirement Restriction Analyzer review |
| An offer is **accepted** | Trigger onboarding checklist + send welcome message + add to "recently hired" CRM segment |
| A candidate is **inactive 6 months** | Add to "Re-engagement" sequence |
| A new candidate matches the **Senior-Engineering CRM tag** | Auto-enroll in "Senior engineering nurture" sequence |
| A candidate **opens an offer letter but doesn't respond in 48 hours** | Send a gentle "any questions?" follow-up |
| Vendor MSA expires in **30 days** | Notify TA leader and procurement; block new POs |

![[c-ch11-workflow-automation-rule-builder.png]]

### The right amount of automation

There's a temptation to automate everything. Resist. Over-automation creates a feeling of impersonality that candidates and hiring managers can sense. The right balance:

- **Automate the predictable** — confirmations, reminders, status changes, routine touches
- **Don't automate the personal** — first outreach to a senior candidate, offer negotiations, sensitive conversations, anything that needs judgment
- **Audit your automation monthly** — disable rules that aren't earning their keep
- **Templates first, then sequences, then automation.** Each layer builds on the previous. Don't try to set up automation rules before you have good templates — the result is automated bad messages, which is worse than no automation.

## Chatbots — career-site and screening

Two chatbot surfaces ride on top of the platform:

- **Career-site chatbot** — the conversational AI you can deploy on your careers page. Greets visitors, answers FAQs, helps them search jobs, captures applications, and routes complex queries to a recruiter. Set up by your Sebenza account manager during the first month of paid usage.
- **Screening chatbot** — already covered in [[01 How-To Documents/corporate/07-screening-and-evaluating|Chapter 7]] as part of the Screening Bot. That's the conversational layer at the **Applied** stage; this is the conversational layer at the **Visiting your careers page** stage.

Both are powered by Linda (above) and both have their tool calls logged in the Audit Trail.

### What the chatbot does well

- **24/7 availability** — candidates browse career pages at midnight; the chatbot is there
- **FAQs at scale** — "What's the salary range?" "Is this remote?" "How long is the application process?" — the chatbot handles 100 of these without the TA team ever seeing them
- **Initial application capture** — guides the candidate through applying without making them fill a form
- **Routing** — escalates to a human recruiter when the question gets specific or complex

### What the chatbot doesn't do well

- **Selling on a specific role** — that's a hiring-manager or recruiter conversation
- **Negotiating offers** — never let the chatbot anywhere near this
- **Sensitive topics** — discrimination questions, accommodation requests, anything emotional; route to human immediately

## Pro tips

- **Templates first, then sequences, then automation.** Each layer builds on the previous.
- **A/B test your templates.** When acceptance rates are flat, try a different version of your most-used template for two weeks and compare. Small wording changes can move response rates 5–10%.
- **Sequences need real subject lines.** "Job opportunity" gets filtered. "Re: your work on X" gets opened. The AI can help draft these, but the candidate-specific context has to be yours.
- **Disable old automation rules.** Rules accumulate over time. Quarterly, prune anything that's not generating value. Stale rules are how candidates get spammed.
- **Brand Voice is worth the investment.** A bland, generic AI output is a worse signal to candidates than no AI output at all. Tune the voice profile properly in the first month.
- **Slack routing for the busy team.** If your TA team is in Slack 80% of the day, route WhatsApp events there. The Unified Inbox is still the system of record; Slack is the heads-up channel.

## Checklist

- [ ] WhatsApp is enabled (via your Sebenza account manager) and the Unified Inbox is the recruiter's primary candidate-conversation surface
- [ ] Notification routing is tuned: email for routine, SMS for time-critical, multi-channel for urgent
- [ ] The Email Templates library covers the 10 essentials: application acknowledgement, screening, interview, rejection (early/late), offer cover, follow-up, reference, re-engagement
- [ ] Brand Voice has been set up and tuned at least once; AI features are producing on-brand output
- [ ] Content Repurpose is in use for at least one role family — LinkedIn variant + careers-page variant minimum
- [ ] At least one Email Sequence is active (Premium) with proper exit rules
- [ ] Approvals routing covers the non-offer decisions your governance framework requires sign-off for
- [ ] At least 2 Workflow Automation rules are active (Premium); the rules have been audited in the last quarter
- [ ] Career-site and screening chatbots are configured for your common FAQs (where applicable)
- [ ] You've not over-automated personal outreach

## Features covered in this chapter

| # | Feature | Tier | Route |
|---|---------|------|-------|
| 1 | Unified Inbox | Premium · WhatsApp via Sebenza-managed bot | [https://www.sebenzahub.co.za/dashboard/business/unified-inbox](https://www.sebenzahub.co.za/dashboard/business/unified-inbox) |
| 2 | Email Templates | Standard | [https://www.sebenzahub.co.za/dashboard/business/email-templates](https://www.sebenzahub.co.za/dashboard/business/email-templates) |
| 3 | Email Sequences | Premium · Metered | _Sequences tab on Email Templates_ |
| 4 | Brand Voice | Premium | [https://www.sebenzahub.co.za/dashboard/business/brand-voice](https://www.sebenzahub.co.za/dashboard/business/brand-voice) |
| 5 | Content Repurpose | Premium | [https://www.sebenzahub.co.za/dashboard/business/content-repurpose](https://www.sebenzahub.co.za/dashboard/business/content-repurpose) |
| 6 | Approvals | Standard | [https://www.sebenzahub.co.za/dashboard/business/approvals](https://www.sebenzahub.co.za/dashboard/business/approvals) |
| 7 | Workflow Automation | Premium · provisioned by Sebenza account manager | _account-manager configured_ |
| 8 | Career-Site Chatbot | Premium · provisioned by Sebenza account manager | _embedded on careers page_ |

## Next chapter

[[01 How-To Documents/corporate/12-compliance-and-audit-trail|Chapter 12 — Compliance and audit trail]]

## References

- [[02-concepts/ai-features]] — AI tone analysis and template suggestions
- [[02-concepts/compliance]] — POPIA opt-out requirements for sequences
- [[01 How-To Documents/corporate/05-posting-jobs|Chapter 5 — Posting jobs]]
- [[01 How-To Documents/corporate/07-screening-and-evaluating|Chapter 7 — Screening and evaluating]]
- [[01 How-To Documents/corporate/08-interviewing|Chapter 8 — Interviewing]]
- [[01 How-To Documents/corporate/09-making-offers|Chapter 9 — Making offers]]
- [[01 How-To Documents/corporate/10-vendor-management-and-sourcing|Chapter 10 — Vendor management and sourcing]]
- [[01 How-To Documents/corporate/12-compliance-and-audit-trail|Chapter 12 — Compliance and audit trail]]
