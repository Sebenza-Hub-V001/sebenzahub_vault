---
title: "Farzapedia — LLM-Generated Personal Wikipedia from Private Data"
type: tweet
created: 2026-04-07
updated: 2026-04-07
tags: [ai, knowledge-management, llm, personal-data, wiki, architecture]
author: "@FarzaTV"
url: "https://x.com/FarzaTV/status/2040563939797504467"
status: active
---

# Farzapedia — LLM-Generated Personal Wikipedia from Private Data

## Tweet

> This is Farzapedia. I had an LLM take 2,500 entries from my diary, Apple Notes, and some iMessage convos to create a personal Wikipedia for me. It made 400 detailed articles for my friends, my startups, research areas, and even my favorite animes and their impact on me complete [with backlinks].

**Author:** [@FarzaTV](https://x.com/FarzaTV) (Farza — founder/builder) | **Date:** ~2026-04

## Key Insight

Farza demonstrates a concrete implementation of the LLM-wiki pattern that [[10-tweets/karpathy-llm-knowledge-bases|Karpathy described]]. The critical difference: **the input is deeply personal data** — diaries, notes, private messages — not research papers or public sources. The LLM compiled 2,500 raw entries into 400 structured, interlinked wiki articles covering people, projects, interests, and their relationships.

Two important design points emerge:

1. **The wiki isn't for the human — it's for the agent.** The backlinked, structured format makes the wiki easily crawlable by AI agents, turning personal knowledge into an agent-queryable knowledge base.
2. **Scale of compression.** 2,500 raw entries collapsed into 400 articles represents ~6:1 compression — the LLM is doing real synthesis, not just summarising individual notes.

This validates that the wiki pattern works not just for research (Karpathy's use case) but for **personal/relational data** — the kind of messy, unstructured information that historically resists organisation.

## Sebenza Hub Relevance

Sebenza Hub collects enormous amounts of personal and professional data across all user types — profiles, applications, messages, interview notes, placement records, learning progress. Today this data is stored in 755 database tables but is primarily queryable only through structured UI views. The Farzapedia pattern suggests an alternative: **compile user data into LLM-maintained personal wikis that both humans and AI agents can query**.

This is especially relevant because Sebenza Hub already has:
- A **wiki feature** (available to all user types)
- An **AI Copilot** (chat-based assistant for Recruiters)
- **Career DNA** (Individual profile synthesis)
- **DNA Card** (Recruiter profile summary)

These are all proto-versions of what Farzapedia demonstrates at scale.

## Recommendations

| # | Recommendation | Affected Area | Effort | Impact |
|---|---------------|---------------|--------|--------|
| 1 | **Agent-queryable candidate wikis for Recruiters** — Auto-compile a personal wiki per candidate from their application data, interview transcripts, screening bot conversations, assessment scores, and notes. The recruiter's AI Copilot can then answer complex questions like "Which candidates in my pipeline have fintech experience AND salary expectations under 600K?" by querying the wiki, not running SQL. | [[01-entities/recruiter-user]], [[02-concepts/ai-features]] — AI Copilot | High | High |
| 2 | **Personal career wiki for Individuals** — Evolve Career DNA from a static config into a living wiki compiled from the Individual's applications, interview feedback, skills assessments, learning completions, and saved jobs. Unlike a profile page, this would be a multi-article knowledge base the Individual (and their AI Career Coach) can query: "What patterns do my rejections have in common?" | [[01-entities/individual-user]] — Career DNA | Medium | High |
| 3 | **Client intelligence wiki for Recruiters** — Auto-compile a wiki page per client company from placement history, job descriptions, offer outcomes, time-to-fill data, and communication logs. Builds institutional memory that survives recruiter turnover. Directly extends Karpathy recommendation #1 from [[10-tweets/karpathy-llm-knowledge-bases]]. | [[01-entities/recruiter-user]] — Client Management | Medium | High |
| 4 | **Private-data-to-wiki pipeline as platform feature** — Offer a "bring your own data" wiki builder as a premium Individual feature. Users upload their CV history, LinkedIn export, career notes, and the LLM compiles a structured career wiki. Differentiator: no other job platform does this. | [[01-entities/individual-user]], [[02-concepts/billing-system]] | High | Medium |
| 5 | **Agent-first data architecture** — Adopt the insight that "the wiki is for the agent, not the human." Design AI features (Copilot, Career Coach, Screening Bot) to read from compiled wiki-format knowledge bases rather than raw database queries. This is an architectural shift that makes AI features dramatically more capable without changing the UI. | [[02-concepts/ai-features]], [[02-concepts/tech-stack]] | High | High |

## Skip Justification

N/A — This tweet is highly relevant. It validates and extends the Karpathy wiki pattern already tracked in this wiki, with specific implications for Sebenza Hub's AI and knowledge features.

## References

- [[10-tweets/karpathy-llm-knowledge-bases]] — Directly related: Karpathy's LLM wiki pattern (this tweet is a concrete implementation)
- [[10-tweets/explorax-20-agentic-skills]] — Modular `.md` skill files for AI — same pattern (markdown artifacts powering AI behaviour) applied to task execution rather than knowledge
- [[10-tweets/neilxbt-obsidian-claude-memory]] — Practical implementation guide: Obsidian + CLAUDE.md as the memory layer, validating this compounding knowledge pattern
- [[01-entities/sebenza-hub]] — Platform overview (wiki feature, AI features)
- [[01-entities/individual-user]] — Career DNA, AI Career Coach
- [[01-entities/recruiter-user]] — AI Copilot, client management, candidate CRM
- [[01-entities/screening-system]] — Screening bot knowledge base
- [[02-concepts/ai-features]] — Current AI capabilities across the platform
- [[02-concepts/tech-stack]] — Architecture considerations for agent-first data
- Source tweet: [Farza on X](https://x.com/FarzaTV/status/2040563939797504467)
