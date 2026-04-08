---
title: "Admin Journey: The Platform Operator Experience"
type: concept
created: 2026-04-08
updated: 2026-04-08
tags: [workflow, admin, journey, platform, operations, governance]
sources: [repo-audit-2026-04-07, dashboard-layouts]
status: active
confidence: high
user-types: [admin]
dashboard-path: /admin/*
---

# Admin Journey: The Platform Operator Experience

The Admin operates the platform itself — not hiring, not job-seeking, but keeping the machine running. The **operations path** (Steps 1–4) covers the daily work: monitoring health, managing users, curating content, and managing billing. **Parallel tracks** handle the less frequent but critical work: AI governance, trust & safety, and platform configuration.

```
                    ┌───────────────────────────────────────┐
                    │       OPERATIONS PATH (Steps 1–4)     │
                    │  Monitor → Users → Content → Billing  │
                    └──────┬──────────┬──────────┬──────────┘
                           │          │          │
              ┌────────────┘    ┌─────┘    ┌─────┘
              ▼                 ▼          ▼
     ┌────────────────┐ ┌───────────┐ ┌──────────────┐
     │ AI Governance  │ │ Trust &   │ │  Platform    │
     │ (on drift)     │ │ Safety    │ │  Config      │
     │                │ │ (on flag) │ │ (on change)  │
     └────────────────┘ └───────────┘ └──────────────┘
```

Unlike other user types, the Admin has **no onboarding flow** — admin accounts are seeded or created directly in the database. There's no `/onboarding` step.

---

## Step 1: Monitor Platform Health

The Admin's day starts here. If the platform is down, nothing else matters.

```
/admin/overview → Platform-wide metrics at a glance
  ├─ Active users across all types
  ├─ Applications submitted today/week
  ├─ Revenue metrics
  └─ System alerts
    ↓
/admin/platform-health → Technical health
  ├─ Uptime, response times, error rates
  ├─ Database performance
  ├─ API endpoint status
  └─ Alert on degradation
    ↓
/admin/usage-analytics → Feature adoption
  ├─ Which features are being used (and which aren't)
  ├─ Usage by user type
  ├─ Trend analysis — growing or declining engagement
  └─ Informs decisions: deprecate unused features, promote underused ones
```

## Step 2: Manage Users

```
/admin/individuals → View/manage all job seekers
  ├─ Search, filter, suspend, deactivate accounts
  └─ View profile completeness, activity, application history
    ↓
/admin/recruiters → View/manage all recruitment agencies
  ├─ Verification status, trust tier, compliance
  └─ Performance metrics (placements, success rate)
    ↓
/admin/businesses → View/manage all employer accounts
  ├─ Organization size, plan, activity level
  └─ Compliance status (B-BBEE, POPIA)
    ↓
/admin/candidates → Search candidate records across the platform
    ↓
/admin/roles → Configure RBAC
  ├─ Define role permissions (40+ granular permissions)
  ├─ Create custom roles
  └─ Assign permissions per category: jobs, candidates, pipeline,
      interviews, offers, clients, billing, analytics, team, comms
```

See [[02-concepts/rbac]] for the full permission model.

## Step 3: Curate Content & Jobs

```
/admin/cvs → CV library management
  ├─ Flag inappropriate content
  ├─ Add internal notes and tags
  └─ Curate talent pools (admin_cv_pools)
    ↓
/admin/job-aggregator → External job feeds
  ├─ Configure Adzuna and CareerJet API connections
  ├─ Set import rules (industries, locations, refresh frequency)
  └─ Monitor feed health — stale or broken integrations
    ↓
/admin/seo → SEO configuration
  ├─ Meta tags, JSON-LD schemas, sitemap settings
  ├─ Open Graph configuration
  └─ Monitor Core Web Vitals
```

See [[01-entities/job-aggregation]] and [[02-concepts/seo-strategy]] for details.

## Step 4: Manage Billing & Plans

```
/admin/billing → Revenue and payment management
  ├─ Revenue analytics (MRR, churn, ARPU)
  ├─ Payment gateway configuration
  ├─ Invoice management
  ├─ Coupon and discount codes
  └─ Churn prevention tools
    ↓
/admin/plans → Subscription plan management (18 plans)
  ├─ Define plans per user type
  ├─ Set pricing (ZAR)
  ├─ Configure trial periods
  └─ Manage plan upgrades/downgrades
    ↓
/admin/features → Feature entitlements
  ├─ 157 seeded features mapped to plans
  ├─ Toggle features on/off globally
  ├─ Configure boolean vs metered (credit-based) features
  └─ Control what each plan can access at runtime
```

See [[02-concepts/billing-system]] for the full billing architecture.

---

# Parallel Tracks

These tracks don't run daily — they activate when something triggers them: AI costs spike, fraud is detected, a new market requires configuration.

---

## Track A: AI Governance — "Is the AI behaving?"

AI runs across 383+ endpoints and 3 providers. This track activates when costs spike, quality drops, or bias is detected.

### Scenario: AI costs doubled this month

```
/admin/ai-monitoring → AI Command Center
  ├─ Usage per provider (OpenAI, Anthropic, Google Gemini)
  ├─ Cost per feature (which AI features are most expensive?)
  ├─ Quality metrics (accuracy, latency per model)
  └─ Alert: "CV Review costs up 120% — 3x more users this month"
    ↓
Decision:
  ├─ Costs justified by growth → no action
  ├─ One feature is disproportionately expensive → throttle or switch provider
  └─ Rate-limit heavy users → configure per-plan AI credit limits in /features
```

### Scenario: Bias detected in AI screening

```
/admin/bias-auditing → AI fairness monitoring
  ├─ Demographic breakdown of AI decisions
  ├─ "AI match scores for female candidates are 12% lower on average"
  └─ Flag: potential gender bias in matching algorithm
    ↓
Investigation:
  ├─ Is the bias in the training data, the prompt, or the scoring logic?
  ├─ Compare across providers — does switching model reduce bias?
  └─ Document findings in audit trail
    ↓
/admin/features-setup → Adjust AI configuration
  ├─ Change which provider handles matching
  ├─ Update feature parameters
  └─ Re-run bias audit after changes
```

### Scenario: New AI features need configuration

```
/admin/features-setup → AI Features Setup wizard
  ├─ Enable/disable AI features per user type
  ├─ Select provider per feature (OpenAI vs Anthropic vs Gemini)
  ├─ Set rate limits and credit costs
  └─ Configure fallback behaviour when provider is unavailable
```

See [[02-concepts/ai-features]] for the full AI capability map.

---

## Track B: Trust & Safety — "Something looks wrong"

Activates when fraud signals fire, users report abuse, or compliance reporting is due.

### Scenario: Spike in fake job postings

```
/admin/fraud → Fraud detection dashboard
  ├─ Automated flags: duplicate postings, suspicious salary ranges,
  │   new accounts with immediate bulk posting
  ├─ Ghost job risk scores (ghostRiskScore from AI)
  └─ Flag: "15 jobs posted by 3 new accounts in 24 hours — all similar JDs"
    ↓
Action:
  ├─ Review flagged accounts
  ├─ Suspend accounts pending verification
  ├─ Remove fraudulent job postings
  └─ Log actions in audit trail (fraud_audit_log)
```

### Scenario: POPIA compliance report requested by regulator

```
/admin/compliance-reports → Generate statutory reports
  ├─ POPIA: data collection practices, consent records, retention policies
  ├─ B-BBEE: platform-wide transformation contribution data
  ├─ Employment Equity: hiring demographics across all employers
  └─ Export in Department of Labour-ready format
    ↓
Supporting data:
  ├─ audit_trail → every action logged immutably
  ├─ migration_compliance_audit → data migration compliance
  └─ ai_audit_events → AI decision audit trail
```

See [[02-concepts/compliance]] for POPIA, B-BBEE, and Employment Equity details.

---

## Track C: Platform Configuration — "We're changing something"

Activates when entering new markets, rebranding, or reconfiguring platform-wide settings.

### Scenario: White-labelling the platform for a partner

```
/admin/white-label → Customize branding
  ├─ Logo, colours, fonts, domain
  ├─ Custom email templates with partner branding
  └─ Partner-specific feature toggles
```

### Scenario: Adding a new language

```
/admin/multi-language → Translation management
  ├─ Add new language
  ├─ Upload translation files
  └─ Set default language per region
```

### Scenario: WhatsApp bot needs reconfiguration

```
/admin/whatsapp → WhatsApp administration
  ├─ WhatsApp Business API configuration
  ├─ Bot flow management (9 node types in visual builder)
  ├─ Template message approval
  ├─ Language settings (6 SA languages)
  └─ DNA Analyzer, War Room, Growth Engine
```

See [[01-entities/whatsapp-bot]] for the full WhatsApp bot architecture.

### Scenario: Migrating data from another system

```
/admin/data-migration → Bulk data import/export
  ├─ Import candidates, jobs, companies from external ATS
  ├─ Field mapping wizard
  ├─ Validation and de-duplication
  └─ Compliance audit generated for every migration
```

---

## Supporting Infrastructure

### Knowledge Base (`/admin/wiki`)

Admin wiki for internal documentation, runbooks, and operational procedures. Three views: dashboard, viewer, pages.

### Admin Profile (`/admin/profile`)

Admin's own account settings.

---

## How It All Connects

```
OPERATIONS:  Monitor → Users → Content → Billing
                │         │       │         │
                │         │       │         │
AI GOVERNANCE:  │      Bias in   │      AI costs    Feature
                │     screening  │      spiking     setup
                │         │       │         │         │
TRUST/SAFETY:   │      Fraud    Job      Compliance  │
                │      detect   aggreg.   reports     │
                │         │       │         │         │
CONFIG:         │      Roles    SEO     White-label  Plans
                │         │       │      Multi-lang   │
                │         │       │      WhatsApp     │
                ▼         ▼       ▼         ▼         ▼
             [Platform runs, users succeed, compliance met]
```

## Key Touchpoints with Other User Types

| Responsibility | Affects |
|---------------|---------|
| User management | [[01-entities/individual-user]], [[01-entities/recruiter-user]], [[01-entities/business-user]] |
| Feature toggles | All user types — controls what they can access |
| Plan management | All user types — determines billing and entitlements |
| AI governance | All AI-powered features across all dashboards |
| Compliance reporting | Recruiter and Business compliance data |
| WhatsApp admin | [[01-entities/whatsapp-bot]] configuration |
| Job aggregation | [[01-entities/job-aggregation]] — feeds Individual job board |

## References

- [[01-entities/admin-user]] — Full feature list and data model
- [[15-dashboards/admin-dashboard]] — Dashboard layout (24 pages)
- [[02-concepts/rbac]] — Permission system (Admin bypasses all checks)
- [[02-concepts/ai-features]] — AI systems monitored by Admin
- [[02-concepts/compliance]] — Compliance enforced by Admin
- [[02-concepts/billing-system]] — Billing managed by Admin
- [[02-concepts/seo-strategy]] — SEO configured by Admin
- [[01-entities/job-aggregation]] — Job feeds managed by Admin
- [[01-entities/whatsapp-bot]] — WhatsApp bot (20 admin tabs)
