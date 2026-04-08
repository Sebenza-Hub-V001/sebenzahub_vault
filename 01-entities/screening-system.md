---
title: "Screening System"
type: entity
created: 2026-04-07
updated: 2026-04-07
tags: [screening, assessment, chatbot, background-checks, testing]
sources: [repo-audit-2026-04-07]
status: active
confidence: high
---

# Screening System

The Screening System is Sebenza Hub's candidate evaluation engine — covering everything from AI chatbot screening to competency tests, assessment bundles, and background checks. It sits between application submission and the interview stage in the [[02-concepts/application-lifecycle|hiring pipeline]].

## Pipeline Position

```
Application Submitted
    ↓
┌─ SCREENING SYSTEM ──────────────────┐
│                                      │
│  CV Screening (AI scored)            │
│      ↓                               │
│  Chatbot Screening (interactive)     │
│      ↓                               │
│  Competency Tests (assessments)      │
│      ↓                               │
│  Background Checks (verification)    │
│                                      │
│  → Shortlisted / Rejected            │
└──────────────────────────────────────┘
    ↓
Interview Stage
```

## Components

### 1. CV Screening

Automated AI evaluation of candidate CVs against job requirements.

**Tables:**
- `screeningJobs` — Defines screening criteria per role
- `screeningCandidates` — Candidates being screened (with raw CV text)
- `screeningEvaluations` — AI-generated scores (0–100) with breakdown and reasoning
- `screeningNotes` — Collaboration notes from reviewers
- `screeningActivityLog` — All screening actions logged
- `screeningShareLinks` — Shareable links for external reviewers

**Key fields on `screeningJobs`:**
- `mustHaveSkills`, `niceToHaveSkills` (JSON arrays)
- `knockouts` (JSON) — Deal-breaker criteria
- `weights` (JSON) — Scoring weights per category
- `urgency` (low/medium/high)

**AI endpoints:**
- `POST /api/ai/generate-screening-criteria` — AI generates criteria from job description
- `POST /api/ai/screening-market-intel` — Market intelligence for a role
- `POST /api/ai/screening-next-steps/:id` — AI recommends next actions
- `POST /api/screening-jobs/:id/bulk-screen` — Bulk screen all candidates

### 2. Screening Chatbot

An AI-powered conversational screening tool that interviews candidates via chat.

**Tables:**
- `screeningBotTemplates` — Conversation templates with question banks and scoring
- `screeningBotSessions` — Individual chatbot conversations with full message history
- `screeningBotQuestionBanks` — Reusable question libraries (technical, behavioral, cultural, compliance, situational)
- `screeningBotCampaigns` — Bulk screening campaigns sent to multiple candidates
- `screeningBotPlaybooks` — Multi-stage screening workflows
- `screeningBotSelfServiceLinks` — Public links for candidates to self-screen

**Session modes:** chatbot, live-assist, batch, self-service

**Session outputs:**
- `scoreTotal`, `scoreBreakdown` (by category)
- `recommendation` (shortlist / maybe / reject)
- `sentimentAnalysis` (overall, confidence, enthusiasm, clarity)
- `redFlags`, `greenFlags` (JSON arrays)
- `aiReasoning` (text explanation)

**Key endpoints:**
- `POST /api/screening-bot/sessions/:id/chat` — Send message in conversation
- `POST /api/screening-bot/sessions/:id/analyze` — Analyze completed session
- `POST /api/screening-bot/sessions/:id/live-assist` — Real-time suggestions for recruiter
- `POST /api/screening-bot/smart-shortlist` — AI shortlisting across sessions
- `POST /api/screening-bot/bias-check` — Check for bias in screening
- `POST /api/public/screening-bot/:token/start` — Public self-service (no auth)

### 3. Competency Tests

Structured skill and knowledge assessments with anti-cheat detection.

**Tables:**
- `competencyTests` — Test definitions with duration, passing score, anti-cheat config
- `testAttempts` — Individual test attempts with integrity monitoring
- `testResponses` — Answer-level responses with scoring
- `assessmentInvitations` — Token-based test invitations
- `assessmentBundles` — Multi-test bundles with weighted stages
- `assessmentBundleItems` — Individual tests within a bundle

**Anti-cheat monitoring on `testAttempts`:**
- `fraudScore` — Composite fraud score
- `fullscreenExits` — Times candidate left fullscreen
- `tabSwitches` — Tab switch count
- `copyPasteAttempts` — Copy/paste detected
- `integrityScore` (0–100) — Overall integrity rating

**Bundle passing strategies:** `all` (pass every test), `average` (pass on average), `weighted` (weighted score)

### 4. Background Checks

External verification of candidate credentials.

**Tables:**
- `backgroundChecks` — Check records with status, type, provider, risk level
- `backgroundCheckPackages` — Reusable check packages
- `backgroundCheckSettings` — Per-organization configuration
- `backgroundCheckRescreening` — Periodic rescreening

**Types:** Criminal records, employment history, qualifications, credit checks.

## Full Screening Workflow

```
screeningJobs (define criteria)
    ↓
screeningCandidates (add/bulk upload CVs)
    ↓
screeningEvaluations (AI auto-scores)
    ↓
screeningBotSessions (chatbot interviews)
    ↓
assessmentInvitations (send competency tests)
    ↓
testAttempts (tests completed + integrity scored)
    ↓
backgroundChecks (verification initiated)
    ↓
jobApplications (shortlisted → move to interview pipeline)
```

## API Endpoint Count

~100+ endpoints across screening jobs, chatbot, tests, background checks, and bundles.

## Frontend Pages

| Page | User | Route |
|------|------|-------|
| Screening Dashboard | Recruiter | `/screening-chatbot` |
| Screening Roles | Recruiter/Business | `/screening-roles` |
| Test Management | Recruiter | `/tests` |
| Test Builder | Recruiter | `/tests/:id/builder` |
| Test Library | Recruiter | `/test-library` |
| Test Templates | Recruiter | `/test-templates` |
| Background Checks | Recruiter/Business | `/background-checks` |

## Open Questions

- Which background check providers are integrated? SA-specific providers?
- How does the anti-cheat system handle false positives?
- Can candidates retake failed assessments?
- How do assessment bundle results feed into the AI match score?

## References

- [[02-concepts/application-lifecycle]] — Screening sits between apply and interview
- [[01-entities/recruiter-user]] — Primary user of screening tools
- [[01-entities/business-user]] — Also uses screening
- [[02-concepts/ai-features]] — AI powers scoring, chatbot, and recommendations
- Source: [[09-sources/repo-audit-2026-04-07]]
