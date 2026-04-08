---
title: "Individual (Job Seeker)"
type: entity
created: 2026-04-07
updated: 2026-04-08
tags: [user-type, individual, job-seeker, career]
sources: [repo-audit-2026-04-07, features-inventory-2026-04-07]
status: active
confidence: high
dashboard-path: /dashboard/individual/*
endpoint-count: 85
---

# Individual (Job Seeker)

The **Individual** is a job seeker on Sebenza Hub. They search for jobs, build their career profile, apply to positions, develop skills, and manage their professional growth. This is the largest user segment and the demand side of the marketplace.

**Role value in database:** `"individual"` (default role for new users)

## Dashboard Routes

All Individual features live under `/dashboard/individual/*`. **Total pages: 85.**

## Features by Category

### Dashboard & Portal

| Feature | Route | Description |
|---------|-------|-------------|
| Dashboard | `/dashboard` | Main Individual dashboard overview |
| Portal | `/portal` | Unified candidate portal |
| Candidate Portal Enhanced | `/candidate-portal-enhanced` | Enhanced candidate experience portal |

### Profile & Identity

| Feature | Route | Description |
|---------|-------|-------------|
| Profile Management | `/profile` | Personal info, avatar, LinkedIn connection |
| CV Management | `/cvs` | Create multiple CVs, version history, style presets |
| Resume Upload | `/resume-upload` | Upload existing resumes for AI parsing |
| CV Review | `/cv-review` | AI-powered CV analysis and improvement suggestions |
| CV Templates | `/cv-templates` | Professional, modern, creative, minimalist, executive styles |
| Cover Letter | `/cover-letter` | AI-generated cover letters |
| Video Profile | `/video-profile` | Upload video introduction for recruiters |
| Portfolio Builder | `/portfolio-builder` | Create project portfolios to showcase work |

### Credentials & Verification

| Feature | Route | Description |
|---------|-------|-------------|
| Credentials | `/credentials` | Track certifications, education, qualifications |
| Certifications | `/certifications` | Manage certifications |
| Certifications Tab | `/certifications-tab` | Certifications tab view |
| Certification Card | `/certification-card` | Individual certification display card |
| Certification Form | `/certification-form` | Add/edit certification form |
| Skill Verifications | `/skill-verifications` | Get skills verified with blockchain-style verification |
| Skill Verifications Tab | `/skill-verifications-tab` | Skill verifications tab view |
| Credential Auto Import | `/credential-auto-import` | Automatically import credentials from external sources |
| Credential Gap Analysis | `/credential-gap-analysis` | Identify missing credentials for target roles |
| Credential Match Panel | `/credential-match-panel` | Match credentials against job requirements |
| Credential Passport | `/credential-passport` | Portable credential passport for sharing |
| Credential Privacy Toggle | `/credential-privacy-toggle` | Control credential visibility |
| Credential Score Ring | `/credential-score-ring` | Visual credential completeness score |
| Credential Share Dialog | `/credential-share-dialog` | Share credentials with employers |
| Credential Timeline | `/credential-timeline` | Chronological credential history |
| Credential Wallet Stats | `/credential-wallet-stats` | Credential wallet statistics |
| Credential Wallet Tab | `/credential-wallet-tab` | Credential wallet tab view |
| Verify Credential Dialog | `/verify-credential-dialog` | Request credential verification |
| Verification Proof Card | `/verification-proof-card` | Display verified proof |
| Trust Score Breakdown | `/trust-score-breakdown` | Detailed trust score components |
| Peer Attestation Request | `/peer-attestation-request` | Request peer attestations for skills |
| NQF Level Selector | `/nqf-level-selector` | Select NQF (National Qualifications Framework) level |

### Education & Experience

| Feature | Route | Description |
|---------|-------|-------------|
| Education Tab | `/education-tab` | Education history tab |
| Education Card | `/education-card` | Individual education entry display |
| Education Form | `/education-form` | Add/edit education entries |
| Assessments Tab | `/assessments-tab` | Assessment results tab |
| Experience Surveys | `/experience-surveys` | Candidate experience feedback surveys |

### Document Management

| Feature | Route | Description |
|---------|-------|-------------|
| Smart Document Upload | `/smart-document-upload` | AI-powered document upload and parsing |
| Document Segment Review | `/document-segment-review` | Review parsed document segments |
| Import Review List | `/import-review-list` | Review imported document data |
| Profile Documents List | `/profile-documents-list` | View all profile documents |
| Category Breakdown Cards | `/category-breakdown-cards` | Document categorization overview |
| Expiry Alerts | `/expiry-alerts` | Alerts for expiring documents/credentials |

### Job Search & Applications

| Feature | Route | Description |
|---------|-------|-------------|
| All Jobs | `/all-jobs` | Browse complete job listings (posted + [[01-entities/job-aggregation|aggregated]]) |
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

### Interviews

| Feature | Route | Description |
|---------|-------|-------------|
| Interview Simulator | `/interview-simulator` | Practice interviews with AI feedback |
| Interview Scheduling | `/interview-scheduling` | Manage interview schedules |

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

### Career Development

| Feature | Route | Description |
|---------|-------|-------------|
| Career Path | `/career-path` | Visualize career progression options |
| Career Pulse | `/career-pulse` | Real-time career health monitoring |
| Salary Insights | `/salary-insights` | Market salary data and trends |
| Salary Negotiator | `/salary-negotiator` | AI guidance on salary negotiation |
| Coaching | `/coaching` | AI career coaching and guidance |
| Mentorship | `/mentorship` | Connect with experienced professionals |
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

## Open Questions

- How does the auto-apply (Autopilot) feature work in practice? What safeguards exist?
- What's the conversion rate from Individual signup to first application?
- How are learning paths curated and updated?

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
- Source: [[09-sources/features-inventory-2026-04-07]]
