---
title: "Individual Journey: The Complete Platform Experience"
type: concept
created: 2026-04-07
updated: 2026-04-07
tags: [workflow, individual, journey, hiring, learning, career, community]
sources: [repo-audit-2026-04-07, individual-features-2026-04-07, individual-journey-gap-analysis]
status: active
confidence: high
user-types: [individual]
dashboard-path: /dashboard/individual/*
---

# Individual Journey: The Complete Platform Experience

The complete experience of a job seeker on Sebenza Hub — from first visit through job search, hiring, career development, learning, and community engagement. This journey covers all **57 features** available to Individuals.

> **Note:** The hiring path (Steps 1–7) is the primary journey, but Sebenza Hub is more than a job board. Steps 8–13 cover the full breadth of the platform: AI tools, learning, career development, community, knowledge management, and account management. These features are available from day one — not just "after getting hired."

---

## Step 1: Signup

```
Visit sebenzahub.co.za
    ↓
Enter email at /get-started or /login
    ↓
POST /api/auth/magic-link → email sent via Resend
    ↓
Click magic link (15-min expiry)
    ↓
GET /auth/verify?token={token} → session created
    ↓
Redirect to /onboarding (onboardingComplete = false)
```

See [[concepts/authentication]] for technical details.

## Step 2: Onboarding

```
/onboarding → Select "Individual" role
    ↓
OnboardingIndividual form:
  ├─ Name (first, last)
  ├─ Location (province + city — required)
  ├─ Phone number
  ├─ Job title (from 300+ options or custom)
  ├─ Experience level (entry/intermediate/senior/executive)
  ├─ Skills (1–10, with proficiency levels)
  ├─ Profile visibility (public/private)
  └─ POPIA consent (required ✓)
    ↓
PUT /api/me/profile
    ↓
Redirect to /dashboard/individual/profile
```

**Role is now locked** — cannot be changed after onboarding.

## Step 3: Build Profile

Your profile is your first impression. Build it comprehensively before applying.

### Core Profile

```
/dashboard/individual/profile
    ↓
Complete profile tabs:
  ├─ Personal info, avatar, headline, summary
  ├─ Work History — employment timeline
  ├─ Education — degrees, qualifications
  ├─ Documents — supporting files
  ├─ Endorsements — peer endorsements
  ├─ Integrations — connect LinkedIn, GitHub
  ├─ Conversations — message history
  └─ Public Profile — how recruiters see you
```

### CVs & Documents

```
CV Management → /cvs
  ├─ Create multiple CV versions (tailored per industry/role)
  ├─ Upload existing CVs → /resume-upload (AI parsing)
  └─ Version history and style presets
    ↓
CV Templates → /cv-templates
  ├─ Professional, Modern, Creative, Minimalist, Executive styles
  └─ Browse by industry, favourite templates
    ↓
CV Review → /cv-review
  ├─ AI analyses clarity, keywords, achievement quantification
  ├─ ATS compatibility check
  └─ Actionable improvement suggestions
```

### Credentials & Verification

```
Credentials → /credentials
  ├─ Upload certifications, education, licences
  ├─ Link to verification sources
  ├─ Set expiry reminders
  └─ Verified credentials display trust badges
    ↓
Skill Verifications → /skill-verifications
  ├─ Take standardised skill tests
  ├─ Passing = verified badge on profile (visible to recruiters)
  └─ Blockchain-style verification
    ↓
Video Profile → /video-profile
  ├─ Record 60–90 second introduction
  └─ Visible to recruiters — showcases communication & personality
    ↓
Portfolio Builder → /portfolio-builder
  ├─ Add projects, code samples, designs, case studies
  ├─ Organise by skill or industry
  └─ Shareable portfolio link
```

### Preferences & Career DNA

```
Settings → /settings
  ├─ Job Preferences:
  │   ├─ Preferred industries, sub-industries
  │   ├─ Desired salary range
  │   ├─ Remote preference (full remote / hybrid / on-site)
  │   ├─ Employment types (permanent / contract / temporary)
  │   ├─ Preferred locations
  │   └─ Notice period
  │
  └─ Career DNA:
      ├─ Work values (impact, compensation, growth, stability...)
      ├─ Communication style, work pace
      ├─ Team preference, leadership style
      ├─ Risk tolerance
      └─ These feed into AI job matching + Opportunity Weights
```

## Step 4: Search & Apply

```
Browse jobs:
  ├─ /all-jobs — Full job listings (posted + aggregated via Adzuna/CareerJet)
  ├─ /auto-match — AI recommends jobs based on profile + Career DNA
  ├─ /manual-search — Advanced filters (salary, location, industry, remote, etc.)
  └─ /saved-searches — Save criteria, get alerts on new matches
    ↓
Research companies → /company-research
  ├─ Company profiles: culture, size, growth, reviews
  └─ Deep intel for interview prep
    ↓
Save interesting jobs → /favourites
    ↓
Apply to job:
  POST /api/jobs/{jobId}/apply
  ├─ Attach CV (select from uploaded CVs)
  ├─ Optional: cover letter (AI-generated via /cover-letter)
  ├─ Optional: answer screening questions
  └─ Optional: video introduction
    ↓
Application created:
  ├─ status = "Applied"
  ├─ pipelineStage = "new"
  ├─ aiMatchScore calculated automatically (0–100)
  ├─ aiMatchedSkills / aiMissingSkills populated
  └─ ghostRiskScore calculated (is this a real job?)
```

See [[entities/job-aggregation]] for external job sources.

## Step 5: Track Applications

```
/dashboard/individual/applications
    ↓
Monitor status changes:
  Applied → Screening → Interview → Offer → Hired
  (or Rejected / Withdrawn at any stage)
    ↓
Application tools:
  ├─ /application-tracker — Visual pipeline view of all applications
  ├─ /application-analytics — Success rates, response times, trends
  ├─ /application-notes — Personal notes & tags per application
  ├─ /follow-up-reminders — Set reminders to check back
  └─ /inbox — Messages from recruiters/employers (threaded)
    ↓
Additional portals:
  ├─ /application-portal — Unified portal for employer requests
  │   (document submissions, additional questions, pre-screening forms)
  ├─ /candidate-hub — Central landing page aggregating:
  │   ├─ Profile status, active applications
  │   ├─ Upcoming interviews, new job matches
  │   └─ Recommended actions ("what needs attention now")
  └─ /experience-surveys — Post-interview feedback surveys
      (anonymous, shapes future recruitment processes)
```

See [[concepts/application-lifecycle]] for pipeline status details.

## Step 6: Interview

```
Receive interview invitation (email / WhatsApp / inbox)
    ↓
Self-schedule → /interview-scheduling (pick available slot)
  └─ Added to calendar automatically
    ↓
Prepare:
  ├─ /interview-simulator — AI mock interviews
  │   ├─ Types: behavioural, technical, case study
  │   ├─ Respond via text or video
  │   └─ AI feedback on content, structure, delivery
  ├─ /company-research — Deep company intel
  └─ AI auto-preps questions based on JD (if Interview AI Config enabled)
    ↓
Attend interview (video or in-person)
    ↓
AI auto-generates thank-you note (if configured in Interview AI Config)
```

## Step 7: Receive & Accept Offer

```
Offer appears in dashboard
    ↓
Review:
  ├─ Salary, benefits, start date
  ├─ Comparison to market benchmarks (from /salary-insights)
  └─ /salary-negotiator — AI negotiation guidance
      ├─ Market salary data for your role/location/experience
      ├─ Negotiation talking points
      └─ Rehearse the conversation
    ↓
Respond:
  ├─ Accept → status = "Hired" 🎉
  ├─ Negotiate → counter-offer flow
  └─ Decline → provide reason
```

See [[entities/offer-system]] for full offer lifecycle details.

---

## Step 8: AI Tools

A dedicated suite of AI-powered tools available from day one — not just during the hiring flow.

| Tool | Route | What It Does |
|------|-------|-------------|
| **AI Coaching** | `/coaching` | Personalised career guidance — chat about goals, challenges, interviews. On-demand career coach. |
| **CV Review** | `/cv-review` | Analyses CV for clarity, keywords, ATS compatibility, achievement quantification. Fix issues before applying. |
| **Cover Letter** | `/cover-letter` | Generates role-specific cover letters from your profile + job description. Edit and personalise before sending. |
| **Salary Negotiator** | `/salary-negotiator` | Market data + conversation strategies for salary negotiation. |
| **Interview Simulator** | `/interview-simulator` | Mock interviews with AI feedback (behavioural, technical, case study). |

**Autopilot features** (configurable in Settings):
- **Auto-Apply** — automatically apply to strong AI matches
- **Auto-Cover-Letter** — generate cover letters for every application
- **Auto-Follow-Up** — send follow-ups after configurable intervals
- **Market Radar** — watch companies, roles, industries for alerts (salary trends, hiring bursts, layoffs)

See [[concepts/ai-features]] for the full AI capability map.

---

## Step 9: Learning Hub

A comprehensive learning ecosystem with 14 features — not just a course catalogue.

### Core Learning

```
/learning — Learning Dashboard
  ├─ Enrolled courses, progress %, achievements
  ├─ Personalised recommendations based on career goals
  └─ Upcoming deadlines
    ↓
/learning-hub — Browse all content
  ├─ Providers: Udemy, Coursera, LinkedIn Learning, internal
  ├─ Categories: technical, soft-skills, certification, language, industry
  └─ Levels: beginner, intermediate, advanced
    ↓
/learning-paths — Structured journeys
  ├─ E.g., "Become a Data Analyst", "Master Project Management"
  └─ Step-by-step sequence at your own pace
    ↓
/skill-tree — Visual skill map
  ├─ Current levels, relationships between skills
  └─ Click any skill → learning resources, verification tests, career paths
```

### Targeted Learning

```
/micro-learning — Bite-sized modules (5–15 min)
  └─ One concept per module + quick knowledge check
    ↓
/job-linked-learning — Tied to specific jobs
  ├─ "You're missing X for this role — here's a course"
  └─ Turns "not quite qualified" into "qualified"
    ↓
/learning-challenges — Practical, project-based challenges
  ├─ Real-world scenarios, timed completion
  └─ Submissions become portfolio pieces + earn badges
    ↓
/peer-teaching — Teach what you know, learn from others
  └─ Earns recognition, reinforces knowledge, builds network
```

### South African Specific

```
SETA Learnerships → accessible via Learning Hub
  ├─ Browse by SETA and industry
  ├─ Check eligibility requirements
  └─ Apply directly through the platform
  (Sector Education and Training Authority — accredited with workplace experience)
```

### Learning Management

```
/certifications — Browse, prepare, track certification progress
    ↓
/study-planner — Schedule learning sessions
  ├─ Set goals + available time
  ├─ Auto-creates realistic schedule
  └─ Reminders + adjusts if you fall behind
    ↓
/learning-analytics — Track learning ROI
  ├─ Time spent, modules completed, quiz scores
  └─ Skill growth over time
    ↓
/mentorship — Structured mentorship programme
  ├─ Browse mentors by industry/expertise
  ├─ Request connection, schedule sessions
  └─ Track goals and progress
```

**Learning → Hiring feedback loop:**
```
Learning completed → Skill verified → Match score improves
                                    → Better AI recommendations
                                    → Credential displayed on profile
```

See [[entities/community-learning-hub]] for technical details.

---

## Step 10: Career Development

Long-term career management tools — available alongside job search or after hiring.

| Tool | Route | What It Does |
|------|-------|-------------|
| **Skill Gap Analysis** | `/skill-gap` | Compares your verified skills against target role requirements. Produces prioritised gap list with linked learning. |
| **Career Path** | `/career-path` | Visual career progression — lateral moves, promotions, pivots. Shows skills needed per transition + typical timelines. |
| **Salary Insights** | `/salary-insights` | Market salary data by title, industry, experience, location. Median, 25th, 75th percentiles. |
| **Career Pulse** | `/career-pulse` | Periodic career satisfaction check-ins. Tracks sentiment over time, flags misalignment or readiness for change. |
| **Career Tests** | `/tests` | Skills and knowledge assessments. Passing scores add verified badges to profile. |
| **Career Analytics** | `/analytics` | Profile strength, market competitiveness, search appearances, application success rates, comparison to other candidates. |

**Career Development → Job Search feedback loop:**
```
Skill Gap identified → Learning recommended → Skill verified
    → Improved match scores → Better job recommendations
        → Career Path updated with new possibilities
```

---

## Step 11: Community

A social layer for peer support, networking, and recognition — 6 features.

```
/community — Community Forum
  ├─ Post types: Discussion, Interview Experience, Success Story, Resource, Question
  ├─ Categories: job-search, interviews, career-growth, skills, general
  ├─ Threaded comments, reactions (like, helpful, insightful, celebrate)
  ├─ Bookmarks, polls, content reporting
  └─ 11 tabs: feed, trending, bookmarks, success stories, challenges, pulse...
    ↓
/community-trending — What the community is talking about
  ├─ Hot posts (scored by engagement)
  ├─ Trending categories, popular tags (top 15, 30 days)
  └─ Active discussions
    ↓
/community-leaderboard — Gamified ranking
  ├─ Points: posts ×10 + upvotes ×5 + comments ×3
  ├─ Levels: Newcomer → Contributor → Rising Star → Expert → Community Leader
  └─ High-ranking = visibility + credibility with recruiters
    ↓
/community-interviews — Interview Vault
  ├─ Shared real interview questions by company/role
  └─ Contribute your experiences to help others
    ↓
/community-mentors — Mentor Connect
  ├─ Matchmaking based on goals, industry, development needs
  └─ Connection requests + session scheduling
    ↓
/community-badges — Achievement Badges
  ├─ Earned via: courses, skill verifications, community contributions, milestones
  └─ Display on profile, visible to recruiters
```

**Application Streaks** — gamification tracks consecutive days with applications. Current streak and longest streak.

See [[entities/community-learning-hub]] for full community architecture.

---

## Step 12: Knowledge Base

```
/wiki — Personal Knowledge Base
  ├─ Wiki Dashboard — overview of your wikis
  ├─ Wiki Viewer — read wiki pages
  └─ Wiki Pages — create and edit personal knowledge articles
```

A personal wiki for organising career research, interview notes, industry insights, and learning materials.

---

## Step 13: Account Management

### Billing

```
/billing — Subscription & Payment Management
  ├─ Overview — current plan and status
  ├─ Value/ROI — return on subscription investment
  ├─ Credits — balance, purchase, spend history
  ├─ Budget — budget tracking and forecasting
  ├─ Invoices — download invoice history
  ├─ Plans — view/upgrade subscription plans
  └─ Settings — payment methods, preferences
```

See [[concepts/billing-system]] for the full billing architecture.

### Settings

```
/settings — Account Configuration (8 tabs)
  ├─ Preferences — language, defaults
  ├─ Career DNA — work values, communication style (feeds AI matching)
  ├─ Automation — Autopilot config (auto-apply, auto-follow-up)
  ├─ Notifications — email, WhatsApp, SMS, push preferences
  ├─ Appearance — theme, accessibility
  ├─ Privacy — profile visibility, data controls
  ├─ Security — password, 2FA, sessions
  └─ Account — email, deletion, data export
```

---

## Feature Coverage Summary

| Category | Features | Step |
|----------|----------|------|
| Signup & Onboarding | 2 | Steps 1–2 |
| Profile & Identity | 9 | Step 3 |
| Job Search | 6 | Step 4 |
| Applications & Tracking | 10 | Steps 5–6 |
| Offer & Negotiation | 2 | Step 7 |
| AI Tools | 4 (+4 autopilot) | Step 8 |
| Learning Hub | 14 | Step 9 |
| Career Development | 6 | Step 10 |
| Community | 6 | Step 11 |
| Knowledge Base | 1 (+3 sub-pages) | Step 12 |
| Account | 2 | Step 13 |
| **Total** | **57 main features, 90+ with tabs** | |

## Key Touchpoints with Other User Types

| Stage | Interacts With |
|-------|---------------|
| Job posted | [[entities/recruiter-user]] or [[entities/business-user]] |
| Application reviewed | Recruiter or Business |
| Interview scheduled | Recruiter or Business |
| Offer extended | Recruiter or Business |
| Profile moderated | [[entities/admin-user]] |
| Community content | Other [[entities/individual-user|Individuals]] |
| Mentorship | Experienced professionals in community |

## References

- [[entities/individual-user]] — Full feature list and data model
- [[concepts/application-lifecycle]] — Pipeline status details
- [[concepts/authentication]] — Signup/login flow
- [[concepts/ai-features]] — AI tools in the journey
- [[concepts/billing-system]] — Billing architecture
- [[entities/offer-system]] — Offer lifecycle
- [[entities/community-learning-hub]] — Learning and community technical details
- [[entities/job-aggregation]] — External job sources (Adzuna, CareerJet)
- [[sources/individual-features-2026-04-07]] — Detailed feature descriptions
- [[sources/individual-journey-gap-analysis-2026-04-07]] — Gap analysis that prompted this rewrite
