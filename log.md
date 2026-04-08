# Activity Log

## [2026-04-08] evolve | Dashboard Layout Update (All 4 User Types)
- Updated all 4 entity pages to reflect actual dashboard page counts from features inventory
- **Individual (85 pages):** Added 30+ new pages not previously documented — credential system (22 pages), document management (6 pages), dashboard/portal (3 pages), education/experience (5 pages), interview scheduling, cover letter
- **Recruiter (86 pages):** Reorganised into 12 categories. Added missing pages: AI Questions, AI Writer, Candidate Summary, Comparison views, Disagreement Analysis, Engagement Scoring, Reference Checks, Requirement Analyzer, Test Builder/Detail, Screening, WhatsApp Bot Dashboard. Updated route names to match codebase (e.g. `/linked-in-leads`, `/location-intelligence`, `/wa-campaigns`)
- **Business (15 pages):** Major correction — reduced from aspirational ~47 features to actual 15 built pages. Added "Features Not Yet Built" section documenting the gap vs Recruiter parity
- **Admin (104 pages):** Expanded from ~27 listed features to all 104 pages. Added Feature Management (24 pages), RBAC (18 pages), AI Monitoring (19 pages), Bias Auditing (11 pages), WhatsApp Admin (12 pages), Individual management sub-tabs (7 pages)
- Pages touched: [[01-entities/individual-user]], [[01-entities/recruiter-user]], [[01-entities/business-user]], [[01-entities/admin-user]], [[06-comparisons/user-type-comparison]], [[index]]
- Key insight: Admin dashboard (104 pages) is actually the **largest**, not Recruiter (86). Business (15 pages) has significant feature gap vs Recruiter.

## [2026-04-08] ingest | Business Journey Gap Analysis
- Source: Internal analysis comparing journey against entity page
- Summary: [[09-sources/business-journey-gap-analysis-2026-04-08]]
- Key action: **Full rewrite of [[03-workflows/business-journey]]** — expanded from ~65% feature coverage to 100%, restructured from 9 linear steps to **7 hiring steps + 4 parallel tracks**
- Hiring path (Steps 1–7): consolidated from 9 steps, expanded Step 7 (Offers — added templates, approvals, letters, predictive hiring)
- Parallel tracks (scenario-driven):
  - **Track A: Vendor Management & Active Sourcing** — 2 scenarios: role won't fill (direct vs recruiter paths), vendor underperforming + decision framework table
  - **Track B: Communication & Automation** — 2 scenarios: candidates dropping out from slow responses, team scattered across channels
  - **Track C: Compliance & Governance** — 3 scenarios: EE audit, POPIA data request, B-BBEE scorecard
  - **Track D: Workforce & HR** — 4 scenarios: CFO leaves (succession + internal board + workforce planning), contractor visibility, team composition before hiring, performance gaps driving hiring
- Pages touched: [[03-workflows/business-journey]], [[01-entities/business-user]]
- New pages created: [[09-sources/business-journey-gap-analysis-2026-04-08]]

## [2026-04-08] ingest | Recruiter Journey Gap Analysis
- Source: Internal analysis (same treatment as Individual journey gap analysis)
- Summary: [[09-sources/recruiter-journey-gap-analysis-2026-04-08]]
- Key action: **Full rewrite of [[03-workflows/recruiter-journey]]** — expanded from ~60% feature coverage to 100%, restructured from 10 linear steps to **10 recruitment steps + 4 parallel tracks**
- Recruitment path (Steps 1–10): kept sequential narrative, expanded Step 8 (Offers — added templates, benchmarking, predictor, compare, timeline, compliance, analytics), Step 10 (added referrals, onboarding checklists)
- Parallel tracks (scenario-driven, not feature lists):
  - **Track A: Communication & Automation** — 3 scenarios: candidates going cold, managing 30 active across channels, eliminating repetitive tasks
  - **Track B: Analytics & Intelligence** — 4 scenarios: slow fill with client pressure, inconsistent panels, proving agency value, AI candidate shortcuts
  - **Track C: Compliance & Governance** — 3 scenarios: EE audit, POPIA data request, fee dispute
  - **Track D: Brand & Growth** — 3 scenarios: inbound attraction via career site, new market expansion with location intel, referral-driven growth
- Supporting infrastructure: Billing, Settings, Rapid Workflow (referenced, not duplicated)
- Pages touched: [[03-workflows/recruiter-journey]], [[01-entities/recruiter-user]], [[02-concepts/compliance]]
- New pages created: [[09-sources/recruiter-journey-gap-analysis-2026-04-08]]

## [2026-04-06] bootstrap | Wiki initialised
- Created directory structure: 13-raw/, 01-entities/, 02-concepts/, 09-sources/, 06-comparisons/, 07-decisions/, 08-questions/, 12-tasks/
- Created starter files: index.md, log.md, overview.md
- Wiki is ready for its first source ingestion.

## [2026-04-07] ingest | Codebase Audit
- Source: `C:\Users\User\Desktop\Sebenza_Hub_Claude\Sebenza_Hub_Claude_V2` (full repo)
- Summary: [[09-sources/repo-audit-2026-04-07]]
- New pages created:
  - [[01-entities/sebenza-hub]] — Platform entity
  - [[01-entities/individual-user]] — Job seeker user type
  - [[01-entities/recruiter-user]] — Talent agency user type
  - [[01-entities/business-user]] — Employer user type
  - [[01-entities/admin-user]] — Platform operator user type
  - [[02-concepts/authentication]] — Magic link auth system
  - [[02-concepts/rbac]] — Role-based access control
  - [[02-concepts/multi-tenancy]] — Organization model
  - [[02-concepts/application-lifecycle]] — Hiring pipeline
  - [[02-concepts/ai-features]] — AI capabilities (OpenAI, Anthropic, Google)
  - [[02-concepts/compliance]] — POPIA, B-BBEE, Employment Equity
  - [[02-concepts/billing-system]] — Subscriptions and credits
  - [[02-concepts/whatsapp-integration]] — WhatsApp Business API
  - [[02-concepts/tech-stack]] — Full technology stack
  - [[06-comparisons/user-type-comparison]] — Feature matrix across 4 user types
- Pages touched: overview.md, index.md
- Contradictions flagged: none (first ingestion)
- Key stats: 755 DB tables, 3586 API endpoints, 464 frontend pages, 4 user types

## [2026-04-07] evolve | Wiki Improvements
- Updated CLAUDE.md with Sebenza Hub domain-specific extension (replaced generic examples)
- Created 4 deeper entity pages:
  - [[01-entities/offer-system]] — 12 tables, approval workflows, negotiation, AI strategy
  - [[01-entities/screening-system]] — CV screening, chatbot, tests, background checks
  - [[01-entities/linkedin-integration]] — OAuth, lead gen forms, AI scoring, nurture sequences
  - [[01-entities/community-learning-hub]] — Forum, mentorship, learning, skill verification
- Created 4 open question pages:
  - [[08-questions/recruiter-business-relationship]] — Vendor relationship flow
  - [[08-questions/trust-tier-calculation]] — Trust tier algorithm
  - [[08-questions/subscription-plans]] — 18 plan details
  - [[08-questions/ai-provider-selection]] — AI provider routing
- Created 3 user journey workflow pages:
  - [[03-workflows/individual-journey]] — Signup → Hired
  - [[03-workflows/recruiter-journey]] — Signup → Placement Fee
  - [[03-workflows/business-journey]] — Signup → Hire
- Copied 6 raw source documents from repo into 13-raw/:
  - features-inventory.md, individual-features.md, recruitment-features.md
  - ai-enhancement-opportunities.md, seo-plan.md, whatsapp-bot-training-manual.md
- Updated 12-tasks/todo.md with wiki maintenance backlog
- Created 03-workflows/ directory
- Total wiki pages: 27 (+6 raw docs)

## [2026-04-07] evolve | Added Tweets section
- Added `10-tweets/` directory and page type
- Added "Tweet" operation (#5) to CLAUDE.md with full workflow
- Updated directory structure, domain extension, index format in CLAUDE.md
- Updated index.md with Tweets section
- Purpose: Ingest AI tweets → extract insights → recommend Sebenza Hub improvements

## [2026-04-07] tweet | Karpathy — LLM Knowledge Bases
- Source: https://x.com/karpathy/status/2039805659525644595
- Filed: [[10-tweets/karpathy-llm-knowledge-bases]]
- Recommendations: 6 (top: AI-compiled company research for Individuals, LLM-maintained talent market wiki, knowledge base for screening bot)
- Pages touched: none (recommendations filed, not yet implemented)

## [2026-04-07] tweet | Farza — Farzapedia Personal Wiki
- Source: https://x.com/FarzaTV/status/2040563939797504467
- Filed: [[10-tweets/farzatv-farzapedia-personal-wiki]]
- Recommendations: 5 (top: agent-queryable candidate wikis for Recruiters, personal career wiki for Individuals, agent-first data architecture)
- Pages touched: [[10-tweets/karpathy-llm-knowledge-bases]] (cross-reference added)

## [2026-04-07] ingest | Batch ingest of 6 raw source documents
- Ingested all 6 raw docs that were previously copied but not formally processed
- Source summaries created:
  - [[09-sources/features-inventory-2026-04-07]] — Platform feature inventory (325 pages, 157 features, 18 plans)
  - [[09-sources/individual-features-2026-04-07]] — 56+ Individual features (profile, job search, applications, AI tools, learning, career, community)
  - [[09-sources/recruitment-features-2026-04-07]] — 95+ Recruiter features (recruitment, evaluation, AI, talent, scheduling, analytics, revenue engine, governance)
  - [[09-sources/ai-enhancement-opportunities-2026-04-07]] — 56 AI enhancement opportunities (83% of pages lack AI, 5 quick wins, 8 high-value medium effort)
  - [[09-sources/seo-plan-2026-04-07]] — SEO strategy (mature foundation, SSR gap, 10K monthly organic target)
  - [[09-sources/whatsapp-bot-training-manual-2026-04-07]] — WhatsApp bot operational manual (20 admin tabs, 6 SA languages, flow builder)
- Contradictions flagged:
  - Page count: features inventory lists 325 routes vs repo audit's 464 (likely counting methodology difference)
  - WhatsApp language support: bot greets in 6 SA languages, but AI enhancement audit flags multi-language AI as unimplemented (template-based vs full AI conversation)

## [2026-04-07] evolve | New entity and concept pages
- New pages created:
  - [[01-entities/whatsapp-bot]] — Deep-dive entity page for the WhatsApp bot (20 admin tabs, flow builder, DNA analyzer, war room)
  - [[01-entities/job-aggregation]] — Job aggregation entity page (Adzuna + CareerJet APIs)
  - [[02-concepts/seo-strategy]] — SEO strategy concept page (implementation status, keyword strategy, goals)
- Pages touched:
  - [[02-concepts/ai-features]] — Added AI enhancement opportunities section, infrastructure gaps, priority matrix
  - [[02-concepts/whatsapp-integration]] — Added WhatsApp bot deep-dive section, Meta API details, language tension note
  - [[01-entities/sebenza-hub]] — Added SEO strategy, whatsapp-bot, and job-aggregation references
  - [[01-entities/admin-user]] — Added links to job-aggregation and whatsapp-bot
  - [[01-entities/individual-user]] — Added links to job-aggregation and community-learning-hub
  - [[01-entities/recruiter-user]] — Added links to whatsapp-bot, offer-system, screening-system, linkedin-integration

## [2026-04-07] query | Resolve open questions with new source data
- Updated all 4 open questions with information from newly ingested sources:
  - [[08-questions/recruiter-business-relationship]] — Confidence raised to medium. Confirmed recruiter-driven model with Revenue Engine (client pipeline, submissions, placements). Business-side vendor scoring identified as future AI feature.
  - [[08-questions/trust-tier-calculation]] — Confidence raised to medium. Confirmed input signals: placement rates, candidate NPS, client satisfaction, engagement scoring. Exact algorithm still needs code verification.
  - [[08-questions/subscription-plans]] — Confidence raised to medium. Found pricing hints from SEO plan (Individual ~R99/mo, Recruiter ~R999/mo, Business ~R1,999/mo). Confirmed 157 features (boolean + metered) distributed across plans.
  - [[08-questions/ai-provider-selection]] — Confidence raised to medium. Confirmed admin-configurable per-feature model selection via `ai_feature_configs`. Found 6+ admin AI management tabs.

## [2026-04-07] lint | Cross-reference audit
- Issues found: 5 orphan pages, 11 cross-reference gaps
- Fixed: all — added missing wiki-links across 7 pages
- Orphan pages resolved: 01-entities/whatsapp-bot, 01-entities/job-aggregation, 02-concepts/seo-strategy (all newly created, now linked)
- Remaining orphans: 12-tasks/todo.md, 12-tasks/lessons.md (acceptable — task files)
- No broken wiki-links found (all content links resolve to existing files)

## [2026-04-07] ingest | Individual Journey Gap Analysis
- Source: `13-raw/articles/individual-journey-gap-analysis.md`
- Summary: [[09-sources/individual-journey-gap-analysis-2026-04-07]]
- Key action: **Full rewrite of [[03-workflows/individual-journey]]** — expanded from ~40% feature coverage to 100%, restructured from 13 linear steps to **7 hiring steps + 4 parallel tracks**
- Hiring path (Steps 1–7): kept sequential narrative, expanded Step 3 (Profile) and Step 5 (Applications) with missing features
- Parallel tracks (scenario-driven, not feature lists):
  - **Track A: AI Assistance** — 4 scenarios: applications not converting, dream job underqualified, low salary offer, autopilot setup
  - **Track B: Learning** — 3 scenarios: rejected for missing skills, career changer with no creds, upskilling while employed
  - **Track C: Community** — 3 scenarios: preparing for big interview, search stalled, giving back after hired
  - **Track D: Career Development** — 3 scenarios: career direction unclear, salary fairness, tracking overall performance
- Supporting infrastructure: Knowledge Base, Billing, Settings (referenced, not duplicated)
- Pages touched: [[03-workflows/individual-journey]], [[01-entities/individual-user]], [[01-entities/community-learning-hub]], [[02-concepts/ai-features]], [[02-concepts/billing-system]]
- New pages created: [[09-sources/individual-journey-gap-analysis-2026-04-07]]
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
- Filed: [[10-tweets/explorax-20-agentic-skills]]
- Recommendations: 6 (top: AI Skills Registry to decouple AI behaviour from code, Content Repurposing for job postings across WhatsApp/LinkedIn/email, Competitive Intelligence Dashboard for recruiters)
- Pages touched: [[10-tweets/karpathy-llm-knowledge-bases]], [[10-tweets/farzatv-farzapedia-personal-wiki]] (cross-referenced)
- Total wiki pages: 41 (+7 raw docs)

## [2026-04-07] tweet | AI Edge — Claude Skills Ultimate Guide
- Source: https://x.com/aiedge_/status/2036815449225298369
- Filed: [[10-tweets/aiedge-claude-skills-guide]]
- Recommendations: 6 (top: Skill-like architecture for AI features with progressive loading, A/B testing for AI prompts, trigger optimisation for WhatsApp bot)
- Pages touched: [[10-tweets/explorax-20-agentic-skills]] (cross-referenced)
- Total wiki pages: 42 (+7 raw docs)

## [2026-04-07] evolve | Added Presentations folder
- Created `11-presentations/` directory for slide decks, pitch materials, and presentation content
- Updated index.md with Presentations section
- Updated CLAUDE.md directory structure
