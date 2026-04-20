---
title: "Screenshot Capture Plan — How-To Manuals"
type: task
created: 2026-04-20
updated: 2026-04-20
tags: [screenshots, documentation, capture-plan, how-tos]
status: active
---

# Screenshot Capture Plan — How-To Manuals

Master list of every screenshot placeholder inserted across the Individual / Recruiter / Corporate How-To books on 2026-04-20. Use this as a capture checklist — tick the Status column as each file is shot and dropped into `13-raw/screenshots/`.

## Conventions

- **Naming:** `<book-prefix>-chNN-<feature-or-topic-slug>.png`
  - Individual: `i-chNN-...`
  - Recruiter: `r-chNN-...` (Ch 4.5 uses `r-ch04-5-...`)
  - Corporate: `c-chNN-...`
- **Location:** All files go under `13-raw/screenshots/`.
- **Shared files:** `ch02-magic-link-email.png` is reused across all three books (auth flow is identical). Don't recapture.
- **Rendering:** Embeds in chapter files use `![[13-raw/screenshots/<filename>]]`. Once the PNG drops in the folder, Obsidian renders it automatically — no chapter edit needed.

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

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `i-ch06-cv-review-nav.png` | After intro, before "What CV Review actually checks" | Nav | CV Review item in individual sidebar | [ ] |
| 2 | `i-ch06-cv-review-select-dialog.png` | After "Run review" steps | Decision | CV picker dialog on `/cv-review` | [ ] |
| 3 | `i-ch06-cv-review-score-card.png` | Before "Work through it section by section" | Output | Full score card with section-by-section breakdown | [ ] |
| 4 | `i-ch06-bullet-writer-before-after.png` | After Bullet Writer steps | Output | Weak bullet vs rewritten impact bullet side-by-side | [ ] |

## Ch 07 — Skills, Credentials, Video (5)

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `i-ch07-profile-skills-nav.png` | After intro, before "Why this matters" | Nav | Profile page with Skills/Credentials/Video tabs visible | [ ] |
| 2 | `i-ch07-competency-test-interface.png` | After Competency Tests "How to use it" | Complex UI | In-browser test with timer + question panel | [ ] |
| 3 | `i-ch07-credential-gap-output.png` | After Credential Gap Analysis steps | Output | Ranked gap list (critical / useful / nice-to-have) | [ ] |
| 4 | `i-ch07-credential-roadmap-timeline.png` | After Credential Roadmap "How to use it" | Complex UI | Visual time-sequenced roadmap (12/24-month plan) | [ ] |
| 5 | `i-ch07-video-profile-recorder.png` | After video recording steps | Decision | Browser recorder with preview panel | [ ] |

## Ch 08 — Privacy and POPIA (2)

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `i-ch08-popia-consent-toggles.png` | After Profile Visibility intro | Decision | Settings → Privacy panel with public/private toggle + consent switches | [ ] |
| 2 | `i-ch08-dsar-request-form.png` | After POPIA rights table | Decision | Request data export / account deletion form | [ ] |

## Ch 09 — Search Modes (5)

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `i-ch09-search-modes-nav.png` | After intro, before "The three modes" | Nav | Sidebar showing All Jobs, Auto Match, Manual Search | [ ] |
| 2 | `i-ch09-all-jobs-results.png` | After Basic Search "How to use it" | Result | All Jobs page with results + sidebar filters | [ ] |
| 3 | `i-ch09-auto-match-ranked-list.png` | After "What you get back" list | Output | Ranked match list with % scores and matched/missing skill chips | [ ] |
| 4 | `i-ch09-manual-search-filters.png` | After filter list, before "When to use" | Decision | Advanced filters panel (salary, B-BBEE, remote, etc.) | [ ] |
| 5 | `i-ch09-match-score-explanation.png` | After 0–100 score interpretation table | Output | Expanded match-score explanation with reasons | [ ] |

## Ch 10 — Saved Searches & Favourites (4)

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `i-ch10-saved-searches-favourites-nav.png` | After intro difference table | Nav | Sidebar showing Saved Searches + Favourites | [ ] |
| 2 | `i-ch10-saved-search-create-dialog.png` | After Saved Searches "How to use it" | Decision | Save-query dialog with alert frequency dropdown | [ ] |
| 3 | `i-ch10-favourites-list.png` | After Favourites "How to use it" | Result | Favourites page with bookmarked job cards | [ ] |
| 4 | `i-ch10-notifications-settings.png` | After recommended-channel table | Decision | Settings → Notifications matrix (email/SMS/WhatsApp per event) | [ ] |

## Ch 11 — Applying (7)

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `i-ch11-apply-flow-nav.png` | After intro, before "Before you click Apply" | Nav | Apply button on a job listing | [ ] |
| 2 | `i-ch11-jd-decoder-output.png` | After JD Decoder steps | Output | Decoded JD with must-have / nice-to-have / red-flags panels | [ ] |
| 3 | `i-ch11-cover-letter-draft.png` | After Cover Letter Generator steps | Output | Generated draft with tone selector visible | [ ] |
| 4 | `i-ch11-quick-apply-confirmation.png` | After Quick Apply "How to use it" | Decision | One-click confirmation modal | [ ] |
| 5 | `i-ch11-application-portal-kanban.png` | After Application Portal "How to use it" | Complex UI | Kanban board with stage columns | [ ] |
| 6 | `i-ch11-ai-feedback-card.png` | After AI Application Feedback "How to use it" | Output | Feedback tab with score + suggestions | [ ] |
| 7 | `i-ch11-priority-badge.png` | After Priority Applications "How to use it" | Decision | Mark-as-priority toggle + priority badge on submitted app | [ ] |

## Ch 12 — Tracking Applications (4)

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `i-ch12-my-applications-list.png` | After Application Tracking "How to use it" | Result | Flat sortable list of applications with status column | [ ] |
| 2 | `i-ch12-application-tracker-kanban.png` | After kanban column insights | Complex UI | Kanban board with counts per stage | [ ] |
| 3 | `i-ch12-analytics-dashboard.png` | After analytics "course-correct" paragraph | Complex UI | Hero dashboard with response rate, time-to-response, source breakdown | [ ] |
| 4 | `i-ch12-candidate-hub-overview.png` | After Candidate Hub description | Result | Aggregate landing page with upcoming actions | [ ] |

## Ch 13 — Interview Simulator (9)

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `i-ch13-simulator-landing.png` | After intro, before "What the simulator actually does" | Nav | Interview Simulator landing page with sidebar | [ ] |
| 2 | `i-ch13-prep-kit-output.png` | End of Interview Prep Kit | Output | Consolidated prep kit document | [ ] |
| 3 | `i-ch13-anxiety-toolkit.png` | End of Interview Anxiety Toolkit | Complex UI | Breathing exercises + reframe prompts | [ ] |
| 4 | `i-ch13-star-builder.png` | End of STAR Response Builder | Decision | STAR builder form walking through S/T/A/R | [ ] |
| 5 | `i-ch13-simulator-session.png` | End of Interview Simulator | Complex UI | In-session simulator (video/text mode) | [ ] |
| 6 | `i-ch13-ai-interview-chat.png` | End of AI Interview | Complex UI | Chat-based AI interview thread | [ ] |
| 7 | `i-ch13-scoring-breakdown.png` | End of AI Interview Scoring | Output | Score card with dimension breakdowns | [ ] |
| 8 | `i-ch13-thank-you-note.png` | End of Thank You Note Generator | Output | Generated thank-you note draft | [ ] |
| 9 | `i-ch13-interview-comparison.png` | End of Interview Comparison | Complex UI | Cross-session comparison table/chart | [ ] |

## Ch 14 — Company Research (4)

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `i-ch14-company-research-landing.png` | After intro | Nav | Company research tool landing | [ ] |
| 2 | `i-ch14-company-report.png` | Inside AI Company Research, after bullet list | Output | Full company briefing report | [ ] |
| 3 | `i-ch14-interviewer-intel-card.png` | End of Interviewer Intelligence | Output | Interviewer profile card | [ ] |
| 4 | `i-ch14-talking-points.png` | End of Step 5 — Build two questions | Output | Generated talking points panel | [ ] |

## Ch 15 — Receiving an Offer (5)

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `i-ch15-offer-record.png` | End of "Where the offer appears" | Complex UI | Structured offer record view | [ ] |
| 2 | `i-ch15-negotiation-advisor.png` | End of Negotiation Advisor | Output | Recommended counter with reasoning | [ ] |
| 3 | `i-ch15-playbook-document.png` | End of Negotiation Playbook | Output | Multi-round playbook document | [ ] |
| 4 | `i-ch15-scenario-practice.png` | End of Negotiation Scenario | Decision | Written scenario + response feedback | [ ] |
| 5 | `i-ch15-roleplay-chat.png` | End of Negotiation Roleplay | Complex UI | Interactive roleplay chat | [ ] |

## Ch 16 — Salary Negotiator (4)

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `i-ch16-salary-insights-chart.png` | End of Salary Insights | Output | Percentile benchmark chart | [ ] |
| 2 | `i-ch16-negotiation-coach-chat.png` | End of Salary Negotiation Coach | Complex UI | Conversational strategy chat | [ ] |
| 3 | `i-ch16-structured-prep-workflow.png` | End of Salary Negotiation Coaching | Complex UI | Structured prep workflow screen | [ ] |
| 4 | `i-ch16-live-coach-feedback.png` | End of Negotiation Coach | Complex UI | Live roleplay with realtime feedback panel | [ ] |

## Ch 17 — No Responses (5)

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `i-ch17-application-analytics.png` | End of Step 1 — Diagnose | Complex UI | Application Analytics dashboard with patterns | [ ] |
| 2 | `i-ch17-linkedin-optimizer.png` | End of LinkedIn Optimizer | Decision | Optimizer suggestions (before/after) | [ ] |
| 3 | `i-ch17-weakness-alchemist.png` | End of Weakness Alchemist | Output | Reframed weakness output | [ ] |
| 4 | `i-ch17-rejection-recovery-plan.png` | End of Rejection Recovery Coach | Output | Generated recovery plan | [ ] |
| 5 | `i-ch17-networking-message-draft.png` | End of Networking Message Writer | Output | Drafted networking message | [ ] |

## Ch 18 — No Direction (5)

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `i-ch18-direction-tools-overview.png` | Hero, after intro | Nav | Landing view showing the four direction tools | [ ] |
| 2 | `i-ch18-coaching-chat.png` | Tool 1 step 1 | Complex UI | Coaching chat interface mid-session | [ ] |
| 3 | `i-ch18-career-story-draft.png` | Tool 2 step 3 | Output | Generated career narrative draft | [ ] |
| 4 | `i-ch18-career-path-map.png` | Tool 3 step 1 | Complex UI | 5–10 year career progression visualisation | [ ] |
| 5 | `i-ch18-strategy-30-60-90-plan.png` | Tool 4 step 2 | Output | 30/60/90 day action plan document | [ ] |

## Ch 19 — Level Up (13) — heaviest chapter

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `i-ch19-learning-stages-overview.png` | Hero, intro | Nav | Learning hub with six stages visible | [ ] |
| 2 | `i-ch19-skill-gap-chart.png` | Stage 1 Diagnose | Output | Skill gap analysis ranked chart | [ ] |
| 3 | `i-ch19-study-planner-weekly-grid.png` | Stage 2 Plan | Complex UI | Weekly grid with scheduled slots | [ ] |
| 4 | `i-ch19-learning-hub-catalogue.png` | Stage 3 Consume | Nav | Learning Hub catalogue grid | [ ] |
| 5 | `i-ch19-micro-learning-card.png` | Stage 3 Consume | Output | Micro-learning module card | [ ] |
| 6 | `i-ch19-skill-battle-leaderboard.png` | Stage 4 Practice | Complex UI | Leaderboard with streaks | [ ] |
| 7 | `i-ch19-weakness-drill-session.png` | Stage 4 Practice | Complex UI | Active drill session UI | [ ] |
| 8 | `i-ch19-adaptive-difficulty-meter.png` | Stage 4 Practice | Decision | Adaptive difficulty meter | [ ] |
| 9 | `i-ch19-test-feedback-breakdown.png` | Stage 5 Test | Output | Per sub-topic score breakdown | [ ] |
| 10 | `i-ch19-test-portfolio-public-page.png` | Stage 5 Test | Output | Public shareable portfolio page | [ ] |
| 11 | `i-ch19-skill-tree-visualisation.png` | Stage 6 Track | Complex UI | Skill tree with locked/unlocked nodes | [ ] |
| 12 | `i-ch19-learning-analytics-dashboard.png` | Stage 6 Track | Complex UI | Analytics dashboard tied to job-readiness | [ ] |
| 13 | `i-ch19-challenge-streak-state.png` | Stage 6 Track | Output | Streak/badge state | [ ] |

## Ch 20 — Autopilot (3)

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `i-ch20-autopilot-settings.png` | Hero, What Autopilot is | Nav | Autopilot settings page | [ ] |
| 2 | `i-ch20-threshold-sliders.png` | Principles #1 | Decision | Match-score threshold sliders | [ ] |
| 3 | `i-ch20-auto-applied-review-queue.png` | Principles #3 | Output | Queue of auto-submitted applications | [ ] |

## Ch 21 — Career DNA (5)

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `i-ch21-career-dna-settings.png` | Hero, intro | Complex UI | Career DNA configuration screen | [ ] |
| 2 | `i-ch21-elevator-pitch-variants.png` | Elevator Pitch step 2 | Output | 30s / 60s / 2min variant tabs | [ ] |
| 3 | `i-ch21-basic-dashboard.png` | Basic Dashboard | Nav | Main dashboard with next-best-actions | [ ] |
| 4 | `i-ch21-billing-subscription.png` | Billing | Nav | Billing & subscription page | [ ] |
| 5 | `i-ch21-support-contact-form.png` | Email Support | Output | Contact Support form | [ ] |

## Ch 22 — Market Radar (4)

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `i-ch22-market-radar-watches.png` | How to set it up | Complex UI | Configured watches list | [ ] |
| 2 | `i-ch22-career-pulse-report.png` | Career Pulse step 1 | Output | Career Pulse hero report view | [ ] |
| 3 | `i-ch22-demand-salary-trend.png` | Career Pulse step 2 | Output | Demand / salary trajectory chart | [ ] |
| 4 | `i-ch22-hottest-cities-heatmap.png` | Worked example | Output | Hottest cities heatmap | [ ] |

## Ch 23 — Community & Mentorship (4)

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `i-ch23-community-hub.png` | What's in Community | Nav | Community section landing with 6 tiles | [ ] |
| 2 | `i-ch23-mentor-connect-match.png` | Finding a mentor | Complex UI | Mentor browse/filter interface | [ ] |
| 3 | `i-ch23-portfolio-builder-editor.png` | Portfolio step 1 | Complex UI | Portfolio Builder edit view | [ ] |
| 4 | `i-ch23-published-portfolio-page.png` | Portfolio step 4 | Output | Published public portfolio page | [ ] |

---

# Recruiter Book (149 placeholders — 3 existing, 146 to capture)

## Ch 03 — Agency Onboarding (3)

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `r-ch03-agency-onboarding-form.png` | Top (hero) | Nav | Agency onboarding form top view | [ ] |
| 2 | `r-ch03-sector-multi-select.png` | After Step 3 | Decision | Sector multi-select dropdown open | [ ] |
| 3 | `r-ch03-verification-proof-url.png` | After Step 4 | Decision | Verification proof URL field | [ ] |

## Ch 04 — Recruiter Dashboard (5)

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `r-ch04-dashboard-full-view.png` | Top (hero) | Nav | Full recruiter dashboard with sidebar | [ ] |
| 2 | `r-ch04-recruitment-path-sidebar.png` | After Path table | Nav | Recruitment Path sidebar group expanded | [ ] |
| 3 | `r-ch04-parallel-tracks-sidebar.png` | After Tracks list | Nav | Parallel Tracks sidebar section | [ ] |
| 4 | `r-ch04-billing-usage-page.png` | After Billing & Usage | Output | Billing page with usage-vs-limit meters | [ ] |
| 5 | `r-ch04-notifications-settings.png` | After All Channels | Decision | Notifications per-event channel config | [ ] |

## Ch 04.5 — How We Charge (3)

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `r-ch04-5-pricing-page.png` | After plans table | Output | Pricing page with three tiers | [ ] |
| 2 | `r-ch04-5-support-tier-comparison.png` | After Dedicated Support | Complex UI | Support tier comparison table | [ ] |
| 3 | `r-ch04-5-support-contact-form.png` | Same block | Decision | Support contact form | [ ] |

## Ch 05 — Agency Profile (5)

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `r-ch05-agency-profile-landing.png` | Where it lives (hero) | Nav | Agency Profile landing page | [ ] |
| 2 | `r-ch05-website-import-populated.png` | After Website Import | Output | URL input then populated form | [ ] |
| 3 | `r-ch05-social-proof-summary.png` | After Social Proof | Output | Social proof summary with chart | [ ] |
| 4 | `r-ch05-recruiter-bio-output.png` | After Bio Writer | Output | Generated recruiter bio output | [ ] |
| 5 | `r-ch05-recruiter-dna-card.png` | After DNA Card | Output | Recruiter DNA Card one-screen | [ ] |

## Ch 06 — AI Profile Assets (6)

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `r-ch06-brand-page-generator.png` | After Brand Page Gen | Output | Brand page generator form + draft | [ ] |
| 2 | `r-ch06-public-company-page-slug.png` | After Public Page | Nav | Public company page at slug URL | [ ] |
| 3 | `r-ch06-brand-content-export-dialog.png` | After Export | Decision | Export format selector dialog | [ ] |
| 4 | `r-ch06-case-study-output.png` | After Case Study | Output | Generated case study narrative | [ ] |
| 5 | `r-ch06-employer-brand-content-editor.png` | After Brand Content | Decision | Content editor with format/tone picker | [ ] |
| 6 | `r-ch06-market-analysis-report.png` | After Market Analysis | Output | Market analysis report with charts | [ ] |

## Ch 07 — Team Setup (5)

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `r-ch07-team-invite-form.png` | After Team Members | Decision | Invite member form with role dropdown | [ ] |
| 2 | `r-ch07-role-permissions.png` | After Custom roles | Complex UI | Custom role permission matrix | [ ] |
| 3 | `r-ch07-collaboration-mention-feed.png` | After Team Collaboration | Complex UI | @-mention feed & team activity | [ ] |
| 4 | `r-ch07-coach-insights-dashboard.png` | After Coach Insights | Output | Coach insight cards per recruiter | [ ] |
| 5 | `r-ch07-recruiter-benchmark-chart.png` | After Benchmark | Output | Benchmark chart agency vs platform | [ ] |

## Ch 08 — Adding Clients (3)

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `r-ch08-client-list-view.png` | Where it lives (hero) | Nav | Master client list with filters | [ ] |
| 2 | `r-ch08-add-client-form.png` | After min fields table | Decision | Add Client form filled in | [ ] |
| 3 | `r-ch08-client-detail-requisitions.png` | After Documents | Nav | Client detail page with requisitions | [ ] |

## Ch 09 — Engagement Terms (2)

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `r-ch09-engagement-terms-form.png` | Where it lives (hero) | Decision | Engagement form (fee structure, terms) | [ ] |
| 2 | `r-ch09-signed-agreement-view.png` | After multi-engagements | Output | Signed agreement / engagement record | [ ] |

## Ch 10 — Managing Client Relationships (2)

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `r-ch10-client-crm-view.png` | After 4 tools table (hero) | Nav | Client CRM master view | [ ] |
| 2 | `r-ch10-activity-timeline.png` | After 30-second rule | Complex UI | Call notes / activity interaction timeline | [ ] |

## Ch 11 — Posting a Job (8)

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `r-ch11-job-list-status.png` | Intro (hero) | Nav | Jobs list with status column | [ ] |
| 2 | `r-ch11-ai-jd-generator-output.png` | Write — after JD Gen | Output | Generated JD in form | [ ] |
| 3 | `r-ch11-bias-detection-highlights.png` | Validate — Bias | Output | Inclusivity highlights + rewrites | [ ] |
| 4 | `r-ch11-jd-compliance-flags.png` | Validate — Compliance | Output | Block/warning compliance flags | [ ] |
| 5 | `r-ch11-salary-benchmark-chart.png` | Validate — Salary | Output | Market median + P25–P75 range | [ ] |
| 6 | `r-ch11-publish-channel-selector.png` | Publish — Postings | Decision | Publish dialog with channel toggles | [ ] |
| 7 | `r-ch11-job-board-integrations-panel.png` | Publish — Boards | Decision | Job Board Integrations panel (Pnet/CJ) | [ ] |
| 8 | `r-ch11-job-ai-insights-dashboard.png` | Monitor — AI Insights | Output | Job AI Insights dashboard | [ ] |

## Ch 12 — Sourcing Channels (7)

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `r-ch12-candidate-search-results.png` | After Basic Search | Nav | Candidate search results page | [ ] |
| 2 | `r-ch12-ai-hybrid-search.png` | After Hybrid | Output | Hybrid natural-language search results | [ ] |
| 3 | `r-ch12-smart-search-suggestions.png` | After Suggestions | Complex UI | Smart suggestions sidebar | [ ] |
| 4 | `r-ch12-market-pulse-chart.png` | After Market Pulse | Output | Market pulse trend chart | [ ] |
| 5 | `r-ch12-competitive-heat-map.png` | After Heat Map | Complex UI | Competitive heat map geo view | [ ] |
| 6 | `r-ch12-talent-pool-generator-dialog.png` | After Pool Generator | Decision | Talent Pool Generator prompt dialog | [ ] |
| 7 | `r-ch12-linkedin-sync.png` | After LinkedIn Sync | Nav | LinkedIn Sync integration panel | [ ] |

## Ch 13 — LinkedIn Leads & Rediscovery (4)

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `r-ch13-linkedin-leads-import.png` | After lead source setup | Decision | LinkedIn Leads import/upload screen | [ ] |
| 2 | `r-ch13-ai-candidate-recommendations.png` | After AI Recs | Output | Ranked candidate recommendations list | [ ] |
| 3 | `r-ch13-candidate-reengagement.png` | After Re-Engagement | Output | AI-suggested re-engagement message | [ ] |
| 4 | `r-ch13-talent-rediscovery-view.png` | After Rediscovery | Complex UI | Dormant candidates ranked vs open jobs | [ ] |

## Ch 14 — Talent Pools & CRM (6)

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `r-ch14-talent-pools-list.png` | After pool creation | Nav | Talent Pools list with criteria | [ ] |
| 2 | `r-ch14-auto-tag-candidate.png` | After Auto-Tag | Output | Auto-applied tags on candidate | [ ] |
| 3 | `r-ch14-talent-pool-clustering.png` | After Clustering | Complex UI | AI-discovered cluster suggestions | [ ] |
| 4 | `r-ch14-talent-pool-analysis.png` | After Analysis | Output | Pool analysis distribution charts | [ ] |
| 5 | `r-ch14-side-by-side-comparison.png` | After Comparison | Complex UI | 2–5 candidates compared across attributes | [ ] |
| 6 | `r-ch14-csv-bulk-import.png` | After CSV Import | Decision | Column mapping + dedupe UI | [ ] |

## Ch 15 — Screening Config (3)

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `r-ch15-screening-roles-config.png` | After Screening Roles "How to use it" | Complex UI | Screening Roles config screen per role family | [ ] |
| 2 | `r-ch15-criteria-generator-output.png` | After Screening Criteria Generator | Output | AI-generated must-haves / nice-to-haves / weights | [ ] |
| 3 | `r-ch15-knockout-questions-editor.png` | Before "Examples that work" (Layer 1) | Complex UI | Knockout questions editor with yes/no rules | [ ] |

## Ch 16 — The Pipeline (5)

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `r-ch16-pipeline-kanban-hero.png` | Hero, top of page | Complex UI | Full kanban board, all stages, many cards | [ ] |
| 2 | `r-ch16-drag-between-stages.png` | After drag/drop description | Decision | Candidate card mid-drag between columns | [ ] |
| 3 | `r-ch16-engagement-score-card.png` | After Engagement Scorer | Output | Candidate card with engagement indicator beside match score | [ ] |
| 4 | `r-ch16-requirement-restriction-warning.png` | After Requirement Restriction Analyzer | Output | Warning overlay listing which criteria reject | [ ] |
| 5 | `r-ch16-stage-config-settings.png` | After "5–7 sweet spot" paragraph | Complex UI | Stage customisation settings screen | [ ] |

## Ch 17 — Screening Tools (14) — heaviest chapter

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `r-ch17-ai-candidate-screening-shortlist.png` | After AI Candidate Screening | Output | Ranked shortlist with reasoning per candidate | [ ] |
| 2 | `r-ch17-resume-vs-jd-scoring-card.png` | After Resume vs JD Scoring | Output | Single candidate fit % card with explanation | [ ] |
| 3 | `r-ch17-batch-screening-report.png` | After Batch Screening | Output | Batch report grouped advance / maybe / reject | [ ] |
| 4 | `r-ch17-predictive-hiring-risk-score.png` | After Predictive Hiring | Output | Retention risk score with contributing factors | [ ] |
| 5 | `r-ch17-culture-fit-radar-chart.png` | After Culture Fit | Output | 6-dimension radar chart | [ ] |
| 6 | `r-ch17-location-intelligence-map.png` | After Location Intelligence | Output | SA province-level commute/talent map | [ ] |
| 7 | `r-ch17-screening-chatbot-conversation.png` | After AI Screening Chatbot | Complex UI | Chatbot conversation transcript | [ ] |
| 8 | `r-ch17-screening-next-steps-recommendation.png` | After Screening Next Steps | Decision | Suggested-action button with reasoning | [ ] |
| 9 | `r-ch17-test-builder-branching-logic.png` | After Test Builder | Complex UI | Test with branching logic editor | [ ] |
| 10 | `r-ch17-test-templates-library.png` | After Test Templates | Nav | Template library grid | [ ] |
| 11 | `r-ch17-anti-cheat-monitoring-live.png` | After Anti-Cheat Monitoring | Complex UI | Live monitoring with flagged events | [ ] |
| 12 | `r-ch17-ai-reference-questions.png` | After AI Reference Questions | Output | Generated role-specific questions | [ ] |
| 13 | `r-ch17-reference-check-summary.png` | After Reference Check Summary | Output | AI summary with red flags | [ ] |
| 14 | `r-ch17-blind-hiring-before-after.png` | After Blind Hiring | Decision | Before/after redaction split view | [ ] |

## Ch 18 — Interview Scheduling (5)

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `r-ch18-self-scheduling-calendar.png` | After Self-Scheduling | Complex UI | Candidate-facing calendar time picker | [ ] |
| 2 | `r-ch18-scheduling-links-share-dialog.png` | After Scheduling Links | Nav | Share link copy dialog | [ ] |
| 3 | `r-ch18-ai-interview-questions-output.png` | After AI Interview Questions | Output | Generated behavioural/technical questions | [ ] |
| 4 | `r-ch18-scorecard-template-editor.png` | After Scorecards | Complex UI | Rubric template editor with rating scales | [ ] |
| 5 | `r-ch18-scorecard-rubric-filled.png` | After Scorecard Suggestions | Output | Filled scorecard mid-interview | [ ] |

## Ch 19 — Video Interviews (7)

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `r-ch19-video-interview-session.png` | After Video Interviews feature | Complex UI | Video interview in session with controls | [ ] |
| 2 | `r-ch19-ai-conversational-interview-chat.png` | After AI Conversational Interview | Complex UI | AI chatting with candidate in browser | [ ] |
| 3 | `r-ch19-sentiment-timeline-chart.png` | After Sentiment Timeline | Output | Minute-by-minute sentiment chart | [ ] |
| 4 | `r-ch19-behavioral-star-detection.png` | After Behavioral Analysis | Output | STAR detection on each question | [ ] |
| 5 | `r-ch19-communication-deep-dive-metrics.png` | After Communication Deep Dive | Output | Filler-word rate, vocab metrics | [ ] |
| 6 | `r-ch19-hiring-recommendation-card.png` | After Hiring Recommendation | Decision | Top-of-record recommendation card | [ ] |
| 7 | `r-ch19-bias-audit-overlay.png` | After "sorting aid, never a decision" warning | Output | Bias audit demographic overlay | [ ] |

## Ch 20 — Making an Offer (5)

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `r-ch20-offer-management-list.png` | After Offer Management | Complex UI | Master offer list with versions/status | [ ] |
| 2 | `r-ch20-offer-letter-generator-output.png` | After Offer Letter Generator | Output | Merged letter preview | [ ] |
| 3 | `r-ch20-acceptance-predictor-probability.png` | After Acceptance Predictor | Output | 0–100% probability with reasoning | [ ] |
| 4 | `r-ch20-predictive-performance-trajectory.png` | After Predictive Performance | Output | 30/90/180/365-day trajectory chart | [ ] |
| 5 | `r-ch20-team-fit-simulation.png` | After Team Fit Simulation | Output | Friction points & complementary strengths | [ ] |

## Ch 21 — Recording a Placement (3)

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `r-ch21-placement-recording-form.png` | After Step 1 status list | Complex UI | Placement record with status/start date fields | [ ] |
| 2 | `r-ch21-background-checks-integration.png` | After Background Checks | Output | Background check result with POPIA consent log | [ ] |
| 3 | `r-ch21-placement-analytics-dashboard.png` | After Placement Analytics | Complex UI | Time-to-fill, retention, ratios dashboard | [ ] |

## Ch 22 — Unified Inbox (5)

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `r-ch22-unified-inbox-multichannel.png` | After 3-panel layout description | Complex UI | Three-panel view: conversations + thread + context | [ ] |
| 2 | `r-ch22-ai-email-composer-suggestions.png` | After AI Email Composer | Output | Composer with AI draft + tone suggestions | [ ] |
| 3 | `r-ch22-email-templates-library.png` | After Email Templates | Nav | Template library grid | [ ] |
| 4 | `r-ch22-outreach-draft-generator.png` | After Outreach Draft Generator | Output | Personalised outreach draft | [ ] |
| 5 | `r-ch22-whatsapp-messages-in-inbox.png` | After WhatsApp Messages | Complex UI | WhatsApp thread within Unified Inbox | [ ] |

## Ch 23 — Templates, Sequences, Chatbot (4)

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `r-ch23-template-variable-editor.png` | After "Building a template" steps | Complex UI | Template body with merge field variables | [ ] |
| 2 | `r-ch23-email-sequences-builder.png` | After Email Sequences feature | Complex UI | Sequence builder with Day 0/4/10 steps | [ ] |
| 3 | `r-ch23-sequence-conditional-branches.png` | After sequence-build step 6 | Complex UI | Exit rules + conditional branches | [ ] |
| 4 | `r-ch23-sequence-analytics.png` | After Candidate Re-Engagement callback | Output | Per-sequence reply/open/exit analytics | [ ] |

## Ch 24 — WhatsApp at Scale (5)

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `r-ch24-whatsapp-apply-6-languages.png` | After WhatsApp-First Apply | Complex UI | Apply-via-WhatsApp flow with language picker | [ ] |
| 2 | `r-ch24-whatsapp-command-center.png` | After WhatsApp Apply step 6 | Complex UI | Command Center conversation list + reply panel | [ ] |
| 3 | `r-ch24-whatsapp-campaign-builder.png` | After WhatsApp Campaigns feature | Complex UI | Campaign composer with template picker | [ ] |
| 4 | `r-ch24-audience-segmentation.png` | After campaign-build step 7 | Complex UI | Segment filters: pool + tags + consent | [ ] |
| 5 | `r-ch24-campaign-analytics-dashboard.png` | After opt-out rule end | Output | Campaign sent / delivered / replied / opted-out metrics | [ ] |

## Ch 25 — Reading Your Analytics (5)

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `r-ch25-kpi-dashboard-hero.png` | Top hero | Nav | KPI Dashboard with placement/revenue/fill-rate tiles | [ ] |
| 2 | `r-ch25-recruiter-analytics-funnel.png` | Recruiter Analytics | Complex UI | Full conversion funnel chart stage-by-stage | [ ] |
| 3 | `r-ch25-cost-per-hire-breakdown.png` | After "What it shows" list | Output | Cost-per-hire table by source and client | [ ] |
| 4 | `r-ch25-predictive-analytics-forecast.png` | After predictive bullet list | Output | 30/60/90-day forecast with at-risk role flags | [ ] |
| 5 | `r-ch25-source-quality-scoring.png` | End of Requirement Check "Specific signals" | Output | Per-source quality score ranking | [ ] |

## Ch 26 — Diversity, Panel, AI (5)

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `r-ch26-diversity-pipeline-stages.png` | Top hero | Complex UI | Stage-by-stage demographic drop-off chart | [ ] |
| 2 | `r-ch26-video-bias-audit-flags.png` | After Video Bias Audit | Output | Flagged-interview list with bias indicators | [ ] |
| 3 | `r-ch26-interviewer-effectiveness-scoring.png` | After Interviewer Effectiveness | Output | Interviewer leaderboard with scores | [ ] |
| 4 | `r-ch26-disagreement-scorecard-overlay.png` | After Disagreement Analyzer | Complex UI | Multi-interviewer scorecard overlay | [ ] |
| 5 | `r-ch26-team-dna-composition.png` | After Team DNA | Complex UI | Team composition radar / strengths view | [ ] |

## Ch 27 — POPIA in Practice (4)

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `r-ch27-popia-consent-dashboard.png` | After POPIA Compliance | Nav | Consent dashboard landing | [ ] |
| 2 | `r-ch27-dsar-request-screen.png` | After DSAR bullet list | Decision | DSAR compilation screen | [ ] |
| 3 | `r-ch27-consent-audit-log.png` | After retention config paragraph | Output | Timestamped consent audit log | [ ] |
| 4 | `r-ch27-candidate-nps-results.png` | After NPS | Output | NPS promoter / passive / detractor chart | [ ] |

## Ch 28 — B-BBEE, EE, Audit Trail (5)

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `r-ch28-ee-report-eea2-output.png` | After EE Reporting | Output | EEA2/EEA4-formatted PDF output | [ ] |
| 2 | `r-ch28-bbbee-scorecard-tracker.png` | After B-BBEE Compliance | Complex UI | Pillar-by-pillar scorecard tracker | [ ] |
| 3 | `r-ch28-transformation-statement-output.png` | After Transformation Statement | Output | Generated transformation statement | [ ] |
| 4 | `r-ch28-blind-hiring-toggle.png` | After Blind Hiring callback | Decision | Blind Hiring toggle with masked candidate preview | [ ] |
| 5 | `r-ch28-audit-trail-timeline.png` | After audit search numbered list | Complex UI | Chronological immutable timeline | [ ] |

## Ch 29 — Career Site, Brand (4)

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `r-ch29-career-site-builder-editor.png` | After Career Site 8-step list | Complex UI | Builder editor with branding panels | [ ] |
| 2 | `r-ch29-published-career-site-preview.png` | After Career Site "What's on it" list | Output | Live published career site preview | [ ] |
| 3 | `r-ch29-custom-domain-settings.png` | After "Career Site beats..." list | Nav | Custom subdomain settings | [ ] |
| 4 | `r-ch29-brand-content-library.png` | After Brand Page "What's on it" testimonials bullet | Complex UI | Brand content library assets grid | [ ] |

## Ch 30 — Marketing, Referrals, NPS (5)

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `r-ch30-referral-program-dashboard.png` | After Referral Program | Nav | Referral programme dashboard with commissions | [ ] |
| 2 | `r-ch30-referral-tracking-attribution.png` | After Referral Tracking | Output | Referrer-to-placement attribution view | [ ] |
| 3 | `r-ch30-coaching-report-document.png` | After Coaching Report | Output | Generated coaching report doc | [ ] |
| 4 | `r-ch30-nps-results-chart.png` | After NPS score interpretation | Output | NPS score breakdown chart | [ ] |
| 5 | `r-ch30-campaign-builder.png` | After campaign build steps | Complex UI | Campaign builder configuration | [ ] |

## Ch 31 — Fill Rate Dropping (2) — scenario

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `r-ch31-fill-rate-trend-diagnostic.png` | After funnel code block | Output | Fill-rate trend diagnostic chart | [ ] |
| 2 | `r-ch31-requirement-restriction-flags.png` | After Requirement Restriction Analyzer try-box | Output | Per-requirement pool-shrink flags | [ ] |

## Ch 32 — Candidates Ghosting (2) — scenario

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `r-ch32-engagement-score-heatmap.png` | After Engagement Scorer try-box | Complex UI | Per-candidate engagement heatmap | [ ] |
| 2 | `r-ch32-dropoff-funnel-stages.png` | After stage-cause table | Output | Stage-by-stage drop-off funnel | [ ] |

## Ch 33 — Client Unhappy with Calibre (2) — scenario

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `r-ch33-culture-fit-disagreement.png` | After Culture Fit try-box | Output | Culture Fit 6-dimension scoring vs panel | [ ] |
| 2 | `r-ch33-predictive-vs-actual-performance.png` | After Predictive Hiring try-box | Output | Predicted vs actual performance comparison | [ ] |

## Ch 34 — Advanced & Platinum (6)

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `r-ch34-rapid-workflow-quick-actions.png` | After Rapid Workflow | Nav | Rapid Workflow quick-action panel | [ ] |
| 2 | `r-ch34-workflow-automation-rule-builder.png` | After Workflow Automation | Complex UI | Rule-builder with triggers / actions | [ ] |
| 3 | `r-ch34-auto-pilot-rules-config.png` | After Auto-Pilot | Complex UI | Auto-Pilot shadow / live config with thresholds | [ ] |
| 4 | `r-ch34-fraud-detection-alerts.png` | After Fraud Detection | Output | Fraud dashboard with flagged signals | [ ] |
| 5 | `r-ch34-hiring-manager-portal.png` | After Hiring Manager Portal | Nav | Simplified manager review surface | [ ] |
| 6 | `r-ch34-api-key-management.png` | After API Access | Nav | Token management with scopes | [ ] |

---

# Corporate Book (33 placeholders)

## Ch 01 — What Sebenza Hub is for Corporates (2)

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `c-ch01-corporate-dashboard-hero.png` | Top (hero) | Nav | Corporate dashboard landing page overview | [ ] |
| 2 | `c-ch01-three-user-types-diagram.png` | Before "How Corporate differs..." | Nav | Individual / Recruiter / Corporate three-audience diagram | [ ] |

## Ch 02 — Creating Your Account (1 new; 1 shared)

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `ch02-magic-link-email.png` | Step 1 (reused) | Shared | **Already captured** — same file as Individual/Recruiter Ch 02 | [x] |
| 2 | `c-ch02-role-selection-business.png` | Step 3 — after "Choose Business" | Decision | Role picker with Business tile highlighted | [ ] |

## Ch 03 — Setting Up Your Org (6)

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `c-ch03-team-members-invite-dialog.png` | Team Members step 5 | Decision | Invite dialog with email + role fields | [ ] |
| 2 | `c-ch03-rbac-permissions-matrix.png` | RBAC step 5 | Complex UI | Roles × permissions matrix (view/edit/export per role) | [ ] |
| 3 | `c-ch03-sso-configuration-form.png` | SSO step 2 | Decision | SAML/OAuth protocol picker + SP metadata | [ ] |
| 4 | `c-ch03-company-branding-upload-preview.png` | Branding step 6 | Output | Logo + colours + hero on sample job listing | [ ] |
| 5 | `c-ch03-white-label-custom-domain.png` | White-Label step 3 | Decision | Custom domain entry + DNS records panel | [ ] |
| 6 | `c-ch03-team-collaboration-feed.png` | Collaboration step 4 | Output | Activity feed with @mentions and decisions | [ ] |

## Ch 04 — Your First Requisition (5)

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `c-ch04-create-requisition-form.png` | Basic ATS step 1 | Nav | Create requisition form | [ ] |
| 2 | `c-ch04-basic-ats-pipeline-view.png` | Basic ATS step 5 | Complex UI | Pipeline kanban (Applied/Screened/Interviewed/Offered/Hired) | [ ] |
| 3 | `c-ch04-full-ats-custom-stages-editor.png` | Full ATS step 2 | Complex UI | Custom stages editor per role family | [ ] |
| 4 | `c-ch04-automation-rules-builder.png` | Full ATS after step 3 | Decision | Auto-advance / auto-reject / auto-message rule builder | [ ] |
| 5 | `c-ch04-onboarding-checklist.png` | Onboarding step 6 | Output | 30/60/90 checklist with owners + due dates | [ ] |

## Ch 05 — Contract Workers (3)

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `c-ch05-contract-worker-form.png` | Step 1 | Decision | Employment type picker (FTC / Independent / Temp / Consultant) | [ ] |
| 2 | `c-ch05-contract-end-date-dashboard.png` | Step 6 | Output | Contract Workers dashboard with end-date alerts | [ ] |
| 3 | `c-ch05-section-198-compliance-alert.png` | After compliance paragraph | Decision | Section 198 / labour broker warning banner | [ ] |

## Ch 06 — Internal Mobility (3)

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `c-ch06-internal-job-board-list.png` | IJB step 5 | Complex UI | Employee-only job list with visibility rules | [ ] |
| 2 | `c-ch06-succession-planning-chart.png` | Succession step 3 | Complex UI | Critical-role chart with successors + readiness bands | [ ] |
| 3 | `c-ch06-performance-management-review.png` | Performance step 4 | Decision | Review screen with competency framework | [ ] |

## Ch 07 — Vendor Management (3)

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `c-ch07-po-creation-form.png` | Step 2 | Decision | Auto-generated PO form per vendor | [ ] |
| 2 | `c-ch07-agency-performance-comparison.png` | Step 4 | Complex UI | Side-by-side vendor metrics (submit/interview/offer/time-to-fill) | [ ] |
| 3 | `c-ch07-vendor-compliance-status.png` | Step 6 | Output | Red / yellow / green compliance grid (MSA/POPIA/B-BBEE/tax) | [ ] |

## Ch 08 — Integrations and Reporting (6)

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `c-ch08-analytics-dashboard-hero.png` | Analytics step 1 | Nav | Default quarter dashboard with funnel + time-to-hire | [ ] |
| 2 | `c-ch08-advanced-analytics-drilldown.png` | Advanced step 4 | Complex UI | Cohort / drill-down query builder | [ ] |
| 3 | `c-ch08-custom-reports-builder.png` | Custom Reports step 1 | Complex UI | Drag-drop report builder | [ ] |
| 4 | `c-ch08-notification-channels-matrix.png` | All Channels step 3 | Decision | Event × channel routing matrix | [ ] |
| 5 | `c-ch08-hris-integration-config.png` | HRIS step 1 | Decision | SAP / Workday / BambooHR vendor selection + creds | [ ] |
| 6 | `c-ch08-api-key-management.png` | API step 1 | Decision | Token generation + scope picker | [ ] |

## Ch 09 — Workforce Planning (3)

| # | Filename | Position | Type | What to capture | Status |
|---|---|---|---|---|---|
| 1 | `c-ch09-workforce-planning-dashboard.png` | Step 1 | Complex UI | Workforce planning home with plan-vs-actual | [ ] |
| 2 | `c-ch09-headcount-forecast-chart.png` | Step 2 | Output | Headcount forecast chart by quarter / department | [ ] |
| 3 | `c-ch09-capacity-vs-budget-alignment.png` | Step 6 | Output | Scenario model with revenue +20 / -10 / flat | [ ] |

---

# Summary

| Book | Chapters with placeholders | Placeholders added | Existing shots | Total shots expected |
|------|---------------------------|--------------------|----------------|----------------------|
| Individual | 18 | 92 | 11 | 103 |
| Recruiter | 32 | 148 | 3 (shared auth) | 151 (3 shared) |
| Corporate | 9 | 32 | 1 shared | 33 (1 shared) |
| **Total new captures needed** | | **272** | | |

Shared across books: `ch02-magic-link-email.png` (already exists) and the Individual/Recruiter Ch 02 auth flow screenshots. No recapture needed for these.

# Capture workflow

1. Pick a chapter. Pick the "Complex UI" rows first (highest leverage).
2. Set up demo data so the UI actually has content worth shooting — empty states make bad screenshots.
3. Shoot at 1920×1200 or similar; crop to relevant area if the UI has wasteful chrome. PNG.
4. Save to `c:\Users\User\Desktop\SebenzaHub_Wiki\sebenzahub_vault\13-raw\screenshots\` with the exact filename from the table.
5. Tick `[x]` in the Status column as you go.
6. Open the chapter file in Obsidian to confirm the embed renders.

Naming bug check: if a shot covers a decision + a result, split into two files rather than reusing one generic name.
