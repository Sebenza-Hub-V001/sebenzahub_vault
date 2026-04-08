---
title: "Multi-Tenancy (Organizations)"
type: concept
created: 2026-04-07
updated: 2026-04-07
tags: [architecture, multi-tenancy, organizations, teams]
sources: [repo-audit-2026-04-07]
status: active
confidence: high
---

# Multi-Tenancy (Organizations)

Sebenza Hub uses an **organization-based multi-tenancy model** to isolate data between Recruiters and Businesses. Each Recruiter agency and Business company is an "organization" with its own team members, jobs, candidates, and settings.

## Core Tables

### `organizations`

The tenant container. Created during onboarding for Recruiters and Businesses.

| Field | Description |
|-------|-------------|
| `id` | UUID primary key |
| `name` | Company/agency name |
| `type` | `"employer"` (Business) or `"agency"` (Recruiter) |
| `industry` | Industry sector |
| `size` | "1-10", "10-50", "50-250", "250-1000", "1000+" |
| `website`, `logoUrl`, `description` | Company branding |
| `city`, `province`, `country` | Location (default: South Africa) |
| `registrationNumber`, `bbbeeLevel` | SA compliance fields |
| `plan` | Subscription plan |
| `isVerified` | Admin verification status |

### `memberships`

Links users to organizations with a role.

| Field | Description |
|-------|-------------|
| `userId` | FK to users |
| `organizationId` | FK to organizations |
| `role` | "owner", "admin", "manager", "viewer", "recruiter" |

**Constraint:** UNIQUE(userId, organizationId) — one membership per user per org.

### `teamMembers`

More detailed team management with invitations and fine-grained permissions.

| Field | Description |
|-------|-------------|
| `organizationId` | FK to organizations |
| `email`, `fullName` | Team member identity |
| `role` | "member", "reviewer", "approver", "admin" |
| `permissions` | JSONB array of specific permissions |
| `status` | "invited", "active", "deactivated" |
| `invitedBy` | FK to users |
| `roleDefinitionId` | FK to custom role template |

### `roleDefinitions`

Custom role templates per organization.

## Data Isolation

The `resolveOrgContext` middleware ensures:

```
Request → Check user's memberships
       → Set req.orgContext = { organizationId, organizationType }
       → All queries scoped to this organizationId
       → Cannot access another org's data
```

**Everything is scoped to the organization:**
- Jobs belong to an organization
- Candidates belong to an organization
- Interviews, scorecards, offers — all org-scoped
- Settings (interview, compliance, integrations) — per org

## Organization Types

| Type | Created By | Purpose |
|------|-----------|---------|
| `employer` | Business user | Company hiring directly |
| `agency` | Recruiter user | Recruitment agency sourcing for clients |
| `recruiter` | Alternate for agency | Same as agency |
| `staffing_firm` | Alternate for agency | Same as agency |

## Organization Settings

Each organization can configure:

| Table | Settings |
|-------|----------|
| `interviewSettings` | Calendar provider, video provider, working hours, timezone, panel templates |
| `complianceSettings` | EE data capture, POPIA consent text, data retention days |
| `organizationIntegrations` | Slack webhook, ATS provider, API keys |

## How It Works Per User Type

| User Type | Has Organization? | Details |
|-----------|-------------------|---------|
| Individual | No | Personal account only, no org context |
| Recruiter | Yes (agency) | Created during onboarding, user becomes owner |
| Business | Yes (employer) | Created during onboarding, user becomes owner |
| Admin | No (platform-level) | Operates across all organizations |

## Open Questions

- Can a user belong to multiple organizations simultaneously?
- How does the Recruiter–Business client relationship map to the organization model? Is the Business a separate org or a record in `corporateClients`?
- What happens when an organization is deleted/deactivated?

## References

- [[02-concepts/rbac]] — Permission system within organizations
- [[01-entities/recruiter-user]] — Agency organization
- [[01-entities/business-user]] — Employer organization
- Source: [[09-sources/repo-audit-2026-04-07]]
