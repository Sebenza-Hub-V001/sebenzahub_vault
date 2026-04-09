# Activity Log

## [2026-04-09] tweet | Claude Managed Agents — @NickSpisak_
- Source: https://x.com/NickSpisak_/status/2041949191887262164
- Filed: [[10-tweets/nickspisak-claude-managed-agents]]
- Fidelity note: X blocked direct scraping (HTTP 402); content reconstructed via reader-proxy summary. Confidence: medium. Re-ingest when possible.
- Recommendations: 7 (top: prototype WhatsApp bot session layer on Managed Agents; adopt as target runtime for Autopilot; open a decision record)
- Open questions raised: POPIA data-residency, multi-provider lock-in, session-hour cost at scale, custom tool support
- Pages touched: [[index.md]] (Tweets section, page count 78 → 79)
- No entity/concept pages edited yet — awaiting Rec #7 decision record before making architectural claims in [[02-concepts/ai-features]]

## [2026-04-09] edit | Individual Training Manual — editorial pass
- Audited all 23 chapters for consistency, repeated phrasing, broken links, and shaky claims
- Findings:
  - All chapters have Checklist, Next chapter, References sections (Ch 23 correctly omits Next chapter as the final chapter)
  - All cross-chapter wiki-links resolve to existing files
  - Frontmatter is consistent across chapters (type=concept, status=draft, updated=2026-04-09)
  - Average length 145 lines; longest is Ch 7 at 190 lines (Skills + Verifications + Credentials + Video + Portfolio — kept as-is, content is justified)
- Targeted edits:
  - Varied "This chapter is X" opening pattern in Ch 6, Ch 9, Ch 17 (was used in 6 chapters; trimmed to 3)
  - Removed misleading [[Chapter 7]] cross-link in [[16-manuals/individual/03-onboarding]] (job preferences live in Settings, not Ch 7)
  - Hedged unverified factual claim in [[16-manuals/individual/08-privacy-and-popia]] about per-organisation blocking (was asserting nonexistence; now invites users to check Settings)
  - Hedged unsupported "at least a third" silent-application statistic in [[16-manuals/individual/11-applying]] to "a meaningful fraction"
- No structural changes; no chapters rewritten; no content cut

## [2026-04-09] update | Individual Training Manual — Parts 3, 4, 5, 6 drafted (manual complete)
- Drafted full bodies for chapters 9–23 (with Ch 20 as a partial pending the Autopilot open question):
  - Part 3 (Find and Apply): [[16-manuals/individual/09-search-modes]], [[16-manuals/individual/10-saved-searches-and-favourites]], [[16-manuals/individual/11-applying]], [[16-manuals/individual/12-tracking-applications]]
  - Part 4 (Interview and Offer): [[16-manuals/individual/13-interview-simulator]], [[16-manuals/individual/14-company-research]], [[16-manuals/individual/15-receiving-an-offer]], [[16-manuals/individual/16-salary-negotiator]]
  - Part 5 (Troubleshooting): [[16-manuals/individual/17-no-responses]], [[16-manuals/individual/18-no-direction]], [[16-manuals/individual/19-level-up]]
  - Part 6 (Advanced): [[16-manuals/individual/20-autopilot]] (partial — blocked on operational details), [[16-manuals/individual/21-career-dna]], [[16-manuals/individual/22-market-radar]], [[16-manuals/individual/23-community-and-mentorship]]
- Plan checklist updated: Parts 3–6 marked complete; Ch 20 noted as partial
- All 23 chapters of the Individual Training Manual now have body content (Ch 20 still labelled partial in-page)
- Outstanding open questions still flagged inline in affected chapters: Autopilot operational behaviour (Ch 20), pricing tiers (Ch 6, Ch 11, Ch 16), Learning Path curation (Ch 19)
- Next: screenshot capture pass; review/edit pass on full manual; sibling manuals for Recruiter / Business / Admin

## [2026-04-09] update | Individual Training Manual — Part 2 drafted
- Drafted full bodies for chapters 5–8 (Build Your Profile):
  - [[16-manuals/individual/05-uploading-a-cv]] — upload vs build routes, AI parsing review, multiple CV versions
  - [[16-manuals/individual/06-cv-review]] — what CV Review checks, how to read feedback, what it doesn't do
  - [[16-manuals/individual/07-skills-credentials-video]] — skills with proficiency, verifications, credentials, video intro, portfolio (when each matters)
  - [[16-manuals/individual/08-privacy-and-popia]] — public vs private, public profile preview, POPIA rights, notification settings
- Plan checklist updated: Part 2 marked complete
- Pricing-tier open question still flagged in Chapter 6 (CV Review may be paid)
- Next: Part 3 (chapters 9–12, Find and Apply to Jobs)

## [2026-04-09] new | Individual Training Manual — plan + Part 1 drafted
- Plan filed: [[08-questions/individual-training-manual-plan]]
- New directory: `16-manuals/` (training manuals top-level)
- New manual scaffold: [[16-manuals/individual/index]] (23 chapters across 6 parts)
- Part 1 drafted (chapters 1–4):
  - [[16-manuals/individual/01-what-sebenza-hub-is]] — what the platform is and who it's for
  - [[16-manuals/individual/02-creating-your-account]] — magic-link sign-up walkthrough
  - [[16-manuals/individual/03-onboarding]] — six onboarding fields + POPIA consent
  - [[16-manuals/individual/04-first-10-minutes]] — dashboard orientation tour
- Chapters 5–23 scaffolded (frontmatter, outline, source pages, checklist) — bodies pending
- Chapter 20 (Autopilot) blocked on open question carried over from [[01-entities/individual-user]]
- Index updated; `16-manuals/` added as new top-level directory under Manuals
- Pending: drafting Parts 2–6, screenshot capture, sibling manuals for Recruiter / Business / Admin

## [2026-04-08] tweet | Obsidian Gives Claude the Memory It Was Never Born With
- Source: https://x.com/neil_xbt/status/2041779011336999021
- Filed: [[10-tweets/neilxbt-obsidian-claude-memory]]
- Recommendations: 5 (top: session context files for AI Copilot, persistent career context for Individuals, WhatsApp bot session continuity)
- Pages touched: [[10-tweets/karpathy-llm-knowledge-bases]], [[10-tweets/farzatv-farzapedia-personal-wiki]] (cross-references added)

## [2026-04-08] tweet | Systematic Debugging Methodology Prompt (8-Step Detective Thinking)
- Source: https://x.com/roundtablespace/status/2035631314691387534
- Filed: [[10-tweets/roundtablespace-debugging-methodology-prompt]]
- Recommendations: 5 (top: AI Output Debugging Dashboard for admin, Screening Bot Root Cause Analysis, WhatsApp Bot Debugging Mode)
- Pages touched: [[10-tweets/explorax-20-agentic-skills]] (cross-reference added)

## [2026-04-08] tweet | Hidden Claude Code Features (Channels, /batch, Agent Teams, Hooks, /loop)
- Source: https://x.com/coreyganim/status/2041596621591629915
- Filed: [[10-tweets/coreyganim-hidden-claude-code-features]]
- Recommendations: 6 (top: event-driven AI architecture via Channels pattern, AI output quality gates via TaskCompleted hook pattern, parallel AI processing via /batch pattern)
- Pages touched: [[10-tweets/aiedge-claude-skills-guide]] (cross-reference added)

## [2026-04-08] lint | Wiki health check
- Issues found: 6
- Fixed: 4
  - overview.md: Updated stale dashboard page counts (Business 15→47, Admin 104→24, Individual 85→51, Recruiter 86→101)
  - overview.md: Added journey references to "Three Products in One" section
  - overview.md: Updated Emerging Themes #4 (Business no longer "15 pages")
  - 15-dashboards/: Renamed 4 files from spaces to kebab-case (Individual Dashboard.md → individual-dashboard.md, etc.)
  - Updated all wiki-links referencing old dashboard filenames (index, log, sources, admin-journey)
- Deferred: 2
  - Orphan pages in 13-raw/ (expected — raw docs don't need inbound links)
  - Template/placeholder links in CLAUDE.md (expected — they're examples)

## [2026-04-08] evolve | Admin Journey + Overview rewrite
- Created [[03-workflows/admin-journey]] — 4 operations steps + 3 parallel tracks:
  - Operations Path: Monitor → Users → Content → Billing
  - Track A: AI Governance — cost spikes, bias detection, feature configuration
  - Track B: Trust & Safety — fraud detection, compliance reporting
  - Track C: Platform Config — white-label, languages, WhatsApp, data migration
- Rewrote overview.md with journey references and corrected dashboard page counts
- Pages touched: overview.md, [[01-entities/admin-user]], index.md
- New pages created: [[03-workflows/admin-journey]]
- Total wiki pages: 50 (+8 raw docs)

## [2026-04-08] ingest | Dashboard Layouts (Journey-Aligned)
- Source: `13-raw/articles/dashboard-layouts.md`
- Summary: [[09-sources/dashboard-layouts-2026-04-08]]
- Key action: Updated all 4 dashboard files in `15-dashboards/` with journey-aligned sidebar structure
- Structure: Each dashboard now follows Primary Path → Parallel Tracks → Supporting with glowing headers and thick divider
- Page counts: Individual 51, Recruiter 101, Business 47, Admin 24 (223 total)
- Pages touched: [[15-dashboards/individual-dashboard]], [[15-dashboards/recruiter-dashboard]], [[15-dashboards/business-dashboard]], [[15-dashboards/admin-dashboard]]
- New pages created: [[09-sources/dashboard-layouts-2026-04-08]]
- Added Dashboards section to index.md

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
