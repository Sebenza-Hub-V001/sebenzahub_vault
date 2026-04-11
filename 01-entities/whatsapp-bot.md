---
title: "WhatsApp Bot — Linda"
type: entity
created: 2026-04-07
updated: 2026-04-11
tags: [whatsapp, chatbot, ai, messaging, candidate-experience, automation, linda]
sources: [whatsapp-bot-training-manual-2026-04-07, whatsapp-bot-training-manual-v2-2026-04-11]
status: active
confidence: high
user-types: [individual, recruiter, admin]
---

# WhatsApp Bot — Linda

**Linda** is Sebenza Hub's **AI-powered WhatsApp recruitment assistant** that handles the full candidate lifecycle via WhatsApp — the dominant messaging platform in South Africa. She's not a simple FAQ chatbot; she's a complete recruitment operating system accessible via messaging.

Linda introduces herself by name in every first interaction: *"I'm Linda, your AI-powered recruitment assistant from Sebenza Hub!"*

## What It Does

| Capability | Description |
|-----------|-------------|
| **Multilingual greeting** | 6 SA languages: English, Afrikaans, isiZulu, isiXhosa, Sesotho, Setswana |
| **POPIA consent** | Collects privacy consent before processing any personal data |
| **Job browsing** | Keyword search → job cards → full details → apply |
| **Applications** | New or existing profile, guided application flow |
| **CV parsing** | Auto-parse uploaded PDFs, extract skills, generate match score |
| **Status tracking** | Check application status by email |
| **Career coaching** | AI-powered career advice chat |
| **Screening interviews** | AI-conducted initial screening per role criteria |
| **Frustration detection** | Auto-escalates to human after 3+ negative messages |
| **Broadcast campaigns** | Bulk outreach to candidate segments |
| **Re-engagement** | Automated flows for dormant candidates |

## Candidate Experience Flow

```
First Contact → Language Selection → POPIA Consent → Main Menu
                                                      ├── Browse Jobs → Search → Details → Apply
                                                      ├── Application Status → Check by Email
                                                      ├── Upload CV → Auto-Parse → Match Score
                                                      ├── Career Coaching → AI Chat
                                                      └── Talk to Recruiter → Human Handoff
```

### Global Commands
| Command | Action |
|---------|--------|
| MENU / START / HI | Return to main menu |
| STOP / UNSUBSCRIBE / OPT-OUT | Opt out of all messages |

### Human Escalation Triggers
1. Candidate requests "Talk to Recruiter"
2. Frustration detected (3+ negative sentiment messages)
3. Auto-responder rule matches escalation keyword

## Admin Dashboard — 20 Tabs

The admin WhatsApp interface is the most feature-rich section of the admin dashboard with **20 dedicated tabs**:

| Tab | Purpose |
|-----|---------|
| **Command Center** | Live pulse, sentiment breakdown, conversion funnel, bot health |
| **Conversations** | Full conversation manager — search, filter, takeover, release |
| **Campaigns** | Create and monitor broadcast campaigns with A/B testing |
| **Broadcast Studio** | Target audience segments: all opted-in, active, inactive 30+ days, new |
| **Automation** | Auto-responders (keyword/regex/new/after-hours) + bot flows |
| **Compliance** | POPIA consent tracking, opt-out log, data retention, audit trail |
| **Quality & CSAT** | Sentiment scoring, intent distribution, fallback rate, CSAT surveys |
| **AI Intelligence** | Bot state distribution, language breakdown, intent confidence, predictions |
| **Templates** | WhatsApp message templates (Utility/Marketing/Authentication) |
| **Configuration** | Meta API credentials, bot settings, webhook setup |
| **Contact CRM** | Lifecycle stages, engagement/risk scoring, audience segments |
| **Team Inbox** | Agent management, queue priority, SLA monitoring, canned responses |
| **Flow Builder** | Visual drag-and-drop conversation designer |
| **Bot Training** | Intents, training phrases, FAQs, playground, unmatched log |
| **Deep Analytics** | ROI dashboard, cohort analysis, predictive, PDF reports |
| **Replay & Debug** | Step-by-step conversation replay with intent/sentiment trace |
| **AI Matcher** | Auto candidate-to-job matching with configurable weights |
| **Growth Engine** | K-factor monitoring, referral chains, QR campaigns, deep links |
| **DNA Analyzer** | Conversation pattern classification (Quick Converter, Drop-off Risk, etc.) |
| **War Room** | Escalation monitoring with predicted escalations and risk signals |

## Flow Builder

The visual flow builder enables no-code automation with **9 node types**:

1. **Message** — Send text/media
2. **Question** — Collect input
3. **Condition** — Branch based on response
4. **Action** — Trigger platform action
5. **Delay** — Wait period
6. **API Call** — Hit external endpoint
7. **Assign Agent** — Route to human
8. **Tag** — Label the conversation
9. **End** — Terminate flow

Each node tracks entries, exits, and drop-offs. Flows can be versioned and activated/deactivated.

## Contact CRM Lifecycle

```
New → Engaged → Applied → Interviewing → Placed → Inactive → Churned
```

Contacts are scored on:
- **Engagement (0–100)** — based on message frequency
- **Risk** — churn prediction

## DNA Analyzer Conversation Types

| Type | Description |
|------|-------------|
| Quick Converter | Fast application completion |
| High Engager | Active, multi-session participant |
| Bot Champion | Completes flows without human help |
| Drop-off Risk | Shows signs of abandoning |
| Human Seeker | Wants to talk to a person |
| Silent Browser | Reads but rarely responds |

## Technical Setup

### Meta WhatsApp Business API
- **Phone Number ID** — from Meta Business Suite
- **Access Token** — generated from system user
- **WABA ID** — WhatsApp Business Account Settings
- **Verify Token** — custom string for webhook verification
- **Webhook events:** messages, message_deliveries, message_reads

### Server Routes
5 dedicated route files: `whatsapp-routes.ts`, `whatsapp-apply-routes.ts`, `whatsapp-campaigns-routes.ts`, `whatsapp-bot-routes.ts`, `whatsapp-admin-routes.ts`

### API Endpoints
71+ WhatsApp-related endpoints covering core messaging, templates, campaigns, apply flows, and bot operations.

## Sentiment Analysis

Linda analyses every message for sentiment in real time:

| Range | Label | Meaning |
|-------|-------|---------|
| Score > 30 | Positive | Candidate is engaged and enthusiastic |
| Score −30 to 30 | Neutral | Normal conversation |
| Score < −30 | Negative | Candidate may be frustrated |

**Auto-escalation** triggers when **3+ consecutive messages** score below −50. Linda stops responding entirely and the conversation is routed to the Team Inbox for a human recruiter.

## Screening Session Modes

Linda supports three screening modes via the Screening Chatbot section (Recruiter Dashboard):

1. **Quick Screen** — Enter candidate name and phone, select a template, click Start. Linda sends questions automatically.
2. **Template Screen** — Assign a saved template to specific candidates. Linda conducts the full interview end-to-end.
3. **Live Assist** — AI co-pilot mode. Linda suggests questions and evaluates answers in real time. The recruiter can override or add follow-ups.

Screening results include: overall score (0–100), category breakdown (Technical / Behavioral / Situational), recommendation (Shortlist / Maybe / Reject), sentiment analysis (enthusiasm, clarity), red/green flags, and full transcript.

Templates support **knockout questions** — must-pass gates that determine whether the candidate continues.

### Self-Service Screening Links

Generate public links tied to a screening template. Configurable expiration and max uses. Share on job posts or social media — candidates self-screen without recruiter involvement.

## WhatsApp Apply

Recruiter Dashboard > WhatsApp Apply provides a full application management suite:

- **AI Message Generator** — generates optimised 160-char WhatsApp messages with CTA; supports tone selection (Professional / Friendly / Casual / Urgent Hiring) and A/B variants
- **Apply Links & QR Codes** — standard, short URL, or QR code with UTM tracking
- **Application Inbox** — AI-scored applications with match %, sentiment analysis, bulk actions (assign, shortlist, reject)
- **Auto-Reply** — triggers on new application, after hours, status change, or keywords

## Troubleshooting

### Connection
- Verify all four Meta credentials in Configuration tab
- Click **Test Connection** to verify webhook
- Webhook URL must be publicly accessible (HTTPS required)
- Ensure webhook events are subscribed: `messages`, `message_deliveries`, `message_reads`

### Bot Behaviour
- If auto-responder fires instead of menu navigation: narrow auto-responder trigger keywords (they only match free-text, not button/list selections)
- Bot stuck in a state: candidate types **MENU** to reset; admin uses Conversation Replay to debug
- False sentiment escalation: escalation needs 3+ consecutive at <−50, not individual negative messages

## Open Questions

- What's the monthly message volume and per-message cost?
- How does Contact CRM lifecycle sync with the main platform's [[02-concepts/application-lifecycle]]?
- What's the current fallback rate (% of messages bot can't handle)?
- ~~Is the "Linda" branding visible in the codebase, or just in documentation?~~ **Resolved (2026-04-11):** Yes — `shared/schema.ts` sets `botName` default to `"Linda"`, and `server/whatsapp-bot.ts` uses the name in all 6 SA-language greetings. Commit `cfb71f7`.
- What AI model powers the Live Assist co-pilot mode?
- How does Application Inbox AI scoring integrate with the main platform's match scoring?

## References

- [[02-concepts/whatsapp-integration]] — Concept overview
- [[01-entities/recruiter-user]] — Recruiter WhatsApp features (16 tabs)
- [[01-entities/admin-user]] — Admin WhatsApp management (20 tabs)
- [[01-entities/individual-user]] — Candidate experience via WhatsApp
- [[01-entities/screening-system]] — Screening bot templates and scoring
- [[02-concepts/ai-features]] — AI-powered screening, matching, sentiment
- [[02-concepts/compliance]] — POPIA consent in WhatsApp
- Source: [[09-sources/whatsapp-bot-training-manual-2026-04-07]]
- Source: [[09-sources/whatsapp-bot-training-manual-v2-2026-04-11]]
