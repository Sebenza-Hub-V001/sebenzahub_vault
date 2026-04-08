# Sebenza Hub - Comprehensive Feature Inventory

> Last updated: 2026-04-06

## Platform Summary

Sebenza Hub is South Africa's intelligent recruitment platform serving three user types: **Individuals** (job seekers), **Recruiters** (recruitment agencies), and **Businesses/Corporates** (employers). The platform includes an **Admin** dashboard for platform management.

**Tech Stack**: React 18 + TypeScript + Vite | Express.js + Drizzle ORM + PostgreSQL (Neon) | Passwordless magic link auth via Resend

---

## Scale at a Glance

| Metric | Count |
|--------|-------|
| Frontend Pages | 325 |
| API Endpoints | 3586 |
| Database Tables | 755 |
| Reusable Components | 496 |
| E2E Test Suites | 66 |
| Seeded Features | 157 |
| Subscription Plans | 18 |
| Migration Files | 28 |
| Seed Files | 11 |

---

## 1. PUBLIC / LANDING PAGES (23 pages)

Route base: `/`

| Route | Page |
|-------|------|
| `about-us` | About Us |
| `admin-setup` | Admin Setup |
| `ai-features` | Ai Features |
| `blog` | Blog |
| `blog-post` | Blog Post |
| `checkout-result` | Checkout Result |
| `contact` | Contact |
| `get-started` | Get Started |
| `get-started-live` | Get Started Live |
| `home` | Home |
| `individuals` | Individuals |
| `jobs-landing` | Jobs Landing |
| `login` | Login |
| `not-found` | Not Found |
| `onboarding` | Onboarding |
| `onboarding-business` | Onboarding Business |
| `onboarding-individual` | Onboarding Individual |
| `onboarding-recruiter` | Onboarding Recruiter |
| `pricing` | Pricing |
| `recruiters` | Recruiters |
| `refund-policy` | Refund Policy |
| `shipping-policy` | Shipping Policy |
| `terms-and-conditions` | Terms And Conditions |

---

## 2. INDIVIDUAL DASHBOARD (85 pages)

Route base: `/dashboard/individual/`

| Route | Page |
|-------|------|
| `all-jobs` | All Jobs |
| `analytics` | Analytics |
| `application-analytics` | Application Analytics |
| `application-notes` | Application Notes |
| `application-tracker` | Application Tracker |
| `applications` | Applications |
| `assessments-tab` | Assessments Tab |
| `auto-match` | Auto Match |
| `billing` | Billing |
| `candidate-portal-enhanced` | Candidate Portal Enhanced |
| `career-path` | Career Path |
| `career-pulse` | Career Pulse |
| `category-breakdown-cards` | Category Breakdown Cards |
| `certification-card` | Certification Card |
| `certification-form` | Certification Form |
| `certifications` | Certifications |
| `certifications-tab` | Certifications Tab |
| `coaching` | Coaching |
| `community` | Community |
| `community-badges` | Community Badges |
| `community-interviews` | Community Interviews |
| `community-leaderboard` | Community Leaderboard |
| `community-mentors` | Community Mentors |
| `community-trending` | Community Trending |
| `company-research` | Company Research |
| `cover-letter` | Cover Letter |
| `credential-auto-import` | Credential Auto Import |
| `credential-gap-analysis` | Credential Gap Analysis |
| `credential-match-panel` | Credential Match Panel |
| `credential-passport` | Credential Passport |
| `credential-privacy-toggle` | Credential Privacy Toggle |
| `credential-score-ring` | Credential Score Ring |
| `credential-share-dialog` | Credential Share Dialog |
| `credential-timeline` | Credential Timeline |
| `credential-wallet-stats` | Credential Wallet Stats |
| `credential-wallet-tab` | Credential Wallet Tab |
| `credentials` | Credentials |
| `cv-review` | Cv Review |
| `cv-templates` | Cv Templates |
| `cvs` | Cvs |
| `dashboard` | Dashboard |
| `document-segment-review` | Document Segment Review |
| `education-card` | Education Card |
| `education-form` | Education Form |
| `education-tab` | Education Tab |
| `experience-surveys` | Experience Surveys |
| `expiry-alerts` | Expiry Alerts |
| `favourites` | Favourites |
| `follow-up-reminders` | Follow Up Reminders |
| `import-review-list` | Import Review List |
| `inbox` | Inbox |
| `interview-scheduling` | Interview Scheduling |
| `interview-simulator` | Interview Simulator |
| `job-linked-learning` | Job Linked Learning |
| `learning` | Learning |
| `learning-analytics` | Learning Analytics |
| `learning-challenges` | Learning Challenges |
| `learning-hub` | Learning Hub |
| `learning-paths` | Learning Paths |
| `manual-search` | Manual Search |
| `mentorship` | Mentorship |
| `micro-learning` | Micro Learning |
| `nqf-level-selector` | Nqf Level Selector |
| `peer-attestation-request` | Peer Attestation Request |
| `peer-teaching` | Peer Teaching |
| `portal` | Portal |
| `portfolio-builder` | Portfolio Builder |
| `profile` | Profile |
| `profile-documents-list` | Profile Documents List |
| `resume-upload` | Resume Upload |
| `salary-insights` | Salary Insights |
| `salary-negotiator` | Salary Negotiator |
| `saved-searches` | Saved Searches |
| `settings` | Settings |
| `skill-gap` | Skill Gap |
| `skill-tree` | Skill Tree |
| `skill-verifications` | Skill Verifications |
| `skill-verifications-tab` | Skill Verifications Tab |
| `smart-document-upload` | Smart Document Upload |
| `study-planner` | Study Planner |
| `tests` | Tests |
| `trust-score-breakdown` | Trust Score Breakdown |
| `verification-proof-card` | Verification Proof Card |
| `verify-credential-dialog` | Verify Credential Dialog |
| `video-profile` | Video Profile |

---

## 3. RECRUITER DASHBOARD (86 pages)

Route base: `/dashboard/recruiter/`

| Route | Page |
|-------|------|
| `ai-questions` | Ai Questions |
| `ai-search` | Ai Search |
| `ai-writer` | Ai Writer |
| `analytics` | Analytics |
| `approval-workflows` | Approval Workflows |
| `audit-trail` | Audit Trail |
| `automation-enhanced-tabs` | Automation Enhanced Tabs |
| `bbbee` | Bbbee |
| `background-checks` | Background Checks |
| `billing` | Billing |
| `blind-hiring` | Blind Hiring |
| `brand-editor` | Brand Editor |
| `call-notes` | Call Notes |
| `candidate-sourcing` | Candidate Sourcing |
| `candidate-summary` | Candidate Summary |
| `candidates` | Candidates |
| `career-site-builder` | Career Site Builder |
| `chatbot` | Chatbot |
| `client-pipeline` | Client Pipeline |
| `clients` | Clients |
| `comparison` | Comparison |
| `comparison-detail` | Comparison Detail |
| `compliance` | Compliance |
| `culture-fit` | Culture Fit |
| `dashboard` | Dashboard |
| `disagreement-analysis` | Disagreement Analysis |
| `diversity-analytics` | Diversity Analytics |
| `ee` | Ee |
| `email-templates` | Email Templates |
| `engagement-scoring` | Engagement Scoring |
| `feedback` | Feedback |
| `hiring-manager-portal` | Hiring Manager Portal |
| `inbox` | Inbox |
| `interview-kits` | Interview Kits |
| `job-board-integrations` | Job Board Integrations |
| `jobs` | Jobs |
| `kpi-dashboard` | Kpi Dashboard |
| `linked-in-leads` | Linked In Leads |
| `location-intelligence` | Location Intelligence |
| `offer-analytics` | Offer Analytics |
| `offer-approvals` | Offer Approvals |
| `offer-benchmarking` | Offer Benchmarking |
| `offer-comparison` | Offer Comparison |
| `offer-compliance` | Offer Compliance |
| `offer-letters` | Offer Letters |
| `offer-negotiation` | Offer Negotiation |
| `offer-predictor` | Offer Predictor |
| `offer-templates` | Offer Templates |
| `offer-timeline` | Offer Timeline |
| `offers` | Offers |
| `onboarding` | Onboarding |
| `pipeline` | Pipeline |
| `placements` | Placements |
| `predictive-analytics` | Predictive Analytics |
| `predictive-hiring` | Predictive Hiring |
| `profile` | Profile |
| `rapid-workflow` | Rapid Workflow |
| `re-engagement` | Re Engagement |
| `recruitment-marketing` | Recruitment Marketing |
| `reference-checks` | Reference Checks |
| `referrals` | Referrals |
| `requirement-analyzer` | Requirement Analyzer |
| `scheduling` | Scheduling |
| `scorecards` | Scorecards |
| `screening` | Screening |
| `screening-chatbot` | Screening Chatbot |
| `self-scheduling` | Self Scheduling |
| `sequences` | Sequences |
| `settings` | Settings |
| `submissions` | Submissions |
| `talent-crm` | Talent Crm |
| `talent-pool` | Talent Pool |
| `talent-rediscovery` | Talent Rediscovery |
| `team-dna` | Team Dna |
| `test-builder` | Test Builder |
| `test-detail` | Test Detail |
| `test-library` | Test Library |
| `test-templates` | Test Templates |
| `tests` | Tests |
| `unified-inbox` | Unified Inbox |
| `video-analysis` | Video Analysis |
| `video-interviews` | Video Interviews |
| `wa-campaigns` | Wa Campaigns |
| `whats-app-apply` | Whats App Apply |
| `whats-app-bot-dashboard` | Whats App Bot Dashboard |
| `workflow-automation` | Workflow Automation |

---

## 4. BUSINESS DASHBOARD (15 pages)

Route base: `/dashboard/business/`

| Route | Page |
|-------|------|
| `applications` | Applications |
| `contract-workers` | Contract Workers |
| `custom-reports` | Custom Reports |
| `dashboard` | Dashboard |
| `hris-integration` | Hris Integration |
| `home` | Home |
| `internal-job-board` | Internal Job Board |
| `jobs` | Jobs |
| `performance-management` | Performance Management |
| `sso-config` | Sso Config |
| `settings` | Settings |
| `succession-planning` | Succession Planning |
| `team` | Team |
| `vendor-management` | Vendor Management |
| `workforce-planning` | Workforce Planning |

---

## 5. ADMIN DASHBOARD (104 pages)

Route base: `/admin/`

| Route | Page |
|-------|------|
| `ab-testing-tab` | Ab Testing Tab |
| `ai-bias-auditing` | Ai Bias Auditing |
| `ai-dashboard-tab` | Ai Dashboard Tab |
| `ai-model-monitoring` | Ai Model Monitoring |
| `ai-monitoring` | Ai Monitoring |
| `anomaly-detection-tab` | Anomaly Detection Tab |
| `autopilot-tab` | Autopilot Tab |
| `bias-alert-center` | Bias Alert Center |
| `bias-benchmarking-hub` | Bias Benchmarking Hub |
| `bias-causal-debugger` | Bias Causal Debugger |
| `bias-fairness-copilot` | Bias Fairness Copilot |
| `bias-fairness-tab` | Bias Fairness Tab |
| `bias-human-impact` | Bias Human Impact |
| `bias-intersectional-lab` | Bias Intersectional Lab |
| `bias-live-pulse` | Bias Live Pulse |
| `bias-reporting-studio` | Bias Reporting Studio |
| `bias-simulation-engine` | Bias Simulation Engine |
| `billing` | Billing |
| `businesses` | Businesses |
| `candidates` | Candidates |
| `compliance-reports` | Compliance Reports |
| `cost-optimizer-tab` | Cost Optimizer Tab |
| `cvs` | Cvs |
| `dashboard` | Dashboard |
| `data-migration` | Data Migration |
| `feature-ai-packaging-lab` | Feature Ai Packaging Lab |
| `feature-ai-roadmap` | Feature Ai Roadmap |
| `feature-adoption-funnel` | Feature Adoption Funnel |
| `feature-cannibalization` | Feature Cannibalization |
| `feature-churn-predictor` | Feature Churn Predictor |
| `feature-command-center` | Feature Command Center |
| `feature-competitive-intel` | Feature Competitive Intel |
| `feature-cost-allocator` | Feature Cost Allocator |
| `feature-dynamic-pricing` | Feature Dynamic Pricing |
| `feature-entitlement-sandbox` | Feature Entitlement Sandbox |
| `feature-experimentation` | Feature Experimentation |
| `feature-genome-map` | Feature Genome Map |
| `feature-governance-board` | Feature Governance Board |
| `feature-health-score` | Feature Health Score |
| `feature-impact-simulator` | Feature Impact Simulator |
| `feature-journey-orchestrator` | Feature Journey Orchestrator |
| `feature-lifecycle` | Feature Lifecycle |
| `feature-revenue-attribution` | Feature Revenue Attribution |
| `feature-revenue-x-ray` | Feature Revenue X Ray |
| `feature-sentiment-analysis` | Feature Sentiment Analysis |
| `feature-smart-alerts` | Feature Smart Alerts |
| `feature-usage-pulse` | Feature Usage Pulse |
| `features` | Features |
| `features-setup` | Features Setup |
| `fraud` | Fraud |
| `governance-tab` | Governance Tab |
| `granular-rbac` | Granular Rbac |
| `individual-analytics-tab` | Individual Analytics Tab |
| `individual-bulk-actions` | Individual Bulk Actions |
| `individual-demographics-tab` | Individual Demographics Tab |
| `individual-detail-sheet` | Individual Detail Sheet |
| `individual-engagement-tab` | Individual Engagement Tab |
| `individual-pipeline-tab` | Individual Pipeline Tab |
| `individual-skills-tab` | Individual Skills Tab |
| `individuals` | Individuals |
| `job-aggregator` | Job Aggregator |
| `live-feed-tab` | Live Feed Tab |
| `model-performance-tab` | Model Performance Tab |
| `model-registry-tab` | Model Registry Tab |
| `multi-language` | Multi Language |
| `overview` | Overview |
| `plans` | Plans |
| `platform-health` | Platform Health |
| `predictive-tab` | Predictive Tab |
| `profile` | Profile |
| `recruiters` | Recruiters |
| `request-analytics-tab` | Request Analytics Tab |
| `roles` | Roles |
| `roles-access-reviews-tab` | Roles Access Reviews Tab |
| `roles-advisor-tab` | Roles Advisor Tab |
| `roles-analytics-tab` | Roles Analytics Tab |
| `roles-assignments-tab` | Roles Assignments Tab |
| `roles-audit-log-tab` | Roles Audit Log Tab |
| `roles-compliance-tab` | Roles Compliance Tab |
| `roles-definitions-tab` | Roles Definitions Tab |
| `roles-governance-tab` | Roles Governance Tab |
| `roles-intelligence-tab` | Roles Intelligence Tab |
| `roles-overview-tab` | Roles Overview Tab |
| `roles-permission-matrix-tab` | Roles Permission Matrix Tab |
| `roles-sandbox-tab` | Roles Sandbox Tab |
| `roles-simulator-tab` | Roles Simulator Tab |
| `roles-templates-tab` | Roles Templates Tab |
| `roles-timeline-tab` | Roles Timeline Tab |
| `roles-workflows-tab` | Roles Workflows Tab |
| `seo` | Seo |
| `usage-analytics` | Usage Analytics |
| `whats-app` | Whats App |
| `whats-app-analytics-deep-dive` | Whats App Analytics Deep Dive |
| `whats-app-bot-templates` | Whats App Bot Templates |
| `whats-app-candidate-matcher` | Whats App Candidate Matcher |
| `whats-app-chatbot-training` | Whats App Chatbot Training |
| `whats-app-contact-intelligence` | Whats App Contact Intelligence |
| `whats-app-conversation-dna` | Whats App Conversation Dna |
| `whats-app-conversation-replay` | Whats App Conversation Replay |
| `whats-app-escalation-war-room` | Whats App Escalation War Room |
| `whats-app-flow-builder` | Whats App Flow Builder |
| `whats-app-growth-engine` | Whats App Growth Engine |
| `whats-app-team-inbox` | Whats App Team Inbox |
| `white-label` | White Label |

---

## 6. ASSESSMENT PAGES (2 pages)

Route base: `/assess/`

| Route | Page |
|-------|------|
| `ai-interview-page` | Ai Interview Page |
| `assessment-take-page` | Assessment Take Page |

---

## 7. VERIFICATION PAGES (2 pages)

Route base: `/verify/`

| Route | Page |
|-------|------|
| `skill-portfolio-public` | Skill Portfolio Public |
| `verify-skill-page` | Verify Skill Page |

---

## 8. PUBLIC PROFILE PAGES (6 pages)

Route base: `/public/`

| Route | Page |
|-------|------|
| `brand-page` | Brand Page |
| `candidate-self-screening` | Candidate Self Screening |
| `credential-passport-public` | Credential Passport Public |
| `job-detail` | Job Detail |
| `pitch` | Pitch |
| `profile` | Profile |

---

## 9. SHOWCASE PAGES (2 pages)

Route base: `/showcase/`

| Route | Page |
|-------|------|
| `individual-showcase` | Individual Showcase |
| `recruitment-showcase` | Recruitment Showcase |

---

## 10. SEEDED FEATURES (157)

### Individual Features (42)

| Key | Name | Type |
|-----|------|------|
| `profile-management` | Profile Management | boolean |
| `cv-storage` | CV Creation & Editing | metered |
| `resume-upload` | Resume Upload | boolean |
| `ai-resume-parsing` | AI Resume Parsing | boolean |
| `ai-skill-inference` | AI Skill Inference | boolean |
| `soft-skills-detection` | Soft Skills Detection | boolean |
| `job-search-basic` | Basic Job Search | boolean |
| `job-search-advanced` | Advanced Job Search | boolean |
| `saved-searches` | Saved Searches | boolean |
| `favourites` | Favourites | boolean |
| `auto-job-matching` | AI Auto Match | boolean |
| `apply-to-jobs` | Apply to Jobs | boolean |
| `application-tracking` | Application Tracking | boolean |
| `application-portal` | Application Portal | boolean |
| `quick-apply` | Quick Apply | boolean |
| `ai-application-feedback` | AI Application Feedback | boolean |
| `priority-applications` | Priority Applications | boolean |
| `competency-tests` | Competency Tests | boolean |
| `ai-interview` | AI Interview | metered |
| `anti-cheat-proctoring` | Anti-Cheat Proctoring | boolean |
| `ai-coaching` | AI Career Coaching | metered |
| `ai-cv-review` | AI CV Review | metered |
| `skill-gap-analysis` | Skill Gap Analysis | boolean |
| `career-path-mapping` | Career Path Mapping | boolean |
| `salary-benchmarking` | Salary Insights | boolean |
| `cover-letter-generator` | AI Cover Letter Generator | metered |
| `company-research` | AI Company Research | boolean |
| `career-pulse-report` | Career Pulse Report | boolean |
| `basic-dashboard` | Basic Dashboard | boolean |
| `analytics-dashboard-individual` | Analytics Dashboard (Individual) | boolean |
| `billing-management` | Billing & Subscription Management | boolean |
| `interview-simulator` | Interview Simulator | boolean |
| `job-linked-learning` | Job-Linked Learning | boolean |
| `learning-analytics` | Learning Analytics | boolean |
| `learning-challenges` | Learning Challenges | boolean |
| `learning-hub` | Learning Hub | boolean |
| `learning-paths` | Learning Paths | boolean |
| `micro-learning` | Micro Learning | boolean |
| `portfolio-builder` | Portfolio Builder | boolean |
| `salary-negotiation-coaching` | Salary Negotiation Coaching | boolean |
| `skill-tree` | Skill Tree | boolean |
| `study-planner` | Study Planner | boolean |

### Recruiter Features (86)

| Key | Name | Type |
|-----|------|------|
| `job-posts` | Job Postings | metered |
| `job-board-export` | CSV/Pnet/CJ/Adzuna Export | boolean |
| `whatsapp-job-distribution` | WhatsApp Job Distribution | boolean |
| `ai-job-descriptions` | AI JD Generator | boolean |
| `bias-detection` | Bias Detection & Inclusivity Scoring | boolean |
| `candidate-search-basic` | Basic Candidate Search | boolean |
| `candidate-search-advanced` | Advanced Candidate Search | boolean |
| `candidate-database-full` | Full Candidate Database Access | boolean |
| `pipeline-management` | Pipeline View | boolean |
| `candidate-management` | Candidate Management | boolean |
| `candidate-comparisons` | Side-by-Side Comparison | boolean |
| `talent-pools` | Talent Pools | boolean |
| `ai-talent-pool-clustering` | AI Talent Pool Clustering | boolean |
| `bulk-import` | CSV Bulk Import | boolean |
| `bulk-export` | Bulk Export | boolean |
| `screening-roles` | Screening Roles | boolean |
| `ai-screening` | AI Candidate Screening | metered |
| `screening-chatbot` | AI Screening Chatbot | boolean |
| `ai-candidate-matching` | AI Candidate-Job Matching | metered |
| `ai-resume-jd-scoring` | AI Resume vs JD Scoring | boolean |
| `ai-hybrid-search` | AI Hybrid Search | boolean |
| `predictive-hiring` | Predictive Hiring | boolean |
| `culture-fit-analysis` | Culture Fit Assessment | boolean |
| `location-intelligence` | Location Intelligence | boolean |
| `offer-prediction` | Offer Acceptance Predictor | boolean |
| `team-dna-profiler` | Team DNA Profiler | boolean |
| `interview-disagreement-analyzer` | Interview Disagreement Analyzer | boolean |
| `engagement-scoring` | Candidate Engagement Scorer | boolean |
| `diversity-analytics` | Diversity Pipeline Analytics | boolean |
| `requirement-restriction-analyzer` | Requirement Restriction Analyzer | boolean |
| `competency-testing` | Test Builder | metered |
| `ai-question-generator` | AI Question Generator | boolean |
| `test-templates-library` | Test Templates Library | boolean |
| `ai-test-recommender` | AI Test Recommender | boolean |
| `assessment-invitations` | Assessment Invitations | boolean |
| `ai-essay-scoring` | AI Essay Scoring | boolean |
| `test-analytics` | Test Analytics | boolean |
| `anti-cheat-monitoring` | Anti-Cheat Monitoring | boolean |
| `ai-interview-questions` | AI Interview Questions | boolean |
| `interview-scheduling` | Interview Scheduling | boolean |
| `self-scheduling` | Self-Scheduling | boolean |
| `ai-conversational-interview` | AI Conversational Interview | boolean |
| `video-analysis` | AI Video Interview Analysis | boolean |
| `interview-scorecards` | Scorecards | boolean |
| `reference-request-tracking` | Reference Request Tracking | boolean |
| `public-reference-form` | Public Reference Form | boolean |
| `ai-reference-questions` | AI Reference Questions | boolean |
| `reference-check-summary` | Reference Check Summary | boolean |
| `ai-email-composer` | AI Email Composer | boolean |
| `email-templates` | Email Templates | boolean |
| `email-sequences` | Email Sequences | boolean |
| `re-engagement` | Candidate Re-Engagement | boolean |
| `whatsapp-first-apply` | WhatsApp-First Apply | boolean |
| `employer-branding` | Employer Brand Profile | boolean |
| `ai-brand-page-generator` | AI Brand Page Generator | boolean |
| `public-company-page` | Public Company Page | boolean |
| `brand-content-export` | Brand Content Export | boolean |
| `ai-agency-website-import` | AI Agency Website Import | boolean |
| `offer-management` | Offer Management | boolean |
| `referrals-management` | Referral Program | boolean |
| `compliance-bbbee` | B-BBEE Compliance Reporting | boolean |
| `compliance-ee` | Employment Equity Reporting | boolean |
| `compliance-popia` | POPIA Compliance | boolean |
| `candidate-nps` | Candidate NPS | boolean |
| `basic-analytics` | Basic Analytics | boolean |
| `recruiter-analytics` | Recruiter Analytics | boolean |
| `client-management` | Client Management | boolean |
| `billing-usage-limits` | Billing & Usage Limits | boolean |
| `background-checks` | Background Checks | boolean |
| `blind-hiring` | Blind Hiring | boolean |
| `candidate-sourcing` | Candidate Sourcing | boolean |
| `career-site-builder` | Career Site Builder | boolean |
| `fraud-detection` | Fraud Detection | boolean |
| `hiring-manager-portal` | Hiring Manager Portal | boolean |
| `job-board-integrations` | Job Board Integrations | boolean |
| `linkedin-sync` | LinkedIn Sync | boolean |
| `offer-negotiation` | Offer Negotiation | boolean |
| `placement-analytics` | Placement Analytics | boolean |
| `predictive-analytics` | Predictive Analytics | boolean |
| `rapid-workflow` | Rapid Workflow | boolean |
| `recruiter-dna` | Recruiter DNA | boolean |
| `talent-rediscovery` | Talent Rediscovery | boolean |
| `video-interviews` | Video Interviews | boolean |
| `workflow-automation` | Workflow Automation | boolean |
| `reference-checks` | Reference Checks | boolean |
| `scheduling-links` | Scheduling Links | boolean |

### Corporate Features (17)

| Key | Name | Type |
|-----|------|------|
| `applicant-tracking-basic` | Basic Applicant Tracking | boolean |
| `applicant-tracking-full` | Full Applicant Tracking | boolean |
| `team-members` | Team Members | metered |
| `role-based-access-control` | Role-Based Access Control | boolean |
| `analytics-dashboard` | Analytics Dashboard | boolean |
| `analytics-advanced` | Advanced Analytics | boolean |
| `company-branding` | Company Branding | boolean |
| `white-label-branding` | White-Label Branding | boolean |
| `contract-workers` | Contract Workers | boolean |
| `custom-reports` | Custom Reports | boolean |
| `hris-integration` | HRIS Integration | boolean |
| `internal-job-board` | Internal Job Board | boolean |
| `performance-management` | Performance Management | boolean |
| `sso-configuration` | SSO Configuration | boolean |
| `succession-planning` | Succession Planning | boolean |
| `vendor-management` | Vendor Management | boolean |
| `workforce-planning` | Workforce Planning | boolean |

### Cross-Product Features (12)

| Key | Name | Type |
|-----|------|------|
| `email-notifications` | Email Notifications | boolean |
| `sms-notifications` | SMS Notifications | boolean |
| `all-notifications` | All Notification Channels | boolean |
| `email-support` | Email Support | boolean |
| `priority-support` | Priority Support | boolean |
| `dedicated-support` | Dedicated Support | boolean |
| `onboarding-templates` | Onboarding Checklists | boolean |
| `referral-tracking` | Referral Tracking | boolean |
| `team-collaboration` | Team Collaboration | boolean |
| `api-access` | API Access | boolean |
| `whatsapp-campaigns` | WhatsApp Campaigns | boolean |
| `auto-pilot-rules` | Auto-Pilot Rules | boolean |

---

## 11. SA-SPECIFIC FEATURES

| Feature | Description |
|---------|-------------|
| B-BBEE Compliance | B-BBEE scoring, tracking, and reporting |
| Employment Equity (EE) | EE plan management and reporting |
| POPIA Compliance | Consent management, data retention, deletion requests |
| SETA Learnerships | Match skills to 21 South African SETA programs |
| ZAR Pricing | All plans priced in South African Rand |
| SA Location Intelligence | Location-based analytics for SA regions |

---

## 12. RECENT ENHANCEMENTS (last 30 days)

- add LinkedIn features block with detailed descriptions and toggle functionality; update RecruiterJobs to include import template button
- add sub-industries served functionality to recruiter profiles with database migration and validation schema updates
- enhance LinkedIn integration with share buttons, verified badges, and profile optimizations across multiple components
- implement CategorizedSkillsDisplay component and integrate it across multiple pages for improved skill visualization
- implement agency website import feature to auto-fill recruiter profile data
- update profile overwrite confirmation dialog with clearer warning and action labels feat: clear existing profile data before importing new CV data in the backend feat: add recruiter presentation file to the project
- update text styling in SearchableMultiSelect and SearchableSelect for improved visibility
- add role-based access control for tests and enhance readiness score calculation in storage
- enhance JobFilterBar styles for improved UI consistency and accessibility feat: update storage trends calculation for better test compatibility
- update JobFilterBar and JobSearchPanel styles for improved UI consistency and accessibility
- add exit and done messages to Bash commands for better debugging
- enhance JobTitleSelect with custom title input and update JobsLanding styles for improved UI consistency
- add endpoint for recording interview feedback and update consent retrieval logic
- implement subscription management with plan assignment and payment link functionality
- add comprehensive CRUD tests for POPIA compliance, saved searches, screening jobs, talent pools, and WhatsApp management
- add comprehensive tests for SEO Command Center API endpoints
- enhance memory management and improve database connection handling
- add safe request helpers for AI E2E tests
- add end-to-end tests for feature access control, CRUD lifecycle, and UI smoke tests
- implement dedicated PostgreSQL session pool to prevent blocking on authenticated routes
- update available models retrieval to query ai_model_registry and fallback to hardcoded list
- update fraud management API and frontend to use PUT and DELETE methods for alerts and watchlist entries
- enhance error handling for malformed requests and improve user CV statistics query
- update authentication checks to use req.user for consistency across routes
- streamline AI monitoring dashboard by removing unused feature config queries
- add auto-detection for missing header component in WhatsApp template messages
- implement team member invitation functionality with email and role selection
- update TemplatePicker to make header media optional and adjust label for URL input
- enhance error handling in CV operations, template picker, and individual settings with user-friendly toast notifications
- enhance IndividualCommunity components with defaultTab prop and update API query keys for user profile and applications
- enhance WhatsApp bot configuration with business hours, after hours message, and feature toggles
- enhance WhatsApp bot functionality with business hours and idle timeout features
- implement AlertDialog component with customizable header, footer, and actions
- integrate WhatsApp template service for dynamic messaging and error handling
- add WhatsApp template service with default templates and caching mechanism
- add e2e tests for stub detection across various endpoints and frontend cards
- add comprehensive API stub tests for rapid workflow, recruiter endpoints, and WhatsApp integration
- add additional columns to whatsapp_bot_config table for enhanced configuration options
- add master bot toggle to AdminWhatsApp for enabling/disabling automatic responses
- add WhatsApp bot on/off toggle to Command Center tab
- add bot_enabled configuration to WhatsApp bot settings and implement global bot enable/disable functionality
- enhance CV versioning with best-effort snapshot handling and error logging
- enhance SEO with dynamic OG images and improve page metadata
- add CV style presets functionality and ensure resume_url column in candidates table
- add CV style columns and cv_style_presets table to database
- add CV style presets functionality
- enhance job search filters with additional criteria
- enhance PNet job normalization with additional fields and debug logging for missing descriptions
- add pull-to-refresh functionality for mobile in IndividualAllJobs component
- enhance job handling with external source support and improved filtering logic

---

## 13. DATABASE TABLES (755 tables across 20+ domains)

### Domains

- **Auth & Users** (7): users, sessions, magicLinkTokens, refreshTokens, connectedAccounts, oauthStateTokens, ssoConfigs
- **Organizations** (6): organizations, memberships, teamMembers, interviewSettings, complianceSettings, organizationIntegrations
- **Jobs** (6): jobTemplates, salaryBands, jobs, jobApplications, jobFavorites, jobEmbeddings
- **Other** (492): jdDrafts, approvedVendors, subscribers, clientNotes, clientDocuments, clientTags, clientMeetings, clientRevenue, clientSatisfaction, candidateProfiles, recruiterProfiles, recruiterPitches, individualPreferences, individualNotificationSettings, individualSettings, applicationNotes, applicationReminders, applicationWithdrawals, cvStylePresets, cvVersions, skills, roles, templateFavorites, templateRatings, templateUsageLogs, customTemplates, featureChangelog, featureAlertRules, featureAlerts, entitlementDrafts, entitlementSnapshots, billingPreferences, userPaymentMethods, userInvoices, billingCredits, creditTransactions, billingReferrals, jobSearchExpenses, fraudRules, fraudWatchlist, fraudScanConfig, fraudAuditLog, autoApplyLog, apiIntegrations, offers, eePlans, eeBarriers, eeAffirmativeMeasures, eeConsultations, eeIncomeDifferentials, referralCampaigns, onboardingTemplates, onboardingInstances, onboardingBuddies, onboardingDocuments, onboardingCheckins, onboardingResources, messageReactions, messageTemplates, skillEndorsements, candidateTemperatures, videoMockInterviews, videoRequests, videoApplicationIntros, videoBbbeeVerifications, skillProjects, skillChallenges, skillChallengeAttempts, skillVideoProofs, skillInterviewPrep, salaryNegotiations, candidateSourcingProfiles, recruitmentCampaigns, savedQuestionSets, chatbotConversations, offerLetters, unifiedInboxMessages, auditTrail, jobBoardIntegrations, jobBoardPostings, hiringManagerReviews, predictiveAnalytics, blindHiringConfigs, blindHiringAuditLog, blindHiringReviews, blindHiringPresets, talentRediscoveryMatches, talentRediscoveryEngagements, rediscoveryCampaigns, rediscoveryCampaignSteps, rediscoveryCandidateNotes, rediscoveryCandidateRatings, rediscoveryWatchlist, rediscoverySegments, rediscoverySegmentMembers, rediscoveryOutreachTemplates, rediscoveryAnalyticsEvents, rediscoveryIntelligence, rediscoverySignals, rediscoveryLossReasons, rediscoveryPoolHealth, workflowAutomations, aiAnomalyAlerts, aiGovernancePolicies, aiUsageLogs, aiIncidents, aiExplainabilityLogs, aiAutopilotRules, aiAutopilotExecutions, aiAbExperiments, aiCostBudgets, aiCostRecommendations, aiActivityFeed, migrationTemplates, migrationFieldMappings, migrationSchedules, migrationLogs, migrationValidations, migrationRollbacks, migrationConnectors, migrationPipelines, migrationPipelineRuns, migrationComplianceRules, migrationComplianceAudit, migrationDataProfiles, migrationExports, migrationApprovals, jobIntakeScorecard, invoiceMilestones, recruiterKpis, kpiTargets, kpiActivityLog, recruiterAchievements, callObjections, callPlaybooks, leadNurtureSequences, leadNurtureEnrollments, pipelineAutomationRules, pipelineVelocityMetrics, collaborativeHiringVotes, pipelineOutreachSequences, whatsappConversations, whatsappMessages, whatsappMediaUploads, whatsappAssessmentSessions, whatsappAnalytics, whatsappReengagementCampaigns, surveyExperienceGoals, whatsappBotConfig, whatsappBotTemplates, whatsappApplyLinks, whatsappApplyTemplates, whatsappApplyApplications, whatsappApplyAutoResponders, whatsappApplyAnalytics, whatsappApplyAbTests, whatsappApplyCampaigns, whatsappScreeningFlows, whatsappScreeningSessions, whatsappVoiceNotes, whatsappReferralCodes, whatsappReferralChains, whatsappStatusCards, whatsappJobMatchCards, userExperiences, userEducation, credentialPortfolioSettings, credentialVerifications, userDocuments, credentialMatchCache, sourcingCampaigns, sourcingCampaignCandidates, sourcingAnalyticsSnapshots, aiSourcingTalentMaps, aiSourcingSequences, aiSourcingSequenceSteps, aiSourcingSequenceEnrollments, aiSourcingPassiveSignals, aiSourcingDiversityReports, aiSourcingCompetitorIntel, aiSourcingResumeUploads, aiSourcingPipelineForecasts, aiSourcingCopilotChats, aiSourcingCandidateDna, aiSourcingMarketPulse, aiSourcingCraftedMessages, aiSourcingPlaybooks, aiSourcingNetworkNodes, offerNegotiations, negotiationStrategies, negotiationCommunications, negotiationDeadlines, negotiationApprovals, negotiationBenchmarks, negotiationCompPackages, offerTemplates, offerTemplateVersions, offerTemplateClauses, offerPredictionsLog, managerCandidateNotes, managerShortlists, managerPreferences, roleDefinitions, roleAssignments, rbacAuditLog, accessReviewCampaigns, accessReviewItems, roleChangeRequests, roleAnalyticsEvents, pricingScenarios, planEvents, campaigns, campaignRedemptions, planAuditLog, planAbTests, competitorBenchmarks, planRecommendations, planHealthMetrics, revenueSnapshots, applicationMomentumSnapshots, interviewRehearsals, wellbeingCheckins, applicationCommunications, applicationStreaks, applicationFollowUps, rejectionAnalyses, offerComparisons, offerActivityLog, offerComplianceChecks, offerBenchmarks, offerApprovalChains, companyResponseStats, coverLetters, careerPulseSnapshots, skillBattleRecords, applicationNetworkingActions, scheduledMessages, fraudReviewNotes, fraudInvestigations, fraudInvestigationNotes, fraudUserRiskProfiles, fraudAlerts, fraudNetworkLinks, fraudGeoAnalysis, fraudVelocityRules, billingAlerts, coupons, featureCategories, featureDependencies, featureVersions, featureFlags, featureRequests, featureExperiments, featureGovernanceRequests, featureGovernancePolicies, featureGovernanceAuditLog, featurePricingSimulations, aiSearchHistory, cultureFitAssessments, cultureFitTemplates, cultureFitTeamProfiles, cultureFitInterviewerScores, cultureFitDnaProfiles, diversityGoals, diversitySnapshots, diversityReports, jobBoardBudgets, jobBoardAnalyticsSnapshots, jobBoardPostingTemplates, jobBoardScheduledPosts, jobBoardAutoRules, jobBoardCandidateSources, marketingContent, marketingAudiences, marketingSocialPosts, marketingAbTests, marketingEvents, marketingAnalyticsSnapshots, marketingNurtureSequences, marketingCompetitorIntel, marketingBrandHealth, marketingAutopilotRecs, marketingTalentHeatmap, marketingEmployeeAdvocates, marketingAdvocacyContent, marketingContentPredictions, jobBoardAbTests, jobBoardAbVariants, jobBoardPostingScores, jobBoardOptimalTimes, jobBoardCompetitorIntel, jobBoardHealthChecks, jobBoardAutoRefreshRules, jobBoardDuplicateCandidates, waCampaignTemplates, metaWhatsappTemplates, waCampaignAudiences, waDripSequences, waDripEnrollments, waCampaignContacts, waContactLists, waContactListMembers, waCampaignSendLogs, automationExecutionLogs, automationTemplates, automationSchedules, automationVersions, automationChains, automationChainSteps, automationChainExecutions, automationInsights, automationWebhooks, automationWebhookLogs, automationAbTests, whatsappQuickReplies, whatsappAutoResponders, whatsappBroadcasts, whatsappBotTraining, whatsappConversationTags, whatsappConversationNotes, whatsappScheduledMessages, whatsappBotFlows, auditWatchRules, auditAnomalies, whatsappCsatSurveys, whatsappAbTests, whatsappDeepLinks, whatsappComplianceLogs, whatsappSimulatorSessions, interviewTemplates, interviewReminders, interviewerAvailability, interviewRounds, interviewScorecards, schedulingTemplates, schedulingReminders, schedulingBulkOps, recruitmentSequences, sequenceSteps, sequenceEnrollments, sequenceEvents, sequenceTemplateLibrary, unifiedInboxThreads, unifiedInboxLabels, unifiedInboxThreadLabels, unifiedInboxNotes, unifiedInboxCannedResponses, unifiedInboxScheduledMessages, unifiedInboxSignatures, unifiedInboxContacts, chatbotKnowledgeBase, chatbotWidgetConfig, chatbotProactiveTriggers, chatbotCannedResponses, chatbotFlows, chatbotVisitors, chatbotHandoffRules, chatbotAnalytics, chatbotAiTraining, chatbotSatisfaction, chatbotConversationTags, chatbotConversationNotes, chatbotLiveSessions, chatbotSimulatorSessions, chatbotAbTests, chatbotLeadScoringRules, chatbotLeadScores, chatbotEmbedConfigs, chatbotIntelligenceReports, unifiedInboxSavedViews, unifiedInboxSlaConfigs, unifiedInboxFollowUpRules, unifiedInboxTranslations, unifiedInboxIntelligence, organizationBranding, recruiterNotificationSettings, organizationApiKeys, organizationWebhooks, organizationEmailSignatures, managerTeamGoals, managerApprovalWorkflows, managerApprovalSteps, managerWorkforcePlans, managerDecisionRooms, managerDecisionRoomParticipants, managerSlaConfigs, managerDelegationLogs, managerTalentBenchmarks, managerTeamActivities, blindHiringBiasScans, blindHiringCalibrationSessions, blindHiringCalibrationReviewers, blindHiringComplianceAssessments, blindHiringAdverseImpactAnalyses, blindHiringReviewerMetrics, blindHiringDataRetentionPolicies, blindHiringAbExperiments, blindHiringSkillsChallenges, blindHiringChallengeSubmissions, blindHiringFairnessCertificates, blindHiringBenchmarks, aiAutopilotConfig, teamPerformanceConfig, managerCandidateComparisons, managerOfferScenarios, managerDeiSnapshots, managerPredictiveScores, managerCoachingInsights, managerPipelineRisks, managerInterviewCalibrations, adminCvFlags, adminCvNotes, adminCvTags, adminCvTagAssignments, adminCvPools, platformLanguages, translationNamespaces, translationKeys, translationValues, translationBatchJobs, languageUsageEvents, translationQualityIssues, languageSettings, translationGlossary, translationContributors, translationAssignments, languageStyleGuides, translationImportExports, translationComplianceAudits, aiTranslationSessions, adminCvPoolMembers, aiSafetyRules, aiPromptTemplates, aiAuditEvents, aiAccessPolicies, fraudForensicsCases, fraudFinancialImpact, fraudIncidentTransactions, fraudPlaybooks, fraudPlaybookExecutions, fraudThreatIntel, fraudKnownBadActors, fraudPredictiveModels, fraudAnomalyEvents, biasAuditSchedules, biasRemediationActions, biasAlertRules, biasAlertEvents, biasSimulations, biasBenchmarks, biasReports, biasIntersectionalRecords, biasFairnessPulse, biasHumanImpactRecords, biasCopilotInsights, biasCausalAnalysis, paymentGateways, gatewayRoutingRules, gatewayHealthLogs, billingDisputes, disputeEvidence, revenueRecognitionRules, revenueRecognitionEntries, revenueRecognitionSchedule, pricingExperiments, pricingVariants, experimentEvents, billingAutomationRules, automationExecutions, aiSmartRouterConfigs, aiQualityFeedback, aiAbTests, analyticsGoals, analyticsAnnotations, analyticsSavedSegments, fraudHoneypots, fraudHoneypotInteractions, fraudIdentityClusters, fraudBehavioralProfiles, fraudSimulations, fraudPatternLibrary, fraudComplianceReports, fraudEvidenceBoards, revenueAnomalies, customerRevenueDna, revenueLeakageFindings, billingScenarios, blogPosts, jobAggregatorConfigs, jobAggregatorSyncLogs, chatbotIntents, chatbotFaqs
- **Revenue Engine** (9): corporateClients, corporateClientContacts, corporateClientEngagements, clientPipeline, clientPipelineActivities, clientPipelineStageHistory, clientPipelineTasks, submissions, placements
- **Candidates** (9): cvs, resumes, candidates, experiences, education, certifications, projects, awards, candidateSkills
- **Pipeline & Tracking** (18): screeningJobs, screeningCandidates, screeningEvaluations, screeningNotes, screeningActivityLog, screeningShareLinks, screenings, holds, pipelineStages, applicationActivities, scorecards, scorecardResponses, screeningBotTemplates, screeningBotSessions, screeningBotQuestionBanks, screeningBotCampaigns, screeningBotPlaybooks, screeningBotSelfServiceLinks
- **Assessments** (17): competencyTests, testSections, testItems, testAttempts, testResponses, assessmentInvitations, testTemplates, testLibraryTemplates, testLibraryQuestions, testLibraryUsage, assessmentBenchmarks, candidateCredentials, testLibraryRatings, testLibraryFavorites, assessmentBundles, assessmentBundleItems, testLibraryViews
- **AI & Interviews** (8): aiInterviewSessions, interviewPools, poolMembers, interviews, aiJobs, aiFeatureConfigs, aiFeaturePresets, aiFeatureRollouts
- **Billing** (11): plans, features, featureEntitlements, subscriptions, usage, paymentEvents, fraudDetections, usageAnalytics, usageMeterDefinitions, usageMeterEvents, usageAlerts
- **Search & Match** (3): autoSearchPreferences, autoSearchResults, savedSearches
- **Communication** (9): emailTemplates, emailSequences, emailSequenceSteps, emailSequenceExecutions, notifications, conversations, messages, conversationLabels, conversationNotes
- **Compliance** (29): bbbeeScores, eeReports, popiaConsents, dataRetentionPolicies, dataDeletionRequests, popiaBreachIncidents, popiaImpactAssessments, popiaDataMapping, popiaTrainingRecords, popiaComplaints, popiaConsentTemplates, popiaDataProcessingAgreements, popiaInformationOfficers, popiaRegulatoryFilings, bbbeeCertificates, bbbeeScoreHistory, bbbeeImprovementPlans, bbbeeSupplierDevelopment, bbbeeSkillsPrograms, bbbeeOwnershipAnalysis, bbbeeComplianceAlerts, bbbeeSedProjects, bbbeePlacementImpacts, bbbeeComplianceDeadlines, bbbeeSectorBenchmarks, bbbeeClientPortfolio, bbbeeComplianceChecklist, bbbeeCommitteeMeetings, bbbeeDocumentVault
- **Scheduling** (3): schedulingLinks, interviewFeedback, schedulingLinkActivities
- **Talent Management** (12): candidateComparisons, talentPools, talentPoolMembers, talentCrmContacts, talentCrmActivities, talentCrmEngagementSignals, talentCrmIntelligence, talentCrmRevenueSnapshots, talentCrmMatchResults, talentCrmNurtureAutopilots, talentCrmNurtureTouchpoints, talentCrmConnections
- **Engagement** (29): referrals, reEngagementCampaigns, reEngagementAutomationRules, reEngagementTemplates, reEngagementSequences, reEngagementSequenceSteps, reEngagementActivityLog, communityPosts, communityComments, communityBookmarks, communityReactions, communityPostViews, communityPolls, communityPollVotes, communityReports, communityBadges, communityUserBadges, communityInterviewExperiences, communityChallenges, communityChallengeEntries, communityMentorProfiles, communityMentorRequests, candidateExperienceSurveys, learningResources, learningEnrollments, linkedinLeads, linkedinLeadJobMatches, linkedinLeadDuplicates, candidateExperienceConfig
- **Advanced Hiring** (40): referenceRequests, referenceResponses, interviewKits, videoInterviewTemplates, videoInterviews, videoInterviewEvaluations, videoInterviewNotes, videoInterviewRooms, videoInterviewClips, videoInterviewScorecards, videoInterviewScorecardResults, videoInterviewAutomations, videoInterviewBranding, videoInterviewShares, videoInterviewReactions, videoInterviewDebriefs, videoInterviewPrepPackets, videoInterviewQuestionAnalytics, backgroundChecks, backgroundCheckPackages, backgroundCheckNotes, backgroundCheckTimeline, backgroundCheckConsent, backgroundCheckSettings, backgroundCheckProviders, backgroundCheckDocuments, backgroundCheckDisputes, backgroundCheckAlerts, backgroundCheckScoring, backgroundCheckAdjudications, backgroundCheckCampaigns, backgroundCheckTrustProfiles, backgroundCheckRescreening, approvalWorkflows, approvalSteps, approvalPolicyRules, approvalWorkflowTemplates, approvalWorkflowComments, approvalDelegations, approvalAuditLog
- **Branding** (17): employerBrandProfiles, videoProfiles, videoProfileViews, videoProfileReviews, skillVerifications, skillVerificationRequests, careerSitePages, careerSiteSettings, careerSiteTestimonials, careerSiteAnalytics, careerSiteFeaturedJobs, careerSiteTalentCommunity, careerSiteEvents, careerSiteDepartments, careerSiteCareerPaths, careerSiteAwards, careerSiteFaqs
- **Enterprise** (24): hrisIntegrations, workforcePlans, internalJobBoard, performanceRecords, successionPlans, vendorManagement, customReports, contractWorkers, whiteLabelConfigs, whiteLabelThemes, whiteLabelEmailTemplates, whiteLabelDomains, whiteLabelAssets, whiteLabelPageLayouts, whiteLabelAuditLogs, whiteLabelAnalytics, whiteLabelPreviewLinks, whiteLabelBrandAudits, whiteLabelVariants, whiteLabelVariantAssignments, whiteLabelPolicies, whiteLabelChangeRequests, whiteLabelVersions, callNotes
- **Analytics** (6): aiModelMetrics, aiBiasAudits, aiModelRegistry, platformHealthMetrics, dataMigrations, complianceReports

---

## 14. REUSABLE COMPONENTS (496)

### UI Primitives (48)
accordion, ai-dashboard-brief, ai-notification-bell, ai-onboarding, ai-translate-button, alert, alert-dialog, animated-section, avatar, badge, button, card, checkbox, collapsible, color-palette-picker, command, confirm-dialog, data-table, decorative-svg, dialog, dropdown-menu, empty-state, font-picker, form, glass-card, input, label, page-header, popover, progress, radio-group, scroll-area, searchable-multi-select, searchable-select, section-divider, select, separator, sheet, skeleton, slider, stat-card, status-badge, switch, table, tabs, textarea, toaster, tooltip

### Feature Components (448)
ABTestingTab, ABTestingTab, AIInsightsTab, AIOutreachDraft, AIPoolBuilder, AIQuestionGenerator, AISkillRecommendations, AITestGenerator, AccessControlTab, AchievementBadges, AchievementBadges, AchievementsPanel, ActiveChecksTab, AdjudicationTab, AdminCvIntelligence, AgencyWebsiteImportDialog, AlertWallTab, AllChecksTab, Analytics, AnimatedCounter, AnomalyDetectionIntelligence, AnomalyRadar, AntiCheatIntelligence, AntiCheatPanel, AssessmentPipelineBuilder, AuditTrailTab, AutoDetectedSkillsDialog, AutoPilotRulesEngine, BentoGrid, BillingAlertsCard, BillingAutomation, BillingCopilot, BillingExportButton, Breadcrumb, BulkActionsBar, BulkFeatureToolbar, BulkImportJobDialog, BulkOperationsCenter, BulkVerificationDialog, CSATTab, CampaignsTab, CandidateComparison, CandidateComparisonMatrix, CandidateMatchPreview, CandidatePerformanceDNA, CandidateProfileTab, CandidateScoringMatrix, CareerStoryArchitect, CategorizedSkillsDisplay, ChallengeBadge, ChallengeLeaderboard, ChaosResilienceSimulator, ChatComposer, CheckDetailPanel, ChurnPrevention, CollaborativeHiringScoreboard, CommunityPulse, CommunityStatsBar, CompanyDescriptionAIDialog, ComparisonAIInsightsTab, ComparisonAssessmentTab, ComparisonBiasDetectorTab, ComparisonCandidateDNATab, ComparisonCollaborativeVotingTab, ComparisonCostAnalysisTab, ComparisonDecisionAuditTab, ComparisonEducationTab, ComparisonExperienceTab, ComparisonExportView, ComparisonInterviewPrepTab, ComparisonJobSelector, ComparisonNotesPanel, ComparisonOutcomePredictorTab, ComparisonOverviewTab, ComparisonRadarChart, ComparisonRankingTab, ComparisonRedFlagTab, ComparisonScenarioTab, ComparisonScoreBar, ComparisonSideBySideTab, ComparisonSkillBridgeTab, ComparisonSkillsTab, ComparisonSlider, ComparisonTab, ComparisonTeamFitTab, ComparisonTimelineTab, ComparisonWeightConfig, ComplianceFairnessScanner, ComplianceTab, ComplianceTab, ConflictResolutionCenter, ConflictResolver, ConversationViewer, CostEfficiencyIntelligence, CostIntelligenceTab, CouponManagement, CoverLetterGenerator, CoverageHeatmap, CreateCheckWizard, CredentialBadge, CredentialStatsCard, CredentialTimeline, CreditEconomy, CrossLanguagePropagation, CrossPoolIntelligence, CulturalAdaptation, CustomerRevenueDNA, CvActionBar, CvAiTools, CvAnalytics, CvBatchTailor, CvCard, CvCompare, CvDetailView, CvInterviewPrep, CvJobRadar, CvSACompliance, CvSearchFilter, CvStatsBar, CvTemplateSelector, CvVersionHistory, CvWizard, DashboardLayout, DataLineageGraph, DependencyMapTab, DifficultyFlowVisualizer, DisputeCenter, DisputesTab, DocumentsTab, DocxImportDialog, DragDropKanban, DuplicateDetection, ElevatorPitchBuilder, EmailEditDialog, EmojiReactionPicker, EngagementAutopilot, ErrorBoundary, EssayGradingStudio, EvidenceTag, FAQAccordion, FeatureAnalyticsCharts, FeatureCategoryManager, FeatureComparisonMatrix, FeatureDependencyGraph, FeatureFlagManager, FeatureImpactDialog, FeatureImportExport, FeatureRequestTracker, FeatureShowcase, FillRoleWizard, Footer, FraudAnalytics, FraudAnalyticsCharts, FraudAuditCompliance, FraudBehavioralProfiler, FraudBulkActions, FraudCaseDialog, FraudCommandCenter, FraudComplianceReporter, FraudDetailDialog, FraudDismissDialog, FraudEvidenceBoard, FraudExportButton, FraudFinancialImpact, FraudForensicsLab, FraudHoneypotTraps, FraudIdentityResolution, FraudIntegrityReports, FraudIntelligence, FraudInvestigations, FraudLiveMonitor, FraudNetworkGraph, FraudPatternLibrary, FraudPlaybooksPanel, FraudPredictiveAI, FraudRules, FraudRulesEngine, FraudScanner, FraudScannerPanel, FraudSettingsPanel, FraudSimulationSandbox, FraudThreatIntelPanel, FraudTrendsCard, FraudWarRoom, FraudWatchlistPanel, FreshnessIndicator, FreshnessTimeline, FunnelSparkline, GatewayHealthCard, GeoRiskTab, GettingStartedWizard, GitHubConnectCard, GlowCard, GoogleAddressSearch, Header, ImportJobDescriptionDialog, ImportJobDialog, InteractiveJourney, InterviewAnxietyToolkit, InterviewPrepCard, InterviewPrepDialog, InterviewReadinessDashboard, InterviewVault, InvoiceManager, JDAIReview, JDCandidatePersonas, JDCompareView, JDCompetitorAnalysis, JDCustomSections, JDExportMenu, JDHistoryPanel, JDImportEnhancer, JDInputForm, JDInterviewKit, JDJobBoardPreview, JDMultiLingual, JDMultiVariation, JDObjectionPredictor, JDPerformancePredictor, JDPreview, JDQuickActions, JDReadabilityHeatmap, JDScorePanel, JDSmartSkillsInput, JDTemplateLibrary, JDToneDNA, JobCard, JobDescriptionAIDialog, JobDescriptionDecoder, JobFilters, JobForm, JobHealthMonitor, JobPerformanceFunnel, JobQualityScore, JobSearchStrategyAdvisor, JobTemplatesLibrary, JobTitleSelect, KanbanBoard, LanguageROI, LeaderboardPanel, LearningLeaderboard, LearningStreakTracker, LinkGeneratorTab, LinkedInConnect, LinkedInIcon, LinkedInOptimizer, LinkedInShareButton, LinkedInVerifiedBadge, LiveOpsTab, LivePreviewSimulator, LivePulseCommandCenter, LogoCloud, MarketPositionRadar, MentorConnect, MessageBubble, MessageSearch, MigrationCommandCenter, MigrationCopilot, MigrationROI, MigrationSandbox, MockInterviewSimulator, MultiChannelBroadcast, NegotiationRolePlay, NetworkingMessageCrafter, NotificationBell, OfferLetterInnovations, OnboardingAICopilot, OnboardingAnalyticsDashboard, OnboardingAutomationRules, OnboardingBuddySystem, OnboardingCheckInScheduler, OnboardingChecklist, OnboardingCulturalIntegration, OnboardingDocumentTracker, OnboardingKanbanBoard, OnboardingPreboarding, OnboardingRACIMatrix, OnboardingROIBenchmarks, OnboardingResourceHub, OnboardingSatisfactionSurvey, OnboardingSentimentPulse, OnboardingTimeline, OnboardingWelcomeKit, OnboardingWizard, OutreachSequenceManager, OverviewTab, PackagesTab, PageHeader, PaymentGatewayManager, PipelineHeatmapOverlay, PipelineVelocityHeatmap, PitchGenerator, PitchHistory, PitchPreview, PlanBuilder, PlanDistributionChart, PlatformHealthAlerting, PlatformHealthCapacityPlanning, PlatformHealthLogsExplorer, PlatformHealthSLA, PlatformStats, PlaygroundTab, PollWidget, PoolDNAProfiler, PortfolioAnalyzer, PostCard, PresetsTab, PricingLab, PromptStudioTab, ProvidersTab, QualityFeedbackTab, QuestionBankBrowser, QuestionQualityAnalyzer, ROIDashboardTab, ReEngagementCampaignBuilder, ReadinessScore, ReferenceCheckInnovations, RejectionRecoveryCoach, ReportDialog, RescreeningTab, ResumeBulletTransformer, ResumeUpload, RevenueChart, RevenueForecast, RevenueImpactBadge, RevenueLeakageScanner, RevenueRecognition, RevenueStatsRow, RevenueWaterfall, RiskScoreGauge, RolloutManagerTab, SABenchmarkChart, SEOHead, STARMethodBuilder, SafetyGuardrailsTab, SalaryBenchmark, SalaryNegotiationCoach, ScenarioSandbox, ScheduledPublishing, ScorecardBiasDetector, ScorecardInterviewIntelligence, ScorecardLiveCalibration, ScorecardPredictiveInsights, ScreeningRulesBuilder, ScriptBuilder, Section, SeoAssistantPanel, SettingsTab, SimulatorTab, SkillAdvisorCard, SkillAnalytics, SkillAutocomplete, SkillBadge, SkillCard, SkillChallengeCard, SkillChallengeDialog, SkillCompetencyRadar, SkillDNA, SkillDNACard, SkillDNAShareDialog, SkillImportDialog, SkillMarketComparison, SkillPortfolio, SkillProgressRadar, SkillProjectGroups, SkillRadarChart, SkillRefreshDialog, SkillStatsCard, SkillTimeline, SkillsGapHeatmap, SkillsMultiSelect, SkillsSelect, SmartCloneDialog, SmartNurtureSequences, SmartRouterTab, SocialLinks, StaleSkillsAlert, Stat, StudyTimer, SubIndustrySelect, SubscriptionDetailDialog, SuccessStoriesWall, TalentPipelineFunnel, TalentPoolReengagement, TaxCompliance, TemplateDNA, TemplateMixer, TemplateMock, TemplatePicker, TemplateSelector, TestComparisonEngine, TestEffectivenessStats, TestFavoriteButton, TestItemAnalytics, TestLibraryCard, TestPreviewModal, TestQuickDemo, TestRatingDisplay, TestSmartSearch, ThemeToggle, ThreadedComments, TopEndorsedSkills, TranslationMemory, TrendingSidebar, TypingIndicator, UpdateBanner, UsageAnalyticsTab, UsageMetering, UsageSummaryTable, UserExperienceApdex, VerificationRequestDialog, VerificationTrustScore, VideoAnalysisDisplay, VideoAnalyticsDashboard, VideoAutoApply, VideoBBBEEVerification, VideoBenchmarkCard, VideoCoachPanel, VideoComparison, VideoHighlightReel, VideoJobMatchCard, VideoMockInterview, VideoNarrativeAnalyzer, VideoPlayer, VideoPortfolioPreview, VideoPracticeMode, VideoProgressTracker, VideoProofCard, VideoProofGallery, VideoProofPlayer, VideoProofRecorder, VideoRecorder, VideoRequestComposer, VideoRequestResponse, VideoResumeBuilder, VideoReviewPanel, VideoShareDialog, VideoShareDialog, VideoStatsCard, VideoSubtitleSelector, VideoTranscriptPanel, VideoTrimmer, VideoUploadDropzone, WatchlistAlerts, WeaknessAlchemist, WeeklyChallenges, WhatsAppConversationsTab, recruiter-mocks

---

## 15. TECHNICAL PLATFORM FEATURES

- **Passwordless Auth** — Magic link login via Resend email
- **Multi-Provider AI** — OpenAI, Anthropic, Google Gemini with DB-configurable model per feature
- **157 Billable Features** — Individual, recruiter, corporate, and cross-product feature entitlements
- **755 Database Tables** — Full relational schema with Drizzle ORM + PostgreSQL (Neon)
- **3586 API Endpoints** — RESTful with role-based access control
- **4 User Roles** — Individual (Job Seeker), Recruiter, Business (Corporate), Admin
- **Messaging System** — Conversations and direct messaging between users
- **Community Platform** — Forum with posts, comments, and AI moderation
- **Revenue Engine** — Agency-focused CRM with client pipeline, submissions, placements, and KPI tracking
- **Session Management** — PostgreSQL-backed sessions in production, memory store in dev
- **Security** — Helmet headers, CORS restrictions, CSRF protection, rate limiting
- **Deployment** — Railway.app with staging + production environments
