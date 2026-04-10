# Activity Log

## [2026-04-09] lint | Verification sweep across admin-whatsapp-tab-reference.md
- Ran a 65-claim verification pass against the actual source code at `C:\Users\User\Desktop\Sebenza_Hub_Claude\Sebenza_Hub_Claude_V2`. 56 claims verified, 9 errors/discrepancies found and fixed:
  - **Bot Templates line count**: 860 → 1041 (verified via `wc -l`).
  - **Tab 14 Bot Training sub-tabs**: previously listed as `Intents / FAQs / Training Playground / Unmatched Messages`. Actual sub-tab values are `intents / faqs / playground / metrics` with display labels `Intents / FAQ Knowledge Base / Conversation Playground / Training Metrics` (verified at WhatsAppChatbotTraining.tsx:424-427). The "Unmatched Messages" feature exists but is a section *inside* Training Metrics (line 1028), not its own sub-tab. Fixed the sub-tab names and added a visible correction callout.
  - **Tab 18 AI Matcher — completely wrong purpose**: previously described as a phone-number-to-profile matcher (matching WhatsApp numbers to user/candidate/recruiter records). The actual feature is a **candidate-to-job skill matcher** that extracts skills from conversations and CVs (via NLP / Keyword / CV Parse) and matches to live jobs. Real funnel: Conversations → Skills Extracted → Jobs Matched → Cards Sent → Applications. Real sub-tabs: Live Matches / Skill Extraction / Configuration / Analytics (WhatsAppCandidateMatcher.tsx:434-445). Real status enum: pending / sent / applied / placed. Real confidence thresholds: ≥0.85 high, ≥0.60 medium. Rewrote the entire Tab 18 section with a visible correction callout.
  - **Tab 19 Growth Engine sub-structure**: previously listed sub-sections "Funnel Analysis / Win-Back Campaigns / Audience Insights / Growth Recommendations" — none of those exist. Real 5 sub-tabs are: Growth Dashboard / Referral Chains / QR Campaigns / Deep Links / Viral Analytics (WhatsAppGrowthEngine.tsx:350-354). The K-factor labelling is real and uses thresholds from WhatsAppGrowthEngine.tsx:124-128 (Explosive ≥1.5, Viral ≥1.0, Steady ≥0.5, Sub-Viral <0.5). Rewrote with correction callout.
  - **Tab 21 War Room "Crisis Dashboard banner"**: stale reference from before the previous correction round — Tab 21's "What you see" still listed the fabricated banner. Replaced with the real header (Active escalations + predictedNext30Min).
  - **Cheat sheet**: "Match a phone number to a user profile" was pointing at AI Matcher — wrong tab. Updated to point at Conversations → Match button (where the actual phone-to-user matching happens). Added new entries for the real AI Matcher capabilities.
  - **Hidden gem #7**: said "Training Playground sub-tab" — corrected to "Conversation Playground sub-tab" to match the actual UI label.
- Unverified items left as-is (lower priority): Optimal Send Times heatmap actually exists at AdminWhatsApp.tsx:1800 (verification agent missed it on first pass; my claim was correct).
- Pages touched: [[05-procedures/admin-whatsapp-tab-reference]] (8 edits).
- **Lesson:** the original tab inventory agent's report had several inferences and at least one straight-up wrong tab attribution (AI Matcher described as phone matcher despite the file being WhatsAppCandidateMatcher.tsx). Don't trust agent inferences for anything that ends up in a doc — verify with grep before publishing.

## [2026-04-09] lint | Cross-site leak cleanup of `02-concepts/` and `03-workflows/` published pages
- Context: follow-up to the recruiter how-to completion. The recruiter and individual how-tos reference 7 concept pages and 2 workflow pages — these are part of the public `sebenzahub-manual` Publish surface (everything inside `16-how-tos/` plus the concept/workflow pages those chapters link to). Same cross-site leak rule applies to these pages.
- Scan results: **45 leaks across 8 published files** (1 page — `02-concepts/whatsapp-integration` — was missed in the first scan but caught and cleaned in the same pass; 1 page — `02-concepts/billing-system` — was missed in the first scan because it's only referenced from Chapter 4.5, but caught and cleaned after a complete cross-reference grep). The 9th page caught later was `03-workflows/individual-journey`.
- Strategy: same Option A (strip and rewrite) used in the original `16-how-tos/individual/` cleanup. Three patterns:
  1. **References tail bulk strip** (most pages) — removed `01-entities/`, `09-sources/`, `08-questions/` links from References sections, kept allowed-folder links, added adjacent `03-workflows/*` or `02-concepts/*` links where the section thinned out.
  2. **Inline mid-document references** (recruiter-journey and individual-journey) — removed `See [[01-entities/X]] for details.` lines entirely; the surrounding prose still works without the link.
  3. **"Key Touchpoints" tables in journey files** — rewrote table cells from `[[01-entities/recruiter-user]]` to plain text descriptions ("Recruiters or Business hiring teams"). Same information, no leak.
- Files cleaned (9 total, 23 edits):
  - [[02-concepts/authentication]] — References tail (1 edit, 4 leaks)
  - [[02-concepts/compliance]] — References tail (1 edit, 4 leaks)
  - [[02-concepts/ai-features]] — Mid-doc + open question + References (3 edits, 7 leaks)
  - [[02-concepts/application-lifecycle]] — References tail (1 edit, 4 leaks)
  - [[02-concepts/multi-tenancy]] — References tail (1 edit, 3 leaks)
  - [[02-concepts/whatsapp-integration]] — Mid-doc + tension callout + References (3 edits, 6 leaks)
  - [[02-concepts/billing-system]] — References tail (1 edit, 4 leaks)
  - [[03-workflows/recruiter-journey]] — 4 inline `See [[...]]` lines + Key Touchpoints table + References (6 edits, 17 leaks — the worst offender)
  - [[03-workflows/individual-journey]] — 4 inline `See [[...]]` lines + Key Touchpoints table + References (6 edits, 13 leaks)
- Re-scan after cleanup: **0 leaks across all 9 files**. Re-scan of `16-how-tos/individual/` and `16-how-tos/recruiter/` (35 + 23 = 58 chapter files): **0 leaks**.
- **Total public surface (after cleanup):** 67 files, 0 leaks.
  - 23 individual how-to chapters
  - 35 recruiter how-to chapters
  - 7 concept pages (authentication, compliance, ai-features, application-lifecycle, multi-tenancy, whatsapp-integration, billing-system)
  - 2 workflow pages (individual-journey, recruiter-journey)
- **NOT cleaned (intentional)** — 5 dirty pages that no how-to chapter references, so they don't need to be published on the how-to site:
  - `02-concepts/rbac` (3 leaks) — internal-only audience
  - `02-concepts/tech-stack` (2 leaks) — internal-only
  - `02-concepts/seo-strategy` (2 leaks) — internal-only
  - `03-workflows/business-journey` (10 leaks) — Business how-to not yet planned
  - `03-workflows/admin-journey` (8 leaks) — Admin runbooks live in `05-procedures/`, not `16-how-tos/admin/`
  These can be hidden in the Obsidian Publish Navigation UI for `sebenzahub-manual` and remain publishable on the internal `sebenzahub` site.
- **User action still needed in Obsidian Publish:**
  - Show the 9 cleaned files in the Navigation UI for `sebenzahub-manual`
  - Hide the 5 internal-only files listed above
  - The full public publishing list is now: 16-how-tos/individual/* + 16-how-tos/recruiter/* + the 9 concept/workflow files above

## [2026-04-09] procedure | Admin WhatsApp tab reference — hidden gems section + corrections
- Added a "Hidden gems & non-obvious features" section to [[05-procedures/admin-whatsapp-tab-reference]] documenting 8 features that aren't in the original Sebenza Hub WhatsApp Bot How-To Guide: (1) Broadcast Studio is a 3-in-1 (broadcasts + drips + contact lists), (2) Team Inbox 10-15s polling, (3) War Room 10-15s polling + `predictedNext30Min` forward-looking signal, (4) Contact CRM tab is rendered by `WhatsAppContactIntelligence` component (verified at AdminWhatsApp.tsx:47/1396/5318), (5) Automation tab supports PDF attachments on greeting/fallback, (6) Estimated Cost in ZAR in Broadcast Studio is the easiest cost-watch number, (7) Bot Training Playground for fast intent testing, (8) Replay & Debug auto-flags Critical Moments.
- **Corrections to earlier docs:** my previous tab-reference and morning-routine versions claimed Live Pulse and War Room polled every 5 seconds and described a "Crisis banner" with specific firing thresholds (3+ critical in 5 min, sentiment cluster, delivery drop). Both were wrong. Verified actual `refetchInterval` values from source: AdminWhatsApp.tsx uses 10-30s intervals (no 5s anywhere); WhatsAppEscalationWarRoom.tsx uses 10-15s. The "Crisis banner" with the specific thresholds I described does not exist in the code — only `activeEscalations` and `predictedNext30Min` header stats. Fixed three locations in [[05-procedures/admin-whatsapp-tab-reference]] (Tab 1 polling note, Tab 21 Crisis section + polling note, polling frequency table) and two locations in [[05-procedures/admin-whatsapp-morning-routine]] (War Room check section, red-flag escalation table). Added a visible "Earlier doc correction" callout in Tab 21 to flag the change for anyone who read the previous version.
- Pages touched: [[05-procedures/admin-whatsapp-tab-reference]], [[05-procedures/admin-whatsapp-morning-routine]], [[index]] (updated tab-reference description).

## [2026-04-09] update | Recruiter How-To Guide — first complete draft (35 chapters)
- Context: sibling to the Individual how-to. Required because Sebenza Hub's recruiter side has 101 pages across 11 feature categories — significantly larger than Individual's ~50 features. Plan filed earlier in [[08-questions/recruiter-training-manual-plan]] with a 34-chapter outline; Chapter 4.5 (How we charge) added during drafting at user request, bringing total to 35.
- Codebase research resolved 5 blocking open questions before drafting, all confirmed via grep at `C:\Users\User\Desktop\Sebenza_Hub_Claude\Sebenza_Hub_Claude_V2`:
  - **Trust tier calculation** — 7-badge formula in `server/routes.ts:5625-5682`. trustScore = (earnedCount/7)*100. Bronze 0-2, Silver 3-4, Gold 5, Platinum 6-7. Documented in [[08-questions/trust-tier-calculation]] with the full Bronze→Platinum playbook.
  - **Exclusivity model** — `jobIntakeScorecard.exclusivity` field at `shared/schema.ts:7450` with 3 values: exclusive/preferred/contingent. Sebenza Hub does NOT enforce exclusivity — it's a recruiter-side categorisation for analytics. Critical legal framing in Chapter 9.
  - **Plan structure** — `server/seed-plans.ts` defines 9 plan seeds × 2 intervals = 18 plans. Recruiter tiers: Free / Standard R999/mo / Premium R2,499/mo (annual ~20% discount). Documented in [[08-questions/subscription-plans]].
  - **Team roles** — already in [[02-concepts/rbac]] (Owner/Admin/Manager/Recruiter/Viewer/Member + 40+ permissions).
  - **Verification** — manual admin review via `organizations.isVerified` flag and `/admin/recruiters` route.
- Drafted in 5 batches across the session: Part 1 (Ch 1-4 + 4.5) → Parts 2+3 (Ch 5-10) → Parts 4+5 (Ch 11-21) → Parts 6-9 (Ch 22-30) → Parts 10+11 (Ch 31-34).
- All 35 chapters use real schema field names, real status enums, and real plan pricing. No "to be confirmed" hedging.
- Cross-site leak rule (from earlier session) enforced throughout — every chapter only links to `02-concepts/`, `03-workflows/`, or other `16-how-tos/recruiter/` chapters. Re-grepped the full folder after each batch; final scan: 0 leaks across all 36 files.
- New pages created:
  - [[16-how-tos/recruiter/index]] — How-to table of contents
  - [[16-how-tos/recruiter/01-what-sebenza-hub-is-for-recruiters]] through [[16-how-tos/recruiter/34-advanced-and-platinum]] (35 chapters)
  - [[08-questions/recruiter-training-manual-plan]] — Plan and outline (filed earlier in session, marked complete)
- Existing pages updated:
  - [[08-questions/trust-tier-calculation]] — Resolution section added with full formula
  - [[08-questions/subscription-plans]] — Resolution section added with full plan table
- Memory persisted: codebase location reference saved so future sessions can grep `C:\Users\User\Desktop\Sebenza_Hub_Claude\Sebenza_Hub_Claude_V2` without asking for the path.
- Outstanding (deferred):
  - The 7 `02-concepts/` and `03-workflows/` pages the recruiter how-to references all have their own cross-site leaks to internal folders. Lint pass run; ~40 leaks identified across 7 files. Cleanup pending user go-ahead.
  - Screenshots — same status as Individual how-to.
  - Business and Admin how-tos — not yet planned. Note: user has filed [[05-procedures/admin-whatsapp-command-center-setup]], [[05-procedures/admin-whatsapp-tab-reference]], and [[05-procedures/admin-whatsapp-morning-routine]] as internal-only admin runbooks (correctly placed under `05-procedures/`, not `16-how-tos/admin/`, to keep them off the public site).

## [2026-04-09] procedure | Admin WhatsApp morning routine cheat sheet
- Filed: [[05-procedures/admin-whatsapp-morning-routine]] — one-page printable distillation of the daily checks from the tab reference. 5 sequential checks (Live Pulse → War Room → Sentiment/Funnel → Compliance → Unmatched), 10-minute time budget, with green/yellow/red thresholds per metric, a daily go/no-go checklist, and a red-flag escalation table for when to call DevOps. Designed to fit on a single A4 page.
- Pages touched: [[index]] (added third Procedures entry).

## [2026-04-09] procedure | Admin WhatsApp Command Center tab-by-tab reference
- Context: follow-up to the setup runbook — user wanted every one of the 21 tabs explained in detail.
- Filed: [[05-procedures/admin-whatsapp-tab-reference]] — companion to the setup runbook, structured as a per-tab reference (purpose / what you see / what you can do / when to open it). Includes a quick-map cadence table at the top, a "I want to..." cross-tab cheat sheet at the bottom, plus polling frequency table.
- Sources: deep code exploration of all 11 sub-components in `client/src/pages/admin/whatsapp/` (WhatsAppTeamInbox.tsx 863 lines, WhatsAppFlowBuilder.tsx 688, WhatsAppChatbotTraining.tsx 1190, WhatsAppBotTemplates.tsx 860, WhatsAppAnalyticsDeepDive.tsx 1780, WhatsAppConversationReplay.tsx 666, WhatsAppCandidateMatcher.tsx 1438, WhatsAppContactIntelligence.tsx, WhatsAppGrowthEngine.tsx 1489, WhatsAppConversationDNA.tsx 624, WhatsAppEscalationWarRoom.tsx 800) plus the in-file tab content blocks in AdminWhatsApp.tsx for the first 10 tabs (lines 1433-5312).
- Pages touched: [[index]] (added second Procedures entry).

## [2026-04-09] procedure | Admin WhatsApp Command Center setup runbook
- Context: user (Admin) requested a personal training guide for setting up and operating the WhatsApp Command Center at `/admin/whatsapp`. Meta-side setup already complete (App ID `1295366105776721`, WABA `914872117983837`, Phone Number ID `1006592152543941`, webhook callback registered). Bot toggle currently OFF in production — flagged in the runbook.
- Filed: [[05-procedures/admin-whatsapp-command-center-setup]] — internal-only (under `05-procedures/`, NOT `16-how-tos/admin/`, to keep it off the public `sebenzahub-manual` site).
- Scope: full setup (Meta prerequisites → credential paste → webhook verification → test message → bot toggle → bot settings → templates → bot training → automation/flows) PLUS day-to-day operations across all 21 tabs (Command Center, Conversations, Team Inbox, Campaigns, Broadcast Studio, Compliance, Quality & CSAT, AI Intelligence, Contact CRM, Deep Analytics, Replay & Debug, AI Matcher, Growth Engine, DNA Analyzer, War Room) plus operational rhythms, troubleshooting, and reference appendix (env vars, API endpoints, DB tables).
- Format: numbered runbook with screenshot-to-take placeholders (📸) and pull quotes for warnings/tips.
- Sources: codebase exploration of `Sebenza_Hub_Claude_V2` — `client/src/pages/admin/AdminWhatsApp.tsx` (5,491 lines, 21 tabs), `server/whatsapp.ts`, `server/routes.ts` (~30 admin WhatsApp endpoints), `shared/schema.ts` (10 whatsapp tables), and `docs/WhatsApp-Bot-Training-Manual.md` (784 lines, mined for tab-by-tab descriptions).
- User screenshots: Sebenza Hub Configuration tab (Connected banner + Bot OFF strip), Meta App Basic settings, Meta Webhook Configuration page.
- Pages touched: [[index]] (added new "Procedures" section between Workflows and Sources).

## [2026-04-09] lint | Cross-site leak scan + cleanup of `16-how-tos/individual/`
- Context: vault publishes to two Obsidian Publish sites — `sebenzahub` (internal, full vault) and `sebenzahub-manual` (public, end-user how-to guide). Per-site visibility is controlled in the Publish Navigation UI; hidden pages still resolve by direct URL.
- Updated [[CLAUDE]]:
  - Added a **Cross-site leaks** check to the Lint workflow (rule: any `[[wiki-link]]` inside `16-how-tos/` that targets a folder other than `16-how-tos/`, `02-concepts/`, or `03-workflows/` is a leak).
  - Added a **Two-Site Publish** subsection under Domain-Specific Extensions documenting the two sites, allowed/forbidden link targets, and authoring rules for `16-how-tos/` pages.
- Scan results: 47 leak instances across 21 files in `16-how-tos/individual/`, hitting 5 internal folders (`01-entities/`, `06-comparisons/`, `08-questions/`, `15-dashboards/`, plus one mid-chapter Open question pattern).
- Fix strategy applied: **Option A — strip and rewrite.**
  - Removed all internal-folder links from References sections in chapters 01–23 + index. Where stripping left a section thin, added an adjacent `16-how-tos/individual/` chapter link.
  - Rewrote 4 mid-chapter "Open question" callouts as plain "Heads up" prose: chs 6 (CV Review pricing), 11 (Cover Letter pricing), 16 (Salary Negotiator pricing), 19 (Learning Paths curation).
  - Rewrote chapter 20 (Autopilot): converted internal `## Open question` section to `## What we'll cover in a future update` with no links; de-leaked the partial-draft warning at the top.
  - Updated [[16-how-tos/individual/index]]: removed internal references (Plan, Feature inventory, Dashboard layout); kept Source spine (`03-workflows/individual-journey`, allowed).
- Files touched: 22 files, 28 edits total. Re-scan confirms zero leaks remaining in `16-how-tos/individual/`.
- Allowed cross-folder targets still in use (must be **shown** on the how-to site): `02-concepts/authentication`, `02-concepts/compliance`, `02-concepts/ai-features`, `02-concepts/application-lifecycle`, `03-workflows/individual-journey`.
- Outstanding (not done in this pass):
  - User must still hide internal folders in the Obsidian Publish Navigation UI for `sebenzahub-manual` (no file-based config to set).
  - The 5 published `02-concepts/` and `03-workflows/` pages above need their own leak scan, since they're now part of the public surface area.
  - Recruiter / business / admin how-tos are not yet drafted; same lint rule will apply when they are.

## [2026-04-09] tweet | Claude Code + Obsidian Second Brain — @aiedge_
- Source: https://x.com/aiedge_/status/2041908011078447222
- Filed: [[10-tweets/aiedge-claude-obsidian-second-brain]]
- Fidelity note: X blocked direct scraping (HTTP 402); content reconstructed via reader-proxy summary. Exact tweet text not preserved verbatim. Confidence: medium. Re-ingest when direct access is restored.
- Recommendations: 5 (top: adopt Marp for empty 11-presentations/; add Dataview queries to index.md; install Obsidian Web Clipper for ingestion)
- Cross-references: the tweet is redundant with [[10-tweets/karpathy-llm-knowledge-bases]], [[10-tweets/farzatv-farzapedia-personal-wiki]], [[10-tweets/neilxbt-obsidian-claude-memory]] at the architectural level, but adds a concrete tool stack (Marp, Dataview, qmd, Web Clipper) that was not previously named
- Pages touched: [[index.md]] (Tweets section, page count 79 → 80)
- No entity/concept pages edited — the recommendations are wiki-tooling-level, not platform-level

## [2026-04-09] tweet | Claude Managed Agents — @NickSpisak_
- Source: https://x.com/NickSpisak_/status/2041949191887262164
- Filed: [[10-tweets/nickspisak-claude-managed-agents]]
- Fidelity note: X blocked direct scraping (HTTP 402); content reconstructed via reader-proxy summary. Confidence: medium. Re-ingest when possible.
- Recommendations: 7 (top: prototype WhatsApp bot session layer on Managed Agents; adopt as target runtime for Autopilot; open a decision record)
- Open questions raised: POPIA data-residency, multi-provider lock-in, session-hour cost at scale, custom tool support
- Pages touched: [[index.md]] (Tweets section, page count 78 → 79)
- No entity/concept pages edited yet — awaiting Rec #7 decision record before making architectural claims in [[02-concepts/ai-features]]

## [2026-04-09] edit | Individual How-To Guide — editorial pass
- Audited all 23 chapters for consistency, repeated phrasing, broken links, and shaky claims
- Findings:
  - All chapters have Checklist, Next chapter, References sections (Ch 23 correctly omits Next chapter as the final chapter)
  - All cross-chapter wiki-links resolve to existing files
  - Frontmatter is consistent across chapters (type=concept, status=draft, updated=2026-04-09)
  - Average length 145 lines; longest is Ch 7 at 190 lines (Skills + Verifications + Credentials + Video + Portfolio — kept as-is, content is justified)
- Targeted edits:
  - Varied "This chapter is X" opening pattern in Ch 6, Ch 9, Ch 17 (was used in 6 chapters; trimmed to 3)
  - Removed misleading [[Chapter 7]] cross-link in [[16-how-tos/individual/03-onboarding]] (job preferences live in Settings, not Ch 7)
  - Hedged unverified factual claim in [[16-how-tos/individual/08-privacy-and-popia]] about per-organisation blocking (was asserting nonexistence; now invites users to check Settings)
  - Hedged unsupported "at least a third" silent-application statistic in [[16-how-tos/individual/11-applying]] to "a meaningful fraction"
- No structural changes; no chapters rewritten; no content cut

## [2026-04-09] update | Individual How-To Guide — Parts 3, 4, 5, 6 drafted (how-to complete)
- Drafted full bodies for chapters 9–23 (with Ch 20 as a partial pending the Autopilot open question):
  - Part 3 (Find and Apply): [[16-how-tos/individual/09-search-modes]], [[16-how-tos/individual/10-saved-searches-and-favourites]], [[16-how-tos/individual/11-applying]], [[16-how-tos/individual/12-tracking-applications]]
  - Part 4 (Interview and Offer): [[16-how-tos/individual/13-interview-simulator]], [[16-how-tos/individual/14-company-research]], [[16-how-tos/individual/15-receiving-an-offer]], [[16-how-tos/individual/16-salary-negotiator]]
  - Part 5 (Troubleshooting): [[16-how-tos/individual/17-no-responses]], [[16-how-tos/individual/18-no-direction]], [[16-how-tos/individual/19-level-up]]
  - Part 6 (Advanced): [[16-how-tos/individual/20-autopilot]] (partial — blocked on operational details), [[16-how-tos/individual/21-career-dna]], [[16-how-tos/individual/22-market-radar]], [[16-how-tos/individual/23-community-and-mentorship]]
- Plan checklist updated: Parts 3–6 marked complete; Ch 20 noted as partial
- All 23 chapters of the Individual How-To Guide now have body content (Ch 20 still labelled partial in-page)
- Outstanding open questions still flagged inline in affected chapters: Autopilot operational behaviour (Ch 20), pricing tiers (Ch 6, Ch 11, Ch 16), Learning Path curation (Ch 19)
- Next: screenshot capture pass; review/edit pass on full how-to guide; sibling how-tos for Recruiter / Business / Admin

## [2026-04-09] update | Individual How-To Guide — Part 2 drafted
- Drafted full bodies for chapters 5–8 (Build Your Profile):
  - [[16-how-tos/individual/05-uploading-a-cv]] — upload vs build routes, AI parsing review, multiple CV versions
  - [[16-how-tos/individual/06-cv-review]] — what CV Review checks, how to read feedback, what it doesn't do
  - [[16-how-tos/individual/07-skills-credentials-video]] — skills with proficiency, verifications, credentials, video intro, portfolio (when each matters)
  - [[16-how-tos/individual/08-privacy-and-popia]] — public vs private, public profile preview, POPIA rights, notification settings
- Plan checklist updated: Part 2 marked complete
- Pricing-tier open question still flagged in Chapter 6 (CV Review may be paid)
- Next: Part 3 (chapters 9–12, Find and Apply to Jobs)

## [2026-04-09] new | Individual How-To Guide — plan + Part 1 drafted
- Plan filed: [[08-questions/individual-training-manual-plan]]
- New directory: `16-how-tos/` (how-to guides top-level)
- New how-to scaffold: [[16-how-tos/individual/index]] (23 chapters across 6 parts)
- Part 1 drafted (chapters 1–4):
  - [[16-how-tos/individual/01-what-sebenza-hub-is]] — what the platform is and who it's for
  - [[16-how-tos/individual/02-creating-your-account]] — magic-link sign-up walkthrough
  - [[16-how-tos/individual/03-onboarding]] — six onboarding fields + POPIA consent
  - [[16-how-tos/individual/04-first-10-minutes]] — dashboard orientation tour
- Chapters 5–23 scaffolded (frontmatter, outline, source pages, checklist) — bodies pending
- Chapter 20 (Autopilot) blocked on open question carried over from [[01-entities/individual-user]]
- Index updated; `16-how-tos/` added as new top-level directory under Manuals
- Pending: drafting Parts 2–6, screenshot capture, sibling how-tos for Recruiter / Business / Admin

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
