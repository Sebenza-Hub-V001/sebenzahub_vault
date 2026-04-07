---
title: "Admin (Platform Operator)"
type: entity
created: 2026-04-07
updated: 2026-04-07
tags: [user-type, admin, platform, operations]
sources: [repo-audit-2026-04-07]
status: active
confidence: high
---

# Admin (Platform Operator)

The **Admin** is the platform operator who manages Sebenza Hub itself. They configure features, manage users, monitor AI systems, enforce compliance, handle billing, and keep the platform healthy. Admins bypass all permission checks.

**Role value in database:** `"admin"`
**No dedicated profile table** — admin status is determined by `users.role = "admin"`.

## Dashboard Routes

All Admin features live under `/admin/*`.

## Features by Category

### Overview & Health

| Feature | Route | Description |
|---------|-------|-------------|
| Overview | `/overview` | Platform-wide analytics and metrics |
| Platform Health | `/platform-health` | System uptime, performance, errors |
| Dashboard | `/dashboard` | Admin command centre |
| Usage Analytics | `/usage-analytics` | Feature adoption and usage tracking |

### User Management

| Feature | Route | Description |
|---------|-------|-------------|
| Individuals | `/individuals` | View/manage all Individual accounts |
| Recruiters | `/recruiters` | View/manage all Recruiter accounts |
| Businesses | `/businesses` | View/manage all Business accounts |
| Candidates | `/candidates` | Search and manage candidate records |
| CVs | `/cvs` | CV library management, flagging, tagging |
| Roles | `/roles` | Role-based access control configuration |

### System Configuration

| Feature | Route | Description |
|---------|-------|-------------|
| Features | `/features` | Feature flag management and toggles |
| Features Setup | `/features-setup` | Feature setup wizard |
| Plans | `/plans` | Subscription plan management (18 plans) |
| Billing | `/billing` | Revenue analytics, payment gateways, invoices, coupons |
| Multi-Language | `/multi-language` | Translation and language management |
| White-Label | `/white-label` | Customize branding for resellers |
| SEO | `/seo` | SEO configuration |

### AI & Intelligence

| Feature | Route | Description |
|---------|-------|-------------|
| AI Monitoring | `/ai-monitoring` | Monitor AI usage, costs, quality |
| Bias Auditing | `/bias-auditing` | AI fairness monitoring and demographic audits |
| Fraud Detection | `/fraud` | Detect and prevent fraudulent activity |

### Data & Compliance

| Feature | Route | Description |
|---------|-------|-------------|
| Job Aggregator | `/job-aggregator` | Aggregate jobs from Adzuna, CareerJet — see [[entities/job-aggregation]] |
| Data Migration | `/data-migration` | Bulk data import/export tools |
| Compliance Reports | `/compliance-reports` | Generate POPIA, B-BBEE, EE reports |
| WhatsApp | `/whatsapp` | WhatsApp integration administration — see [[entities/whatsapp-bot]] |

## Data Model

Admin has no dedicated profile table. Their power comes from:

1. **`users.role = "admin"`** — Bypasses all `requireRole()` checks
2. **Admin-specific tables:**
   - `admin_cv_flags` — Flag candidates in CV screening
   - `admin_cv_notes` — Internal notes on CVs
   - `admin_cv_pools` — Curated talent pools
   - `admin_cv_tag_assignments` — Tag management

3. **Platform management tables:**
   - `feature_flags` — Enable/disable features globally
   - `feature_entitlements` — Control feature access per plan
   - `plans` — Define subscription tiers and pricing
   - `feature_governance_policies` — Feature governance rules
   - `organization_api_keys` — API key management
   - `sso_configs` — SSO provider configuration

4. **Audit & compliance tables:**
   - `fraud_audit_log` — Admin fraud reviews
   - `approval_audit_log` — Approval workflow audits
   - `ai_audit_events` — AI usage monitoring
   - `audit_trail` — General audit trail
   - `migration_compliance_audit` — Data migration compliance

## Access Model

```
Admin → requireRole("admin") → bypasses all permission checks
Admin → can access ALL /admin/* endpoints
Admin → can view/modify any user, job, application, or organization
Admin → can force role changes (post-onboarding)
```

The RBAC system (`/server/rbac.ts`) defines 40+ permissions across categories:
- Jobs, Candidates, Pipeline, Interviews, Offers
- Clients, Billing, Analytics, Team, Communications
- Data/Compliance, Admin, Audit

**Admin bypasses all of these.** Other roles must have explicit permission grants.

## Key Responsibilities

1. **User lifecycle** — Approve/suspend/deactivate accounts
2. **Feature control** — Toggle features on/off, configure entitlements per plan
3. **Billing** — Manage subscription plans, pricing, coupons, revenue tracking
4. **Compliance** — Generate statutory reports (POPIA, B-BBEE, EE)
5. **AI governance** — Monitor AI costs, quality, and bias
6. **Fraud prevention** — Detect fake accounts, ghost jobs, suspicious activity
7. **Content** — Manage job aggregation from external sources
8. **Platform health** — Monitor uptime, performance, errors

## Open Questions

- How are admin accounts created? Is there a setup flow or are they seeded?
- What's the admin notification system for platform issues?
- Are there multiple admin tiers (super-admin vs regular admin)?

## References

- [[entities/individual-user]] — Users managed by Admin
- [[entities/recruiter-user]] — Users managed by Admin
- [[entities/business-user]] — Users managed by Admin
- [[concepts/rbac]] — Permission system that Admin bypasses
- [[concepts/ai-features]] — AI systems that Admin monitors
- [[concepts/compliance]] — Compliance that Admin enforces
- [[concepts/billing-system]] — Billing that Admin manages
- [[entities/job-aggregation]] — Job aggregation configuration
- [[entities/whatsapp-bot]] — WhatsApp bot management (20 admin tabs)
- [[concepts/seo-strategy]] — SEO management
- [[comparisons/user-type-comparison]] — Feature comparison
- Source: [[sources/repo-audit-2026-04-07]]
