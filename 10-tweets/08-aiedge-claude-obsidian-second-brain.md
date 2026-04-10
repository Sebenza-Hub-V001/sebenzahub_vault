---
title: "Claude Code + Obsidian AI Second Brain — Full Setup Guide"
type: tweet
created: 2026-04-09
updated: 2026-04-09
tags: [ai, obsidian, claude-code, knowledge-management, llm, architecture, productivity]
author: "@aiedge_"
url: "https://x.com/aiedge_/status/2041908011078447222"
status: active
confidence: medium
---

# Claude Code + Obsidian AI Second Brain — Full Setup Guide

## Tweet

> [Link to X article: Claude Code + Obsidian AI Second Brain Guide]
>
> "Instead of just retrieving from raw documents at query time, the LLM incrementally builds and maintains a persistent wiki."

**Author:** [@aiedge_](https://x.com/aiedge_/status/2041908011078447222) (AI Edge) | **Date:** ~2026-04-09

> ⚠️ **Fidelity note:** X blocked direct scraping (HTTP 402). Content reconstructed via reader-proxy summary. Exact tweet text not preserved verbatim — the summary captured the structural guide, tool stack, and core insight but not the full wording. Confidence: medium. Re-ingest when direct access is restored.

## Key Insight

@aiedge_ publishes a step-by-step guide for building a **Claude Code + Obsidian second brain** — the same pattern Karpathy, Farza, and neil_xbt have described, but packaged as a concrete setup walkthrough with a specific tool stack. The central claim: *instead of retrieving from raw documents at query time (RAG), the LLM incrementally builds and maintains a persistent wiki* that compounds in value over time.

### Four Moving Parts

1. **Data collection** — articles, notes, transcripts, exports (raw inputs)
2. **Organisation via Claude Code in Obsidian** — LLM compiles raw → structured markdown
3. **Instant querying** — ask complex questions against the compiled wiki
4. **Evolving memory** — the wiki improves with every ingestion

### Setup Steps

1. Download Obsidian and create a Vault (markdown folder)
2. Grant Claude Code desktop app access to the Vault folder
3. Load Karpathy's LLM Knowledge Base system prompt as `CLAUDE.md`
4. Populate initial data from existing notes, exports, or web sources

### Tool Stack Mentioned

| Tool | Purpose |
|------|---------|
| **Obsidian** | Markdown vault / graph view |
| **Claude Code** | LLM maintainer for the vault |
| **Karpathy's schema prompt** | `CLAUDE.md` configuration |
| **Obsidian Web Clipper** | Browser extension — captures web articles directly into `13-raw/` |
| **Obsidian Chrome Extension** | Companion capture tool |
| **Marp** | Markdown-based slide deck generation (for presentations from wiki content) |
| **Dataview** | Query plugin — SQL-like queries over frontmatter fields |
| **qmd** | Local markdown search engine (fast full-text over the vault) |

### Architecture Components

1. **Raw source data** — immutable ingested material
2. **Wiki layer** — LLM-generated markdown (entities, concepts, sources)
3. **Schema document** — `CLAUDE.md` defining conventions and workflows
4. **Index and log files** — navigation + chronological activity trail

## Sebenza Hub Relevance

This tweet is **directly validating** — this very wiki (the one you're reading) is a concrete implementation of the exact pattern aiedge_ describes. Our `CLAUDE.md`, our `13-raw/` directory, our `09-sources/` summaries, our `index.md` / `log.md`, and the Ingest / Query / Lint / Evolve / Tweet operations match the guide's architecture step-for-step.

Three prior tweets already cover the same pattern at different levels:

- [[10-tweets/04-karpathy-llm-knowledge-bases]] — the foundational pattern + schema gist
- [[10-tweets/03-farzatv-farzapedia-personal-wiki]] — a working implementation (2,500 notes → 400 articles)
- [[10-tweets/06-neilxbt-obsidian-claude-memory]] — the "Obsidian as Claude's memory" framing

What **this** tweet adds that the others didn't:

1. **A specific tool stack** — Marp, Dataview, qmd, and Obsidian Web Clipper weren't named in the prior tweets. These are concrete, adoptable tools.
2. **Marp for presentations** — directly fills a gap: `11-presentations/` is empty. Marp lets the wiki generate slide decks from the same markdown files it already maintains.
3. **Dataview for structured queries** — our frontmatter is already Dataview-compatible (`type`, `tags`, `status`, `created`, `updated`). We could ship queries that surface stale pages, orphan pages, or per-tag indexes without custom tooling.
4. **Obsidian Web Clipper** — a lower-friction path to get tweets, articles, and screenshots into `13-raw/` without manual file creation.

Beyond the meta-validation, there is a **product angle for Sebenza Hub**: a user-facing "Agent-Ready Knowledge Base" export (already suggested in Rec #3 of [[10-tweets/06-neilxbt-obsidian-claude-memory]]) could bundle Marp templates, Dataview queries, and a pre-built `CLAUDE.md` so users plug their exported vault straight into Claude Code.

## Recommendations

| # | Recommendation | Affected Area | Effort | Impact |
|---|---------------|---------------|--------|--------|
| 1 | **Adopt Marp for the empty `11-presentations/` folder** — Install Marp, create a shared template, and start generating pitch decks directly from wiki content (e.g. "Sebenza Hub platform overview" deck sourced from [[01-entities/sebenza-hub]] + [[overview.md]]). Removes the blocker on the presentations track. | `11-presentations/`, wiki tooling | low | medium |
| 2 | **Add Dataview queries to `index.md`** — Replace the manually-maintained lists with Dataview queries over frontmatter (`TABLE type, updated FROM "01-entities" WHERE status = "active"`). Auto-surfaces stale pages and eliminates the drift between `index.md` and reality. | [[index.md]], wiki tooling | low | medium |
| 3 | **Install Obsidian Web Clipper for ingestion** — Streamlines the Ingest workflow: clipping an article goes straight into `13-raw/articles/` with source URL preserved. Reduces friction on the most frequent operation. | Ingest workflow, `13-raw/` | low | medium |
| 4 | **Ship a "Knowledge Vault Export" SKU for Sebenza Hub users** — Bundle the user's platform data as an Obsidian-compatible vault with pre-configured `CLAUDE.md`, Marp templates, and Dataview dashboards. Differentiator vs every other recruiter/career SaaS. Extends Rec #3 from [[10-tweets/06-neilxbt-obsidian-claude-memory]]. | [[01-entities/recruiter-user]], [[01-entities/individual-user]], [[02-concepts/billing-system]] | high | medium |
| 5 | **Use Karpathy's schema gist as the canonical upstream** — Cross-link our `CLAUDE.md` back to [Karpathy's llm-wiki gist](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f) so future drift is visible. Add a "schema version" field to page frontmatter. | [[CLAUDE.md]], all pages | low | low |

## Skip Justification

N/A — The tweet is directly relevant. The only reason to downrank it is redundancy with [[10-tweets/04-karpathy-llm-knowledge-bases]], [[10-tweets/03-farzatv-farzapedia-personal-wiki]], and [[10-tweets/06-neilxbt-obsidian-claude-memory]], but the specific tool stack (Marp, Dataview, Web Clipper, qmd) is new and actionable.

## References

- Related tweets: [[10-tweets/04-karpathy-llm-knowledge-bases]] (foundational pattern), [[10-tweets/03-farzatv-farzapedia-personal-wiki]] (working implementation), [[10-tweets/06-neilxbt-obsidian-claude-memory]] (Obsidian-as-memory framing), [[10-tweets/05-coreyganim-hidden-claude-code-features]] (Claude Code features that pair with this stack)
- Related wiki pages: [[CLAUDE.md]] (our schema), [[index.md]], [[01-entities/sebenza-hub]], [[01-entities/recruiter-user]], [[01-entities/individual-user]], [[02-concepts/ai-features]]
- Source tweet: [@aiedge_ on X](https://x.com/aiedge_/status/2041908011078447222)
- Upstream schema: [Karpathy's llm-wiki gist](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f)
