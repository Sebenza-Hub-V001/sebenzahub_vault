---
title: "LLM Knowledge Bases — Karpathy's Wiki Pattern"
type: tweet
created: 2026-04-07
updated: 2026-04-07
tags: [ai, knowledge-management, llm, obsidian, productivity, architecture]
author: "@karpathy"
url: "https://x.com/karpathy/status/2039805659525644595"
status: active
---

# LLM Knowledge Bases — Karpathy's Wiki Pattern

## Tweet

> **LLM Knowledge Bases**
>
> Something I'm finding very useful recently: using LLMs to build personal knowledge bases for various topics of research interest. In this way, a large fraction of my recent token throughput is going less into manipulating code, and more into manipulating knowledge stored as markdown and images.

**Author:** [@karpathy](https://x.com/karpathy) (Andrej Karpathy — former Tesla AI director, OpenAI founding member) | **Date:** ~2026-04

Karpathy describes a system where:
- **Raw sources** (articles, papers, repos, datasets, images) are indexed into a `raw/` directory
- An **LLM incrementally "compiles" a wiki** — markdown files with summaries, backlinks, categorised concept articles
- At scale (~100 articles, ~400K words), you can ask the LLM complex questions against it
- **No vector database / RAG needed** — index files + LLM context window handle retrieval at personal scale
- The human rarely edits the wiki directly — it's the LLM's domain
- He published a schema ([llm-wiki gist](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f)) with a three-layer architecture: Raw Sources → Wiki → Schema (CLAUDE.md)

### Four Core Operations

1. **Ingest** — Process new sources, updating 10–15 wiki pages per source
2. **Query** — Search relevant pages, synthesise answers, file valuable results back into wiki
3. **Lint** — Periodic health checks for contradictions, orphans, stale claims, missing cross-references
4. **Evolve** — Rewrite overview as knowledge accumulates

### Key Quote

> "The tedious part of maintaining a knowledge base is not the reading or the thinking — it's the bookkeeping."

Karpathy positions LLMs as ideal for the bookkeeping humans inevitably abandon.

## Key Insight

This tweet validates and popularises the exact pattern we're using for this Sebenza Hub wiki — an LLM-maintained, markdown-based knowledge base with immutable raw sources, structured wiki pages, and automated cross-referencing. The key insight is that **LLMs are better at knowledge maintenance than code generation** for many use cases, and that personal-scale knowledge bases don't need RAG infrastructure — just well-structured markdown and a good schema.

## Sebenza Hub Relevance

Sebenza Hub already has a **wiki system** built into the platform (available to all 4 user types at `/wiki`). However, based on the codebase audit, the wiki feature appears to be a basic collaborative wiki — not an LLM-powered knowledge base in the Karpathy sense. This tweet suggests several enhancement opportunities.

Additionally, Sebenza Hub's **Individual Learning Hub** and **Community features** are adjacent to knowledge management but don't use LLM-driven knowledge compilation.

## Recommendations

| # | Recommendation | Affected Area | Effort | Impact |
|---|---------------|---------------|--------|--------|
| 1 | **AI-powered wiki for Recruiters** — Let the platform auto-build a knowledge base from a recruiter's placement history, client notes, candidate interactions, and market data. The LLM compiles insights like "your strongest sector is fintech, your average time-to-fill is dropping, Client X hasn't placed in 6 months." | [[entities/recruiter-user]] — Wiki + Analytics | High | High |
| 2 | **AI-compiled company research for Individuals** — When an Individual saves a company or applies to a job, auto-compile a knowledge page about that company (culture, Glassdoor-like data, hiring patterns, salary ranges) using the Karpathy wiki pattern. Build it incrementally as more data comes in. | [[entities/individual-user]] — Company Research | Medium | High |
| 3 | **Auto-linting for Recruiter compliance** — Apply the "lint" operation to Recruiter data: flag stale candidate profiles, contradictory notes, engagement gaps with clients, expired B-BBEE certificates. Surface these as actionable alerts, not just reports. | [[entities/recruiter-user]], [[concepts/compliance]] | Medium | Medium |
| 4 | **LLM-maintained talent market wiki for Admins** — Auto-compile a platform-wide market intelligence wiki from aggregated (anonymised) data: which skills are trending, which industries are hiring, salary movements by province. Admin and Recruiters could query this. | [[entities/admin-user]], [[concepts/ai-features]] | High | High |
| 5 | **Evolving "Career DNA" synthesis for Individuals** — Instead of a static Career DNA config, use the Karpathy pattern: as the Individual applies, interviews, learns, and gets feedback, the LLM incrementally compiles an evolving career narrative — strengths, patterns, growth areas — that's richer than a form-filled profile. | [[entities/individual-user]] — Career DNA in settings | Medium | Medium |
| 6 | **Knowledge base for the Screening Bot** — Feed the screening chatbot a compiled knowledge base per role (not just static question banks). The LLM compiles screening criteria, common red flags, ideal candidate patterns from past successful hires. The bot gets smarter over time. | [[entities/screening-system]] | High | High |

## References

- [[entities/sebenza-hub]] — Platform overview (has wiki feature for all user types)
- [[entities/individual-user]] — Company research, Career DNA, Learning Hub
- [[entities/recruiter-user]] — Client notes, analytics, talent CRM
- [[entities/screening-system]] — Screening chatbot and question banks
- [[concepts/ai-features]] — Current AI capabilities
- [[entities/community-learning-hub]] — Learning and knowledge features
- [[tweets/farzatv-farzapedia-personal-wiki]] — Farza's concrete implementation of this pattern using personal data (diaries, notes, messages → 400-article wiki)
- Source tweet: [Andrej Karpathy on X](https://x.com/karpathy/status/2039805659525644595)
- Schema gist: [llm-wiki.md](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f)
