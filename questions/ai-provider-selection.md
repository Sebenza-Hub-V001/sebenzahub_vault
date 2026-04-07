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

Based on the AI enhancement audit ([[sources/ai-enhancement-opportunities-2026-04-07]]):

### Confirmed Architecture
- **42 AI functions** in the backend across 3 providers
- **44 AI API endpoints** (of 200+ total)
- **Admin-configurable per-feature model selection** already exists — this is the key finding
- `ai_feature_configs` table stores feature-to-provider mapping
- Admin dashboard has `/admin/ai-monitoring` for usage and cost tracking per provider
- Admin has **AI Model Monitoring**, **Model Performance**, and **Model Registry** tabs

### Provider Roles (inferred from SDK usage patterns)
| Provider | SDK Version | Likely Primary Role |
|----------|-------------|-------------------|
| OpenAI | 4.77.0 | Job matching, CV analysis, content generation, embeddings |
| Anthropic Claude | 0.78.0 | Complex reasoning, analysis, longer-form generation |
| Google Gemini | 0.24.1 | Generative features, possibly multimodal (video analysis) |

### Admin Controls
From [[sources/features-inventory-2026-04-07]], the Admin dashboard includes:
- `ai-dashboard-tab` — AI usage overview
- `model-performance-tab` — Per-model accuracy, bias, latency tracking
- `model-registry-tab` — Model catalog and versioning
- `ai-monitoring` — Real-time AI monitoring
- `ai-model-monitoring` — Detailed model metrics
- `cost-optimizer-tab` — AI cost optimization

**Updated assessment:** Provider selection is **admin-configurable per feature** via `ai_feature_configs`. The admin has a sophisticated AI governance layer with model registry, performance monitoring, and cost optimization. Likely defaults are set per feature with admin override capability.

**Confidence:** medium — admin configurability confirmed, but exact routing logic (fallback chains, dynamic selection) needs code verification.

## Investigation Steps

- [x] Review AI enhancement audit for architecture details → confirmed admin-configurable per feature
- [x] Review features inventory for admin AI pages → found 6+ admin AI management tabs
- [ ] Read `ai_feature_configs` table schema for exact fields
- [ ] Search server code for provider selection/fallback logic
- [ ] Check if there's runtime model switching or A/B testing

## References

- [[concepts/ai-features]] — AI features overview
- [[entities/admin-user]] — AI monitoring and governance
- Source: [[sources/ai-enhancement-opportunities-2026-04-07]]
- Source: [[sources/features-inventory-2026-04-07]]
