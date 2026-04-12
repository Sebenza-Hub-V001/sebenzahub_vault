---
title: "Claude Cowork as Chief of SEO — a 20-prompt local SEO audit system"
type: tweet
created: 2026-04-12
updated: 2026-04-12
tags: [ai, claude, claude-cowork, seo, local-seo, google-business-profile, prompts, prompt-library, marketing, growth]
author: "@bloggersarvesh"
url: "https://x.com/bloggersarvesh/status/2036795618090520592"
status: active
confidence: medium
---

# Claude Cowork as Chief of SEO — a 20-prompt local SEO audit system

## Tweet

> Sarvesh Shrivastava (@bloggersarvesh) publishes a long-form X article — *"My Chief of SEO, Claude Cowork"* — describing a **20-part prompt system built inside Claude Cowork that audits a business's entire Google presence**. Opening line: *"THIS IS THE ARTICLE I WASN'T GOING TO PUBLISH. Claude Cowork is now my Chief of SEO..."*. The 20 prompts are grouped into four functional areas:
>
> 1. **Google Business Profile optimisation** — 8 prompts
> 2. **Website strategy** — 5 prompts
> 3. **Backlinks & authority** — 3 prompts
> 4. **Content tracking & performance** — 4 prompts

**Author:** [@bloggersarvesh](https://x.com/bloggersarvesh/status/2036795618090520592) | **Date:** 2026-03-25 | **Engagement:** 1.3K likes · 128 RTs · 2.1M views

> ⚠️ **Note on fidelity:** X/Twitter blocked direct article scraping (HTTP 402) when this page was filed. The tweet body itself is just a link card; the structural summary above (number of prompts and section split) was reconstructed from an fxtwitter-proxied card description. **Verbatim prompt text was not recovered** — the individual prompts in the recommendations section below are the wiki maintainer's best-fit interpretations of what each slot likely contains, not direct quotes. Re-ingest from the original source when possible to confirm. Confidence: medium.

## Key Insight

The piece is less interesting as "another SEO checklist" and more interesting as an **architectural pattern**: Sarvesh treats Claude Cowork not as a chat window but as a *permanent role on the team* — "Chief of SEO" — backed by a curated library of 20 stable, re-runnable prompts that cover a single business function end-to-end. Each prompt is a reusable audit step; the collection is a playbook; the playbook lives inside a shared Claude Cowork workspace so anyone on the team can run it without re-deriving the prompts from scratch.

This is the same pattern Sebenza Hub has started exploring in other tweets — [[10-tweets/02-explorax-20-agentic-skills]] (20 agentic Skills as reusable units), [[10-tweets/01-aiedge-claude-skills-guide]] (Skill = config + trigger + instructions) — but applied to a *specific vertical role* rather than generic developer utilities. The insight generalises: any specialist function inside a company (SEO, recruiting, compliance, support) can be decomposed into a 10–20 prompt library and reified as a "Chief of X" AI role. The value comes from the **completeness and repeatability** of the library, not from any individual prompt being clever.

A second, subtler insight: the split **8 / 5 / 3 / 4** for GBP / website / backlinks / content is itself informative. The author is telling us where the leverage is for **local** SEO — profile optimisation dominates (40% of the prompts), authority/link building is only 15%. This contradicts the common agency narrative that link building is where the hard work lives and suggests Google Business Profile is the under-served frontier for small-business local SEO, at least for the author's use case.

## Sebenza Hub Relevance

This is **directly relevant** to Sebenza Hub on two independent axes:

### 1. Sebenza Hub's own SEO programme

[[02-concepts/seo-strategy]] already flags the gaps this article is designed to close:

- **Google Business Profile** is listed as a *Medium priority gap* — "Local search presence" (`seo-strategy.md` line 36).
- **City-specific landing pages** are listed as a *Medium priority gap* — "Hyper-local search rankings" (line 37).
- **Link building campaigns** are listed as a *Medium priority gap* — "Domain authority growth" (line 38).
- **Blog content expansion** is the *High priority gap* — "Biggest organic traffic driver" (line 34).

Three of Sebenza Hub's four open SEO gaps map 1:1 onto the four sections of Sarvesh's prompt library. That's an unusually clean fit. Instead of the Sebenza Hub marketing team commissioning a custom SEO audit, they could clone this 20-prompt system and point it at `sebenzahub.co.za` directly — and the work is most of the way toward closing the gaps tracked in the SEO strategy page.

### 2. Sebenza Hub as a platform *offering* this to recruiters and businesses

The more interesting angle: **Sebenza Hub's recruiter and business users are themselves small businesses with local SEO problems.** A recruitment agency in Johannesburg has the same Google Business Profile optimisation needs as any local service business. Sebenza Hub already has ~152 AI features ([[02-concepts/ai-features]]) and targets recruiter and business users who want AI to do the marketing/growth work they don't have headcount for.

Packaging a "Chief of SEO" prompt library as a feature — "Sebenza Hub audits your Google presence for you" — would be a straightforward marketing-automation addition to the business and recruiter dashboards, building on the existing Claude integration. It slots naturally alongside the WhatsApp bot and screening system as a **vertical AI role** rather than a generic chat assistant.

### 3. Architectural echo — reusable prompt libraries

This also reinforces the pattern from [[10-tweets/01-aiedge-claude-skills-guide]] and [[10-tweets/02-explorax-20-agentic-skills]]: AI behaviour should live in a **reusable, versionable registry**, not hard-coded into app routes. A "Chief of SEO" is just a named bundle of 20 prompts with shared context. Same for "Chief of Compliance" (POPIA/B-BBEE checks), "Chief of Screening" (the existing screening system reframed), "Chief of Sourcing" (LinkedIn + job-board aggregation). The pattern wants a registry.

## Recommendations

| # | Recommendation | Affected Area | Effort | Impact |
|---|---|---|---|---|
| 1 | **Run the 20-prompt audit against `sebenzahub.co.za` itself.** Use the Sebenza Hub team's existing Claude access to replicate Sarvesh's four-section prompt library and run it end-to-end on Sebenza Hub's own Google presence. Treat the output as a baseline audit and file it as `09-sources/sebenzahub-seo-audit-2026-04.md`. Closes three of the four Medium-priority gaps in [[02-concepts/seo-strategy]] for near-zero cost. | [[02-concepts/seo-strategy]] | low | high |
| 2 | **Build a "Local SEO Audit" AI feature in the recruiter & business dashboards.** New dashboard card: user enters their business URL + location → the 20-prompt library runs against their Google Business Profile, website, backlinks, and content → returns a prioritised action list. Monetise as a credit-based feature via the existing [[02-concepts/billing-system]]. Differentiates Sebenza Hub from pure recruitment ATS competitors. | [[01-entities/recruiter-user]], [[01-entities/business-user]], [[02-concepts/ai-features]] | medium | high |
| 3 | **Formalise the "Chief of X" pattern as a Sebenza Hub AI architecture primitive.** Define a `VerticalRole` = `{ name, description, prompt_library[], shared_context, tool_access }` and wire it through the ai-features registry. Start with Chief of SEO as the reference implementation; later candidates are Chief of Screening, Chief of Compliance, Chief of Sourcing, Chief of Content. Converges the Claude Skills, agentic Skills, and Managed Agents architectural conversations onto a single Sebenza Hub abstraction. | [[02-concepts/ai-features]], [[10-tweets/01-aiedge-claude-skills-guide]], [[10-tweets/02-explorax-20-agentic-skills]], [[10-tweets/09-nickspisak-claude-managed-agents]] | high | high |
| 4 | **Ship a Google Business Profile landing page and claim GBP for the Sebenza Hub entity.** The audit in Rec #1 will recommend this as step one; front-run it by adding `/google-business-profile` under the existing public marketing surface and by claiming `Sebenza Hub Pty Ltd` on Google Business Profile. Directly closes the `Google Business Profile — Medium` gap in [[02-concepts/seo-strategy]]. | [[02-concepts/seo-strategy]], [[01-entities/sebenza-hub]] | low | medium |
| 5 | **Build a city-specific landing page generator powered by the audit prompts.** Sebenza Hub already lists "City-specific landing pages" as a Medium gap. Use a subset of the website-strategy prompts (the 5 in section 2) to auto-generate landing pages for the top 8 SA metros (Johannesburg, Cape Town, Durban, Pretoria, Port Elizabeth, Bloemfontein, East London, Polokwane), each with city-specific job counts and testimonials. | [[02-concepts/seo-strategy]], [[01-entities/job-aggregation]] | medium | high |
| 6 | **Backlink-building playbook as a Sebenza Hub lead magnet.** Sarvesh's section 3 (3 prompts on backlinks and authority) is the smallest section but the hardest to execute. Publish the Sebenza Hub adaptation of those prompts as a free blog post / lead magnet aimed at SA recruitment agencies. Dual purpose: (a) closes the "Link building campaigns" gap on Sebenza Hub's own SEO by generating inbound links from readers who share it, and (b) demonstrates the platform's AI capability to prospective recruiter users. | [[02-concepts/seo-strategy]], [[01-entities/recruiter-user]] | low | medium |
| 7 | **Cross-link the SEO strategy page to this tweet.** Add a "References" bullet in [[02-concepts/seo-strategy]] pointing to this page so the next person who reads the SEO strategy knows the 20-prompt playbook exists as a concrete starting point. | [[02-concepts/seo-strategy]] | low | low |

## Open Questions Raised

- **Verbatim prompts** — what are the actual 20 prompts? The structural summary (8/5/3/4) is high-confidence, but the text of each prompt was not recovered in this ingest. A follow-up fetch from an authenticated X client or from Sarvesh's newsletter/blog is needed before shipping Rec #2 or #3.
- **Is "Claude Cowork" the same product as Claude Managed Agents?** "Cowork" appears to be Anthropic's name for the shared-workspace feature of Claude, but its relationship to [[10-tweets/09-nickspisak-claude-managed-agents]] is unclear. If Cowork is the human-facing UI and Managed Agents is the programmatic runtime, a prompt library built in Cowork should be portable to a Managed Agent — which would make Rec #3 meaningfully easier.
- **Local SEO leverage split** — Sarvesh's 40% / 25% / 15% / 20% allocation (GBP / website / backlinks / content) is the opposite of the traditional agency split. Is this a genuine shift driven by Google's 2026 SERP layout, or an artefact of the author's specific business? Answering it changes Sebenza Hub's SEO priority order.
- **POPIA implications** — running an SEO audit via Claude on a recruiter's or business's live Google presence means the audit output (which may contain competitor analysis or confidential marketing data) transits through Anthropic's US-hosted models. Does this require a DPA entry in [[04-standards]]? Same question as raised in [[10-tweets/09-nickspisak-claude-managed-agents]]; worth resolving once for the whole AI layer.

## Skip Justification

Not applicable — this tweet is directly actionable for Sebenza Hub on both the internal-SEO and product-feature axes. Three of four open SEO gaps in [[02-concepts/seo-strategy]] map 1:1 onto the article's prompt sections.

## References

- Related wiki pages: [[02-concepts/seo-strategy]] (primary), [[02-concepts/ai-features]], [[01-entities/sebenza-hub]], [[01-entities/recruiter-user]], [[01-entities/business-user]], [[02-concepts/billing-system]], [[01-entities/job-aggregation]]
- Related tweets: [[10-tweets/01-aiedge-claude-skills-guide]] (Skill = config + trigger + instructions; progressive loading), [[10-tweets/02-explorax-20-agentic-skills]] (20 agentic Skills — same "library of reusable AI units" architecture, applied to general dev rather than SEO), [[10-tweets/09-nickspisak-claude-managed-agents]] (the programmatic runtime a "Chief of X" library would sit on top of), [[10-tweets/04-karpathy-llm-knowledge-bases]] (context/knowledge base as input to prompt libraries)
- Source tweet: [Sarvesh Shrivastava on X](https://x.com/bloggersarvesh/status/2036795618090520592)
- Linked article: *"My Chief of SEO, Claude Cowork"* — X long-form post, 2026-03-25 (paywalled to logged-out scrapers at ingest time)
