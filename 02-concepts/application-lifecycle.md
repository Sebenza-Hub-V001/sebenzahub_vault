---
title: "Application Lifecycle"
type: concept
created: 2026-04-07
updated: 2026-04-07
tags: [workflow, hiring, pipeline, applications]
sources: [repo-audit-2026-04-07]
status: active
confidence: high
---

# Application Lifecycle

The application lifecycle is the core workflow of Sebenza Hub — the journey from a job being posted to a candidate being hired. It involves all four user types and multiple status transitions.

## The Full Flow

```
Job Created (by Recruiter or Business)
    ↓
Job Published (visible to Individuals)
    ↓
Individual Applies (POST /api/jobs/{jobId}/apply)
    ↓
Application Created (status: "Applied", pipelineStage: "new")
    ↓
AI Auto-Scores Match (aiMatchScore, aiMatchedSkills, aiMissingSkills)
    ↓
┌─────────────────────────────────────────────┐
│ Screening                                    │
│ - Recruiter/Business reviews CV + form       │
│ - Screening chatbot (optional)               │
│ - Background check (optional)                │
│ ├→ Shortlisted (passed initial review)       │
│ ├→ Rejected (doesn't meet baseline)          │
│ └→ Withdrawn (by Individual)                 │
└─────────────────────────────────────────────┘
    ↓
┌─────────────────────────────────────────────┐
│ Interview                                    │
│ - Scheduled via calendar integration         │
│ - Video or in-person                         │
│ - Interviewer fills scorecard                │
│ - AI video analysis (optional)               │
│ ├→ Rejected (didn't pass)                    │
│ └→ Withdrawn (candidate withdrew)            │
└─────────────────────────────────────────────┘
    ↓
┌─────────────────────────────────────────────┐
│ Offer                                        │
│ - Offer letter generated (from template)     │
│ - Routed through approval chain              │
│ - Sent to candidate                          │
│ ├→ Accepted                                  │
│ ├→ Negotiation (salary/terms discussion)     │
│ ├→ Rejected (candidate declined)             │
│ └→ Expired (time-limited, not responded)     │
└─────────────────────────────────────────────┘
    ↓
Hired (onboarding begins)
```

## Status Enums

### Application Status (`jobApplications.status`)

| Status | Description |
|--------|-------------|
| `Applied` | Initial state on submission |
| `Shortlisted` | Passed initial review |
| `Screening` | Under active screening |
| `Interview` | Scheduled for interview |
| `Offer` | Offer extended |
| `Hired` | Accepted and onboarding |
| `Rejected` | Rejected at any stage |
| `Withdrawn` | Candidate withdrew |

### Pipeline Stage (`jobApplications.pipelineStage`)

| Stage | Description |
|-------|-------------|
| `new` | Just applied, not yet reviewed |
| `screening` | Under screening |
| `interview` | In interview process |
| `offer` | Offer stage |
| `placed` | Successfully hired |
| `rejected` | Rejected |
| `withdrawn` | Withdrawn |

### Job Status (`jobs.status`)

| Status | Description |
|--------|-------------|
| `draft` | Not yet published |
| `active` | Published, accepting applications |
| `on_hold` | Temporarily paused |
| `closed` | No longer accepting |
| `archived` | Hidden from search |

### Offer Status (`offers.status`)

| Status | Description |
|--------|-------------|
| `draft` | Not yet sent |
| `sent` | Delivered to candidate |
| `viewed` | Candidate opened |
| `accepted` | Candidate accepted |
| `negotiation` | Terms under discussion |
| `rejected` | Candidate declined |
| `expired` | Time-limited, not responded |
| `superseded` | Replaced by new offer |

### Interview Status (`interviews.status`)

| Status | Description |
|--------|-------------|
| `scheduled` | Calendar invite sent |
| `confirmed` | Candidate confirmed |
| `completed` | Interview occurred |
| `cancelled` | Cancelled by either party |
| `rescheduled` | Moved to new date/time |
| `no_show` | Candidate didn't attend |

## Application Record Fields

The `jobApplications` table stores:

| Field | Type | Description |
|-------|------|-------------|
| `userId` | UUID | The Individual who applied |
| `jobId` | UUID | The job posting |
| `status` | VARCHAR | Current status (see enum above) |
| `pipelineStage` | VARCHAR | Kanban stage |
| `coverLetter` | TEXT | Optional cover letter |
| `resumeUrl` | TEXT | Link to submitted resume |
| `answers` | JSONB | Screening question responses |
| `matchScore` | INTEGER | Manual match score (0–100) |
| `aiMatchScore` | INTEGER | AI-calculated match (0–100) |
| `aiMatchedSkills` | JSONB | Skills that matched the job |
| `aiMissingSkills` | JSONB | Skills the candidate lacks |
| `ghostRiskScore` | INTEGER | Fraud detection score (0–100) |
| `ghostRiskFactors` | JSONB | Risk indicators |
| `screeningNotes` | TEXT | Recruiter/Business notes |
| `videoIntroId` | UUID | Optional video introduction |

## Who Does What

| Action | Individual | Recruiter | Business | Admin |
|--------|-----------|-----------|----------|-------|
| Post job | - | Yes | Yes | Yes |
| Apply to job | Yes | - | - | - |
| Review applications | - | Yes | Yes | Yes |
| Move through pipeline | - | Yes | Yes | Yes |
| Schedule interview | - | Yes | Yes | - |
| Attend interview | Yes | - | - | - |
| Fill scorecard | - | Yes | Yes | - |
| Create offer | - | Yes | Yes | - |
| Accept/decline offer | Yes | - | - | - |
| Withdraw application | Yes | - | - | - |

## The Recruiter Triangle

When a Recruiter is involved, the flow has an extra layer:

```
Recruiter sources Individual (from talent pool / AI search / LinkedIn)
    ↓
Recruiter submits Individual to Business client's job
    ↓
Business reviews submission alongside direct applications
    ↓
Business interviews, offers, hires
    ↓
Recruiter earns placement fee (tracked in clientRevenue)
```

## Individual's View

Individuals track their applications via:
- **Application Tracker** — Visual pipeline view
- **Application Analytics** — Success rates, response times
- **Application Notes** — Personal notes per application
- **Follow-up Reminders** — Auto-reminders to check back
- **Ghost Analysis** — AI detects potentially fake/ghost job postings

## AI Enhancement

AI is deeply integrated into the lifecycle:
- **Auto-scoring** — Every application gets an `aiMatchScore`
- **Skill gap analysis** — `aiMatchedSkills` vs `aiMissingSkills`
- **Ghost job detection** — `ghostRiskScore` flags suspicious postings
- **Screening chatbot** — Automated initial screening
- **Interview question generation** — AI suggests questions based on JD
- **Video analysis** — AI analyzes video interview performance
- **Offer prediction** — Predict probability of candidate accepting

## References

- [[01-entities/individual-user]] — The applicant
- [[01-entities/recruiter-user]] — The intermediary
- [[01-entities/business-user]] — The employer
- [[02-concepts/ai-features]] — AI in the hiring process
- Source: [[09-sources/repo-audit-2026-04-07]]
