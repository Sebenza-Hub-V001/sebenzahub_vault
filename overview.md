---
title: "Sebenza Hub — Overview"
type: overview
created: 2026-04-07
updated: 2026-04-07
tags: [overview, synthesis, platform]
status: active
confidence: high
---

# Sebenza Hub — Overview

Sebenza Hub is a **multi-sided recruitment and career platform** built for the South African employment market. It connects four distinct user types — Individuals (job seekers), Recruiters (talent agencies), Businesses (employers), and Admins (platform operators) — through a unified web application with deep AI integration, WhatsApp-first communication, and South African compliance baked in (POPIA, B-BBEE, Employment Equity).

## The Four Pillars

The entire platform revolves around four user types, each with its own dashboard, features, and workflows:

| User Type | Role | Core Purpose |
|-----------|------|--------------|
| **[[entities/individual-user]]** | Job Seeker | Find jobs, build skills, manage career |
| **[[entities/recruiter-user]]** | Talent Agency | Source candidates, manage clients, earn placement fees |
| **[[entities/business-user]]** | Employer / Corporate HR | Post jobs, hire directly, manage workforce |
| **[[entities/admin-user]]** | Platform Operator | Configure platform, monitor health, ensure compliance |

See [[comparisons/user-type-comparison]] for a detailed side-by-side feature matrix.

## How They Connect

```
Individual ←→ Job ←→ Recruiter
                ↕
             Business
                ↕
              Admin (oversees all)
```

- **Individuals** search and apply for jobs posted by Recruiters or Businesses.
- **Recruiters** source Individuals and submit them to Business clients, earning placement fees.
- **Businesses** post jobs directly and/or work with Recruiters as vendors.
- **Admins** manage the platform, configure features, monitor AI, and enforce compliance.

The key relationship triangle: Recruiters act as **intermediaries** between Individuals and Businesses. A Business can hire directly (bypassing recruiters) or through a Recruiter (who earns a fee). See [[concepts/application-lifecycle]] for the full flow.

## Scale

| Component | Count |
|-----------|-------|
| Database tables | 755 |
| API endpoints | 3,586 |
| Frontend pages | 464 |
| Reusable UI components | 496 |
| E2E test suites | 66 |
| Subscription plans | 18 |

## Key Systems

- **[[concepts/authentication]]** — Passwordless magic-link login via email (Resend)
- **[[concepts/rbac]]** — Role-based access control with 40+ granular permissions
- **[[concepts/multi-tenancy]]** — Organizations as tenant containers for Recruiters and Businesses
- **[[concepts/application-lifecycle]]** — The full journey from job post → apply → screen → interview → offer → hire
- **[[concepts/ai-features]]** — OpenAI, Anthropic Claude, and Google Gemini powering matching, screening, interviews, and more
- **[[concepts/compliance]]** — POPIA (privacy), B-BBEE (economic empowerment), Employment Equity
- **[[concepts/billing-system]]** — Tiered subscription plans, credits, usage metering
- **[[concepts/whatsapp-integration]]** — WhatsApp Business API for apply-via-WhatsApp, campaigns, chatbots
- **[[concepts/tech-stack]]** — React + Vite frontend, Express.js backend, PostgreSQL (Neon), Drizzle ORM, deployed on Railway

## South African Focus

Sebenza Hub is purpose-built for South Africa:

- **B-BBEE levels** tracked for recruiters and businesses (Level 1–8)
- **POPIA compliance** with consent tracking and data retention policies
- **Employment Equity** data capture (race, gender, disability) for statutory reporting
- **ZAR currency** defaults, South African provinces and cities
- **WhatsApp-first** communication (dominant messaging platform in SA)
- **SETA learnerships** integrated into the learning hub

## Current State

This is a feature-rich, production-deployed platform at `sebenzahub.co.za` with staging at Railway. The codebase is large and complex — this wiki exists to map the "spider web" and make the system understandable.

## References

- [[entities/sebenza-hub]] — Platform entity page
- [[comparisons/user-type-comparison]] — Feature matrix across all 4 user types
- [[sources/repo-audit-2026-04-07]] — Initial codebase audit
