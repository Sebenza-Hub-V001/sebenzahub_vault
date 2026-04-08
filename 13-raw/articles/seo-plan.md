# Sebenza Hub — Comprehensive SEO Plan

**Platform:** Sebenza Hub — South Africa's AI-Powered Recruitment Platform
**Date:** March 2026 (updated: 30 March 2026)
**Target Market:** South Africa (primary), Southern Africa (secondary)
**URL Segments:** Job seekers, Recruiters, Businesses/Corporates

---

## Table of Contents

1. [Executive Summary](#1-executive-summary)
2. [Current SEO Audit](#2-current-seo-audit)
3. [Technical SEO](#3-technical-seo)
4. [On-Page SEO](#4-on-page-seo)
5. [Keyword Strategy](#5-keyword-strategy)
6. [Content Strategy](#6-content-strategy)
7. [Local SEO](#7-local-seo)
8. [Link Building Strategy](#8-link-building-strategy)
9. [Structured Data / Schema Markup](#9-structured-data--schema-markup)
10. [Social Media & Open Graph](#10-social-media--open-graph)
11. [Performance & Core Web Vitals](#11-performance--core-web-vitals)
12. [International & Language SEO](#12-international--language-seo)
13. [Mobile SEO & PWA](#13-mobile-seo--pwa)
14. [Analytics & Tracking](#14-analytics--tracking)
15. [Competitor Analysis](#15-competitor-analysis)
16. [Implementation Roadmap](#16-implementation-roadmap)
17. [KPIs & Success Metrics](#17-kpis--success-metrics)

---

## 1. Executive Summary

Sebenza Hub is a comprehensive AI-powered recruitment platform built for the South African market, serving job seekers, recruiters, and businesses. With 165+ frontend pages, 134 AI features, 300+ assessment templates, and 488 API endpoints, the platform has massive content potential and **comprehensive SEO implementation** in place.

### Current State (as of March 2026)
- Per-page dynamic meta tags via `react-helmet-async` (SEOHead component) on 35+ pages
- Full `robots.txt` with crawl rules, `sitemap.xml` with static + dynamic pages (jobs, blog posts)
- Open Graph + Twitter Card tags on all public pages
- 8 JSON-LD structured data schemas: Organization, LocalBusiness, WebSite, SoftwareApp, FAQ, Breadcrumb, JobPosting, Article
- Bot meta injection middleware (`seo-prerender.ts`) covering 13 static pages + dynamic routes (/job/:id, /jobs/:slug, /blog/:slug) with content snippets
- Public job listing pages (`/jobs`, `/jobs/:slug`) with live search, province/industry landing pages
- Hreflang `en-za` tags on all public pages
- Core Web Vitals tracking (CLS, LCP, FID, INP, FCP, TTFB) reported to GA4
- PWA with offline support, auto-update service worker
- Gzip compression with optimized threshold
- Blog platform with article schema and breadcrumbs
- Internal linking: header (8 links), footer (5 columns with province/industry job links)
- Canonical URLs on all public pages

### Opportunity
- South African recruitment market is growing rapidly
- Limited competition in AI-powered SA-specific recruitment tools
- Strong differentiators: POPIA compliance, B-BBEE/EE tracking, WhatsApp integration, SETA learnerships
- 134 AI features and 300+ test templates provide rich content for topical authority

### Goals
1. Achieve page 1 rankings for key SA recruitment terms within 6-12 months
2. Drive 10,000+ monthly organic visitors within 12 months
3. Establish topical authority in SA recruitment, HR tech, and AI hiring
4. Generate qualified leads (job seekers, recruiters, corporates) through organic search

---

## 2. Current SEO Implementation Status

### Implemented
| Element | Status | Location |
|---------|--------|----------|
| Per-page meta tags | 35+ pages | `SEOHead.tsx` + `react-helmet-async` |
| Open Graph tags | All public pages | `SEOHead.tsx` |
| Twitter Card tags | All public pages | `SEOHead.tsx` |
| Canonical URLs | All public pages | `SEOHead.tsx` |
| Hreflang (en-za) | All public pages | `SEOHead.tsx` + bot injection |
| robots.txt | Configured | `client/public/robots.txt` |
| sitemap.xml | Dynamic (static + DB) | `server/sitemap.ts` — includes jobs + blog posts |
| JSON-LD schemas | 8 types | `client/src/lib/seo.ts` |
| Bot meta injection | 13 static + dynamic | `server/seo-prerender.ts` with content snippets |
| Bot content snippets | Key pages | `seo-prerender.ts` — indexable text for crawlers |
| Public job pages | /jobs + /jobs/:slug | `JobsLanding.tsx` with live job search |
| Blog platform | /blog + /blog/:slug | Article schema, breadcrumbs, categories |
| Breadcrumb navigation | Blog, Jobs | `Breadcrumb.tsx` + BreadcrumbList schema |
| Internal linking | Header + Footer | 8 nav links, 5-column footer with job province/industry links |
| PWA manifest | Configured | `/manifest.json` |
| Core Web Vitals | CLS, LCP, FID, INP, FCP, TTFB | `Analytics.tsx` via `web-vitals` package |
| GA4 analytics | Production-only | `Analytics.tsx` (single load, no duplicates) |
| Google Search Console | Verification meta | `Analytics.tsx` via env var |
| Compression | Gzip (1KB threshold) | `server/index.ts` |
| Skip-to-content | Accessibility link | `client/index.html` |
| 404 page | noIndex + navigation | `NotFound.tsx` |
| Code splitting | 30+ lazy-loaded pages | `lazyWithRetry` wrapper |
| Heavy JS dynamic imports | html2pdf, docx | All PDF/doc libs dynamically imported |

### Remaining Opportunities
| Element | Priority | Impact |
|---------|----------|--------|
| Full SSR/prerendering (Rendertron) | Medium | Better content indexing for complex pages |
| Image optimization (WebP/AVIF) | Medium | Faster page loads, better CWV |
| Google Business Profile | Medium | Local search presence |
| Blog content expansion | High | Topical authority + organic traffic |
| Link building campaigns | Medium | Domain authority |
| City-specific landing pages | Medium | Hyper-local search rankings |

---

## 3. Technical SEO

### 3.1 Server-Side Rendering / Prerendering (CRITICAL)

**Problem:** Sebenza Hub is a React SPA (Vite + React). Search engine crawlers may not execute JavaScript, meaning page content won't be indexed.

**Solutions (choose one):**

#### Option A: Prerendering Service (Recommended for current architecture)
- Implement **prerender.io** or **Rendertron** as middleware in Express
- Detect bot user agents and serve pre-rendered HTML
- Cache pre-rendered pages for performance
- No architecture change required

```
Implementation in server/index.ts:
- Add prerender-node middleware
- Configure for Google, Bing, social media bots
- Cache pre-rendered pages for 24 hours
```

#### Option B: Static Site Generation for Public Pages
- Use Vite SSG plugin for public-facing pages only
- Generate static HTML at build time for: `/`, `/pricing`, `/recruiters`, `/individuals`, `/contact`
- Dashboard pages remain client-side (behind auth)

#### Option C: Full SSR Migration (Long-term)
- Migrate to Next.js or Remix for full SSR capabilities
- Most impactful but highest effort
- Consider for V3 of the platform

### 3.2 robots.txt

Create `/public/robots.txt`:

```
User-agent: *
Allow: /
Allow: /pricing
Allow: /recruiters
Allow: /individuals
Allow: /contact
Allow: /p/*
Allow: /skills/*
Allow: /public/passport/*

# Disallow authenticated areas
Disallow: /dashboard/
Disallow: /admin/
Disallow: /onboarding/
Disallow: /login
Disallow: /api/

# Disallow assessment tokens (private)
Disallow: /assess/

# Sitemap
Sitemap: https://sebenzahub.co.za/sitemap.xml
```

### 3.3 XML Sitemap

Generate dynamic `sitemap.xml` with:

**Static pages:**
```xml
<url>
  <loc>https://sebenzahub.co.za/</loc>
  <changefreq>weekly</changefreq>
  <priority>1.0</priority>
</url>
<url>
  <loc>https://sebenzahub.co.za/pricing</loc>
  <changefreq>monthly</changefreq>
  <priority>0.8</priority>
</url>
<url>
  <loc>https://sebenzahub.co.za/recruiters</loc>
  <changefreq>monthly</changefreq>
  <priority>0.9</priority>
</url>
<url>
  <loc>https://sebenzahub.co.za/individuals</loc>
  <changefreq>monthly</changefreq>
  <priority>0.9</priority>
</url>
<url>
  <loc>https://sebenzahub.co.za/contact</loc>
  <changefreq>monthly</changefreq>
  <priority>0.5</priority>
</url>
```

**Dynamic pages (API-generated):**
- Public candidate profiles: `/p/:userId`
- Public skill portfolios: `/skills/:userId`
- Public credential passports: `/public/passport/:slug`
- Blog posts (when implemented): `/blog/:slug`
- Job listings (when public): `/jobs/:id`

**Implementation:**
- Create `/api/sitemap.xml` endpoint in Express
- Query database for public profiles, job listings
- Generate XML dynamically
- Cache for 1 hour
- Submit to Google Search Console and Bing Webmaster Tools

### 3.4 Canonical Tags

Add `<link rel="canonical">` to every page to prevent duplicate content:

```html
<link rel="canonical" href="https://sebenzahub.co.za/pricing" />
```

- Implement via `react-helmet-async` or custom `<Head>` component
- Self-referencing canonicals on all pages
- Handle query parameter variations (e.g., `/jobs?page=2` → canonical to `/jobs`)

### 3.5 URL Structure Optimization

**Current routes are well-structured.** Minor improvements:

| Current | Recommended | Reason |
|---------|------------|--------|
| `/p/:userId` | `/profile/:userId` or `/candidate/:slug` | More descriptive |
| `/skills/:userId` | `/portfolio/:slug` | Better keyword targeting |
| `/public/passport/:slug` | `/credentials/:slug` | Shorter, cleaner |

**Future public job routes:**
- `/jobs` — Job listing directory
- `/jobs/:slug` — Individual job posting
- `/jobs/gauteng` — Provincial job pages
- `/jobs/software-developer` — Role-based pages
- `/companies/:slug` — Company profiles

### 3.6 HTTPS & Security Headers

Already configured via Helmet.js. Verify:
- HSTS header present
- X-Content-Type-Options: nosniff
- X-Frame-Options: DENY (or SAMEORIGIN for embeds)
- Content-Security-Policy configured
- Referrer-Policy set

### 3.7 Crawl Budget Optimization

- Implement pagination with `rel="next"` and `rel="prev"` for job listings
- Use `noindex` on filtered/sorted variations
- Block unnecessary API routes in robots.txt
- Minimize redirect chains
- Fix any broken links (404s)

---

## 4. On-Page SEO

### 4.1 Per-Page Meta Tag Management

**Install `react-helmet-async`** and create a reusable `<SEOHead>` component:

```tsx
// client/src/components/SEOHead.tsx
interface SEOHeadProps {
  title: string;
  description: string;
  canonical?: string;
  ogImage?: string;
  ogType?: string;
  noIndex?: boolean;
  jsonLd?: object;
}
```

### 4.2 Page-Specific Meta Tags

#### Home Page (`/`)
```
Title: Sebenza Hub | South Africa's AI-Powered Recruitment Platform
Description: Connect with top talent across South Africa. AI-powered hiring with 134+ features, POPIA compliance, B-BBEE tracking, and WhatsApp integration. Free to start.
```

#### Recruiters Page (`/recruiters`)
```
Title: Recruitment Agency Software South Africa | Sebenza Hub
Description: Streamline your recruitment agency with AI-powered candidate screening, pipeline management, B-BBEE compliance, and WhatsApp integration. Built for SA recruiters.
```

#### Individuals Page (`/individuals`)
```
Title: Find Jobs in South Africa | AI Career Tools | Sebenza Hub
Description: Search jobs across South Africa with AI-powered matching, career coaching, skill verification, and salary insights. Create your free profile today.
```

#### Pricing Page (`/pricing`)
```
Title: Pricing Plans | Sebenza Hub - From Free to Enterprise
Description: Affordable recruitment software pricing in South African Rand. Free tier available. Individual from R99/mo, Recruiter from R999/mo, Corporate from R1,999/mo.
```

#### Contact Page (`/contact`)
```
Title: Contact Sebenza Hub | Support & Sales
Description: Get in touch with Sebenza Hub. Email, WhatsApp, or phone support available. Based in South Africa, serving recruiters and job seekers nationwide.
```

### 4.3 Heading Structure (H1-H6)

Every public page must have:
- **One H1** — Primary keyword target
- **H2s** — Section headings with secondary keywords
- **H3s** — Subsection detail

**Example — Home Page:**
```
H1: South Africa's AI-Powered Recruitment Platform
  H2: 134+ AI Features for Smarter Hiring
  H2: Built for South African Compliance
    H3: POPIA Data Protection
    H3: B-BBEE Scoring & Tracking
    H3: Employment Equity Reporting
  H2: Trusted by Recruiters & Job Seekers
  H2: Flexible Pricing in South African Rand
  H2: Frequently Asked Questions
```

### 4.4 Image Optimization

- Add descriptive `alt` text to all images
- Use WebP format with PNG/JPG fallbacks
- Implement lazy loading (`loading="lazy"`)
- Compress images (target < 100KB for decorative, < 200KB for content)
- Use responsive `srcset` for different screen sizes
- Name image files descriptively: `ai-recruitment-dashboard.webp` not `screenshot1.png`

### 4.5 Internal Linking

Build a strategic internal linking structure:

```
Home → Recruiters, Individuals, Pricing, Contact
Recruiters → Pricing (Recruiter plans), Features, Contact
Individuals → Pricing (Individual plans), Features, Contact
Blog posts → Related features, Landing pages, Other blog posts
Public profiles → Related job listings (future)
```

- Add contextual links within page content
- Use descriptive anchor text (not "click here")
- Create a footer with links to all major pages
- Add breadcrumbs on deeper pages

---

## 5. Keyword Strategy

### 5.1 Primary Keywords (High Priority)

| Keyword | Monthly Volume (SA) | Difficulty | Target Page |
|---------|-------------------|------------|-------------|
| recruitment software south africa | 500-1K | Medium | /recruiters |
| recruitment agency software | 300-500 | Medium | /recruiters |
| job search south africa | 5K-10K | High | /individuals |
| find jobs south africa | 3K-5K | High | /individuals |
| applicant tracking system south africa | 200-500 | Low | / |
| ATS south africa | 200-500 | Low | / |
| hr software south africa | 1K-2K | Medium | / |
| hiring platform south africa | 200-500 | Low | / |

### 5.2 Secondary Keywords

| Keyword | Target Page/Content |
|---------|-------------------|
| AI recruitment tools | /recruiters, Blog |
| POPIA compliant recruitment | /recruiters, Blog |
| B-BBEE recruitment software | /recruiters, Blog |
| employment equity reporting tool | /recruiters, Blog |
| WhatsApp recruitment | Blog |
| video interview platform south africa | Blog, /recruiters |
| skills assessment software | Blog |
| candidate screening software | /recruiters |
| career coaching south africa | /individuals |
| salary calculator south africa | /individuals, Blog |
| CV builder south africa | /individuals |
| recruitment CRM | /recruiters |
| talent pipeline management | /recruiters |

### 5.3 Long-Tail Keywords

| Keyword | Content Type |
|---------|-------------|
| how to find a job in south africa 2026 | Blog |
| best recruitment software for agencies in south africa | Blog |
| POPIA requirements for recruiters | Blog |
| B-BBEE compliance in recruitment | Blog |
| AI-powered candidate screening south africa | Blog |
| how to write a CV for south african jobs | Blog |
| salary guide south africa 2026 | Blog/Resource |
| SETA learnership programmes 2026 | Blog |
| WhatsApp for recruitment best practices | Blog |
| blind hiring south africa | Blog |
| employment equity plan template | Blog/Resource |
| how to reduce time to hire | Blog |
| recruitment agency fees south africa | Blog |
| remote jobs south africa | Blog |
| graduate programmes south africa 2026 | Blog |
| IT jobs johannesburg | Location page |
| engineering jobs cape town | Location page |
| finance jobs durban | Location page |

### 5.4 Keyword Mapping by User Segment

#### Job Seekers
- Job search, find work, employment, career, CV/resume, salary, skills
- Province-specific: jobs in Gauteng, Western Cape, KwaZulu-Natal
- Industry-specific: IT jobs, engineering jobs, finance jobs, nursing jobs
- Level-specific: graduate jobs, entry-level jobs, senior roles, executive positions

#### Recruiters
- Recruitment software, ATS, CRM, candidate sourcing, screening, pipeline
- Compliance: POPIA, B-BBEE, EE reporting
- Efficiency: AI recruitment, automated screening, bulk hiring
- Revenue: placement tracking, recruitment fees, invoicing

#### Corporates
- HR software, talent management, workforce planning, internal hiring
- Enterprise: SSO, white-label, API integration, HRIS
- Compliance: POPIA, B-BBEE, Employment Equity, Skills Development Levy

---

## 6. Content Strategy

### 6.1 Blog / Content Hub

**Create a blog at `/blog`** — this is the single most impactful content SEO initiative.

#### Content Pillars

**Pillar 1: Recruitment in South Africa**
- State of recruitment in SA (annual report)
- Industry hiring trends by sector
- Provincial job market analysis
- Salary guides by industry/role
- B-BBEE compliance guides
- POPIA recruitment compliance
- Employment Equity reporting guides

**Pillar 2: AI in Hiring**
- How AI is transforming recruitment
- AI-powered candidate screening explained
- Bias-free hiring with AI
- Video interview AI analysis
- AI job description writing
- Predictive hiring analytics

**Pillar 3: Career Development (Job Seekers)**
- CV writing guides for SA jobs
- Interview preparation tips
- Salary negotiation strategies
- Skills development & SETA learnerships
- Career change guides
- Industry-specific career paths

**Pillar 4: Recruiter Best Practices**
- Building a talent pipeline
- WhatsApp recruitment strategies
- Reducing time to hire
- Candidate experience optimization
- Recruitment marketing
- Employer branding

**Pillar 5: HR Compliance & Legal**
- POPIA for HR professionals
- B-BBEE scoring explained
- Employment Equity Act updates
- Basic Conditions of Employment Act
- Labour Relations Act essentials
- Skills Development Act & SDL

#### Content Calendar (First 3 Months)

**Month 1 — Foundation Content:**
1. "The Complete Guide to Recruitment Software in South Africa (2026)"
2. "POPIA Compliance Checklist for Recruiters"
3. "How to Write a CV That Gets Noticed in South Africa"
4. "B-BBEE in Recruitment: What Agencies Need to Know"
5. "South Africa Salary Guide 2026: Complete Industry Breakdown"
6. "5 Ways AI is Changing How South Africans Find Jobs"
7. "WhatsApp for Recruitment: The Complete Guide"
8. "Top SETA Learnership Programmes 2026"

**Month 2 — Depth Content:**
9. "Applicant Tracking Systems Compared: SA Edition"
10. "Employment Equity Reporting: Step-by-Step Guide"
11. "How to Reduce Your Time-to-Hire by 50% with AI"
12. "Career Change Guide: Switching Industries in South Africa"
13. "Video Interviews: Complete Guide for SA Job Seekers"
14. "Recruitment Agency Fees in South Africa: Complete Guide"
15. "Skills Assessment Testing: What Employers Look For"
16. "Remote Work in South Africa: Jobs, Laws & Best Practices"

**Month 3 — Authority Content:**
17. "State of Recruitment in South Africa 2026 [Research Report]"
18. "AI Bias in Hiring: How to Ensure Fair Recruitment"
19. "Building a Talent Pipeline: The Ultimate Guide"
20. "Graduate Employment Guide South Africa 2026"
21. "Salary Negotiation Scripts That Work in SA"
22. "The Future of HR Tech in Africa"
23. "Diversity & Inclusion Hiring Strategies for SA Companies"
24. "Recruitment Marketing: Attracting Top SA Talent"

### 6.2 Resource Pages (Link Magnets)

Create downloadable/interactive resources:

1. **SA Salary Calculator** — Interactive tool, high search volume
2. **CV Templates** — Free downloadable SA-specific CV templates
3. **B-BBEE Scorecard Calculator** — Interactive compliance tool
4. **Interview Question Bank** — Searchable database by role/industry
5. **Employment Equity Reporting Templates** — Free downloads
6. **POPIA Compliance Checklist** — Downloadable PDF
7. **Job Description Templates** — By role/industry
8. **Recruitment Metrics Dashboard** — Benchmark data

### 6.3 Landing Pages by Segment

Create dedicated SEO landing pages:

**By Province:**
- `/jobs/gauteng` — Jobs in Gauteng
- `/jobs/western-cape` — Jobs in Western Cape
- `/jobs/kwazulu-natal` — Jobs in KwaZulu-Natal
- `/jobs/eastern-cape` — Jobs in Eastern Cape
- `/jobs/free-state` — Jobs in Free State
- `/jobs/limpopo` — Jobs in Limpopo
- `/jobs/mpumalanga` — Jobs in Mpumalanga
- `/jobs/north-west` — Jobs in North West
- `/jobs/northern-cape` — Jobs in Northern Cape

**By Major City:**
- `/jobs/johannesburg` — Jobs in Johannesburg
- `/jobs/cape-town` — Jobs in Cape Town
- `/jobs/durban` — Jobs in Durban
- `/jobs/pretoria` — Jobs in Pretoria
- `/jobs/port-elizabeth` — Jobs in Port Elizabeth/Gqeberha

**By Industry:**
- `/jobs/it-technology` — IT & Technology Jobs
- `/jobs/finance-banking` — Finance & Banking Jobs
- `/jobs/engineering` — Engineering Jobs
- `/jobs/healthcare` — Healthcare Jobs
- `/jobs/mining` — Mining Jobs
- `/jobs/retail` — Retail Jobs
- `/jobs/manufacturing` — Manufacturing Jobs

**By Role Level:**
- `/jobs/graduate-programmes` — Graduate Programmes
- `/jobs/internships` — Internships
- `/jobs/entry-level` — Entry Level Jobs
- `/jobs/senior-management` — Senior Management
- `/jobs/executive` — Executive Positions

### 6.4 Glossary / Knowledge Base

Create `/re09-sources/glossary` with SA recruitment terminology:
- ATS, B-BBEE, EE, POPIA, SETA, NQF, SAQA, UIF, SDL, CCMA, LRA, BCEA
- Each term gets its own page for long-tail ranking

---

## 7. Local SEO

### 7.1 Google Business Profile

- Create and verify Google Business Profile for Sebenza Hub
- Category: "Recruitment Agency Software", "Human Resource Consulting"
- Add complete business information (address, phone, hours, website)
- Upload photos of team, office, product screenshots
- Enable messaging and Q&A
- Collect and respond to reviews

### 7.2 Local Citations

Register Sebenza Hub on:
- **SA Business Directories:** Yellow Pages SA, Brabys, Cylex SA
- **Tech Directories:** Capterra, G2, GetApp, Software Advice (with SA focus)
- **HR/Recruitment Directories:** APSO (Association of Personnel Service Organisations), SARA, SABPP
- **General:** LinkedIn Company Page, Facebook Business, Instagram Business

### 7.3 NAP Consistency

Ensure Name, Address, Phone (NAP) is identical across all listings:
```
Sebenza Hub
[Street Address], [City], [Province], [Postal Code]
South Africa
Phone: [+27 XX XXX XXXX]
Email: [support@sebenzahub.co.za]
```

### 7.4 Local Schema Markup

Add `LocalBusiness` schema to contact page and footer:

```json
{
  "@context": "https://schema.org",
  "@type": "SoftwareApplication",
  "name": "Sebenza Hub",
  "applicationCategory": "BusinessApplication",
  "operatingSystem": "Web",
  "offers": {
    "@type": "Offer",
    "price": "0",
    "priceCurrency": "ZAR"
  },
  "aggregateRating": {
    "@type": "AggregateRating",
    "ratingValue": "4.8",
    "ratingCount": "150"
  }
}
```

---

## 8. Link Building Strategy

### 8.1 Digital PR & Outreach

**Target Publications:**
- **SA Tech:** MyBroadband, ITWeb, Ventureburn, Disrupt Africa, TechCentral
- **SA Business:** BusinessTech, Daily Maverick (Business), Biznews, Moneyweb
- **SA HR/Recruitment:** HR Future, HR Pulse, People Magazine, Staffing Industry Analysts
- **International HR Tech:** HR Technologist, SHRM, Recruitment International

**Story Angles:**
- "SA startup uses AI to fight recruitment bias"
- "How AI is bridging SA's skills gap"
- "POPIA compliance: What recruiters need to know in 2026"
- "WhatsApp recruitment: How SA is leading mobile-first hiring"
- SA salary data releases (quarterly reports)
- Research on hiring trends in SA

### 8.2 Partnership Links

- **SETA partnerships:** Link exchanges with sector education bodies
- **University career centers:** Partner with UCT, Wits, Stellenbosch, UP, UKZN
- **Recruitment associations:** APSO, SARA, IPM, SABPP memberships & backlinks
- **HR software integrations:** Cross-linking with HRIS, payroll providers
- **Job boards:** Partner listings on Indeed SA, Careers24, PNet

### 8.3 Content-Driven Link Building

- **Research reports:** Original SA hiring data attracts natural backlinks
- **Infographics:** Visual salary data, hiring trends, B-BBEE guides
- **Tools:** Free tools (salary calculator, B-BBEE calculator) earn links
- **Guest posts:** Contribute expert content to SA business publications
- **Expert quotes:** Offer expert commentary for journalist queries (HARO, SourceBottle)

### 8.4 Community & Social Links

- Answer recruitment questions on Quora, Reddit (r/southafrica, r/recruitment)
- Participate in LinkedIn groups (SA HR, Recruitment SA)
- Sponsor or speak at SA HR/recruitment events
- Create YouTube content (platform tutorials, hiring tips, compliance guides)

---

## 9. Structured Data / Schema Markup

### 9.1 Organization Schema (All Pages)

```json
{
  "@context": "https://schema.org",
  "@type": "Organization",
  "name": "Sebenza Hub",
  "url": "https://sebenzahub.co.za",
  "logo": "https://sebenzahub.co.za/icons/icon-512x512.png",
  "description": "South Africa's AI-powered recruitment platform",
  "address": {
    "@type": "PostalAddress",
    "addressCountry": "ZA"
  },
  "contactPoint": {
    "@type": "ContactPoint",
    "contactType": "customer service",
    "availableLanguage": ["English"]
  },
  "sameAs": [
    "https://linkedin.com/company/sebenzahub",
    "https://twitter.com/sebenzahub",
    "https://facebook.com/sebenzahub"
  ]
}
```

### 9.2 WebSite Schema with SearchAction (Home Page)

```json
{
  "@context": "https://schema.org",
  "@type": "WebSite",
  "name": "Sebenza Hub",
  "url": "https://sebenzahub.co.za",
  "potentialAction": {
    "@type": "SearchAction",
    "target": "https://sebenzahub.co.za/jobs?q={search_term_string}",
    "query-input": "required name=search_term_string"
  }
}
```

### 9.3 SoftwareApplication Schema (Home/Pricing)

```json
{
  "@context": "https://schema.org",
  "@type": "SoftwareApplication",
  "name": "Sebenza Hub",
  "applicationCategory": "BusinessApplication",
  "applicationSubCategory": "Recruitment Software",
  "operatingSystem": "Web Browser",
  "offers": [
    {
      "@type": "Offer",
      "name": "Individual Free",
      "price": "0",
      "priceCurrency": "ZAR"
    },
    {
      "@type": "Offer",
      "name": "Individual Standard",
      "price": "99",
      "priceCurrency": "ZAR",
      "billingIncrement": "P1M"
    },
    {
      "@type": "Offer",
      "name": "Individual Premium",
      "price": "199",
      "priceCurrency": "ZAR",
      "billingIncrement": "P1M"
    },
    {
      "@type": "Offer",
      "name": "Recruiter Standard",
      "price": "999",
      "priceCurrency": "ZAR",
      "billingIncrement": "P1M"
    },
    {
      "@type": "Offer",
      "name": "Recruiter Premium",
      "price": "2499",
      "priceCurrency": "ZAR",
      "billingIncrement": "P1M"
    },
    {
      "@type": "Offer",
      "name": "Corporate Standard",
      "price": "1999",
      "priceCurrency": "ZAR",
      "billingIncrement": "P1M"
    },
    {
      "@type": "Offer",
      "name": "Corporate Premium",
      "price": "4999",
      "priceCurrency": "ZAR",
      "billingIncrement": "P1M"
    }
  ]
}
```

### 9.4 FAQPage Schema (Home, Pricing)

```json
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    {
      "@type": "Question",
      "name": "What is Sebenza Hub?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "Sebenza Hub is South Africa's AI-powered recruitment platform..."
      }
    }
  ]
}
```

### 9.5 JobPosting Schema (Future Job Listings)

```json
{
  "@context": "https://schema.org",
  "@type": "JobPosting",
  "title": "Software Developer",
  "description": "...",
  "datePosted": "2026-03-15",
  "validThrough": "2026-04-15",
  "employmentType": "FULL_TIME",
  "hiringOrganization": {
    "@type": "Organization",
    "name": "Company Name"
  },
  "jobLocation": {
    "@type": "Place",
    "address": {
      "@type": "PostalAddress",
      "addressLocality": "Johannesburg",
      "addressRegion": "Gauteng",
      "addressCountry": "ZA"
    }
  },
  "baseSalary": {
    "@type": "MonetaryAmount",
    "currency": "ZAR",
    "value": {
      "@type": "QuantitativeValue",
      "minValue": 30000,
      "maxValue": 50000,
      "unitText": "MONTH"
    }
  }
}
```

### 9.6 BreadcrumbList Schema

```json
{
  "@context": "https://schema.org",
  "@type": "BreadcrumbList",
  "itemListElement": [
    {
      "@type": "ListItem",
      "position": 1,
      "name": "Home",
      "item": "https://sebenzahub.co.za"
    },
    {
      "@type": "ListItem",
      "position": 2,
      "name": "Jobs",
      "item": "https://sebenzahub.co.za/jobs"
    },
    {
      "@type": "ListItem",
      "position": 3,
      "name": "Gauteng",
      "item": "https://sebenzahub.co.za/jobs/gauteng"
    }
  ]
}
```

### 9.7 Article Schema (Blog Posts)

```json
{
  "@context": "https://schema.org",
  "@type": "Article",
  "headline": "...",
  "author": { "@type": "Organization", "name": "Sebenza Hub" },
  "datePublished": "2026-03-15",
  "dateModified": "2026-03-18",
  "image": "...",
  "publisher": {
    "@type": "Organization",
    "name": "Sebenza Hub",
    "logo": { "@type": "ImageObject", "url": "..." }
  }
}
```

---

## 10. Social Media & Open Graph

### 10.1 Open Graph Tags (All Pages)

```html
<meta property="og:title" content="Sebenza Hub | AI-Powered Recruitment Platform" />
<meta property="og:description" content="Connect with top talent across South Africa..." />
<meta property="og:image" content="https://sebenzahub.co.za/og-image.png" />
<meta property="og:image:width" content="1200" />
<meta property="og:image:height" content="630" />
<meta property="og:url" content="https://sebenzahub.co.za/" />
<meta property="og:type" content="website" />
<meta property="og:site_name" content="Sebenza Hub" />
<meta property="og:locale" content="en_ZA" />
```

### 10.2 Twitter Card Tags

```html
<meta name="twitter:card" content="summary_large_image" />
<meta name="twitter:site" content="@sebenzahub" />
<meta name="twitter:title" content="Sebenza Hub | AI-Powered Recruitment Platform" />
<meta name="twitter:description" content="Connect with top talent across South Africa..." />
<meta name="twitter:image" content="https://sebenzahub.co.za/twitter-card.png" />
```

### 10.3 Social Sharing Images

Create optimized OG images for:
- **Default:** Platform overview (1200x630px)
- **Recruiters:** Recruiter features highlight
- **Individuals:** Job seeker features highlight
- **Pricing:** Plan comparison visual
- **Blog posts:** Dynamic OG image generation with title overlay
- **Job listings:** Job details card
- **Public profiles:** Candidate profile card

### 10.4 Social Media Strategy (SEO-Adjacent)

- Share blog content across LinkedIn, Twitter/X, Facebook
- Create short-form video content for TikTok & Instagram Reels (SA job tips)
- Build LinkedIn thought leadership (AI in recruitment, SA hiring trends)
- Engage in SA recruitment communities online

---

## 11. Performance & Core Web Vitals

### 11.1 Target Metrics

| Metric | Target | Current Status |
|--------|--------|---------------|
| Largest Contentful Paint (LCP) | < 2.5s | Needs measurement |
| First Input Delay (FID) | < 100ms | Needs measurement |
| Cumulative Layout Shift (CLS) | < 0.1 | Needs measurement |
| First Contentful Paint (FCP) | < 1.8s | Needs measurement |
| Time to Interactive (TTI) | < 3.8s | Needs measurement |
| Total Blocking Time (TBT) | < 200ms | Needs measurement |

### 11.2 Optimization Strategies

**Bundle Optimization:**
- Already using Vite code splitting and lazy loading (good)
- Audit bundle size with `vite-bundle-visualizer`
- Tree-shake unused Radix UI components
- Consider dynamic imports for heavy libraries (Recharts, Framer Motion)
- Externalize large dependencies to CDN if possible

**Image Optimization:**
- Convert all images to WebP with fallbacks
- Implement responsive images with `srcset`
- Lazy load below-the-fold images
- Use image CDN (Cloudinary, imgix) for on-the-fly optimization

**Font Optimization:**
- Subset fonts to Latin character set
- Use `font-display: swap` for FOUT prevention
- Preload critical fonts
- Consider system font stack for body text

**Caching:**
- Implement proper Cache-Control headers for static assets
- Use content hashing in filenames (Vite does this)
- Set long cache TTL for static assets (1 year)
- Short cache for HTML documents (no-cache or 1 hour)

**Server Optimization:**
- Enable gzip/Brotli compression (Express compression middleware)
- Implement HTTP/2 push for critical resources
- Use CDN for static assets (Cloudflare, AWS CloudFront)
- Database query optimization for public pages

### 11.3 Monitoring

- Set up Google PageSpeed Insights monitoring
- Track Core Web Vitals in Google Search Console
- Use Lighthouse CI in deployment pipeline
- Monitor real-user metrics with web-vitals library

---

## 12. International & Language SEO

### 12.1 Current Focus: South Africa

**Primary Language:** English (en-ZA)
**Currency:** South African Rand (ZAR)
**Time Zone:** SAST (UTC+2)

```html
<html lang="en-ZA">
<meta name="geo.region" content="ZA" />
<meta name="geo.placename" content="South Africa" />
```

### 12.2 Future Multi-Language Support

The platform already has multi-language infrastructure in the admin panel. Priority languages:

1. **isiZulu** — Most spoken home language in SA
2. **Afrikaans** — Second most spoken language
3. **isiXhosa** — Third most spoken
4. **Setswana** — Fourth most spoken
5. **Sesotho** — Fifth most spoken

**Implementation:**
- Use `hreflang` tags for language variants
- Create URL structure: `/zu/`, `/af/`, `/xh/` prefixes
- Translate key landing pages and blog content
- Don't auto-redirect based on browser language (bad for SEO)

### 12.3 Regional Expansion (Future)

- **Southern Africa:** Botswana, Namibia, Zimbabwe, Mozambique, Zambia
- **East Africa:** Kenya, Tanzania, Uganda
- **West Africa:** Nigeria, Ghana

Use country-code TLDs or subdirectories:
- `sebenzahub.co.za` (South Africa)
- `sebenzahub.co.za/ke/` (Kenya) or `sebenzahub.co.ke`

---

## 13. Mobile SEO & PWA

### 13.1 Mobile-First Optimization

- Ensure all pages are fully responsive (Tailwind CSS handles this)
- Test with Google Mobile-Friendly Test
- Optimize tap targets (minimum 48x48px)
- Avoid intrusive interstitials on mobile
- Ensure text is readable without zooming (16px minimum)

### 13.2 PWA SEO Benefits

Already configured:
- `manifest.json` with app name and icons
- PWA auto-update enabled

Enhance:
- Add `apple-mobile-web-app-capable` meta tag
- Add `apple-mobile-web-app-status-bar-style`
- Ensure offline page has proper meta tags
- Add `maskable` icon for Android
- Consider App Store / Play Store listing (TWA) for additional visibility

### 13.3 AMP (Accelerated Mobile Pages)

**Not recommended** for Sebenza Hub:
- Google has deprioritized AMP
- The SPA architecture doesn't align with AMP
- Focus on Core Web Vitals instead

---

## 14. Analytics & Tracking

### 14.1 Google Search Console

- Verify domain ownership
- Submit sitemap.xml
- Monitor indexing status
- Track search performance (impressions, clicks, CTR, position)
- Monitor Core Web Vitals
- Review and fix crawl errors
- Set up email alerts for critical issues

### 14.2 Google Analytics 4

- Implement GA4 with proper event tracking
- Set up conversion goals:
  - Account registration (by user type)
  - Profile completion
  - First job application
  - First job post
  - Subscription upgrade
  - Contact form submission
- Track user journeys from organic search to conversion
- Set up custom dimensions for user type, plan, province

### 14.3 SEO Monitoring Tools

- **Google Search Console** — Free, essential
- **Bing Webmaster Tools** — Free, for Bing visibility
- **Ahrefs / SEMrush** — Keyword tracking, backlink monitoring, competitor analysis
- **Screaming Frog** — Technical SEO audits (crawl issues, broken links)
- **Google PageSpeed Insights** — Core Web Vitals monitoring

### 14.4 Custom SEO Dashboard

Track weekly/monthly:
- Organic traffic by landing page
- Keyword rankings (top 50 target keywords)
- Organic conversions (sign-ups, by user type)
- Backlink growth
- Indexed pages count
- Core Web Vitals scores
- Click-through rates by page
- Bounce rates for organic traffic

---

## 15. Competitor Analysis

### 15.1 Direct Competitors (SA Recruitment Platforms)

| Competitor | Strengths | Weaknesses | SEO Opportunity |
|-----------|-----------|------------|-----------------|
| **Careers24** | High domain authority, massive job database | Outdated UX, no AI features | Better AI content, modern UX story |
| **PNet** | Large SA job board, employer brand | Limited AI, basic ATS | Full ATS + AI positioning |
| **Indeed SA** | Global brand, huge traffic | Not SA-specific, no compliance tools | SA compliance, POPIA, B-BBEE angle |
| **LinkedIn Jobs** | Professional network, massive reach | Expensive, not SA-optimized | Affordable SA alternative |
| **Sage HR** | Enterprise reputation, payroll integration | Complex, expensive, limited AI | Simpler, AI-first, better pricing |
| **RecruitCRM** | Recruitment CRM focus | Not SA-specific | SA compliance, local expertise |
| **Bullhorn** | Established ATS | Expensive, complex | SA-affordable, modern, AI-powered |

### 15.2 Content Gap Analysis

**Topics competitors cover poorly:**
- AI in SA recruitment (emerging topic)
- POPIA compliance for hiring (complex, underserved)
- B-BBEE recruitment strategy (niche, high value)
- WhatsApp recruitment (SA-unique trend)
- SETA learnership matching (underserved niche)
- Video interview best practices (growing demand)
- Blind hiring implementation (SA diversity focus)

### 15.3 Competitive Advantages to Highlight

1. **134 AI features** — More than any SA competitor
2. **POPIA-first** — Built for SA data protection
3. **B-BBEE & EE** — Native compliance tools
4. **WhatsApp integration** — SA's preferred messaging platform
5. **All-in-one** — ATS + CRM + AI + Compliance + Career tools
6. **Affordable** — From free to R4,999/mo (vs. R10K+ for competitors)
7. **South African built** — Local understanding, local support
8. **300+ assessments** — Comprehensive testing library

---

## 16. Implementation Roadmap

### Phase 1: Foundation (Weeks 1-4) — CRITICAL

| Task | Priority | Effort | Impact |
|------|----------|--------|--------|
| Install `react-helmet-async` | Critical | 2 hours | High |
| Create `<SEOHead>` component | Critical | 4 hours | High |
| Add per-page meta tags to all public pages | Critical | 8 hours | High |
| Create `robots.txt` | Critical | 1 hour | High |
| Create static sitemap.xml | Critical | 2 hours | High |
| Add Open Graph tags to all public pages | Critical | 4 hours | Medium |
| Add Twitter Card tags | High | 2 hours | Medium |
| Set up Google Search Console | Critical | 1 hour | High |
| Set up Google Analytics 4 | Critical | 2 hours | High |
| Add Organization JSON-LD schema | High | 2 hours | Medium |
| Implement prerendering for bots | Critical | 8 hours | Critical |
| Set `lang="en-ZA"` on HTML | High | 15 min | Low |
| Add canonical tags | High | 2 hours | Medium |

**Estimated Effort:** 35 hours
**Expected Impact:** Pages become indexable, proper metadata for search and social

### Phase 2: Content & Structure (Weeks 5-8)

| Task | Priority | Effort | Impact |
|------|----------|--------|--------|
| Build blog infrastructure (`/blog`) | High | 16 hours | High |
| Write first 8 blog posts (Month 1 calendar) | High | 40 hours | High |
| Create dynamic sitemap.xml endpoint | High | 4 hours | Medium |
| Add FAQ schema to home page | Medium | 2 hours | Medium |
| Add SoftwareApplication schema to pricing | Medium | 2 hours | Medium |
| Implement breadcrumb navigation + schema | Medium | 4 hours | Medium |
| Create SA salary guide resource page | High | 16 hours | High |
| Optimize heading structure on all public pages | Medium | 4 hours | Medium |
| Add alt text to all images | Medium | 4 hours | Low |
| Internal linking audit and optimization | Medium | 4 hours | Medium |

**Estimated Effort:** 96 hours
**Expected Impact:** Content starts ranking, rich snippets appear

### Phase 3: Growth & Authority (Weeks 9-16)

| Task | Priority | Effort | Impact |
|------|----------|--------|--------|
| Write Month 2 & 3 blog posts (16 posts) | High | 80 hours | High |
| Create provincial job landing pages | High | 16 hours | High |
| Create industry job landing pages | High | 16 hours | High |
| Public job listings with JobPosting schema | High | 24 hours | Very High |
| Build free SA salary calculator tool | Medium | 20 hours | High |
| Google Business Profile setup | Medium | 2 hours | Medium |
| Submit to SA business directories | Medium | 4 hours | Medium |
| Submit to software review sites (Capterra, G2) | Medium | 4 hours | Medium |
| Digital PR outreach (5 SA publications) | Medium | 16 hours | Medium |
| Performance optimization (Core Web Vitals) | Medium | 16 hours | Medium |
| Set up keyword rank tracking | Medium | 2 hours | Low |

**Estimated Effort:** 200 hours
**Expected Impact:** Organic traffic begins growing, backlinks acquired

### Phase 4: Scale & Optimize (Months 5-12)

| Task | Priority | Effort | Impact |
|------|----------|--------|--------|
| Publish 4 blog posts per month (ongoing) | High | 20h/month | High |
| Build B-BBEE calculator tool | Medium | 20 hours | Medium |
| Create downloadable resources (templates, guides) | Medium | 40 hours | Medium |
| Guest posting program (2 posts/month) | Medium | 8h/month | Medium |
| Video content creation (YouTube) | Low | 16h/month | Medium |
| Multi-language pages (isiZulu, Afrikaans) | Low | 40 hours | Low |
| Advanced schema markup (Review, HowTo) | Low | 8 hours | Low |
| Quarterly SEO audit & optimization | Medium | 8h/quarter | Medium |
| Link building outreach (ongoing) | Medium | 8h/month | High |
| Conversion rate optimization for organic traffic | Medium | Ongoing | High |

**Estimated Effort:** 50-80 hours/month (ongoing)
**Expected Impact:** Sustained traffic growth, topical authority, lead generation

---

## 17. KPIs & Success Metrics

### 17.1 Traffic KPIs

| Metric | 3 Months | 6 Months | 12 Months |
|--------|----------|----------|-----------|
| Organic sessions/month | 1,000 | 5,000 | 10,000+ |
| Organic page views/month | 3,000 | 15,000 | 40,000+ |
| Indexed pages | 50 | 200 | 500+ |
| Organic CTR | 2% | 3% | 4%+ |

### 17.2 Ranking KPIs

| Metric | 3 Months | 6 Months | 12 Months |
|--------|----------|----------|-----------|
| Keywords in top 10 | 10 | 30 | 75+ |
| Keywords in top 50 | 50 | 150 | 300+ |
| Featured snippets | 0 | 3 | 10+ |
| Rich results (schema) | 5 | 15 | 30+ |

### 17.3 Conversion KPIs

| Metric | 3 Months | 6 Months | 12 Months |
|--------|----------|----------|-----------|
| Organic sign-ups/month | 50 | 300 | 1,000+ |
| Organic paid conversions/month | 5 | 30 | 100+ |
| Blog → sign-up rate | 1% | 2% | 3%+ |
| Landing page conversion rate | 3% | 5% | 7%+ |

### 17.4 Authority KPIs

| Metric | 3 Months | 6 Months | 12 Months |
|--------|----------|----------|-----------|
| Domain Rating (Ahrefs) | 10 | 20 | 35+ |
| Referring domains | 20 | 75 | 200+ |
| Total backlinks | 50 | 200 | 500+ |
| Brand search volume | 100 | 500 | 2,000+ |

### 17.5 Technical KPIs

| Metric | Target | Monitoring |
|--------|--------|-----------|
| Pages indexed / Pages submitted | > 90% | Monthly |
| Crawl errors | < 5 | Weekly |
| Core Web Vitals pass rate | > 90% | Monthly |
| Mobile usability issues | 0 | Monthly |
| Average page load time | < 3s | Weekly |
| Sitemap coverage | 100% | Monthly |

---

## Appendix A: SEO Tool Stack

| Tool | Purpose | Cost |
|------|---------|------|
| Google Search Console | Indexing, performance, issues | Free |
| Google Analytics 4 | Traffic, conversions, behavior | Free |
| Bing Webmaster Tools | Bing search performance | Free |
| Ahrefs Lite | Keywords, backlinks, audits | ~$99/mo |
| Screaming Frog | Technical audits | Free (500 URLs) |
| Google PageSpeed Insights | Core Web Vitals | Free |
| Google Keyword Planner | Keyword research | Free (with Google Ads) |
| Schema Markup Validator | Test structured data | Free |
| Meta Tag Inspector (browser ext) | Verify meta tags | Free |

## Appendix B: Quick Wins (Do This Week)

1. Add `robots.txt` to `/client/public/`
2. Install `react-helmet-async`
3. Add unique `<title>` and `<meta description>` to each public page
4. Set `<html lang="en-ZA">`
5. Register Google Search Console
6. Register Google Analytics 4
7. Add basic Open Graph tags to `index.html`
8. Add Organization JSON-LD to `index.html`

## Appendix C: SEO Content Brief Template

For each blog post or landing page:

```
Title: [Primary keyword + modifier] (< 60 characters)
Meta Description: [Compelling summary with keyword] (< 155 characters)
Target Keyword: [Primary keyword]
Secondary Keywords: [3-5 related terms]
Search Intent: [Informational / Commercial / Navigational / Transactional]
Word Count Target: [1,500 - 3,000 words]
Heading Structure:
  H1: [Primary keyword variation]
  H2: [Subtopic 1]
  H2: [Subtopic 2]
  H2: [Subtopic 3]
Internal Links: [3-5 target pages]
External Links: [2-3 authoritative sources]
CTA: [Desired action]
Schema Type: [Article / FAQPage / HowTo]
OG Image: [Description of social sharing image]
```

---

*This SEO plan is a living document. Review and update quarterly based on performance data, algorithm changes, and business priorities.*
