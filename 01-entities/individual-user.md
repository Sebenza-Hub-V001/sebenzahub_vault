---
title: "Individual (Job Seeker)"
type: entity
created: 2026-04-07
updated: 2026-05-06
tags: [user-type, individual, job-seeker, career]
sources: [repo-audit-2026-04-07, repo-sync-2026-04-20, repo-sync-2026-05-06]
status: active
confidence: high
---

# Individual (Job Seeker)

The **Individual** is a job seeker on Sebenza Hub. They search for jobs, build their career profile, apply to positions, develop skills, and manage their professional growth. This is the largest user segment and the demand side of the marketplace.

**Role value in database:** `"individual"` (default role for new users)

## Dashboard Routes

All Individual features live under `/dashboard/individual/*`.

## Features by Category

### Profile & Identity

| Feature | Route | Description |
|---------|-------|-------------|
| Profile Management | `/profile` | Personal info, avatar, LinkedIn connection |
| CV Management | `/cvs` | Multi-CV hub with stats (Total / Default / Avg Completeness / Last Updated). Toolbar: Upload Resume, Build CV (in-page wizard), Insights (analytics dialog), Batch Tailor (multi-job tailoring), Job Radar (CV→jobs match). Per-CV menu: Interview Prep, SA Readiness, Version History, Job Radar, Duplicate |
| Resume Upload | `/resume-upload` | Upload existing resumes for AI parsing |
| CV Review | `/cv-review` | AI-powered CV analysis with **multi-tab dashboard (14 distinct analyses)**, **saved snapshots** (save/load/rename/delete), auto-save, before/after transformation with retry, prominent status banner. Backed by `cv_reviews` table (added 2026-05-06) |
| CV Templates | `/cv-templates` | Professional, modern, creative, minimalist, executive styles. **Modern CV template added 2026-05-06** |
| Video Profile | `/video-profile` | Upload video introduction for recruiters |
| Portfolio Builder | `/portfolio-builder` | Create project portfolios to showcase work |
| Credentials | `/credentials` | Track certifications, education, qualifications |
| Skill Verifications | `/skill-verifications` | Get skills verified with blockchain-style verification |

### Job Search & Applications

| Feature | Route | Description |
|---------|-------|-------------|
| All Jobs | `/all-jobs` | Browse complete job listings (posted + [[01-entities/job-aggregation\|aggregated]]) |
| Auto Match | `/auto-match` | AI-powered automatic job matching based on profile |
| Manual Search | `/manual-search` | Advanced search with filters (salary, location, industry) |
| Saved Searches | `/saved-searches` | Save search criteria for quick access |
| Favourites | `/favourites` | Bookmark interesting jobs |
| Applications | `/applications` | Track all submitted applications |
| Application Tracker | `/application-tracker` | Visual pipeline view of application status |
| Application Analytics | `/application-analytics` | Stats on where you apply, success rates |
| Application Notes | `/application-notes` | Personal notes per application |
| Follow-up Reminders | `/follow-up-reminders` | Auto-reminders to follow up |
| Company Research | `/company-research` | Deep research on companies with intel tools |

### Learning & Development

| Feature | Route | Description |
|---------|-------|-------------|
| Learning Dashboard | `/learning` | Centralized learning management |
| Learning Hub | `/learning-hub` | Browse all learning content |
| Learning Paths | `/learning-paths` | Structured journeys aligned to career goals |
| Skill Tree | `/skill-tree` | Visualize skill progression and dependencies |
| Skill Gap Analysis | `/skill-gap` | Identify skills needed for target roles |
| Micro Learning | `/micro-learning` | Bite-sized learning modules |
| Job-Linked Learning | `/job-linked-learning` | Courses linked to specific job requirements |
| Learning Challenges | `/learning-challenges` | Compete and earn badges |
| Peer Teaching | `/peer-teaching` | Learn from and teach other users |
| Study Planner | `/study-planner` | Schedule learning sessions |
| Learning Analytics | `/learning-analytics` | Track progress and metrics |
| Certifications | `/certifications` | Manage certifications |

### Career Development

| Feature | Route | Description |
|---------|-------|-------------|
| Career Path | `/career-path` | Visualize career progression options |
| Career Pulse | `/career-pulse` | Real-time career health monitoring |
| Salary Insights | `/salary-insights` | Market salary data and trends |
| Salary Calculator | `/salary-calculator` | **Tax year 2026** + historical calculation support (added 2026-05-06) |
| Salary Negotiator | `/salary-negotiator` | AI guidance on salary negotiation |
| Coaching | `/coaching` | AI career coaching and guidance |
| Mentorship | `/mentorship` | Connect with experienced professionals |
| Interview Simulator | `/interview-simulator` | Practice interviews with AI feedback |
| Interview Studio | `/interview-studio` | **Mock Interview, STAR Builder, Rehearsal Review tabs** (added 2026-04-29) |
| Tests | `/tests` | Take skill assessments |

### Community & Engagement

| Feature | Route | Description |
|---------|-------|-------------|
| Community Hub | `/community` | Discussion forum with other job seekers |
| Trending | `/community-trending` | Popular topics and discussions |
| Leaderboard | `/community-leaderboard` | Compete with other users |
| Interview Vault | `/community-interviews` | Shared interview experiences |
| Mentor Connect | `/community-mentors` | Find and connect with mentors |
| Badges | `/community-badges` | Achievement badges and recognition |

### Account & Admin

| Feature | Route | Description |
|---------|-------|-------------|
| Inbox | `/inbox` | Messages from recruiters/businesses |
| Billing | `/billing` | Credits, subscription, premium features |
| Settings | `/settings` | Preferences, privacy, notifications |
| Analytics | `/analytics` | Personal career analytics |
| Wiki | `/wiki` | Personal knowledge base |

## Data Model

The Individual's profile is stored across several tables:

- **`users`** — Base account (email, role, name)
- **`candidateProfiles`** — Core profile (headline, summary, location, skills, demographics)
- **`individualPreferences`** — Job preferences (industries, salary range, remote preference, employment types)
- **`individualNotificationSettings`** — Alert preferences (email, WhatsApp, SMS)
- **`individualSettings`** — Comprehensive settings including:
  - Theme, language, accessibility
  - **Career DNA** — Work values, communication style, risk tolerance, etc.
  - **Opportunity Weights** — How to weight salary vs culture vs growth in AI matching
  - **Autopilot Config** — Auto-apply, auto-cover-letter, auto-follow-up
  - **Market Radar** — Watch companies, roles, industries for alerts
  - **Interview AI Config** — Auto-research, prep questions, thank-you notes

## Onboarding Flow

1. Enter email → receive magic link
2. Click link → verify token → create session
3. Select "Individual" role on `/onboarding`
4. Fill onboarding form:
   - Name, location (province + city required)
   - Phone, email
   - Job title (from 300+ titles or custom), experience level
   - Skills (1–10, with proficiency levels)
   - Profile visibility toggle
   - **POPIA consent** (required)
5. `PUT /api/me/profile` → redirect to `/dashboard/individual/profile`

**Role is locked after onboarding** — cannot be changed by the user afterward.

## Key Interactions

- **With Jobs** — Search, save, apply, track applications
- **With Recruiters** — Receive messages, get sourced, attend interviews
- **With Businesses** — Apply directly, attend interviews, receive offers
- **With AI** — CV review, job matching, interview prep, career coaching, salary negotiation

## Application Journey

See [[02-concepts/application-lifecycle]] for the full flow:

```
Browse Jobs → Apply → Screening → Interview → Offer → Hired
                        ↘ Rejected / Withdrawn ↙
```

Individuals can track each application's status, set follow-up reminders, add personal notes, and view AI-generated match scores.

## 2026-04-18 De-Hardcode Pass

Between April 18–19, **nine previously demo-only areas** were rewritten against real server-driven endpoints (21 new database tables — all covered by a verify migration script):

| Area | Commit | What's real now |
|------|--------|-----------------|
| Mentorship | `e3113f0` | Real mentorship engagements backed by DB |
| Interview practice | `4589480` | Self-practice sessions persisted |
| Learning analytics | `09952db` | Activity + completion analytics from real events |
| Portfolio | `deec1f8` | Real project CRUD + derived impact heatmaps |
| Skill tree | `901096c` | Server-driven node progress, quests, XP |
| Study planner | `2b3705b` | Real blocks, goals, logs, resources |
| Job-linked learning | `769f7ff` | Real saved-jobs + learning junction |
| Peer teaching | `7d53a6f` | Real offerings, lessons, study groups |
| Micro-learning | `8821d47` | Greenfield lessons, SRS flashcards, SM-2 server-side |

Five sections previously dropped during refactor were also re-added across 3 pages (`11e6c39`). Individual dashboard is now effectively free of demo/placeholder data for these categories.

## 2026-05-06 Additions

A heavy build-out across the Individual surface during the 2026-04-21 → 2026-05-06 window. See [[09-sources/repo-sync-2026-05-06]] for full commit-level detail.

| Area | What's new |
|------|------------|
| **CV Reviews — saved snapshots** | Multi-tab dashboard (14 distinct analyses), save/load/rename/delete reports, auto-save, prominent status banner, before/after transformation with feedback + retry, sub-tools added. Backed by `cv_reviews` table (migrations `0072`/`0073`). |
| **Interview Studio** | New tab with Mock Interview, STAR Builder, Rehearsal Review (commit `18f37ab3`). |
| **Salary Calculator** | New page with tax year 2026 + historical calculation support. Endpoints + core logic at `802786e3`. |
| **AI match score teaser + unlock** | Paywall pattern for non-premium users on job listings (`821c7c69`). |
| **`ApplyStepperMode`** | Guided multi-step apply flow component (`ded4f1f0`). |
| **External job applications** | External-source handling with redirection + retrieval; native vs. external distinction clarified in apply UX (`b0da16f3`, `acb422c5`). |
| **Modern CV template** | Added to CV Builder (`6d03516f`); PDF text extraction + re-parsing improved (`76a06e72`). |
| **CV deletion auditing** | Every CV deletion is audit-logged; bulk delete now confirms (`66324c5b`). |
| **Mobile Individual portal** | Wired to live auth, live endpoints, real Home/Jobs/Features data. Cold-launch splash + Universal Links + Profile API mapping. Camera/Push SPM deps. Project version 2 with camera/photo permissions. |
| **My CVs hub features** | Insights / Batch Tailor / Job Radar already documented from prior session — see CV Management row above. |

## Open Questions

- How does the auto-apply (Autopilot) feature work in practice? What safeguards exist?
- What's the conversion rate from Individual signup to first application?
- How are learning paths curated and updated?
- Is the iOS / Android Individual app in App Store / Play Store production, or internal track only? (raised 2026-05-06)

## References

- [[03-workflows/individual-journey]] — Complete journey covering all 57 features
- [[02-concepts/application-lifecycle]] — Full application flow
- [[02-concepts/authentication]] — Magic link login
- [[02-concepts/ai-features]] — AI tools available to Individuals
- [[02-concepts/billing-system]] — Billing and subscription management
- [[06-comparisons/user-type-comparison]] — How Individuals compare to other user types
- [[01-entities/recruiter-user]] — Recruiters who source Individuals
- [[01-entities/business-user]] — Businesses who hire Individuals
- [[01-entities/community-learning-hub]] — Learning Hub and community features
- [[01-entities/job-aggregation]] — External job sources (Adzuna, CareerJet)
- [[01-entities/offer-system]] — Offer lifecycle
- Source: [[09-sources/repo-audit-2026-04-07]]
- Source: [[09-sources/individual-features-2026-04-07]]
- Source: [[09-sources/individual-journey-gap-analysis-2026-04-07]]
- Source: [[09-sources/repo-sync-2026-04-20]] — 9-area de-hardcode pass, 21 new tables, real data throughout Individual dashboard
- Source: [[09-sources/repo-sync-2026-05-06]] — CV Reviews saved snapshots, Interview Studio, Salary Calculator (tax 2026), ApplyStepperMode, mobile portal live data
