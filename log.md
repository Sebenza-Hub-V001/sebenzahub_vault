# Activity Log

## [2026-04-06] bootstrap | Wiki initialised
- Created directory structure: raw/, entities/, concepts/, sources/, comparisons/, decisions/, questions/, tasks/
- Created starter files: index.md, log.md, overview.md
- Wiki is ready for its first source ingestion.

## [2026-04-07] ingest | Codebase Audit
- Source: `C:\Users\User\Desktop\Sebenza_Hub_Claude\Sebenza_Hub_Claude_V2` (full repo)
- Summary: [[sources/repo-audit-2026-04-07]]
- New pages created:
  - [[entities/sebenza-hub]] — Platform entity
  - [[entities/individual-user]] — Job seeker user type
  - [[entities/recruiter-user]] — Talent agency user type
  - [[entities/business-user]] — Employer user type
  - [[entities/admin-user]] — Platform operator user type
  - [[concepts/authentication]] — Magic link auth system
  - [[concepts/rbac]] — Role-based access control
  - [[concepts/multi-tenancy]] — Organization model
  - [[concepts/application-lifecycle]] — Hiring pipeline
  - [[concepts/ai-features]] — AI capabilities (OpenAI, Anthropic, Google)
  - [[concepts/compliance]] — POPIA, B-BBEE, Employment Equity
  - [[concepts/billing-system]] — Subscriptions and credits
  - [[concepts/whatsapp-integration]] — WhatsApp Business API
  - [[concepts/tech-stack]] — Full technology stack
  - [[comparisons/user-type-comparison]] — Feature matrix across 4 user types
- Pages touched: overview.md, index.md
- Contradictions flagged: none (first ingestion)
- Key stats: 755 DB tables, 3586 API endpoints, 464 frontend pages, 4 user types

## [2026-04-07] evolve | Wiki Improvements
- Updated CLAUDE.md with Sebenza Hub domain-specific extension (replaced generic examples)
- Created 4 deeper entity pages:
  - [[entities/offer-system]] — 12 tables, approval workflows, negotiation, AI strategy
  - [[entities/screening-system]] — CV screening, chatbot, tests, background checks
  - [[entities/linkedin-integration]] — OAuth, lead gen forms, AI scoring, nurture sequences
  - [[entities/community-learning-hub]] — Forum, mentorship, learning, skill verification
- Created 4 open question pages:
  - [[questions/recruiter-business-relationship]] — Vendor relationship flow
  - [[questions/trust-tier-calculation]] — Trust tier algorithm
  - [[questions/subscription-plans]] — 18 plan details
  - [[questions/ai-provider-selection]] — AI provider routing
- Created 3 user journey workflow pages:
  - [[workflows/individual-journey]] — Signup → Hired
  - [[workflows/recruiter-journey]] — Signup → Placement Fee
  - [[workflows/business-journey]] — Signup → Hire
- Copied 6 raw source documents from repo into raw/:
  - features-inventory.md, individual-features.md, recruitment-features.md
  - ai-enhancement-opportunities.md, seo-plan.md, whatsapp-bot-training-manual.md
- Updated tasks/todo.md with wiki maintenance backlog
- Created workflows/ directory
- Total wiki pages: 27 (+6 raw docs)
