---
title: "WhatsApp Integration"
type: concept
created: 2026-04-07
updated: 2026-04-07
tags: [whatsapp, messaging, communication, chatbot]
sources: [repo-audit-2026-04-07, whatsapp-bot-training-manual-2026-04-07]
status: active
confidence: high
---

# WhatsApp Integration

WhatsApp is the dominant messaging platform in South Africa. Sebenza Hub integrates the **WhatsApp Business API** deeply into the platform, enabling apply-via-WhatsApp, chatbots, campaigns, and notifications.

## Features

### Apply via WhatsApp

Individuals can apply to jobs directly through WhatsApp:
- Recruiter enables WhatsApp Apply for a job posting
- Candidates interact with the WhatsApp bot to submit applications
- Routes: `/dashboard/recruiter/whatsapp-apply`

### WhatsApp Campaigns

Bulk messaging for Recruiters:
- Send templated messages to candidate lists
- Track delivery, read receipts, responses
- Routes: `/dashboard/recruiter/whatsapp-campaigns`

### WhatsApp Bot

Conversational automation:
- Screening chatbot via WhatsApp
- Interactive buttons and message templates
- Routes: `/dashboard/recruiter/whatsapp-bot`
- Training manual: `docs/WhatsApp-Bot-Training-Manual.md`

### Admin Management

Platform-level WhatsApp configuration:
- Routes: `/admin/whatsapp`

## API Endpoints

71+ WhatsApp-related endpoints:

| Category | Endpoints |
|----------|-----------|
| Core | `GET /api/whatsapp/status`, `POST /api/whatsapp/send`, `POST /api/whatsapp/webhook` |
| Templates | `POST /api/whatsapp/templates` |
| Campaigns | `POST /api/whatsapp/campaigns`, `GET /api/whatsapp/analytics` |
| Apply | `GET/POST /api/whatsapp-apply/*` |
| Bot | `POST /api/whatsapp/bot/*` |

## Server Route Files

5 dedicated route files:
- `whatsapp-routes.ts`
- `whatsapp-apply-routes.ts`
- `whatsapp-campaigns-routes.ts`
- `whatsapp-bot-routes.ts`
- `whatsapp-admin-routes.ts`

## Individual Notification Preferences

Individuals can opt in/out of WhatsApp notifications:
- `individualNotificationSettings.whatsappJobAlerts` (default: false)

## Testing

Dedicated E2E test suite: `test:e2e:whatsapp`

## WhatsApp Bot Deep-Dive

Per [[09-sources/whatsapp-bot-training-manual-2026-04-07]], the WhatsApp bot is far more than a simple chatbot — it's a complete recruitment operating system via messaging. See [[01-entities/whatsapp-bot]] for the full entity page.

### Key Capabilities
- **6 SA languages**: English, Afrikaans, isiZulu, isiXhosa, Sesotho, Setswana
- **POPIA consent** collection before data processing
- **CV auto-parsing** with skills extraction and match scoring
- **Frustration detection** → auto-escalation to human after 3+ negative messages
- **Flow builder** with 9 node types for no-code automation

### Admin Dashboard (20 tabs)
Command Center, Conversations, Campaigns, Broadcast Studio, Automation, Compliance, Quality & CSAT, AI Intelligence, Templates, Configuration, Contact CRM, Team Inbox, Flow Builder, Bot Training, Deep Analytics, Replay & Debug, AI Matcher, Growth Engine, DNA Analyzer, War Room.

### Meta Business API
- Uses Meta WhatsApp Business API directly
- Credentials: Phone Number ID, Access Token, WABA ID, Verify Token
- Webhook events: messages, message_deliveries, message_reads

> ⚠️ **Tension:** The bot supports 6 SA languages for greetings, but [[09-sources/ai-enhancement-opportunities-2026-04-07]] flags multi-language AI as a high-effort unimplemented feature. Language support appears template-based, not full AI conversation.

## Open Questions

- What's the message volume and cost per month?
- How are message templates managed and approved?
- What's the fallback rate (% of messages the bot can't handle)?
- How does the Contact CRM lifecycle sync with the main platform's application lifecycle?

## References

- [[01-entities/whatsapp-bot]] — Full entity page for the WhatsApp bot
- [[01-entities/recruiter-user]] — WhatsApp features for recruiters
- [[01-entities/individual-user]] — WhatsApp notification preferences
- [[01-entities/admin-user]] — WhatsApp platform administration
- [[01-entities/sebenza-hub]] — Platform integrations
- Source: [[09-sources/repo-audit-2026-04-07]]
- Source: [[09-sources/whatsapp-bot-training-manual-2026-04-07]]
