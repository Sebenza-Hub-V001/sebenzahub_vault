# Activity Log

## [2026-04-27] new chapters | Per-persona Quick Start pages to fight day-one overwhelm
- Trigger: Wes flagged that the platform feels overwhelming for new users — wanted "very basic getting started where you only need to do the bare minimal." Asked for honest opinion + suggestions, then approved doing all of them.
- **New pages:**
  - [[01 How-To Documents/individual/00-quick-start]] — 5 minutes to your first CV review (sign up → upload CV → run CV Review)
  - [[01 How-To Documents/recruiter/00-quick-start]] — 10 minutes to your first job posted (sign up + profile basics → add 1 client → save 1 job draft)
  - [[01 How-To Documents/corporate/00-quick-start]] — 15 minutes to your first requisition draft (sign up + branding → optionally invite teammate → save 1 requisition draft)
  - [[17. Features/In-App Activation Checklist]] — proposed product feature: persistent dashboard checklist mirroring the same 3 actions per persona, with server-side state detection and per-action telemetry
- **Index restructures** (each adds an "⚡ Start here" callout pointing to the persona Quick Start, before the existing "How to use this guide" block — no chapter list changes):
  - [[01 How-To Documents/individual/index]]
  - [[01 How-To Documents/recruiter/index]]
  - [[01 How-To Documents/corporate/index]]
- **Design principles baked into the chapters:**
  - Exactly three actions per persona — minimum viable activation, not a tour.
  - Each action lists the chapter to read later for the full version (so the quick-start doesn't compete with the full manual, it points at it).
  - Explicit "Stop here" + "Don't" lists to prevent the "everything at once" trap.
  - "What to do next" decision table so users can self-route to the next-most-useful chapter.
- **Companion product recommendation** ([[17. Features/In-App Activation Checklist]]): the docs fix is the smaller half. The bigger lever is in-product — a persistent dashboard checklist that mirrors the three actions per persona, detects completion server-side from real user state (cv count, client count, job count), and generates structured activation telemetry. Filed as a feature spec sketch, not yet a build commitment.
- Lint:
  - **Layer 1** clean: zero `[[forbidden-folder/...]]` links inside `01 How-To Documents/`.
  - **Layer 2** clean: the three quick-starts only reference concept/workflow pages already in the published transitive set (`02-concepts/compliance`, `03-workflows/individual-journey`, `recruiter-journey`, `business-journey`); no new pages added to the public surface.
- Pages touched: 8 (3 new chapters, 1 new feature spec, 3 index updates, 1 root index update).

## [2026-04-27] feedback | Embed full clickable production URLs in how-tos
- Trigger: Wes (founder) flagged that he himself finds it difficult to navigate Sebenza Hub. Sidebar instructions like "click **My CVs**" assume the reader can find the sidebar entry — they often can't. He wants every navigation reference to include the full clickable URL using the production domain `https://www.sebenzahub.co.za`.
- **Standing rule going forward** (saved as a feedback memory): every how-to chapter that tells a reader to navigate to a page must embed the full URL as a clickable link, with the URL itself as the link text so it's both visible and clickable. Sidebar instructions stay (they teach the layout), but they accompany the URL, not replace it.
- **Format adopted:** `Open **My CVs** — click it in the sidebar, or go directly to: [https://www.sebenzahub.co.za/dashboard/individual/cvs](https://www.sebenzahub.co.za/dashboard/individual/cvs)`
- **Verified production routes** (grepped from the React Router config in `Sebenza_Hub_Claude_V2`):
  - Sign-up: `/get-started`
  - Login: `/login`
  - Individual: `/dashboard/individual/profile`, `/dashboard/individual/cvs`, `/dashboard/individual/cv-review`
  - Recruiter: `/dashboard/recruiter/profile`, `/dashboard/recruiter/clients`, `/dashboard/recruiter/jobs`
  - Business: `/dashboard/business/home`, `/dashboard/business/team`, `/dashboard/business/settings`, `/dashboard/business/jobs`, `/dashboard/business/billing`
- **Pages updated** with verified clickable URLs in every navigation reference:
  - [[01 How-To Documents/individual/00-quick-start]]
  - [[01 How-To Documents/recruiter/00-quick-start]]
  - [[01 How-To Documents/corporate/00-quick-start]]
- **Not yet swept:** the existing 73 how-to chapters across individual / recruiter / corporate. They still use sidebar-only or bare-path references. This is a deliberate scope hold pending Wes's confirmation — the sweep is mechanical but large, and worth a single dedicated session.
- Lint: Layer 1 still clean after edits — external `https://` links don't trip the cross-site-leak grep.

## [2026-04-27] sweep | Embed clickable URLs across the Individual manual (Pass 1 of 3)
- Trigger: Wes approved a per-persona sweep ("one pass per persona"). This is the Individual pass; recruiter and corporate to follow on his sign-off.
- **Verified route map:** spawned an Explore agent against the product codebase to enumerate every `/dashboard/individual/*` route in the React Router config — 50+ routes verified before editing. No invented URLs. Full map is in the agent's response (saved as conversation context).
- **Surprises worth knowing for the recruiter/corporate sweeps:**
  - Career DNA, Autopilot, and Market Radar are **tabs inside `/dashboard/individual/settings`**, not their own routes — chapters that link to them should send the user to Settings and name the tab.
  - SETA Learnerships is at `/dashboard/individual/learning` (the route name doesn't match the page title).
  - "Learning Hub" is at `/dashboard/individual/learning-hub` (separate from the SETA page above).
  - Resume Upload has its own route `/dashboard/individual/resume-upload` even though it isn't in the main sidebar.
- **Pages updated** (22 chapters with nav references; ch01 and ch24 had none worth a URL):
  - Part 1: ch02 (sign-up + login URLs), ch03 (post-onboarding redirect), ch04 (sidebar tour table — 7 routes + 2 inline)
  - Part 2: ch05 (5 refs), ch06 (2 refs), ch07 (6 refs), ch08 (1 ref)
  - Part 3: ch09 (table of 3 routes + 2 inline), ch10 (2 refs), ch11 (2 refs), ch12 (3 refs), ch13 (table of 3 routes + 4 inline + 2 section headings)
  - Part 4: ch14 (table of 5 routes + 3 inline), ch15 (4 refs), ch16 (5 refs)
  - Part 5: ch17 (7 refs — 4 of them via `replace_all` on the repeated `(\`/dashboard/individual/coaching\`)` pattern), ch18 (5 refs), ch19 (6 refs)
  - Part 6: ch20 (1 ref), ch21 (5 refs), ch22 (1 ref), ch23 (table of 7 routes + 4 inline)
- **Format adopted across the sweep:** `Open **PageName**: [https://www.sebenzahub.co.za/dashboard/individual/route](https://www.sebenzahub.co.za/dashboard/individual/route)` — the URL is both visible (so it can be copy-pasted, and so the reader sees where they're being sent) and clickable. For tables, the route column header was renamed to "Open it" with one URL per row in the same shape. Sidebar-instruction prose is preserved alongside the URL where it adds value.
- **Verification:** post-sweep grep for `` `/dashboard/individual/` `` returned zero matches — every dashboard reference is now a clickable production URL. Cross-grep against all forbidden internal-only folder links also returned zero (Layer 1 still clean).
- **Pages NOT touched** (zero nav refs to convert): ch01-what-sebenza-hub-is, ch24-mobile-app, individual/index.md.
- **Still to sweep:** recruiter (34 chapters) and corporate (15 chapters), pending Wes's spot-check of this Individual pass.

## [2026-04-27] sweep | Embed clickable URLs across the Recruiter manual (Pass 2 of 3)
- Trigger: Wes approved continuing the per-persona sweep with the Recruiter manual after the Individual pass.
- **Verified route map:** spawned a fresh Explore agent against the product codebase to enumerate every `/dashboard/recruiter/*` route — ~85 routes verified across the recruiter dashboard before editing. The recruiter side is by far the largest persona (10 sidebar groups, ~100 pages).
- **Surprises worth knowing for the corporate sweep:**
  - The recruiter "Clients" workflow has THREE separate pages: `/clients`, `/client-pipeline` (opportunities), and `/call-notes` (activity log) — they are not tabs.
  - The offer lifecycle sprawls across 11 dedicated routes (`/offers`, `/offer-letters`, `/offer-templates`, `/offer-benchmarking`, `/offer-approvals`, `/offer-timeline`, `/offer-negotiation`, `/offer-compare`, `/offer-analytics`, `/offer-compliance`, `/offer-predictor`) — chapter 20 references most of them.
  - WhatsApp has three recruiter-side routes (`/whatsapp-apply`, `/whatsapp-bot`, `/whatsapp-campaigns`); the deeper templates / opt-outs / quality / cost surface lives on the admin side and is not in the recruiter sidebar.
  - Hiring Manager Portal exists at both `/hiring-manager` and `/hiring-manager-portal` (alternate alias).
  - "Reference Checks" is its own page at `/reference-checks` (separate from the chapter 17 background-checks workflow).
  - The Career-Site Chatbot (`/chatbot`) and the AI Screening Chatbot (used inside screening flows) are different products on different routes.
- **Pages updated** (33 chapters with nav references; ch01 had none, ch32 had none, recruiter/index.md had none worth a URL):
  - Part 1: ch02 (sign-up + login URLs), ch03 (3 refs), ch04 (table + 5 inline + 5 abbreviated paths in "first 30 minutes"), ch04.5 (6 refs all to billing — single replace_all)
  - Part 2: ch05 (2 refs), ch06 (6 refs all to brand — single replace_all), ch07 (7 refs across 4 routes)
  - Part 3: ch08 (2 refs), ch09 (1 ref), ch10 (3 refs)
  - Part 4: ch11 (2 refs), ch12 (9 refs across 7 routes), ch13 (3 refs), ch14 (7 refs across 3 routes — replace_all per route)
  - Part 5: ch15 (3 refs), ch16 (3 refs), ch17 (15 refs across 9 routes — densest table edit), ch18 (12 refs across 6 routes), ch19 (6 refs), ch20 (22 refs across 11 routes — densest chapter; mass replace_all per route), ch21 (9 refs)
  - Parts 6-7: ch22 (4 refs), ch23 (11 refs across 4 routes), ch24 (7 refs across 3 routes), ch25 (13 refs across 8 routes), ch26 (11 refs across 5 routes)
  - Parts 8-9: ch27 (5 refs across 2 routes), ch28 (14 refs across 4 routes), ch29 (9 refs across 4 routes), ch30 (12 refs across 4 routes)
  - Parts 10-11: ch31 (5 refs across 4 routes), ch33 (2 refs), ch34 (7 refs across 4 routes)
- **Format applied** (same as Individual pass): `[https://www.sebenzahub.co.za/dashboard/recruiter/route](https://www.sebenzahub.co.za/dashboard/recruiter/route)` — URL is both the link text and the href, visible and clickable.
- **Verification:** post-sweep grep for `` `/dashboard/recruiter/` `` returned zero matches; cross-grep for abbreviated paths (e.g. `` `/profile` ``, `` `/clients` ``, `` `/jobs` ``) also zero. Layer 1 cross-site-leak grep still clean.
- **Volume:** 235 path references converted across 33 chapters in one session, vs 92 across 22 chapters for Individual. Heavy use of `replace_all` per unique route in the dense chapters (ch17, ch20, ch28, ch30) made this feasible without per-edit reads of every reference.
- **Still to sweep:** corporate (15 chapters) — the smallest persona, ready to start when Wes gives the go-ahead.

## [2026-04-27] sweep | Embed clickable URLs across the Corporate manual (Pass 3 of 3 — sweep complete)
- Trigger: Wes approved the final pass; all three persona manuals are now URL-clickable end-to-end.
- **Verified route map:** spawned a fresh Explore agent against the product codebase to enumerate every `/dashboard/business/*` route — 51 routes verified across the corporate dashboard before editing.
- **Surprises worth knowing:**
  - Corporate sidebar uses fewer "table-of-contents" pages than Recruiter — most chapters reference 3–7 dedicated routes per section group rather than 9–11.
  - SSO has its own dedicated route (`/sso-config`), separate from Settings — so chapters referencing SSO setup point to the right place automatically.
  - Workforce/HR is by far the densest section (7 dedicated routes) — `/hris-integration`, `/workforce-planning`, `/internal-job-board`, `/performance`, `/succession-planning`, `/contract-workers`, `/team-dna`. Chapter 13 is correspondingly the densest in the corporate manual (21 refs).
  - Compliance has 4 dedicated routes (`/popia-compliance`, `/bbbee`, `/employment-equity`, `/audit-trail`) — symmetric with the Recruiter side.
  - Knowledge Base wiki uses parameterised routes (`/wiki/:id`, `/wiki/:id/page/:slug`) for individual wikis and pages — these stay in code-style backticks because they're URL templates, not navigable URLs.
- **Pages updated** (14 chapters with nav references; ch01 had none):
  - Part 1: ch02 (sign-up + login URLs), ch03 (2 refs), ch04 (2 refs all to billing — single replace_all)
  - Part 2: ch05 (11 refs across 4 routes), ch06 (6 refs across 3 routes), ch07 (12 refs across 4 routes), ch08 (12 refs across 4 routes), ch09 (15 refs across 5 routes)
  - Part 3: ch10 (9 refs across 3 routes), ch11 (12 refs across 4 routes), ch12 (8 refs across 4 routes), ch13 (21 refs across 7 routes — densest corporate chapter)
  - Part 4: ch14 (12 refs across 4 routes), ch15 (4 refs to /wiki — table refs left as parameterised templates)
- **Format applied** (consistent with Individual and Recruiter passes): `[https://www.sebenzahub.co.za/dashboard/business/route](https://www.sebenzahub.co.za/dashboard/business/route)` — URL is both the link text and the href.
- **Verification:** post-sweep grep for unconverted `` `/dashboard/business/` `` paths returned 2 matches, both intentional (URL templates with `:id` / `:slug` placeholders in ch15's feature table). Layer 1 cross-site-leak grep clean across the whole `01 How-To Documents/` tree.
- **Volume:** 130 path references converted across 14 chapters in this session. Heavy `replace_all` per unique route made it efficient — most edits were single-route, single-call replacements.

## [2026-04-27] sweep complete | All three persona manuals now have clickable URLs end-to-end
- **Final tally across all three sweeps:**
  - Individual: 22 chapters touched, ~92 path references converted
  - Recruiter: 33 chapters touched, ~235 path references converted
  - Corporate: 14 chapters touched, ~130 path references converted
  - **Total: 69 chapters, ~457 navigation references made clickable**
- Every nav reference in every how-to chapter now embeds the full production URL with the `https://www.sebenzahub.co.za` domain — visible AND clickable in both Obsidian and the published `sebenzahub-manual` site.
- Standing rule (saved as a feedback memory at the start of this sweep) now applies forward: every new how-to chapter must include the full clickable URL alongside any sidebar instruction. Future-me has the reminder; future Wes shouldn't have to give this feedback again.
- Lint clean across all three manuals: zero forbidden-folder leaks, zero remaining bare-path references (excluding the two intentional parameterised route templates in corporate/ch15).

## [2026-04-27] reposition | Quick Starts moved from before-Ch1 to between-Ch3-and-Ch4 (per Wes feedback)
- Trigger: Wes pushed back on the Quick Start sitting before "What Sebenza Hub is" (Ch1). The original placement made the Quick Start the very first thing a reader saw, and the first action was "sign up" — which assumed nothing was set up. Wes wanted the Quick Start to come *after* onboarding (Ch3), so by the time a reader reaches it they've understood the platform, created an account, and completed onboarding. The Quick Start can then drop the setup steps and become a cleaner "now do your first 3 productive actions" speed-run.
- **Files moved (per persona):**
  - `01 How-To Documents/individual/00-quick-start.md` → `01 How-To Documents/individual/03.5-quick-start.md`
  - `01 How-To Documents/recruiter/00-quick-start.md` → `01 How-To Documents/recruiter/03.5-quick-start.md`
  - `01 How-To Documents/corporate/00-quick-start.md` → `01 How-To Documents/corporate/03.5-quick-start.md`
- **Numbering choice:** `03.5` matches the existing `04.5-how-we-charge` pattern in the recruiter manual. Slots cleanly into Part 1 between Ch3 (onboarding/org-setup) and Ch4 (the dashboard tour), so the reading order is now: Ch1 → Ch2 → Ch3 → Ch3.5 (Quick Start) → Ch4 (deep dashboard tour) → rest of manual.
- **Content reshape (each persona):**
  - **Individual Ch3.5:** dropped step 1 ("sign up and pick Job Seeker") since both signup and onboarding are now done. New steps: 1) Upload a CV (was step 2); 2) Run CV Review (was step 3); 3) Glance at Auto Match (new — gives a baseline view of what jobs the platform thinks fit you).
  - **Recruiter Ch3.5:** dropped step 1 ("sign up and fill in agency profile basics") since signup (Ch2) and agency onboarding (Ch3) are done. New steps: 1) Add one client (was step 2); 2) Save one job draft (was step 3); 3) Open and bookmark the Pipeline (new — the daily workspace for once candidates start flowing in).
  - **Corporate Ch3.5:** the biggest reshape, because Ch3 (org setup) already covers team invites, RBAC, branding, and notifications — most of the original Quick Start's content was redundant. New steps: 1) Save one requisition draft (was step 3, lifted up); 2) Open and bookmark the Pipeline (new); 3) Bookmark Billing with a day-23 trial reminder (new — the platform's biggest avoidable mistake is letting the trial expire mid-evaluation without finance noticing).
- **Index updates (each persona's `index.md`):**
  - Removed the `⚡ Start here (5/10/15 min)` callout block at the top of the manual — that callout made sense when the Quick Start was the very first chapter, but it's now superseded by the chapter being inline at 3.5.
  - Added the Quick Start as a `3.5. ⚡ ...` entry inside Part 1, between Ch3 and Ch4.
  - Reworded the "How to use this guide" bullets to reflect the new path: first-time users follow Part 1 in order (which now includes the Quick Start at 3.5); already-onboarded users can jump straight to Ch3.5 for the bare-minimum 5/10/10-minute path.
- **Other touches:**
  - Root `index.md` How-To's section updated to point at the new paths and reflect the new framing ("your first 3 actions after onboarding" instead of "X minutes to your first Y").
  - `17. Features/In-App Activation Checklist.md` (the product feature spec) updated: file refs now point at `03.5-quick-start`, the persona action lists updated to match the reshaped chapters, narrative reframed as "post-onboarding path" instead of "day-one path".
  - Log entries from the original 2026-04-27 sweep stay as-is — they're append-only history. Future readers see this entry and understand the supersession.
- **Lint:** Layer 1 still clean across the whole `01 How-To Documents/` tree after the rename.

## [2026-04-25] sync | How-To refresh against the latest product code
- Source: `C:\Users\User\Desktop\Sebenza_Hub_Claude\Sebenza_Hub_Claude_V2` at `origin/main` (commits up to e8f086e)
- Trigger: Wes asked for a How-To refresh — "CV Templates have changed completely; do the rest too."
- **Major rewrite — Individual Ch 5** ([[01 How-To Documents/individual/05-uploading-a-cv|05-uploading-a-cv]]):
  - The route `/dashboard/individual/cv-templates` now opens the **new CV Builder** at `client/src/pages/individuals/cv-builder/` — four tabs (Gallery · Signatures · Content · Favourites), Tweaks bar, Export menu (PDF/DOCX/Print). The chapter previously described a flat "5 templates and a wizard" — now describes the full builder, including the 10 role-native Signatures (Boardroom Dossier, The Ledger, README.md Terminal, Gazette Record, Patient Chart, Safety Placard, Polaroid Lookbook, Till Receipt, ID Card · Pictograms, Reference Booklet).
  - Tier corrections: CV storage caps now **Free 1 / Standard 5 / Premium unlimited** (was 1 / 3 / unlimited). **Soft Skills Detection is Premium** (was incorrectly listed as Standard). Verified against `server/seed-feature-entitlements.ts`.
  - New behaviour: upload now asks **"Replace profile information?"** before the file picker (destructive default). Added a section explaining the prompt.
  - New behaviour: async parse pipeline — file is enqueued, page polls `/api/ai-jobs/:jobId` every 2s, dedup fast-path returns cached parse if the same file was uploaded before. Documented.
  - New capability: re-parse existing CVs (`server/cv-reparse.ts`, commit 76a06e7) — useful for CVs uploaded before the PDF text extractor was improved. Documented as a My CVs action.
- **Major rewrite — Individual Ch 6** ([[01 How-To Documents/individual/06-cv-review|06-cv-review]]):
  - The CV Review page is now a 14-tab dashboard, not a single-shot review. Tabs: Overview · ATS Scanner · Keywords · Achievements · Red Flags · Readability · Benchmark · Before/After · Recruiter Lens · JD Match · Action Plan · Narrative · Bias Shield · Interview Prep · History. Documented all 14, with a "which tabs to run for which situation" matrix.
  - Tier corrections: AI CV Review caps now **Standard 10/mo · Premium 50/mo** (was 3/mo · unlimited).
  - Bullet Writer flow updated: fastest path is the new **Before/After** tab inside the review page (pre-loaded weak bullets + side-by-side rewrites), not the standalone tool.
- **Targeted fix — Individual Ch 11** ([[01 How-To Documents/individual/12-applying|11-applying]]): added a "Native applications vs external (aggregated) jobs" section. The platform now redirects external listings (PNet, Adzuna, CareerJet) to the source site instead of trying to apply through Sebenza Hub — `client/src/pages/individuals/components/QuickApplyDialog.tsx`. Without this note, a user clicking Apply on an aggregated job would be confused.
- Spot-checked but no action needed:
  - AI progress messaging system (commits eaa9f3f, 6d79766) — useful UX polish, but not chapter-changing.
  - Mobile employer pages (commit e1e89cc) — feature parity with desktop, no new workflows.
  - Capacitor native build infrastructure (commit 4f228f8) — iOS/Android scaffolding exists but no shipping app yet. Hold the "get the app" mention in account-creation chapters until the app is in the stores.
  - Trial / background-check schema columns (commit 3d7d470) — backend only, no UI yet. Update once the trial onboarding ships.
  - WhatsApp-only external job redirect (commit b0da16f) — duplicate of the web behaviour already noted in Ch 11.
- Lint:
  - **Layer 1** check on edited chapters (5, 6, 11): only matches are the pre-existing `![[13-raw/screenshots/...]]` image embeds, which the established policy treats as asset references rather than navigation (see [2026-04-20] entry).
  - **Layer 2** check on the concept/workflow targets I reference (`02-concepts/ai-features`, `03-workflows/individual-journey`): clean.
- Pages touched: 3 — Ch 5, Ch 6, Ch 11.

## [2026-04-20] ingest | Feature Catalogue — 253 features rolled into the How-To manuals
- Source: `13-raw/Features Document.pdf` (253 features across Individual 85 · Recruiter 131 · Corporate 17 · Cross-Product 13 · Platform admin-only 7)
- Reference: `c:\tmp\features-catalogue.md` (compact reference built from the PDF for agent use)
- Pilot: [[01 How-To Documents/individual/05-uploading-a-cv|Individual Chapter 5]] rewritten as format reference (features #1–6). Format: `### Feature Name — _Tier: X_` heading + **What this feature is** + **Why it matters** + **How to use it** blocks, plus a "Features covered in this chapter" table at the end.
- Execution: 7 parallel agents handled the bulk — Individual Ch 6–12, 13–17, 18–23; Recruiter Ch 4–14, 15–24, 25–34; and new Corporate book (9 chapters + index).
- Manual work: Individual Ch 1–4 and Recruiter Ch 1–3 frontmatter bumps; Individual Ch 4 tier-system explainer replaces an open question about pricing that the catalogue resolved.
- Corporate book: new `01 How-To Documents/corporate/` folder, chapters 01–09 + index.md. Covers all 17 Corporate features + cross-product notifications (#234–236), support (#237–239), Onboarding Checklists (#240), Team Collaboration (#242), API Access (#243).
- Platform admin-only features (#247–253) flagged as out of public-manual scope. Candidate for a future internal admin reference.
- Features placed:
  - Individual: 85 (all catalogue features for this user type)
  - Recruiter: 131 (all catalogue features for this user type)
  - Corporate: 17 + 9 cross-product = 26 total feature blocks
  - **Total new feature blocks across the manual: 242**
- Lint:
  - **Layer 1** (direct leaks in `01 How-To Documents/`): 3 leaks in the root `index.md` (pointing at `08-questions/`, `01-entities/`, `15-dashboards/`). All fixed + index updated to reflect all 3 published books.
  - **Layer 2** (transitive — concept/workflow pages referenced from how-tos): 25 leaks across 6 pages. All fixed. The full published surface (`01 How-To Documents/` + `02-concepts/{authentication,compliance,billing-system,rbac,multi-tenancy,application-lifecycle,ai-features,whatsapp-integration}` + `03-workflows/{individual-journey,recruiter-journey,business-journey}`) is now lint-clean.
  - Image embeds `![[13-raw/screenshots/...]]` are asset references, not navigation, and were left alone — they ship as images with the published page.
- Pages touched: 56 How-To chapters + 10 new Corporate files + root `01 How-To Documents/index.md` + 3 per-book `index.md` + 6 concept/workflow pages for Layer 2 fixes = **76 files changed**.
- Open decisions:
  - Corporate book has no Ch 4.5 "how we charge" equivalent (the Recruiter book has one). The Corporate pricing model is not in the catalogue. Flag for later.
  - Agent 7 omitted screenshot embeds for the new Corporate chapters (images for those flows don't exist yet in `13-raw/screenshots/`). Flag for a screenshot pass once the Corporate UI is stable.
  - Ch 19 Individual (Level Up) carries 23 features — longest chapter in the manual. Reads as a reference, not an essay. Watch for reader fatigue; consider splitting if we add more features later.

## [2026-04-20] sync | Repo audit — 151 commits since 2026-04-11
- Source: `C:\Users\User\Desktop\Sebenza_Hub_Claude\Sebenza_Hub_Claude_V2` (local clone), PRs #295–#311+
- Summary: [[09-sources/repo-sync-2026-04-20]]
- Window: 2026-04-11 → 2026-04-20 (9 days)
- Schema: tables 794 → 820 (+26); migrations 0028–0036 (+9)
- Five dominant themes:
  - **WhatsApp AI Phase 0–6** (2026-04-19) — intent AI default-on, RAG FAQ from `wiki_pages`, escalation summarisation, Whisper voice transcription, AI reply drafts, bidirectional translation. Linda now genuinely AI-powered.
  - **Flow Builder maturation** — authoritative runtime (overrides hardcoded state machine), versioning, simulator, analytics, 7 cron triggers with dedupe, 10 new action types, event wiring, two-tab editor (My Flows / Permanent).
  - **POPIA AI consent rollout** (2026-04-17/18) — `ai_processing` consent enforced at `POST /api/applications`; AI disclosure badges in public job detail + QuickApplyDialog; Privacy Policy page at `/privacy`; signup consent persists to `popia_consents`; demographic opt-in added.
  - **Individual dashboard de-hardcode** (2026-04-18) — 9 areas switched from demo to real data: mentorship, micro-learning, peer-teaching, job-linked learning, study planner, skill tree, portfolio, learning analytics, interview practice (21 new tables, verify script added).
  - **Security & infra** — 3 Dependabot patches, `crypto.randomBytes` for tokens, 5 AI-intelligence endpoints role-gated, pre-merge CI (tsc + static-analysis + smoke e2e), SQL migration runner on boot, readiness endpoint, runbooks for secrets rotation / git scrub / migration rename.
- Other notable: platform-wide Admin Pay Equity dashboard, WhatsApp magic-link auth, team invitation acceptance flow with owner designation, Smart Match (candidate ↔ specific job), AI Candidate Search v2 with keyword filtering, centralized pricing + unified AI-Governance/billing registries, Claude Opus model bump to 4.7.
- Pages touched: [[01-entities/sebenza-hub]], [[01-entities/whatsapp-bot]], [[01-entities/individual-user]], [[01-entities/recruiter-user]], [[01-entities/admin-user]], [[02-concepts/whatsapp-integration]], [[02-concepts/ai-features]], [[02-concepts/compliance]], [[02-concepts/billing-system]], [[index]]
- New pages: [[09-sources/repo-sync-2026-04-20]]
- Contradictions resolved: [[09-sources/sa-ai-policy-compliance-review-2026-04-11]] flagged AI-specific POPIA consent as a critical gap — now **partially resolved** (consent enforced, disclosures live, privacy page up). Remaining: POPIA Section 71 representation mechanism, bias audit operationalisation, data minimisation for AI endpoints.
- Open questions raised: Does RAG-on-`wiki_pages` draw from this wiki or an internal table? What's the post-Phase-1 fallback rate? Which AI provider powers each WhatsApp phase? Are the 7 cron triggers active in production or seeded-only?

## [2026-04-11] ingest | SA National AI Policy — Compliance Review
- Source: `13-raw/articles/sa-ai-policy-compliance-review.md`
- Summary: [[09-sources/sa-ai-policy-compliance-review-2026-04-11]]
- Pages touched: [[02-concepts/compliance]], [[02-concepts/ai-features]], [[index]]
- New pages created: [[09-sources/sa-ai-policy-compliance-review-2026-04-11]], [[04-standards/sa-national-ai-policy]]
- Key findings:
  - Draft SA National AI Policy (Gazette 54477, Cabinet-approved 25 March 2026) classifies recruitment AI as **HIGH risk**
  - 4 Sebenza Hub features in high-risk tier: Predictive Hiring, Job Matching, Battle Cards, Assessment Scoring
  - Gaps found across all 6 policy principles — most critical: candidate transparency, bias audit operationalisation, AI-specific POPIA consent
  - 10 prioritised action items; 12–18 months before high-risk enforcement
  - Public comment period closes 10 June 2026
- Contradictions flagged:
  - Bias audit infrastructure (DB tables, admin dashboard) exists but is not operationalised — plumbing without processes
  - General POPIA consent exists but AI-specific consent (required by policy) does not
  - AI features page describes governance capabilities that aren't candidate-facing

## [2026-04-11] evolve | Overview rewritten — post-hardening, post-Linda, post-how-tos
- Overview rewritten to reflect current state as of 2026-04-11
- Key shifts:
  - **Stats corrected**: API endpoints 3,586→3,741; AI features now 152 (was inflated); test templates 96 (was inflated)
  - **Linda named**: WhatsApp bot section rewritten around named persona, v2 manual capabilities (sentiment scoring, 3 screening modes, knockout questions)
  - **How-to guides tracked**: Added how-to column to Four Pillars table; 57 chapters across Individual (23) and Recruiter (34) now reflected
  - **Security & Infrastructure section added**: Zero vulnerabilities, multi-tenant fix, Neon→PostgreSQL migration, unified billing
  - **Documentation maturity tracked**: New "Documentation & Knowledge Base" section with asset counts (82 pages, 13 sources, 57 how-tos, 9 tweets, 3 procedures)
  - **Emerging themes updated**: Linda elevated from "strategic" to "first-class product"; added documentation momentum theme; added infrastructure stabilisation theme
  - **WhatsApp bot manual reference updated**: v1→v2, added procedures cross-ref
- Pages touched: [[overview]]

## [2026-04-11] sync | Repo audit — latest codebase changes
- Source: `github.com/Sebenza-Hub-V001/Sebenza_Hub_Claude_V2` (pulled to local, includes PRs #265-#284)
- Key changes:
  - **Linda in codebase confirmed** (`cfb71f7`): `botName` default = "Linda" in `shared/schema.ts`, all 6 SA-language greetings in `server/whatsapp-bot.ts` use the name. Resolved open question in [[01-entities/whatsapp-bot]].
  - **Platform stats corrected** (`f0a59cb`): AI Features 134→152 (display 150+), Test Templates 300→96 (display 95+). Updated [[01-entities/sebenza-hub]].
  - **Business billing added** (`b359c31`): New `BusinessBilling.tsx`, shared `DashboardPlanCards.tsx` across all 3 user dashboards, centralised `plans.ts` data file. Updated [[02-concepts/billing-system]].
  - **Neon → local PostgreSQL** (`0c70182`): Switched from Neon serverless to local PostgreSQL with dotenv. Updated [[02-concepts/tech-stack]] and [[01-entities/sebenza-hub]].
  - **Multi-tenant security fix** (`c6890be`): Candidate routes now scoped to caller's org. Updated [[02-concepts/multi-tenancy]].
  - **All 25 vulnerabilities fixed** (`2f2a76c`): 0 remaining. Noted in [[01-entities/sebenza-hub]].
  - **E2E tests** (`d5ccb92`): Comprehensive recruiter + public flow tests added.
  - **WhatsApp templates** (`1098704`): Drag-and-drop + UI key management.
- Pages touched: [[01-entities/sebenza-hub]], [[01-entities/whatsapp-bot]], [[02-concepts/tech-stack]], [[02-concepts/billing-system]], [[02-concepts/multi-tenancy]], [[index]]

## [2026-04-11] ingest | Linda — WhatsApp Bot Training Manual v2
- Source: `13-raw/articles/whatsapp-bot-training-manual-v2.md`
- Summary: [[09-sources/whatsapp-bot-training-manual-v2-2026-04-11]]
- Supersedes: [[09-sources/whatsapp-bot-training-manual-2026-04-07]]
- Pages touched: [[01-entities/whatsapp-bot]], [[index]]
- New pages created: [[09-sources/whatsapp-bot-training-manual-v2-2026-04-11]]
- Key updates: bot officially named "Linda"; added sentiment scoring thresholds (positive >30, negative <-30, escalation at 3+ consecutive <-50); three screening modes (Quick Screen, Template Screen, Live Assist); knockout questions; self-service screening links; full WhatsApp Apply section; troubleshooting FAQ; expanded global commands
- Contradictions flagged: none new (carried forward multi-language tension from v1)

## [2026-04-10] ingest | Database ERD — Full Schema Map
- Source: `13-raw/data/database-erd.md`
- Summary: [[09-sources/database-erd-2026-04-10]]
- Pages touched: [[02-concepts/tech-stack]], [[01-entities/sebenza-hub]], [[overview]], [[09-sources/repo-audit-2026-04-07]], [[index]]
- New pages created: [[09-sources/database-erd-2026-04-10]]
- Key updates: 755 → 794 tables across all references; added 29-domain breakdown with FK counts; documented hub tables (`users` 461 FKs, `organizations` 333 FKs); flagged 3 open questions (39-table growth source, "Other" domain cleanup, missing FKs on `placements`/`submissions`)
- Contradictions flagged: table count updated from 755 (April 7) to 794 (April 10) — 39 new tables in 3 days

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
- Context: follow-up to the recruiter how-to completion. The recruiter and individual how-tos reference 7 concept pages and 2 workflow pages — these are part of the public `sebenzahub-manual` Publish surface (everything inside `01 How-To Documents/` plus the concept/workflow pages those chapters link to). Same cross-site leak rule applies to these pages.
- Scan results: **45 leaks across 8 published files** (1 page — `02-concepts/whatsapp-integration` — was missed in the first scan but caught and cleaned in the same pass; 1 page — `02-concepts/billing-system` — was missed in the first scan because it's only referenced from Chapter 4.5, but caught and cleaned after a complete cross-reference grep). The 9th page caught later was `03-workflows/individual-journey`.
- Strategy: same Option A (strip and rewrite) used in the original `01 How-To Documents/individual/` cleanup. Three patterns:
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
- Re-scan after cleanup: **0 leaks across all 9 files**. Re-scan of `01 How-To Documents/individual/` and `01 How-To Documents/recruiter/` (35 + 23 = 58 chapter files): **0 leaks**.
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
  - `03-workflows/admin-journey` (8 leaks) — Admin runbooks live in `05-procedures/`, not `01 How-To Documents/admin/`
  These can be hidden in the Obsidian Publish Navigation UI for `sebenzahub-manual` and remain publishable on the internal `sebenzahub` site.
- **User action still needed in Obsidian Publish:**
  - Show the 9 cleaned files in the Navigation UI for `sebenzahub-manual`
  - Hide the 5 internal-only files listed above
  - The full public publishing list is now: 01 How-To Documents/individual/* + 01 How-To Documents/recruiter/* + the 9 concept/workflow files above

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
- Cross-site leak rule (from earlier session) enforced throughout — every chapter only links to `02-concepts/`, `03-workflows/`, or other `01 How-To Documents/recruiter/` chapters. Re-grepped the full folder after each batch; final scan: 0 leaks across all 36 files.
- New pages created:
  - [[01 How-To Documents/recruiter/index]] — How-to table of contents
  - [[01 How-To Documents/recruiter/01-what-sebenza-hub-is-for-recruiters]] through [[01 How-To Documents/recruiter/34-advanced-and-platinum]] (35 chapters)
  - [[08-questions/recruiter-training-manual-plan]] — Plan and outline (filed earlier in session, marked complete)
- Existing pages updated:
  - [[08-questions/trust-tier-calculation]] — Resolution section added with full formula
  - [[08-questions/subscription-plans]] — Resolution section added with full plan table
- Memory persisted: codebase location reference saved so future sessions can grep `C:\Users\User\Desktop\Sebenza_Hub_Claude\Sebenza_Hub_Claude_V2` without asking for the path.
- Outstanding (deferred):
  - The 7 `02-concepts/` and `03-workflows/` pages the recruiter how-to references all have their own cross-site leaks to internal folders. Lint pass run; ~40 leaks identified across 7 files. Cleanup pending user go-ahead.
  - Screenshots — same status as Individual how-to.
  - Business and Admin how-tos — not yet planned. Note: user has filed [[05-procedures/admin-whatsapp-command-center-setup]], [[05-procedures/admin-whatsapp-tab-reference]], and [[05-procedures/admin-whatsapp-morning-routine]] as internal-only admin runbooks (correctly placed under `05-procedures/`, not `01 How-To Documents/admin/`, to keep them off the public site).

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
- Filed: [[05-procedures/admin-whatsapp-command-center-setup]] — internal-only (under `05-procedures/`, NOT `01 How-To Documents/admin/`, to keep it off the public `sebenzahub-manual` site).
- Scope: full setup (Meta prerequisites → credential paste → webhook verification → test message → bot toggle → bot settings → templates → bot training → automation/flows) PLUS day-to-day operations across all 21 tabs (Command Center, Conversations, Team Inbox, Campaigns, Broadcast Studio, Compliance, Quality & CSAT, AI Intelligence, Contact CRM, Deep Analytics, Replay & Debug, AI Matcher, Growth Engine, DNA Analyzer, War Room) plus operational rhythms, troubleshooting, and reference appendix (env vars, API endpoints, DB tables).
- Format: numbered runbook with screenshot-to-take placeholders (📸) and pull quotes for warnings/tips.
- Sources: codebase exploration of `Sebenza_Hub_Claude_V2` — `client/src/pages/admin/AdminWhatsApp.tsx` (5,491 lines, 21 tabs), `server/whatsapp.ts`, `server/routes.ts` (~30 admin WhatsApp endpoints), `shared/schema.ts` (10 whatsapp tables), and `docs/WhatsApp-Bot-Training-Manual.md` (784 lines, mined for tab-by-tab descriptions).
- User screenshots: Sebenza Hub Configuration tab (Connected banner + Bot OFF strip), Meta App Basic settings, Meta Webhook Configuration page.
- Pages touched: [[index]] (added new "Procedures" section between Workflows and Sources).

## [2026-04-09] lint | Cross-site leak scan + cleanup of `01 How-To Documents/individual/`
- Context: vault publishes to two Obsidian Publish sites — `sebenzahub` (internal, full vault) and `sebenzahub-manual` (public, end-user how-to guide). Per-site visibility is controlled in the Publish Navigation UI; hidden pages still resolve by direct URL.
- Updated [[CLAUDE]]:
  - Added a **Cross-site leaks** check to the Lint workflow (rule: any `[[wiki-link]]` inside `01 How-To Documents/` that targets a folder other than `01 How-To Documents/`, `02-concepts/`, or `03-workflows/` is a leak).
  - Added a **Two-Site Publish** subsection under Domain-Specific Extensions documenting the two sites, allowed/forbidden link targets, and authoring rules for `01 How-To Documents/` pages.
- Scan results: 47 leak instances across 21 files in `01 How-To Documents/individual/`, hitting 5 internal folders (`01-entities/`, `06-comparisons/`, `08-questions/`, `15-dashboards/`, plus one mid-chapter Open question pattern).
- Fix strategy applied: **Option A — strip and rewrite.**
  - Removed all internal-folder links from References sections in chapters 01–23 + index. Where stripping left a section thin, added an adjacent `01 How-To Documents/individual/` chapter link.
  - Rewrote 4 mid-chapter "Open question" callouts as plain "Heads up" prose: chs 6 (CV Review pricing), 11 (Cover Letter pricing), 16 (Salary Negotiator pricing), 19 (Learning Paths curation).
  - Rewrote chapter 20 (Autopilot): converted internal `## Open question` section to `## What we'll cover in a future update` with no links; de-leaked the partial-draft warning at the top.
  - Updated [[01 How-To Documents/individual/index]]: removed internal references (Plan, Feature inventory, Dashboard layout); kept Source spine (`03-workflows/individual-journey`, allowed).
- Files touched: 22 files, 28 edits total. Re-scan confirms zero leaks remaining in `01 How-To Documents/individual/`.
- Allowed cross-folder targets still in use (must be **shown** on the how-to site): `02-concepts/authentication`, `02-concepts/compliance`, `02-concepts/ai-features`, `02-concepts/application-lifecycle`, `03-workflows/individual-journey`.
- Outstanding (not done in this pass):
  - User must still hide internal folders in the Obsidian Publish Navigation UI for `sebenzahub-manual` (no file-based config to set).
  - The 5 published `02-concepts/` and `03-workflows/` pages above need their own leak scan, since they're now part of the public surface area.
  - Recruiter / business / admin how-tos are not yet drafted; same lint rule will apply when they are.

## [2026-04-09] tweet | Claude Code + Obsidian Second Brain — @aiedge_
- Source: https://x.com/aiedge_/status/2041908011078447222
- Filed: [[10-tweets/08-aiedge-claude-obsidian-second-brain]]
- Fidelity note: X blocked direct scraping (HTTP 402); content reconstructed via reader-proxy summary. Exact tweet text not preserved verbatim. Confidence: medium. Re-ingest when direct access is restored.
- Recommendations: 5 (top: adopt Marp for empty 11-presentations/; add Dataview queries to index.md; install Obsidian Web Clipper for ingestion)
- Cross-references: the tweet is redundant with [[10-tweets/04-karpathy-llm-knowledge-bases]], [[10-tweets/03-farzatv-farzapedia-personal-wiki]], [[10-tweets/06-neilxbt-obsidian-claude-memory]] at the architectural level, but adds a concrete tool stack (Marp, Dataview, qmd, Web Clipper) that was not previously named
- Pages touched: [[index.md]] (Tweets section, page count 79 → 80)
- No entity/concept pages edited — the recommendations are wiki-tooling-level, not platform-level

## [2026-04-09] tweet | Claude Managed Agents — @NickSpisak_
- Source: https://x.com/NickSpisak_/status/2041949191887262164
- Filed: [[10-tweets/09-nickspisak-claude-managed-agents]]
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
  - Removed misleading [[Chapter 7]] cross-link in [[01 How-To Documents/individual/03-onboarding]] (job preferences live in Settings, not Ch 7)
  - Hedged unverified factual claim in [[01 How-To Documents/individual/08-privacy-and-popia]] about per-organisation blocking (was asserting nonexistence; now invites users to check Settings)
  - Hedged unsupported "at least a third" silent-application statistic in [[01 How-To Documents/individual/12-applying]] to "a meaningful fraction"
- No structural changes; no chapters rewritten; no content cut

## [2026-04-09] update | Individual How-To Guide — Parts 3, 4, 5, 6 drafted (how-to complete)
- Drafted full bodies for chapters 9–23 (with Ch 20 as a partial pending the Autopilot open question):
  - Part 3 (Find and Apply): [[01 How-To Documents/individual/09-search-modes]], [[01 How-To Documents/individual/10-saved-searches-and-favourites]], [[01 How-To Documents/individual/12-applying]], [[01 How-To Documents/individual/13-tracking-applications]]
  - Part 4 (Interview and Offer): [[01 How-To Documents/individual/14-interview-simulator]], [[01 How-To Documents/individual/11-company-research]], [[01 How-To Documents/individual/15-receiving-an-offer]], [[01 How-To Documents/individual/16-salary-negotiator]]
  - Part 5 (Troubleshooting): [[01 How-To Documents/individual/17-no-responses]], [[01 How-To Documents/individual/18-no-direction]], [[01 How-To Documents/individual/19-level-up]]
  - Part 6 (Advanced): [[01 How-To Documents/individual/20-autopilot]] (partial — blocked on operational details), [[01 How-To Documents/individual/21-career-dna]], [[01 How-To Documents/individual/22-market-radar]], [[01 How-To Documents/individual/23-community-and-mentorship]]
- Plan checklist updated: Parts 3–6 marked complete; Ch 20 noted as partial
- All 23 chapters of the Individual How-To Guide now have body content (Ch 20 still labelled partial in-page)
- Outstanding open questions still flagged inline in affected chapters: Autopilot operational behaviour (Ch 20), pricing tiers (Ch 6, Ch 11, Ch 16), Learning Path curation (Ch 19)
- Next: screenshot capture pass; review/edit pass on full how-to guide; sibling how-tos for Recruiter / Business / Admin

## [2026-04-09] update | Individual How-To Guide — Part 2 drafted
- Drafted full bodies for chapters 5–8 (Build Your Profile):
  - [[01 How-To Documents/individual/05-uploading-a-cv]] — upload vs build routes, AI parsing review, multiple CV versions
  - [[01 How-To Documents/individual/06-cv-review]] — what CV Review checks, how to read feedback, what it doesn't do
  - [[01 How-To Documents/individual/07-skills-credentials-video]] — skills with proficiency, verifications, credentials, video intro, portfolio (when each matters)
  - [[01 How-To Documents/individual/08-privacy-and-popia]] — public vs private, public profile preview, POPIA rights, notification settings
- Plan checklist updated: Part 2 marked complete
- Pricing-tier open question still flagged in Chapter 6 (CV Review may be paid)
- Next: Part 3 (chapters 9–12, Find and Apply to Jobs)

## [2026-04-09] new | Individual How-To Guide — plan + Part 1 drafted
- Plan filed: [[08-questions/individual-training-manual-plan]]
- New directory: `01 How-To Documents/` (how-to guides top-level)
- New how-to scaffold: [[01 How-To Documents/individual/index]] (23 chapters across 6 parts)
- Part 1 drafted (chapters 1–4):
  - [[01 How-To Documents/individual/01-what-sebenza-hub-is]] — what the platform is and who it's for
  - [[01 How-To Documents/individual/02-creating-your-account]] — magic-link sign-up walkthrough
  - [[01 How-To Documents/individual/03-onboarding]] — six onboarding fields + POPIA consent
  - [[01 How-To Documents/individual/04-first-10-minutes]] — dashboard orientation tour
- Chapters 5–23 scaffolded (frontmatter, outline, source pages, checklist) — bodies pending
- Chapter 20 (Autopilot) blocked on open question carried over from [[01-entities/individual-user]]
- Index updated; `01 How-To Documents/` added as new top-level directory under Manuals
- Pending: drafting Parts 2–6, screenshot capture, sibling how-tos for Recruiter / Business / Admin

## [2026-04-08] tweet | Obsidian Gives Claude the Memory It Was Never Born With
- Source: https://x.com/neil_xbt/status/2041779011336999021
- Filed: [[10-tweets/06-neilxbt-obsidian-claude-memory]]
- Recommendations: 5 (top: session context files for AI Copilot, persistent career context for Individuals, WhatsApp bot session continuity)
- Pages touched: [[10-tweets/04-karpathy-llm-knowledge-bases]], [[10-tweets/03-farzatv-farzapedia-personal-wiki]] (cross-references added)

## [2026-04-08] tweet | Systematic Debugging Methodology Prompt (8-Step Detective Thinking)
- Source: https://x.com/roundtablespace/status/2035631314691387534
- Filed: [[10-tweets/07-roundtablespace-debugging-methodology-prompt]]
- Recommendations: 5 (top: AI Output Debugging Dashboard for admin, Screening Bot Root Cause Analysis, WhatsApp Bot Debugging Mode)
- Pages touched: [[10-tweets/02-explorax-20-agentic-skills]] (cross-reference added)

## [2026-04-08] tweet | Hidden Claude Code Features (Channels, /batch, Agent Teams, Hooks, /loop)
- Source: https://x.com/coreyganim/status/2041596621591629915
- Filed: [[10-tweets/05-coreyganim-hidden-claude-code-features]]
- Recommendations: 6 (top: event-driven AI architecture via Channels pattern, AI output quality gates via TaskCompleted hook pattern, parallel AI processing via /batch pattern)
- Pages touched: [[10-tweets/01-aiedge-claude-skills-guide]] (cross-reference added)

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
- Filed: [[10-tweets/04-karpathy-llm-knowledge-bases]]
- Recommendations: 6 (top: AI-compiled company research for Individuals, LLM-maintained talent market wiki, knowledge base for screening bot)
- Pages touched: none (recommendations filed, not yet implemented)

## [2026-04-07] tweet | Farza — Farzapedia Personal Wiki
- Source: https://x.com/FarzaTV/status/2040563939797504467
- Filed: [[10-tweets/03-farzatv-farzapedia-personal-wiki]]
- Recommendations: 5 (top: agent-queryable candidate wikis for Recruiters, personal career wiki for Individuals, agent-first data architecture)
- Pages touched: [[10-tweets/04-karpathy-llm-knowledge-bases]] (cross-reference added)

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
- Filed: [[10-tweets/02-explorax-20-agentic-skills]]
- Recommendations: 6 (top: AI Skills Registry to decouple AI behaviour from code, Content Repurposing for job postings across WhatsApp/LinkedIn/email, Competitive Intelligence Dashboard for recruiters)
- Pages touched: [[10-tweets/04-karpathy-llm-knowledge-bases]], [[10-tweets/03-farzatv-farzapedia-personal-wiki]] (cross-referenced)
- Total wiki pages: 41 (+7 raw docs)

## [2026-04-07] tweet | AI Edge — Claude Skills Ultimate Guide
- Source: https://x.com/aiedge_/status/2036815449225298369
- Filed: [[10-tweets/01-aiedge-claude-skills-guide]]
- Recommendations: 6 (top: Skill-like architecture for AI features with progressive loading, A/B testing for AI prompts, trigger optimisation for WhatsApp bot)
- Pages touched: [[10-tweets/02-explorax-20-agentic-skills]] (cross-referenced)
- Total wiki pages: 42 (+7 raw docs)

## [2026-04-07] evolve | Added Presentations folder
- Created `11-presentations/` directory for slide decks, pitch materials, and presentation content
- Updated index.md with Presentations section
- Updated CLAUDE.md directory structure

## [2026-04-12] tweet | bloggersarvesh — Claude Cowork as Chief of SEO
- Source: https://x.com/bloggersarvesh/status/2036795618090520592
- Filed: [[10-tweets/10-bloggersarvesh-claude-cowork-chief-of-seo]]
- Recommendations: 7 (top: (1) run the 20-prompt audit against sebenzahub.co.za itself — closes 3 of 4 SEO gaps for ~zero cost, (2) ship a "Local SEO Audit" AI feature in recruiter/business dashboards, (3) formalise the "Chief of X" pattern as a Sebenza Hub AI architecture primitive)
- Pages touched: [[02-concepts/seo-strategy]] (added cross-reference + tweet link in References section, bumped `updated` to 2026-04-12)
- New pages created: [[10-tweets/10-bloggersarvesh-claude-cowork-chief-of-seo]]
- Contradictions flagged: none — the article's 40/25/15/20 section split (GBP / website / backlinks / content) may contradict the traditional agency "link building is where the leverage is" narrative, but this is flagged as an Open Question rather than a contradiction with existing wiki content
- Fidelity note: X/Twitter blocked direct article scraping (HTTP 402) at ingest time; structural summary was reconstructed from the fxtwitter card. Verbatim prompt text for the 20 prompts was NOT recovered — re-ingest from original source before shipping Rec #2 or #3. Confidence: medium.
- Total wiki pages: 85 (+11 raw docs)
