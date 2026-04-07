---
title: "Individual Journey: The Complete Platform Experience"
type: concept
created: 2026-04-07
updated: 2026-04-07
tags: [workflow, individual, journey, hiring, learning, career, community]
sources: [repo-audit-2026-04-07, individual-features-2026-04-07, individual-journey-gap-analysis, individual-feature-guide-pdf-2026-04-07]
status: active
confidence: high
user-types: [individual]
dashboard-path: /dashboard/individual/*
---

# Individual Journey: The Complete Platform Experience

The complete experience of a job seeker on Sebenza Hub. The **hiring path** (Steps 1–7) is the primary journey — each step triggers the next. But real career journeys aren't linear. **Parallel tracks** run alongside the hiring path: AI assistance, learning, career planning, and community. These tracks activate at specific moments — a rejection, a skill gap, a stalled search — and feed back into the hiring path.

```
                    ┌─────────────────────────────────────────┐
                    │          HIRING PATH (Steps 1–7)        │
                    │  Signup → Profile → Search → Apply →    │
                    │  Track → Interview → Offer              │
                    └──────┬──────────┬──────────┬────────────┘
                           │          │          │
              ┌────────────┘    ┌─────┘    ┌─────┘
              ▼                 ▼          ▼
     ┌────────────────┐ ┌───────────┐ ┌──────────────┐
     │ AI Assistance  │ │ Learning  │ │   Community   │
     │ (always on)    │ │ (on gaps) │ │ (on struggle) │
     └───────┬────────┘ └─────┬─────┘ └──────┬───────┘
             │                │               │
             └────────────────┼───────────────┘
                              ▼
                    ┌─────────────────────┐
                    │  Career Development │
                    │  (long-term loop)   │
                    └─────────────────────┘
```

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

# Parallel Tracks

The hiring path is one dimension. These tracks run alongside it — activating at specific moments and feeding results back into the hiring path. They aren't "steps" you reach; they're responses to what happens during your search.

---

## Track A: AI Assistance — "I need an edge"

AI tools activate at decision points throughout the hiring path. They're not a separate section you visit — they're woven into the moments where you need help.

### Scenario: Your applications aren't converting

```
/application-analytics shows 15 applications, 0 interviews
    ↓
What's wrong? Two possible paths:
    ↓
PATH 1: Your CV is the problem
  /cv-review → AI analyses your CV
    ├─ Finds: weak action verbs, no quantified achievements, poor ATS keywords
    ├─ Gives specific rewrites, not just "improve this"
    └─ You fix it → re-upload → next applications perform better
    ↓
PATH 2: You're targeting wrong roles
  /coaching → Chat with AI career coach
    ├─ "I have 3 years in marketing but keep applying for senior roles"
    ├─ Coach identifies mismatch between experience and target
    └─ Suggests adjusting search criteria or building missing skills
        → feeds into Learning track (Track B)
```

### Scenario: You found a dream job but feel underqualified

```
View job listing → aiMatchScore = 62 (borderline)
  ├─ aiMissingSkills: ["Tableau", "SQL", "stakeholder management"]
    ↓
/cover-letter → AI generates a letter that:
  ├─ Emphasises your matched skills (not the gaps)
  ├─ Frames transferable experience toward the missing skills
  └─ You edit, personalise, and submit with the application
    ↓
Meanwhile: /job-linked-learning flags courses for the missing skills
  → feeds into Learning track (Track B)
```

### Scenario: You got an offer but the salary feels low

```
Offer arrives: R35,000/month for Data Analyst in Cape Town
    ↓
/salary-negotiator → AI pulls market data:
  ├─ Median for this role/location/experience: R42,000
  ├─ You're being offered 25th percentile
  └─ AI generates talking points + counter-offer script
    ↓
/salary-insights → Broader market context:
  ├─ Salary trends (rising? flat? declining?)
  ├─ How this company's offers compare to industry
  └─ What a realistic counter looks like
    ↓
You negotiate → counter-offer flow in Step 7
```

### Scenario: You want to job search on autopilot

```
/settings → Automation tab → Configure Autopilot:
  ├─ Auto-Apply: ON (for jobs with aiMatchScore > 80)
  ├─ Auto-Cover-Letter: ON (generate per application)
  ├─ Auto-Follow-Up: ON (send after 7 days of no response)
  └─ Market Radar: watching "fintech", "Cape Town", "data analyst"
    ↓
System runs continuously:
  ├─ New job posted matching radar → notification
  ├─ Strong match → auto-applies with tailored cover letter
  ├─ No response after 7 days → auto-follow-up sent
  └─ Market shift detected → alert (e.g., "hiring burst at Discovery")
```

See [[concepts/ai-features]] for the full AI capability map.

---

## Track B: Learning — "I'm not qualified enough"

Learning activates when there's a gap between where you are and where you need to be. The trigger is usually a rejection, a low match score, or a career pivot decision.

### Scenario: Rejected for missing skills

```
Application rejected → feedback mentions "insufficient SQL experience"
    ↓
/skill-gap → Select target role: "Data Analyst"
  ├─ Compares your verified skills vs role requirements
  ├─ Gap list: SQL (critical), Tableau (important), Statistics (nice-to-have)
  └─ Each gap links to learning resources
    ↓
/learning-paths → Enrol in "Become a Data Analyst" path
  ├─ Structured sequence: SQL fundamentals → intermediate queries → data viz
  ├─ Your pace, your schedule
  └─ /study-planner creates a realistic weekly plan
    ↓
/micro-learning → 15-minute SQL modules during commutes
    ↓
/learning-challenges → Complete a real-world data challenge
  ├─ Timed project: "Analyse this dataset and present findings"
  ├─ Submission goes to /portfolio-builder as a portfolio piece
  └─ Earns a badge (visible to recruiters)
    ↓
/skill-verifications → Take SQL assessment
  ├─ Pass → verified badge on profile
  └─ Your aiMatchScore for Data Analyst roles improves
    ↓
FEEDBACK LOOP: Re-search jobs → higher match scores → better applications
```

### Scenario: Career changer with no formal credentials

```
You're a teacher pivoting to UX design — no portfolio, no certifications
    ↓
/career-path → Explore "Teacher → UX Designer" trajectory
  ├─ Shows: transferable skills (communication, empathy, curriculum design)
  ├─ Shows: missing skills (Figma, user research, prototyping)
  └─ Typical timeline: 6–9 months
    ↓
/learning-hub → Browse UX courses
  ├─ Providers: Coursera, Udemy, LinkedIn Learning
  ├─ /job-linked-learning → "These 3 courses match active UX job postings"
  └─ /certifications → Google UX Design Certificate prep
    ↓
/portfolio-builder → Build as you learn
  ├─ Add course projects, personal redesigns, challenge submissions
  └─ Shareable portfolio link for applications
    ↓
/peer-teaching → Teach what you know (communication skills workshop)
  ├─ Earns recognition + badges
  └─ Builds network in the UX community
    ↓
SETA Learnerships → Check for accredited UX/digital design programmes
  ├─ Browse by SETA, check eligibility
  └─ Structured workplace experience — a path into employment
    ↓
/mentorship → Connect with a working UX designer
  ├─ Matched by industry + goals
  ├─ Schedule sessions, track progress
  └─ Insider guidance on breaking into the field
    ↓
FEEDBACK LOOP: New skills verified → Career Path updates
  → new roles appear in Auto Match → apply with portfolio + certs
```

### Scenario: Upskilling while employed (post-hire)

```
You got hired (Step 7 complete) but want to grow toward a promotion
    ↓
/learning-dashboard → Track ongoing development
  ├─ /skill-tree → Visualise current skills and what's next
  ├─ /learning-analytics → Time invested, progress, quiz scores
  └─ /study-planner → Fit learning around your work schedule
    ↓
/certifications → Work toward industry certification
  ├─ Prep materials, study guides, exam readiness tracking
  └─ Certified → credential on profile → stronger position for next move
```

See [[entities/community-learning-hub]] for technical details on the learning infrastructure.

---

## Track C: Community — "I need people, not just tools"

Community activates when the job search feels isolating, when you need real human insight, or when you've been through something worth sharing.

### Scenario: Preparing for a big interview

```
Interview scheduled at Standard Bank for a Senior Analyst role
    ↓
/community-interviews → Search Interview Vault for "Standard Bank"
  ├─ Find 3 posts from people who interviewed there
  ├─ Common questions: case study on credit risk, behavioural on leadership
  ├─ One post warns: "They care a lot about cultural fit — prep examples"
  └─ You now know what to expect before the interview simulator
    ↓
/interview-simulator → Practice with AI using the real questions you found
    ↓
After your interview:
  └─ Contribute YOUR experience to the Interview Vault
      → helps the next person who interviews at Standard Bank
```

### Scenario: Search stalled, morale dropping

```
3 months in, 40 applications, 2 interviews, 0 offers
    ↓
/community → Browse the forum
  ├─ Find others in similar situations → you're not alone
  ├─ Read success stories → people who broke through after months
  ├─ Post a question: "Anyone else struggling in the data space in JHB?"
  └─ Get advice: "Have you tried contract roles? That's how I got in"
    ↓
/community-trending → See what's working for other job seekers
  ├─ Trending topic: "Companies hiring in Cape Town fintech"
  └─ Popular resource shared: a free SQL course that got someone hired
    ↓
/community-mentors → Request a mentor
  ├─ Matched with someone in your target industry
  ├─ They review your approach, suggest changes
  └─ Accountability + insider perspective
    ↓
FEEDBACK LOOP: New strategy → adjust search → better outcomes
```

### Scenario: You got hired and want to give back

```
You landed the job → post a Success Story
  ├─ Company, role, salary (optional), what worked, what you'd do differently
  └─ This helps others calibrate their expectations
    ↓
/peer-teaching → Teach a skill you're strong in
  ├─ "How I learned SQL in 3 months" — a session for career changers
  └─ Earns badges + builds your reputation
    ↓
/community-leaderboard → Your contributions earn points
  ├─ Posts ×10 + upvotes ×5 + comments ×3
  ├─ Levels: Newcomer → Contributor → Rising Star → Expert → Community Leader
  └─ High-ranking profiles get visibility with recruiters
    ↓
/community-badges → Collect achievement badges
  └─ Displayed on profile — signals engagement to future employers
```

**Application Streaks** — gamification tracks consecutive days with applications. Keeps momentum during the grind.

See [[entities/community-learning-hub]] for full community architecture.

---

## Track D: Career Development — "Where am I going?"

Career Development is the long-term loop. It runs before, during, and after any specific job search. It's how you stay intentional about your career instead of drifting.

### Scenario: "I don't know what I should be doing with my career"

```
/career-path → Explore trajectories from your current role
  ├─ Lateral moves: Marketing Coordinator → Content Strategist
  ├─ Upward moves: Marketing Coordinator → Marketing Manager
  ├─ Pivot options: Marketing Coordinator → Product Manager
  └─ Each shows: skills needed, typical timeline, salary range
    ↓
/tests → Take career assessments
  ├─ Skills tests, knowledge assessments
  ├─ Results: verified badges + clearer picture of strengths
  └─ Weak areas → feed into Learning track (Track B)
    ↓
/career-pulse → Regular check-ins on satisfaction
  ├─ "How do you feel about your current role/search?"
  ├─ Tracks sentiment over time
  └─ Flags when you might be ready for a change
```

### Scenario: "Am I being paid fairly?"

```
/salary-insights → Search "Data Analyst, Cape Town, 3 years experience"
  ├─ Median: R42,000/month
  ├─ 25th percentile: R35,000 | 75th: R52,000
  └─ Your current/offered salary vs market position
    ↓
Decision point:
  ├─ Below median → /salary-negotiator for negotiation prep (Track A)
  ├─ At median but want 75th → /skill-gap to find what separates you
  └─ Above median → you're in a strong position
```

### Scenario: "I want to track how I'm doing overall"

```
/analytics → Career Analytics dashboard
  ├─ Profile strength score — how complete/compelling your profile is
  ├─ Market competitiveness — how you rank vs similar candidates
  ├─ Search appearances — how often recruiters see your profile
  ├─ Application success rates — what's converting and what isn't
  └─ Comparison to others in your field
    ↓
Low profile strength? → Back to Step 3 (Build Profile)
Low search appearances? → Adjust visibility in /settings → Privacy
Low success rates? → Track A (AI Assistance) for CV/targeting fixes
```

---

## Supporting Infrastructure

These features don't drive a narrative — they're plumbing that supports the tracks above.

### Knowledge Base (`/wiki`)

Personal wiki for organising career research, interview notes, company intel, and learning materials. Three views: dashboard, viewer, pages. Useful for candidates running a structured, multi-company search.

### Billing (`/billing`)

Subscription management (7 tabs: overview, value/ROI, credits, budget, invoices, plans, settings). Some features are credit-metered (e.g., AI operations). See [[concepts/billing-system]].

### Settings (`/settings`)

Account configuration (8 tabs: preferences, Career DNA, automation, notifications, appearance, privacy, security, account). Career DNA and Automation are the most consequential — they configure AI matching weights and Autopilot behaviour.

---

## How It All Connects

```
HIRING PATH:  Signup → Profile → Search → Apply → Track → Interview → Offer
                 │         │        │        │       │         │         │
                 │         │        │        │       │         │         │
AI ASSISTANCE:   │    CV Review  Cover    Coaching  │    Interview   Salary
                 │         │     Letter      │      │    Simulator  Negotiator
                 │         │        │        │      │         │         │
LEARNING:        │    Skill Tree   Job-    Skill   │    Interview    │
                 │         │     Linked    Gap     │      Prep      │
                 │         │    Learning    │      │         │       │
COMMUNITY:       │         │        │      │    Mentor    Interview  Success
                 │         │        │      │   Connect     Vault    Story
                 │         │        │      │      │         │        │
CAREER DEV:      │    Career Path   │   Analytics │    Career     Salary
                 │         │        │      │      │     Pulse    Insights
                 │         │        │      │      │         │        │
                 ▼         ▼        ▼      ▼      ▼         ▼        ▼
              [Each feeds back into the hiring path at the next cycle]
```

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
- [[sources/individual-feature-guide-pdf-2026-04-07]] — PDF feature guide confirming 53 features across 8 sections
- [[sources/individual-journey-gap-analysis-2026-04-07]] — Gap analysis that prompted this rewrite
