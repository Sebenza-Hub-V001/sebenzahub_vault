---
title: "WhatsApp Bot"
type: entity
created: 2026-04-07
updated: 2026-04-07
tags: [whatsapp, chatbot, ai, messaging, candidate-experience, automation]
sources: [whatsapp-bot-training-manual-2026-04-07]
status: active
confidence: high
user-types: [individual, recruiter, admin]
---

# WhatsApp Bot

The Sebenza Hub WhatsApp Bot is an **AI-powered recruitment assistant** that handles the full candidate lifecycle via WhatsApp — the dominant messaging platform in South Africa. It's not a simple FAQ chatbot; it's a complete recruitment operating system accessible via messaging.

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

## Open Questions

- What's the monthly message volume and per-message cost?
- How does Contact CRM lifecycle sync with the main platform's [[02-concepts/application-lifecycle]]?
- What's the current fallback rate (% of messages bot can't handle)?
- How are screening bot questions configured per role?

## References

- [[02-concepts/whatsapp-integration]] — Concept overview
- [[01-entities/recruiter-user]] — Recruiter WhatsApp features (16 tabs)
- [[01-entities/admin-user]] — Admin WhatsApp management (20 tabs)
- [[01-entities/individual-user]] — Candidate experience via WhatsApp
- [[02-concepts/ai-features]] — AI-powered screening, matching, sentiment
- [[02-concepts/compliance]] — POPIA consent in WhatsApp
- Source: [[09-sources/whatsapp-bot-training-manual-2026-04-07]]
