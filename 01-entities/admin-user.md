---
title: "Admin (Platform Operator)"
type: entity
created: 2026-04-07
updated: 2026-04-08
tags: [user-type, admin, platform, operations]
sources: [repo-audit-2026-04-07, features-inventory-2026-04-07]
status: active
confidence: high
dashboard-path: /admin/*
endpoint-count: 104
---

# Admin (Platform Operator)

The **Admin** is the platform operator who manages Sebenza Hub itself. They configure features, manage users, monitor AI systems, enforce compliance, handle billing, and keep the platform healthy. Admins bypass all permission checks.

**Role value in database:** `"admin"`
**No dedicated profile table** — admin status is determined by `users.role = "admin"`.

## Dashboard Routes

All Admin features live under `/admin/*`. **Total pages: 104** — the largest dashboard in the platform.

## Features by Category

### Overview & Health

| Feature | Route | Description |
|---------|-------|-------------|
| Overview | `/overview` | Platform-wide analytics and metrics |
| Dashboard | `/dashboard` | Admin command centre |
| Platform Health | `/platform-health` | System uptime, performance, errors |
| Usage Analytics | `/usage-analytics` | Feature adoption and usage tracking |
| Profile | `/profile` | Admin profile management |

### User Management

| Feature | Route | Description |
|---------|-------|-------------|
| Individuals | `/individuals` | View/manage all Individual accounts |
| Individual Detail Sheet | `/individual-detail-sheet` | Detailed Individual user view |
| Individual Analytics Tab | `/individual-analytics-tab` | Individual user analytics |
| Individual Bulk Actions | `/individual-bulk-actions` | Bulk operations on Individual users |
| Individual Demographics Tab | `/individual-demographics-tab` | Demographics breakdown |
| Individual Engagement Tab | `/individual-engagement-tab` | Engagement metrics per Individual |
| Individual Pipeline Tab | `/individual-pipeline-tab` | Pipeline view per Individual |
| Individual Skills Tab | `/individual-skills-tab` | Skills analysis per Individual |
| Recruiters | `/recruiters` | View/manage all Recruiter accounts |
| Businesses | `/businesses` | View/manage all Business accounts |
| Candidates | `/candidates` | Search and manage candidate records |
| CVs | `/cvs` | CV library management, flagging, tagging |

### Roles & Access Control (RBAC)

| Feature | Route | Description |
|---------|-------|-------------|
| Roles | `/roles` | Role-based access control configuration |
| Granular RBAC | `/granular-rbac` | Fine-grained permission management |
| Roles Overview Tab | `/roles-overview-tab` | RBAC system overview |
| Roles Definitions Tab | `/roles-definitions-tab` | Role definitions management |
| Roles Assignments Tab | `/roles-assignments-tab` | Role assignment management |
| Roles Permission Matrix Tab | `/roles-permission-matrix-tab` | Permission matrix view |
| Roles Templates Tab | `/roles-templates-tab` | Role templates library |
| Roles Workflows Tab | `/roles-workflows-tab` | Role-related workflows |
| Roles Analytics Tab | `/roles-analytics-tab` | RBAC usage analytics |
| Roles Audit Log Tab | `/roles-audit-log-tab` | RBAC audit trail |
| Roles Compliance Tab | `/roles-compliance-tab` | RBAC compliance checks |
| Roles Governance Tab | `/roles-governance-tab` | RBAC governance policies |
| Roles Access Reviews Tab | `/roles-access-reviews-tab` | Periodic access reviews |
| Roles Advisor Tab | `/roles-advisor-tab` | AI role recommendations |
| Roles Intelligence Tab | `/roles-intelligence-tab` | Role intelligence insights |
| Roles Sandbox Tab | `/roles-sandbox-tab` | Test permission changes safely |
| Roles Simulator Tab | `/roles-simulator-tab` | Simulate role assignments |
| Roles Timeline Tab | `/roles-timeline-tab` | Role change history |

### Feature Management

| Feature | Route | Description |
|---------|-------|-------------|
| Features | `/features` | Feature flag management and toggles |
| Features Setup | `/features-setup` | Feature setup wizard |
| Feature Command Center | `/feature-command-center` | Centralized feature operations |
| Feature Lifecycle | `/feature-lifecycle` | Feature lifecycle management |
| Feature Health Score | `/feature-health-score` | Feature health monitoring |
| Feature Usage Pulse | `/feature-usage-pulse` | Real-time feature usage |
| Feature Adoption Funnel | `/feature-adoption-funnel` | Feature adoption tracking |
| Feature Smart Alerts | `/feature-smart-alerts` | Automated feature alerts |
| Feature Experimentation | `/feature-experimentation` | Feature A/B testing |
| Feature Governance Board | `/feature-governance-board` | Feature governance policies |
| Feature Genome Map | `/feature-genome-map` | Feature dependency visualization |
| Feature Impact Simulator | `/feature-impact-simulator` | Simulate feature changes |
| Feature Journey Orchestrator | `/feature-journey-orchestrator` | Feature rollout orchestration |
| Feature Sentiment Analysis | `/feature-sentiment-analysis` | User sentiment on features |
| Feature Churn Predictor | `/feature-churn-predictor` | Predict churn from feature changes |
| Feature Cannibalization | `/feature-cannibalization` | Detect feature overlap |
| Feature Competitive Intel | `/feature-competitive-intel` | Competitive feature analysis |
| Feature AI Roadmap | `/feature-ai-roadmap` | AI-assisted feature planning |
| Feature AI Packaging Lab | `/feature-ai-packaging-lab` | AI-driven feature packaging |
| Feature Entitlement Sandbox | `/feature-entitlement-sandbox` | Test entitlement configurations |
| Feature Revenue Attribution | `/feature-revenue-attribution` | Revenue per feature tracking |
| Feature Revenue X-Ray | `/feature-revenue-x-ray` | Deep revenue analysis by feature |
| Feature Cost Allocator | `/feature-cost-allocator` | Feature cost allocation |
| Feature Dynamic Pricing | `/feature-dynamic-pricing` | Dynamic pricing experiments |

### Billing & Plans

| Feature | Route | Description |
|---------|-------|-------------|
| Plans | `/plans` | Subscription plan management (18 plans) |
| Billing | `/billing` | Revenue analytics, payment gateways, invoices, coupons |

### AI Monitoring & Governance

| Feature | Route | Description |
|---------|-------|-------------|
| AI Monitoring | `/ai-monitoring` | Monitor AI usage, costs, quality |
| AI Model Monitoring | `/ai-model-monitoring` | Track AI model performance |
| AI Dashboard Tab | `/ai-dashboard-tab` | AI overview dashboard |
| Request Analytics Tab | `/request-analytics-tab` | AI request analytics |
| Model Performance Tab | `/model-performance-tab` | Model performance metrics |
| Model Registry Tab | `/model-registry-tab` | AI model registry |
| Cost Optimizer Tab | `/cost-optimizer-tab` | AI cost optimization |
| Governance Tab | `/governance-tab` | AI governance policies |
| Predictive Tab | `/predictive-tab` | Predictive AI analytics |
| Live Feed Tab | `/live-feed-tab` | Real-time AI activity feed |
| Autopilot Tab | `/autopilot-tab` | AI autopilot configuration |
| A/B Testing Tab | `/ab-testing-tab` | AI A/B test management |
| Anomaly Detection Tab | `/anomaly-detection-tab` | AI anomaly detection |
| Safety Guardrails Tab | `/safety-guardrails-tab` | AI safety configuration (implied) |
| Playground Tab | `/playground-tab` | AI model playground (implied) |
| Prompt Studio Tab | `/prompt-studio-tab` | Prompt engineering tools (implied) |
| Smart Router Tab | `/smart-router-tab` | AI request routing (implied) |
| Providers Tab | `/providers-tab` | AI provider management (implied) |
| Settings Tab | `/settings-tab` | AI settings (implied) |

### Bias Auditing

| Feature | Route | Description |
|---------|-------|-------------|
| AI Bias Auditing | `/ai-bias-auditing` | AI fairness monitoring and demographic audits |
| Bias Fairness Tab | `/bias-fairness-tab` | Fairness metrics overview |
| Bias Alert Center | `/bias-alert-center` | Bias alert management |
| Bias Benchmarking Hub | `/bias-benchmarking-hub` | Bias benchmarking across models |
| Bias Causal Debugger | `/bias-causal-debugger` | Root cause analysis for bias |
| Bias Fairness Copilot | `/bias-fairness-copilot` | AI-assisted fairness recommendations |
| Bias Human Impact | `/bias-human-impact` | Human impact assessment |
| Bias Intersectional Lab | `/bias-intersectional-lab` | Intersectional bias analysis |
| Bias Live Pulse | `/bias-live-pulse` | Real-time bias monitoring |
| Bias Reporting Studio | `/bias-reporting-studio` | Bias report generation |
| Bias Simulation Engine | `/bias-simulation-engine` | Simulate bias scenarios |

### Fraud Detection

| Feature | Route | Description |
|---------|-------|-------------|
| Fraud Detection | `/fraud` | Detect and prevent fraudulent activity |

### Data & Compliance

| Feature | Route | Description |
|---------|-------|-------------|
| Compliance Reports | `/compliance-reports` | Generate POPIA, B-BBEE, EE reports |
| Data Migration | `/data-migration` | Bulk data import/export tools |

### Content & Integrations

| Feature | Route | Description |
|---------|-------|-------------|
| Job Aggregator | `/job-aggregator` | Aggregate jobs from Adzuna, CareerJet — see [[01-entities/job-aggregation]] |
| SEO | `/seo` | SEO configuration |
| Multi-Language | `/multi-language` | Translation and language management |
| White-Label | `/white-label` | Customize branding for resellers |

### WhatsApp Administration

| Feature | Route | Description |
|---------|-------|-------------|
| WhatsApp | `/whats-app` | WhatsApp integration administration — see [[01-entities/whatsapp-bot]] |
| WhatsApp Analytics Deep Dive | `/whats-app-analytics-deep-dive` | In-depth WhatsApp analytics |
| WhatsApp Bot Templates | `/whats-app-bot-templates` | Manage bot response templates |
| WhatsApp Candidate Matcher | `/whats-app-candidate-matcher` | WhatsApp-based candidate matching |
| WhatsApp Chatbot Training | `/whats-app-chatbot-training` | Train the WhatsApp chatbot |
| WhatsApp Contact Intelligence | `/whats-app-contact-intelligence` | Contact insights and enrichment |
| WhatsApp Conversation DNA | `/whats-app-conversation-dna` | Conversation pattern analysis |
| WhatsApp Conversation Replay | `/whats-app-conversation-replay` | Replay and review conversations |
| WhatsApp Escalation War Room | `/whats-app-escalation-war-room` | Manage escalated conversations |
| WhatsApp Flow Builder | `/whats-app-flow-builder` | Build automated conversation flows |
| WhatsApp Growth Engine | `/whats-app-growth-engine` | WhatsApp user growth tools |
| WhatsApp Team Inbox | `/whats-app-team-inbox` | Team-based WhatsApp inbox |

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
2. **Feature control** — Toggle features on/off, configure entitlements per plan (24 feature management pages)
3. **Billing** — Manage subscription plans, pricing, coupons, revenue tracking
4. **Compliance** — Generate statutory reports (POPIA, B-BBEE, EE)
5. **AI governance** — Monitor AI costs, quality, and bias (19+ AI monitoring pages, 11 bias auditing pages)
6. **RBAC management** — Fine-grained role and permission control (18 RBAC pages)
7. **Fraud prevention** — Detect fake accounts, ghost jobs, suspicious activity
8. **Content** — Manage job aggregation from external sources
9. **Platform health** — Monitor uptime, performance, errors
10. **WhatsApp administration** — 12 dedicated WhatsApp management pages

## Open Questions

- How are admin accounts created? Is there a setup flow or are they seeded?
- What's the admin notification system for platform issues?
- Are there multiple admin tiers (super-admin vs regular admin)?

## References

- [[01-entities/individual-user]] — Users managed by Admin
- [[01-entities/recruiter-user]] — Users managed by Admin
- [[01-entities/business-user]] — Users managed by Admin
- [[02-concepts/rbac]] — Permission system that Admin bypasses
- [[02-concepts/ai-features]] — AI systems that Admin monitors
- [[02-concepts/compliance]] — Compliance that Admin enforces
- [[02-concepts/billing-system]] — Billing that Admin manages
- [[01-entities/job-aggregation]] — Job aggregation configuration
- [[01-entities/whatsapp-bot]] — WhatsApp bot management (12 admin pages)
- [[02-concepts/seo-strategy]] — SEO management
- [[06-comparisons/user-type-comparison]] — Feature comparison
- Source: [[09-sources/repo-audit-2026-04-07]]
- Source: [[09-sources/features-inventory-2026-04-07]]
