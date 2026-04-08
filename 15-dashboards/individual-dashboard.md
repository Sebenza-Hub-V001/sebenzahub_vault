---
title: "Individual Dashboard"
type: entity
created: 2026-04-08
updated: 2026-04-08
tags: [dashboard, individual, job-seeker, layout]
sources: [dashboard-layouts]
status: active
user-types: [individual]
dashboard-path: /dashboard/individual/*
---

# Individual Dashboard (Job Seeker)

**File:** `client/src/pages/individuals/IndividualDashboard.tsx`
**Route:** `/dashboard/individual/*`
**Total Pages:** 51

> Sidebar organised into Hiring Path → Parallel Tracks → Supporting, with glowing headers and a thick divider separating primary path from parallel tracks.

See [[03-workflows/individual-journey]] for the full journey with scenarios.

---

## HIRING PATH

### Build Profile (7 pages)

| Page | Route |
|------|-------|
| Profile | `/dashboard/individual/profile` |
| My CVs | `/dashboard/individual/cvs` |
| CV Templates | `/dashboard/individual/cv-templates` |
| Credentials | `/dashboard/individual/credentials` |
| Skill Verifications | `/dashboard/individual/skill-verifications` |
| Video Profile | `/dashboard/individual/video-profile` |
| Portfolio Builder | `/dashboard/individual/portfolio-builder` |

### Search & Apply (6 pages)

| Page | Route |
|------|-------|
| All Jobs | `/dashboard/individual/all-jobs` |
| Auto Match | `/dashboard/individual/auto-match` |
| Manual Search | `/dashboard/individual/manual-search` |
| Saved Searches | `/dashboard/individual/saved-searches` |
| Favourites | `/dashboard/individual/favourites` |
| Company Research | `/dashboard/individual/company-research` |

### Track Applications (9 pages)

| Page | Route |
|------|-------|
| My Applications | `/dashboard/individual/applications` |
| App Tracker | `/dashboard/individual/application-tracker` |
| App Analytics | `/dashboard/individual/application-analytics` |
| Notes & Tags | `/dashboard/individual/application-notes` |
| Reminders | `/dashboard/individual/follow-up-reminders` |
| Application Portal | `/dashboard/individual/portal` |
| Candidate Hub | `/dashboard/individual/candidate-hub` |
| Experience Surveys | `/dashboard/individual/experience-surveys` |
| Messages | `/dashboard/individual/inbox` |

### Interview (2 pages)

| Page | Route |
|------|-------|
| Interview Scheduling | `/dashboard/individual/interview-scheduling` |
| Interview Simulator | `/dashboard/individual/interview-simulator` |

### Offers (2 pages)

| Page | Route |
|------|-------|
| Salary Negotiator | `/dashboard/individual/salary-negotiator` |
| Salary Insights | `/dashboard/individual/salary-insights` |

---

## PARALLEL TRACKS

### AI Assistance (3 pages)

| Page | Route |
|------|-------|
| AI Coaching | `/dashboard/individual/coaching` |
| CV Review | `/dashboard/individual/cv-review` |
| Cover Letter | `/dashboard/individual/cover-letter` |

### Learning (12 pages)

| Page | Route |
|------|-------|
| Learning Dashboard | `/dashboard/individual/learning-hub` |
| Learning Paths | `/dashboard/individual/learning-paths` |
| Skill Tree | `/dashboard/individual/skill-tree` |
| Micro Learning | `/dashboard/individual/micro-learning` |
| Job-Linked Learning | `/dashboard/individual/job-linked-learning` |
| Challenges | `/dashboard/individual/learning-challenges` |
| Peer Teaching | `/dashboard/individual/peer-teaching` |
| SETA Learnerships | `/dashboard/individual/learning` |
| Certifications | `/dashboard/individual/certifications` |
| Study Planner | `/dashboard/individual/study-planner` |
| Learning Analytics | `/dashboard/individual/learning-analytics` |
| Mentorship | `/dashboard/individual/mentorship` |

### Community (6 pages)

| Page | Route |
|------|-------|
| Community Forum | `/dashboard/individual/community` |
| Trending | `/dashboard/individual/community-trending` |
| Leaderboard | `/dashboard/individual/community-leaderboard` |
| Interview Vault | `/dashboard/individual/community-interviews` |
| Mentor Connect | `/dashboard/individual/community-mentors` |
| Badges | `/dashboard/individual/community-badges` |

### Career Development (5 pages)

| Page | Route |
|------|-------|
| Skill Gap | `/dashboard/individual/skill-gap` |
| Career Path | `/dashboard/individual/career-path` |
| Career Pulse | `/dashboard/individual/career-pulse` |
| Tests | `/dashboard/individual/tests` |
| Analytics | `/dashboard/individual/analytics` |

---

## SUPPORTING

### Knowledge Base (3 pages)

| Page | Route |
|------|-------|
| My Wikis | `/dashboard/individual/wiki` |
| Wiki Viewer | `/dashboard/individual/wiki/:id` |
| Wiki Page | `/dashboard/individual/wiki/:id/page/:slug` |

### Account (2 pages)

| Page | Route |
|------|-------|
| Billing | `/dashboard/individual/billing` |
| Settings | `/dashboard/individual/settings` |

## References

- [[03-workflows/individual-journey]] — Full journey with scenarios
- [[01-entities/individual-user]] — Entity page with data model
