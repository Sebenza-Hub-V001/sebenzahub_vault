---
title: "Chapter 29 — Career Site, Brand Page, and Job Boards"
type: concept
created: 2026-04-09
updated: 2026-04-09
tags: [manual, recruiter, career-site, brand, job-boards]
status: draft
user-types: [recruiter]
---

# Chapter 29 — Career Site, Brand Page, and Job Board Integrations

Up to this point the manual has been about *running* recruitment work. This chapter is about *attracting* it. The Brand and Growth tools turn your agency from a thing that goes out hunting to a thing that candidates and clients find on their own. Inbound candidates are cheaper and warmer than outbound. Inbound clients are the difference between an agency that grows and one that plateaus.

## Where it lives

| Page | Purpose |
|---|---|
| `/dashboard/recruiter/brand` | Public agency brand page |
| `/dashboard/recruiter/career-site` | Custom careers page with your jobs |
| `/dashboard/recruiter/job-board-integrations` | Pnet, CareerJunction, Adzuna, etc. |
| `/dashboard/recruiter/location-intel` | Geographic talent intelligence |

## 1. Brand Page — `/dashboard/recruiter/brand`

Your Brand Page is the public-facing identity of your agency on Sebenza Hub. It's the URL you put in your email signature, on your business cards, and at the bottom of every job listing. It's also what shows up when a corporate client searches the agency directory.

### What's on it

- **Logo, cover, and agency name** — pulled from your profile (Chapter 5)
- **Description** — your positioning statement
- **Trust Tier badge and Reputation Score** (Chapter 6)
- **Capacity Signal** per sector (Chapter 6)
- **DNA Card** (Chapter 6)
- **Industries served**
- **Case studies** — challenge / approach / result format
- **Client testimonials** — pulled from your collected testimonials
- **Video introduction** (Chapter 5)
- **Team members** — public bios of your team (optional, controlled by visibility settings)
- **Active jobs** — featured listings of your current open roles
- **Contact CTA** — "Get in touch with us"

### Configuring it

The Brand Page assembles itself from your profile data — you don't separately edit it. To improve your Brand Page, improve your underlying profile (Chapter 5) and your trust badges (Chapter 6).

You **can** control:

- **Visibility** — public, link-only, or private
- **What sections appear** — toggle case studies, testimonials, team, jobs on or off
- **Custom URL slug** — your-agency-name in the URL instead of a UUID
- **SEO metadata** — title, description, social preview image

### What it's for

The Brand Page is a sales tool for **clients**. When you're pitching a new corporate client and they ask "tell me about your agency", you send them the Brand Page link. Everything they need to evaluate you is on one URL. Your Trust Tier signals credibility, your case studies signal capability, your testimonials signal trust, your DNA Card shows your strengths.

A polished Brand Page closes deals. A blank or half-finished one loses them.

## 2. Career Site — `/dashboard/recruiter/career-site`

The Career Site is your branded jobs page — where candidates land to browse your current roles. It's distinct from your Brand Page (which is for clients) — it's optimised for candidates, with job listings front and centre and a candidate-friendly application flow.

### What's on it

- Your branding (logo, colours, banner)
- A list of all your active jobs (with filters)
- Detail pages per job
- An application flow (with optional WhatsApp Apply — Chapter 24)
- A chatbot widget (Chapter 23) for FAQs and routing
- Optional: team stories, culture content, employer brand assets
- A "join our talent network" form (for candidates not interested in current roles but who want to be on your radar)

### Configuring it

1. Open `/dashboard/recruiter/career-site`.
2. **Branding** — upload your logo, set primary colours, choose a layout template
3. **Domain** — use the platform's default URL or connect a custom subdomain (`careers.youragency.co.za`)
4. **Jobs** — pick which jobs appear (default: all active jobs)
5. **Content blocks** — add team bios, culture stories, day-in-the-life articles
6. **Chatbot** — enable and configure the chatbot for the site
7. **Analytics** — track visits, conversions, and which jobs get the most interest
8. **Publish**

### Why a custom Career Site beats just using the Sebenza Hub job board

- **Brand control** — candidates land on *your* page, not a generic platform listing
- **SEO** — your career site shows up in Google searches for your agency name
- **Conversion** — single-click application, no platform signup friction
- **Talent network** — captures candidates who aren't ready to apply now but want to hear from you later

### Career Site as a top-of-funnel feeder

Track conversion: visits → applications → screened → placed. The Career Site analytics tells you:

- Which traffic sources bring the best applicants (organic search, LinkedIn, paid ads)
- Which jobs get the most applications (and which get ignored)
- Where candidates drop off in the application flow

Use it to refine. If 200 people view a senior dev role and only 3 apply, the listing or the apply flow has friction. If 50 view it and 30 apply, you have a high-conversion job worth promoting more.

## 3. Job Board Integrations — `/dashboard/recruiter/job-board-integrations`

Job Boards are still where many South African candidates start. Integrating with the major SA job boards means your jobs reach those candidates without you copy-pasting listings everywhere.

### Supported boards

- **Pnet** — the dominant SA job board
- **CareerJunction** — historically strong in mid-level professional roles
- **Adzuna** — aggregator with strong SEO
- **LinkedIn** — for international and senior roles (separate integration; some plans)
- Other regional and niche boards as the platform expands

### How it works

1. Connect each job board (one-time setup with your account credentials).
2. When you create a job (Chapter 11), pick which boards to publish to.
3. The platform syndicates the listing automatically.
4. Applications from any board flow back into your unified Pipeline.
5. Analytics show cost-per-application by board so you can compare ROI.

### What it costs

Some boards charge per posting, some charge per application, some include the listing in a subscription. Costs vary widely:

- Pnet — typically R500–R2,000 per listing depending on duration and visibility
- CareerJunction — similar range
- Adzuna — variable, often pay-per-click

These costs are passed through to you and visible per posting. Sebenza Hub doesn't add a margin; you pay the board what the board charges. Track cost-per-application in the analytics view to identify which boards earn their money.

### Strategy for board distribution

Don't post every role to every board. Use this rule:

| Role type | Best boards |
|---|---|
| **High-volume entry/mid** | Pnet, CareerJunction (high traffic, broad reach) |
| **Specialist tech** | LinkedIn, niche tech boards, your own Career Site |
| **Senior/executive** | LinkedIn, executive search networks, *not* mass boards |
| **Geographic-specific** | Local board(s) for that region, plus Pnet |
| **Confidential / blind** | Your Career Site only, plus targeted outreach |

Posting an executive role to Pnet is a waste of money — that's not where execs are looking. Posting an entry-level role to LinkedIn alone misses 90% of the candidate pool — they're on Pnet.

## 4. Location Intel — `/dashboard/recruiter/location-intel`

Location Intel is geographic talent intelligence. It tells you, for any role and any location:

- **Talent density** — how many candidates with the required skills are in that area
- **Competing employers** — who else is hiring for similar roles
- **Salary benchmarks** — local pay ranges for the role
- **Cost of living** — comparison across SA cities
- **Talent migration** — net inflow or outflow of relevant talent to the area
- **Remote eligibility** — how viable hybrid or remote is for this role in this location

### When to use it

- **A client asks "can you recruit for us in Durban?"** — Location Intel tells you whether the talent pool exists, what the salary expectations look like, and whether the role is competitive against local employers.
- **You're considering geographic expansion** — should your agency open in Cape Town, expand into Pretoria, or stay in Joburg?
- **A role is stuck** — the requirement check (Chapter 25) showed scarce talent locally; Location Intel suggests where to expand the search.
- **Salary negotiations** — you can show the client local market data to justify a higher salary band.

## How Brand and Growth tie together

The four tools work as a funnel:

```
Job Boards (cast wide net)
       ↓
Career Site (capture and convert applicants)
       ↓
Brand Page (convince clients to engage)
       ↓
Location Intel (advise clients on what's possible)
```

A candidate finds your Pnet listing → clicks through to your Career Site → applies → sees your branded experience → if they don't apply now, joins your Talent Network → gets nurtured through sequences (Chapter 23) → eventually places.

A client searches the agency directory → finds your Brand Page → reads your case studies and testimonials → contacts you → you advise them with Location Intel data → they sign an engagement.

These aren't separate features. They're one system for inbound growth.

## Pro tips

- **Polish the Brand Page before pitching new clients.** A 30-minute polish on case studies and testimonials shifts the win rate on new pitches noticeably.
- **Custom domain on the Career Site is worth the setup time.** "careers.youragency.co.za" beats "sebenzahub.com/careers/your-agency-uuid" for trust and SEO.
- **Track cost-per-application by board.** The cheapest board isn't always the best. ROI matters more than raw cost.
- **Update job listings monthly.** Jobs older than 30 days sink in board search rankings. Refresh the description and re-post if the role is still open.
- **Use Location Intel before making promises.** Don't commit to filling a role in a city you haven't checked talent density for. The 5-minute check saves you from a 6-month embarrassment.
- **Your team bios on the Brand Page are sales assets.** Write them like a sales page, not like a CV. Specialisations, sectors, recent wins.

## Checklist

- [ ] You've reviewed your Brand Page and confirmed it represents your agency well
- [ ] Your Career Site is published (or you've decided not to and rely on the platform's job board)
- [ ] You've connected at least one external job board
- [ ] You know cost-per-application by board for your top sectors
- [ ] You've used Location Intel at least once for a real client conversation
- [ ] You have custom URL / branding on your Career Site if your plan supports it

## Next chapter

[[16-manuals/recruiter/30-marketing-referrals-nps|Chapter 30 — Recruitment Marketing, Referrals, and Candidate NPS]]

## References

- [[16-manuals/recruiter/05-agency-profile|Chapter 5 — Your agency profile (feeds Brand Page)]]
- [[16-manuals/recruiter/06-ai-profile-assets|Chapter 6 — AI profile assets]]
- [[16-manuals/recruiter/11-posting-a-job|Chapter 11 — Posting a job (publishes to boards)]]
- [[16-manuals/recruiter/30-marketing-referrals-nps|Chapter 30 — Marketing, Referrals, and NPS]]
