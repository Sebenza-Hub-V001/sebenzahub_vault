---
title: "Chapter 22 — Unified Inbox and message management"
type: concept
created: 2026-04-09
updated: 2026-04-09
tags: [manual, recruiter, inbox, communication]
status: draft
user-types: [recruiter]
---

# Chapter 22 — Unified Inbox and message management

A working recruiter sends and receives 50–100 messages per day across email, WhatsApp, SMS, LinkedIn, and the in-platform inbox. Without a single place to read all of them, you spend half your day switching tabs and the other half losing threads. The Unified Inbox is Sebenza Hub's answer — every conversation with every candidate and client, in one timeline, automatically logged to the right record.

## Where it lives

| Page | Purpose |
|---|---|
| `/dashboard/recruiter/unified-inbox` | All channels in one view |
| `/dashboard/recruiter/inbox` | The native in-platform inbox (a subset — only platform messages) |

You'll mostly live in `/unified-inbox`. The plain `/inbox` is for when you want to filter to platform-only conversations.

## What flows into the Unified Inbox

Every channel that's connected to your Sebenza Hub agency feeds into the Unified Inbox:

- **Email** — sent and received via your connected mailbox (Google Workspace or Microsoft 365)
- **In-platform messages** — direct messages within Sebenza Hub
- **SMS** — if you have an SMS provider integrated
- **WhatsApp** — covered in detail in Chapter 24
- **LinkedIn messages** — if the LinkedIn integration is active

Every message is automatically attached to:

- The **candidate or contact** it relates to
- The **job** it concerns (if applicable)
- The **client** (if it's a client communication)
- The **recruiter** who sent or received it

This linking is the magic. Open a candidate's profile and you see every message ever exchanged with them across every channel, in one chronological timeline. No more "did Sarah email Thandi about that role last week?" — open Thandi's record and you can see.

## The Unified Inbox layout

Three panels, left to right:

1. **Conversation list** (left) — every active conversation, sorted by most recent activity
2. **Message thread** (middle) — the full back-and-forth for the selected conversation
3. **Context pane** (right) — who this person is, which job they're tied to, their pipeline stage, your notes

The context pane is what makes the Unified Inbox different from a normal email client. You're never replying to a faceless message — you're always seeing the candidate's match score, their stage in the Pipeline, your recent notes about them, and their last interaction. Context is right there.

## The smart messaging assistant

While composing a reply, an AI assistant offers help in real time:

- **Suggested responses** — based on the conversation context and the candidate's stage
- **Tone analysis** — flags responses that might come across as too blunt, too casual, or culturally insensitive
- **Sentiment detection** — alerts you when a candidate's messages indicate disengagement or frustration
- **Keyboard shortcuts** for power users (insert template, jump to context, mark resolved)

The tone analysis is the most underrated feature. Recruiters who type fast under pressure routinely send rejection emails that sound harsher than they meant. The platform catches "we're going with someone else" and suggests "we've decided to move forward with another candidate, but we'll keep your profile in mind for future roles" — same message, kinder tone.

## Filtering and triage

The conversation list has filters at the top. The four you'll use most:

| Filter | What it does |
|---|---|
| **Channel** | Email only / WhatsApp only / etc. |
| **Stage** | Show conversations with candidates at a specific Pipeline stage |
| **Owner** | My conversations only / unassigned / a specific team member |
| **Sentiment** | Filter to negative / neutral / positive |

For triage, the killer combo is **Channel: any** + **Stage: Interview, Offer** + **Sentiment: negative**. That's your "needs urgent attention" list — high-stakes candidates whose messages indicate something's wrong.

## Auto-logging to records

You don't have to manually log conversations. The Unified Inbox writes them to the right records automatically:

- **Candidate record** — every message in the candidate's activity timeline
- **Job record** — messages tagged to a specific role appear on that job's history
- **Client record** — messages with corporate contacts feed Call Notes (Chapter 10)
- **Audit trail** — every message is in the immutable audit trail (Chapter 28)

This means if you ever leave the agency, your replacement opens any candidate or client and sees the full message history without you having to hand over an email archive.

## Team handoff

If a candidate emails you and you're on leave, any team member with the right permissions can pick up the conversation from the Unified Inbox. They see:

- The full conversation history (so they're not starting cold)
- Your notes
- The candidate's pipeline stage
- The job context
- A "last interacted by Sarah" indicator so they know who to ping if they need background

This is how a 5-person agency feels like a 50-person agency to candidates — somebody is always reachable, and they always know what's going on.

## Inbox hygiene rituals

The Unified Inbox is only useful if you don't let it become a graveyard. Two rituals:

### Inbox zero, twice a day

- **Morning (before Pipeline check):** scan the Unified Inbox, action or reply to anything urgent (interview confirmations, offer responses, client questions). Defer the rest with a follow-up reminder.
- **End of day:** scan again. Anything you didn't action gets a follow-up reminder for tomorrow morning. Don't leave the inbox bloated overnight.

### Weekly archive sweep

Once a week, archive conversations that are clearly closed (rejected candidates, completed placements) so the active list stays focused. Don't delete — archive. Archived messages remain searchable and remain in the candidate record.

## Pro tips

- **Use templates ruthlessly.** 80% of your messages are variations on 10 templates (interview confirmation, rejection, offer cover note, follow-up). Build them once in Chapter 23 and reuse forever.
- **Don't reply from your personal email.** Every message that bypasses the Unified Inbox is a hole in your audit trail. If a candidate emails you on your personal Gmail, reply from the platform — drag them back to the unified flow.
- **Mark resolved.** Conversations have a "resolved" toggle. Use it. Open conversations clutter your view; resolved ones get archived automatically.
- **The sentiment indicator is gold.** When the AI flags a candidate as trending negative, take it seriously — call them, don't email. Negative-trending candidates ghost when ignored.
- **Don't auto-reply to candidates.** Auto-replies feel exactly like auto-replies. Use sequences (Chapter 23) for nurture, but personal-touch communication should always be from you.

## Checklist

- [ ] You've connected at least one email channel (Google Workspace or Outlook)
- [ ] You can find any candidate's full message history from their profile
- [ ] You have a morning + end-of-day inbox sweep ritual
- [ ] You're using the tone analysis feature (or at least aware of it)
- [ ] You're marking conversations as resolved when they're done
- [ ] You're not replying to candidates from a personal email account

## Next chapter

[[16-manuals/recruiter/23-templates-sequences-chatbot|Chapter 23 — Email templates, sequences, and the chatbot]]

## References

- [[02-concepts/ai-features]] — Tone analysis and sentiment detection
- [[16-manuals/recruiter/16-the-pipeline|Chapter 16 — The Pipeline]]
- [[16-manuals/recruiter/23-templates-sequences-chatbot|Chapter 23 — Templates, sequences, and the chatbot]]
- [[16-manuals/recruiter/24-whatsapp-at-scale|Chapter 24 — WhatsApp at scale]]
