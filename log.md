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

## [2026-04-07] evolve | Added Tweets section
- Added `tweets/` directory and page type
- Added "Tweet" operation (#5) to CLAUDE.md with full workflow
- Updated directory structure, domain extension, index format in CLAUDE.md
- Updated index.md with Tweets section
- Purpose: Ingest AI tweets → extract insights → recommend Sebenza Hub improvements

## [2026-04-07] tweet | Karpathy — LLM Knowledge Bases
- Source: https://x.com/karpathy/status/2039805659525644595
- Filed: [[tweets/karpathy-llm-knowledge-bases]]
- Recommendations: 6 (top: AI-compiled company research for Individuals, LLM-maintained talent market wiki, knowledge base for screening bot)
- Pages touched: none (recommendations filed, not yet implemented)

## [2026-04-07] tweet | Farza — Farzapedia Personal Wiki
- Source: https://x.com/FarzaTV/status/2040563939797504467
- Filed: [[tweets/farzatv-farzapedia-personal-wiki]]
- Recommendations: 5 (top: agent-queryable candidate wikis for Recruiters, personal career wiki for Individuals, agent-first data architecture)
- Pages touched: [[tweets/karpathy-llm-knowledge-bases]] (cross-reference added)

## [2026-04-07] ingest | Batch ingest of 6 raw source documents
- Ingested all 6 raw docs that were previously copied but not formally processed
- Source summaries created:
  - [[sources/features-inventory-2026-04-07]] — Platform feature inventory (325 pages, 157 features, 18 plans)
  - [[sources/individual-features-2026-04-07]] — 56+ Individual features (profile, job search, applications, AI tools, learning, career, community)
  - [[sources/recruitment-features-2026-04-07]] — 95+ Recruiter features (recruitment, evaluation, AI, talent, scheduling, analytics, revenue engine, governance)
  - [[sources/ai-enhancement-opportunities-2026-04-07]] — 56 AI enhancement opportunities (83% of pages lack AI, 5 quick wins, 8 high-value medium effort)
  - [[sources/seo-plan-2026-04-07]] — SEO strategy (mature foundation, SSR gap, 10K monthly organic target)
  - [[sources/whatsapp-bot-training-manual-2026-04-07]] — WhatsApp bot operational manual (20 admin tabs, 6 SA languages, flow builder)
- Contradictions flagged:
  - Page count: features inventory lists 325 routes vs repo audit's 464 (likely counting methodology difference)
  - WhatsApp language support: bot greets in 6 SA languages, but AI enhancement audit flags multi-language AI as unimplemented (template-based vs full AI conversation)

## [2026-04-07] evolve | New entity and concept pages
- New pages created:
  - [[entities/whatsapp-bot]] — Deep-dive entity page for the WhatsApp bot (20 admin tabs, flow builder, DNA analyzer, war room)
  - [[entities/job-aggregation]] — Job aggregation entity page (Adzuna + CareerJet APIs)
  - [[concepts/seo-strategy]] — SEO strategy concept page (implementation status, keyword strategy, goals)
- Pages touched:
  - [[concepts/ai-features]] — Added AI enhancement opportunities section, infrastructure gaps, priority matrix
  - [[concepts/whatsapp-integration]] — Added WhatsApp bot deep-dive section, Meta API details, language tension note
  - [[entities/sebenza-hub]] — Added SEO strategy, whatsapp-bot, and job-aggregation references
  - [[entities/admin-user]] — Added links to job-aggregation and whatsapp-bot
  - [[entities/individual-user]] — Added links to job-aggregation and community-learning-hub
  - [[entities/recruiter-user]] — Added links to whatsapp-bot, offer-system, screening-system, linkedin-integration

## [2026-04-07] query | Resolve open questions with new source data
- Updated all 4 open questions with information from newly ingested sources:
  - [[questions/recruiter-business-relationship]] — Confidence raised to medium. Confirmed recruiter-driven model with Revenue Engine (client pipeline, submissions, placements). Business-side vendor scoring identified as future AI feature.
  - [[questions/trust-tier-calculation]] — Confidence raised to medium. Confirmed input signals: placement rates, candidate NPS, client satisfaction, engagement scoring. Exact algorithm still needs code verification.
  - [[questions/subscription-plans]] — Confidence raised to medium. Found pricing hints from SEO plan (Individual ~R99/mo, Recruiter ~R999/mo, Business ~R1,999/mo). Confirmed 157 features (boolean + metered) distributed across plans.
  - [[questions/ai-provider-selection]] — Confidence raised to medium. Confirmed admin-configurable per-feature model selection via `ai_feature_configs`. Found 6+ admin AI management tabs.

## [2026-04-07] lint | Cross-reference audit
- Issues found: 5 orphan pages, 11 cross-reference gaps
- Fixed: all — added missing wiki-links across 7 pages
- Orphan pages resolved: entities/whatsapp-bot, entities/job-aggregation, concepts/seo-strategy (all newly created, now linked)
- Remaining orphans: tasks/todo.md, tasks/lessons.md (acceptable — task files)
- No broken wiki-links found (all content links resolve to existing files)

## [2026-04-07] ingest | Individual Journey Gap Analysis
- Source: `raw/articles/individual-journey-gap-analysis.md`
- Summary: [[sources/individual-journey-gap-analysis-2026-04-07]]
- Key action: **Full rewrite of [[workflows/individual-journey]]** — expanded from ~40% feature coverage to 100%, restructured from 13 linear steps to **7 hiring steps + 4 parallel tracks**
- Hiring path (Steps 1–7): kept sequential narrative, expanded Step 3 (Profile) and Step 5 (Applications) with missing features
- Parallel tracks (scenario-driven, not feature lists):
  - **Track A: AI Assistance** — 4 scenarios: applications not converting, dream job underqualified, low salary offer, autopilot setup
  - **Track B: Learning** — 3 scenarios: rejected for missing skills, career changer with no creds, upskilling while employed
  - **Track C: Community** — 3 scenarios: preparing for big interview, search stalled, giving back after hired
  - **Track D: Career Development** — 3 scenarios: career direction unclear, salary fairness, tracking overall performance
- Supporting infrastructure: Knowledge Base, Billing, Settings (referenced, not duplicated)
- Pages touched: [[workflows/individual-journey]], [[entities/individual-user]], [[entities/community-learning-hub]], [[concepts/ai-features]], [[concepts/billing-system]]
- New pages created: [[sources/individual-journey-gap-analysis-2026-04-07]]
- Contradictions flagged: none (gap analysis aligned with entity page data)

## [2026-04-07] evolve | Overview rewrite
- Rewrote overview.md with deeper synthesis from all 7 sources
- Key shifts:
  - Added "Three Products in One" framing (career platform, ATS+CRM, HR suite)
  - Highlighted AI underutilisation (83% gap) as biggest opportunity
  - Elevated WhatsApp as "platform within a platform"
  - Added "Emerging Themes" section: AI moat, WhatsApp strategic, recruiter revenue engine, business frontier, compliance differentiator
  - Added scale metrics comparison and page count discrepancy
- Total wiki pages: 39 (+6 raw docs)

## [2026-04-07] tweet | exploraX_ — 20 Agentic Skills for AI Models
- Source: https://x.com/explorax_/status/2039269234253934811
- Filed: [[tweets/explorax-20-agentic-skills]]
- Recommendations: 6 (top: AI Skills Registry to decouple AI behaviour from code, Content Repurposing for job postings across WhatsApp/LinkedIn/email, Competitive Intelligence Dashboard for recruiters)
- Pages touched: [[tweets/karpathy-llm-knowledge-bases]], [[tweets/farzatv-farzapedia-personal-wiki]] (cross-referenced)
- Total wiki pages: 41 (+7 raw docs)
