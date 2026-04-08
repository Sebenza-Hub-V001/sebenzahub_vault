---
title: "LinkedIn Integration"
type: entity
created: 2026-04-07
updated: 2026-04-07
tags: [linkedin, integration, sourcing, leads, oauth]
sources: [repo-audit-2026-04-07]
status: active
confidence: high
---

# LinkedIn Integration

Sebenza Hub integrates with LinkedIn for OAuth connection, lead generation form syncing, AI-powered lead scoring, outreach automation, and profile verification. This is primarily a **Recruiter** tool for sourcing passive candidates.

## Features

### 1. OAuth Connection

| Endpoint | Purpose |
|----------|---------|
| `GET /api/linkedin/connect` | Initiate OAuth flow |
| `GET /api/linkedin/callback` | Handle OAuth callback |
| `GET /api/linkedin/status` | Check connection status |
| `DELETE /api/linkedin/disconnect` | Disconnect account |

- **Authorization URL:** `https://www.linkedin.com/oauth/v2/authorization`
- **Scopes:** `openid`, `profile`, `email`, `w_member_social`
- **Token storage:** Encrypted in `connected_accounts` table
- **Config vars:** `LINKEDIN_CLIENT_ID`, `LINKEDIN_CLIENT_SECRET`, `LINKEDIN_REDIRECT_URI`

### 2. Lead Gen Form Sync

Sync leads from LinkedIn Lead Gen Forms directly into Sebenza Hub.

| Endpoint | Purpose |
|----------|---------|
| `POST /api/linkedin/leads/sync` | Auto-sync from LinkedIn forms |
| `POST /api/linkedin/leads/manual` | Create lead manually |
| `POST /api/linkedin/leads/bulk-import` | Bulk CSV import |

**Process:** Fetch forms → fetch submissions → parse fields → deduplicate via `linkedinLeadId`.

### 3. AI Lead Scoring

| Endpoint | Purpose |
|----------|---------|
| `POST /api/linkedin/leads/:id/ai-score` | Score single lead (0–100) |
| `POST /api/linkedin/leads/bulk-ai-score` | Score up to 25 leads |

**AI insights generated:**
- `recruiterBrief` — Summary for recruiter
- `inferredSkills` — Skills detected from profile
- `inferredSeniority` — entry / mid / senior / lead
- `marketValue` — low / medium / high
- `engagementPrediction` — Likelihood of response
- `suggestedTags`, `suggestedPriority`
- `confidence` (0–100)

### 4. Outreach & Nurturing

| Endpoint | Purpose |
|----------|---------|
| `POST /api/linkedin/leads/:id/generate-outreach` | AI-generate personalized message |
| `POST /api/linkedin/leads/:id/convert` | Convert lead to candidate |

**Nurture sequences** (`lead_nurture_sequences`):
- Multi-step automated outreach (email, LinkedIn message, WhatsApp)
- Configurable delays between steps
- Stop conditions (on response, status change, max attempts)
- Enrollment tracking with step-by-step results

### 5. Job Matching

`linkedin_lead_job_matches` table:
- Match score (0–100) with explanation
- Matched skills vs missing skills
- Recruiter action tracking (contacted / passed / pending)

### 6. Predictive Analytics

Fields on `linkedin_leads`:
- `conversionProbability` (0.0–1.0)
- `predictedConvertBy` — When lead likely converts
- `optimalContactTime` — Best time to reach out
- `recommendedChannel` — email / linkedin / whatsapp

### 7. Duplicate Detection

`linkedin_lead_duplicates` table:
- Match types: email, phone, name+company
- Confidence score (0.0–1.0)
- Merge capability

### 8. Profile Verification

- `linkedinUrl` and `linkedinVerified` fields on profiles
- Auto-verified during OAuth callback via LinkedIn verification API
- Available on both Individual and Recruiter profiles

## Database Tables

| Table | Purpose |
|-------|---------|
| `connected_accounts` | OAuth tokens (encrypted) |
| `linkedin_leads` | Lead records with scoring, status, activity log |
| `lead_nurture_sequences` | Multi-step outreach automation |
| `lead_nurture_enrollments` | Individual lead enrollment in sequences |
| `linkedin_lead_job_matches` | Lead-to-job matching with scores |
| `linkedin_lead_duplicates` | Duplicate detection and merging |

## Lead Status Flow

```
new → contacted → qualified → converted (to candidate)
                            → declined
                → nurturing (in sequence)
```

## Data Management

- Full CRUD on leads with bulk update/delete
- CSV export with all fields
- CSV import template download
- Filter by: status, priority, tags, date range
- Sort by: any field

## Open Questions

- Does the LinkedIn integration use the official Marketing API or just basic OAuth profile access?
- Are LinkedIn InMail messages sent through the platform or just tracked?
- How is the lead conversion to candidate handled — does it create a `candidateProfiles` record?

## References

- [[01-entities/recruiter-user]] — Primary user of LinkedIn features
- [[02-concepts/ai-features]] — AI scoring and outreach generation
- [[01-entities/sebenza-hub]] — Platform integrations overview
- Source: [[09-sources/repo-audit-2026-04-07]]
