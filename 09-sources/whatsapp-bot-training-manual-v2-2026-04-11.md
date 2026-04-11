---
title: "Source: Linda — WhatsApp Bot Training Manual v2"
type: source
created: 2026-04-11
updated: 2026-04-11
tags: [whatsapp, chatbot, ai, messaging, candidate-experience, linda]
sources: [whatsapp-bot-training-manual-v2]
status: active
confidence: high
---

# Source: Linda — WhatsApp Bot Training Manual v2

**Raw file:** `13-raw/articles/whatsapp-bot-training-manual-v2.md`
**Ingested:** 2026-04-11
**Supersedes:** [[09-sources/whatsapp-bot-training-manual-2026-04-07]]

## Summary

Updated training manual for Sebenza Hub's WhatsApp recruitment assistant, now officially branded as **"Linda"**. This v2 document covers the same scope as the original (candidate experience, admin dashboard, recruiter dashboard, screening bot, WhatsApp Apply) but introduces the Linda persona throughout all candidate-facing interactions and adds new detail on sentiment scoring thresholds, screening session modes, and troubleshooting guides.

## What Changed from v1 to v2

| Area | v1 (April 2026) | v2 (March 2026 update) |
|------|-----------------|----------------------|
| **Bot identity** | Unnamed "WhatsApp Bot" | Named **"Linda"** — used in all greetings, coaching, and system messages |
| **Sentiment thresholds** | Mentioned frustration detection | Explicit scoring: Positive >30, Neutral -30 to 30, Negative <-30; escalation at 3+ consecutive <-50 |
| **Screening session modes** | Mentioned screening | Three distinct modes: Quick Screen, Template Screen, Live Assist (AI co-pilot) |
| **Screening results** | Not detailed | Full breakdown: score 0-100, category breakdown, Shortlist/Maybe/Reject recommendation, red/green flags |
| **Self-service screening links** | Not mentioned | Generate public links with expiration and max-use limits for self-screening |
| **Knockout questions** | Not mentioned | Screening templates support must-pass knockout questions |
| **WhatsApp Apply** | Briefly covered | Full section: AI Message Generator, Apply Links & QR, Application Inbox, Templates, Campaigns, Auto-Reply |
| **Troubleshooting** | Not included | Dedicated FAQ section: connection issues, bot behavior, common questions |
| **Global commands** | MENU, STOP, UNSUBSCRIBE, OPT-OUT | Added: START, HI, HELLO, HEY (return to menu), CANCEL (opt-out) |
| **A/B testing** | Mentioned in campaigns | Detailed workflow: traffic split, minimum sample size, winner declaration |
| **Re-engagement** | Mentioned | Full workflow: 30+ day flag, personalized messages, reactivation tracking |

## Key Claims

### Linda — The Bot Persona
- The WhatsApp bot is now explicitly named **Linda** across all candidate interactions
- Linda introduces herself by name in the first message: "I'm Linda, your AI-powered recruitment assistant from Sebenza Hub!"
- The persona is consistent across greeting, coaching, screening, and error messages
- Linda v2 label appears in the document footer

### Sentiment Analysis (New Detail)
- Positive sentiment: score > 30
- Neutral sentiment: score -30 to 30
- Negative sentiment: score < -30
- Auto-escalation trigger: 3+ consecutive messages with score < -50 (not just < -30)
- When escalated, Linda stops responding entirely and a human takes over in the Team Inbox

### Screening Bot Modes (New Detail)
1. **Quick Screen** — Enter candidate name/phone, select template, click Start Session
2. **Template Screen** — Assign saved template to specific candidates, bot runs the full interview
3. **Live Assist** — Real-time AI co-pilot that suggests questions and evaluates answers; recruiter can override or add follow-ups

### Screening Results (New Detail)
- Overall score: 0–100
- Category breakdown: Technical, Behavioral, Situational
- Recommendation: Shortlist / Maybe / Reject
- Sentiment analysis: enthusiasm and clarity
- Red flags and green flags detected
- Full conversation transcript

### Self-Service Screening Links (New)
- Generate public links tied to a screening template
- Configurable: expiration date, maximum uses
- Share on job posts or social media
- Candidates self-screen without recruiter involvement

### WhatsApp Apply — Application Management (Expanded)
- **AI Message Generator** — generates optimized 160-char WhatsApp messages with CTA, supports tone selection (Professional, Friendly, Casual, Urgent Hiring), A/B variant generation
- **Apply Links & QR Codes** — standard, short URL, or QR code with UTM tracking
- **Application Inbox** — AI-scored applications with match %, sentiment analysis, bulk actions
- **Auto-Reply** — triggers on new application, after hours, status change, keywords

### Troubleshooting (New Section)
- Connection debugging: credential check, webhook test, HTTPS requirement, Meta webhook events
- Bot behavior: auto-responder vs menu conflicts, stuck state reset via MENU, conversation replay for debugging
- Sentiment false positives: escalation needs 3+ consecutive at <-50, not individual negative messages

## Entities and Concepts Mentioned

- [[01-entities/whatsapp-bot]] — Primary entity, updated with Linda branding
- [[02-concepts/whatsapp-integration]] — WhatsApp Business API integration
- [[01-entities/recruiter-user]] — 16-tab recruiter WhatsApp dashboard
- [[01-entities/admin-user]] — 20-tab admin WhatsApp command center
- [[01-entities/individual-user]] — Candidate experience via WhatsApp
- [[01-entities/screening-system]] — Screening bot with templates and scoring
- [[02-concepts/ai-features]] — Sentiment analysis, screening AI, matching
- [[02-concepts/compliance]] — POPIA consent flow

## Contradictions / Tensions

> ⚠️ **Tension:** The document footer says "Last updated: March 2026" but was ingested in April 2026. Likely drafted in March and published later.

> ⚠️ **Carried forward:** [[09-sources/whatsapp-bot-training-manual-2026-04-07]] flagged that multi-language support appears template-based (greetings only), not full AI conversation. This v2 manual does not resolve this — Linda still only shows language selection for greetings and consent.

## Open Questions

- Is the "Linda" branding visible in the codebase, or is it just a documentation label?
- Do the screening knockout questions terminate the session immediately or allow the candidate to complete and then filter?
- What's the actual AI model behind the Live Assist co-pilot mode?
- How does the Application Inbox AI scoring integrate with the main platform's match scoring in [[02-concepts/ai-features]]?

## References

- [[01-entities/whatsapp-bot]]
- [[02-concepts/whatsapp-integration]]
- [[01-entities/screening-system]]
- [[02-concepts/ai-features]]
- [[02-concepts/compliance]]
- Supersedes: [[09-sources/whatsapp-bot-training-manual-2026-04-07]]
