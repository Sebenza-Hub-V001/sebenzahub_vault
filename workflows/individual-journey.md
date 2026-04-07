---
title: "Individual Journey: Signup → Hired"
type: concept
created: 2026-04-07
updated: 2026-04-07
tags: [workflow, individual, journey, hiring]
sources: [repo-audit-2026-04-07]
status: active
confidence: high
---

# Individual Journey: Signup → Hired

The complete end-to-end journey of a job seeker on Sebenza Hub, from first visit to getting hired.

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

```
/dashboard/individual/profile
    ↓
Upload CV(s) → /cvs (create multiple versions)
    ↓
Add credentials → /credentials (certifications, education)
    ↓
Record video profile → /video-profile (60–90 second intro)
    ↓
Set job preferences → Settings:
  ├─ Preferred industries, sub-industries
  ├─ Desired salary range
  ├─ Remote preference (full remote / hybrid / on-site)
  ├─ Employment types (permanent / contract / temporary)
  ├─ Preferred locations
  └─ Notice period
    ↓
Configure Career DNA → Settings:
  ├─ Work values (impact, compensation, growth, stability...)
  ├─ Communication style, work pace
  ├─ Team preference, leadership style
  └─ These feed into AI job matching
```

## Step 4: Search & Apply

```
Browse jobs:
  ├─ /all-jobs — Full job listings
  ├─ /auto-match — AI recommends jobs based on profile
  ├─ /manual-search — Advanced filters
  └─ /saved-searches — Re-run saved queries
    ↓
Research companies → /company-research
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
  ├─ aiMatchScore calculated automatically
  ├─ aiMatchedSkills / aiMissingSkills populated
  └─ ghostRiskScore calculated (is this a real job?)
```

## Step 5: Track Applications

```
/dashboard/individual/applications
    ↓
Monitor status changes:
  Applied → Screening → Interview → Offer → Hired
  (or Rejected / Withdrawn at any stage)
    ↓
Tools available:
  ├─ /application-tracker — Visual pipeline view
  ├─ /application-analytics — Success rates, response times
  ├─ /application-notes — Personal notes per application
  ├─ /follow-up-reminders — Set reminders to check back
  └─ /inbox — Messages from recruiters/employers
```

## Step 6: Interview

```
Receive interview invitation (email/WhatsApp/inbox)
    ↓
Self-schedule → /interview-scheduling (pick available slot)
    ↓
Prepare:
  ├─ /interview-simulator — AI mock interviews
  ├─ /company-research — Deep company intel
  └─ AI auto-preps questions based on JD
    ↓
Attend interview (video or in-person)
    ↓
AI auto-generates thank-you note (if configured)
```

## Step 7: Receive & Accept Offer

```
Offer appears in dashboard
    ↓
Review:
  ├─ Salary, benefits, start date
  ├─ Comparison to market benchmarks
  └─ /salary-negotiator — AI negotiation guidance
    ↓
Respond:
  ├─ Accept → status = "Hired" 🎉
  ├─ Negotiate → counter-offer flow
  └─ Decline → provide reason
```

## Step 8: Ongoing Development

Even after hiring, Individuals continue using:
- **Learning Hub** — Upskill via courses and learning paths
- **Community** — Share success story, mentor others
- **Career Pulse** — Monitor career health
- **Skill Verifications** — Build verified credentials

## Key Touchpoints with Other User Types

| Stage | Interacts With |
|-------|---------------|
| Job posted | [[entities/recruiter-user]] or [[entities/business-user]] |
| Application reviewed | Recruiter or Business |
| Interview scheduled | Recruiter or Business |
| Offer extended | Recruiter or Business |
| Profile moderated | [[entities/admin-user]] |

## References

- [[entities/individual-user]] — Full feature list
- [[concepts/application-lifecycle]] — Pipeline status details
- [[concepts/authentication]] — Signup/login flow
- [[concepts/ai-features]] — AI tools in the journey
