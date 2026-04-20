---
title: "WhatsApp Bot — Linda"
type: entity
created: 2026-04-07
updated: 2026-04-20
tags: [whatsapp, chatbot, ai, messaging, candidate-experience, automation, linda, flow-builder, rag, translation]
sources: [whatsapp-bot-training-manual-2026-04-07, whatsapp-bot-training-manual-v2-2026-04-11, repo-sync-2026-04-20]
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
| **Intent AI fallback** | Unmatched messages routed through LLM intent classification (default-on since 2026-04-19) |
| **RAG FAQ answers** | Open-ended questions answered from `wiki_pages`-backed retrieval |
| **Voice transcription** | Voice notes transcribed via Whisper before NLU |
| **Escalation summary** | Full conversation auto-summarised when handed off to a human agent |
| **Auto-translation** | Bidirectional — user writes local language, agent reads English, replies flow back translated |
| **Magic-link auth** | Phone-lookup auth; email captured if phone miss, then linked |

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

The visual flow builder is now the **authoritative conversation runtime** — active flows override the hardcoded state machine. No-code automation with the original 9 node types plus **10 additional action nodes** added in Phase 2 (2026-04-19).

**Original nodes (Phase 1):**
1. **Message** — Send text/media
2. **Question** — Collect input
3. **Condition** — Branch based on response
4. **Action** — Trigger platform action
5. **Delay** — Wait period (fully operational with server-side timers as of Phase 2)
6. **API Call** — Hit external endpoint
7. **Assign Agent** — Route to human
8. **Tag** — Label the conversation
9. **End** — Terminate flow

**Phase 3 backend (2026-04-19):** versioning, event subscription from platform events, simulator, analytics tables.

**Editor features:**
- Two tabs — **My Flows** (editable) and **Permanent** (read-only docs of hardcoded bot flows, with Duplicate-to-My-Flows).
- Template preview + edit before use.
- Drag-reorder of nodes in the template dialog.
- Editable node positions + per-connection conditions.
- Live-instance badges showing running flow count.
- Simulator + analytics dialogs directly in the editor.

**Triggers — 7 cron-based with dedupe ledger** (2026-04-19). Backend platform events are wired into the flow runtime (application received, status changed, etc.), so flows can fire from system activity, not just inbound messages.

**Starter content:** Seeded auto-responders, intents, FAQs, and 5+ flow templates ship with the app.

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
71+ WhatsApp-related endpoints covering core messaging, templates, campaigns, apply flows, and bot operations. Flow Builder Phase 3 added dedicated endpoints for simulator, analytics, versioning, and event subscription (2026-04-19).

## AI Expansion (Phase 0–6, 2026-04-19)

Linda gained real AI intelligence on 2026-04-19 via a staged 7-phase rollout (migration `0034_whatsapp_ai_expansion` + `0035_enable_whatsapp_intent_ai`):

| Phase | Capability | Commit |
|-------|-----------|--------|
| 0 | Shared helpers + schema foundation | `4a10b2d` |
| 1 | Intent AI fallback **enabled by default** | `db1262c` |
| 2 | RAG-powered FAQ answers from `wiki_pages` | `49e40e9` |
| 3 | Auto-summarise conversation on escalation | `61d0e0c` |
| 4 | Transcribe voice notes via Whisper | `9d38c8d` |
| 5 | AI-suggested reply drafts in agent composer | `c689d31` |
| 6 | Bidirectional auto-translation user ↔ agent | `f6b8c51` |

Phase 1 is the most impactful runtime change: unmatched messages previously dumped candidates back to the menu; now they flow through LLM intent classification first. Analytics bug fixed (`10ce572`) — `intent_confidence` now reports real values rather than fabricated numbers.

## WhatsApp Magic-Link Auth

Added 2026-04-19 (migration `0033_users_phone_index_and_wa_magic_link`). Flow:
1. User messages Linda; phone number looked up against `users.phone`.
2. On miss, Linda captures email.
3. Magic link sent to email; confirmation links the WhatsApp number to the account.

Preceded by account-type picker (Individual / Recruiter / Business) in the greeting flow for new users.

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
- Does RAG-on-`wiki_pages` draw from the product wiki (this vault) or a codebase-internal `wiki_pages` table? If the latter, what seeds it?
- Which AI provider (OpenAI / Claude / Gemini) powers each of Phase 1–6 operations?
- What's the fallback rate now that intent AI is default-on — has it improved vs pre-Phase-1?
- Are any of the 7 cron-based flow triggers active in production yet, or seeded-only?

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
- Source: [[09-sources/repo-sync-2026-04-20]] — Phase 0–6 AI expansion, Flow Builder Phase 2/3, magic-link auth
