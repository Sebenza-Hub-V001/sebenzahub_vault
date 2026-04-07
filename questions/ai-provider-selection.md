---
title: "How is the AI provider selected per feature?"
type: question
created: 2026-04-07
updated: 2026-04-07
tags: [ai, openai, anthropic, google, architecture, question]
status: active
---

# How is the AI provider selected per feature?

## The Question

Sebenza Hub uses three AI providers (OpenAI, Anthropic Claude, Google Gemini). How does the system decide which provider handles which feature? Is it configurable, hardcoded, or dynamic?

## What We Know

- `ai_feature_configs` table exists — "feature enablement per provider"
- Three SDK packages installed: `openai`, `@anthropic-ai/sdk`, `@google/generative-ai`
- Admin has `/admin/ai-monitoring` for monitoring usage and costs per provider
- 383+ AI endpoints in total

## Current Assessment

Likely a mix:
- Some features hardcoded to a specific provider (e.g., embeddings → OpenAI)
- `ai_feature_configs` may allow admin to toggle providers per feature
- Possibly a fallback chain (primary → secondary → tertiary)

**Confidence:** low — needs server code investigation.

## Investigation Steps

- [ ] Read `ai_feature_configs` table schema for fields
- [ ] Search server code for provider selection logic
- [ ] Check if there's an AI middleware/wrapper that routes to providers
- [ ] Look for environment variable patterns (e.g., `AI_PROVIDER`, `DEFAULT_MODEL`)

## References

- [[concepts/ai-features]] — AI features overview
- [[entities/admin-user]] — AI monitoring
