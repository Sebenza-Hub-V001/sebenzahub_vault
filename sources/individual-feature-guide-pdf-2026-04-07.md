---
title: "Source: Job Seeker Feature Guide (PDF)"
type: source
created: 2026-04-07
updated: 2026-04-07
tags: [individual, features, job-seeker, career, product-guide, pdf]
sources: [individual-feature-guide-pdf]
status: active
confidence: high
---

# Source: Job Seeker Feature Guide (PDF)

**Raw file:** `raw/articles/individual-feature-guide.pdf`
**Ingested:** 2026-04-07
**Format:** PDF (public-facing product guide, branded sebenzahub.co.za)

## Summary

The official Sebenza Hub **Job Seeker Feature Guide** — a polished, user-facing document covering **53 features** across **8 sections** of the Individual Dashboard. Each feature is described using a consistent "What It Is / How We Use It / Why It's Important" format aimed at educating job seekers about platform capabilities. This is the **public-facing version** of the same features documented in [[sources/individual-features-2026-04-07]] (from the codebase markdown).

## Relationship to Prior Source

This PDF and [[sources/individual-features-2026-04-07]] cover the same feature set. Key differences:

| Aspect | Prior Source (markdown) | This PDF |
|--------|------------------------|----------|
| Origin | Codebase documentation | Public product guide |
| Audience | Internal / technical | Job seekers |
| Feature count per section | Undercounted in some sections | Accurate counts per section |
| Descriptions | Terse | Full "What / How / Why" for each feature |
| Account section | Not included | Included (Billing, Settings) |

The prior source undercounted features in several sections. The PDF provides the **canonical feature count per section** as presented to users:

| Section | Prior Source Count | PDF Count | Missing from Prior Count |
|---------|-------------------|-----------|--------------------------|
| Profile | 5 | 5 | — |
| Job Search | 5 | 6 | Company Research |
| Applications | 7 | 10 | Interview Scheduling, Experience Surveys, Messages |
| AI Tools | 4 | 4 | — |
| Learning Hub | 12 | 14 | Mentorship, (Interview Simulator counted separately) |
| Career Development | 6 | 6 | — |
| Community | 4 | 6 | Interview Vault, Mentor Connect |
| Account | — | 2 | Billing, Settings (entire section missing) |
| **Total** | **~43 listed** | **53** | **10 features undercounted** |

> **Note:** All 10 "missing" features were already documented on [[entities/individual-user]] and [[workflows/individual-journey]] from the codebase audit. The prior source summary simply undercounted them.

## Key Claims by Section

### Profile (5 features)
- **My CVs** — Multi-version CV management tailored to different industries/role types
- **Credentials** — Verified digital wallet for qualifications, certifications, licences, and professional memberships. Displays trust badges. Types: Criminal Record, Employment History, Qualifications, Credit Check, References
- **Video Profile** — 60–90 second recorded video introduction. AI analysis provides Confidence (87%), Clarity (92%), Engagement (78%) scores
- **Skill Verifications** — Standardised tests adding verified badges. Categories: Technical Skills, Communication, Problem Solving, Culture Fit, Leadership, Overall (rated out of 5)
- **CV Templates** — Browse by industry or style, template handles formatting

### Job Search (6 features)
- **All Jobs** — Centralised board with filters: title, industry, location, salary range, job type, experience level
- **Auto Match** — AI continuous matching with notifications. Shows match percentages (95%, 88%, 82%, 76%, 71%)
- **Manual Search** — Keyword + filters: location, salary, industry, company size, remote/hybrid/onsite, contract type
- **Saved Searches** — Save criteria with automated new-match alerts
- **Favourites** — Personal shortlist for comparison
- **Company Research** — Company profiles with culture, size, industry, reviews, hiring activity. Metrics shown: Success rate (94%), Placed (248), Rating (4.8). Tabs: Settings, Performance, Pitch, Insights

### Applications (10 features)
- **My Applications** — Dashboard of all applications with status (submitted, reviewed, interview, offer) and correspondence
- **App Tracker** — Visual pipeline: Applied → Screening → Interview → Offer → Hired (shown with counts: 4, 3, 3, 2, 1). Real-time status notifications
- **App Analytics** — Response rates, stage conversion, trends over time (Jan–Aug chart)
- **Notes & Tags** — Personal CRM for applications: reminders, interview prep, contact details, custom labels
- **Reminders** — Customisable alerts for follow-ups, interview prep, document submission, saved job check-backs (calendar view)
- **Application Portal** — Unified portal for employer requests: document submissions, additional questions, pre-screening forms
- **Candidate Hub** — Central landing page: profile status, active applications, upcoming interviews, recommended actions. Metrics: Open Roles (247), Candidates (1,842), Fill Rate (89%)
- **Interview Scheduling** — Self-service: view available slots, select time, auto-add to calendar (calendar view)
- **Experience Surveys** — Post-apply/interview/outcome surveys. Anonymous. Fields: Role Title, Required Skills, Experience Level, Location, Salary Band, Work Type
- **Messages** — In-platform messaging with recruiters/employers. Threaded conversation view

### AI Tools (4 features)
- **AI Coaching** — Personalised career guidance: goals, challenges, interview prep. Capabilities: Pattern Detection, Skill Matching, Risk Analysis, Predictions
- **CV Review** — AI analysis: clarity, keyword optimisation, achievement quantification, formatting, gaps. Goal: fix rejection causes before applying
- **Cover Letter** — AI-generated role-specific cover letters. Select job → generate → edit → submit
- **Salary Negotiator** — Market salary data, negotiation talking points, conversation rehearsal. Comparison view: two candidates across Skills, Experience, Culture Fit, Salary, Availability, References, Overall

### Learning Hub (14 features)
- **Learning Dashboard** — Enrolled courses, progress, achievements, recommendations. Metrics: Open Roles (247), Candidates (1,842), Fill Rate (89%)
- **Learning Paths** — Curated course sequences for specific skills/roles (e.g., "Become a Data Analyst", "Master Project Management"). Structured: Trigger → Condition → Action → Notify → Complete
- **Skill Tree** — Visual map of skills: current levels, relationships, growth opportunities. Stages shown: First Contact → Coffee Chat → Phone Screen → Placement → Follow-up → Check-in
- **Micro Learning** — 5–15 minute focused modules. Single concept per module with knowledge check
- **Interview Simulator** — AI mock interviews: behavioural, technical, case study. Text or video response. AI feedback: Confidence (87%), Clarity (92%), Engagement (78%)
- **Job-Linked Learning** — Skills gap courses tied to specific job listings. Shows match percentages (95%, 88%, 82%, 76%, 71%)
- **Challenges** — Project-based, timed assessments. Earn recognition and badges. Categories: Technical Skills, Communication, Problem Solving, Culture Fit, Leadership (rated out of 5)
- **Portfolio Builder** — Projects, challenge submissions, code samples, designs, case studies. Organised by skill/industry with shareable link
- **Peer Teaching** — Teach skills you've mastered, learn from others. Earns recognition and badges. Messaging-style interface
- **SETA Learnerships** — SA-specific: browse by SETA and industry, check eligibility, apply directly. Fields: Role Title, Required Skills, Experience Level, Location, Salary Band, Work Type
- **Certifications** — Professional certification catalogue with study resources and exam prep. Displays verification types: Criminal Record, Employment History, Qualifications, Credit Check, References
- **Study Planner** — Personal scheduling: goals, available time, realistic schedule, reminders, auto-adjust (calendar view)
- **Learning Analytics** — Time spent, modules completed, quiz scores, skill growth over time (Jan–Aug chart)
- **Mentorship** — Structured programme: browse mentors by industry/expertise, request connection, schedule sessions, track goals. Metrics: Success (94%), Placed (248), Rating (4.8)

### Career Development (6 features)
- **Skill Gap** — Compares verified skills vs target role requirements. Produces prioritised gap list with linked learning. Scores: Confidence (87%), Culture (92%), Skills (85%), Growth (88%), Comp (78%)
- **Career Path** — Visual career trajectories: lateral moves, promotions, pivots. Shows skills needed, typical timeline. Stages: First Contact → Coffee Chat → Phone Screen → Placement → Follow-up → Check-in
- **Salary Insights** — Market data: median, 25th, 75th percentile by title, industry, experience, location (Jan–Aug chart)
- **Career Pulse** — Periodic satisfaction check-ins. Tracks sentiment over time. Flags readiness for change. Scores: Confidence (87%), Culture (92%), Skills (85%), Growth (88%), Comp (78%)
- **Tests** — Skills and knowledge assessments. Online, immediate results. Passing = verified badges. Fields: Role Title, Required Skills, Experience Level, Location, Salary Band, Work Type
- **Analytics** — Personal career dashboard: profile strength, market competitiveness, search appearances, application success rates, peer comparison. Metrics: Open Roles (247), Candidates (1,842), Fill Rate (89%)

### Community (6 features)
- **Community Forum** — Job seekers, professionals, mentors share advice. Browse topics, ask questions, share experiences. Threaded messaging interface
- **Trending** — Curated feed of trending topics, discussions, content (Jan–Aug chart)
- **Leaderboard** — Gamified ranking: points from courses, assessments, peer help, engagement. Categories: Technical Skills, Communication, Problem Solving, Culture Fit, Leadership (rated out of 5)
- **Interview Vault** — Shared repository of real interview questions/experiences. Search by company or role. Community-contributed
- **Mentor Connect** — Matchmaking: career goals, industry, development needs. Compatible mentor suggestions, connection requests. Metrics: Success (94%), Placed (248), Rating (4.8)
- **Badges** — Digital achievement badges for learning, assessments, contributions, milestones. Visible to recruiters on profile

### Account (2 features)
- **Billing** — Subscription/payment management: current plan, upgrades, payment methods, invoices, subscription status
- **Settings** — Privacy, notifications, integrations (LinkedIn, GitHub), profile visibility, job search preferences

## Entities and Concepts Mentioned

- [[entities/individual-user]] — All features target this user type
- [[entities/community-learning-hub]] — Learning Hub and Community features (14 + 6)
- [[concepts/ai-features]] — AI Coaching, CV Review, Cover Letter, Salary Negotiator, Auto Match, Interview Simulator, Job-Linked Learning
- [[concepts/billing-system]] — Account Billing feature
- [[concepts/compliance]] — SETA learnerships (SA-specific)

## Notable Observations

- **UI metrics are revealing:** The PDF shows specific UI elements — Company Research displays Success (94%), Placed (248), Rating (4.8). These are likely recruiter/agency profile metrics visible to job seekers, confirming that company profiles and recruiter profiles are exposed to Individuals.
- **AI analysis scores are consistent:** Video Profile and Interview Simulator both show Confidence (87%), Clarity (92%), Engagement (78%) — suggesting a shared AI analysis framework for video content.
- **Feature count marketing:** The cover says "50+" but the actual count is 53 across 8 sections. The prior markdown source covered the same features but undercounted due to grouping.
- **Calendar and messaging UIs recur:** Interview Scheduling, Reminders, Study Planner all show the same calendar component. Messages, Peer Teaching, Community Forum all show the same threaded messaging component.
- **Account section is new to sources:** Billing and Settings were previously only documented from the codebase audit, not from the user-facing guide.

## Contradictions and Tensions

> No contradictions found. The PDF **confirms** all features previously identified in the codebase audit and prior feature guide. Feature counts are reconciled — the prior source summary undercounted, but the entity pages and journey workflow already had full coverage.

## Open Questions

- The Candidate Hub shows "Open Roles (247), Candidates (1,842), Fill Rate (89%)" — these look like platform-level metrics, not individual metrics. Are these exposed on the Individual dashboard or is this a UI mockup reusing recruiter dashboard elements?
- The consistent AI scores across Video Profile and Interview Simulator (87%/92%/78%) — are these hardcoded mockup values or does the AI analysis framework actually produce identical scoring dimensions?

## References

- [[sources/individual-features-2026-04-07]] — Prior source covering the same features (from codebase markdown)
- [[entities/individual-user]] — Full feature list and data model
- [[workflows/individual-journey]] — Complete journey using all these features
- [[entities/community-learning-hub]] — Learning and community infrastructure
- [[concepts/ai-features]] — AI capabilities
- [[concepts/billing-system]] — Billing architecture
