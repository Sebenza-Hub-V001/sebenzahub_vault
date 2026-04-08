---
title: "Source: WhatsApp Bot Training Manual"
type: source
created: 2026-04-07
updated: 2026-04-07
tags: [whatsapp, chatbot, ai, messaging, candidate-experience]
sources: [whatsapp-bot-training-manual]
status: active
confidence: high
---

# Source: WhatsApp Bot Training Manual

**Raw file:** `13-raw/articles/whatsapp-bot-training-manual.md`
**Ingested:** 2026-04-07

## Summary

The operational training manual for Sebenza Hub's WhatsApp Bot — an AI-powered recruitment assistant that handles the full candidate lifecycle via WhatsApp. Covers the candidate experience, admin dashboard (20 tabs), recruiter dashboard (16 tabs), screening bot integration, and WhatsApp Apply workflows.

## Key Claims

### Bot Capabilities
- Greets candidates in **6 South African languages** (English, Afrikaans, isiZulu, isiXhosa, Sesotho, Setswana)
- Collects **POPIA consent** before processing personal data
- Job browsing, applications, CV parsing, screening interviews, career coaching
- **Frustration detection** — escalates to human after 3+ negative sentiment messages
- Broadcast campaigns and re-engagement flows
- Global commands: MENU, STOP, UNSUBSCRIBE, OPT-OUT

### Candidate Journey
1. First contact → Language selection → POPIA consent
2. Main menu: Browse Jobs, Application Status, Upload CV, Career Coaching, Talk to Recruiter
3. Job search → job details → apply (new or existing profile)
4. CV upload → auto-parse → skills extraction → match score
5. Application status check by email
6. Career coaching via AI chat

### Admin Dashboard — 20 Tabs
| Tab | Purpose |
|-----|---------|
| Command Center | Live pulse, sentiment, conversion funnel, bot health |
| Conversations | Full conversation manager with search, filter, takeover |
| Campaigns | Broadcast campaign creation and monitoring |
| Broadcast Studio | Audience segment targeting |
| Automation | Auto-responders and bot flows (9 node types) |
| Compliance | POPIA consent tracking and audit trail |
| Quality & CSAT | Sentiment scoring, intent distribution, fallback rate |
| AI Intelligence | Bot state, language breakdown, intent confidence, predictions |
| Templates | WhatsApp message template management (Utility/Marketing/Auth) |
| Configuration | API credentials, bot settings, webhook setup |
| Contact CRM | Lifecycle stages, engagement/risk scoring, audience segments |
| Team Inbox | Agent management, queue priority, SLA monitoring, canned responses |
| Flow Builder | Visual drag-and-drop conversation flow designer |
| Bot Training | Intents, training phrases, FAQs, playground, unmatched log |
| Deep Analytics | ROI dashboard, cohort analysis, predictive, reports |
| Replay & Debug | Step-by-step conversation replay with intent/sentiment trace |
| AI Matcher | Auto candidate-to-job matching with configurable weights |
| Growth Engine | K-factor, referral chains, QR campaigns, deep links |
| DNA Analyzer | Conversation pattern types (Quick Converter, Drop-off Risk, etc.) |
| War Room | Escalation monitoring with predicted escalations and risk signals |

### Meta WhatsApp Business API Setup
- Requires: Phone Number ID, Access Token, WABA ID, Verify Token
- Webhook subscriptions: messages, message_deliveries, message_reads
- Uses Meta Business Suite for credential management

### Bot Flow Builder
- 9 node types: Message, Question, Condition, Action, Delay, API Call, Assign Agent, Tag, End
- Visual drag-and-drop editor with per-node analytics
- Flow versioning and activation controls

### Contact CRM Lifecycle Stages
New → Engaged → Applied → Interviewing → Placed → Inactive → Churned

## Entities and Concepts Mentioned

- [[02-concepts/whatsapp-integration]] — Expanded significantly by this source
- [[01-entities/recruiter-user]] — 16-tab recruiter WhatsApp dashboard
- [[01-entities/admin-user]] — 20-tab admin WhatsApp command center
- [[01-entities/individual-user]] — Candidate experience via WhatsApp
- [[02-concepts/ai-features]] — AI-powered screening, matching, sentiment detection
- [[02-concepts/compliance]] — POPIA consent flow in WhatsApp

## Notable Observations

- The WhatsApp bot is far more sophisticated than a simple chatbot — it's a complete recruitment operating system accessible via messaging. The 20-tab admin dashboard rivals standalone products.
- The DNA Analyzer (conversation pattern classification) and War Room (escalation prediction) are unusually advanced features for a recruitment platform.
- The flow builder with 9 node types enables no-code automation of complex recruitment workflows.
- Frustration detection with automatic human escalation shows strong candidate-experience focus.

## Contradictions / Tensions

> ⚠️ **Tension:** The bot supports 6 SA languages for greetings, but [[09-sources/ai-enhancement-opportunities-2026-04-07]] flags multi-language AI as a high-effort unimplemented feature. The bot's language support appears to be template-based greetings only, not full AI conversation in multiple languages.

## Open Questions

- What's the message volume and cost per month?
- How is the screening bot's question set configured per role?
- What's the fallback rate (% of messages bot can't handle)?
- How does the Contact CRM lifecycle stage sync with the main platform's application lifecycle?

## References

- [[02-concepts/whatsapp-integration]]
- [[01-entities/recruiter-user]]
- [[01-entities/admin-user]]
- [[01-entities/individual-user]]
- [[02-concepts/ai-features]]
- [[02-concepts/compliance]]
