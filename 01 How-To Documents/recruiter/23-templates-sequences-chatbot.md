---
title: "Chapter 23 — Email templates, sequences, and the chatbot"
type: concept
created: 2026-04-09
updated: 2026-04-09
tags: [how-to, recruiter, templates, sequences, automation, chatbot]
status: draft
user-types: [recruiter]
---

# Chapter 23 — Email templates, sequences, and the chatbot

The Unified Inbox (Chapter 22) is where you read and reply. **This** chapter is where you stop typing the same things over and over. Templates turn repeated messages into one-click sends. Sequences turn multi-touch outreach into automated flows. The chatbot handles the "always-on" channel candidates expect today. Together, these three tools recover hours per week from your day.

## Where it lives

| Page | Purpose |
|---|---|
| `/dashboard/recruiter/email-templates` | Build and manage reusable message templates |
| `/dashboard/recruiter/sequences` | Multi-step automated outreach flows |
| `/dashboard/recruiter/chatbot` | Configure the chatbot deployed on your career site |
| `/dashboard/recruiter/workflow-automation` | Rules that trigger templates and sequences automatically |

## 1. Email templates

Templates are the foundation. Every other tool in this chapter — sequences, chatbot, workflow automation — uses templates as building blocks.

### The 10 templates every recruiter needs

Build these once and reuse forever:

| # | Template | When you'll use it |
|---|---|---|
| 1 | **Application acknowledgement** | Sent automatically when a candidate applies; thank you, here's what happens next |
| 2 | **Initial screening invitation** | "Your CV looks promising — let's chat" |
| 3 | **Interview invitation** | Confirmed interview details |
| 4 | **Interview reminder** | 24 hours before |
| 5 | **Polite rejection (early stage)** | "We've decided to move forward with other candidates" with a kind framing |
| 6 | **Polite rejection (late stage)** | More personalised, specific feedback if appropriate |
| 7 | **Offer cover note** | Personal message that accompanies the formal offer |
| 8 | **Follow-up nudge** | "Just checking in — any questions?" |
| 9 | **Reference request** | Asking the candidate for referees |
| 10 | **Re-engagement (cold)** | Reaching out to a dormant candidate about a new role |

These cover 80% of your daily messaging. The other 20% is genuinely personal and shouldn't be templated.

### Building a template

1. Open `/dashboard/recruiter/email-templates`.
2. Click **+ New template**.
3. Name the template (be descriptive — "Interview invite — Sandton office" beats "Template 7").
4. Pick the channel (email, in-platform, WhatsApp).
5. Write the subject line (for email).
6. Write the body using **merge fields**:
   - `{{candidate.firstName}}`
   - `{{job.title}}`
   - `{{client.name}}`
   - `{{interview.date}}`, `{{interview.time}}`, `{{interview.location}}`
   - `{{recruiter.firstName}}` (you)
7. Save and tag the template (e.g. `screening`, `interview`, `rejection`) so it's findable.

### Template hygiene

- **Sound human.** Templates that read like form letters are worse than no template. Add a personal touch placeholder line that the recruiter fills in before sending.
- **Test the merge fields.** Before publishing, preview the template with a real candidate's data. Misspelled merge field names render as raw `{{candidate.firstName}}` on the recipient's side and look terrible.
- **Audit quarterly.** Templates drift out of date as your processes change. Re-read all 10 every quarter and prune anything that no longer applies.
- **Don't have 50 templates.** Past 15–20, you can't remember which one to use. Consolidate.

## 2. Sequences

A **sequence** is a multi-step series of messages sent automatically over time. Where a template is a single message, a sequence is a campaign — Day 0 first touch, Day 4 follow-up, Day 10 final touch, with exit rules that pause the sequence when the candidate responds.

### Why sequences matter

Cold outreach has a brutal reality: 70%+ of responses come on touch 2 or 3, not touch 1. If you only ever send one message, you're leaving most of your potential responses on the table. Sequences automate the multi-touch persistence that recruiters know they should do but don't have time for.

### The anatomy of a sequence

```
Day 0:  Email — "Noticed your background in X, wanted to connect about a role"
Day 4:  LinkedIn message — "Following up on my email; 2 minutes for a chat?"
Day 10: WhatsApp (if consent) — "Last touch — let me know either way"
Exit:   Any reply pauses the sequence and routes to the inbox
```

The exit rule is crucial. A sequence that keeps sending after a candidate replies is the fastest way to torch your reputation. **Always** set the exit rule.

### Building a sequence

1. Open `/dashboard/recruiter/sequences`.
2. Click **+ New sequence**.
3. Name the sequence (e.g. "Senior Dev — passive outreach").
4. Add steps. For each step:
   - **Day** (relative to enrolment, e.g. Day 0, Day 4, Day 10)
   - **Channel** (email / WhatsApp / LinkedIn / in-platform)
   - **Template** (pick from your template library)
   - **Send window** (e.g. weekdays only, 09:00–17:00 candidate's local time)
5. Set exit rules:
   - **Exit on reply** (default: yes)
   - **Exit on stage change** (e.g. exit when candidate moves to Interview)
   - **Exit on opt-out** (mandatory under POPIA)
6. Save.

### Enrolling candidates in a sequence

Once a sequence exists, you enroll candidates in it from:

- **Bulk enrollment** from the Pipeline (select multiple candidates → "Add to sequence")
- **Workflow automation** (a rule like "when a candidate is added to Talent Pool X, enroll in Sequence Y" — see below)
- **Single enrollment** from a candidate's record

### Sequence count is metered

Active sequences count against your plan limit (Chapter 4.5). Each plan caps how many sequences can be running concurrently. The right strategy: keep 3–5 always-on sequences for your common scenarios (passive outreach, post-interview follow-up, dormant re-engagement) and rotate one-off sequences in and out as needed.

## 3. The chatbot — `/dashboard/recruiter/chatbot`

The chatbot is the conversational AI you can deploy on your career site (Chapter 29). It greets visitors, answers FAQs, helps them search jobs, captures applications, and routes complex queries to a recruiter.

### What the chatbot does well

- **24/7 availability** — candidates browse career sites at midnight; the chatbot is there
- **FAQs at scale** — "What's the salary range?" "Is this remote?" "How long is the application process?" — the chatbot handles 100 of these without you ever seeing them
- **Initial application capture** — guides the candidate through applying without making them fill a form
- **Routing** — escalates to a human recruiter when the question gets specific or complex

### What the chatbot doesn't do well

- **Selling on a specific role** — that's a human conversation
- **Negotiating offers** — never let the chatbot anywhere near this
- **Sensitive topics** — discrimination questions, accommodation requests, anything emotional; route to human immediately

### Configuring the chatbot

1. Open `/dashboard/recruiter/chatbot`.
2. Build the conversation tree:
   - Welcome message
   - Common intents (apply / browse jobs / check application status / ask FAQ / talk to a recruiter)
   - Responses for each intent
3. Set up FAQ entries (the chatbot uses these for natural-language questions)
4. Set escalation triggers — when to hand off to a human (sensitive topic detected, candidate explicitly asks, conversation length exceeds N turns)
5. Pick which pages on your career site the chatbot appears on
6. Save and deploy

### Chatbot tone

Your chatbot represents your agency 24/7. Make sure it sounds like you, not like a generic Zendesk bot. Specific phrasings, your agency's voice, your sense of humour. Bland chatbots are forgettable; distinctive chatbots are memorable.

## 4. Workflow automation — `/dashboard/recruiter/workflow-automation`

Workflow automation is the glue that connects everything. It's a rule engine: **when X happens, do Y.**

### Common rules

| When | Do |
|---|---|
| A candidate moves to **Interview** stage | Send Template "Interview invitation" + create calendar invite |
| A job is open **30+ days with <5 applicants** | Notify the recruiter and the manager; flag for requirement review |
| An offer is **accepted** | Trigger onboarding checklist + send welcome message + add to "recently placed" pool |
| A candidate is **inactive 6 months** | Add to "Re-engagement Q2" sequence |
| A client's NPS drops to **detractor** | Alert the account owner immediately |
| A new candidate is added to **Talent Pool: Senior Devs** | Auto-enroll in "Senior Devs nurture" sequence |
| A candidate **opens an offer letter but doesn't respond in 48 hours** | Send a gentle "any questions?" follow-up |

### Building a workflow rule

1. Open `/dashboard/recruiter/workflow-automation`.
2. Click **+ New rule**.
3. Pick a trigger (the "when").
4. Add conditions (optional filters — e.g. only for Tier A clients, only for senior roles).
5. Pick the action (the "do") — send a template, enroll in a sequence, change a stage, notify a user, create a task.
6. Save and enable.

### The right amount of automation

There's a temptation to automate everything. Resist. Over-automation creates a feeling of impersonality that candidates and clients can sense. The right balance:

- **Automate the predictable** — confirmations, reminders, status changes, routine touches
- **Don't automate the personal** — first outreach to a senior candidate, offer negotiations, sensitive conversations, anything that needs judgment
- **Audit your automation monthly** — disable rules that aren't earning their keep

## Pro tips

- **Templates first, then sequences, then automation.** Each layer builds on the previous. Don't try to set up automation rules before you have good templates — the result is automated bad messages, which is worse than no automation.
- **A/B test your templates.** When acceptance rates are flat, try a different version of your most-used template for two weeks and compare. Small wording changes can move response rates 5–10%.
- **Sequences need real subject lines.** "Job opportunity" gets filtered. "Re: your work on X" gets opened. The AI can help draft these, but the candidate-specific context has to be yours.
- **Disable old automation rules.** Rules accumulate over time. Quarterly, prune anything that's not generating value. Stale rules are how candidates get spammed.
- **Tone-check rejection templates more than any others.** The candidates you reject tell their friends about you. A generic, harsh rejection costs you more than you think.

## Checklist

- [ ] You've built at least 5 of the 10 essential templates
- [ ] You've created at least one sequence with proper exit rules
- [ ] You understand which features are metered (active sequences, AI automation runs)
- [ ] If you have a career site, the chatbot is configured for your common FAQs
- [ ] You have at least 2 workflow automation rules active
- [ ] You're not over-automating personal outreach

## Next chapter

[[16-how-tos/recruiter/24-whatsapp-at-scale|Chapter 24 — WhatsApp at scale]]

## References

- [[02-concepts/ai-features]] — AI tone analysis and template suggestions
- [[02-concepts/compliance]] — POPIA opt-out requirements for sequences
- [[16-how-tos/recruiter/22-unified-inbox|Chapter 22 — Unified Inbox]]
- [[16-how-tos/recruiter/24-whatsapp-at-scale|Chapter 24 — WhatsApp at scale]]
- [[16-how-tos/recruiter/04.5-how-we-charge|Chapter 4.5 — How Sebenza Hub charges you]]
