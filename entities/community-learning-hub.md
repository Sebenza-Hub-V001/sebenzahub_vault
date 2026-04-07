---
title: "Community & Learning Hub"
type: entity
created: 2026-04-07
updated: 2026-04-07
tags: [community, learning, gamification, mentorship, individual]
sources: [repo-audit-2026-04-07, individual-feature-guide-pdf-2026-04-07]
status: active
confidence: high
---

# Community & Learning Hub

The Community & Learning Hub is Sebenza Hub's engagement engine for [[entities/individual-user|Individual]] users. It combines a social community forum, structured learning paths, skill verification, mentorship, and gamification to keep job seekers developing their careers between applications.

## Community Features

### Discussion Forum

**Table:** `community_posts`

Post types:
- **Discussion** — Free-form conversation
- **Interview Experience** — Company name, job title, difficulty (1–5), outcome, stages, questions asked
- **Success Story** — Company, new role, salary (optional), impact, learnings
- **Resource** — URL, resource type, relevant skills
- **Question** — Skill area, difficulty, context

**Categories:** job-search, interviews, career-growth, skills, general

### Engagement

| Feature | Table | Details |
|---------|-------|---------|
| Comments | `community_comments` | Threaded (parentId self-reference) |
| Reactions | `community_reactions` | like, helpful, insightful, celebrate |
| Bookmarks | `community_bookmarks` | Save posts for later |
| Views | `community_post_views` | View count tracking |
| Polls | `community_polls` | Polls with vote tracking |
| Reports | `community_reports` | Flag content (pending → reviewed → actioned) |

### Gamification & Leaderboard

**Reputation score formula:**
```
(post_count × 10) + (total_upvotes × 5) + (total_comments × 3)
```

**Levels:**
| Level | Points |
|-------|--------|
| Newcomer | 0–50 |
| Contributor | 50–100 |
| Rising Star | 100–200 |
| Expert | 200–500 |
| Community Leader | 500+ |

**Badges** (`community_badges`):
- Categories: contributor, expert, helper, leader
- Tracked per user in `community_user_badges`

**Application Streaks** (`application_streaks`):
- Current streak and longest streak
- Tracks consecutive days with applications

### Interview Vault

`community_interview_experiences` — Shared repository of real interview questions and experiences, searchable by company and role.

### Weekly Challenges

`community_challenges` — Practical challenges (skill, networking, application, interview) with difficulty ratings and participation tracking.

### Mentorship

**Tables:**
- `community_mentor_profiles` — Headline, bio, industries, expertise, availability, capacity
- `community_mentor_requests` — Mentee requests with goals and status

**Mentor browse:** Filter by industry, availability, capacity. Sort by sessions and rating.

### Community Analytics (Pulse)

`GET /api/community/pulse` returns:
- Total members, posts today/this week, comments, reactions
- 14-day activity trend, top categories, engagement rate
- Success story count, interview experience count

### Trending

`GET /api/community/trending`:
- Hot posts by engagement: `upvotes + comments×2 + reactions×1.5`
- Trending categories, popular tags (top 15, 30 days), active discussions

## Learning Features

### Learning Resources

`learning_resources` — Content from multiple providers:
- Providers: Udemy, Coursera, LinkedIn Learning, internal
- Categories: technical, soft-skills, certification, language, industry
- Levels: beginner, intermediate, advanced
- Tracked: duration, rating, skill tags

### Enrollments & Progress

`learning_enrollments` — Track user progress:
- Status: enrolled → in_progress → completed
- Progress: 0–100%
- Completion date tracked

### Skill Verification

`skill_verifications` — Validate skills through:
- Methods: assessment, project, endorsement, certification
- Score tracking (score / maxScore)
- Badge and certificate URLs
- Hot skill flag, skill group classification
- Challenge verification: `challengeVerified`, `challengeScore`

### Skill Challenges

`skill_challenges` — Timed assessments:
- Questions: multiple-choice, coding, etc.
- Difficulty: easy / medium / hard
- Time limits and passing scores
- Attempt tracking with answer history

### Video Skill Proofs

`skill_video_proofs` — Video demonstrations:
- Upload video proof of skill
- Peer review workflow (pending → approved → rejected)

### Interview Prep

`skill_interview_prep` — AI-powered practice:
- Mock Q&A with AI evaluation and scoring
- Practice count tracking
- "Ready for interview" flag

### AI Learning Recommendations

| Endpoint | Purpose |
|----------|---------|
| `POST /api/ai/test-learning-bridge` | Map test weaknesses to learning resources |
| `POST /api/ai/learning-recommend` | Course recommendations based on skill gaps |

SA-specific: includes SETA learnerships, local training providers.

## Connection to Job Matching

```
Learning completed → Skill verified → Match score improves
                                    → Better AI recommendations
                                    → Credential displayed on profile
```

Learning gaps identified from job applications feed back into recommended learning paths.

## User-Facing Feature Counts

Per the [[sources/individual-feature-guide-pdf-2026-04-07|Job Seeker Feature Guide (PDF)]], the user-facing feature breakdown is:

- **Learning Hub:** 14 features — Dashboard, Paths, Skill Tree, Micro Learning, Interview Simulator, Job-Linked Learning, Challenges, Portfolio Builder, Peer Teaching, SETA Learnerships, Certifications, Study Planner, Learning Analytics, Mentorship
- **Community:** 6 features — Forum, Trending, Leaderboard, Interview Vault, Mentor Connect, Badges

### Mentorship (from PDF)

The PDF confirms mentorship as a structured programme (not just informal connections):
- Browse mentors by **industry and expertise**
- Request a connection and schedule sessions
- Track goals and progress within the relationship
- Mentor profiles display: Success rate, Placed count, Rating

### Mentor Connect vs Mentorship

Two related but distinct features:
- **Mentorship** (Learning Hub) — Structured programme with goal tracking and session scheduling
- **Mentor Connect** (Community) — Matchmaking feature that connects you with compatible mentors based on goals, industry, and development needs

Both likely use the same underlying `community_mentor_profiles` and `community_mentor_requests` tables.

## Open Questions

- How are learning resources curated — admin uploads, scraped, or API integration?
- Are mentorship sessions tracked (scheduled calls, notes)? *(Partially answered: PDF confirms goal tracking and session scheduling exist)*
- How do community badges differ from skill verification badges?
- What's the moderation workflow for reported content?

## References

- [[entities/individual-user]] — Primary users of community and learning
- [[workflows/individual-journey]] — Learning (Step 9) and Community (Step 11) in the full journey
- [[concepts/ai-features]] — AI in learning recommendations and interview prep
- [[comparisons/user-type-comparison]] — Learning is Individual-only
- Source: [[sources/repo-audit-2026-04-07]]
- Source: [[sources/individual-feature-guide-pdf-2026-04-07]]
