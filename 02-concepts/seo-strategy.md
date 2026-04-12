---
title: "SEO Strategy"
type: concept
created: 2026-04-07
updated: 2026-04-12
tags: [seo, marketing, growth, content, search]
sources: [seo-plan-2026-04-07]
related-tweets: [10-bloggersarvesh-claude-cowork-chief-of-seo]
status: active
confidence: high
---

# SEO Strategy

Sebenza Hub has a comprehensive SEO strategy targeting the South African recruitment market. The implementation is already mature with most foundational elements in place.

## Current State

### Implemented
- Per-page dynamic meta tags via `react-helmet-async` (35+ pages)
- `robots.txt` with crawl rules + dynamic `sitemap.xml`
- Open Graph + Twitter Card tags on all public pages
- 8 JSON-LD structured data schemas (Organization, LocalBusiness, WebSite, SoftwareApp, FAQ, Breadcrumb, JobPosting, Article)
- Bot meta injection middleware for 13 static + dynamic routes
- Public job listing pages with live search + province/industry landing pages
- PWA with offline support + Core Web Vitals tracking → GA4
- Blog platform with article schema and breadcrumbs
- Hreflang `en-za` on all public pages
- Code splitting (30+ lazy-loaded pages)

### Key Gaps
| Gap | Priority | Impact |
|-----|----------|--------|
| SSR/Prerendering (Rendertron) | Critical | SPA may not be fully indexed by crawlers |
| Blog content expansion | High | Biggest organic traffic driver |
| Image optimization (WebP/AVIF) | Medium | Core Web Vitals improvement |
| Google Business Profile | Medium | Local search presence |
| City-specific landing pages | Medium | Hyper-local search rankings |
| Link building campaigns | Medium | Domain authority growth |

## Keyword Strategy

### Primary (High Priority)
| Keyword | Monthly Volume (SA) | Target Page |
|---------|-------------------|-------------|
| job search south africa | 5K-10K | /individuals |
| find jobs south africa | 3K-5K | /individuals |
| hr software south africa | 1K-2K | / |
| recruitment software south africa | 500-1K | /recruiters |
| ATS south africa | 200-500 | / |

### Content Pillars
1. **Recruitment in South Africa** — market reports, salary guides, compliance
2. **AI in Hiring** — AI screening, bias-free hiring, predictive analytics
3. **Career Development** — CV guides, interview prep, salary negotiation
4. **Recruiter Best Practices** — pipeline building, WhatsApp strategies
5. **HR Compliance & Legal** — POPIA, B-BBEE, Employment Equity Act

## Goals
1. Page 1 rankings for key SA recruitment terms within 6-12 months
2. 10,000+ monthly organic visitors within 12 months
3. Topical authority in SA recruitment, HR tech, AI hiring
4. Qualified leads through organic search

## Technical Architecture
- **Prerendering** — Rendertron recommended for current SPA architecture (no migration needed)
- **Meta tags** — `SEOHead.tsx` component with `react-helmet-async`
- **Structured data** — `client/src/lib/seo.ts` for JSON-LD schemas
- **Bot injection** — `server/seo-prerender.ts` for crawler-specific content

## Open Questions

- Is Rendertron or any prerendering solution currently deployed?
- What's the current organic traffic baseline?
- Are city-specific landing pages implemented?

## References

- [[01-entities/sebenza-hub]] — Platform overview
- [[02-concepts/tech-stack]] — React SPA architecture
- Source: [[09-sources/seo-plan-2026-04-07]]
- Related tweet: [[10-tweets/10-bloggersarvesh-claude-cowork-chief-of-seo]] — 20-prompt "Chief of SEO" audit library covering Google Business Profile (8 prompts), website strategy (5), backlinks/authority (3), and content tracking (4); maps 1:1 onto three of the four Medium-priority gaps above.
