---
title: "Screenshot Capture Plan — How-To Manuals"
type: task
created: 2026-04-20
updated: 2026-04-28
tags: [screenshots, documentation, capture-plan, how-tos, salary-calculator]
status: active
---

# Screenshot Capture Plan — How-To Manuals

Master list of every screenshot placeholder across the Individual / Recruiter / Corporate How-To books. Use this as a capture checklist — tick the Status column as each file is shot and dropped into the public screenshots folder.

## Conventions

- **Naming:** `<book-prefix>-chNN-<feature-or-topic-slug>.png`
  - Individual: `i-chNN-...`
  - Recruiter: `r-chNN-...` (Ch 4.5 uses `r-ch04-5-...`)
  - Corporate: `c-chNN-...` (Ch 4.5 uses `c-ch045-...`)
- **Location:** All NEW files go under `01 How-To Documents/screenshots/` (the public surface). The 11 originals also live in `13-raw/screenshots/` (kept untouched per the immutability rule); don't add new files there — they won't render on the public site because `13-raw/` is hidden in the Publish Navigation UI.
- **Shared files:** `ch02-magic-link-email.png` is reused across all three books (auth flow is identical). Don't recapture.
- **Rendering:** Embeds in chapter files use **filename-only** syntax: `![[c-ch045-corporate-dashboard-full-view.png]]` — never include the folder path. Obsidian resolves filename-only embeds from anywhere in the vault, so embeds keep working if a file is moved.

## Priority tiers (guidance)

- **Must-have** (tier 1): any "Complex UI" shot — kanbans, trees, charts, heatmaps. Text can't describe these.
- **Should-have** (tier 2): "Result/output" and "Decision point" shots — reinforce what the user sees at pivotal moments.
- **Nice-to-have** (tier 3): "Nav/locate" shots — useful but replaceable with good prose.

Default is should-have. When prioritising capture order, shoot Complex UI first.

## Existing screenshots (already captured, don't redo)

These 11 files already live in `13-raw/screenshots/`:

- `ch02-magic-link-email.png` · `ch02-magic-link-login.png` · `ch02-signup-landing-page.png`
- `ch03-onboarding-quick-start.png` · `ch03-role-selection.png`
- `ch04-sidebar-hiring-path.png` · `ch04-sidebar-parallel-tracks.png` · `ch04-sidebar-supporting.png` · `ch04-sidebar-tour-highlights.png`
- `ch05-resume-upload-dialog.png` · `ch05-cv-builder-personal-info.png`

---

# Individual Book (91 placeholders — 11 existing, 80 to capture)

## Ch 06 — CV Review (4)

| #   | Filename                          | URL                                                         | Type     | What to capture                                                    | Status |
| --- | --------------------------------- | ----------------------------------------------------------- | -------- | ------------------------------------------------------------------ | ------ |
| 1   | i-ch06-cv-review-nav              | https://www.sebenzahub.co.za/dashboard/individual/cv-review | Nav      | CV Review item highlighted in the individual sidebar               | [ ]    |
| 2   | i-ch06-cv-review-select-dialog    | https://www.sebenzahub.co.za/dashboard/individual/cv-review | Decision | "Run review" CV picker dialog                                      | [ ]    |
| 3   | i-ch06-cv-review-score-card       | https://www.sebenzahub.co.za/dashboard/individual/cv-review | Output   | Full score card with section-by-section breakdown                  | [ ]    |
| 4   | i-ch06-bullet-writer-before-after | https://www.sebenzahub.co.za/dashboard/individual/cv-review | Output   | Bullet Writer: weak bullet vs rewritten impact bullet side-by-side | [ ]    |

## Ch 07 — Skills, Credentials, Video (5)

| #   | Filename                           | URL                                                             | Type       | What to capture                                         | Status |
| --- | ---------------------------------- | --------------------------------------------------------------- | ---------- | ------------------------------------------------------- | ------ |
| 1   | i-ch07-profile-skills-nav          | https://www.sebenzahub.co.za/dashboard/individual/profile       | Nav        | Profile page with Skills/Credentials/Video tabs visible | [ ]    |
| 2   | i-ch07-competency-test-interface   | https://www.sebenzahub.co.za/dashboard/individual/tests         | Complex UI | In-browser test with timer + question panel             | [ ]    |
| 3   | i-ch07-credential-gap-output       | https://www.sebenzahub.co.za/dashboard/individual/credentials   | Output     | Ranked gap list (critical / useful / nice-to-have)      | [ ]    |
| 4   | i-ch07-credential-roadmap-timeline | https://www.sebenzahub.co.za/dashboard/individual/credentials   | Complex UI | Visual time-sequenced roadmap (12/24-month plan)        | [ ]    |
| 5   | i-ch07-video-profile-recorder      | https://www.sebenzahub.co.za/dashboard/individual/video-profile | Decision   | Browser recorder with preview panel                     | [ ]    |

## Ch 08 — Privacy and POPIA (2)

| #   | Filename                     | URL                                                        | Type     | What to capture                                                        | Status |
| --- | ---------------------------- | ---------------------------------------------------------- | -------- | ---------------------------------------------------------------------- | ------ |
| 1   | i-ch08-popia-consent-toggles | https://www.sebenzahub.co.za/dashboard/individual/settings | Decision | Settings → Privacy panel with public/private toggle + consent switches | [ ]    |
| 2   | i-ch08-popia-data-rights-card | https://www.sebenzahub.co.za/dashboard/individual/settings | Decision | Privacy tab → POPIA & Data Rights card with green compliance badge, rights list, and **Export My Data** button | [ ]    |

## Ch 09 — Search Modes (5)

| #   | Filename                       | URL                                                             | Type     | What to capture                                                 | Status |
| --- | ------------------------------ | --------------------------------------------------------------- | -------- | --------------------------------------------------------------- | ------ |
| 1   | i-ch09-search-modes-nav        | https://www.sebenzahub.co.za/dashboard/individual/all-jobs      | Nav      | Sidebar showing All Jobs, Auto Match, Manual Search             | [ ]    |
| 2   | i-ch09-all-jobs-results        | https://www.sebenzahub.co.za/dashboard/individual/all-jobs      | Result   | All Jobs page with results + sidebar filters                    | [ ]    |
| 3   | i-ch09-auto-match-ranked-list  | https://www.sebenzahub.co.za/dashboard/individual/auto-match    | Output   | Ranked match list with % scores and matched/missing skill chips | [ ]    |
| 4   | i-ch09-manual-search-filters   | https://www.sebenzahub.co.za/dashboard/individual/manual-search | Decision | Advanced filters panel (salary, B-BBEE, remote, etc.)           | [ ]    |
| 5   | i-ch09-match-score-explanation | https://www.sebenzahub.co.za/dashboard/individual/auto-match    | Output   | Click into a match score for the expanded reasons panel         | [ ]    |

## Ch 10 — Saved Searches & Favourites (4)

| #   | Filename                             | URL                                                              | Type     | What to capture                                                | Status |
| --- | ------------------------------------ | ---------------------------------------------------------------- | -------- | -------------------------------------------------------------- | ------ |
| 1   | i-ch10-saved-searches-favourites-nav | https://www.sebenzahub.co.za/dashboard/individual/saved-searches | Nav      | Sidebar showing Saved Searches + Favourites                    | [ ]    |
| 2   | i-ch10-saved-search-create-dialog    | https://www.sebenzahub.co.za/dashboard/individual/saved-searches | Decision | Save-query dialog with alert frequency dropdown                | [ ]    |
| 3   | i-ch10-favourites-list               | https://www.sebenzahub.co.za/dashboard/individual/favourites     | Result   | Favourites page with bookmarked job cards                      | [ ]    |
| 4   | i-ch10-notifications-settings        | https://www.sebenzahub.co.za/dashboard/individual/settings       | Decision | Settings → Notifications matrix (email/SMS/WhatsApp per event) | [ ]    |

## Ch 11 — Applying (7)

| #   | Filename                         | URL                                                            | Type       | What to capture                                              | Status |
| --- | -------------------------------- | -------------------------------------------------------------- | ---------- | ------------------------------------------------------------ | ------ |
| 1   | i-ch11-apply-flow-nav            | https://www.sebenzahub.co.za/dashboard/individual/all-jobs     | Nav        | A specific job listing with the Apply button highlighted     | [ ]    |
| 2   | i-ch11-jd-decoder-output         | https://www.sebenzahub.co.za/dashboard/individual/all-jobs     | Output     | JD Decoder tool: must-have / nice-to-have / red-flags panels | [ ]    |
| 3   | i-ch11-cover-letter-draft        | https://www.sebenzahub.co.za/dashboard/individual/cover-letter | Output     | Generated draft with tone selector visible                   | [ ]    |
| 4   | i-ch11-quick-apply-confirmation  | https://www.sebenzahub.co.za/dashboard/individual/all-jobs     | Decision   | One-click Quick Apply confirmation modal                     | [ ]    |
| 5   | i-ch11-application-portal-kanban | https://www.sebenzahub.co.za/dashboard/individual/portal       | Complex UI | Application Portal kanban with stage columns                 | [ ]    |
| 6   | i-ch11-ai-feedback-card          | https://www.sebenzahub.co.za/dashboard/individual/applications | Output     | Submitted-app detail → Feedback tab with score + suggestions | [ ]    |
| 7   | i-ch11-priority-badge            | https://www.sebenzahub.co.za/dashboard/individual/applications | Decision   | Mark-as-priority toggle + priority badge on a submitted app  | [ ]    |

## Ch 12 — Tracking Applications (4)

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | i-ch12-my-applications-list | https://www.sebenzahub.co.za/dashboard/individual/applications | Result | Flat sortable list of applications with status column | [ ] |
| 2 | i-ch12-application-tracker-kanban | https://www.sebenzahub.co.za/dashboard/individual/application-tracker | Complex UI | Kanban board with counts per stage | [ ] |
| 3 | i-ch12-analytics-dashboard | https://www.sebenzahub.co.za/dashboard/individual/application-analytics | Complex UI | Hero dashboard with response rate, time-to-response, source breakdown | [ ] |
| 4 | i-ch12-candidate-hub-overview | https://www.sebenzahub.co.za/dashboard/individual/candidate-hub | Result | Aggregate landing page with upcoming actions | [ ] |

## Ch 13 — Interview Simulator (9)

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | i-ch13-simulator-landing | https://www.sebenzahub.co.za/dashboard/individual/interview-simulator | Nav | Interview Simulator landing page with sidebar | [ ] |
| 2 | i-ch13-prep-kit-output | https://www.sebenzahub.co.za/dashboard/individual/interview-simulator | Output | Interview Prep Kit consolidated document | [ ] |
| 3 | i-ch13-anxiety-toolkit | https://www.sebenzahub.co.za/dashboard/individual/interview-simulator | Complex UI | Anxiety Toolkit: breathing exercises + reframe prompts | [ ] |
| 4 | i-ch13-star-builder | https://www.sebenzahub.co.za/dashboard/individual/interview-simulator | Decision | STAR Response Builder form walking through S/T/A/R | [ ] |
| 5 | i-ch13-simulator-session | https://www.sebenzahub.co.za/dashboard/individual/interview-simulator | Complex UI | In-session simulator (video/text mode) | [ ] |
| 6 | i-ch13-ai-interview-chat | https://www.sebenzahub.co.za/dashboard/individual/interview-simulator | Complex UI | Chat-based AI interview thread | [ ] |
| 7 | i-ch13-scoring-breakdown | https://www.sebenzahub.co.za/dashboard/individual/interview-simulator | Output | AI Interview Scoring card with dimension breakdowns | [ ] |
| 8 | i-ch13-thank-you-note | https://www.sebenzahub.co.za/dashboard/individual/interview-simulator | Output | Generated thank-you note draft | [ ] |
| 9 | i-ch13-interview-comparison | https://www.sebenzahub.co.za/dashboard/individual/interview-simulator | Complex UI | Cross-session comparison table/chart | [ ] |

## Ch 14 — Company Research (4)

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | i-ch14-company-research-landing | https://www.sebenzahub.co.za/dashboard/individual/company-research | Nav | Company research tool landing | [ ] |
| 2 | i-ch14-company-report | https://www.sebenzahub.co.za/dashboard/individual/company-research | Output | Full AI Company Research briefing report | [ ] |
| 3 | i-ch14-interviewer-intel-card | https://www.sebenzahub.co.za/dashboard/individual/company-research | Output | Interviewer Intelligence profile card | [ ] |
| 4 | i-ch14-talking-points | https://www.sebenzahub.co.za/dashboard/individual/company-research | Output | Generated talking-points panel | [ ] |

## Ch 15 — Receiving an Offer (5)

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | i-ch15-offer-record | https://www.sebenzahub.co.za/dashboard/individual/applications | Complex UI | Application detail → structured offer record view | [ ] |
| 2 | i-ch15-negotiation-advisor | https://www.sebenzahub.co.za/dashboard/individual/salary-negotiator | Output | Negotiation Advisor: recommended counter with reasoning | [ ] |
| 3 | i-ch15-playbook-document | https://www.sebenzahub.co.za/dashboard/individual/salary-negotiator | Output | Negotiation Playbook multi-round document | [ ] |
| 4 | i-ch15-scenario-practice | https://www.sebenzahub.co.za/dashboard/individual/salary-negotiator | Decision | Negotiation Scenario: written scenario + response feedback | [ ] |
| 5 | i-ch15-roleplay-chat | https://www.sebenzahub.co.za/dashboard/individual/salary-negotiator | Complex UI | Negotiation Roleplay interactive chat | [ ] |

## Ch 16 — Salary Negotiator (4)

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | i-ch16-salary-insights-chart | https://www.sebenzahub.co.za/dashboard/individual/salary-insights | Output | Percentile benchmark chart for the role | [ ] |
| 2 | i-ch16-negotiation-coach-chat | https://www.sebenzahub.co.za/dashboard/individual/salary-negotiator | Complex UI | Salary Negotiation Coach conversational strategy chat | [ ] |
| 3 | i-ch16-structured-prep-workflow | https://www.sebenzahub.co.za/dashboard/individual/salary-negotiator | Complex UI | Structured prep workflow screen | [ ] |
| 4 | i-ch16-live-coach-feedback | https://www.sebenzahub.co.za/dashboard/individual/salary-negotiator | Complex UI | Live roleplay with realtime feedback panel | [ ] |

## Ch 17 — No Responses (5)

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | i-ch17-application-analytics | https://www.sebenzahub.co.za/dashboard/individual/application-analytics | Complex UI | Application Analytics dashboard with patterns | [ ] |
| 2 | i-ch17-linkedin-optimizer | https://www.sebenzahub.co.za/dashboard/individual/profile | Decision | LinkedIn Optimizer suggestions (before/after view) | [ ] |
| 3 | i-ch17-weakness-alchemist | https://www.sebenzahub.co.za/dashboard/individual/coaching | Output | Weakness Alchemist reframed-weakness output | [ ] |
| 4 | i-ch17-rejection-recovery-plan | https://www.sebenzahub.co.za/dashboard/individual/coaching | Output | Rejection Recovery Coach generated plan | [ ] |
| 5 | i-ch17-networking-message-draft | https://www.sebenzahub.co.za/dashboard/individual/coaching | Output | Networking Message Writer drafted message | [ ] |

## Ch 18 — No Direction (5)

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | i-ch18-direction-tools-overview | https://www.sebenzahub.co.za/dashboard/individual/coaching | Nav | Landing view showing the four direction tools | [ ] |
| 2 | i-ch18-coaching-chat | https://www.sebenzahub.co.za/dashboard/individual/coaching | Complex UI | AI Coaching chat interface mid-session | [ ] |
| 3 | i-ch18-career-story-draft | https://www.sebenzahub.co.za/dashboard/individual/coaching | Output | Generated career narrative draft | [ ] |
| 4 | i-ch18-career-path-map | https://www.sebenzahub.co.za/dashboard/individual/career-path | Complex UI | 5–10 year career progression visualisation | [ ] |
| 5 | i-ch18-strategy-30-60-90-plan | https://www.sebenzahub.co.za/dashboard/individual/coaching | Output | 30/60/90 day action plan document | [ ] |

## Ch 19 — Level Up (13) — heaviest chapter

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | i-ch19-learning-stages-overview | https://www.sebenzahub.co.za/dashboard/individual/learning-hub | Nav | Learning hub home with the six stages visible | [ ] |
| 2 | i-ch19-skill-gap-chart | https://www.sebenzahub.co.za/dashboard/individual/skill-gap | Output | Stage 1 — Skill Gap analysis ranked chart | [ ] |
| 3 | i-ch19-study-planner-weekly-grid | https://www.sebenzahub.co.za/dashboard/individual/study-planner | Complex UI | Stage 2 — Study Planner weekly grid with scheduled slots | [ ] |
| 4 | i-ch19-learning-hub-catalogue | https://www.sebenzahub.co.za/dashboard/individual/learning-hub | Nav | Stage 3 — Learning Hub catalogue grid | [ ] |
| 5 | i-ch19-micro-learning-card | https://www.sebenzahub.co.za/dashboard/individual/micro-learning | Output | Stage 3 — Micro-Learning module card | [ ] |
| 6 | i-ch19-skill-battle-leaderboard | https://www.sebenzahub.co.za/dashboard/individual/learning-challenges | Complex UI | Stage 4 — Leaderboard with streaks | [ ] |
| 7 | i-ch19-weakness-drill-session | https://www.sebenzahub.co.za/dashboard/individual/learning-challenges | Complex UI | Stage 4 — Active drill session UI | [ ] |
| 8 | i-ch19-adaptive-difficulty-meter | https://www.sebenzahub.co.za/dashboard/individual/learning-challenges | Decision | Stage 4 — Adaptive difficulty meter | [ ] |
| 9 | i-ch19-test-feedback-breakdown | https://www.sebenzahub.co.za/dashboard/individual/tests | Output | Stage 5 — Per sub-topic score breakdown | [ ] |
| 10 | i-ch19-test-portfolio-public-page | https://www.sebenzahub.co.za/dashboard/individual/portfolio-builder | Output | Stage 5 — Public shareable portfolio page | [ ] |
| 11 | i-ch19-skill-tree-visualisation | https://www.sebenzahub.co.za/dashboard/individual/skill-tree | Complex UI | Stage 6 — Skill tree with locked/unlocked nodes | [ ] |
| 12 | i-ch19-learning-analytics-dashboard | https://www.sebenzahub.co.za/dashboard/individual/learning-analytics | Complex UI | Stage 6 — Analytics dashboard tied to job-readiness | [ ] |
| 13 | i-ch19-challenge-streak-state | https://www.sebenzahub.co.za/dashboard/individual/community-badges | Output | Stage 6 — Streak/badge state | [ ] |

## Ch 20 — Autopilot (3)

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | i-ch20-autopilot-settings | https://www.sebenzahub.co.za/dashboard/individual/auto-match | Nav | Auto Match → Autopilot settings panel | [ ] |
| 2 | i-ch20-threshold-sliders | https://www.sebenzahub.co.za/dashboard/individual/auto-match | Decision | Match-score threshold sliders | [ ] |
| 3 | i-ch20-auto-applied-review-queue | https://www.sebenzahub.co.za/dashboard/individual/applications | Output | Applications filtered to auto-submitted queue | [ ] |

## Ch 21 — Career DNA (5)

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | i-ch21-career-dna-settings | https://www.sebenzahub.co.za/dashboard/individual/profile | Complex UI | Profile → Career DNA configuration screen | [ ] |
| 2 | i-ch21-elevator-pitch-variants | https://www.sebenzahub.co.za/dashboard/individual/coaching | Output | 30s / 60s / 2min Elevator Pitch variant tabs | [ ] |
| 3 | i-ch21-basic-dashboard | https://www.sebenzahub.co.za/dashboard/individual/profile | Nav | Main dashboard with next-best-actions | [ ] |
| 4 | i-ch21-billing-subscription | https://www.sebenzahub.co.za/dashboard/individual/billing | Nav | Billing & subscription page | [ ] |
| 5 | i-ch21-support-contact-form | https://www.sebenzahub.co.za/dashboard/individual/settings | Output | Contact Support form (Settings → Help) | [ ] |

## Ch 22 — Market Radar (4)

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | i-ch22-market-radar-watches | https://www.sebenzahub.co.za/dashboard/individual/career-pulse | Complex UI | Configured Market Radar watches list | [ ] |
| 2 | i-ch22-career-pulse-report | https://www.sebenzahub.co.za/dashboard/individual/career-pulse | Output | Career Pulse hero report view | [ ] |
| 3 | i-ch22-demand-salary-trend | https://www.sebenzahub.co.za/dashboard/individual/career-pulse | Output | Demand / salary trajectory chart | [ ] |
| 4 | i-ch22-hottest-cities-heatmap | https://www.sebenzahub.co.za/dashboard/individual/career-pulse | Output | Hottest cities heatmap | [ ] |

## Ch 23 — Community & Mentorship (4)

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | i-ch23-community-hub | https://www.sebenzahub.co.za/dashboard/individual/community | Nav | Community section landing with 6 tiles | [ ] |
| 2 | i-ch23-mentor-connect-match | https://www.sebenzahub.co.za/dashboard/individual/community-mentors | Complex UI | Mentor browse/filter interface | [ ] |
| 3 | i-ch23-portfolio-builder-editor | https://www.sebenzahub.co.za/dashboard/individual/portfolio-builder | Complex UI | Portfolio Builder edit view | [ ] |
| 4 | i-ch23-published-portfolio-page | https://www.sebenzahub.co.za/dashboard/individual/portfolio-builder | Output | Published public portfolio page (preview) | [ ] |

---

# Recruiter Book (149 placeholders — 3 existing, 146 to capture)

## Ch 03 — Agency Onboarding (3)

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | r-ch03-agency-onboarding-form | https://www.sebenzahub.co.za/onboarding (recruiter flow) | Nav | Agency onboarding form top view | [ ] |
| 2 | r-ch03-sector-multi-select | https://www.sebenzahub.co.za/onboarding (recruiter flow) | Decision | Sector multi-select dropdown open | [ ] |
| 3 | r-ch03-verification-proof-url | https://www.sebenzahub.co.za/onboarding (recruiter flow) | Decision | Verification proof URL field | [ ] |

## Ch 04 — Recruiter Dashboard (5)

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | r-ch04-dashboard-full-view | https://www.sebenzahub.co.za/dashboard/recruiter/profile | Nav | Full recruiter dashboard with sidebar visible | [ ] |
| 2 | r-ch04-recruitment-path-sidebar | https://www.sebenzahub.co.za/dashboard/recruiter/profile | Nav | Sidebar zoomed to the Recruitment Path groups | [ ] |
| 3 | r-ch04-parallel-tracks-sidebar | https://www.sebenzahub.co.za/dashboard/recruiter/profile | Nav | Sidebar zoomed to the Parallel Tracks section | [ ] |
| 4 | r-ch04-billing-usage-page | https://www.sebenzahub.co.za/dashboard/recruiter/billing | Output | Billing → Usage history with consumption meters | [ ] |
| 5 | r-ch04-notifications-settings | https://www.sebenzahub.co.za/dashboard/recruiter/settings | Decision | Settings → Notifications per-event channel config | [ ] |

## Ch 04.5 — How We Charge (3)

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | r-ch04-5-pricing-page | https://www.sebenzahub.co.za/pricing | Output | Public pricing page with three tiers | [ ] |
| 2 | r-ch04-5-support-tier-comparison | https://www.sebenzahub.co.za/pricing | Complex UI | Support tier comparison table | [ ] |
| 3 | r-ch04-5-support-contact-form | https://www.sebenzahub.co.za/dashboard/recruiter/settings | Decision | Settings → Support contact form | [ ] |

## Ch 05 — Agency Profile (5)

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | r-ch05-agency-profile-landing | https://www.sebenzahub.co.za/dashboard/recruiter/profile | Nav | Agency Profile landing page | [ ] |
| 2 | r-ch05-website-import-populated | https://www.sebenzahub.co.za/dashboard/recruiter/profile | Output | Website Import: URL input then populated form | [ ] |
| 3 | r-ch05-social-proof-summary | https://www.sebenzahub.co.za/dashboard/recruiter/profile | Output | Social Proof summary with chart | [ ] |
| 4 | r-ch05-recruiter-bio-output | https://www.sebenzahub.co.za/dashboard/recruiter/profile | Output | Bio Writer generated recruiter bio | [ ] |
| 5 | r-ch05-recruiter-dna-card | https://www.sebenzahub.co.za/dashboard/recruiter/profile | Output | Recruiter DNA Card one-screen view | [ ] |

## Ch 06 — AI Profile Assets (6)

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | r-ch06-brand-page-generator | https://www.sebenzahub.co.za/dashboard/recruiter/brand | Output | Brand page generator form + draft | [ ] |
| 2 | r-ch06-public-company-page-slug | https://www.sebenzahub.co.za/agency/{your-slug} | Nav | Public company page at slug URL (your agency's public URL) | [ ] |
| 3 | r-ch06-brand-content-export-dialog | https://www.sebenzahub.co.za/dashboard/recruiter/brand | Decision | Export format selector dialog | [ ] |
| 4 | r-ch06-case-study-output | https://www.sebenzahub.co.za/dashboard/recruiter/brand | Output | Case Study generated narrative | [ ] |
| 5 | r-ch06-employer-brand-content-editor | https://www.sebenzahub.co.za/dashboard/recruiter/brand | Decision | Brand Content editor with format/tone picker | [ ] |
| 6 | r-ch06-market-analysis-report | https://www.sebenzahub.co.za/dashboard/recruiter/brand | Output | Market Analysis report with charts | [ ] |

## Ch 07 — Team Setup (5)

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | r-ch07-team-invite-form | https://www.sebenzahub.co.za/dashboard/recruiter/team | Decision | Invite member form with role dropdown | [ ] |
| 2 | r-ch07-role-permissions | https://www.sebenzahub.co.za/dashboard/recruiter/team | Complex UI | Custom role permission matrix | [ ] |
| 3 | r-ch07-collaboration-mention-feed | https://www.sebenzahub.co.za/dashboard/recruiter/team | Complex UI | @-mention feed & team activity | [ ] |
| 4 | r-ch07-coach-insights-dashboard | https://www.sebenzahub.co.za/dashboard/recruiter/team | Output | Coach insight cards per recruiter | [ ] |
| 5 | r-ch07-recruiter-benchmark-chart | https://www.sebenzahub.co.za/dashboard/recruiter/team | Output | Benchmark chart agency vs platform | [ ] |

## Ch 08 — Adding Clients (3)

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | r-ch08-client-list-view | https://www.sebenzahub.co.za/dashboard/recruiter/clients | Nav | Master client list with filters | [ ] |
| 2 | r-ch08-add-client-form | https://www.sebenzahub.co.za/dashboard/recruiter/clients | Decision | Add Client form filled in | [ ] |
| 3 | r-ch08-client-detail-requisitions | https://www.sebenzahub.co.za/dashboard/recruiter/clients | Nav | Client detail page with requisitions list | [ ] |

## Ch 09 — Engagement Terms (2)

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | r-ch09-engagement-terms-form | https://www.sebenzahub.co.za/dashboard/recruiter/clients | Decision | Engagement form (fee structure, terms) | [ ] |
| 2 | r-ch09-signed-agreement-view | https://www.sebenzahub.co.za/dashboard/recruiter/clients | Output | Signed agreement / engagement record | [ ] |

## Ch 10 — Managing Client Relationships (2)

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | r-ch10-client-crm-view | https://www.sebenzahub.co.za/dashboard/recruiter/client-pipeline | Nav | Client CRM master view | [ ] |
| 2 | r-ch10-activity-timeline | https://www.sebenzahub.co.za/dashboard/recruiter/call-notes | Complex UI | Call notes / activity interaction timeline | [ ] |

## Ch 11 — Posting a Job (8)

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | r-ch11-job-list-status | https://www.sebenzahub.co.za/dashboard/recruiter/jobs | Nav | Jobs list with status column | [ ] |
| 2 | r-ch11-ai-jd-generator-output | https://www.sebenzahub.co.za/dashboard/recruiter/ai-writer | Output | AI JD Writer generated JD in form | [ ] |
| 3 | r-ch11-bias-detection-highlights | https://www.sebenzahub.co.za/dashboard/recruiter/ai-writer | Output | Inclusivity highlights + rewrites | [ ] |
| 4 | r-ch11-jd-compliance-flags | https://www.sebenzahub.co.za/dashboard/recruiter/ai-writer | Output | Block/warning compliance flags | [ ] |
| 5 | r-ch11-salary-benchmark-chart | https://www.sebenzahub.co.za/dashboard/recruiter/ai-writer | Output | Market median + P25–P75 range chart | [ ] |
| 6 | r-ch11-publish-channel-selector | https://www.sebenzahub.co.za/dashboard/recruiter/jobs | Decision | Publish dialog with channel toggles | [ ] |
| 7 | r-ch11-job-board-integrations-panel | https://www.sebenzahub.co.za/dashboard/recruiter/job-board-integrations | Decision | Job Board Integrations panel (Pnet/CJ) | [ ] |
| 8 | r-ch11-job-ai-insights-dashboard | https://www.sebenzahub.co.za/dashboard/recruiter/jobs | Output | Per-requisition Job AI Insights dashboard | [ ] |

## Ch 12 — Sourcing Channels (now Ch.14 after 2026-04-28 renumber, 7)

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | r-ch12-candidate-search-results | https://www.sebenzahub.co.za/dashboard/recruiter/candidates | Nav | Candidate search results page | [ ] |
| 2 | r-ch12-ai-hybrid-search | https://www.sebenzahub.co.za/dashboard/recruiter/ai-search | Output | Hybrid natural-language search results | [ ] |
| 3 | r-ch12-smart-search-suggestions | https://www.sebenzahub.co.za/dashboard/recruiter/ai-search | Complex UI | Smart suggestions sidebar | [ ] |
| 4 | r-ch12-market-pulse-chart | https://www.sebenzahub.co.za/dashboard/recruiter/ai-search | Output | Market pulse trend chart per saved search | [ ] |
| 5 | r-ch12-competitive-heat-map | https://www.sebenzahub.co.za/dashboard/recruiter/ai-search | Complex UI | Competitive heat map geographic view | [ ] |
| 6 | r-ch12-talent-pool-generator-dialog | https://www.sebenzahub.co.za/dashboard/recruiter/talent-pool | Decision | Talent Pool Generator prompt dialog | [ ] |
| 7 | r-ch12-linkedin-sync | https://www.sebenzahub.co.za/dashboard/recruiter/settings | Nav | Settings → Integrations → LinkedIn Sync panel | [ ] |

## Ch 13 — Talent Rediscovery & LinkedIn Leads (4)

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | r-ch13-linkedin-leads-import | https://www.sebenzahub.co.za/dashboard/recruiter/linkedin-leads | Decision | LinkedIn Leads import / upload screen | [ ] |
| 2 | r-ch13-ai-candidate-recommendations | https://www.sebenzahub.co.za/dashboard/recruiter/jobs | Output | Per-job AI Recommendations tab with ranked candidates | [ ] |
| 3 | r-ch13-candidate-reengagement | https://www.sebenzahub.co.za/dashboard/recruiter/re-engagement | Output | AI-suggested re-engagement message | [ ] |
| 4 | r-ch13-talent-rediscovery-view | https://www.sebenzahub.co.za/dashboard/recruiter/talent-rediscovery | Complex UI | Dormant candidates ranked vs open jobs | [ ] |

## Ch 14 — Talent Pools & CRM (now Ch.12 after 2026-04-28 renumber, 6)

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | r-ch14-talent-pools-list | https://www.sebenzahub.co.za/dashboard/recruiter/talent-pool | Nav | Talent Pools list with criteria | [ ] |
| 2 | r-ch14-auto-tag-candidate | https://www.sebenzahub.co.za/dashboard/recruiter/candidates | Output | Candidate profile with auto-applied tags | [ ] |
| 3 | r-ch14-talent-pool-clustering | https://www.sebenzahub.co.za/dashboard/recruiter/talent-pool | Complex UI | AI-discovered cluster suggestions | [ ] |
| 4 | r-ch14-talent-pool-analysis | https://www.sebenzahub.co.za/dashboard/recruiter/talent-pool | Output | Pool analysis distribution charts | [ ] |
| 5 | r-ch14-side-by-side-comparison | https://www.sebenzahub.co.za/dashboard/recruiter/comparison | Complex UI | 2–5 candidates compared across attributes | [ ] |
| 6 | r-ch14-csv-bulk-import | https://www.sebenzahub.co.za/dashboard/recruiter/candidates | Decision | Bulk import column mapping + dedupe UI | [ ] |

## Ch 15 — Screening Config (3)

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | r-ch15-screening-roles-config | https://www.sebenzahub.co.za/dashboard/recruiter/roles | Complex UI | Screening Roles config screen per role family | [ ] |
| 2 | r-ch15-criteria-generator-output | https://www.sebenzahub.co.za/dashboard/recruiter/roles | Output | AI-generated must-haves / nice-to-haves / weights | [ ] |
| 3 | r-ch15-knockout-questions-editor | https://www.sebenzahub.co.za/dashboard/recruiter/roles | Complex UI | Knockout questions editor with yes/no rules | [ ] |

## Ch 16 — The Pipeline (5)

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | r-ch16-pipeline-kanban-hero | https://www.sebenzahub.co.za/dashboard/recruiter/pipeline | Complex UI | Full kanban board, all stages, many cards | [ ] |
| 2 | r-ch16-drag-between-stages | https://www.sebenzahub.co.za/dashboard/recruiter/pipeline | Decision | Candidate card mid-drag between columns | [ ] |
| 3 | r-ch16-engagement-score-card | https://www.sebenzahub.co.za/dashboard/recruiter/pipeline | Output | Candidate card with engagement indicator beside match score | [ ] |
| 4 | r-ch16-requirement-restriction-warning | https://www.sebenzahub.co.za/dashboard/recruiter/requirement-check | Output | Warning overlay listing which criteria reject | [ ] |
| 5 | r-ch16-stage-config-settings | https://www.sebenzahub.co.za/dashboard/recruiter/settings | Complex UI | Settings → Pipeline stage customisation | [ ] |

## Ch 17 — Screening Tools (14) — heaviest chapter

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | r-ch17-ai-candidate-screening-shortlist | https://www.sebenzahub.co.za/dashboard/recruiter/candidate-summary | Output | Ranked shortlist with reasoning per candidate | [ ] |
| 2 | r-ch17-resume-vs-jd-scoring-card | https://www.sebenzahub.co.za/dashboard/recruiter/pipeline | Output | Single candidate fit % card with explanation | [ ] |
| 3 | r-ch17-batch-screening-report | https://www.sebenzahub.co.za/dashboard/recruiter/batch-jobs | Output | Batch report grouped advance / maybe / reject | [ ] |
| 4 | r-ch17-predictive-hiring-risk-score | https://www.sebenzahub.co.za/dashboard/recruiter/predictive-hiring | Output | Retention risk score with contributing factors | [ ] |
| 5 | r-ch17-culture-fit-radar-chart | https://www.sebenzahub.co.za/dashboard/recruiter/culture-fit | Output | 6-dimension radar chart | [ ] |
| 6 | r-ch17-location-intelligence-map | https://www.sebenzahub.co.za/dashboard/recruiter/location-intel | Output | SA province-level commute / talent map | [ ] |
| 7 | r-ch17-screening-chatbot-conversation | https://www.sebenzahub.co.za/dashboard/recruiter/screening-chatbot | Complex UI | Chatbot conversation transcript | [ ] |
| 8 | r-ch17-screening-next-steps-recommendation | https://www.sebenzahub.co.za/dashboard/recruiter/pipeline | Decision | Suggested-action button with reasoning | [ ] |
| 9 | r-ch17-test-builder-branching-logic | https://www.sebenzahub.co.za/dashboard/recruiter/tests | Complex UI | Test with branching logic editor | [ ] |
| 10 | r-ch17-test-templates-library | https://www.sebenzahub.co.za/dashboard/recruiter/test-templates | Nav | Template library grid | [ ] |
| 11 | r-ch17-anti-cheat-monitoring-live | https://www.sebenzahub.co.za/dashboard/recruiter/tests | Complex UI | Live test monitoring with flagged events | [ ] |
| 12 | r-ch17-ai-reference-questions | https://www.sebenzahub.co.za/dashboard/recruiter/reference-checks | Output | Generated role-specific reference questions | [ ] |
| 13 | r-ch17-reference-check-summary | https://www.sebenzahub.co.za/dashboard/recruiter/reference-checks | Output | AI summary with red flags | [ ] |
| 14 | r-ch17-blind-hiring-before-after | https://www.sebenzahub.co.za/dashboard/recruiter/blind-hiring | Decision | Before/after redaction split view | [ ] |

## Ch 18 — Interview Scheduling (5)

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | r-ch18-self-scheduling-calendar | https://www.sebenzahub.co.za/dashboard/recruiter/self-scheduling | Complex UI | Candidate-facing calendar time picker | [ ] |
| 2 | r-ch18-scheduling-links-share-dialog | https://www.sebenzahub.co.za/dashboard/recruiter/scheduling | Nav | Share link copy dialog | [ ] |
| 3 | r-ch18-ai-interview-questions-output | https://www.sebenzahub.co.za/dashboard/recruiter/ai-questions | Output | Generated behavioural / technical questions | [ ] |
| 4 | r-ch18-scorecard-template-editor | https://www.sebenzahub.co.za/dashboard/recruiter/scorecards | Complex UI | Rubric template editor with rating scales | [ ] |
| 5 | r-ch18-scorecard-rubric-filled | https://www.sebenzahub.co.za/dashboard/recruiter/scorecards | Output | Filled scorecard mid-interview | [ ] |

## Ch 19 — Video Interviews (7)

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | r-ch19-video-interview-session | https://www.sebenzahub.co.za/dashboard/recruiter/video-interviews | Complex UI | Video interview in session with controls | [ ] |
| 2 | r-ch19-ai-conversational-interview-chat | https://www.sebenzahub.co.za/dashboard/recruiter/video-interviews | Complex UI | AI chatting with candidate in browser | [ ] |
| 3 | r-ch19-sentiment-timeline-chart | https://www.sebenzahub.co.za/dashboard/recruiter/video-analysis | Output | Minute-by-minute sentiment chart | [ ] |
| 4 | r-ch19-behavioral-star-detection | https://www.sebenzahub.co.za/dashboard/recruiter/video-analysis | Output | STAR detection on each question | [ ] |
| 5 | r-ch19-communication-deep-dive-metrics | https://www.sebenzahub.co.za/dashboard/recruiter/video-analysis | Output | Filler-word rate, vocab metrics | [ ] |
| 6 | r-ch19-hiring-recommendation-card | https://www.sebenzahub.co.za/dashboard/recruiter/video-analysis | Decision | Top-of-record recommendation card | [ ] |
| 7 | r-ch19-bias-audit-overlay | https://www.sebenzahub.co.za/dashboard/recruiter/diversity | Output | Bias audit demographic overlay | [ ] |

## Ch 20 — Making an Offer (8)

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | r-ch20-offer-management-list | https://www.sebenzahub.co.za/dashboard/recruiter/offers | Complex UI | Master offer list with versions / status | [ ] |
| 2 | r-ch20-offer-letter-generator-output | https://www.sebenzahub.co.za/dashboard/recruiter/offer-letters | Output | Merged letter preview | [ ] |
| 3 | r-ch20-acceptance-predictor-probability | https://www.sebenzahub.co.za/dashboard/recruiter/offer-predictor | Output | 0–100% probability with reasoning | [ ] |
| 4 | r-ch20-predictive-performance-trajectory | https://www.sebenzahub.co.za/dashboard/recruiter/predictive-hiring | Output | 30/90/180/365-day trajectory chart | [ ] |
| 5 | r-ch20-team-fit-simulation | https://www.sebenzahub.co.za/dashboard/recruiter/team-dna | Output | Friction points & complementary strengths | [ ] |
| 6 | r-ch20-salary-calculator-gross-to-net | https://www.sebenzahub.co.za/dashboard/recruiter/salary-calculator | Output | Gross→Net mode with take-home + PAYE/UIF/effective rate breakdown | [ ] |
| 7 | r-ch20-salary-calculator-cost-to-company | https://www.sebenzahub.co.za/dashboard/recruiter/salary-calculator | Output | CTC mode with employer UIF/SDL/medical/pension/bonus accrual + cost multiplier | [ ] |
| 8 | r-ch20-salary-calculator-net-to-gross | https://www.sebenzahub.co.za/dashboard/recruiter/salary-calculator | Output | Net→Gross mode showing required basic for a target take-home | [ ] |

## Ch 21 — Recording a Placement (3)

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | r-ch21-placement-recording-form | https://www.sebenzahub.co.za/dashboard/recruiter/placements | Complex UI | Placement record with status / start date fields | [ ] |
| 2 | r-ch21-background-checks-integration | https://www.sebenzahub.co.za/dashboard/recruiter/background-checks | Output | Background check result with POPIA consent log | [ ] |
| 3 | r-ch21-placement-analytics-dashboard | https://www.sebenzahub.co.za/dashboard/recruiter/kpi-dashboard | Complex UI | Time-to-fill, retention, ratios dashboard | [ ] |

## Ch 22 — Unified Inbox (5)

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | r-ch22-unified-inbox-multichannel | https://www.sebenzahub.co.za/dashboard/recruiter/unified-inbox | Complex UI | Three-panel view: conversations + thread + context | [ ] |
| 2 | r-ch22-ai-email-composer-suggestions | https://www.sebenzahub.co.za/dashboard/recruiter/unified-inbox | Output | Composer with AI draft + tone suggestions | [ ] |
| 3 | r-ch22-email-templates-library | https://www.sebenzahub.co.za/dashboard/recruiter/email-templates | Nav | Template library grid | [ ] |
| 4 | r-ch22-outreach-draft-generator | https://www.sebenzahub.co.za/dashboard/recruiter/sequences | Output | Personalised outreach draft | [ ] |
| 5 | r-ch22-whatsapp-messages-in-inbox | https://www.sebenzahub.co.za/dashboard/recruiter/unified-inbox | Complex UI | WhatsApp thread within Unified Inbox | [ ] |

## Ch 23 — Templates, Sequences, Chatbot (4)

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | r-ch23-template-variable-editor | https://www.sebenzahub.co.za/dashboard/recruiter/email-templates | Complex UI | Template body with merge field variables | [ ] |
| 2 | r-ch23-email-sequences-builder | https://www.sebenzahub.co.za/dashboard/recruiter/sequences | Complex UI | Sequence builder with Day 0 / 4 / 10 steps | [ ] |
| 3 | r-ch23-sequence-conditional-branches | https://www.sebenzahub.co.za/dashboard/recruiter/sequences | Complex UI | Exit rules + conditional branches | [ ] |
| 4 | r-ch23-sequence-analytics | https://www.sebenzahub.co.za/dashboard/recruiter/sequences | Output | Per-sequence reply / open / exit analytics | [ ] |

## Ch 24 — WhatsApp at Scale (5)

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | r-ch24-whatsapp-apply-6-languages | https://www.sebenzahub.co.za/dashboard/recruiter/whatsapp-apply | Complex UI | Apply-via-WhatsApp flow with language picker | [ ] |
| 2 | r-ch24-whatsapp-command-center | https://www.sebenzahub.co.za/dashboard/recruiter/whatsapp-bot | Complex UI | Command Center conversation list + reply panel | [ ] |
| 3 | r-ch24-whatsapp-campaign-builder | https://www.sebenzahub.co.za/dashboard/recruiter/whatsapp-campaigns | Complex UI | Campaign composer with template picker | [ ] |
| 4 | r-ch24-audience-segmentation | https://www.sebenzahub.co.za/dashboard/recruiter/whatsapp-campaigns | Complex UI | Segment filters: pool + tags + consent | [ ] |
| 5 | r-ch24-campaign-analytics-dashboard | https://www.sebenzahub.co.za/dashboard/recruiter/whatsapp-campaigns | Output | Campaign sent / delivered / replied / opted-out metrics | [ ] |

## Ch 25 — Reading Your Analytics (5)

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | r-ch25-kpi-dashboard-hero | https://www.sebenzahub.co.za/dashboard/recruiter/kpi-dashboard | Nav | KPI Dashboard with placement / revenue / fill-rate tiles | [ ] |
| 2 | r-ch25-recruiter-analytics-funnel | https://www.sebenzahub.co.za/dashboard/recruiter/analytics | Complex UI | Full conversion funnel chart stage-by-stage | [ ] |
| 3 | r-ch25-cost-per-hire-breakdown | https://www.sebenzahub.co.za/dashboard/recruiter/analytics | Output | Cost-per-hire table by source and client | [ ] |
| 4 | r-ch25-predictive-analytics-forecast | https://www.sebenzahub.co.za/dashboard/recruiter/predictive-analytics | Output | 30/60/90-day forecast with at-risk role flags | [ ] |
| 5 | r-ch25-source-quality-scoring | https://www.sebenzahub.co.za/dashboard/recruiter/requirement-check | Output | Per-source quality score ranking | [ ] |

## Ch 26 — Diversity, Panel, AI (5)

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | r-ch26-diversity-pipeline-stages | https://www.sebenzahub.co.za/dashboard/recruiter/diversity | Complex UI | Stage-by-stage demographic drop-off chart | [ ] |
| 2 | r-ch26-video-bias-audit-flags | https://www.sebenzahub.co.za/dashboard/recruiter/disagreements | Output | Flagged-interview list with bias indicators | [ ] |
| 3 | r-ch26-interviewer-effectiveness-scoring | https://www.sebenzahub.co.za/dashboard/recruiter/disagreements | Output | Interviewer leaderboard with scores | [ ] |
| 4 | r-ch26-disagreement-scorecard-overlay | https://www.sebenzahub.co.za/dashboard/recruiter/disagreements | Complex UI | Multi-interviewer scorecard overlay | [ ] |
| 5 | r-ch26-team-dna-composition | https://www.sebenzahub.co.za/dashboard/recruiter/team-dna | Complex UI | Team composition radar / strengths view | [ ] |

## Ch 27 — POPIA in Practice (4)

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | r-ch27-popia-consent-dashboard | https://www.sebenzahub.co.za/dashboard/recruiter/compliance | Nav | Consent dashboard landing | [ ] |
| 2 | r-ch27-dsar-request-screen | https://www.sebenzahub.co.za/dashboard/recruiter/compliance | Decision | DSAR compilation screen | [ ] |
| 3 | r-ch27-consent-audit-log | https://www.sebenzahub.co.za/dashboard/recruiter/audit-trail | Output | Timestamped consent audit log | [ ] |
| 4 | r-ch27-candidate-nps-results | https://www.sebenzahub.co.za/dashboard/recruiter/feedback | Output | NPS promoter / passive / detractor chart | [ ] |

## Ch 28 — B-BBEE, EE, Audit Trail (5)

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | r-ch28-ee-report-eea2-output | https://www.sebenzahub.co.za/dashboard/recruiter/ee-reports | Output | EEA2 / EEA4-formatted PDF output | [ ] |
| 2 | r-ch28-bbbee-scorecard-tracker | https://www.sebenzahub.co.za/dashboard/recruiter/bbbee | Complex UI | Pillar-by-pillar scorecard tracker | [ ] |
| 3 | r-ch28-transformation-statement-output | https://www.sebenzahub.co.za/dashboard/recruiter/bbbee | Output | Generated transformation statement | [ ] |
| 4 | r-ch28-blind-hiring-toggle | https://www.sebenzahub.co.za/dashboard/recruiter/blind-hiring | Decision | Blind Hiring toggle with masked candidate preview | [ ] |
| 5 | r-ch28-audit-trail-timeline | https://www.sebenzahub.co.za/dashboard/recruiter/audit-trail | Complex UI | Chronological immutable timeline | [ ] |

## Ch 29 — Career Site, Brand (4)

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | r-ch29-career-site-builder-editor | https://www.sebenzahub.co.za/dashboard/recruiter/career-site | Complex UI | Builder editor with branding panels | [ ] |
| 2 | r-ch29-published-career-site-preview | https://www.sebenzahub.co.za/agency/{your-slug}/careers | Output | Live published career site preview (your agency's public URL) | [ ] |
| 3 | r-ch29-custom-domain-settings | https://www.sebenzahub.co.za/dashboard/recruiter/career-site | Nav | Custom subdomain settings | [ ] |
| 4 | r-ch29-brand-content-library | https://www.sebenzahub.co.za/dashboard/recruiter/brand | Complex UI | Brand content library assets grid | [ ] |

## Ch 30 — Marketing, Referrals, NPS (5)

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | r-ch30-referral-program-dashboard | https://www.sebenzahub.co.za/dashboard/recruiter/referrals | Nav | Referral programme dashboard with commissions | [ ] |
| 2 | r-ch30-referral-tracking-attribution | https://www.sebenzahub.co.za/dashboard/recruiter/referrals | Output | Referrer-to-placement attribution view | [ ] |
| 3 | r-ch30-coaching-report-document | https://www.sebenzahub.co.za/dashboard/recruiter/team | Output | Generated coaching report doc | [ ] |
| 4 | r-ch30-nps-results-chart | https://www.sebenzahub.co.za/dashboard/recruiter/feedback | Output | NPS score breakdown chart | [ ] |
| 5 | r-ch30-campaign-builder | https://www.sebenzahub.co.za/dashboard/recruiter/recruitment-marketing | Complex UI | Marketing campaign builder configuration | [ ] |

## Ch 31 — Fill Rate Dropping (2) — scenario

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | r-ch31-fill-rate-trend-diagnostic | https://www.sebenzahub.co.za/dashboard/recruiter/kpi-dashboard | Output | Fill-rate trend diagnostic chart | [ ] |
| 2 | r-ch31-requirement-restriction-flags | https://www.sebenzahub.co.za/dashboard/recruiter/requirement-check | Output | Per-requirement pool-shrink flags | [ ] |

## Ch 32 — Candidates Ghosting (2) — scenario

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | r-ch32-engagement-score-heatmap | https://www.sebenzahub.co.za/dashboard/recruiter/engagement | Complex UI | Per-candidate engagement heatmap | [ ] |
| 2 | r-ch32-dropoff-funnel-stages | https://www.sebenzahub.co.za/dashboard/recruiter/analytics | Output | Stage-by-stage drop-off funnel | [ ] |

## Ch 33 — Client Unhappy with Calibre (2) — scenario

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | r-ch33-culture-fit-disagreement | https://www.sebenzahub.co.za/dashboard/recruiter/culture-fit | Output | Culture Fit 6-dimension scoring vs panel | [ ] |
| 2 | r-ch33-predictive-vs-actual-performance | https://www.sebenzahub.co.za/dashboard/recruiter/predictive-hiring | Output | Predicted vs actual performance comparison | [ ] |

## Ch 34 — Advanced & Platinum (6)

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | r-ch34-rapid-workflow-quick-actions | https://www.sebenzahub.co.za/dashboard/recruiter/rapid-workflow | Nav | Rapid Workflow quick-action panel | [ ] |
| 2 | r-ch34-workflow-automation-rule-builder | https://www.sebenzahub.co.za/dashboard/recruiter/workflow-automation | Complex UI | Rule-builder with triggers / actions | [ ] |
| 3 | r-ch34-auto-pilot-rules-config | https://www.sebenzahub.co.za/dashboard/recruiter/workflow-automation | Complex UI | Auto-Pilot shadow / live config with thresholds | [ ] |
| 4 | r-ch34-fraud-detection-alerts | https://www.sebenzahub.co.za/dashboard/recruiter/audit-trail | Output | Fraud dashboard with flagged signals | [ ] |
| 5 | r-ch34-hiring-manager-portal | https://www.sebenzahub.co.za/dashboard/recruiter/hiring-manager | Nav | Simplified manager review surface | [ ] |
| 6 | r-ch34-api-key-management | https://www.sebenzahub.co.za/dashboard/recruiter/settings | Nav | Settings → API token management with scopes | [ ] |

---

# Corporate Book (121 placeholders)

> **Note:** The Corporate manual was restructured on 2026-04-28 (full mirror of the Recruiter manual, see log). Some placeholder filenames retain their original `c-ch04-...`, `c-ch05-...` etc. prefix from the pre-restructure version even though the content now lives in a different chapter — that's a hint, not a strict mapping. The "Now in" column below reflects the current chapter the placeholder lives in.

## Ch 01 — What Sebenza Hub is for Corporates (2)

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | c-ch01-corporate-dashboard-hero | https://www.sebenzahub.co.za/dashboard/business/home | Nav | Corporate dashboard landing page overview | [ ] |
| 2 | c-ch01-three-user-types-diagram | https://www.sebenzahub.co.za/ | Nav | Marketing site: Individual / Recruiter / Corporate three-audience diagram | [ ] |

## Ch 02 — Creating Your Account (1 new; 1 shared)

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | ch02-magic-link-email | _email client_ | Shared | **Already captured** — same file as Individual/Recruiter Ch 02 | [x] |
| 2 | c-ch02-role-selection-business | https://www.sebenzahub.co.za/onboarding | Decision | Role picker with Business tile highlighted | [ ] |

## Ch 03 — Setting Up Your Org (6)

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | c-ch03-team-members-invite-dialog | https://www.sebenzahub.co.za/dashboard/business/team | Decision | Invite dialog with email + role fields | [ ] |
| 2 | c-ch03-rbac-permissions-matrix | https://www.sebenzahub.co.za/dashboard/business/settings | Complex UI | Settings → Roles × permissions matrix (view/edit/export per role) | [ ] |
| 3 | c-ch03-sso-configuration-form | https://www.sebenzahub.co.za/dashboard/business/sso-config | Decision | SAML/OAuth protocol picker + SP metadata | [ ] |
| 4 | c-ch03-company-branding-upload-preview | https://www.sebenzahub.co.za/dashboard/business/settings | Output | Settings → Branding: logo + colours on sample job listing | [ ] |
| 5 | c-ch03-white-label-custom-domain | https://www.sebenzahub.co.za/dashboard/business/settings | Decision | Settings → White-Label custom domain entry + DNS records | [ ] |
| 6 | c-ch03-team-collaboration-feed | https://www.sebenzahub.co.za/dashboard/business/team | Output | Team collaboration feed with @mentions and decisions | [ ] |

## Ch 04 — Trial and Billing Lifecycle (5)

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | c-ch04-trial-banner | https://www.sebenzahub.co.za/dashboard/business/home | Nav | Top-of-dashboard TrialBanner with day-count remaining (during trial) | [ ] |
| 2 | c-ch04-upgrade-dialog | https://www.sebenzahub.co.za/dashboard/business/home | Decision | Centralised UpgradeDialog modal (click "Upgrade now" on TrialBanner, or hit a cap) | [ ] |
| 3 | c-ch04-billing-page-trial | https://www.sebenzahub.co.za/dashboard/business/billing | Nav | Billing page during trial with conversion CTA | [ ] |
| 4 | c-ch04-plan-comparison-checkout | https://www.sebenzahub.co.za/dashboard/business/billing | Decision | Plan picker (Premium default vs Standard vs Free) at checkout | [ ] |
| 5 | c-ch04-billing-page-active-paid | https://www.sebenzahub.co.za/dashboard/business/billing | Output | Billing page after conversion (no banner, paid status visible) | [ ] |

## Ch 04.5 — The Corporate Dashboard (7)

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | c-ch045-corporate-dashboard-full-view | https://www.sebenzahub.co.za/dashboard/business/home | Complex UI | Full corporate dashboard with sidebar visible (all three bands) | [ ] |
| 2 | c-ch045-sidebar-hiring-path | https://www.sebenzahub.co.za/dashboard/business/home | Nav | Sidebar zoomed to the 6 Hiring Path groups | [ ] |
| 3 | c-ch045-sidebar-parallel-tracks | https://www.sebenzahub.co.za/dashboard/business/home | Nav | Sidebar zoomed to the 5 Parallel Track groups | [ ] |
| 4 | c-ch045-sidebar-supporting-account | https://www.sebenzahub.co.za/dashboard/business/home | Nav | Sidebar zoomed to Knowledge Base + Account groups at the bottom | [ ] |
| 5 | c-ch045-overview-metrics-tiles | https://www.sebenzahub.co.za/dashboard/business/home | Output | Overview page metric tiles (hires / time-to-hire / fill rate / pipeline value) | [ ] |
| 6 | c-ch045-billing-usage-page | https://www.sebenzahub.co.za/dashboard/business/billing | Output | Billing → Usage history tab with consumption bars | [ ] |
| 7 | c-ch045-notifications-per-event-channels | https://www.sebenzahub.co.za/dashboard/business/settings | Decision | Settings → Notifications per-event × channel matrix | [ ] |

## Ch 05 — Posting Jobs (3) _legacy filenames retained_

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | c-ch04-create-requisition-form | https://www.sebenzahub.co.za/dashboard/business/jobs | Nav | Create requisition form (click "+ New requisition") | [ ] |
| 2 | c-ch04-full-ats-custom-stages-editor | https://www.sebenzahub.co.za/dashboard/business/settings | Complex UI | Settings → Pipeline custom-stages editor per role family | [ ] |
| 3 | c-ch04-automation-rules-builder | https://www.sebenzahub.co.za/dashboard/business/jobs | Decision | Per-requisition automation rules (auto-advance / auto-reject) builder | [ ] |

## Ch 06 — Receiving Applications (9)

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | c-ch06-applications-triage-view | https://www.sebenzahub.co.za/dashboard/business/applications | Complex UI | Applications cross-requisition list with filters and sort | [ ] |
| 2 | c-ch06-source-effectiveness-breakdown | https://www.sebenzahub.co.za/dashboard/business/applications | Output | Per-channel source-quality breakdown | [ ] |
| 3 | c-ch04-basic-ats-pipeline-view _(legacy)_ | https://www.sebenzahub.co.za/dashboard/business/pipeline | Complex UI | Pipeline kanban (Applied/Screened/Interviewed/Offered/Hired) | [ ] |
| 4 | c-ch06-pipeline-card-anatomy | https://www.sebenzahub.co.za/dashboard/business/pipeline | Decision | Single Pipeline card with name, score, stage age, quick actions | [ ] |
| 5 | c-ch06-engagement-score-card | https://www.sebenzahub.co.za/dashboard/business/pipeline | Output | Engagement score badge on candidate card with declining indicator | [ ] |
| 6 | c-ch06-requirement-restriction-flags | https://www.sebenzahub.co.za/dashboard/business/pipeline | Output | Click "Analyze requirements" — per-requirement rejection counts | [ ] |
| 7 | c-ch06-pipeline-filters-bar | https://www.sebenzahub.co.za/dashboard/business/pipeline | Nav | Filter bar: My + Stage + Source + Score range | [ ] |
| 8 | c-ch06-bulk-actions-menu | https://www.sebenzahub.co.za/dashboard/business/pipeline | Decision | Multi-select cards with bulk-action menu open | [ ] |
| 9 | c-ch06-stage-config-settings | https://www.sebenzahub.co.za/dashboard/business/settings | Decision | Settings → Pipeline stage editor with custom stages | [ ] |

## Ch 07 — Screening and Evaluating (10)

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | c-ch07-ai-candidate-screening-shortlist | https://www.sebenzahub.co.za/dashboard/business/pipeline | Output | Auto-ranked shortlist with reasoning per candidate | [ ] |
| 2 | c-ch07-resume-vs-jd-scoring-card | https://www.sebenzahub.co.za/dashboard/business/pipeline | Output | Click "Score against JD" on a candidate card — match % with explanation | [ ] |
| 3 | c-ch07-batch-screening-report | https://www.sebenzahub.co.za/dashboard/business/pipeline | Complex UI | Multi-select → Batch screen → grouped Advance / Maybe / Reject report | [ ] |
| 4 | c-ch07-screening-roles-editor | https://www.sebenzahub.co.za/dashboard/business/screening-roles | Decision | Per-role-family criteria editor with knockout questions | [ ] |
| 5 | c-ch07-screening-bot-conversation | https://www.sebenzahub.co.za/dashboard/business/screening-bot | Output | Conversational pre-screen transcript with extracted answers | [ ] |
| 6 | c-ch07-ai-candidate-summary | https://www.sebenzahub.co.za/dashboard/business/candidates | Output | Open a candidate record — AI summary panel at top | [ ] |
| 7 | c-ch07-video-interview-async-recording | https://www.sebenzahub.co.za/dashboard/business/video-interviews | Output | Async one-way recording with question prompts and timestamps | [ ] |
| 8 | c-ch07-scorecard-panel-aggregate | https://www.sebenzahub.co.za/dashboard/business/scorecards | Complex UI | Aggregate panel scorecard view with per-interviewer ratings | [ ] |
| 9 | c-ch07-background-check-consent-flow | https://www.sebenzahub.co.za/dashboard/business/background-checks | Decision | Candidate consent screen for background-check authorization | [ ] |
| 10 | c-ch07-background-check-result | https://www.sebenzahub.co.za/dashboard/business/background-checks | Output | Result panel with status (clear/flagged) and audit-trail entry | [ ] |

## Ch 08 — Interviewing (4)

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | c-ch08-scheduling-panel-availability | https://www.sebenzahub.co.za/dashboard/business/scheduling | Complex UI | Scheduling form with panel calendar availability rendered | [ ] |
| 2 | c-ch08-self-scheduling-candidate-view | https://www.sebenzahub.co.za/dashboard/business/self-scheduling | Output | Candidate-facing slot picker with available windows | [ ] |
| 3 | c-ch08-interview-kit-question-bank | https://www.sebenzahub.co.za/dashboard/business/interview-kits | Decision | Kit editor: rounds, must-haves, optional probes, competency tags | [ ] |
| 4 | c-ch08-ai-questions-output | https://www.sebenzahub.co.za/dashboard/business/ai-questions | Output | Generated candidate-specific question set with rationale | [ ] |

## Ch 09 — Making Offers (10)

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | c-ch09-offers-list-overview | https://www.sebenzahub.co.za/dashboard/business/offers | Complex UI | Master offer list with status and approval state per row | [ ] |
| 2 | c-ch09-offer-detail-page | https://www.sebenzahub.co.za/dashboard/business/offers | Decision | Click into an offer — detail page with package, approval thread, signatures | [ ] |
| 3 | c-ch09-offer-template-editor | https://www.sebenzahub.co.za/dashboard/business/offer-templates | Decision | Template editor with placeholders and contract-type pickers | [ ] |
| 4 | c-ch09-offer-letter-generator | https://www.sebenzahub.co.za/dashboard/business/offer-letters | Output | Generated letter preview with merged candidate data | [ ] |
| 5 | c-ch09-offer-letter-signed | https://www.sebenzahub.co.za/dashboard/business/offer-letters | Output | Signed offer letter on the candidate record | [ ] |
| 6 | c-ch09-predictive-hiring-acceptance-score | https://www.sebenzahub.co.za/dashboard/business/predictive-hiring | Output | Acceptance probability score with contributing factors | [ ] |
| 7 | c-ch09-offer-approvals-routing | https://www.sebenzahub.co.za/dashboard/business/offer-approvals | Complex UI | Approval routing panel with chain visualisation and decision history | [ ] |
| 8 | c-ch09-salary-calculator-gross-to-net | https://www.sebenzahub.co.za/dashboard/business/salary-calculator | Output | Gross→Net mode with take-home + PAYE/UIF/effective rate breakdown | [ ] |
| 9 | c-ch09-salary-calculator-cost-to-company | https://www.sebenzahub.co.za/dashboard/business/salary-calculator | Output | CTC mode with employer UIF/SDL/medical/pension/bonus accrual + cost multiplier | [ ] |
| 10 | c-ch09-salary-calculator-net-to-gross | https://www.sebenzahub.co.za/dashboard/business/salary-calculator | Output | Net→Gross mode showing required basic for a target take-home | [ ] |

## Ch 10 — Vendor Management and Sourcing (10)

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | c-ch07-po-creation-form _(legacy)_ | https://www.sebenzahub.co.za/dashboard/business/vendors | Decision | Auto-generated PO form per vendor | [ ] |
| 2 | c-ch07-agency-performance-comparison _(legacy)_ | https://www.sebenzahub.co.za/dashboard/business/vendors | Complex UI | Side-by-side vendor metrics (submit/interview/offer/time-to-fill) | [ ] |
| 3 | c-ch07-vendor-compliance-status _(legacy)_ | https://www.sebenzahub.co.za/dashboard/business/vendors | Output | Red / yellow / green compliance grid (MSA/POPIA/B-BBEE/tax) | [ ] |
| 4 | c-ch10-talent-crm-record-view | https://www.sebenzahub.co.za/dashboard/business/talent-crm | Decision | CRM-style candidate record with notes, tags, timeline, status | [ ] |
| 5 | c-ch10-auto-tag-candidate | https://www.sebenzahub.co.za/dashboard/business/candidates | Output | Candidate profile with auto-applied tags highlighted | [ ] |
| 6 | c-ch10-side-by-side-comparison | https://www.sebenzahub.co.za/dashboard/business/candidates | Complex UI | Multi-select candidates → Compare → side-by-side view | [ ] |
| 7 | c-ch10-ai-search-natural-language-results | https://www.sebenzahub.co.za/dashboard/business/ai-search | Output | Natural-language query with ranked results and reasoning | [ ] |
| 8 | c-ch10-search-market-pulse | https://www.sebenzahub.co.za/dashboard/business/ai-search | Complex UI | Saved search → Market Pulse: candidate supply / salary / demand | [ ] |
| 9 | c-ch10-competitive-heat-map | https://www.sebenzahub.co.za/dashboard/business/ai-search | Complex UI | AI Search result → Competitive heat map geo view | [ ] |
| 10 | c-ch10-csv-bulk-import-mapping | https://www.sebenzahub.co.za/dashboard/business/candidates | Decision | Candidates → Import → Column-mapping screen during bulk import | [ ] |

## Ch 11 — Communication and Automation (8)

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | c-ch11-unified-inbox-multichannel | https://www.sebenzahub.co.za/dashboard/business/unified-inbox | Complex UI | Inbox showing email + WhatsApp + in-platform threads on one view | [ ] |
| 2 | c-ch08-notification-channels-matrix _(legacy)_ | https://www.sebenzahub.co.za/dashboard/business/settings | Decision | Settings → Notifications: event × channel routing matrix | [ ] |
| 3 | c-ch11-template-merge-fields-editor | https://www.sebenzahub.co.za/dashboard/business/email-templates | Decision | Template editor with merge field picker and preview | [ ] |
| 4 | c-ch11-sequence-builder-conditional-branches | https://www.sebenzahub.co.za/dashboard/business/email-templates | Complex UI | Sequences tab → builder with day-by-day steps and exit-rule config | [ ] |
| 5 | c-ch11-brand-voice-profile-editor | https://www.sebenzahub.co.za/dashboard/business/brand-voice | Decision | Voice profile config with tone / formality / banned-words / examples | [ ] |
| 6 | c-ch11-content-repurpose-channel-variants | https://www.sebenzahub.co.za/dashboard/business/content-repurpose | Output | Per-channel JD variants (LinkedIn long, short, internal, social) | [ ] |
| 7 | c-ch11-approvals-routing-config | https://www.sebenzahub.co.za/dashboard/business/approvals | Decision | Non-offer approvals routing config with rule conditions | [ ] |
| 8 | c-ch11-workflow-automation-rule-builder | https://www.sebenzahub.co.za/dashboard/business/approvals | Complex UI | Workflow Automation rule builder (trigger / condition / action) | [ ] |

## Ch 12 — Compliance and Audit Trail (5)

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | c-ch12-popia-compliance-console | https://www.sebenzahub.co.za/dashboard/business/popia-compliance | Complex UI | Console showing consent records, retention rules, Operator register | [ ] |
| 2 | c-ch12-bbbee-management-control-projection | https://www.sebenzahub.co.za/dashboard/business/bbbee | Output | Demographic projection chart vs B-BBEE scorecard target | [ ] |
| 3 | c-ch12-employment-equity-plan-actuals | https://www.sebenzahub.co.za/dashboard/business/employment-equity | Complex UI | EE plan targets vs actuals across occupational levels | [ ] |
| 4 | c-ch12-audit-trail-filtered-view | https://www.sebenzahub.co.za/dashboard/business/audit-trail | Complex UI | Audit log filtered by user / action type / date range | [ ] |
| 5 | c-ch12-audit-trail-ai-tool-call-detail | https://www.sebenzahub.co.za/dashboard/business/audit-trail | Output | Single AI tool call entry showing inputs / outputs / function name | [ ] |

## Ch 13 — Workforce and HR (10) _legacy filenames_

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | c-ch08-hris-integration-config | https://www.sebenzahub.co.za/dashboard/business/hris-integration | Decision | SAP / Workday / BambooHR vendor selection + creds | [ ] |
| 2 | c-ch09-workforce-planning-dashboard | https://www.sebenzahub.co.za/dashboard/business/workforce-planning | Complex UI | Workforce planning home with plan-vs-actual | [ ] |
| 3 | c-ch09-headcount-forecast-chart | https://www.sebenzahub.co.za/dashboard/business/workforce-planning | Output | Headcount forecast chart by quarter / department | [ ] |
| 4 | c-ch09-capacity-vs-budget-alignment | https://www.sebenzahub.co.za/dashboard/business/workforce-planning | Output | Scenario model with revenue +20 / -10 / flat | [ ] |
| 5 | c-ch06-internal-job-board-list | https://www.sebenzahub.co.za/dashboard/business/internal-job-board | Complex UI | Employee-only job list with visibility rules | [ ] |
| 6 | c-ch06-performance-management-review | https://www.sebenzahub.co.za/dashboard/business/performance | Decision | Review screen with competency framework | [ ] |
| 7 | c-ch06-succession-planning-chart | https://www.sebenzahub.co.za/dashboard/business/succession-planning | Complex UI | Critical-role chart with successors + readiness bands | [ ] |
| 8 | c-ch05-contract-worker-form | https://www.sebenzahub.co.za/dashboard/business/contract-workers | Decision | Employment type picker (FTC / Independent / Temp / Consultant) | [ ] |
| 9 | c-ch05-contract-end-date-dashboard | https://www.sebenzahub.co.za/dashboard/business/contract-workers | Output | Contract Workers dashboard with end-date alerts | [ ] |
| 10 | c-ch05-section-198-compliance-alert | https://www.sebenzahub.co.za/dashboard/business/contract-workers | Decision | Section 198 / labour broker warning banner | [ ] |

## Ch 14 — Analytics and Reporting (8)

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | c-ch14-bottleneck-view-stage-dwell | https://www.sebenzahub.co.za/dashboard/business/analytics | Complex UI | Bottleneck View — per-stage dwell-time visualization | [ ] |
| 2 | c-ch08-analytics-dashboard-hero _(legacy)_ | https://www.sebenzahub.co.za/dashboard/business/analytics | Nav | Default quarter dashboard with funnel + time-to-hire | [ ] |
| 3 | c-ch08-advanced-analytics-drilldown _(legacy)_ | https://www.sebenzahub.co.za/dashboard/business/analytics | Complex UI | Cohort / drill-down query builder | [ ] |
| 4 | c-ch14-cohort-analysis-retention | https://www.sebenzahub.co.za/dashboard/business/analytics | Complex UI | Q1 hires retention curve at 90/180/365 days | [ ] |
| 5 | c-ch14-predictive-analytics-forecast | https://www.sebenzahub.co.za/dashboard/business/predictive-analytics | Complex UI | Per-requisition forecast with at-risk flags | [ ] |
| 6 | c-ch14-diversity-funnel-stage-dropoff | https://www.sebenzahub.co.za/dashboard/business/diversity-analytics | Complex UI | Demographic funnel with stage-level drop-offs highlighted | [ ] |
| 7 | c-ch08-custom-reports-builder _(legacy)_ | https://www.sebenzahub.co.za/dashboard/business/custom-reports | Complex UI | Drag-drop report builder | [ ] |
| 8 | c-ch14-custom-report-scheduled-delivery | https://www.sebenzahub.co.za/dashboard/business/custom-reports | Decision | Schedule + recipients + format config for an automated board pack | [ ] |

## Ch 16 — Time-to-Fill Creeping Up (4)

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | c-ch16-time-to-fill-trend-chart | https://www.sebenzahub.co.za/dashboard/business/analytics | Complex UI | Time-to-fill trend line over 12 weeks with drift highlighted | [ ] |
| 2 | c-ch16-funnel-conversion-comparison | https://www.sebenzahub.co.za/dashboard/business/analytics | Complex UI | Side-by-side historical vs current funnel conversion table | [ ] |
| 3 | c-ch16-requirement-restriction-flags | https://www.sebenzahub.co.za/dashboard/business/pipeline | Output | Requirement Restriction Analyzer output with rejection counts | [ ] |
| 4 | c-ch16-search-market-pulse | https://www.sebenzahub.co.za/dashboard/business/ai-search | Complex UI | Market Pulse for the affected role family | [ ] |

## Ch 17 — Candidates Ghosting Between Stages (5)

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | c-ch17-stage-age-stuck-cards | https://www.sebenzahub.co.za/dashboard/business/pipeline | Output | Pipeline filtered to Stage age > 5 days | [ ] |
| 2 | c-ch17-engagement-score-heatmap | https://www.sebenzahub.co.za/dashboard/business/pipeline | Complex UI | Heatmap of declining engagement across pipeline candidates | [ ] |
| 3 | c-ch17-sentiment-flag-inbox | https://www.sebenzahub.co.za/dashboard/business/unified-inbox | Output | Unified Inbox message with sentiment-decline flag | [ ] |
| 4 | c-ch17-recovery-sequence-day1-day8 | https://www.sebenzahub.co.za/dashboard/business/email-templates | Complex UI | Sequences → recovery sequence showing Day 1 / Day 4 / Day 8 touches | [ ] |
| 5 | c-ch17-dropoff-funnel-stages | https://www.sebenzahub.co.za/dashboard/business/analytics | Complex UI | Funnel showing drop-off rates per stage with cause overlays | [ ] |

## Ch 18 — Hiring Managers Unhappy with Calibre (4)

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | c-ch18-predictive-hiring-rank | https://www.sebenzahub.co.za/dashboard/business/predictive-hiring | Output | Predictive Hiring scores ranking the shortlist | [ ] |
| 2 | c-ch18-requirement-restriction-evidence | https://www.sebenzahub.co.za/dashboard/business/pipeline | Output | Requirement Restriction output as data for the difficult conversation | [ ] |
| 3 | c-ch18-scorecard-panel-disagreement | https://www.sebenzahub.co.za/dashboard/business/scorecards | Complex UI | Aggregate scorecard view with one outlier interviewer flagged | [ ] |
| 4 | c-ch18-disagreement-analyzer-pattern | https://www.sebenzahub.co.za/dashboard/business/team-dna | Complex UI | Disagreement Analyzer showing systemic-vs-random pattern | [ ] |

## Ch 19 — Advanced and AI Orchestration (5)

| # | Filename | URL | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | c-ch19-predictive-hiring-department-forecast | https://www.sebenzahub.co.za/dashboard/business/predictive-hiring | Complex UI | Per-department forecast with confidence bands | [ ] |
| 2 | c-ch19-hiring-manager-portal-landing | _portal URL provisioned per-manager by your Sebenza account manager_ | Nav | Portal landing with this-manager's-only requisitions visible | [ ] |
| 3 | c-ch19-hiring-manager-candidate-review | _portal URL (as above)_ | Decision | Candidate review surface inside the portal (AI summary + scorecard) | [ ] |
| 4 | c-ch19-workflow-automation-rule-builder | https://www.sebenzahub.co.za/dashboard/business/approvals | Complex UI | Advanced rule builder with multi-condition trigger | [ ] |
| 5 | c-ch19-linda-tool-call-audit-detail | https://www.sebenzahub.co.za/dashboard/business/audit-trail | Output | Audit Trail entry detailing a Linda tool call with inputs/outputs | [ ] |

---

# Summary

| Book | Chapters with placeholders | Placeholders | Existing shots | Total shots expected |
|------|---------------------------|--------------|----------------|----------------------|
| Individual | 18 | 92 | 11 | 103 |
| Recruiter | 32 | 148 | 3 (shared auth) | 151 (3 shared) |
| Corporate | 17 | 121 | 1 shared | 122 (1 shared) |
| **Total new captures needed** | | **361** | | |

Shared across books: `ch02-magic-link-email.png` (already exists) and the Individual/Recruiter Ch 02 auth flow screenshots. No recapture needed for these.

# Capture workflow

1. Pick a chapter. Pick the "Complex UI" rows first (highest leverage).
2. Set up demo data so the UI actually has content worth shooting — empty states make bad screenshots.
3. Shoot at 1920×1200 or similar; crop to relevant area if the UI has wasteful chrome. PNG.
4. Save to `c:\Users\User\Desktop\SebenzaHub_Wiki\sebenzahub_vault\01 How-To Documents\screenshots\` with the exact filename from the table. (NOT `13-raw/screenshots/` — that's hidden on the public site and embeds from there won't render.)
5. Tick `[x]` in the Status column as you go.
6. Open the chapter file in Obsidian to confirm the embed renders.

Naming bug check: if a shot covers a decision + a result, split into two files rather than reusing one generic name.
