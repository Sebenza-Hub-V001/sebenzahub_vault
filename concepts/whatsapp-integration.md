---
title: "WhatsApp Integration"
type: concept
created: 2026-04-07
updated: 2026-04-07
tags: [whatsapp, messaging, communication, chatbot]
sources: [repo-audit-2026-04-07]
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

## Open Questions

- Which WhatsApp Business API provider is used (Meta direct, Twilio, MessageBird)?
- What's the cost model for WhatsApp messages?
- How are message templates managed and approved?

## References

- [[entities/recruiter-user]] — WhatsApp features for recruiters
- [[entities/individual-user]] — WhatsApp notification preferences
- [[entities/admin-user]] — WhatsApp platform administration
- [[entities/sebenza-hub]] — Platform integrations
- Source: [[sources/repo-audit-2026-04-07]]
