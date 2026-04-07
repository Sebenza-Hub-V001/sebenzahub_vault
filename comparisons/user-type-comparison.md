---
title: "User Type Comparison"
type: comparison
created: 2026-04-07
updated: 2026-04-07
tags: [comparison, user-types, features, matrix]
sources: [repo-audit-2026-04-07]
status: active
confidence: high
---

# User Type Comparison

A side-by-side comparison of the four user types on Sebenza Hub: [[entities/individual-user|Individual]], [[entities/recruiter-user|Recruiter]], [[entities/business-user|Business]], and [[entities/admin-user|Admin]].

## Identity & Access

| Attribute | Individual | Recruiter | Business | Admin |
|-----------|-----------|-----------|----------|-------|
| Role value | `individual` | `recruiter` | `business` | `admin` |
| Default role | Yes (new users) | No | No | No |
| Has organization | No | Yes (agency) | Yes (employer) | No (platform-level) |
| Profile table | `candidateProfiles` | `recruiterProfiles` (60+ fields) | Via `organizations` | None (role flag only) |
| Team members | No | Yes | Yes | N/A |
| Onboarding complexity | Medium (6 sections) | Medium (3 sections) | Light (2 sections) | N/A |
| Dashboard path | `/dashboard/individual/*` | `/dashboard/recruiter/*` | `/dashboard/business/*` | `/admin/*` |

## Core Capabilities

| Capability | Individual | Recruiter | Business | Admin |
|------------|-----------|-----------|----------|-------|
| **Job search** | Full | - | - | - |
| **Job posting** | - | Full | Full | View/moderate |
| **Apply to jobs** | Yes | - | - | - |
| **Manage candidates** | Own profile | Full database | Full database | View all |
| **Pipeline management** | View own status | Full Kanban | Full Kanban | Monitor |
| **Interview scheduling** | Self-schedule | Create/manage | Create/manage | - |
| **Conduct interviews** | Attend | Yes | Yes | - |
| **Offers** | Accept/decline | Create/send | Create/send | Monitor |
| **Client management** | - | Yes (Business clients) | - | - |
| **Placement fees** | - | Earn | Pay | - |

## AI Features

| AI Feature | Individual | Recruiter | Business | Admin |
|------------|-----------|-----------|----------|-------|
| Job matching | Auto-match | AI search | AI search | - |
| CV analysis | CV Review | Candidate summary | - | - |
| Content generation | Cover letters | JDs, emails, messages | JDs, emails | - |
| Interview | Simulator | Question gen, video analysis | Question gen | - |
| Predictive | Career path, salary | Hiring success, offer acceptance | Hiring success | - |
| Coaching | Career coaching | Profile coach | - | - |
| Automation | Career autopilot | Screening bot, sequences | Screening bot | - |
| Governance | - | - | - | Monitoring, bias auditing |

## Communication Features

| Feature | Individual | Recruiter | Business | Admin |
|---------|-----------|-----------|----------|-------|
| Inbox/messaging | Yes | Unified inbox | Unified inbox | - |
| Email templates | - | Yes | Yes | - |
| Email sequences | - | Yes | - | - |
| WhatsApp messaging | Receive alerts | Campaigns, bot, apply | - | Configure |
| Chatbot | - | Screening bot | Screening bot | - |

## Analytics & Reporting

| Feature | Individual | Recruiter | Business | Admin |
|---------|-----------|-----------|----------|-------|
| Personal analytics | Career pulse | - | - | - |
| Recruitment analytics | Application stats | Full dashboard | Full dashboard | Platform-wide |
| Predictive analytics | - | Yes | Yes | - |
| Diversity analytics | - | Yes | Yes | Compliance reports |
| KPI dashboard | - | Yes (revenue, placements) | - | Usage analytics |
| Custom reports | - | - | Yes | Compliance reports |

## Compliance Features

| Feature | Individual | Recruiter | Business | Admin |
|---------|-----------|-----------|----------|-------|
| POPIA consent | Give consent | Declare compliance | Configure | Monitor/report |
| B-BBEE | - | Level on profile | Level on org | Report |
| Employment Equity | Provide demographics | EE reports | EE reports | Compliance reports |
| Audit trail | - | View own | View own | View all |
| Background checks | - | Order | Order | - |
| Blind hiring | - | Configure | - | - |

## Learning & Development

| Feature | Individual | Recruiter | Business | Admin |
|---------|-----------|-----------|----------|-------|
| Learning hub | Full access | - | - | - |
| Skill tree | Yes | - | - | - |
| Learning paths | Yes | - | - | - |
| Interview simulator | Yes | - | - | - |
| Certifications | Track own | - | - | - |
| Mentorship | Receive | - | - | - |
| Community | Full access | - | - | - |

## HR & Workforce (Business-Only)

| Feature | Individual | Recruiter | Business | Admin |
|---------|-----------|-----------|----------|-------|
| Internal job board | - | - | Yes | - |
| HRIS integration | - | - | Yes | - |
| Workforce planning | - | - | Yes | - |
| Succession planning | - | - | Yes | - |
| Performance management | - | - | Yes | - |
| Contract workers | - | - | Yes | - |
| SSO configuration | - | - | Yes | - |

## Platform Administration (Admin-Only)

| Feature | Individual | Recruiter | Business | Admin |
|---------|-----------|-----------|----------|-------|
| User management | - | - | - | Yes |
| Feature flags | - | - | - | Yes |
| Plan management | - | - | - | Yes |
| AI monitoring | - | - | - | Yes |
| Bias auditing | - | - | - | Yes |
| Fraud detection | - | - | - | Yes |
| Job aggregation | - | - | - | Yes |
| White-label | - | - | - | Yes |
| Data migration | - | - | - | Yes |

## Approximate Feature Count by Dashboard

| User Type | Dashboard Routes | Key Feature Areas |
|-----------|-----------------|-------------------|
| Individual | ~52 | Profile, jobs, learning, career, community |
| Recruiter | ~95 | Recruitment, clients, AI, offers, compliance, marketing |
| Business | ~47 | Jobs, HR, screening, analytics, compliance |
| Admin | ~27 | Users, config, AI, compliance, billing |

The Recruiter has the largest feature set, reflecting the depth of the recruitment ATS/CRM tooling.

## References

- [[entities/individual-user]] — Full Individual details
- [[entities/recruiter-user]] — Full Recruiter details
- [[entities/business-user]] — Full Business details
- [[entities/admin-user]] — Full Admin details
- Source: [[sources/repo-audit-2026-04-07]]
