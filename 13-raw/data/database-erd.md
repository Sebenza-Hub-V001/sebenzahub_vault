---
title: "Database ERD — Entity Relationship Diagram"
type: reference
created: 2026-04-10
updated: 2026-04-10
tags: [database, erd, schema, architecture, postgresql, drizzle]
sources: [repo-audit-2026-04-07]
status: active
confidence: high
---

# Database ERD — Entity Relationship Diagram

Complete schema map for Sebenza Hub's PostgreSQL database, managed via Drizzle ORM.

## At a Glance

| Metric | Value |
|--------|-------|
| Total tables | **794** |
| Foreign key relationships | **1208** |
| Domains | **29** |
| Total columns (approx.) | **8429** |
| ORM | Drizzle (pgTable) |
| Database | PostgreSQL (Neon) |

## Hub Tables (Most Connected)

These tables form the gravitational centre of the schema. Every domain ultimately traces back here.

| Table | Incoming FKs | Role |
|-------|-------------|------|
| `users` | 461 | Central user record — every domain references this |
| `organizations` | 333 | Multi-tenant org anchor — second most connected |
| `jobs` | 56 | Job listings — core of the recruitment pipeline |
| `jobApplications` | 26 | Application records linking users to jobs |
| `candidates` | 22 | Candidate profiles used across screening and CRM |
| `videoInterviews` | 9 | Video interview sessions with evaluations |
| `offers` | 10 | Offer management, negotiations, approvals |
| `competencyTests` | 8 | Assessment test definitions |
| `corporateClients` | 8 | Recruiter's corporate client records |
| `plans` | 9 | 18 subscription plans powering billing |

### Dependency Pyramid

```
                    ┌─────────────────────┐
                    │  users (426 refs)    │
                    │  organizations (333) │
                    └──────────┬──────────┘
                               │
              ┌─────────────────┼─────────────────┐
              ▼                 ▼                 ▼
        ┌──────────┐    ┌──────────────┐   ┌──────────┐
        │ jobs (56)│    │candidates(22)│   │plans (8) │
        └────┬─────┘    └──────────────┘   └──────────┘
             ▼
    ┌──────────────────┐
    │jobApplications(26)│
    └────────┬─────────┘
             ▼
     offers · placements · screenings · interviews
```

## Domain Overview

| Domain | Tables | FK Relationships | Key Tables |
|--------|--------|-----------------|------------|
| Core & Auth | 21 | 24 | `apiIntegrations`, `connectedAccounts`, `magicLinkTokens`, `memberships` +17 more |
| User Profiles | 10 | 11 | `candidateProfiles`, `credentialMatchCache`, `credentialPortfolioSettings`, `credentialVerifications` +6 more |
| Jobs & Applications | 17 | 27 | `applicationActivities`, `applicationCommunications`, `applicationFollowUps`, `applicationMomentumSnapshots` +13 more |
| CV & Resume | 5 | 6 | `coverLetters`, `cvStylePresets`, `cvVersions`, `cvs` +1 more |
| Candidates | 4 | 9 | `candidateComparisons`, `candidateCredentials`, `candidateSkills`, `candidates` |
| Pipeline & Offers | 26 | 55 | `negotiationApprovals`, `negotiationBenchmarks`, `negotiationCommunications`, `negotiationCompPackages` +22 more |
| Billing & Subscriptions | 48 | 39 | `billingAlerts`, `billingAutomationRules`, `billingCredits`, `billingDisputes` +44 more |
| Client Management | 14 | 10 | `approvedVendors`, `clientDocuments`, `clientMeetings`, `clientNotes` +10 more |
| Screening | 20 | 50 | `cultureFitAssessments`, `cultureFitDNAProfiles`, `cultureFitInterviewerScores`, `cultureFitTeamProfiles` +16 more |
| Assessments & Testing | 17 | 25 | `assessmentBenchmarks`, `assessmentBundleItems`, `assessmentBundles`, `assessmentInvitations` +13 more |
| Interviews & Scheduling | 18 | 38 | `holds`, `interviewFeedback`, `interviewKits`, `interviewPools` +14 more |
| AI Platform | 59 | 76 | `agentTeamDefinitions`, `agentTeamNodeLogs`, `agentTeamRuns`, `aiAbExperiments` +55 more |
| WhatsApp | 49 | 48 | `metaWhatsAppTemplates`, `waCampaignAudiences`, `waCampaignContacts`, `waCampaignSendLogs` +45 more |
| Messaging & Inbox | 47 | 82 | `chatbotAbTests`, `chatbotAiTraining`, `chatbotAnalytics`, `chatbotCannedResponses` +43 more |
| Talent CRM | 26 | 63 | `rediscoveryAnalyticsEvents`, `rediscoveryCampaignSteps`, `rediscoveryCampaigns`, `rediscoveryCandidateNotes` +22 more |
| Community & Learning | 28 | 41 | `communityBadges`, `communityBookmarks`, `communityChallengeEntries`, `communityChallenges` +24 more |
| Compliance (POPIA/B-BBEE/EE) | 54 | 98 | `bbbeeCertificates`, `bbbeeClientPortfolio`, `bbbeeCommitteeMeetings`, `bbbeeComplianceAlerts` +50 more |
| Marketing & Career Site | 51 | 71 | `blogPosts`, `careerPulseSnapshots`, `careerSiteAnalytics`, `careerSiteAwards` +47 more |
| Video | 22 | 47 | `videoApplicationIntros`, `videoBbbeeVerifications`, `videoInterviewAutomations`, `videoInterviewBranding` +18 more |
| Background Checks | 15 | 34 | `backgroundCheckAdjudications`, `backgroundCheckAlerts`, `backgroundCheckCampaigns`, `backgroundCheckConsent` +11 more |
| Fraud & Security | 30 | 16 | `fraudAlerts`, `fraudAnomalyEvents`, `fraudAuditLog`, `fraudBehavioralProfiles` +26 more |
| RBAC & Audit | 11 | 32 | `accessReviewCampaigns`, `accessReviewItems`, `auditAnomalies`, `auditTrail` +7 more |
| Automation | 12 | 20 | `automationAbTests`, `automationChainExecutions`, `automationChainSteps`, `automationChains` +8 more |
| Onboarding | 6 | 17 | `onboardingBuddies`, `onboardingCheckins`, `onboardingDocuments`, `onboardingInstances` +2 more |
| Recruiter KPIs | 11 | 9 | `callNotes`, `callObjections`, `callPlaybooks`, `kpiActivityLog` +7 more |
| Referrals & References | 4 | 10 | `referenceRequests`, `referenceResponses`, `referralCampaigns`, `referrals` |
| White Label | 15 | 27 | `whiteLabelAnalytics`, `whiteLabelAssets`, `whiteLabelAuditLogs`, `whiteLabelBrandAudits` +11 more |
| Data Migration | 14 | 10 | `migrationApprovals`, `migrationComplianceAudit`, `migrationComplianceRules`, `migrationConnectors` +10 more |
| Other | 140 | 213 | `adminCvFlags`, `adminCvNotes`, `adminCvPoolMembers`, `adminCvPools` +136 more |

## Cross-Domain Relationships

Key foreign key bridges between domains:

| Link | Foreign Keys |
|------|-------------|
| **Jobs → Core** | `jobs.organizationId` → `organizations.id`, `jobs.createdBy` → `users.id` |
| **Pipeline → Jobs** | `offers.applicationId` → `jobApplications.id`, `scorecardResponses.applicationId` → `jobApplications.id` |
| **Billing → Core** | `subscriptions.organizationId` → `organizations.id`, `billingCredits.userId` → `users.id` |
| **WhatsApp → Core** | `whatsappConversations.userId` → `users.id`, `whatsappConversations.organizationId` → `organizations.id` |
| **WhatsApp → Assessments** | `whatsappAssessmentSessions.testId` → `competencyTests.id` |
| **Screening → Candidates** | `screeningCandidates.candidateId` → `candidates.id` |
| **Interviews → Jobs** | `interviews.jobId` → `jobs.id`, `schedulingLinks.jobId` → `jobs.id` |
| **CRM → Candidates** | `talentPoolMembers.candidateId` → `candidates.id`, `talentCrmContacts.candidateId` → `candidates.id` |
| **Compliance → Core** | `bbbeeScores.organizationId` → `organizations.id`, `popiaConsents.userId` → `users.id` |
| **AI → Core** | `aiJobs.userId` → `users.id`, `aiJobs.organizationId` → `organizations.id` |
| **Messaging → Jobs** | `conversations.applicationId` → `jobApplications.id`, `emailSequenceExecutions.applicationId` → `jobApplications.id` |
| **Background → Jobs** | `backgroundChecks.applicationId` → `jobApplications.id` |

---

## Core & Auth

**21 tables** — Foundation tables: users, organisations, authentication, sessions, team management.

### `apiIntegrations`

PostgreSQL: `api_integrations` · 7 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| encryptedApiKey | TEXT | NOT NULL |
| isActive | BOOLEAN | — |
| lastTestedAt | TIMESTAMP | — |
| createdBy | UUID | FK → `users.id` |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `connectedAccounts`

PostgreSQL: `connected_accounts` · 10 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| profileUrl | TEXT | — |
| accessToken | TEXT | — |
| refreshToken | TEXT | — |
| tokenExpiresAt | TIMESTAMP | — |
| scopes | TEXT | — |
| lastSyncedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `magicLinkTokens`

PostgreSQL: `magic_link_tokens` · 5 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | FK → `users.id` (CASCADE) |
| expiresAt | TIMESTAMP | NOT NULL |
| consumedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

### `memberships`

PostgreSQL: `memberships` · 5 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `oauthStateTokens`

PostgreSQL: `oauth_state_tokens` · 5 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| redirectUrl | TEXT | — |
| expiresAt | TIMESTAMP | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |

### `organizationApiKeys`

PostgreSQL: `organization_api_keys` · 10 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| keyHash | TEXT | NOT NULL |
| scopes | JSONB | — |
| lastUsedAt | TIMESTAMP | — |
| expiresAt | TIMESTAMP | — |
| isActive | BOOLEAN | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| rateLimit | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |

### `organizationBranding`

PostgreSQL: `organization_branding` · 17 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, UNIQUE, FK → `organizations.id` (CASCADE) |
| aboutUs | TEXT | — |
| linkedinUrl | TEXT | — |
| twitterUrl | TEXT | — |
| facebookUrl | TEXT | — |
| instagramUrl | TEXT | — |
| youtubeUrl | TEXT | — |
| glassdoorUrl | TEXT | — |
| careerPageUrl | TEXT | — |
| coverImageUrl | TEXT | — |
| cultureVideoUrl | TEXT | — |
| employeeTestimonials | JSONB | — |
| companyValues | JSONB | — |
| benefits | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `organizationEmailSignatures`

PostgreSQL: `organization_email_signatures` · 7 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| content | TEXT | NOT NULL |
| isDefault | BOOLEAN | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `organizationIntegrations`

PostgreSQL: `organization_integrations` · 6 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, UNIQUE, FK → `organizations.id` (CASCADE) |
| slackWebhook | TEXT | — |
| atsApiKey | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `organizationWebhooks`

PostgreSQL: `organization_webhooks` · 13 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| url | TEXT | NOT NULL |
| secret | TEXT | — |
| events | JSONB | — |
| isActive | BOOLEAN | — |
| retryCount | INTEGER | — |
| lastTriggeredAt | TIMESTAMP | — |
| lastStatus | INTEGER | — |
| failureCount | INTEGER | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `organizations`

PostgreSQL: `organizations` · 8 columns · 0 FK out · 333 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| website | TEXT | — |
| logoUrl | TEXT | — |
| description | TEXT | — |
| address | TEXT | — |
| isVerified | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `memberships.organizationId`, `teamMembers.organizationId`, `interviewSettings.organizationId`, `complianceSettings.organizationId`, `organizationIntegrations.organizationId`, `jobTemplates.organizationId`, `jdDrafts.organizationId`, `salaryBands.organizationId` +325 more

### `refreshTokens`

PostgreSQL: `refresh_tokens` · 4 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| expiresAt | TIMESTAMP | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |

### `sessions`

PostgreSQL: `sessions` · 1 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| sess | JSONB | NOT NULL |

### `ssoConfigs`

PostgreSQL: `sso_configs` · 7 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, UNIQUE, FK → `organizations.id` (CASCADE) |
| clientSecret | TEXT | — |
| metadata | JSONB | — |
| isActive | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `teamMembers`

PostgreSQL: `team_members` · 7 columns · 2 FK out · 2 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| permissions | JSONB | — |
| invitedBy | UUID | FK → `users.id` (SET NULL) |
| roleDefinitionId | UUID | — |
| joinedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

**Referenced by:** `roleAssignments.teamMemberId`, `roleChangeRequests.targetTeamMemberId`

### `userDocuments`

PostgreSQL: `user_documents` · 8 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| fileUrl | TEXT | NOT NULL |
| fileSizeBytes | INTEGER | — |
| aiClassification | JSONB | — |
| uploadBatchId | UUID | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `userEducation`

PostgreSQL: `user_education` · 9 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| startDate | TIMESTAMP | — |
| endDate | TIMESTAMP | — |
| isCurrentlyStudying | BOOLEAN | — |
| activities | TEXT | — |
| saqaVerified | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `userExperiences`

PostgreSQL: `user_experiences` · 11 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| startDate | TIMESTAMP | — |
| endDate | TIMESTAMP | — |
| isCurrent | BOOLEAN | — |
| description | TEXT | — |
| achievements | JSONB | — |
| skills | JSONB | — |
| gapExplanation | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `userInvoices`

PostgreSQL: `user_invoices` · 11 columns · 2 FK out · 2 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| subscriptionId | UUID | FK → `subscriptions.id` (SET NULL) |
| amountCents | INTEGER | NOT NULL |
| description | TEXT | — |
| periodStart | TIMESTAMP | — |
| periodEnd | TIMESTAMP | — |
| paymentDate | TIMESTAMP | — |
| dueDate | TIMESTAMP | — |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

**Referenced by:** `billingDisputes.invoiceId`, `revenueRecognitionEntries.invoiceId`

### `userPaymentMethods`

PostgreSQL: `user_payment_methods` · 7 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| expiryMonth | INTEGER | — |
| expiryYear | INTEGER | — |
| isDefault | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `users`

PostgreSQL: `users` · 7 columns · 0 FK out · 461 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| avatarUrl | TEXT | — |
| emailVerified | BOOLEAN | — |
| isActive | BOOLEAN | — |
| onboardingComplete | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `magicLinkTokens.userId`, `refreshTokens.userId`, `connectedAccounts.userId`, `oauthStateTokens.userId`, `memberships.userId`, `teamMembers.invitedBy`, `jdDrafts.createdBy`, `candidateProfiles.userId` +453 more

## User Profiles

**10 tables** — Extended profile data for each user type: candidate, recruiter, individual.

### `candidateProfiles`

PostgreSQL: `candidate_profiles` · 13 columns · 1 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, UNIQUE, FK → `users.id` (CASCADE) |
| summary | TEXT | — |
| address | TEXT | — |
| dateOfBirth | TIMESTAMP | — |
| skills | JSONB | — |
| languages | JSONB | — |
| cvUrl | TEXT | — |
| linkedinUrl | TEXT | — |
| linkedinVerified | BOOLEAN | — |
| portfolioUrl | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `whatsappConversations.candidateProfileId`

### `credentialMatchCache`

PostgreSQL: `credential_match_cache` · 8 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| jobId | INTEGER | NOT NULL |
| matchScore | INTEGER | NOT NULL |
| matchedCredentials | JSONB | — |
| missingCredentials | JSONB | — |
| bonusCredentials | JSONB | — |
| computedAt | TIMESTAMP | NOT NULL |

### `credentialPortfolioSettings`

PostgreSQL: `credential_portfolio_settings` · 11 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| isPortfolioPublic | BOOLEAN | — |
| showEducation | BOOLEAN | — |
| showCertifications | BOOLEAN | — |
| showAssessments | BOOLEAN | — |
| showSkills | BOOLEAN | — |
| bio | TEXT | — |
| passportEnabled | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `credentialVerifications`

PostgreSQL: `credential_verifications` · 9 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| verifiedAt | TIMESTAMP | — |
| proofUrl | TEXT | — |
| aiConfidenceScore | INTEGER | — |
| notes | TEXT | — |
| expiresAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `individualNotificationSettings`

PostgreSQL: `individual_notification_settings` · 9 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, UNIQUE, FK → `users.id` (CASCADE) |
| emailJobAlerts | BOOLEAN | — |
| whatsappJobAlerts | BOOLEAN | — |
| smsJobAlerts | BOOLEAN | — |
| emailApplicationUpdates | BOOLEAN | — |
| emailNewsletter | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `individualPreferences`

PostgreSQL: `individual_preferences` · 12 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, UNIQUE, FK → `users.id` (CASCADE) |
| preferredIndustries | JSONB | — |
| preferredSubIndustries | JSONB | — |
| preferredJobTitles | JSONB | — |
| desiredSalaryMin | INTEGER | — |
| desiredSalaryMax | INTEGER | — |
| employmentTypes | JSONB | — |
| preferredLocations | JSONB | — |
| willingToRelocate | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `individualSettings`

PostgreSQL: `individual_settings` · 36 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, UNIQUE, FK → `users.id` (CASCADE) |
| compactMode | BOOLEAN | — |
| reducedMotion | BOOLEAN | — |
| highContrast | BOOLEAN | — |
| favouriteCvTemplates | JSONB | — |
| quietHoursEnabled | BOOLEAN | — |
| showEmail | BOOLEAN | — |
| showPhone | BOOLEAN | — |
| showLocation | BOOLEAN | — |
| allowRecruiterMessages | BOOLEAN | — |
| allowJobRecommendations | BOOLEAN | — |
| showProfilePhoto | BOOLEAN | — |
| showLastActive | BOOLEAN | — |
| searchableByRecruiters | BOOLEAN | — |
| excludedCompanies | JSONB | — |
| preferredCompanySizes | JSONB | — |
| preferredCulture | JSONB | — |
| benefitsPriorities | JSONB | — |
| preferredJobTitles | JSONB | — |
| commuteMaxMinutes | INTEGER | — |
| autoApplyEnabled | BOOLEAN | — |
| autoApplyMatchThreshold | INTEGER | — |
| autoWithdrawDays | INTEGER | — |
| savedSearchAlerts | BOOLEAN | — |
| twoFactorEnabled | BOOLEAN | — |
| loginNotifications | BOOLEAN | — |
| sessionTimeout | INTEGER | — |
| careerDna | JSONB | — |
| opportunityWeights | JSONB | — |
| autopilotConfig | JSONB | — |
| applicationRules | JSONB | — |
| marketRadarConfig | JSONB | — |
| interviewAiConfig | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `recruiterNotificationSettings`

PostgreSQL: `recruiter_notification_settings` · 29 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| newApplicationEmail | BOOLEAN | — |
| newApplicationPush | BOOLEAN | — |
| newApplicationSlack | BOOLEAN | — |
| applicationStageChangeEmail | BOOLEAN | — |
| applicationWithdrawnEmail | BOOLEAN | — |
| interviewScheduledEmail | BOOLEAN | — |
| interviewReminderEmail | BOOLEAN | — |
| interviewReminderMinutes | INTEGER | — |
| interviewFeedbackDueEmail | BOOLEAN | — |
| interviewNoShowEmail | BOOLEAN | — |
| offerAcceptedEmail | BOOLEAN | — |
| offerDeclinedEmail | BOOLEAN | — |
| offerExpiringEmail | BOOLEAN | — |
| offerExpiringDays | INTEGER | — |
| teamMemberJoinedEmail | BOOLEAN | — |
| mentionNotificationEmail | BOOLEAN | — |
| taskAssignedEmail | BOOLEAN | — |
| dailyDigestEnabled | BOOLEAN | — |
| weeklyReportEnabled | BOOLEAN | — |
| quietHoursEnabled | BOOLEAN | — |
| aiInsightsEnabled | BOOLEAN | — |
| candidateMatchAlerts | BOOLEAN | — |
| candidateMatchThreshold | INTEGER | — |
| marketInsightsEnabled | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `recruiterPitches`

PostgreSQL: `recruiter_pitches` · 9 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| recruiterId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| prospectNotes | TEXT | — |
| generatedContent | JSONB | — |
| shareExpiresAt | TIMESTAMP | — |
| viewCount | INTEGER | NOT NULL |
| lastViewedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `recruiterProfiles`

PostgreSQL: `recruiter_profiles` · 79 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, UNIQUE, FK → `users.id` (CASCADE) |
| sectors | JSONB | — |
| yearsExperience | INTEGER | — |
| specializations | JSONB | — |
| bio | TEXT | — |
| linkedinUrl | TEXT | — |
| linkedinVerified | BOOLEAN | — |
| website | TEXT | — |
| foundedYear | INTEGER | — |
| agencyDescription | TEXT | — |
| agencyLogoUrl | TEXT | — |
| coverPhotoUrl | TEXT | — |
| certifications | JSONB | — |
| languages | JSONB | — |
| awards | JSONB | — |
| totalPlacements | INTEGER | — |
| successRate | REAL | — |
| avgTimeToFill | INTEGER | — |
| avgRetentionRate | REAL | — |
| industriesServed | JSONB | — |
| subIndustriesServed | JSONB | — |
| placementHighlights | JSONB | — |
| feePercentageMin | REAL | — |
| feePercentageMax | REAL | — |
| contractTypes | JSONB | — |
| twitterUrl | TEXT | — |
| facebookUrl | TEXT | — |
| instagramUrl | TEXT | — |
| youtubeUrl | TEXT | — |
| githubUrl | TEXT | — |
| serviceAreas | JSONB | — |
| geographicCoverage | JSONB | — |
| recruitmentMethods | JSONB | — |
| techStack | JSONB | — |
| atsIntegrations | JSONB | — |
| testimonials | JSONB | — |
| popiaCompliant | BOOLEAN | — |
| workingHours | JSONB | — |
| teamMembers | JSONB | — |
| showPlacementStats | BOOLEAN | — |
| showFeeStructure | BOOLEAN | — |
| showTestimonials | BOOLEAN | — |
| profileCompleteness | INTEGER | — |
| aiDnaSummary | JSONB | — |
| aiElevatorPitch | TEXT | — |
| dnaLastUpdated | TIMESTAMP | — |
| reputationScore | INTEGER | — |
| reputationBreakdown | JSONB | — |
| reputationUpdatedAt | TIMESTAMP | — |
| marketInsights | JSONB | — |
| insightsLastUpdated | TIMESTAMP | — |
| transformationStatement | TEXT | — |
| diversityInitiatives | JSONB | — |
| testimonialRequests | JSONB | — |
| socialProofSummary | TEXT | — |
| caseStudies | JSONB | — |
| publicProfileSections | JSONB | — |
| proposalTemplate | JSONB | — |
| profileCoachInsights | JSONB | — |
| profileCoachHistory | JSONB | — |
| verificationBadges | JSONB | — |
| trustScore | INTEGER | — |
| bbbeeDocumentUrl | TEXT | — |
| competitiveBenchmark | JSONB | — |
| benchmarkLastUpdated | TIMESTAMP | — |
| introVideoUrl | TEXT | — |
| introVideoThumbnail | TEXT | — |
| introVideoTranscript | TEXT | — |
| introVideoAnalysis | JSONB | — |
| introVideoEnabled | BOOLEAN | — |
| introVideoViews | INTEGER | — |
| maxCapacity | INTEGER | — |
| capacityBySector | JSONB | — |
| capacityForecast | JSONB | — |
| schedulingLink | TEXT | — |
| capacityLastUpdated | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## Jobs & Applications

**17 tables** — Job listings, applications, templates, search, and application lifecycle.

### `applicationActivities`

PostgreSQL: `application_activities` · 6 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| applicationId | UUID | NOT NULL, FK → `jobApplications.id` (CASCADE) |
| userId | UUID | FK → `users.id` (SET NULL) |
| content | TEXT | — |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

### `applicationCommunications`

PostgreSQL: `application_communications` · 6 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| applicationId | UUID | NOT NULL, FK → `jobApplications.id` (CASCADE) |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| content | TEXT | NOT NULL |
| sentAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

### `applicationFollowUps`

PostgreSQL: `application_follow_ups` · 6 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| applicationId | UUID | NOT NULL, FK → `jobApplications.id` (CASCADE) |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| sentAt | TIMESTAMP | NOT NULL |
| messagePreview | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

### `applicationMomentumSnapshots`

PostgreSQL: `application_momentum_snapshots` · 9 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| score | REAL | NOT NULL |
| velocity | REAL | — |
| responseRateTrend | REAL | — |
| forecast | JSONB | — |
| dailyPlaybook | JSONB | — |
| calculatedAt | TIMESTAMP | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |

### `applicationNetworkingActions`

PostgreSQL: `application_networking_actions` · 5 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| applicationId | UUID | NOT NULL, FK → `jobApplications.id` (CASCADE) |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| notes | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

### `applicationNotes`

PostgreSQL: `application_notes` · 8 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| applicationId | UUID | NOT NULL, FK → `jobApplications.id` (CASCADE) |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| content | TEXT | NOT NULL |
| tags | JSONB | — |
| isPinned | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `applicationReminders`

PostgreSQL: `application_reminders` · 6 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| applicationId | UUID | NOT NULL, FK → `jobApplications.id` (CASCADE) |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| reminderDate | TIMESTAMP | NOT NULL |
| message | TEXT | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |

### `applicationStreaks`

PostgreSQL: `application_streaks` · 10 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| currentStreak | INTEGER | NOT NULL |
| longestStreak | INTEGER | NOT NULL |
| lastActiveDate | TIMESTAMP | — |
| momentumScore | INTEGER | NOT NULL |
| achievements | JSONB | — |
| weeklyChallenge | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `applicationWithdrawals`

PostgreSQL: `application_withdrawals` · 5 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| applicationId | UUID | NOT NULL, FK → `jobApplications.id` (CASCADE) |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| details | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

### `jdDrafts`

PostgreSQL: `jd_drafts` · 12 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| createdBy | UUID | FK → `users.id` (CASCADE) |
| inputParams | JSONB | — |
| content | JSONB | — |
| scores | JSONB | — |
| version | INTEGER | — |
| parentId | UUID | — |
| isFavorite | BOOLEAN | — |
| isTemplate | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `jobApplications`

PostgreSQL: `job_applications` · 17 columns · 2 FK out · 26 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| jobId | UUID | NOT NULL, FK → `jobs.id` (CASCADE) |
| coverLetter | TEXT | — |
| resumeUrl | TEXT | — |
| answers | JSONB | — |
| matchScore | REAL | — |
| screeningNotes | TEXT | — |
| aiMatchScore | REAL | — |
| aiMatchExplanation | TEXT | — |
| aiMatchedSkills | JSONB | — |
| aiMissingSkills | JSONB | — |
| videoIntroId | UUID | — |
| ghostRiskScore | INTEGER | — |
| ghostRiskFactors | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `applicationNotes.applicationId`, `applicationReminders.applicationId`, `applicationWithdrawals.applicationId`, `applicationActivities.applicationId`, `scorecardResponses.applicationId`, `offers.applicationId`, `emailSequenceExecutions.applicationId`, `schedulingLinks.applicationId` +18 more

### `jobEmbeddings`

PostgreSQL: `job_embeddings` · 4 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| jobId | UUID | NOT NULL, UNIQUE, FK → `jobs.id` (CASCADE) |
| embedding | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

### `jobFavorites`

PostgreSQL: `job_favorites` · 4 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| jobId | UUID | NOT NULL, FK → `jobs.id` (CASCADE) |
| createdAt | TIMESTAMP | NOT NULL |

### `jobIntakeScorecard`

PostgreSQL: `job_intake_scorecard` · 21 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL |
| jobId | UUID | NOT NULL |
| clientId | UUID | — |
| salaryCompetitiveness | INTEGER | — |
| roleClarity | INTEGER | — |
| urgencyLevel | INTEGER | — |
| hiringManagerAccess | INTEGER | — |
| interviewProcess | INTEGER | — |
| locationAttractiveness | INTEGER | — |
| brandStrength | INTEGER | — |
| overallScore | INTEGER | — |
| fillProbability | INTEGER | — |
| estimatedTimeToFill | INTEGER | — |
| estimatedFee | INTEGER | — |
| scoredBy | UUID | — |
| aiAssisted | BOOLEAN | — |
| notes | TEXT | — |
| interviewStages | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `jobSearchExpenses`

PostgreSQL: `job_search_expenses` · 10 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| amountCents | INTEGER | NOT NULL |
| expenseDate | TIMESTAMP | NOT NULL |
| isRecurring | BOOLEAN | — |
| receiptUrl | TEXT | — |
| taxDeductible | BOOLEAN | — |
| notes | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `jobTemplates`

PostgreSQL: `job_templates` · 7 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| requirements | JSONB | — |
| approvalChain | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `jobs`

PostgreSQL: `jobs` · 24 columns · 2 FK out · 56 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (SET NULL) |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| core | JSONB | — |
| compensation | JSONB | — |
| roleDetails | JSONB | — |
| application | JSONB | — |
| companyDetails | JSONB | — |
| contract | JSONB | — |
| benefits | JSONB | — |
| vetting | JSONB | — |
| compliance | JSONB | — |
| attachments | JSONB | — |
| accessibility | JSONB | — |
| branding | JSONB | — |
| admin | JSONB | — |
| seo | JSONB | — |
| viewCount | INTEGER | — |
| applicationCount | INTEGER | — |
| isFeatured | BOOLEAN | — |
| expiresAt | TIMESTAMP | — |
| publishedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `jobApplications.jobId`, `jobFavorites.jobId`, `jobEmbeddings.jobId`, `assessmentInvitations.jobId`, `interviews.jobId`, `autoSearchResults.jobId`, `autoApplyLog.jobId`, `scorecards.jobId` +48 more

## CV & Resume

**5 tables** — CV management, style presets, versioning, and cover letters.

### `coverLetters`

PostgreSQL: `cover_letters` · 20 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| content | TEXT | NOT NULL |
| jobDescription | TEXT | — |
| wordCount | INTEGER | — |
| highlights | JSONB | — |
| qualityScore | INTEGER | — |
| qualityBreakdown | JSONB | — |
| qualityFeedback | JSONB | — |
| parentId | UUID | — |
| isTemplate | BOOLEAN | — |
| timesUsed | INTEGER | — |
| lastUsedAt | TIMESTAMP | — |
| linkedApplicationId | UUID | — |
| isFavorite | BOOLEAN | — |
| tags | JSONB | — |
| version | INTEGER | — |
| versionHistory | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `cvStylePresets`

PostgreSQL: `cv_style_presets` · 5 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| isDefault | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `cvVersions`

PostgreSQL: `cv_versions` · 6 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| cvId | UUID | NOT NULL, FK → `cvs.id` (CASCADE) |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| versionNumber | INTEGER | NOT NULL |
| snapshot | JSONB | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |

### `cvs`

PostgreSQL: `cvs` · 15 columns · 1 FK out · 5 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| personalInfo | JSONB | — |
| aboutMe | TEXT | — |
| skills | JSONB | — |
| workExperience | JSONB | — |
| education | JSONB | — |
| references | JSONB | — |
| photoUrl | TEXT | — |
| resumeUrl | TEXT | — |
| hiddenFields | JSONB | — |
| isDefault | BOOLEAN | — |
| stylePresetId | UUID | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `cvVersions.cvId`, `adminCvFlags.cvId`, `adminCvNotes.cvId`, `adminCvTagAssignments.cvId`, `adminCvPoolMembers.cvId`

### `resumes`

PostgreSQL: `resumes` · 8 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| candidateId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| fileUrl | TEXT | — |
| filesizeBytes | INTEGER | — |
| parsedOk | BOOLEAN | — |
| rawText | TEXT | — |
| parsedData | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

## Candidates

**4 tables** — Candidate records imported by recruiters, with skills and credentials.

### `candidateComparisons`

PostgreSQL: `candidate_comparisons` · 11 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| jobId | UUID | FK → `jobs.id` (CASCADE) |
| applicationIds | JSONB | NOT NULL |
| notes | TEXT | — |
| weights | JSONB | — |
| decisions | JSONB | — |
| aiAnalysis | JSONB | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `candidateCredentials`

PostgreSQL: `candidate_credentials` · 13 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | SERIAL | PK |
| candidateId | UUID | NOT NULL, FK → `users.id` |
| templateId | INTEGER | NOT NULL, FK → `testLibraryTemplates.id` |
| attemptId | UUID | FK → `testAttempts.id` |
| score | INTEGER | — |
| percentile | INTEGER | — |
| passed | BOOLEAN | — |
| completedAt | TIMESTAMP | — |
| expiresAt | TIMESTAMP | — |
| isPublic | BOOLEAN | — |
| timeTakenMinutes | INTEGER | — |
| retakeCount | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |

### `candidateSkills`

PostgreSQL: `candidate_skills` · 4 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| candidateId | UUID | NOT NULL, FK → `candidates.id` (CASCADE) |
| skillId | UUID | NOT NULL, FK → `skills.id` (CASCADE) |
| createdAt | TIMESTAMP | NOT NULL |

### `candidates`

PostgreSQL: `candidates` · 8 columns · 1 FK out · 22 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (SET NULL) |
| links | JSONB | — |
| summary | TEXT | — |
| resumeUrl | TEXT | — |
| tags | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `experiences.candidateId`, `education.candidateId`, `certifications.candidateId`, `projects.candidateId`, `awards.candidateId`, `candidateSkills.candidateId`, `screeningCandidates.candidateId`, `screenings.candidateId` +14 more

## Pipeline & Offers

**26 tables** — Recruitment pipeline stages, scorecards, offers, negotiations, placements.

### `negotiationApprovals`

PostgreSQL: `negotiation_approvals` · 13 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| offerId | UUID | NOT NULL, FK → `offers.id` (CASCADE) |
| negotiationRoundId | UUID | FK → `offerNegotiations.id` (SET NULL) |
| approvalLevel | INTEGER | NOT NULL |
| approverId | UUID | FK → `users.id` (SET NULL) |
| proposedAmount | INTEGER | — |
| approvedAmount | INTEGER | — |
| maxAuthorizedAmount | INTEGER | — |
| conditions | JSONB | — |
| comments | TEXT | — |
| decidedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `negotiationBenchmarks`

PostgreSQL: `negotiation_benchmarks` · 18 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| salaryMin | INTEGER | — |
| salaryMedian | INTEGER | — |
| salaryMax | INTEGER | — |
| salaryP25 | INTEGER | — |
| salaryP75 | INTEGER | — |
| totalCompMin | INTEGER | — |
| totalCompMedian | INTEGER | — |
| totalCompMax | INTEGER | — |
| commonBenefits | JSONB | — |
| scarceSkill | BOOLEAN | — |
| bbbeePremium | INTEGER | — |
| sampleSize | INTEGER | — |
| validFrom | TIMESTAMP | — |
| validTo | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `negotiationCommunications`

PostgreSQL: `negotiation_communications` · 12 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| offerId | UUID | NOT NULL, FK → `offers.id` (CASCADE) |
| negotiationRoundId | UUID | FK → `offerNegotiations.id` (SET NULL) |
| content | TEXT | — |
| sentimentScore | INTEGER | — |
| keyPoints | JSONB | — |
| actionItems | JSONB | — |
| attachments | JSONB | — |
| scheduledFollowUp | TIMESTAMP | — |
| communicatedBy | UUID | FK → `users.id` (SET NULL) |
| communicatedAt | TIMESTAMP | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |

### `negotiationCompPackages`

PostgreSQL: `negotiation_comp_packages` · 26 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| offerId | UUID | NOT NULL, FK → `offers.id` (CASCADE) |
| negotiationRoundId | UUID | FK → `offerNegotiations.id` (SET NULL) |
| baseSalary | INTEGER | NOT NULL |
| signingBonus | INTEGER | — |
| annualBonus | INTEGER | — |
| bonusTarget | INTEGER | — |
| commission | INTEGER | — |
| equityValue | INTEGER | — |
| equityVestingMonths | INTEGER | — |
| carAllowance | INTEGER | — |
| housingAllowance | INTEGER | — |
| medicalAid | INTEGER | — |
| retirementContribution | INTEGER | — |
| studyAllowance | INTEGER | — |
| cellphoneAllowance | INTEGER | — |
| travelAllowance | INTEGER | — |
| leaveDays | INTEGER | — |
| remoteWorkDays | INTEGER | — |
| relocationAssistance | INTEGER | — |
| customBenefits | JSONB | — |
| totalAnnualValue | INTEGER | — |
| costToCompany | INTEGER | — |
| notes | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `negotiationDeadlines`

PostgreSQL: `negotiation_deadlines` · 10 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| offerId | UUID | NOT NULL, FK → `offers.id` (CASCADE) |
| description | TEXT | — |
| dueDate | TIMESTAMP | NOT NULL |
| reminderSent | BOOLEAN | — |
| escalated | BOOLEAN | — |
| assignedTo | UUID | FK → `users.id` (SET NULL) |
| completedAt | TIMESTAMP | — |
| extendedTo | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

### `negotiationStrategies`

PostgreSQL: `negotiation_strategies` · 15 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| tactics | JSONB | — |
| scripts | JSONB | — |
| salaryRanges | JSONB | — |
| benefitsPlaybook | JSONB | — |
| redFlags | JSONB | — |
| walkAwayConditions | JSONB | — |
| successRate | INTEGER | — |
| usageCount | INTEGER | — |
| isDefault | BOOLEAN | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `offerActivityLog`

PostgreSQL: `offer_activity_log` · 9 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| offerId | UUID | NOT NULL, FK → `offers.id` (CASCADE) |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| previousValue | TEXT | — |
| newValue | TEXT | — |
| metadata | JSONB | — |
| performedBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |

### `offerApprovalChains`

PostgreSQL: `offer_approval_chains` · 13 columns · 4 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| offerId | UUID | NOT NULL, FK → `offers.id` (CASCADE) |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| stepOrder | INTEGER | NOT NULL |
| approverId | UUID | FK → `users.id` (SET NULL) |
| comments | TEXT | — |
| delegatedTo | UUID | FK → `users.id` (SET NULL) |
| dueDate | TIMESTAMP | — |
| decidedAt | TIMESTAMP | — |
| reminderSentAt | TIMESTAMP | — |
| escalatedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `offerBenchmarks`

PostgreSQL: `offer_benchmarks` · 12 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| marketMin | INTEGER | — |
| marketMedian | INTEGER | — |
| marketMax | INTEGER | — |
| marketP25 | INTEGER | — |
| marketP75 | INTEGER | — |
| sampleSize | INTEGER | — |
| dataDate | TIMESTAMP | — |
| totalCompBenefitsValue | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `offerComparisons`

PostgreSQL: `offer_comparisons` · 10 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| offerIds | JSONB | NOT NULL |
| comparisonNotes | TEXT | — |
| recommendation | TEXT | — |
| recommendedOfferId | UUID | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `offerComplianceChecks`

PostgreSQL: `offer_compliance_checks` · 10 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| offerId | UUID | FK → `offers.id` (CASCADE) |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| recommendation | TEXT | — |
| details | JSONB | — |
| resolvedAt | TIMESTAMP | — |
| resolvedBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `offerLetters`

PostgreSQL: `offer_letters` · 9 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| offerId | UUID | NOT NULL, FK → `offers.id` (CASCADE) |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| templateContent | TEXT | — |
| mergedContent | TEXT | — |
| signatureUrl | TEXT | — |
| signedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `offerNegotiations`

PostgreSQL: `offer_negotiations` · 9 columns · 1 FK out · 3 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| offerId | UUID | NOT NULL, FK → `offers.id` (CASCADE) |
| round | INTEGER | NOT NULL |
| proposedSalary | INTEGER | — |
| proposedBenefits | JSONB | — |
| candidateNotes | TEXT | — |
| internalNotes | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `negotiationCommunications.negotiationRoundId`, `negotiationApprovals.negotiationRoundId`, `negotiationCompPackages.negotiationRoundId`

### `offerPredictionsLog`

PostgreSQL: `offer_predictions_log` · 11 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| offerId | UUID | FK → `offers.id` (SET NULL) |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| candidateProfile | TEXT | — |
| offerDetails | TEXT | — |
| acceptanceProbability | INTEGER | — |
| positiveFactors | JSONB | — |
| riskFactors | JSONB | — |
| suggestions | JSONB | — |
| competitiveAnalysis | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

### `offerTemplateClauses`

PostgreSQL: `offer_template_clauses` · 10 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| content | TEXT | NOT NULL |
| isDefault | BOOLEAN | — |
| isRequired | BOOLEAN | — |
| tags | JSONB | — |
| usageCount | INTEGER | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `offerTemplateVersions`

PostgreSQL: `offer_template_versions` · 7 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| templateId | UUID | NOT NULL, FK → `offerTemplates.id` (CASCADE) |
| version | INTEGER | NOT NULL |
| snapshotData | JSONB | NOT NULL |
| changeNotes | TEXT | — |
| changedBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |

### `offerTemplates`

PostgreSQL: `offer_templates` · 35 columns · 2 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| tags | JSONB | — |
| salaryMin | INTEGER | — |
| salaryMax | INTEGER | — |
| commissionStructure | TEXT | — |
| equityPackage | JSONB | — |
| allowances | JSONB | — |
| defaultBenefits | JSONB | — |
| medicalAid | JSONB | — |
| retirementFund | JSONB | — |
| leavePolicy | JSONB | — |
| defaultConditions | TEXT | — |
| legalClauses | JSONB | — |
| confidentialityClause | BOOLEAN | — |
| nonCompeteClause | BOOLEAN | — |
| ipAssignmentClause | BOOLEAN | — |
| dataPrivacyClause | BOOLEAN | — |
| expiryDays | INTEGER | — |
| templateBody | TEXT | — |
| headerText | TEXT | — |
| footerText | TEXT | — |
| signatureBlock | TEXT | — |
| approvalRequired | BOOLEAN | — |
| approverIds | JSONB | — |
| isFavorite | BOOLEAN | — |
| isDefault | BOOLEAN | — |
| version | INTEGER | — |
| customFields | JSONB | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| usageCount | INTEGER | — |
| lastUsedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `offerTemplateVersions.templateId`

### `offers`

PostgreSQL: `offers` · 21 columns · 4 FK out · 10 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| applicationId | UUID | NOT NULL, FK → `jobApplications.id` (CASCADE) |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| salaryAmount | INTEGER | — |
| startDate | TIMESTAMP | — |
| expiresAt | TIMESTAMP | — |
| benefits | JSONB | — |
| conditions | TEXT | — |
| bonusAmount | INTEGER | — |
| commissionStructure | TEXT | — |
| negotiationRounds | INTEGER | — |
| declineReason | TEXT | — |
| templateId | UUID | — |
| viewedAt | TIMESTAMP | — |
| approvedBy | UUID | FK → `users.id` (SET NULL) |
| approvedAt | TIMESTAMP | — |
| sentAt | TIMESTAMP | — |
| respondedAt | TIMESTAMP | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `offerLetters.offerId`, `offerNegotiations.offerId`, `negotiationCommunications.offerId`, `negotiationDeadlines.offerId`, `negotiationApprovals.offerId`, `negotiationCompPackages.offerId`, `offerPredictionsLog.offerId`, `offerActivityLog.offerId` +2 more

### `pipelineAutomationRules`

PostgreSQL: `pipeline_automation_rules` · 12 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| jobId | UUID | FK → `jobs.id` (CASCADE) |
| description | TEXT | — |
| triggerCondition | JSONB | — |
| actions | JSONB | — |
| isActive | BOOLEAN | — |
| executionCount | INTEGER | — |
| lastExecutedAt | TIMESTAMP | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `pipelineOutreachSequences`

PostgreSQL: `pipeline_outreach_sequences` · 12 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| jobId | UUID | FK → `jobs.id` (CASCADE) |
| triggerDelay | INTEGER | — |
| body | TEXT | NOT NULL |
| isActive | BOOLEAN | — |
| sentCount | INTEGER | — |
| openRate | REAL | — |
| responseRate | REAL | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `pipelineStages`

PostgreSQL: `pipeline_stages` · 5 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| order | INTEGER | — |
| isDefault | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |

### `pipelineVelocityMetrics`

PostgreSQL: `pipeline_velocity_metrics` · 14 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| jobId | UUID | FK → `jobs.id` (CASCADE) |
| avgDaysInStage | REAL | — |
| medianDaysInStage | REAL | — |
| minDaysInStage | REAL | — |
| maxDaysInStage | REAL | — |
| candidateCount | INTEGER | — |
| conversionRate | REAL | — |
| dropOffRate | REAL | — |
| periodStart | TIMESTAMP | — |
| periodEnd | TIMESTAMP | — |
| calculatedAt | TIMESTAMP | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |

### `placements`

PostgreSQL: `placements` · 24 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL |
| submissionId | UUID | — |
| jobId | UUID | NOT NULL |
| candidateId | UUID | NOT NULL |
| clientId | UUID | — |
| recruiterId | UUID | NOT NULL |
| startDate | TIMESTAMP | — |
| salary | INTEGER | — |
| feePercentage | REAL | — |
| feeAmount | INTEGER | — |
| guaranteePeriod | INTEGER | — |
| guaranteeExpiresAt | TIMESTAMP | — |
| invoiceDate | TIMESTAMP | — |
| invoiceAmount | INTEGER | — |
| paidAmount | INTEGER | — |
| paidDate | TIMESTAMP | — |
| paymentTerms | INTEGER | — |
| terminatedAt | TIMESTAMP | — |
| terminationReason | TEXT | — |
| replacementRequired | BOOLEAN | — |
| notes | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `scorecardResponses`

PostgreSQL: `scorecard_responses` · 8 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| scorecardId | UUID | NOT NULL, FK → `scorecards.id` (CASCADE) |
| applicationId | UUID | NOT NULL, FK → `jobApplications.id` (CASCADE) |
| evaluatorId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| scores | JSONB | NOT NULL |
| overallScore | REAL | — |
| notes | TEXT | — |
| submittedAt | TIMESTAMP | NOT NULL |

### `scorecards`

PostgreSQL: `scorecards` · 7 columns · 2 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| jobId | UUID | FK → `jobs.id` (CASCADE) |
| description | TEXT | — |
| criteria | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `scorecardResponses.scorecardId`

### `submissions`

PostgreSQL: `submissions` · 22 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL |
| jobId | UUID | NOT NULL |
| candidateId | UUID | NOT NULL |
| clientId | UUID | — |
| recruiterId | UUID | NOT NULL |
| submittedAt | TIMESTAMP | — |
| clientFeedback | TEXT | — |
| clientFeedbackAt | TIMESTAMP | — |
| clientRating | INTEGER | — |
| interviewDate | TIMESTAMP | — |
| interviewFeedback | TEXT | — |
| interviewRating | INTEGER | — |
| aiMatchScore | INTEGER | — |
| aiSummary | TEXT | — |
| aiCoverNote | TEXT | — |
| cvVersion | TEXT | — |
| coverNote | TEXT | — |
| internalNotes | TEXT | — |
| rejectionReason | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## Billing & Subscriptions

**48 tables** — 18 subscription plans, credits, payments, invoices, pricing experiments.

### `billingAlerts`

PostgreSQL: `billing_alerts` · 7 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| subscriptionId | UUID | — |
| holderId | UUID | — |
| message | TEXT | NOT NULL |
| isRead | BOOLEAN | — |
| resolvedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

### `billingAutomationRules`

PostgreSQL: `billing_automation_rules` · 13 columns · 1 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| triggerConfig | JSONB | NOT NULL |
| actionConfig | JSONB | — |
| isActive | BOOLEAN | — |
| priority | INTEGER | — |
| executionCount | INTEGER | — |
| lastExecutedAt | TIMESTAMP | — |
| cooldownMinutes | INTEGER | — |
| maxExecutionsPerDay | INTEGER | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `automationExecutions.ruleId`

### `billingCredits`

PostgreSQL: `billing_credits` · 7 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| balance | INTEGER | NOT NULL |
| lifetimeEarned | INTEGER | NOT NULL |
| lifetimeSpent | INTEGER | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `billingDisputes`

PostgreSQL: `billing_disputes` · 13 columns · 3 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| invoiceId | UUID | FK → `userInvoices.id` (SET NULL) |
| userId | UUID | FK → `users.id` (SET NULL) |
| amountCents | INTEGER | NOT NULL |
| description | TEXT | — |
| evidenceDueDate | TIMESTAMP | — |
| respondedAt | TIMESTAMP | — |
| resolvedAt | TIMESTAMP | — |
| assignedTo | UUID | FK → `users.id` (SET NULL) |
| internalNotes | TEXT | — |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `disputeEvidence.disputeId`

### `billingPreferences`

PostgreSQL: `billing_preferences` · 11 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| autoRenew | BOOLEAN | — |
| billingAddress | TEXT | — |
| notifyInvoice | BOOLEAN | — |
| notifyUsageAlerts | BOOLEAN | — |
| notifyPlanChanges | BOOLEAN | — |
| notifyPaymentFailures | BOOLEAN | — |
| usageAlertThreshold | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `billingReferrals`

PostgreSQL: `billing_referrals` · 8 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| referrerUserId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| referredUserId | UUID | FK → `users.id` (SET NULL) |
| rewardCredits | INTEGER | — |
| rewardedAt | TIMESTAMP | — |
| signedUpAt | TIMESTAMP | — |
| subscribedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

### `billingScenarios`

PostgreSQL: `billing_scenarios` · 11 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| parameters | JSONB | NOT NULL |
| baselineMetrics | JSONB | — |
| projectedMetrics | JSONB | — |
| impactSummary | JSONB | — |
| confidenceLevel | REAL | — |
| isFavorite | BOOLEAN | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `coupons`

PostgreSQL: `coupons` · 12 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| discountValue | INTEGER | NOT NULL |
| maxUses | INTEGER | — |
| usedCount | INTEGER | — |
| validFrom | TIMESTAMP | NOT NULL |
| validUntil | TIMESTAMP | — |
| applicablePlanIds | JSONB | — |
| isActive | BOOLEAN | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `creditTransactions`

PostgreSQL: `credit_transactions` · 7 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| amountCredits | INTEGER | NOT NULL |
| balanceBefore | INTEGER | NOT NULL |
| balanceAfter | INTEGER | NOT NULL |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

### `featureAlertRules`

PostgreSQL: `feature_alert_rules` · 8 columns · 0 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| conditionConfig | JSONB | NOT NULL |
| actionConfig | JSONB | — |
| isActive | BOOLEAN | — |
| createdBy | UUID | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `featureAlerts.ruleId`

### `featureAlerts`

PostgreSQL: `feature_alerts` · 7 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| ruleId | UUID | FK → `featureAlertRules.id` (SET NULL) |
| message | TEXT | — |
| metadata | JSONB | — |
| resolvedAt | TIMESTAMP | — |
| resolvedBy | UUID | — |
| createdAt | TIMESTAMP | NOT NULL |

### `featureCategories`

PostgreSQL: `feature_categories` · 4 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| sortOrder | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |

### `featureChangelog`

PostgreSQL: `feature_changelog` · 4 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| details | JSONB | — |
| userId | UUID | — |
| createdAt | TIMESTAMP | NOT NULL |

### `featureDependencies`

PostgreSQL: `feature_dependencies` · 2 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| createdAt | TIMESTAMP | NOT NULL |

### `featureEntitlements`

PostgreSQL: `feature_entitlements` · 6 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| planId | UUID | NOT NULL, FK → `plans.id` (CASCADE) |
| enabled | BOOLEAN | — |
| monthlyCap | INTEGER | — |
| overageUnitCents | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |

### `featureExperiments`

PostgreSQL: `feature_experiments` · 12 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| hypothesis | TEXT | — |
| variants | JSONB | — |
| confidenceLevel | INTEGER | — |
| minimumSampleSize | INTEGER | — |
| statisticalSignificance | INTEGER | — |
| totalParticipants | INTEGER | — |
| startDate | TIMESTAMP | — |
| endDate | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `featureFlags`

PostgreSQL: `feature_flags` · 7 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| rolloutPercentage | INTEGER | — |
| targetAudience | JSONB | — |
| isEnabled | BOOLEAN | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `featureGovernanceAuditLog`

PostgreSQL: `feature_governance_audit_log` · 4 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| details | TEXT | — |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

### `featureGovernancePolicies`

PostgreSQL: `feature_governance_policies` · 8 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| enforced | BOOLEAN | — |
| autoCheck | BOOLEAN | — |
| conditionConfig | JSONB | — |
| lastTriggered | TIMESTAMP | — |
| triggerCount | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |

### `featureGovernanceRequests`

PostgreSQL: `feature_governance_requests` · 8 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| reviewers | JSONB | — |
| impactAssessment | JSONB | — |
| gates | JSONB | — |
| reviewNote | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `featurePricingSimulations`

PostgreSQL: `feature_pricing_simulations` · 7 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| targetPlans | JSONB | — |
| scenarios | JSONB | — |
| results | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `featureRequests`

PostgreSQL: `feature_requests` · 7 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| requestedBy | UUID | FK → `users.id` (SET NULL) |
| votes | INTEGER | — |
| adminNotes | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `featureVersions`

PostgreSQL: `feature_versions` · 4 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| changes | JSONB | NOT NULL |
| changedBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |

### `features`

PostgreSQL: `features` · 4 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| description | TEXT | — |
| stageChangedAt | TIMESTAMP | — |
| rolloutPercent | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |

### `invoiceMilestones`

PostgreSQL: `invoice_milestones` · 6 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| placementId | UUID | NOT NULL |
| amount | INTEGER | NOT NULL |
| dueDate | TIMESTAMP | — |
| paidDate | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

### `paymentEvents`

PostgreSQL: `payment_events` · 4 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| payload | JSONB | — |
| processed | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |

### `paymentGateways`

PostgreSQL: `payment_gateways` · 14 columns · 0 FK out · 2 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| isDefault | BOOLEAN | — |
| priority | INTEGER | — |
| healthScore | INTEGER | — |
| lastHealthCheck | TIMESTAMP | — |
| supportedCurrencies | JSONB | — |
| supportedMethods | JSONB | — |
| config | JSONB | — |
| monthlyVolumeCents | INTEGER | — |
| monthlyTransactions | INTEGER | — |
| successRate | REAL | — |
| avgResponseMs | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `gatewayRoutingRules.gatewayId`, `gatewayHealthLogs.gatewayId`

### `planAbTests`

PostgreSQL: `plan_ab_tests` · 19 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| planId | UUID | FK → `plans.id` |
| controlPrice | INTEGER | NOT NULL |
| variantPrice | INTEGER | NOT NULL |
| trafficSplit | INTEGER | — |
| startDate | TIMESTAMP | — |
| endDate | TIMESTAMP | — |
| controlImpressions | INTEGER | — |
| controlConversions | INTEGER | — |
| controlRevenue | INTEGER | — |
| variantImpressions | INTEGER | — |
| variantConversions | INTEGER | — |
| variantRevenue | INTEGER | — |
| confidenceLevel | REAL | — |
| liftPercent | REAL | — |
| createdBy | UUID | FK → `users.id` |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `planAuditLog`

PostgreSQL: `plan_audit_log` · 6 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| planId | UUID | FK → `plans.id` |
| changes | JSONB | — |
| performedBy | UUID | FK → `users.id` |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

### `planEvents`

PostgreSQL: `plan_events` · 7 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| subscriptionId | UUID | FK → `subscriptions.id` |
| holderId | UUID | NOT NULL |
| fromPlanId | UUID | FK → `plans.id` |
| toPlanId | UUID | FK → `plans.id` |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

### `planHealthMetrics`

PostgreSQL: `plan_health_metrics` · 20 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| planId | UUID | NOT NULL, FK → `plans.id` |
| overallScore | INTEGER | NOT NULL |
| revenueScore | INTEGER | — |
| adoptionScore | INTEGER | — |
| retentionScore | INTEGER | — |
| satisfactionScore | INTEGER | — |
| featureUtilizationScore | INTEGER | — |
| competitivenessScore | INTEGER | — |
| activeSubscribers | INTEGER | — |
| mrr | INTEGER | — |
| churnRate | REAL | — |
| avgRevenuePerUser | INTEGER | — |
| npsScore | REAL | — |
| featureAdoptionRate | REAL | — |
| upgradeRate | REAL | — |
| downgradeRate | REAL | — |
| issues | JSONB | — |
| calculatedAt | TIMESTAMP | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |

### `planRecommendations`

PostgreSQL: `plan_recommendations` · 10 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| planId | UUID | FK → `plans.id` |
| description | TEXT | — |
| impact | TEXT | — |
| currentValue | TEXT | — |
| suggestedValue | TEXT | — |
| estimatedRevenueDelta | INTEGER | — |
| resolvedAt | TIMESTAMP | — |
| resolvedBy | UUID | FK → `users.id` |
| createdAt | TIMESTAMP | NOT NULL |

### `plans`

PostgreSQL: `plans` · 10 columns · 0 FK out · 9 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| priceCents | INTEGER | NOT NULL |
| version | INTEGER | — |
| isActive | BOOLEAN | — |
| sunsetAt | TIMESTAMP | — |
| sunsetTargetPlanId | UUID | — |
| parentPlanId | UUID | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `featureEntitlements.planId`, `subscriptions.planId`, `planEvents.fromPlanId`, `planEvents.toPlanId`, `planAuditLog.planId`, `planAbTests.planId`, `planRecommendations.planId`, `planHealthMetrics.planId` +1 more

### `pricingExperiments`

PostgreSQL: `pricing_experiments` · 11 columns · 1 FK out · 2 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| hypothesis | TEXT | — |
| startDate | TIMESTAMP | — |
| endDate | TIMESTAMP | — |
| minSampleSize | INTEGER | — |
| confidenceLevel | REAL | — |
| winnerVariantId | UUID | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `pricingVariants.experimentId`, `experimentEvents.experimentId`

### `pricingScenarios`

PostgreSQL: `pricing_scenarios` · 7 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| changes | JSONB | NOT NULL |
| projections | JSONB | — |
| createdBy | UUID | FK → `users.id` |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `pricingVariants`

PostgreSQL: `pricing_variants` · 12 columns · 2 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| experimentId | UUID | NOT NULL, FK → `pricingExperiments.id` (CASCADE) |
| isControl | BOOLEAN | — |
| planId | UUID | FK → `plans.id` (SET NULL) |
| priceCents | INTEGER | NOT NULL |
| trafficPercent | INTEGER | — |
| impressions | INTEGER | — |
| conversions | INTEGER | — |
| revenue | INTEGER | — |
| avgOrderValue | INTEGER | — |
| churnCount | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |

**Referenced by:** `experimentEvents.variantId`

### `revenueAnomalies`

PostgreSQL: `revenue_anomalies` · 15 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| expectedValue | REAL | — |
| actualValue | REAL | — |
| deviationPercent | REAL | — |
| description | TEXT | NOT NULL |
| affectedCount | INTEGER | — |
| estimatedImpactCents | INTEGER | — |
| rootCause | TEXT | — |
| recommendation | TEXT | — |
| autoResolved | BOOLEAN | — |
| acknowledgedAt | TIMESTAMP | — |
| acknowledgedBy | UUID | — |
| resolvedAt | TIMESTAMP | — |
| detectedAt | TIMESTAMP | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |

### `revenueLeakageFindings`

PostgreSQL: `revenue_leakage_findings` · 10 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | NOT NULL |
| estimatedLossCents | INTEGER | — |
| affectedCustomers | INTEGER | — |
| recommendation | TEXT | — |
| actionedAt | TIMESTAMP | — |
| actionedBy | UUID | — |
| evidence | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `revenueRecognitionEntries`

PostgreSQL: `revenue_recognition_entries` · 11 columns · 3 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| invoiceId | UUID | FK → `userInvoices.id` (SET NULL) |
| subscriptionId | UUID | FK → `subscriptions.id` (SET NULL) |
| ruleId | UUID | FK → `revenueRecognitionRules.id` (SET NULL) |
| totalAmountCents | INTEGER | NOT NULL |
| recognizedAmountCents | INTEGER | — |
| deferredAmountCents | INTEGER | — |
| recognitionStartDate | TIMESTAMP | NOT NULL |
| recognitionEndDate | TIMESTAMP | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `revenueRecognitionSchedule.entryId`

### `revenueRecognitionRules`

PostgreSQL: `revenue_recognition_rules` · 6 columns · 0 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| recognitionPeriodDays | INTEGER | — |
| isActive | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `revenueRecognitionEntries.ruleId`

### `revenueRecognitionSchedule`

PostgreSQL: `revenue_recognition_schedule` · 8 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| entryId | UUID | NOT NULL, FK → `revenueRecognitionEntries.id` (CASCADE) |
| periodStart | TIMESTAMP | NOT NULL |
| periodEnd | TIMESTAMP | NOT NULL |
| amountCents | INTEGER | NOT NULL |
| recognized | BOOLEAN | — |
| recognizedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

### `revenueSnapshots`

PostgreSQL: `revenue_snapshots` · 16 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| date | TIMESTAMP | NOT NULL |
| totalMrr | INTEGER | NOT NULL |
| totalArr | INTEGER | — |
| newMrr | INTEGER | — |
| expansionMrr | INTEGER | — |
| contractionMrr | INTEGER | — |
| churnMrr | INTEGER | — |
| reactivationMrr | INTEGER | — |
| netNewMrr | INTEGER | — |
| totalSubscribers | INTEGER | — |
| newSubscribers | INTEGER | — |
| churnedSubscribers | INTEGER | — |
| arpu | INTEGER | — |
| ltv | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |

### `subscriptions`

PostgreSQL: `subscriptions` · 8 columns · 1 FK out · 4 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| planId | UUID | NOT NULL, FK → `plans.id` |
| holderId | UUID | NOT NULL |
| currentPeriodStart | TIMESTAMP | — |
| currentPeriodEnd | TIMESTAMP | — |
| cancelledAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `userInvoices.subscriptionId`, `planEvents.subscriptionId`, `campaignRedemptions.subscriptionId`, `revenueRecognitionEntries.subscriptionId`

### `usage`

PostgreSQL: `usage` · 7 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| holderId | UUID | NOT NULL |
| periodStart | TIMESTAMP | NOT NULL |
| periodEnd | TIMESTAMP | NOT NULL |
| used | INTEGER | — |
| extraAllowance | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |

### `usageAlerts`

PostgreSQL: `usage_alerts` · 10 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| meterId | UUID | NOT NULL, FK → `usageMeterDefinitions.id` (CASCADE) |
| holderId | UUID | NOT NULL |
| currentValue | REAL | NOT NULL |
| thresholdValue | REAL | NOT NULL |
| percentUsed | REAL | — |
| message | TEXT | — |
| acknowledgedAt | TIMESTAMP | — |
| acknowledgedBy | UUID | — |
| createdAt | TIMESTAMP | NOT NULL |

### `usageAnalytics`

PostgreSQL: `usage_analytics` · 5 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | FK → `users.id` (SET NULL) |
| organizationId | UUID | FK → `organizations.id` (SET NULL) |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

### `usageMeterDefinitions`

PostgreSQL: `usage_meter_definitions` · 6 columns · 0 FK out · 2 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| alertThresholdPercent | INTEGER | — |
| isActive | BOOLEAN | — |
| description | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `usageMeterEvents.meterId`, `usageAlerts.meterId`

### `usageMeterEvents`

PostgreSQL: `usage_meter_events` · 7 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| meterId | UUID | NOT NULL, FK → `usageMeterDefinitions.id` (CASCADE) |
| holderId | UUID | NOT NULL |
| value | REAL | NOT NULL |
| timestamp | TIMESTAMP | NOT NULL |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

## Client Management

**14 tables** — Recruiter corporate client CRM: contacts, engagements, revenue, meetings.

### `approvedVendors`

PostgreSQL: `approved_vendors` · 5 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| rate | REAL | — |
| ndaSigned | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |

### `clientDocuments`

PostgreSQL: `client_documents` · 9 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| clientId | UUID | NOT NULL, FK → `corporateClients.id` (CASCADE) |
| organizationId | UUID | NOT NULL |
| uploadedBy | UUID | NOT NULL |
| description | TEXT | — |
| fileUrl | TEXT | — |
| fileSize | INTEGER | — |
| expiresAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

### `clientMeetings`

PostgreSQL: `client_meetings` · 13 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| clientId | UUID | NOT NULL, FK → `corporateClients.id` (CASCADE) |
| organizationId | UUID | NOT NULL |
| createdBy | UUID | NOT NULL |
| description | TEXT | — |
| isVirtual | BOOLEAN | — |
| meetingUrl | TEXT | — |
| scheduledAt | TIMESTAMP | NOT NULL |
| duration | INTEGER | — |
| outcome | TEXT | — |
| attendees | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `clientNotes`

PostgreSQL: `client_notes` · 9 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| clientId | UUID | NOT NULL, FK → `corporateClients.id` (CASCADE) |
| organizationId | UUID | NOT NULL |
| authorId | UUID | NOT NULL |
| content | TEXT | NOT NULL |
| isPinned | BOOLEAN | — |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `clientPipeline`

PostgreSQL: `client_pipeline` · 13 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL |
| clientId | UUID | NOT NULL |
| stageChangedAt | TIMESTAMP | — |
| assignedTo | UUID | — |
| notes | TEXT | — |
| expectedRevenue | INTEGER | — |
| probability | INTEGER | — |
| nextAction | TEXT | — |
| nextActionDate | TIMESTAMP | — |
| lostReason | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `clientPipelineActivities`

PostgreSQL: `client_pipeline_activities` · 7 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| pipelineId | UUID | NOT NULL |
| organizationId | UUID | NOT NULL |
| description | TEXT | — |
| performedBy | UUID | — |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

### `clientPipelineStageHistory`

PostgreSQL: `client_pipeline_stage_history` · 6 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| pipelineId | UUID | NOT NULL |
| organizationId | UUID | NOT NULL |
| changedBy | UUID | — |
| durationInStage | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |

### `clientPipelineTasks`

PostgreSQL: `client_pipeline_tasks` · 9 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| pipelineId | UUID | NOT NULL |
| organizationId | UUID | NOT NULL |
| description | TEXT | — |
| dueDate | TIMESTAMP | — |
| assignedTo | UUID | — |
| completedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `clientRevenue`

PostgreSQL: `client_revenue` · 7 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| clientId | UUID | NOT NULL, FK → `corporateClients.id` (CASCADE) |
| organizationId | UUID | NOT NULL |
| amount | INTEGER | NOT NULL |
| date | TIMESTAMP | — |
| jobId | UUID | — |
| createdAt | TIMESTAMP | NOT NULL |

### `clientSatisfaction`

PostgreSQL: `client_satisfaction` · 7 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| clientId | UUID | NOT NULL, FK → `corporateClients.id` (CASCADE) |
| organizationId | UUID | NOT NULL |
| recordedBy | UUID | NOT NULL |
| score | INTEGER | NOT NULL |
| feedback | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

### `clientTags`

PostgreSQL: `client_tags` · 2 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| clientId | UUID | NOT NULL, FK → `corporateClients.id` (CASCADE) |

### `corporateClientContacts`

PostgreSQL: `corporate_client_contacts` · 5 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| clientId | UUID | NOT NULL, FK → `corporateClients.id` (CASCADE) |
| whatsappConsent | BOOLEAN | — |
| isPrimary | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |

### `corporateClientEngagements`

PostgreSQL: `corporate_client_engagements` · 7 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| clientId | UUID | NOT NULL, FK → `corporateClients.id` (CASCADE) |
| feePercent | REAL | — |
| retainerAmount | INTEGER | — |
| startDate | TIMESTAMP | — |
| endDate | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

### `corporateClients`

PostgreSQL: `corporate_clients` · 7 columns · 1 FK out · 8 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| agencyOrganizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| rating | REAL | — |
| website | TEXT | — |
| notes | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `corporateClientContacts.clientId`, `corporateClientEngagements.clientId`, `clientNotes.clientId`, `clientDocuments.clientId`, `clientTags.clientId`, `clientMeetings.clientId`, `clientRevenue.clientId`, `clientSatisfaction.clientId`

## Screening

**20 tables** — AI-powered screening jobs, evaluations, bots, culture-fit assessments.

### `cultureFitAssessments`

PostgreSQL: `culture_fit_assessments` · 27 columns · 2 FK out · 2 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| recruiterId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| organizationId | UUID | FK → `organizations.id` (SET NULL) |
| candidateExperience | TEXT | — |
| candidateInterviewResponses | TEXT | — |
| candidateValues | TEXT | — |
| companyCulture | TEXT | — |
| companyValues | TEXT | — |
| companyTeamDynamics | TEXT | — |
| templateId | UUID | — |
| fitScore | INTEGER | — |
| alignments | JSONB | — |
| concerns | JSONB | — |
| recommendations | JSONB | — |
| biasAnalysis | JSONB | — |
| interviewQuestions | JSONB | — |
| onboardingPlan | JSONB | — |
| teamCompatibility | JSONB | — |
| dimensionWeights | JSONB | — |
| archetypeResult | JSONB | — |
| clashSimulation | JSONB | — |
| retentionRisk | JSONB | — |
| tags | JSONB | — |
| notes | TEXT | — |
| isFavorite | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `cultureFitInterviewerScores.assessmentId`, `cultureFitDNAProfiles.assessmentId`

### `cultureFitDNAProfiles`

PostgreSQL: `culture_fit_dna_profiles` · 16 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| recruiterId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| organizationId | UUID | FK → `organizations.id` (SET NULL) |
| assessmentId | UUID | FK → `cultureFitAssessments.id` (CASCADE) |
| strands | JSONB | — |
| dominantTraits | JSONB | — |
| culturalGenome | JSONB | — |
| uniquenessScore | INTEGER | — |
| matchPattern | TEXT | — |
| personalitySummary | TEXT | — |
| workEnvironmentFit | JSONB | — |
| leadershipStyle | JSONB | — |
| motivationDrivers | JSONB | — |
| blindSpots | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `cultureFitInterviewerScores`

PostgreSQL: `culture_fit_interviewer_scores` · 14 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| recruiterId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| organizationId | UUID | FK → `organizations.id` (SET NULL) |
| assessmentId | UUID | FK → `cultureFitAssessments.id` (CASCADE) |
| interviewDate | TIMESTAMP | — |
| dimensionScores | JSONB | — |
| overallScore | INTEGER | — |
| overallImpression | TEXT | — |
| notes | TEXT | — |
| strengths | JSONB | — |
| concerns | JSONB | — |
| aggregationResult | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `cultureFitTeamProfiles`

PostgreSQL: `culture_fit_team_profiles` · 12 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| recruiterId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| organizationId | UUID | FK → `organizations.id` (SET NULL) |
| templateId | UUID | FK → `cultureFitTemplates.id` (SET NULL) |
| workStyle | TEXT | — |
| communicationStyle | TEXT | — |
| values | TEXT | — |
| strengths | JSONB | — |
| preferences | JSONB | — |
| cultureScores | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `cultureFitTemplates`

PostgreSQL: `culture_fit_templates` · 13 columns · 2 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| recruiterId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| organizationId | UUID | FK → `organizations.id` (SET NULL) |
| description | TEXT | — |
| culture | TEXT | NOT NULL |
| values | TEXT | — |
| teamDynamics | TEXT | — |
| dimensionWeights | JSONB | — |
| customDimensions | JSONB | — |
| isDefault | BOOLEAN | — |
| usageCount | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `cultureFitTeamProfiles.templateId`

### `screeningActivityLog`

PostgreSQL: `screening_activity_log` · 5 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| screeningJobId | UUID | NOT NULL, FK → `screeningJobs.id` (CASCADE) |
| userId | UUID | FK → `users.id` (SET NULL) |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

### `screeningAgentResults`

PostgreSQL: `screening_agent_results` · 14 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| screeningJobId | UUID | NOT NULL, FK → `screeningJobs.id` (CASCADE) |
| screeningCandidateId | UUID | NOT NULL, FK → `screeningCandidates.id` (CASCADE) |
| screeningEvaluationId | UUID | FK → `screeningEvaluations.id` (CASCADE) |
| score | REAL | — |
| confidence | REAL | — |
| breakdown | JSONB | — |
| flags | JSONB | — |
| reasoning | TEXT | — |
| metadata | JSONB | — |
| durationMs | INTEGER | — |
| errorMessage | TEXT | — |
| aiTokensUsed | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |

### `screeningBotCampaigns`

PostgreSQL: `screening_bot_campaigns` · 16 columns · 3 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| templateId | UUID | FK → `screeningBotTemplates.id` (SET NULL) |
| qualifyingCriteria | JSONB | — |
| candidates | JSONB | — |
| totalInvited | INTEGER | — |
| totalCompleted | INTEGER | — |
| totalShortlisted | INTEGER | — |
| avgScore | REAL | — |
| completionRate | REAL | — |
| selfServiceExpiry | TIMESTAMP | — |
| welcomeMessage | TEXT | — |
| reminderEnabled | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `screeningBotSelfServiceLinks.campaignId`

### `screeningBotPlaybooks`

PostgreSQL: `screening_bot_playbooks` · 12 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| description | TEXT | — |
| stages | JSONB | — |
| totalStages | INTEGER | — |
| requireSequential | BOOLEAN | — |
| autoAdvance | BOOLEAN | — |
| autoRejectThreshold | INTEGER | — |
| usageCount | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `screeningBotQuestionBanks`

PostgreSQL: `screening_bot_question_banks` · 8 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| questions | JSONB | — |
| isPublic | BOOLEAN | — |
| usageCount | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `screeningBotSelfServiceLinks`

PostgreSQL: `screening_bot_self_service_links` · 12 columns · 4 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| templateId | UUID | FK → `screeningBotTemplates.id` (SET NULL) |
| campaignId | UUID | FK → `screeningBotCampaigns.id` (SET NULL) |
| qualifyingCriteria | JSONB | — |
| welcomeMessage | TEXT | — |
| maxUses | INTEGER | — |
| usedCount | INTEGER | — |
| isActive | BOOLEAN | — |
| expiresAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

### `screeningBotSessions`

PostgreSQL: `screening_bot_sessions` · 23 columns · 4 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| recruiterId | UUID | FK → `users.id` (SET NULL) |
| templateId | UUID | FK → `screeningBotTemplates.id` (SET NULL) |
| screeningJobId | UUID | FK → `screeningJobs.id` (SET NULL) |
| messages | JSONB | — |
| qualifyingCriteria | JSONB | — |
| knockoutResults | JSONB | — |
| scoreTotal | REAL | — |
| scoreBreakdown | JSONB | — |
| summary | TEXT | — |
| aiReasoning | TEXT | — |
| sentimentAnalysis | JSONB | — |
| redFlags | JSONB | — |
| greenFlags | JSONB | — |
| duration | INTEGER | — |
| questionCount | INTEGER | — |
| tags | JSONB | — |
| notes | TEXT | — |
| followUpScheduled | BOOLEAN | — |
| followUpDate | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| completedAt | TIMESTAMP | — |

### `screeningBotTemplates`

PostgreSQL: `screening_bot_templates` · 18 columns · 2 FK out · 3 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| description | TEXT | — |
| qualifyingCriteria | JSONB | — |
| knockoutQuestions | JSONB | — |
| questionBank | JSONB | — |
| scoringWeights | JSONB | — |
| maxQuestions | INTEGER | — |
| timeoutMinutes | INTEGER | — |
| welcomeMessage | TEXT | — |
| completionMessage | TEXT | — |
| isPublic | BOOLEAN | — |
| usageCount | INTEGER | — |
| avgScore | REAL | — |
| passRate | REAL | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `screeningBotSessions.templateId`, `screeningBotCampaigns.templateId`, `screeningBotSelfServiceLinks.templateId`

### `screeningCandidates`

PostgreSQL: `screening_candidates` · 8 columns · 2 FK out · 3 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| screeningJobId | UUID | NOT NULL, FK → `screeningJobs.id` (CASCADE) |
| candidateId | UUID | FK → `candidates.id` (SET NULL) |
| skills | JSONB | — |
| experience | JSONB | — |
| rawCvText | TEXT | — |
| resumeUrl | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

**Referenced by:** `screeningEvaluations.screeningCandidateId`, `screeningNotes.screeningCandidateId`, `screeningAgentResults.screeningCandidateId`

### `screeningEvaluations`

PostgreSQL: `screening_evaluations` · 11 columns · 2 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| screeningJobId | UUID | NOT NULL, FK → `screeningJobs.id` (CASCADE) |
| screeningCandidateId | UUID | NOT NULL, FK → `screeningCandidates.id` (CASCADE) |
| scoreTotal | REAL | — |
| scoreBreakdown | JSONB | — |
| knockout | JSONB | — |
| flags | JSONB | — |
| rank | INTEGER | — |
| aiReasoning | TEXT | — |
| orchestrationRunId | UUID | — |
| createdAt | TIMESTAMP | NOT NULL |

**Referenced by:** `screeningAgentResults.screeningEvaluationId`

### `screeningJobs`

PostgreSQL: `screening_jobs` · 15 columns · 2 FK out · 8 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (SET NULL) |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| description | TEXT | — |
| salaryMin | INTEGER | — |
| salaryMax | INTEGER | — |
| minExperienceYears | INTEGER | — |
| maxExperienceYears | INTEGER | — |
| notes | TEXT | — |
| mustHaveSkills | JSONB | — |
| niceToHaveSkills | JSONB | — |
| knockouts | JSONB | — |
| weights | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `screeningCandidates.screeningJobId`, `screeningEvaluations.screeningJobId`, `screeningNotes.screeningJobId`, `screeningActivityLog.screeningJobId`, `screeningShareLinks.screeningJobId`, `screeningBotSessions.screeningJobId`, `screeningAgentResults.screeningJobId`, `screeningOrchestrationRuns.screeningJobId`

### `screeningNotes`

PostgreSQL: `screening_notes` · 6 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| screeningJobId | UUID | NOT NULL, FK → `screeningJobs.id` (CASCADE) |
| screeningCandidateId | UUID | FK → `screeningCandidates.id` (CASCADE) |
| userId | UUID | FK → `users.id` (SET NULL) |
| content | TEXT | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |

### `screeningOrchestrationRuns`

PostgreSQL: `screening_orchestration_runs` · 10 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| screeningJobId | UUID | NOT NULL, FK → `screeningJobs.id` (CASCADE) |
| triggeredBy | UUID | FK → `users.id` (SET NULL) |
| totalCandidates | INTEGER | — |
| completedCandidates | INTEGER | — |
| failedCandidates | INTEGER | — |
| agentConfig | JSONB | — |
| startedAt | TIMESTAMP | — |
| completedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

### `screeningShareLinks`

PostgreSQL: `screening_share_links` · 5 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| screeningJobId | UUID | NOT NULL, FK → `screeningJobs.id` (CASCADE) |
| expiresAt | TIMESTAMP | NOT NULL |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |

### `screenings`

PostgreSQL: `screenings` · 10 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| roleId | UUID | NOT NULL, FK → `roles.id` (CASCADE) |
| candidateId | UUID | NOT NULL, FK → `candidates.id` (CASCADE) |
| scoreTotal | REAL | — |
| scoreBreakdown | JSONB | — |
| knockout | JSONB | — |
| flags | JSONB | — |
| rank | INTEGER | — |
| aiReasoning | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

## Assessments & Testing

**17 tables** — Competency tests, question banks, attempts, invitations, templates.

### `assessmentBenchmarks`

PostgreSQL: `assessment_benchmarks` · 3 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | SERIAL | PK |
| score | INTEGER | NOT NULL |
| recordedAt | TIMESTAMP | NOT NULL |

### `assessmentBundleItems`

PostgreSQL: `assessment_bundle_items` · 11 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | SERIAL | PK |
| bundleId | UUID | NOT NULL, FK → `assessmentBundles.id` (CASCADE) |
| templateId | INTEGER | FK → `testLibraryTemplates.id` |
| testId | UUID | FK → `competencyTests.id` |
| stageNumber | INTEGER | NOT NULL |
| weight | INTEGER | — |
| isRequired | BOOLEAN | — |
| isEliminatory | BOOLEAN | — |
| minimumScore | INTEGER | — |
| sortOrder | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |

### `assessmentBundles`

PostgreSQL: `assessment_bundles` · 10 columns · 1 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| organizationId | UUID | NOT NULL |
| createdBy | UUID | NOT NULL, FK → `users.id` |
| estimatedTotalMinutes | INTEGER | — |
| minimumPassingScore | INTEGER | — |
| isPublic | BOOLEAN | — |
| usageCount | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `assessmentBundleItems.bundleId`

### `assessmentInvitations`

PostgreSQL: `assessment_invitations` · 10 columns · 4 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| testId | UUID | NOT NULL, FK → `competencyTests.id` (CASCADE) |
| jobId | UUID | FK → `jobs.id` (SET NULL) |
| deadline | TIMESTAMP | — |
| sentAt | TIMESTAMP | — |
| openedAt | TIMESTAMP | — |
| completedAt | TIMESTAMP | — |
| attemptId | UUID | FK → `testAttempts.id` (SET NULL) |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |

**Referenced by:** `aiInterviewSessions.invitationId`

### `competencyTests`

PostgreSQL: `competency_tests` · 17 columns · 2 FK out · 8 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (SET NULL) |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| description | TEXT | — |
| durationMinutes | INTEGER | — |
| passingScore | REAL | — |
| antiCheatConfig | JSONB | — |
| tags | JSONB | — |
| deadline | TIMESTAMP | — |
| templateId | UUID | — |
| totalInvitations | INTEGER | — |
| completedAttempts | INTEGER | — |
| libraryTemplateId | INTEGER | — |
| isSaRecommended | BOOLEAN | — |
| isFromLibrary | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `testSections.testId`, `testAttempts.testId`, `assessmentInvitations.testId`, `testLibraryUsage.testId`, `aiInterviewSessions.testId`, `whatsappConversations.currentTestId`, `whatsappAssessmentSessions.testId`, `assessmentBundleItems.testId`

### `customTemplates`

PostgreSQL: `custom_templates` · 14 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| createdBy | UUID | NOT NULL |
| organizationId | UUID | — |
| description | TEXT | — |
| durationMinutes | INTEGER | — |
| questionCount | INTEGER | — |
| tags | JSONB | — |
| questions | JSONB | — |
| version | INTEGER | — |
| isActive | BOOLEAN | — |
| cloneCount | INTEGER | — |
| lastUsedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `testAttempts`

PostgreSQL: `test_attempts` · 15 columns · 1 FK out · 4 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| testId | UUID | NOT NULL, FK → `competencyTests.id` (CASCADE) |
| candidateId | UUID | — |
| overallScore | REAL | — |
| maxScore | REAL | — |
| fraudScore | REAL | — |
| fullscreenExits | INTEGER | — |
| tabSwitches | INTEGER | — |
| copyPasteAttempts | INTEGER | — |
| saPercentile | INTEGER | — |
| integrityScore | INTEGER | — |
| questionTimeData | JSONB | — |
| startedAt | TIMESTAMP | NOT NULL |
| completedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

**Referenced by:** `testResponses.attemptId`, `assessmentInvitations.attemptId`, `candidateCredentials.attemptId`, `whatsappAssessmentSessions.attemptId`

### `testItems`

PostgreSQL: `test_items` · 9 columns · 1 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| sectionId | UUID | NOT NULL, FK → `testSections.id` (CASCADE) |
| stem | TEXT | NOT NULL |
| options | JSONB | — |
| correctAnswer | JSONB | — |
| rubric | TEXT | — |
| points | REAL | — |
| order | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |

**Referenced by:** `testResponses.itemId`

### `testLibraryFavorites`

PostgreSQL: `test_library_favorites` · 5 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | SERIAL | PK |
| templateId | INTEGER | NOT NULL, FK → `testLibraryTemplates.id` (CASCADE) |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| notes | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

### `testLibraryQuestions`

PostgreSQL: `test_library_questions` · 12 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | SERIAL | PK |
| templateId | INTEGER | NOT NULL, FK → `testLibraryTemplates.id` (CASCADE) |
| stem | TEXT | NOT NULL |
| options | JSONB | — |
| correctAnswer | TEXT | — |
| explanation | TEXT | — |
| rubric | TEXT | — |
| points | INTEGER | — |
| codeStarterCode | TEXT | — |
| isPersonality | BOOLEAN | — |
| sortOrder | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |

### `testLibraryRatings`

PostgreSQL: `test_library_ratings` · 11 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | SERIAL | PK |
| templateId | INTEGER | NOT NULL, FK → `testLibraryTemplates.id` (CASCADE) |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| rating | INTEGER | NOT NULL |
| review | TEXT | — |
| effectiveness | INTEGER | — |
| relevance | INTEGER | — |
| wouldRecommend | BOOLEAN | — |
| helpfulCount | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `testLibraryTemplates`

PostgreSQL: `test_library_templates` · 17 columns · 0 FK out · 7 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | SERIAL | PK |
| description | TEXT | NOT NULL |
| testFocus | JSONB | NOT NULL |
| skillsFor | JSONB | — |
| durationMinutes | INTEGER | NOT NULL |
| questionCount | INTEGER | NOT NULL |
| tags | JSONB | — |
| isPopular | BOOLEAN | — |
| isFree | BOOLEAN | — |
| isNew | BOOLEAN | — |
| isSaRecommended | BOOLEAN | — |
| saIndustries | JSONB | — |
| nqfLevel | INTEGER | — |
| isActive | BOOLEAN | — |
| sortOrder | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `testLibraryQuestions.templateId`, `testLibraryUsage.templateId`, `candidateCredentials.templateId`, `testLibraryRatings.templateId`, `testLibraryFavorites.templateId`, `assessmentBundleItems.templateId`, `testLibraryViews.templateId`

### `testLibraryUsage`

PostgreSQL: `test_library_usage` · 5 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | SERIAL | PK |
| templateId | INTEGER | NOT NULL, FK → `testLibraryTemplates.id` |
| recruiterId | UUID | NOT NULL, FK → `users.id` |
| testId | UUID | NOT NULL, FK → `competencyTests.id` |
| usedAt | TIMESTAMP | NOT NULL |

### `testLibraryViews`

PostgreSQL: `test_library_views` · 4 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | SERIAL | PK |
| templateId | INTEGER | NOT NULL, FK → `testLibraryTemplates.id` (CASCADE) |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| viewedAt | TIMESTAMP | NOT NULL |

### `testResponses`

PostgreSQL: `test_responses` · 8 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| attemptId | UUID | NOT NULL, FK → `testAttempts.id` (CASCADE) |
| itemId | UUID | NOT NULL, FK → `testItems.id` (CASCADE) |
| response | JSONB | — |
| isCorrect | BOOLEAN | — |
| pointsAwarded | REAL | — |
| timeTakenSeconds | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |

### `testSections`

PostgreSQL: `test_sections` · 5 columns · 1 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| testId | UUID | NOT NULL, FK → `competencyTests.id` (CASCADE) |
| weight | REAL | — |
| order | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |

**Referenced by:** `testItems.sectionId`

### `testTemplates`

PostgreSQL: `test_templates` · 8 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| durationMinutes | INTEGER | — |
| questionCount | INTEGER | — |
| tags | JSONB | — |
| questions | JSONB | — |
| isActive | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |

## Interviews & Scheduling

**18 tables** — Interview scheduling, video rooms, pools, rounds, scorecards.

### `holds`

PostgreSQL: `holds` · 6 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| startTime | TIMESTAMP | NOT NULL |
| endTime | TIMESTAMP | NOT NULL |
| reason | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

### `interviewFeedback`

PostgreSQL: `interview_feedback` · 13 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| applicationId | UUID | FK → `jobApplications.id` (CASCADE) |
| npsScore | INTEGER | — |
| overallRating | INTEGER | — |
| communicationRating | INTEGER | — |
| processRating | INTEGER | — |
| interviewerRating | INTEGER | — |
| wouldRecommend | BOOLEAN | — |
| feedback | TEXT | — |
| suggestions | TEXT | — |
| completedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

### `interviewKits`

PostgreSQL: `interview_kits` · 11 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| jobId | UUID | FK → `jobs.id` (SET NULL) |
| questions | JSONB | — |
| scoringCriteria | JSONB | — |
| redFlags | JSONB | — |
| followUpPrompts | JSONB | — |
| duration | INTEGER | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `interviewPools`

PostgreSQL: `interview_pools` · 7 columns · 1 FK out · 2 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| workingHours | JSONB | — |
| defaultDuration | INTEGER | — |
| bufferMinutes | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `poolMembers.poolId`, `interviews.poolId`

### `interviewRehearsals`

PostgreSQL: `interview_rehearsals` · 7 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| applicationId | UUID | NOT NULL, FK → `jobApplications.id` (CASCADE) |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| questions | JSONB | NOT NULL |
| answers | JSONB | — |
| readinessScore | REAL | — |
| createdAt | TIMESTAMP | NOT NULL |

### `interviewReminders`

PostgreSQL: `interview_reminders` · 7 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| interviewId | UUID | FK → `interviews.id` (CASCADE) |
| scheduledFor | TIMESTAMP | NOT NULL |
| message | TEXT | — |
| sentAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

### `interviewRounds`

PostgreSQL: `interview_rounds` · 10 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| jobId | UUID | FK → `jobs.id` (CASCADE) |
| applicationId | UUID | FK → `jobApplications.id` (SET NULL) |
| currentRound | INTEGER | — |
| totalRounds | INTEGER | — |
| roundDetails | JSONB | — |
| decisionNotes | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `interviewScorecards`

PostgreSQL: `interview_scorecards` · 16 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| interviewId | UUID | FK → `interviews.id` (CASCADE) |
| interviewerId | UUID | FK → `users.id` (SET NULL) |
| overallRating | INTEGER | — |
| criteria | JSONB | — |
| strengths | TEXT | — |
| concerns | TEXT | — |
| cultureFitRating | INTEGER | — |
| technicalRating | INTEGER | — |
| communicationRating | INTEGER | — |
| notes | TEXT | — |
| isComplete | BOOLEAN | — |
| submittedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `interviewSettings`

PostgreSQL: `interview_settings` · 8 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, UNIQUE, FK → `organizations.id` (CASCADE) |
| defaultDuration | INTEGER | — |
| bufferTime | INTEGER | — |
| workingHours | JSONB | — |
| panelTemplates | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `interviewTemplates`

PostgreSQL: `interview_templates` · 14 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| duration | INTEGER | — |
| location | TEXT | — |
| stages | JSONB | — |
| questions | JSONB | — |
| scorecardCriteria | JSONB | — |
| preparationNotes | TEXT | — |
| candidateInstructions | TEXT | — |
| isDefault | BOOLEAN | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `interviewerAvailability`

PostgreSQL: `interviewer_availability` · 8 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| userId | UUID | FK → `users.id` (CASCADE) |
| dayOfWeek | INTEGER | NOT NULL |
| isActive | BOOLEAN | — |
| effectiveFrom | TIMESTAMP | — |
| effectiveUntil | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

### `interviews`

PostgreSQL: `interviews` · 12 columns · 4 FK out · 2 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| poolId | UUID | FK → `interviewPools.id` (SET NULL) |
| jobId | UUID | FK → `jobs.id` (SET NULL) |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| interviewerUserId | UUID | FK → `users.id` (SET NULL) |
| startTime | TIMESTAMP | NOT NULL |
| endTime | TIMESTAMP | NOT NULL |
| meetingJoinUrl | TEXT | — |
| notes | TEXT | — |
| feedback | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `interviewReminders.interviewId`, `interviewScorecards.interviewId`

### `poolMembers`

PostgreSQL: `pool_members` · 6 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| poolId | UUID | NOT NULL, FK → `interviewPools.id` (CASCADE) |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| weight | REAL | — |
| isActive | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |

### `schedulingBulkOps`

PostgreSQL: `scheduling_bulk_ops` · 10 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| totalCount | INTEGER | — |
| processedCount | INTEGER | — |
| failedCount | INTEGER | — |
| inputData | JSONB | — |
| results | JSONB | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| completedAt | TIMESTAMP | — |

### `schedulingLinkActivities`

PostgreSQL: `scheduling_link_activities` · 5 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| schedulingLinkId | UUID | FK → `schedulingLinks.id` (CASCADE) |
| description | TEXT | — |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

### `schedulingLinks`

PostgreSQL: `scheduling_links` · 13 columns · 4 FK out · 2 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| jobId | UUID | FK → `jobs.id` (CASCADE) |
| applicationId | UUID | FK → `jobApplications.id` (CASCADE) |
| duration | INTEGER | — |
| availableSlots | JSONB | NOT NULL |
| selectedSlot | JSONB | — |
| location | TEXT | — |
| notes | TEXT | — |
| expiresAt | TIMESTAMP | — |
| scheduledAt | TIMESTAMP | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |

**Referenced by:** `schedulingLinkActivities.schedulingLinkId`, `schedulingReminders.schedulingLinkId`

### `schedulingReminders`

PostgreSQL: `scheduling_reminders` · 6 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| schedulingLinkId | UUID | FK → `schedulingLinks.id` (CASCADE) |
| scheduledFor | TIMESTAMP | NOT NULL |
| sentAt | TIMESTAMP | — |
| message | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

### `schedulingTemplates`

PostgreSQL: `scheduling_templates` · 22 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| duration | INTEGER | — |
| location | TEXT | — |
| bufferMinutes | INTEGER | — |
| maxBookingsPerDay | INTEGER | — |
| minNoticeHours | INTEGER | — |
| candidateInstructions | TEXT | — |
| confirmationMessage | TEXT | — |
| reminderEnabled | BOOLEAN | — |
| reminderHoursBefore | INTEGER | — |
| requireCandidatePhone | BOOLEAN | — |
| collectCandidateTimezone | BOOLEAN | — |
| allowReschedule | BOOLEAN | — |
| rescheduleDeadlineHours | INTEGER | — |
| autoConfirm | BOOLEAN | — |
| isDefault | BOOLEAN | — |
| usageCount | INTEGER | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## AI Platform

**59 tables** — AI jobs, model governance, bias auditing, autopilot, prompt management, quality gates.

### `agentTeamDefinitions`

PostgreSQL: `agent_team_definitions` · 9 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| nodes | JSONB | NOT NULL |
| defaultConfig | JSONB | — |
| isEnabled | BOOLEAN | NOT NULL |
| version | INTEGER | NOT NULL |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `agentTeamNodeLogs`

PostgreSQL: `agent_team_node_logs` · 9 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| runId | UUID | NOT NULL |
| inputSnapshot | JSONB | — |
| outputSnapshot | JSONB | — |
| inputTokens | INTEGER | — |
| outputTokens | INTEGER | — |
| latencyMs | INTEGER | — |
| errorMessage | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

### `agentTeamRuns`

PostgreSQL: `agent_team_runs` · 15 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| teamDefinitionId | UUID | NOT NULL |
| userId | UUID | FK → `users.id` (SET NULL) |
| organizationId | UUID | — |
| inputContext | JSONB | NOT NULL |
| finalContext | JSONB | — |
| aggregatedResult | JSONB | — |
| nodeStatuses | JSONB | — |
| startedAt | TIMESTAMP | — |
| completedAt | TIMESTAMP | — |
| totalDurationMs | INTEGER | — |
| totalTokensUsed | INTEGER | — |
| estimatedCostUsd | REAL | — |
| errorSummary | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

### `aiAbExperiments`

PostgreSQL: `ai_ab_experiments` · 15 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| trafficSplit | REAL | — |
| secondaryMetrics | JSONB | — |
| minSampleSize | INTEGER | — |
| confidenceLevel | REAL | — |
| controlResults | JSONB | — |
| variantResults | JSONB | — |
| pValue | REAL | — |
| effectSize | REAL | — |
| startedAt | TIMESTAMP | — |
| completedAt | TIMESTAMP | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `aiAbTests`

PostgreSQL: `ai_ab_tests` · 12 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| variants | JSONB | NOT NULL |
| trafficSplit | JSONB | — |
| metrics | JSONB | — |
| confidenceLevel | REAL | — |
| sampleSize | INTEGER | — |
| targetSampleSize | INTEGER | — |
| startedAt | TIMESTAMP | — |
| completedAt | TIMESTAMP | — |
| createdBy | UUID | FK → `users.id` |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `aiAccessPolicies`

PostgreSQL: `ai_access_policies` · 13 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| featureKeys | JSONB | NOT NULL |
| maxDailyRequests | INTEGER | — |
| maxMonthlyTokens | INTEGER | — |
| allowedModels | JSONB | — |
| allowedProviders | JSONB | — |
| requireApproval | BOOLEAN | — |
| isEnabled | BOOLEAN | — |
| priority | INTEGER | — |
| createdBy | UUID | FK → `users.id` |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `aiActivityFeed`

PostgreSQL: `ai_activity_feed` · 6 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| relatedEntityId | UUID | — |
| metadata | JSONB | — |
| isRead | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |

### `aiAnomalyAlerts`

PostgreSQL: `ai_anomaly_alerts` · 10 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| expectedValue | REAL | — |
| actualValue | REAL | — |
| deviationPercent | REAL | — |
| resolvedBy | UUID | FK → `users.id` (SET NULL) |
| resolvedAt | TIMESTAMP | — |
| resolutionNotes | TEXT | — |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

### `aiAuditEvents`

PostgreSQL: `ai_audit_events` · 7 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| actorId | UUID | FK → `users.id` (SET NULL) |
| previousValue | JSONB | — |
| newValue | JSONB | — |
| description | TEXT | — |
| userAgent | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

### `aiAutopilotConfig`

PostgreSQL: `ai_autopilot_config` · 29 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, UNIQUE, FK → `organizations.id` (CASCADE) |
| autopilotEnabled | BOOLEAN | — |
| scoringWeights | JSONB | — |
| autoScreenEnabled | BOOLEAN | — |
| autoScreenThreshold | INTEGER | — |
| autoRejectEnabled | BOOLEAN | — |
| autoRejectThreshold | INTEGER | — |
| autoShortlistEnabled | BOOLEAN | — |
| autoShortlistThreshold | INTEGER | — |
| knockoutCriteria | JSONB | — |
| mustHaveSkills | JSONB | — |
| niceToHaveSkills | JSONB | — |
| mustHaveYearsExperience | INTEGER | — |
| autoResponseEnabled | BOOLEAN | — |
| autoResponseDelay | INTEGER | — |
| autoFollowUpEnabled | BOOLEAN | — |
| autoFollowUpDays | INTEGER | — |
| aiSourcingEnabled | BOOLEAN | — |
| aiSourcingChannels | JSONB | — |
| aiSourcingMaxPerDay | INTEGER | — |
| aiDiversitySourcingEnabled | BOOLEAN | — |
| blindScreeningEnabled | BOOLEAN | — |
| removeDemographics | BOOLEAN | — |
| removePhotos | BOOLEAN | — |
| removeNames | BOOLEAN | — |
| removeAge | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `aiAutopilotExecutions`

PostgreSQL: `ai_autopilot_executions` · 8 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| ruleId | UUID | NOT NULL, FK → `aiAutopilotRules.id` (CASCADE) |
| triggerValue | REAL | — |
| thresholdValue | REAL | — |
| executionDetails | JSONB | — |
| revertedAt | TIMESTAMP | — |
| revertedBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |

### `aiAutopilotRules`

PostgreSQL: `ai_autopilot_rules` · 13 columns · 1 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| threshold | REAL | NOT NULL |
| windowMinutes | INTEGER | — |
| cooldownMinutes | INTEGER | — |
| actionConfig | JSONB | — |
| isActive | BOOLEAN | — |
| triggerCount | INTEGER | — |
| lastTriggeredAt | TIMESTAMP | — |
| lastEvaluatedAt | TIMESTAMP | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `aiAutopilotExecutions.ruleId`

### `aiBatchItems`

PostgreSQL: `ai_batch_items` · 11 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| batchId | UUID | NOT NULL, FK → `aiBatchJobs.id` (CASCADE) |
| itemIndex | INTEGER | NOT NULL |
| inputData | JSONB | NOT NULL |
| outputData | JSONB | — |
| error | TEXT | — |
| retryCount | INTEGER | NOT NULL |
| processingTimeMs | INTEGER | — |
| startedAt | TIMESTAMP | — |
| completedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

### `aiBatchJobs`

PostgreSQL: `ai_batch_jobs` · 14 columns · 2 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| totalItems | INTEGER | NOT NULL |
| completedItems | INTEGER | NOT NULL |
| failedItems | INTEGER | NOT NULL |
| config | JSONB | — |
| summary | JSONB | — |
| error | TEXT | — |
| startedAt | TIMESTAMP | — |
| completedAt | TIMESTAMP | — |
| cancelledAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `aiBatchItems.batchId`

### `aiBiasAudits`

PostgreSQL: `ai_bias_audits` · 7 columns · 1 FK out · 5 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| results | JSONB | — |
| demographicBreakdown | JSONB | — |
| fairnessScore | REAL | — |
| recommendations | JSONB | — |
| auditedBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |

**Referenced by:** `biasRemediationActions.auditId`, `biasAlertEvents.auditId`, `biasSimulations.baselineAuditId`, `biasIntersectionalRecords.auditId`, `biasCausalAnalysis.auditId`

### `aiCostBudgets`

PostgreSQL: `ai_cost_budgets` · 10 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| monthlyBudgetUsd | REAL | NOT NULL |
| alertThresholdPercent | REAL | — |
| currentSpendUsd | REAL | — |
| periodStart | TIMESTAMP | NOT NULL |
| periodEnd | TIMESTAMP | — |
| actionConfig | JSONB | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `aiCostRecommendations`

PostgreSQL: `ai_cost_recommendations` · 8 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| currentCostPerDay | REAL | — |
| projectedCostPerDay | REAL | — |
| savingsPercent | REAL | — |
| accuracyImpact | REAL | — |
| rationale | TEXT | — |
| implementedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

### `aiExplainabilityLogs`

PostgreSQL: `ai_explainability_logs` · 10 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| inputSummary | TEXT | — |
| outputSummary | TEXT | — |
| explanation | TEXT | — |
| confidenceScore | REAL | — |
| featureImportance | JSONB | — |
| wasOverridden | BOOLEAN | — |
| overriddenBy | UUID | FK → `users.id` (SET NULL) |
| overrideReason | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

### `aiFeatureConfigs`

PostgreSQL: `ai_feature_configs` · 4 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| isEnabled | BOOLEAN | — |
| updatedAt | TIMESTAMP | NOT NULL |

### `aiFeaturePresets`

PostgreSQL: `ai_feature_presets` · 8 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| configs | JSONB | NOT NULL |
| isBuiltIn | BOOLEAN | — |
| isDefault | BOOLEAN | — |
| createdBy | UUID | FK → `users.id` |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `aiFeatureRollouts`

PostgreSQL: `ai_feature_rollouts` · 16 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| rolloutPercentage | INTEGER | — |
| targetPercentage | INTEGER | — |
| incrementStep | INTEGER | — |
| incrementIntervalMinutes | INTEGER | — |
| rollbackThreshold | JSONB | — |
| newConfig | JSONB | — |
| previousConfig | JSONB | — |
| qualityGate | JSONB | — |
| rolloutHistory | JSONB | — |
| startedAt | TIMESTAMP | — |
| completedAt | TIMESTAMP | — |
| rolledBackAt | TIMESTAMP | — |
| createdBy | UUID | FK → `users.id` |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `aiGovernancePolicies`

PostgreSQL: `ai_governance_policies` · 10 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| rules | JSONB | — |
| appliesTo | JSONB | — |
| isActive | BOOLEAN | — |
| lastTriggered | TIMESTAMP | — |
| triggerCount | INTEGER | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `aiIncidents`

PostgreSQL: `ai_incidents` · 12 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| impactSummary | TEXT | — |
| rootCause | TEXT | — |
| remediation | TEXT | — |
| affectedUsers | INTEGER | — |
| timeline | JSONB | — |
| assignedTo | UUID | FK → `users.id` (SET NULL) |
| resolvedBy | UUID | FK → `users.id` (SET NULL) |
| resolvedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `aiInterviewSessions`

PostgreSQL: `ai_interview_sessions` · 14 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| testId | UUID | FK → `competencyTests.id` (SET NULL) |
| invitationId | UUID | FK → `assessmentInvitations.id` (SET NULL) |
| jobDescription | TEXT | — |
| messages | JSONB | — |
| aiScore | REAL | — |
| aiSummary | TEXT | — |
| aiStrengths | JSONB | — |
| aiConcerns | JSONB | — |
| questionCount | INTEGER | — |
| maxQuestions | INTEGER | — |
| startedAt | TIMESTAMP | NOT NULL |
| completedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

### `aiJobs`

PostgreSQL: `ai_jobs` · 8 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| inputData | JSONB | — |
| outputData | JSONB | — |
| error | TEXT | — |
| userId | UUID | FK → `users.id` (SET NULL) |
| organizationId | UUID | FK → `organizations.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| completedAt | TIMESTAMP | — |

### `aiModelMetrics`

PostgreSQL: `ai_model_metrics` · 8 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| accuracy | REAL | — |
| biasScore | REAL | — |
| latencyMs | INTEGER | — |
| requestCount | INTEGER | — |
| errorCount | INTEGER | — |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

### `aiModelRegistry`

PostgreSQL: `ai_model_registry` · 12 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| deployedAt | TIMESTAMP | — |
| accuracy | REAL | — |
| latencyP50 | REAL | — |
| latencyP99 | REAL | — |
| tokenCostPer1k | REAL | — |
| maxTokens | INTEGER | — |
| config | JSONB | — |
| changelog | TEXT | — |
| deployedBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `aiPromptExperimentAssignments`

PostgreSQL: `ai_prompt_experiment_assignments` · 4 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| experimentId | UUID | NOT NULL, FK → `aiPromptExperiments.id` (CASCADE) |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| assignedAt | TIMESTAMP | NOT NULL |

### `aiPromptExperimentEvents`

PostgreSQL: `ai_prompt_experiment_events` · 7 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| experimentId | UUID | NOT NULL, FK → `aiPromptExperiments.id` (CASCADE) |
| userId | UUID | FK → `users.id` (SET NULL) |
| eventValue | REAL | — |
| metadata | JSONB | — |
| entityId | UUID | — |
| createdAt | TIMESTAMP | NOT NULL |

### `aiPromptExperiments`

PostgreSQL: `ai_prompt_experiments` · 15 columns · 3 FK out · 2 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| controlPromptId | UUID | NOT NULL, FK → `aiPromptTemplates.id` |
| variantPromptId | UUID | NOT NULL, FK → `aiPromptTemplates.id` |
| trafficSplit | REAL | NOT NULL |
| secondaryMetrics | JSONB | — |
| minSampleSize | INTEGER | NOT NULL |
| confidenceLevel | REAL | NOT NULL |
| pValue | REAL | — |
| effectSize | REAL | — |
| startedAt | TIMESTAMP | — |
| completedAt | TIMESTAMP | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `aiPromptExperimentAssignments.experimentId`, `aiPromptExperimentEvents.experimentId`

### `aiPromptTemplates`

PostgreSQL: `ai_prompt_templates` · 17 columns · 1 FK out · 2 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| version | INTEGER | NOT NULL |
| systemPrompt | TEXT | NOT NULL |
| userPromptTemplate | TEXT | — |
| variables | JSONB | — |
| temperature | REAL | — |
| maxTokens | INTEGER | — |
| topP | REAL | — |
| frequencyPenalty | REAL | — |
| presencePenalty | REAL | — |
| stopSequences | JSONB | — |
| isActive | BOOLEAN | — |
| isDefault | BOOLEAN | — |
| testResults | JSONB | — |
| createdBy | UUID | FK → `users.id` |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `aiPromptExperiments.controlPromptId`, `aiPromptExperiments.variantPromptId`

### `aiQualityFeedback`

PostgreSQL: `ai_quality_feedback` · 8 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | FK → `users.id` (SET NULL) |
| rating | INTEGER | NOT NULL |
| comment | TEXT | — |
| inputSnippet | TEXT | — |
| outputSnippet | TEXT | — |
| responseTimeMs | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |

### `aiQualityGateLogs`

PostgreSQL: `ai_quality_gate_logs` · 8 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| gateId | UUID | FK → `aiQualityGates.id` (SET NULL) |
| details | JSONB | — |
| outputSnapshot | TEXT | — |
| userId | UUID | — |
| organizationId | UUID | — |
| latencyMs | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |

### `aiQualityGates`

PostgreSQL: `ai_quality_gates` · 11 columns · 1 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| config | JSONB | NOT NULL |
| isEnabled | BOOLEAN | — |
| priority | INTEGER | — |
| passCount | INTEGER | — |
| warnCount | INTEGER | — |
| failCount | INTEGER | — |
| lastTriggeredAt | TIMESTAMP | — |
| createdBy | UUID | FK → `users.id` |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `aiQualityGateLogs.gateId`

### `aiRecurringMonitorAlerts`

PostgreSQL: `ai_recurring_monitor_alerts` · 11 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| monitorId | UUID | NOT NULL, FK → `aiRecurringMonitors.id` (CASCADE) |
| runId | UUID | FK → `aiRecurringMonitorRuns.id` (SET NULL) |
| description | TEXT | — |
| entityId | UUID | — |
| actionTaken | BOOLEAN | — |
| actionTakenAt | TIMESTAMP | — |
| actionTakenBy | UUID | FK → `users.id` (SET NULL) |
| metadata | JSONB | — |
| expiresAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

### `aiRecurringMonitorRuns`

PostgreSQL: `ai_recurring_monitor_runs` · 11 columns · 1 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| monitorId | UUID | NOT NULL, FK → `aiRecurringMonitors.id` (CASCADE) |
| startedAt | TIMESTAMP | NOT NULL |
| completedAt | TIMESTAMP | — |
| durationMs | INTEGER | — |
| itemsProcessed | INTEGER | — |
| itemsFlagged | INTEGER | — |
| summary | JSONB | — |
| errorMessage | TEXT | — |
| aiTokensUsed | INTEGER | — |
| aiCostUsd | REAL | — |

**Referenced by:** `aiRecurringMonitorAlerts.runId`

### `aiRecurringMonitors`

PostgreSQL: `ai_recurring_monitors` · 15 columns · 2 FK out · 2 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| skillId | UUID | FK → `aiSkillPrompts.id` (SET NULL) |
| intervalMinutes | INTEGER | — |
| isEnabled | BOOLEAN | NOT NULL |
| config | JSONB | — |
| lastRunAt | TIMESTAMP | — |
| lastRunDurationMs | INTEGER | — |
| nextRunAt | TIMESTAMP | — |
| consecutiveFailures | INTEGER | — |
| maxRetries | INTEGER | — |
| timeoutMs | INTEGER | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `aiRecurringMonitorRuns.monitorId`, `aiRecurringMonitorAlerts.monitorId`

### `aiSafetyRules`

PostgreSQL: `ai_safety_rules` · 9 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| config | JSONB | NOT NULL |
| isEnabled | BOOLEAN | — |
| priority | INTEGER | — |
| violationCount | INTEGER | — |
| lastTriggeredAt | TIMESTAMP | — |
| createdBy | UUID | FK → `users.id` |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `aiSearchHistory`

PostgreSQL: `ai_search_history` · 14 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| query | TEXT | NOT NULL |
| filters | JSONB | — |
| resultCount | INTEGER | — |
| topMatchScore | INTEGER | — |
| interpretedCriteria | JSONB | — |
| resultSummary | JSONB | — |
| candidatesShortlisted | INTEGER | — |
| candidatesContacted | INTEGER | — |
| searchDurationMs | INTEGER | — |
| isSaved | BOOLEAN | — |
| tags | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

### `aiSkillPrompts`

PostgreSQL: `ai_skill_prompts` · 11 columns · 1 FK out · 2 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| promptContent | TEXT | NOT NULL |
| outputFormat | TEXT | — |
| constraints | TEXT | — |
| keywords | JSONB | — |
| version | INTEGER | NOT NULL |
| isEnabled | BOOLEAN | NOT NULL |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `aiSkillReviews.skillId`, `aiRecurringMonitors.skillId`

### `aiSkillReviews`

PostgreSQL: `ai_skill_reviews` · 9 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| skillId | UUID | NOT NULL, FK → `aiSkillPrompts.id` (CASCADE) |
| reviewerNotes | TEXT | — |
| reviewedBy | UUID | FK → `users.id` (SET NULL) |
| reviewedAt | TIMESTAMP | — |
| snoozedUntil | TIMESTAMP | — |
| autoSuggestions | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `aiSmartRouterConfigs`

PostgreSQL: `ai_smart_router_configs` · 13 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| isEnabled | BOOLEAN | — |
| complexityThresholds | JSONB | — |
| fallbackChain | JSONB | — |
| circuitBreakerConfig | JSONB | — |
| qualityMinScore | REAL | — |
| maxLatencyMs | INTEGER | — |
| maxCostPerRequest | REAL | — |
| featureOverrides | JSONB | — |
| routingStats | JSONB | — |
| createdBy | UUID | FK → `users.id` |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `aiSourcingCandidateDna`

PostgreSQL: `ai_sourcing_candidate_dna` · 16 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| candidateProfileId | UUID | FK → `candidateSourcingProfiles.id` |
| responseLikelihood | REAL | NOT NULL |
| offerAcceptanceProbability | REAL | NOT NULL |
| retentionScore | REAL | NOT NULL |
| growthTrajectory | REAL | NOT NULL |
| culturalAlignment | REAL | NOT NULL |
| leadershipPotential | REAL | NOT NULL |
| innovationIndex | REAL | NOT NULL |
| adaptabilityScore | REAL | NOT NULL |
| overallDnaScore | REAL | NOT NULL |
| signals | JSONB | — |
| narrative | TEXT | — |
| generatedAt | TIMESTAMP | NOT NULL |
| expiresAt | TIMESTAMP | — |

### `aiSourcingCompetitorIntel`

PostgreSQL: `ai_sourcing_competitor_intel` · 9 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| hiringActivity | JSONB | — |
| talentFlow | JSONB | — |
| compensationIntel | JSONB | — |
| techStack | JSONB | — |
| insights | TEXT | — |
| lastUpdated | TIMESTAMP | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |

### `aiSourcingCopilotChats`

PostgreSQL: `ai_sourcing_copilot_chats` · 8 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| messages | JSONB | — |
| context | JSONB | — |
| messageCount | INTEGER | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `aiSourcingCraftedMessages`

PostgreSQL: `ai_sourcing_crafted_messages` · 10 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| candidateProfileId | UUID | FK → `candidateSourcingProfiles.id` |
| messageBody | TEXT | NOT NULL |
| personalizationPoints | JSONB | — |
| alternativeVersions | JSONB | — |
| sentAt | TIMESTAMP | — |
| responseReceived | BOOLEAN | — |
| responseAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

### `aiSourcingDiversityReports`

PostgreSQL: `ai_sourcing_diversity_reports` · 8 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| reportDate | TIMESTAMP | NOT NULL |
| pipelineDiversity | JSONB | — |
| sourcingBias | JSONB | — |
| bbbeeCompliance | JSONB | — |
| insights | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

### `aiSourcingMarketPulse`

PostgreSQL: `ai_sourcing_market_pulse` · 13 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| impactedRoles | JSONB | — |
| impactedSkills | JSONB | — |
| estimatedCandidates | INTEGER | NOT NULL |
| matchingOpenRoles | JSONB | — |
| actionRecommendations | JSONB | — |
| urgencyScore | REAL | NOT NULL |
| sourceUrl | TEXT | — |
| detectedAt | TIMESTAMP | NOT NULL |
| expiresAt | TIMESTAMP | — |
| actedUpon | BOOLEAN | — |

### `aiSourcingNetworkNodes`

PostgreSQL: `ai_sourcing_network_nodes` · 6 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| metadata | JSONB | — |
| connections | JSONB | — |
| centralityScore | REAL | — |
| createdAt | TIMESTAMP | NOT NULL |

### `aiSourcingPassiveSignals`

PostgreSQL: `ai_sourcing_passive_signals` · 9 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| candidateProfileId | UUID | FK → `candidateSourcingProfiles.id` |
| signalStrength | REAL | NOT NULL |
| description | TEXT | — |
| metadata | JSONB | — |
| detectedAt | TIMESTAMP | NOT NULL |
| expiresAt | TIMESTAMP | — |
| acknowledged | BOOLEAN | — |

### `aiSourcingPipelineForecasts`

PostgreSQL: `ai_sourcing_pipeline_forecasts` · 8 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| jobId | UUID | — |
| forecastDate | TIMESTAMP | NOT NULL |
| predictions | JSONB | — |
| confidence | REAL | NOT NULL |
| insights | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

### `aiSourcingPlaybooks`

PostgreSQL: `ai_sourcing_playbooks` · 7 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| strategy | JSONB | — |
| kpis | JSONB | — |
| insights | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `aiSourcingResumeUploads`

PostgreSQL: `ai_sourcing_resume_uploads` · 10 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| fileSize | INTEGER | — |
| parsedData | JSONB | — |
| matchedProfileId | UUID | FK → `candidateSourcingProfiles.id` |
| duplicateOf | UUID | — |
| confidenceScore | REAL | — |
| uploadedBy | UUID | FK → `users.id` |
| createdAt | TIMESTAMP | NOT NULL |
| processedAt | TIMESTAMP | — |

### `aiSourcingSequenceEnrollments`

PostgreSQL: `ai_sourcing_sequence_enrollments` · 8 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| sequenceId | UUID | NOT NULL, FK → `aiSourcingSequences.id` (CASCADE) |
| candidateProfileId | UUID | FK → `candidateSourcingProfiles.id` |
| currentStep | INTEGER | NOT NULL |
| enrolledAt | TIMESTAMP | NOT NULL |
| completedAt | TIMESTAMP | — |
| lastActionAt | TIMESTAMP | — |
| responseData | JSONB | — |

### `aiSourcingSequenceSteps`

PostgreSQL: `ai_sourcing_sequence_steps` · 10 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| sequenceId | UUID | NOT NULL, FK → `aiSourcingSequences.id` (CASCADE) |
| stepNumber | INTEGER | NOT NULL |
| content | TEXT | — |
| contentVariantB | TEXT | — |
| delayDays | INTEGER | NOT NULL |
| delayHours | INTEGER | NOT NULL |
| sendTimeOptimization | BOOLEAN | — |
| stats | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

### `aiSourcingSequences`

PostgreSQL: `ai_sourcing_sequences` · 10 columns · 2 FK out · 2 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| totalSteps | INTEGER | NOT NULL |
| targetCriteria | JSONB | — |
| abTestEnabled | BOOLEAN | — |
| stats | JSONB | — |
| createdBy | UUID | FK → `users.id` |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `aiSourcingSequenceSteps.sequenceId`, `aiSourcingSequenceEnrollments.sequenceId`

### `aiSourcingTalentMaps`

PostgreSQL: `ai_sourcing_talent_maps` · 10 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| targetSkills | JSONB | — |
| regions | JSONB | — |
| skillClusters | JSONB | — |
| companyFlows | JSONB | — |
| insights | TEXT | — |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `aiTranslationSessions`

PostgreSQL: `ai_translation_sessions` · 15 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| sourceText | TEXT | NOT NULL |
| translatedText | TEXT | — |
| alternativeTranslations | JSONB | — |
| contextNotes | TEXT | — |
| glossaryTermsUsed | JSONB | — |
| confidence | REAL | — |
| tokensUsed | INTEGER | — |
| durationMs | INTEGER | — |
| wasAccepted | BOOLEAN | — |
| wasEdited | BOOLEAN | — |
| editedText | TEXT | — |
| keyId | UUID | FK → `translationKeys.id` |
| createdBy | UUID | FK → `users.id` |
| createdAt | TIMESTAMP | NOT NULL |

### `aiUsageLogs`

PostgreSQL: `ai_usage_logs` · 10 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | FK → `users.id` (SET NULL) |
| tokensInput | INTEGER | — |
| tokensOutput | INTEGER | — |
| latencyMs | INTEGER | — |
| costUsd | REAL | — |
| statusCode | INTEGER | — |
| errorMessage | TEXT | — |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

## WhatsApp

**49 tables** — WhatsApp Business API: conversations, bots, flows, campaigns, apply-via-WhatsApp.

### `metaWhatsAppTemplates`

PostgreSQL: `meta_whatsapp_templates` · 6 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| metaTemplateId | TEXT | NOT NULL, UNIQUE |
| components | JSONB | — |
| lastSyncedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | — |
| updatedAt | TIMESTAMP | — |

### `waCampaignAudiences`

PostgreSQL: `wa_campaign_audiences` · 11 columns · 1 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | — |
| createdBy | UUID | FK → `users.id` |
| description | TEXT | — |
| filters | JSONB | — |
| estimatedSize | INTEGER | — |
| lastRefreshedAt | TIMESTAMP | — |
| isSmartAudience | BOOLEAN | — |
| tags | JSONB | — |
| createdAt | TIMESTAMP | — |
| updatedAt | TIMESTAMP | — |

**Referenced by:** `waDripSequences.audienceId`

### `waCampaignContacts`

PostgreSQL: `wa_campaign_contacts` · 15 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | — |
| userId | UUID | FK → `users.id` |
| whatsappOptIn | BOOLEAN | — |
| optInDate | TIMESTAMP | — |
| optOutDate | TIMESTAMP | — |
| totalCampaignsReceived | INTEGER | — |
| totalReplies | INTEGER | — |
| lastContactedAt | TIMESTAMP | — |
| lastRepliedAt | TIMESTAMP | — |
| engagementScore | REAL | — |
| tags | JSONB | — |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | — |
| updatedAt | TIMESTAMP | — |

### `waCampaignSendLogs`

PostgreSQL: `wa_campaign_send_logs` · 12 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| campaignId | UUID | — |
| sequenceId | UUID | — |
| contactId | UUID | — |
| stepNumber | INTEGER | — |
| messageBody | TEXT | — |
| sentAt | TIMESTAMP | — |
| deliveredAt | TIMESTAMP | — |
| readAt | TIMESTAMP | — |
| repliedAt | TIMESTAMP | — |
| replyContent | TEXT | — |
| createdAt | TIMESTAMP | — |

### `waCampaignTemplates`

PostgreSQL: `wa_campaign_templates` · 17 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | — |
| createdBy | UUID | FK → `users.id` |
| description | TEXT | — |
| messageBody | TEXT | NOT NULL |
| variables | JSONB | — |
| mediaUrl | TEXT | — |
| hasQuickReplies | BOOLEAN | — |
| quickReplies | JSONB | — |
| hasCallToAction | BOOLEAN | — |
| callToAction | JSONB | — |
| isSystem | BOOLEAN | — |
| usageCount | INTEGER | — |
| avgResponseRate | REAL | — |
| tags | JSONB | — |
| createdAt | TIMESTAMP | — |
| updatedAt | TIMESTAMP | — |

### `waContactListMembers`

PostgreSQL: `wa_contact_list_members` · 3 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| listId | UUID | NOT NULL, FK → `waContactLists.id` (CASCADE) |
| addedAt | TIMESTAMP | — |

### `waContactLists`

PostgreSQL: `wa_contact_lists` · 6 columns · 1 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| contactCount | INTEGER | — |
| createdBy | UUID | FK → `users.id` |
| createdAt | TIMESTAMP | — |
| updatedAt | TIMESTAMP | — |

**Referenced by:** `waContactListMembers.listId`

### `waDripEnrollments`

PostgreSQL: `wa_drip_enrollments` · 9 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| sequenceId | UUID | NOT NULL, FK → `waDripSequences.id` (CASCADE) |
| userId | UUID | FK → `users.id` |
| currentStep | INTEGER | — |
| lastMessageAt | TIMESTAMP | — |
| nextScheduledAt | TIMESTAMP | — |
| responses | JSONB | — |
| enrolledAt | TIMESTAMP | — |
| completedAt | TIMESTAMP | — |

### `waDripSequences`

PostgreSQL: `wa_drip_sequences` · 15 columns · 2 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | — |
| createdBy | UUID | FK → `users.id` |
| description | TEXT | — |
| triggerConfig | JSONB | — |
| audienceId | UUID | FK → `waCampaignAudiences.id` |
| steps | JSONB | — |
| totalSteps | INTEGER | — |
| respectPopia | BOOLEAN | — |
| enrolledCount | INTEGER | — |
| completedCount | INTEGER | — |
| exitedCount | INTEGER | — |
| avgCompletionRate | REAL | — |
| createdAt | TIMESTAMP | — |
| updatedAt | TIMESTAMP | — |

**Referenced by:** `waDripEnrollments.sequenceId`

### `whatsappAbTests`

PostgreSQL: `whatsapp_ab_tests` · 14 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | — |
| variantA | JSONB | NOT NULL |
| variantB | JSONB | NOT NULL |
| trafficSplit | INTEGER | — |
| metricsA | JSONB | — |
| metricsB | JSONB | — |
| confidenceLevel | INTEGER | — |
| startedAt | TIMESTAMP | — |
| completedAt | TIMESTAMP | — |
| minSampleSize | INTEGER | — |
| createdBy | UUID | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `whatsappAgents`

PostgreSQL: `whatsapp_agents` · 15 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | SERIAL | PK |
| userId | INTEGER | — |
| activeConversations | INTEGER | NOT NULL |
| maxConversations | INTEGER | NOT NULL |
| avgResponseTime | INTEGER | NOT NULL |
| avgResolutionTime | INTEGER | NOT NULL |
| csatScore | REAL | NOT NULL |
| messagesToday | INTEGER | NOT NULL |
| escalationsHandled | INTEGER | NOT NULL |
| firstResponseTime | INTEGER | NOT NULL |
| lastActive | TIMESTAMP | — |
| skills | JSONB | NOT NULL |
| languages | JSONB | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `whatsappAnalytics`

PostgreSQL: `whatsapp_analytics` · 23 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| periodStart | TIMESTAMP | NOT NULL |
| periodEnd | TIMESTAMP | NOT NULL |
| totalConversations | INTEGER | — |
| newConversations | INTEGER | — |
| totalMessages | INTEGER | — |
| inboundMessages | INTEGER | — |
| outboundMessages | INTEGER | — |
| avgResponseTimeSeconds | REAL | — |
| avgConversationDepth | REAL | — |
| applicationsStarted | INTEGER | — |
| applicationsCompleted | INTEGER | — |
| assessmentsStarted | INTEGER | — |
| assessmentsCompleted | INTEGER | — |
| escalations | INTEGER | — |
| optOuts | INTEGER | — |
| sentimentDistribution | JSONB | — |
| topIntents | JSONB | — |
| languageDistribution | JSONB | — |
| peakHours | JSONB | — |
| conversionFunnel | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

### `whatsappApplyAbTests`

PostgreSQL: `whatsapp_apply_ab_tests` · 10 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | — |
| createdBy | UUID | FK → `users.id` |
| jobId | UUID | FK → `jobs.id` |
| variants | JSONB | — |
| statisticalSignificance | REAL | — |
| startedAt | TIMESTAMP | — |
| completedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `whatsappApplyAnalytics`

PostgreSQL: `whatsapp_apply_analytics` · 20 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | — |
| jobId | UUID | FK → `jobs.id` |
| linkId | UUID | FK → `whatsappApplyLinks.id` |
| periodStart | TIMESTAMP | NOT NULL |
| periodEnd | TIMESTAMP | NOT NULL |
| linkClicks | INTEGER | — |
| uniqueVisitors | INTEGER | — |
| applicationsStarted | INTEGER | — |
| applicationsCompleted | INTEGER | — |
| cvsUploaded | INTEGER | — |
| avgTimeToApplySeconds | REAL | — |
| topSources | JSONB | — |
| languageBreakdown | JSONB | — |
| locationBreakdown | JSONB | — |
| deviceBreakdown | JSONB | — |
| hourlyDistribution | JSONB | — |
| conversionFunnel | JSONB | — |
| costPerApply | REAL | — |
| createdAt | TIMESTAMP | NOT NULL |

### `whatsappApplyApplications`

PostgreSQL: `whatsapp_apply_applications` · 18 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | — |
| jobId | UUID | FK → `jobs.id` |
| linkId | UUID | FK → `whatsappApplyLinks.id` |
| cvUrl | TEXT | — |
| coverMessage | TEXT | — |
| qualifications | JSONB | — |
| screeningAnswers | JSONB | — |
| aiScore | REAL | — |
| aiSummary | TEXT | — |
| sentimentScore | REAL | — |
| conversationId | UUID | — |
| assignedTo | UUID | FK → `users.id` |
| notes | TEXT | — |
| tags | JSONB | — |
| lastContactAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `whatsappApplyAutoResponders`

PostgreSQL: `whatsapp_apply_auto_responders` · 13 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | — |
| createdBy | UUID | FK → `users.id` |
| triggerKeywords | JSONB | — |
| triggerDelay | INTEGER | — |
| responseTemplate | TEXT | NOT NULL |
| isActive | BOOLEAN | — |
| priority | INTEGER | — |
| conditions | JSONB | — |
| timesTriggered | INTEGER | — |
| lastTriggeredAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `whatsappApplyCampaigns`

PostgreSQL: `whatsapp_apply_campaigns` · 21 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | — |
| createdBy | UUID | FK → `users.id` |
| jobId | UUID | FK → `jobs.id` |
| templateId | UUID | FK → `whatsappApplyTemplates.id` |
| targetAudience | JSONB | — |
| scheduledAt | TIMESTAMP | — |
| startedAt | TIMESTAMP | — |
| completedAt | TIMESTAMP | — |
| totalRecipients | INTEGER | — |
| messagesSent | INTEGER | — |
| messagesDelivered | INTEGER | — |
| messagesRead | INTEGER | — |
| responses | INTEGER | — |
| applications | INTEGER | — |
| optOuts | INTEGER | — |
| sendRate | INTEGER | — |
| popiaCompliant | BOOLEAN | — |
| abTestId | UUID | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `whatsappApplyLinks`

PostgreSQL: `whatsapp_apply_links` · 13 columns · 2 FK out · 2 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | — |
| jobId | UUID | FK → `jobs.id` (CASCADE) |
| createdBy | UUID | FK → `users.id` |
| prefilledMessage | TEXT | — |
| qrCodeUrl | TEXT | — |
| clickCount | INTEGER | — |
| applicationCount | INTEGER | — |
| conversionRate | REAL | — |
| isActive | BOOLEAN | — |
| expiresAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `whatsappApplyApplications.linkId`, `whatsappApplyAnalytics.linkId`

### `whatsappApplyTemplates`

PostgreSQL: `whatsapp_apply_templates` · 15 columns · 1 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | — |
| createdBy | UUID | FK → `users.id` |
| messageBody | TEXT | NOT NULL |
| callToAction | TEXT | — |
| variables | JSONB | — |
| characterCount | INTEGER | — |
| usageCount | INTEGER | — |
| responseRate | REAL | — |
| avgResponseTimeMinutes | REAL | — |
| isDefault | BOOLEAN | — |
| isFavorite | BOOLEAN | — |
| tags | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `whatsappApplyCampaigns.templateId`

### `whatsappAssessmentSessions`

PostgreSQL: `whatsapp_assessment_sessions` · 11 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| conversationId | UUID | NOT NULL, FK → `whatsappConversations.id` (CASCADE) |
| testId | UUID | NOT NULL, FK → `competencyTests.id` (CASCADE) |
| attemptId | UUID | FK → `testAttempts.id` (SET NULL) |
| currentSectionIndex | INTEGER | — |
| currentItemIndex | INTEGER | — |
| answers | JSONB | — |
| score | REAL | — |
| startedAt | TIMESTAMP | — |
| completedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

### `whatsappAutoResponders`

PostgreSQL: `whatsapp_auto_responders` · 13 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | — |
| triggerValue | TEXT | — |
| responseValue | TEXT | NOT NULL |
| priority | INTEGER | — |
| isActive | BOOLEAN | — |
| conditions | JSONB | — |
| hitCount | INTEGER | — |
| attachmentUrl | TEXT | — |
| templateId | TEXT | — |
| createdBy | UUID | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `whatsappBotConfig`

PostgreSQL: `whatsapp_bot_config` · 19 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| botEnabled | BOOLEAN | NOT NULL |
| welcomeMessage | TEXT | — |
| enabledLanguages | JSONB | — |
| popiaConsentText | TEXT | — |
| escalationThreshold | INTEGER | — |
| idleTimeoutMinutes | INTEGER | — |
| enabledFeatures | JSONB | — |
| maxConcurrentConversations | INTEGER | — |
| businessHoursOnly | BOOLEAN | — |
| afterHoursMessage | TEXT | — |
| greetingAttachmentUrl | TEXT | — |
| greetingTemplateId | TEXT | — |
| autoReplyAttachmentUrl | TEXT | — |
| autoReplyTemplateId | TEXT | — |
| fallbackMessage | TEXT | — |
| intentDetectionEnabled | BOOLEAN | NOT NULL |
| intentAiEnabled | BOOLEAN | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `whatsappBotFlows`

PostgreSQL: `whatsapp_bot_flows` · 10 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | — |
| description | TEXT | — |
| steps | JSONB | — |
| isActive | BOOLEAN | — |
| usageCount | INTEGER | — |
| completionRate | INTEGER | — |
| createdBy | UUID | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `whatsappBotTemplates`

PostgreSQL: `whatsapp_bot_templates` · 9 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| body | TEXT | NOT NULL |
| variables | JSONB | — |
| description | TEXT | — |
| isInteractive | BOOLEAN | — |
| interactiveConfig | JSONB | — |
| isActive | BOOLEAN | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `whatsappBotTraining`

PostgreSQL: `whatsapp_bot_training` · 14 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | — |
| question | TEXT | NOT NULL |
| alternativeQuestions | JSONB | — |
| answer | TEXT | NOT NULL |
| confidence | INTEGER | — |
| isActive | BOOLEAN | — |
| hitCount | INTEGER | — |
| helpfulCount | INTEGER | — |
| unhelpfulCount | INTEGER | — |
| lastUsedAt | TIMESTAMP | — |
| createdBy | UUID | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `whatsappBroadcasts`

PostgreSQL: `whatsapp_broadcasts` · 18 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | — |
| message | TEXT | NOT NULL |
| templateId | UUID | — |
| segmentCriteria | JSONB | — |
| scheduledAt | TIMESTAMP | — |
| sentAt | TIMESTAMP | — |
| totalRecipients | INTEGER | — |
| totalDelivered | INTEGER | — |
| totalRead | INTEGER | — |
| totalReplied | INTEGER | — |
| totalFailed | INTEGER | — |
| sendRate | INTEGER | — |
| respectBusinessHours | BOOLEAN | — |
| respectPopia | BOOLEAN | — |
| createdBy | UUID | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `whatsappCannedResponses`

PostgreSQL: `whatsapp_canned_responses` · 5 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | SERIAL | PK |
| message | TEXT | NOT NULL |
| usageCount | INTEGER | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `whatsappComplianceLogs`

PostgreSQL: `whatsapp_compliance_logs` · 5 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | — |
| conversationId | UUID | — |
| details | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

### `whatsappConversationNotes`

PostgreSQL: `whatsapp_conversation_notes` · 6 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| conversationId | UUID | NOT NULL |
| content | TEXT | NOT NULL |
| createdBy | UUID | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `whatsappConversationTags`

PostgreSQL: `whatsapp_conversation_tags` · 5 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| conversationId | UUID | NOT NULL |
| autoApplied | BOOLEAN | — |
| appliedBy | UUID | — |
| createdAt | TIMESTAMP | NOT NULL |

### `whatsappConversations`

PostgreSQL: `whatsapp_conversations` · 20 columns · 6 FK out · 3 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | FK → `users.id` (SET NULL) |
| candidateProfileId | UUID | FK → `candidateProfiles.id` (SET NULL) |
| organizationId | UUID | FK → `organizations.id` (SET NULL) |
| subState | JSONB | — |
| conversationHistory | JSONB | — |
| currentJobId | UUID | FK → `jobs.id` (SET NULL) |
| currentTestId | UUID | FK → `competencyTests.id` (SET NULL) |
| currentScreeningJobId | UUID | — |
| escalatedTo | UUID | FK → `users.id` (SET NULL) |
| escalationReason | TEXT | — |
| lastMessageAt | TIMESTAMP | — |
| lastBotMessageAt | TIMESTAMP | — |
| messageCount | INTEGER | — |
| isOptedIn | BOOLEAN | — |
| optInTimestamp | TIMESTAMP | — |
| optOutTimestamp | TIMESTAMP | — |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `whatsappMessages.conversationId`, `whatsappMediaUploads.conversationId`, `whatsappAssessmentSessions.conversationId`

### `whatsappCsatSurveys`

PostgreSQL: `whatsapp_csat_surveys` · 9 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | — |
| conversationId | UUID | NOT NULL |
| rating | INTEGER | — |
| npsScore | INTEGER | — |
| feedback | TEXT | — |
| respondedAt | TIMESTAMP | — |
| sentAt | TIMESTAMP | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |

### `whatsappDeepLinks`

PostgreSQL: `whatsapp_deep_links` · 13 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | — |
| prefillMessage | TEXT | NOT NULL |
| jobId | UUID | — |
| qrCodeUrl | TEXT | — |
| totalScans | INTEGER | — |
| totalConversations | INTEGER | — |
| totalApplications | INTEGER | — |
| isActive | BOOLEAN | — |
| expiresAt | TIMESTAMP | — |
| createdBy | UUID | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `whatsappFlows`

PostgreSQL: `whatsapp_flows` · 11 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | SERIAL | PK |
| description | TEXT | — |
| version | INTEGER | NOT NULL |
| triggerValue | TEXT | — |
| nodes | JSONB | NOT NULL |
| totalEntries | INTEGER | NOT NULL |
| completionRate | REAL | NOT NULL |
| avgDurationSeconds | INTEGER | NOT NULL |
| lastTriggered | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `whatsappJobMatchCards`

PostgreSQL: `whatsapp_job_match_cards` · 10 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | — |
| jobId | UUID | FK → `jobs.id` |
| matchScore | REAL | — |
| matchReasons | JSONB | — |
| skillOverlap | JSONB | — |
| messageSent | BOOLEAN | — |
| sentAt | TIMESTAMP | — |
| respondedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

### `whatsappMediaUploads`

PostgreSQL: `whatsapp_media_uploads` · 7 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| conversationId | UUID | NOT NULL, FK → `whatsappConversations.id` (CASCADE) |
| storedUrl | TEXT | — |
| fileSize | INTEGER | — |
| parseResult | JSONB | — |
| parsedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

### `whatsappMessages`

PostgreSQL: `whatsapp_messages` · 11 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| conversationId | UUID | NOT NULL, FK → `whatsappConversations.id` (CASCADE) |
| content | TEXT | — |
| mediaUrl | TEXT | — |
| interactivePayload | JSONB | — |
| deliveryStatusAt | TIMESTAMP | — |
| aiProcessed | BOOLEAN | — |
| aiResponse | JSONB | — |
| processingTimeMs | INTEGER | — |
| sentimentScore | REAL | — |
| createdAt | TIMESTAMP | NOT NULL |

### `whatsappQuickReplies`

PostgreSQL: `whatsapp_quick_replies` · 9 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | — |
| body | TEXT | NOT NULL |
| variables | JSONB | — |
| usageCount | INTEGER | — |
| isGlobal | BOOLEAN | — |
| createdBy | UUID | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `whatsappReengagementCampaigns`

PostgreSQL: `whatsapp_reengagement_campaigns` · 14 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| targetCriteria | JSONB | — |
| messageVariants | JSONB | — |
| scheduledAt | TIMESTAMP | — |
| totalTargeted | INTEGER | — |
| totalSent | INTEGER | — |
| totalResponded | INTEGER | — |
| totalReEngaged | INTEGER | — |
| abTestEnabled | BOOLEAN | — |
| respectPopia | BOOLEAN | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `whatsappReferralChains`

PostgreSQL: `whatsapp_referral_chains` · 7 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | — |
| referralCodeId | UUID | FK → `whatsappReferralCodes.id` |
| jobId | UUID | FK → `jobs.id` |
| applicationId | UUID | — |
| depth | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |

### `whatsappReferralCodes`

PostgreSQL: `whatsapp_referral_codes` · 10 columns · 1 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | — |
| jobId | UUID | FK → `jobs.id` |
| totalReferrals | INTEGER | — |
| successfulHires | INTEGER | — |
| totalClicks | INTEGER | — |
| rewardPoints | INTEGER | — |
| isActive | BOOLEAN | — |
| expiresAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

**Referenced by:** `whatsappReferralChains.referralCodeId`

### `whatsappRoutingRules`

PostgreSQL: `whatsapp_routing_rules` · 7 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | SERIAL | PK |
| condition | TEXT | NOT NULL |
| targetAgentId | INTEGER | — |
| priority | INTEGER | NOT NULL |
| enabled | BOOLEAN | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `whatsappScheduledMessages`

PostgreSQL: `whatsapp_scheduled_messages` · 8 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| conversationId | UUID | — |
| message | TEXT | NOT NULL |
| scheduledFor | TIMESTAMP | NOT NULL |
| sentAt | TIMESTAMP | — |
| errorMessage | TEXT | — |
| createdBy | UUID | — |
| createdAt | TIMESTAMP | NOT NULL |

### `whatsappScreeningFlows`

PostgreSQL: `whatsapp_screening_flows` · 14 columns · 2 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | — |
| createdBy | UUID | FK → `users.id` |
| description | TEXT | — |
| jobId | UUID | FK → `jobs.id` |
| steps | JSONB | — |
| passingScore | INTEGER | — |
| totalStarted | INTEGER | — |
| totalCompleted | INTEGER | — |
| totalKnockedOut | INTEGER | — |
| avgCompletionTimeSeconds | REAL | — |
| dropoffPoints | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `whatsappScreeningSessions.flowId`

### `whatsappScreeningSessions`

PostgreSQL: `whatsapp_screening_sessions` · 11 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| flowId | UUID | FK → `whatsappScreeningFlows.id` (CASCADE) |
| conversationId | UUID | — |
| answers | JSONB | — |
| totalScore | INTEGER | — |
| maxPossibleScore | INTEGER | — |
| knockoutReason | TEXT | — |
| startedAt | TIMESTAMP | NOT NULL |
| completedAt | TIMESTAMP | — |
| durationSeconds | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |

### `whatsappSegments`

PostgreSQL: `whatsapp_segments` · 6 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | SERIAL | PK |
| description | TEXT | — |
| criteria | TEXT | NOT NULL |
| contactCount | INTEGER | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `whatsappSimulatorSessions`

PostgreSQL: `whatsapp_simulator_sessions` · 10 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | — |
| testerUserId | UUID | NOT NULL |
| persona | JSONB | — |
| messages | JSONB | — |
| issuesFound | JSONB | — |
| rating | INTEGER | — |
| notes | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `whatsappStatusCards`

PostgreSQL: `whatsapp_status_cards` · 12 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | — |
| createdBy | UUID | FK → `users.id` |
| jobId | UUID | FK → `jobs.id` |
| bodyText | TEXT | — |
| logoUrl | TEXT | — |
| tags | JSONB | — |
| viewCount | INTEGER | — |
| shareCount | INTEGER | — |
| applyCount | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `whatsappVoiceNotes`

PostgreSQL: `whatsapp_voice_notes` · 17 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | — |
| conversationId | UUID | — |
| jobId | UUID | FK → `jobs.id` |
| mediaUrl | TEXT | — |
| durationSeconds | INTEGER | — |
| transcription | TEXT | — |
| transcriptionConfidence | REAL | — |
| sentimentScore | REAL | — |
| extractedSkills | JSONB | — |
| extractedExperience | JSONB | — |
| keyPhrases | JSONB | — |
| aiSummary | TEXT | — |
| isReviewed | BOOLEAN | — |
| reviewedBy | UUID | FK → `users.id` |
| tags | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

## Messaging & Inbox

**47 tables** — Email templates, sequences, unified inbox, chatbot, notifications.

### `chatbotAbTests`

PostgreSQL: `chatbot_ab_tests` · 13 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| variantA | JSONB | NOT NULL |
| variantB | JSONB | NOT NULL |
| trafficSplit | INTEGER | — |
| metricsA | JSONB | — |
| metricsB | JSONB | — |
| confidenceLevel | REAL | — |
| startedAt | TIMESTAMP | — |
| completedAt | TIMESTAMP | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `chatbotAiTraining`

PostgreSQL: `chatbot_ai_training` · 11 columns · 4 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| conversationId | UUID | FK → `chatbotConversations.id` (SET NULL) |
| originalQuestion | TEXT | NOT NULL |
| botResponse | TEXT | — |
| correctedResponse | TEXT | — |
| reviewedBy | UUID | FK → `users.id` (SET NULL) |
| reviewedAt | TIMESTAMP | — |
| notes | TEXT | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |

### `chatbotAnalytics`

PostgreSQL: `chatbot_analytics` · 22 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| periodStart | TIMESTAMP | NOT NULL |
| periodEnd | TIMESTAMP | NOT NULL |
| totalConversations | INTEGER | — |
| newVisitors | INTEGER | — |
| returningVisitors | INTEGER | — |
| totalMessages | INTEGER | — |
| botMessages | INTEGER | — |
| humanMessages | INTEGER | — |
| avgResponseTimeMs | INTEGER | — |
| avgConversationDuration | INTEGER | — |
| resolutionRate | REAL | — |
| handoffRate | REAL | — |
| satisfactionScore | REAL | — |
| topIntents | JSONB | — |
| topQuestions | JSONB | — |
| unansweredQuestions | JSONB | — |
| peakHours | JSONB | — |
| conversionEvents | JSONB | — |
| sentimentDistribution | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

### `chatbotCannedResponses`

PostgreSQL: `chatbot_canned_responses` · 9 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| content | TEXT | NOT NULL |
| variables | JSONB | — |
| useCount | INTEGER | — |
| isGlobal | BOOLEAN | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `chatbotConversationNotes`

PostgreSQL: `chatbot_conversation_notes` · 5 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| conversationId | UUID | FK → `chatbotConversations.id` (CASCADE) |
| authorId | UUID | FK → `users.id` (SET NULL) |
| content | TEXT | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |

### `chatbotConversationTags`

PostgreSQL: `chatbot_conversation_tags` · 3 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| conversationId | UUID | FK → `chatbotConversations.id` (CASCADE) |
| createdAt | TIMESTAMP | NOT NULL |

### `chatbotConversations`

PostgreSQL: `chatbot_conversations` · 7 columns · 1 FK out · 6 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| messages | JSONB | — |
| context | JSONB | — |
| resolvedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `chatbotAiTraining.conversationId`, `chatbotSatisfaction.conversationId`, `chatbotConversationTags.conversationId`, `chatbotConversationNotes.conversationId`, `chatbotLiveSessions.conversationId`, `chatbotLeadScores.conversationId`

### `chatbotEmbedConfigs`

PostgreSQL: `chatbot_embed_configs` · 12 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| config | JSONB | — |
| embedCode | TEXT | — |
| qrCodeData | TEXT | — |
| impressions | INTEGER | — |
| conversations | INTEGER | — |
| conversions | INTEGER | — |
| isActive | BOOLEAN | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `chatbotFaqs`

PostgreSQL: `chatbot_faqs` · 6 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | SERIAL | PK |
| question | TEXT | NOT NULL |
| answer | TEXT | NOT NULL |
| usageCount | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `chatbotFlows`

PostgreSQL: `chatbot_flows` · 12 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| nodes | JSONB | — |
| isActive | BOOLEAN | — |
| usageCount | INTEGER | — |
| completionRate | REAL | — |
| avgDuration | INTEGER | — |
| version | INTEGER | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `chatbotHandoffRules`

PostgreSQL: `chatbot_handoff_rules` · 9 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| assignToUserId | UUID | FK → `users.id` (SET NULL) |
| notifyVia | JSONB | — |
| priority | INTEGER | — |
| isActive | BOOLEAN | — |
| triggerCount | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `chatbotIntelligenceReports`

PostgreSQL: `chatbot_intelligence_reports` · 10 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| periodStart | TIMESTAMP | NOT NULL |
| periodEnd | TIMESTAMP | NOT NULL |
| insights | JSONB | — |
| intentMatrix | JSONB | — |
| unansweredQuestions | JSONB | — |
| performanceScores | JSONB | — |
| trendData | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

### `chatbotIntents`

PostgreSQL: `chatbot_intents` · 7 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | SERIAL | PK |
| description | TEXT | — |
| trainingPhrases | JSONB | — |
| accuracy | REAL | — |
| matchCount | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `chatbotKnowledgeBase`

PostgreSQL: `chatbot_knowledge_base` · 15 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| question | TEXT | NOT NULL |
| alternativeQuestions | JSONB | — |
| answer | TEXT | NOT NULL |
| priority | INTEGER | — |
| isActive | BOOLEAN | — |
| hitCount | INTEGER | — |
| helpfulCount | INTEGER | — |
| unhelpfulCount | INTEGER | — |
| confidenceThreshold | REAL | — |
| tags | JSONB | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `chatbotLeadScores`

PostgreSQL: `chatbot_lead_scores` · 9 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| conversationId | UUID | FK → `chatbotConversations.id` (SET NULL) |
| totalScore | INTEGER | — |
| signals | JSONB | — |
| assignedTo | UUID | FK → `users.id` (SET NULL) |
| convertedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `chatbotLeadScoringRules`

PostgreSQL: `chatbot_lead_scoring_rules` · 5 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| points | INTEGER | NOT NULL |
| isActive | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |

### `chatbotLiveSessions`

PostgreSQL: `chatbot_live_sessions` · 13 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| conversationId | UUID | FK → `chatbotConversations.id` (CASCADE) |
| agentId | UUID | FK → `users.id` (SET NULL) |
| aiSuggestions | JSONB | — |
| agentMessages | JSONB | — |
| visitorContext | JSONB | — |
| takenOverAt | TIMESTAMP | NOT NULL |
| returnedToBotAt | TIMESTAMP | — |
| endedAt | TIMESTAMP | — |
| satisfactionRating | INTEGER | — |
| notes | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

### `chatbotProactiveTriggers`

PostgreSQL: `chatbot_proactive_triggers` · 12 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| message | TEXT | NOT NULL |
| targetPages | JSONB | — |
| priority | INTEGER | — |
| maxTriggersPerVisitor | INTEGER | — |
| cooldownMinutes | INTEGER | — |
| isActive | BOOLEAN | — |
| triggerCount | INTEGER | — |
| conversionCount | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `chatbotSatisfaction`

PostgreSQL: `chatbot_satisfaction` · 8 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| conversationId | UUID | FK → `chatbotConversations.id` (SET NULL) |
| rating | INTEGER | NOT NULL |
| feedback | TEXT | — |
| wasResolved | BOOLEAN | — |
| handedOffToHuman | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |

### `chatbotSimulatorSessions`

PostgreSQL: `chatbot_simulator_sessions` · 12 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| testerId | UUID | FK → `users.id` (SET NULL) |
| persona | JSONB | — |
| messages | JSONB | — |
| kbMatchesUsed | JSONB | — |
| flowsTriggered | JSONB | — |
| issuesFound | JSONB | — |
| overallScore | INTEGER | — |
| notes | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `chatbotVisitors`

PostgreSQL: `chatbot_visitors` · 15 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| location | JSONB | — |
| device | JSONB | — |
| pagesVisited | JSONB | — |
| totalVisits | INTEGER | — |
| totalConversations | INTEGER | — |
| lastSeenAt | TIMESTAMP | — |
| tags | JSONB | — |
| customFields | JSONB | — |
| leadScore | INTEGER | — |
| isBlocked | BOOLEAN | — |
| firstSeenAt | TIMESTAMP | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `chatbotWidgetConfig`

PostgreSQL: `chatbot_widget_config` · 18 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| welcomeMessage | TEXT | — |
| offlineMessage | TEXT | — |
| avatarUrl | TEXT | — |
| greetingsByTimeOfDay | JSONB | — |
| enabledPages | JSONB | — |
| excludedPages | JSONB | — |
| showOnMobile | BOOLEAN | — |
| requireEmailBeforeChat | BOOLEAN | — |
| autoOpenDelay | INTEGER | — |
| customCss | TEXT | — |
| availableLanguages | JSONB | — |
| businessHours | JSONB | — |
| isActive | BOOLEAN | — |
| embedCode | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `conversationLabels`

PostgreSQL: `conversation_labels` · 4 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| conversationId | UUID | NOT NULL, FK → `conversations.id` (CASCADE) |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| createdAt | TIMESTAMP | NOT NULL |

### `conversationNotes`

PostgreSQL: `conversation_notes` · 7 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| conversationId | UUID | NOT NULL, FK → `conversations.id` (CASCADE) |
| authorId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| body | TEXT | NOT NULL |
| isPinned | BOOLEAN | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `conversations`

PostgreSQL: `conversations` · 8 columns · 3 FK out · 4 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| applicationId | UUID | NOT NULL, FK → `jobApplications.id` (CASCADE) |
| recruiterId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| candidateId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| lastMessageAt | TIMESTAMP | NOT NULL |
| isArchived | BOOLEAN | NOT NULL |
| isPinned | BOOLEAN | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |

**Referenced by:** `messages.conversationId`, `conversationLabels.conversationId`, `conversationNotes.conversationId`, `scheduledMessages.conversationId`

### `emailSequenceExecutions`

PostgreSQL: `email_sequence_executions` · 7 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| sequenceId | UUID | NOT NULL, FK → `emailSequences.id` (CASCADE) |
| stepId | UUID | NOT NULL, FK → `emailSequenceSteps.id` (CASCADE) |
| applicationId | UUID | FK → `jobApplications.id` (CASCADE) |
| scheduledAt | TIMESTAMP | — |
| sentAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

### `emailSequenceSteps`

PostgreSQL: `email_sequence_steps` · 6 columns · 2 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| sequenceId | UUID | NOT NULL, FK → `emailSequences.id` (CASCADE) |
| templateId | UUID | NOT NULL, FK → `emailTemplates.id` (CASCADE) |
| delayMinutes | INTEGER | — |
| order | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |

**Referenced by:** `emailSequenceExecutions.stepId`

### `emailSequences`

PostgreSQL: `email_sequences` · 7 columns · 2 FK out · 2 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| triggerCondition | JSONB | — |
| isActive | BOOLEAN | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `emailSequenceSteps.sequenceId`, `emailSequenceExecutions.sequenceId`

### `emailTemplates`

PostgreSQL: `email_templates` · 8 columns · 2 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| body | TEXT | NOT NULL |
| variables | JSONB | — |
| isActive | BOOLEAN | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `emailSequenceSteps.templateId`

### `messageReactions`

PostgreSQL: `message_reactions` · 4 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| messageId | UUID | NOT NULL, FK → `messages.id` (CASCADE) |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| createdAt | TIMESTAMP | NOT NULL |

### `messageTemplates`

PostgreSQL: `message_templates` · 5 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| body | TEXT | NOT NULL |
| usageCount | INTEGER | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |

### `messages`

PostgreSQL: `messages` · 8 columns · 2 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| conversationId | UUID | NOT NULL, FK → `conversations.id` (CASCADE) |
| senderId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| body | TEXT | NOT NULL |
| isRead | BOOLEAN | NOT NULL |
| isStarred | BOOLEAN | NOT NULL |
| readAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

**Referenced by:** `messageReactions.messageId`

### `notifications`

PostgreSQL: `notifications` · 7 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| body | TEXT | — |
| link | TEXT | — |
| isRead | BOOLEAN | — |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

### `unifiedInboxCannedResponses`

PostgreSQL: `unified_inbox_canned_responses` · 9 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| body | TEXT | NOT NULL |
| variables | JSONB | — |
| usageCount | INTEGER | — |
| isShared | BOOLEAN | — |
| createdBy | UUID | FK → `users.id` |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `unifiedInboxContacts`

PostgreSQL: `unified_inbox_contacts` · 11 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| linkedApplicationIds | JSONB | — |
| tags | JSONB | — |
| notes | TEXT | — |
| lastContactedAt | TIMESTAMP | — |
| totalMessages | INTEGER | — |
| channels | JSONB | — |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `unifiedInboxFollowUpRules`

PostgreSQL: `unified_inbox_follow_up_rules` · 10 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| staleAfterHours | INTEGER | — |
| autoMessageTemplate | TEXT | — |
| isAutoSend | BOOLEAN | — |
| isEnabled | BOOLEAN | — |
| executionCount | INTEGER | — |
| lastExecutedAt | TIMESTAMP | — |
| createdBy | UUID | FK → `users.id` |
| createdAt | TIMESTAMP | NOT NULL |

### `unifiedInboxIntelligence`

PostgreSQL: `unified_inbox_intelligence` · 13 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| threadId | UUID | NOT NULL, FK → `unifiedInboxThreads.id` (CASCADE) |
| healthScore | INTEGER | — |
| responseVelocity | REAL | — |
| candidateResponsiveness | REAL | — |
| recruiterResponsiveness | REAL | — |
| keyEntities | JSONB | — |
| nextBestActionReason | TEXT | — |
| riskFlags | JSONB | — |
| topicHistory | JSONB | — |
| lastAnalyzedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `unifiedInboxLabels`

PostgreSQL: `unified_inbox_labels` · 6 columns · 2 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| isSystem | BOOLEAN | — |
| sortOrder | INTEGER | — |
| createdBy | UUID | FK → `users.id` |
| createdAt | TIMESTAMP | NOT NULL |

**Referenced by:** `unifiedInboxThreadLabels.labelId`

### `unifiedInboxMessages`

PostgreSQL: `unified_inbox_messages` · 7 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| body | TEXT | — |
| metadata | JSONB | — |
| isRead | BOOLEAN | — |
| readAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

### `unifiedInboxNotes`

PostgreSQL: `unified_inbox_notes` · 7 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| threadId | UUID | NOT NULL, FK → `unifiedInboxThreads.id` (CASCADE) |
| authorId | UUID | NOT NULL, FK → `users.id` |
| body | TEXT | NOT NULL |
| isPinned | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `unifiedInboxSavedViews`

PostgreSQL: `unified_inbox_saved_views` · 8 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| createdBy | UUID | FK → `users.id` |
| filters | JSONB | — |
| isShared | BOOLEAN | — |
| isSystem | BOOLEAN | — |
| sortOrder | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |

### `unifiedInboxScheduledMessages`

PostgreSQL: `unified_inbox_scheduled_messages` · 9 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| threadId | UUID | FK → `unifiedInboxThreads.id` (SET NULL) |
| body | TEXT | NOT NULL |
| scheduledFor | TIMESTAMP | NOT NULL |
| sentAt | TIMESTAMP | — |
| failureReason | TEXT | — |
| createdBy | UUID | FK → `users.id` |
| createdAt | TIMESTAMP | NOT NULL |

### `unifiedInboxSignatures`

PostgreSQL: `unified_inbox_signatures` · 7 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| body | TEXT | NOT NULL |
| isDefault | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `unifiedInboxSlaConfigs`

PostgreSQL: `unified_inbox_sla_configs` · 7 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| targetMinutes | INTEGER | NOT NULL |
| warningMinutes | INTEGER | NOT NULL |
| escalateToUserId | UUID | FK → `users.id` |
| isEnabled | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |

### `unifiedInboxThreadLabels`

PostgreSQL: `unified_inbox_thread_labels` · 4 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| threadId | UUID | NOT NULL, FK → `unifiedInboxThreads.id` (CASCADE) |
| labelId | UUID | NOT NULL, FK → `unifiedInboxLabels.id` (CASCADE) |
| createdAt | TIMESTAMP | NOT NULL |

### `unifiedInboxThreads`

PostgreSQL: `unified_inbox_threads` · 20 columns · 2 FK out · 4 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| snippet | TEXT | — |
| messageCount | INTEGER | — |
| unreadCount | INTEGER | — |
| isStarred | BOOLEAN | — |
| isArchived | BOOLEAN | — |
| isSnoozed | BOOLEAN | — |
| snoozedUntil | TIMESTAMP | — |
| assignedTo | UUID | FK → `users.id` (SET NULL) |
| lastMessageAt | TIMESTAMP | — |
| lastMessageBody | TEXT | — |
| responseTimeAvg | INTEGER | — |
| sentimentScore | REAL | — |
| aiSummary | TEXT | — |
| linkedApplicationId | UUID | — |
| linkedJobId | UUID | — |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `unifiedInboxThreadLabels.threadId`, `unifiedInboxNotes.threadId`, `unifiedInboxScheduledMessages.threadId`, `unifiedInboxIntelligence.threadId`

### `unifiedInboxTranslations`

PostgreSQL: `unified_inbox_translations` · 6 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| messageId | UUID | NOT NULL |
| originalText | TEXT | NOT NULL |
| translatedText | TEXT | NOT NULL |
| confidence | REAL | — |
| createdAt | TIMESTAMP | NOT NULL |

## Talent CRM

**26 tables** — Talent pools, CRM contacts, engagement signals, nurture autopilots, rediscovery.

### `rediscoveryAnalyticsEvents`

PostgreSQL: `rediscovery_analytics_events` · 7 columns · 4 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| candidateId | UUID | FK → `candidates.id` (SET NULL) |
| jobId | UUID | FK → `jobs.id` (SET NULL) |
| campaignId | UUID | FK → `rediscoveryCampaigns.id` (SET NULL) |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

### `rediscoveryCampaignSteps`

PostgreSQL: `rediscovery_campaign_steps` · 8 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| campaignId | UUID | NOT NULL, FK → `rediscoveryCampaigns.id` (CASCADE) |
| stepOrder | INTEGER | NOT NULL |
| content | TEXT | — |
| delayDays | INTEGER | — |
| templateId | UUID | — |
| condition | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

### `rediscoveryCampaigns`

PostgreSQL: `rediscovery_campaigns` · 16 columns · 3 FK out · 2 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| jobId | UUID | FK → `jobs.id` (SET NULL) |
| targetAudience | JSONB | — |
| totalRecipients | INTEGER | — |
| sentCount | INTEGER | — |
| openedCount | INTEGER | — |
| repliedCount | INTEGER | — |
| convertedCount | INTEGER | — |
| scheduledAt | TIMESTAMP | — |
| startedAt | TIMESTAMP | — |
| completedAt | TIMESTAMP | — |
| createdBy | UUID | FK → `users.id` |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `rediscoveryCampaignSteps.campaignId`, `rediscoveryAnalyticsEvents.campaignId`

### `rediscoveryCandidateNotes`

PostgreSQL: `rediscovery_candidate_notes` · 8 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| candidateId | UUID | NOT NULL, FK → `candidates.id` (CASCADE) |
| authorId | UUID | NOT NULL, FK → `users.id` |
| content | TEXT | NOT NULL |
| isPinned | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `rediscoveryCandidateRatings`

PostgreSQL: `rediscovery_candidate_ratings` · 7 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| candidateId | UUID | NOT NULL, FK → `candidates.id` (CASCADE) |
| raterId | UUID | NOT NULL, FK → `users.id` |
| rating | INTEGER | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `rediscoveryIntelligence`

PostgreSQL: `rediscovery_intelligence` · 17 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| candidateId | UUID | NOT NULL, FK → `candidates.id` (CASCADE) |
| careerVelocity | REAL | — |
| adjacencyMatchScore | REAL | — |
| redemptionScore | REAL | — |
| redeemedSkills | JSONB | — |
| moveLikelihood | REAL | — |
| urgencyScore | REAL | — |
| marketHalfLife | INTEGER | — |
| nextOptimalWindow | TIMESTAMP | — |
| windowStrength | REAL | — |
| isBoomerang | BOOLEAN | — |
| boomerangTenure | INTEGER | — |
| boomerangDepartedAt | TIMESTAMP | — |
| computedAt | TIMESTAMP | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |

### `rediscoveryLossReasons`

PostgreSQL: `rediscovery_loss_reasons` · 8 columns · 4 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| candidateId | UUID | NOT NULL, FK → `candidates.id` (CASCADE) |
| jobId | UUID | FK → `jobs.id` (SET NULL) |
| details | TEXT | — |
| winBackStrategy | TEXT | — |
| recordedBy | UUID | FK → `users.id` |
| recordedAt | TIMESTAMP | NOT NULL |

### `rediscoveryOutreachTemplates`

PostgreSQL: `rediscovery_outreach_templates` · 10 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| content | TEXT | NOT NULL |
| variables | JSONB | — |
| useCount | INTEGER | — |
| responseRate | REAL | — |
| isDefault | BOOLEAN | — |
| createdBy | UUID | FK → `users.id` |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `rediscoveryPoolHealth`

PostgreSQL: `rediscovery_pool_health` · 10 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| overallScore | REAL | NOT NULL |
| freshness | REAL | — |
| skillCurrency | REAL | — |
| engagementDecayRate | REAL | — |
| skillDiversity | REAL | — |
| pipelineVelocity | REAL | — |
| alerts | JSONB | — |
| computedAt | TIMESTAMP | NOT NULL |

### `rediscoverySegmentMembers`

PostgreSQL: `rediscovery_segment_members` · 4 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| segmentId | UUID | NOT NULL, FK → `rediscoverySegments.id` (CASCADE) |
| candidateId | UUID | NOT NULL, FK → `candidates.id` (CASCADE) |
| addedAt | TIMESTAMP | NOT NULL |

### `rediscoverySegments`

PostgreSQL: `rediscovery_segments` · 9 columns · 2 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| criteria | JSONB | — |
| isAutomatic | BOOLEAN | — |
| memberCount | INTEGER | — |
| createdBy | UUID | FK → `users.id` |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `rediscoverySegmentMembers.segmentId`

### `rediscoverySignals`

PostgreSQL: `rediscovery_signals` · 7 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| candidateId | UUID | NOT NULL, FK → `candidates.id` (CASCADE) |
| signalStrength | INTEGER | NOT NULL |
| details | TEXT | — |
| isRead | BOOLEAN | — |
| detectedAt | TIMESTAMP | NOT NULL |

### `rediscoveryWatchlist`

PostgreSQL: `rediscovery_watchlist` · 7 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| candidateId | UUID | NOT NULL, FK → `candidates.id` (CASCADE) |
| watcherId | UUID | NOT NULL, FK → `users.id` |
| reason | TEXT | — |
| notifyOnUpdate | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |

### `talentCrmActivities`

PostgreSQL: `talent_crm_activities` · 6 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| contactId | UUID | NOT NULL, FK → `talentCrmContacts.id` (CASCADE) |
| userId | UUID | FK → `users.id` (SET NULL) |
| body | TEXT | — |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

### `talentCrmConnections`

PostgreSQL: `talent_crm_connections` · 9 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| contactAId | UUID | NOT NULL, FK → `talentCrmContacts.id` (CASCADE) |
| contactBId | UUID | NOT NULL, FK → `talentCrmContacts.id` (CASCADE) |
| strength | REAL | — |
| context | TEXT | — |
| inferredByAi | BOOLEAN | — |
| confirmed | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |

### `talentCrmContacts`

PostgreSQL: `talent_crm_contacts` · 26 columns · 2 FK out · 8 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| candidateId | UUID | FK → `candidates.id` (SET NULL) |
| engagementScore | REAL | — |
| lastContactedAt | TIMESTAMP | — |
| lastEngagedAt | TIMESTAMP | — |
| tags | JSONB | — |
| notes | TEXT | — |
| customFields | JSONB | — |
| engagementVelocity | REAL | — |
| avgResponseTimeHours | REAL | — |
| preferredDayOfWeek | INTEGER | — |
| preferredHourOfDay | INTEGER | — |
| skills | JSONB | — |
| enrichedAt | TIMESTAMP | — |
| jobChangeDetectedAt | TIMESTAMP | — |
| estimatedPlacementFee | INTEGER | — |
| placementProbability | REAL | — |
| expectedRevenue | INTEGER | — |
| estimatedStartDate | TIMESTAMP | — |
| targetJobId | UUID | — |
| targetClientId | UUID | — |
| networkScore | REAL | — |
| referralCount | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `talentCrmActivities.contactId`, `talentCrmEngagementSignals.contactId`, `talentCrmIntelligence.contactId`, `talentCrmMatchResults.contactId`, `talentCrmNurtureAutopilots.contactId`, `talentCrmNurtureTouchpoints.contactId`, `talentCrmConnections.contactAId`, `talentCrmConnections.contactBId`

### `talentCrmEngagementSignals`

PostgreSQL: `talent_crm_engagement_signals` · 11 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| contactId | UUID | NOT NULL, FK → `talentCrmContacts.id` (CASCADE) |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| severity | REAL | — |
| aiRecommendation | TEXT | — |
| recommendedTiming | TIMESTAMP | — |
| contextData | JSONB | — |
| isDismissed | BOOLEAN | — |
| isActioned | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| expiresAt | TIMESTAMP | — |

### `talentCrmIntelligence`

PostgreSQL: `talent_crm_intelligence` · 10 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| contactId | UUID | NOT NULL, FK → `talentCrmContacts.id` (CASCADE) |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| relationshipSummary | TEXT | — |
| sentimentHistory | JSONB | — |
| keyTopics | JSONB | — |
| openCommitments | JSONB | — |
| nextActionSuggestion | TEXT | — |
| lastAnalyzedActivityId | UUID | — |
| updatedAt | TIMESTAMP | NOT NULL |

### `talentCrmMatchResults`

PostgreSQL: `talent_crm_match_results` · 10 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| jobId | UUID | — |
| contactId | UUID | NOT NULL, FK → `talentCrmContacts.id` (CASCADE) |
| matchScore | REAL | — |
| matchReasons | JSONB | — |
| skillOverlap | JSONB | — |
| generatedMessages | JSONB | — |
| isContacted | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |

### `talentCrmNurtureAutopilots`

PostgreSQL: `talent_crm_nurture_autopilots` · 11 columns · 3 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| contactId | UUID | NOT NULL, FK → `talentCrmContacts.id` (CASCADE) |
| cadenceDays | INTEGER | — |
| channels | JSONB | — |
| maxTouchpoints | INTEGER | — |
| touchpointsSent | INTEGER | — |
| lastTouchpointAt | TIMESTAMP | — |
| startedAt | TIMESTAMP | NOT NULL |
| endsAt | TIMESTAMP | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |

**Referenced by:** `talentCrmNurtureTouchpoints.autopilotId`

### `talentCrmNurtureTouchpoints`

PostgreSQL: `talent_crm_nurture_touchpoints` · 8 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| autopilotId | UUID | NOT NULL, FK → `talentCrmNurtureAutopilots.id` (CASCADE) |
| contactId | UUID | NOT NULL, FK → `talentCrmContacts.id` (CASCADE) |
| body | TEXT | — |
| scheduledFor | TIMESTAMP | — |
| approvedBy | UUID | — |
| sentAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

### `talentCrmRevenueSnapshots`

PostgreSQL: `talent_crm_revenue_snapshots` · 10 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| snapshotDate | TIMESTAMP | NOT NULL |
| totalPipelineValue | INTEGER | — |
| weightedPipelineValue | INTEGER | — |
| forecast30d | INTEGER | — |
| forecast60d | INTEGER | — |
| forecast90d | INTEGER | — |
| byStage | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

### `talentPoolMembers`

PostgreSQL: `talent_pool_members` · 8 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| poolId | UUID | NOT NULL, FK → `talentPools.id` (CASCADE) |
| candidateId | UUID | FK → `candidates.id` (CASCADE) |
| notes | TEXT | — |
| tags | JSONB | — |
| lastContactedAt | TIMESTAMP | — |
| addedBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |

### `talentPools`

PostgreSQL: `talent_pools` · 8 columns · 2 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| tags | JSONB | — |
| isActive | BOOLEAN | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `talentPoolMembers.poolId`

### `talentRediscoveryEngagements`

PostgreSQL: `talent_rediscovery_engagements` · 8 columns · 4 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| matchId | UUID | FK → `talentRediscoveryMatches.id` (SET NULL) |
| candidateId | UUID | NOT NULL, FK → `candidates.id` (CASCADE) |
| jobId | UUID | NOT NULL, FK → `jobs.id` (CASCADE) |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `talentRediscoveryMatches`

PostgreSQL: `talent_rediscovery_matches` · 8 columns · 3 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| jobId | UUID | NOT NULL, FK → `jobs.id` (CASCADE) |
| candidateId | UUID | NOT NULL, FK → `candidates.id` (CASCADE) |
| matchScore | REAL | — |
| matchReasons | JSONB | — |
| reviewedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

**Referenced by:** `talentRediscoveryEngagements.matchId`

## Community & Learning

**28 tables** — Community posts, mentorship, skill verification, learning resources.

### `communityBadges`

PostgreSQL: `community_badges` · 4 columns · 0 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | NOT NULL |
| criteria | JSONB | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |

**Referenced by:** `communityUserBadges.badgeId`

### `communityBookmarks`

PostgreSQL: `community_bookmarks` · 4 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| postId | UUID | NOT NULL, FK → `communityPosts.id` (CASCADE) |
| createdAt | TIMESTAMP | NOT NULL |

### `communityChallengeEntries`

PostgreSQL: `community_challenge_entries` · 5 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| challengeId | UUID | NOT NULL, FK → `communityChallenges.id` (CASCADE) |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| postId | UUID | FK → `communityPosts.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |

### `communityChallenges`

PostgreSQL: `community_challenges` · 7 columns · 0 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | NOT NULL |
| startsAt | TIMESTAMP | NOT NULL |
| endsAt | TIMESTAMP | NOT NULL |
| bonusPoints | INTEGER | — |
| participantCount | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |

**Referenced by:** `communityChallengeEntries.challengeId`

### `communityComments`

PostgreSQL: `community_comments` · 7 columns · 2 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| postId | UUID | NOT NULL, FK → `communityPosts.id` (CASCADE) |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| body | TEXT | NOT NULL |
| parentId | UUID | — |
| upvotes | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |

**Referenced by:** `communityReports.commentId`

### `communityInterviewExperiences`

PostgreSQL: `community_interview_experiences` · 11 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| difficulty | INTEGER | — |
| stages | JSONB | — |
| questionsAsked | JSONB | — |
| tips | TEXT | — |
| overallExperience | TEXT | — |
| rating | INTEGER | — |
| isAnonymous | BOOLEAN | — |
| upvotes | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |

### `communityMentorProfiles`

PostgreSQL: `community_mentor_profiles` · 13 columns · 1 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, UNIQUE, FK → `users.id` (CASCADE) |
| bio | TEXT | — |
| industries | JSONB | — |
| expertise | JSONB | — |
| yearsExperience | INTEGER | — |
| maxMentees | INTEGER | — |
| currentMentees | INTEGER | — |
| isAvailable | BOOLEAN | — |
| totalSessions | INTEGER | — |
| avgRating | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `communityMentorRequests.mentorId`

### `communityMentorRequests`

PostgreSQL: `community_mentor_requests` · 7 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| mentorId | UUID | NOT NULL, FK → `communityMentorProfiles.id` (CASCADE) |
| menteeId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| message | TEXT | — |
| goals | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `communityPollVotes`

PostgreSQL: `community_poll_votes` · 5 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| pollId | UUID | NOT NULL, FK → `communityPolls.id` (CASCADE) |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| optionIndex | INTEGER | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |

### `communityPolls`

PostgreSQL: `community_polls` · 6 columns · 1 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| postId | UUID | NOT NULL, FK → `communityPosts.id` (CASCADE) |
| options | JSONB | NOT NULL |
| voteCounts | JSONB | — |
| endsAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

**Referenced by:** `communityPollVotes.pollId`

### `communityPostViews`

PostgreSQL: `community_post_views` · 4 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| postId | UUID | NOT NULL, FK → `communityPosts.id` (CASCADE) |
| viewedAt | TIMESTAMP | NOT NULL |

### `communityPosts`

PostgreSQL: `community_posts` · 12 columns · 1 FK out · 7 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| body | TEXT | NOT NULL |
| tags | JSONB | — |
| upvotes | INTEGER | — |
| commentCount | INTEGER | — |
| isPinned | BOOLEAN | — |
| isAnonymous | BOOLEAN | — |
| metadata | JSONB | — |
| aiSummary | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `communityComments.postId`, `communityBookmarks.postId`, `communityReactions.postId`, `communityPostViews.postId`, `communityPolls.postId`, `communityReports.postId`, `communityChallengeEntries.postId`

### `communityReactions`

PostgreSQL: `community_reactions` · 4 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| postId | UUID | NOT NULL, FK → `communityPosts.id` (CASCADE) |
| createdAt | TIMESTAMP | NOT NULL |

### `communityReports`

PostgreSQL: `community_reports` · 6 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| reporterId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| postId | UUID | FK → `communityPosts.id` (CASCADE) |
| commentId | UUID | FK → `communityComments.id` (CASCADE) |
| details | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

### `communityUserBadges`

PostgreSQL: `community_user_badges` · 4 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| badgeId | UUID | NOT NULL, FK → `communityBadges.id` (CASCADE) |
| awardedAt | TIMESTAMP | NOT NULL |

### `learningEnrollments`

PostgreSQL: `learning_enrollments` · 7 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| resourceId | UUID | NOT NULL, FK → `learningResources.id` (CASCADE) |
| progress | INTEGER | — |
| completedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `learningResources`

PostgreSQL: `learning_resources` · 7 columns · 0 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| url | TEXT | — |
| skillTags | JSONB | — |
| rating | REAL | — |
| description | TEXT | — |
| isActive | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |

**Referenced by:** `learningEnrollments.resourceId`

### `salaryNegotiations`

PostgreSQL: `salary_negotiations` · 8 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| targetSalary | INTEGER | — |
| currentSalary | INTEGER | — |
| messages | JSONB | — |
| aiSuggestions | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `skillBattleRecords`

PostgreSQL: `skill_battle_records` · 13 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| questionsCount | INTEGER | NOT NULL |
| correctCount | INTEGER | NOT NULL |
| totalPoints | INTEGER | NOT NULL |
| maxPoints | INTEGER | NOT NULL |
| timeTakenSeconds | INTEGER | — |
| avgTimePerQuestion | REAL | — |
| streak | INTEGER | NOT NULL |
| xpEarned | INTEGER | NOT NULL |
| accuracy | REAL | — |
| battleData | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

### `skillChallengeAttempts`

PostgreSQL: `skill_challenge_attempts` · 10 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| challengeId | UUID | NOT NULL, FK → `skillChallenges.id` (CASCADE) |
| skillVerificationId | UUID | FK → `skillVerifications.id` (SET NULL) |
| score | INTEGER | NOT NULL |
| passed | BOOLEAN | NOT NULL |
| timeTakenSeconds | INTEGER | — |
| answers | JSONB | — |
| startedAt | TIMESTAMP | NOT NULL |
| completedAt | TIMESTAMP | NOT NULL |

### `skillChallenges`

PostgreSQL: `skill_challenges` · 6 columns · 0 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| questions | JSONB | — |
| timeLimitSeconds | INTEGER | — |
| passingScore | INTEGER | — |
| isActive | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |

**Referenced by:** `skillChallengeAttempts.challengeId`

### `skillEndorsements`

PostgreSQL: `skill_endorsements` · 5 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| candidateId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| endorserId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| message | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

### `skillInterviewPrep`

PostgreSQL: `skill_interview_prep` · 10 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| skillVerificationId | UUID | FK → `skillVerifications.id` (SET NULL) |
| questions | JSONB | — |
| practiceSessions | JSONB | — |
| readinessScore | INTEGER | — |
| lastPracticedAt | TIMESTAMP | — |
| totalSessions | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `skillProjects`

PostgreSQL: `skill_projects` · 6 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| description | TEXT | — |
| skillIds | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `skillVerificationRequests`

PostgreSQL: `skill_verification_requests` · 8 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| skillVerificationId | UUID | NOT NULL, FK → `skillVerifications.id` (CASCADE) |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| message | TEXT | — |
| verifierResponse | TEXT | — |
| expiresAt | TIMESTAMP | NOT NULL |
| respondedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

### `skillVerifications`

PostgreSQL: `skill_verifications` · 19 columns · 1 FK out · 4 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| credentialUrl | TEXT | — |
| verifiedAt | TIMESTAMP | — |
| expiresAt | TIMESTAMP | — |
| badgeUrl | TEXT | — |
| yearsExperience | INTEGER | — |
| isHotSkill | BOOLEAN | — |
| linkedCredentialId | INTEGER | — |
| lastUsedAt | TIMESTAMP | — |
| lastRefreshedAt | TIMESTAMP | — |
| challengeVerified | BOOLEAN | — |
| challengeScore | INTEGER | — |
| challengeCompletedAt | TIMESTAMP | — |
| evidenceUrl | TEXT | — |
| evidenceMetadata | JSONB | — |
| autoVerified | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `skillVerificationRequests.skillVerificationId`, `skillChallengeAttempts.skillVerificationId`, `skillVideoProofs.skillVerificationId`, `skillInterviewPrep.skillVerificationId`

### `skillVideoProofs`

PostgreSQL: `skill_video_proofs` · 12 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| skillVerificationId | UUID | FK → `skillVerifications.id` (SET NULL) |
| videoUrl | TEXT | NOT NULL |
| thumbnailUrl | TEXT | — |
| description | TEXT | — |
| durationSeconds | INTEGER | — |
| viewCount | INTEGER | — |
| isPublic | BOOLEAN | — |
| aiSummary | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `skills`

PostgreSQL: `skills` · 2 columns · 0 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| createdAt | TIMESTAMP | NOT NULL |

**Referenced by:** `candidateSkills.skillId`

## Compliance (POPIA/B-BBEE/EE)

**54 tables** — South African compliance: POPIA consent/breach, B-BBEE scoring, Employment Equity.

### `bbbeeCertificates`

PostgreSQL: `bbbee_certificates` · 11 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| issueDate | TIMESTAMP | — |
| expiryDate | TIMESTAMP | — |
| bbbeeLevel | INTEGER | — |
| totalScore | REAL | — |
| certificateUrl | TEXT | — |
| swornoAffidavitUrl | TEXT | — |
| notes | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `bbbeeClientPortfolio`

PostgreSQL: `bbbee_client_portfolio` · 20 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| currentLevel | INTEGER | — |
| targetLevel | INTEGER | — |
| totalScore | REAL | — |
| ownershipScore | REAL | — |
| managementControlScore | REAL | — |
| skillsDevelopmentScore | REAL | — |
| enterpriseDevelopmentScore | REAL | — |
| socioEconomicScore | REAL | — |
| preferentialProcurementScore | REAL | — |
| certificateExpiry | TIMESTAMP | — |
| annualTurnover | REAL | — |
| placementsCount | INTEGER | — |
| transformationPlacements | INTEGER | — |
| lastReviewDate | TIMESTAMP | — |
| nextReviewDate | TIMESTAMP | — |
| notes | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `bbbeeCommitteeMeetings`

PostgreSQL: `bbbee_committee_meetings` · 13 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| meetingDate | TIMESTAMP | NOT NULL |
| agenda | TEXT | — |
| minutes | TEXT | — |
| attendees | JSONB | — |
| decisions | JSONB | — |
| actionItems | JSONB | — |
| nextMeetingDate | TIMESTAMP | — |
| attachmentUrls | JSONB | — |
| notes | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `bbbeeComplianceAlerts`

PostgreSQL: `bbbee_compliance_alerts` · 8 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| message | TEXT | — |
| dueDate | TIMESTAMP | — |
| isRead | BOOLEAN | — |
| isDismissed | BOOLEAN | — |
| relatedEntityId | UUID | — |
| createdAt | TIMESTAMP | NOT NULL |

### `bbbeeComplianceChecklist`

PostgreSQL: `bbbee_compliance_checklist` · 12 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| checklistYear | INTEGER | NOT NULL |
| itemDescription | TEXT | — |
| dueDate | TIMESTAMP | — |
| completedAt | TIMESTAMP | — |
| evidenceUrl | TEXT | — |
| evidenceNotes | TEXT | — |
| sortOrder | INTEGER | — |
| isRequired | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `bbbeeComplianceDeadlines`

PostgreSQL: `bbbee_compliance_deadlines` · 12 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| dueDate | TIMESTAMP | NOT NULL |
| reminderDays | INTEGER | — |
| description | TEXT | — |
| completedAt | TIMESTAMP | — |
| isRecurring | BOOLEAN | — |
| recurrenceMonths | INTEGER | — |
| relatedEntityId | UUID | — |
| notes | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `bbbeeDocumentVault`

PostgreSQL: `bbbee_document_vault` · 12 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| documentUrl | TEXT | — |
| fileSize | INTEGER | — |
| relatedEntityId | UUID | — |
| expiryDate | TIMESTAMP | — |
| version | INTEGER | — |
| tags | JSONB | — |
| isArchived | BOOLEAN | — |
| notes | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `bbbeeImprovementPlans`

PostgreSQL: `bbbee_improvement_plans` · 13 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| initiative | TEXT | NOT NULL |
| description | TEXT | — |
| targetScore | REAL | — |
| currentScore | REAL | — |
| startDate | TIMESTAMP | — |
| targetDate | TIMESTAMP | — |
| progress | INTEGER | — |
| notes | TEXT | — |
| completedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `bbbeeOwnershipAnalysis`

PostgreSQL: `bbbee_ownership_analysis` · 23 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| totalBlackOwnership | REAL | — |
| blackWomenOwnership | REAL | — |
| blackYouthOwnership | REAL | — |
| blackDisabledOwnership | REAL | — |
| blackNewEntrantOwnership | REAL | — |
| blackRuralOwnership | REAL | — |
| blackMilitaryVetOwnership | REAL | — |
| votingRightsBlack | REAL | — |
| economicInterestBlack | REAL | — |
| boardParticipationBlack | REAL | — |
| executiveManagementBlack | REAL | — |
| seniorManagementBlack | REAL | — |
| middleManagementBlack | REAL | — |
| juniorManagementBlack | REAL | — |
| disabledEmployees | REAL | — |
| managementControlScore | REAL | — |
| ownershipScore | REAL | — |
| effectiveDate | TIMESTAMP | — |
| notes | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `bbbeePlacementImpacts`

PostgreSQL: `bbbee_placement_impacts` · 13 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| placementDate | TIMESTAMP | — |
| isBlack | BOOLEAN | — |
| isFemale | BOOLEAN | — |
| isYouth | BOOLEAN | — |
| isDisabled | BOOLEAN | — |
| estimatedPointsImpact | REAL | — |
| isLearnership | BOOLEAN | — |
| isInternship | BOOLEAN | — |
| notes | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `bbbeeScoreHistory`

PostgreSQL: `bbbee_score_history` · 12 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| level | INTEGER | — |
| totalScore | REAL | — |
| ownershipScore | REAL | — |
| managementControlScore | REAL | — |
| skillsDevelopmentScore | REAL | — |
| enterpriseDevelopmentScore | REAL | — |
| socioEconomicScore | REAL | — |
| preferentialProcurementScore | REAL | — |
| snapshotDate | TIMESTAMP | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |

### `bbbeeScores`

PostgreSQL: `bbbee_scores` · 18 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| level | INTEGER | — |
| verificationDate | TIMESTAMP | — |
| expiryDate | TIMESTAMP | — |
| certificateUrl | TEXT | — |
| ownershipScore | REAL | — |
| managementControlScore | REAL | — |
| skillsDevelopmentScore | REAL | — |
| enterpriseDevelopmentScore | REAL | — |
| socioEconomicScore | REAL | — |
| preferentialProcurementScore | REAL | — |
| totalScore | REAL | — |
| managementControlTarget | JSONB | — |
| skillsDevelopmentTarget | JSONB | — |
| notes | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `bbbeeSectorBenchmarks`

PostgreSQL: `bbbee_sector_benchmarks` · 14 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| avgLevel | REAL | — |
| avgOwnership | REAL | — |
| avgManagementControl | REAL | — |
| avgSkillsDevelopment | REAL | — |
| avgEnterpriseDevelopment | REAL | — |
| avgSocioEconomic | REAL | — |
| avgPreferentialProcurement | REAL | — |
| avgTotalScore | REAL | — |
| reportingYear | INTEGER | — |
| notes | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `bbbeeSedProjects`

PostgreSQL: `bbbee_sed_projects` · 11 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| contributionValue | REAL | — |
| beneficiariesReached | INTEGER | — |
| startDate | TIMESTAMP | — |
| endDate | TIMESTAMP | — |
| impactDescription | TEXT | — |
| proofDocumentUrl | TEXT | — |
| notes | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `bbbeeSkillsPrograms`

PostgreSQL: `bbbee_skills_programs` · 16 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| nqfLevel | INTEGER | — |
| totalBeneficiaries | INTEGER | — |
| blackBeneficiaries | INTEGER | — |
| disabledBeneficiaries | INTEGER | — |
| femaleBeneficiaries | INTEGER | — |
| youthBeneficiaries | INTEGER | — |
| totalSpend | REAL | — |
| startDate | TIMESTAMP | — |
| endDate | TIMESTAMP | — |
| completionRate | REAL | — |
| absorbedCount | INTEGER | — |
| notes | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `bbbeeSupplierDevelopment`

PostgreSQL: `bbbee_supplier_development` · 13 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| bbbeeLevel | INTEGER | — |
| isBlackOwned | BOOLEAN | — |
| blackOwnershipPercentage | REAL | — |
| isBlackWomanOwned | BOOLEAN | — |
| isEME | BOOLEAN | — |
| isQSE | BOOLEAN | — |
| annualSpend | REAL | — |
| startDate | TIMESTAMP | — |
| notes | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `blindHiringAbExperiments`

PostgreSQL: `blind_hiring_ab_experiments` · 18 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| jobId | UUID | FK → `jobs.id` (CASCADE) |
| hypothesis | TEXT | — |
| blindGroupSize | INTEGER | — |
| controlGroupSize | INTEGER | — |
| blindAvgScore | REAL | — |
| controlAvgScore | REAL | — |
| blindDiversityScore | REAL | — |
| controlDiversityScore | REAL | — |
| blindAdvanceRate | REAL | — |
| controlAdvanceRate | REAL | — |
| pValue | REAL | — |
| startedAt | TIMESTAMP | — |
| completedAt | TIMESTAMP | — |
| createdBy | UUID | FK → `users.id` |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `blindHiringAdverseImpactAnalyses`

PostgreSQL: `blind_hiring_adverse_impact_analyses` · 14 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| jobId | UUID | FK → `jobs.id` (CASCADE) |
| protectedSelectionRate | REAL | — |
| referenceSelectionRate | REAL | — |
| impactRatio | REAL | — |
| passesThreshold | BOOLEAN | — |
| totalApplicantsProtected | INTEGER | — |
| totalApplicantsReference | INTEGER | — |
| selectedProtected | INTEGER | — |
| selectedReference | INTEGER | — |
| analysisNotes | TEXT | — |
| analyzedBy | UUID | FK → `users.id` |
| createdAt | TIMESTAMP | NOT NULL |

### `blindHiringAuditLog`

PostgreSQL: `blind_hiring_audit_log` · 8 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| userId | UUID | NOT NULL, FK → `users.id` (SET NULL) |
| configId | UUID | FK → `blindHiringConfigs.id` (SET NULL) |
| previousValues | JSONB | — |
| newValues | JSONB | — |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

### `blindHiringBenchmarks`

PostgreSQL: `blind_hiring_benchmarks` · 7 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| orgValue | REAL | — |
| industryAvg | REAL | — |
| topQuartile | REAL | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `blindHiringBiasScans`

PostgreSQL: `blind_hiring_bias_scans` · 13 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| userId | UUID | NOT NULL, FK → `users.id` |
| textContent | TEXT | NOT NULL |
| biasScore | INTEGER | — |
| totalIssues | INTEGER | — |
| highSeverity | INTEGER | — |
| mediumSeverity | INTEGER | — |
| lowSeverity | INTEGER | — |
| results | JSONB | — |
| correctedText | TEXT | — |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

### `blindHiringCalibrationReviewers`

PostgreSQL: `blind_hiring_calibration_reviewers` · 8 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| sessionId | UUID | NOT NULL, FK → `blindHiringCalibrationSessions.id` (CASCADE) |
| reviewerId | UUID | NOT NULL, FK → `users.id` |
| score | REAL | — |
| criteriaScores | JSONB | — |
| reviewDuration | INTEGER | — |
| completedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

### `blindHiringCalibrationSessions`

PostgreSQL: `blind_hiring_calibration_sessions` · 12 columns · 3 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| jobId | UUID | NOT NULL, FK → `jobs.id` (CASCADE) |
| applicationId | UUID | — |
| consensusScore | REAL | — |
| variance | REAL | — |
| irrScore | REAL | — |
| notes | TEXT | — |
| calibratedBy | UUID | FK → `users.id` |
| calibratedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `blindHiringCalibrationReviewers.sessionId`

### `blindHiringChallengeSubmissions`

PostgreSQL: `blind_hiring_challenge_submissions` · 10 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| challengeId | UUID | NOT NULL, FK → `blindHiringSkillsChallenges.id` (CASCADE) |
| applicationId | UUID | — |
| submissionContent | TEXT | — |
| score | REAL | — |
| criteriaScores | JSONB | — |
| timeTaken | INTEGER | — |
| gradedBy | UUID | FK → `users.id` |
| gradedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

### `blindHiringComplianceAssessments`

PostgreSQL: `blind_hiring_compliance_assessments` · 10 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| overallScore | INTEGER | — |
| requirementsMet | INTEGER | — |
| requirementsTotal | INTEGER | — |
| details | JSONB | — |
| assessedBy | UUID | FK → `users.id` |
| nextReviewDate | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `blindHiringConfigs`

PostgreSQL: `blind_hiring_configs` · 23 columns · 2 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| jobId | UUID | FK → `jobs.id` (CASCADE) |
| hideName | BOOLEAN | — |
| hidePhoto | BOOLEAN | — |
| hideEmail | BOOLEAN | — |
| hidePhone | BOOLEAN | — |
| hideAddress | BOOLEAN | — |
| hideLinks | BOOLEAN | — |
| hideAge | BOOLEAN | — |
| hideGender | BOOLEAN | — |
| hideRace | BOOLEAN | — |
| hideEducationInstitution | BOOLEAN | — |
| hideGraduationYear | BOOLEAN | — |
| hideFieldOfStudy | BOOLEAN | — |
| hideGrade | BOOLEAN | — |
| hideCompanyNames | BOOLEAN | — |
| hideJobTitles | BOOLEAN | — |
| hideCertifications | BOOLEAN | — |
| activeStages | JSONB | — |
| isActive | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `blindHiringAuditLog.configId`

### `blindHiringDataRetentionPolicies`

PostgreSQL: `blind_hiring_data_retention_policies` · 7 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| retentionMonths | INTEGER | NOT NULL |
| autoDelete | BOOLEAN | — |
| lastPurgeAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `blindHiringFairnessCertificates`

PostgreSQL: `blind_hiring_fairness_certificates` · 8 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| applicationId | UUID | — |
| certificateData | JSONB | — |
| sentAt | TIMESTAMP | — |
| downloadedAt | TIMESTAMP | — |
| createdBy | UUID | FK → `users.id` |
| createdAt | TIMESTAMP | NOT NULL |

### `blindHiringPresets`

PostgreSQL: `blind_hiring_presets` · 7 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| settings | JSONB | NOT NULL |
| isSystem | BOOLEAN | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |

### `blindHiringReviewerMetrics`

PostgreSQL: `blind_hiring_reviewer_metrics` · 11 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| reviewerId | UUID | NOT NULL, FK → `users.id` |
| totalReviews | INTEGER | — |
| avgScore | REAL | — |
| scoreStdDev | REAL | — |
| agreementRate | REAL | — |
| avgReviewDuration | INTEGER | — |
| lastReviewAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `blindHiringReviews`

PostgreSQL: `blind_hiring_reviews` · 13 columns · 5 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| jobId | UUID | NOT NULL, FK → `jobs.id` (CASCADE) |
| applicationId | UUID | NOT NULL, FK → `jobApplications.id` (CASCADE) |
| reviewerId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| overallScore | INTEGER | — |
| criteriaScores | JSONB | — |
| notes | TEXT | — |
| isRevealed | BOOLEAN | — |
| revealedAt | TIMESTAMP | — |
| revealedBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `blindHiringSkillsChallenges`

PostgreSQL: `blind_hiring_skills_challenges` · 12 columns · 3 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| jobId | UUID | FK → `jobs.id` (CASCADE) |
| timeLimit | INTEGER | — |
| description | TEXT | — |
| instructions | TEXT | — |
| rubric | JSONB | — |
| submissions | INTEGER | — |
| avgScore | REAL | — |
| createdBy | UUID | FK → `users.id` |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `blindHiringChallengeSubmissions.challengeId`

### `dataDeletionRequests`

PostgreSQL: `data_deletion_requests` · 8 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| requestedBy | UUID | FK → `users.id` (SET NULL) |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| dataTypes | JSONB | — |
| processedBy | UUID | FK → `users.id` (SET NULL) |
| processedAt | TIMESTAMP | — |
| notes | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

### `dataMigrations`

PostgreSQL: `data_migrations` · 25 columns · 1 FK out · 4 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| dataTypes | JSONB | — |
| recordCount | INTEGER | — |
| processedCount | INTEGER | — |
| skippedCount | INTEGER | — |
| errorCount | INTEGER | — |
| duplicateCount | INTEGER | — |
| errors | JSONB | — |
| warnings | JSONB | — |
| config | JSONB | — |
| templateId | UUID | — |
| rollbackAvailable | BOOLEAN | — |
| dataPreview | JSONB | — |
| transformations | JSONB | — |
| bytesProcessed | INTEGER | — |
| estimatedTimeMs | INTEGER | — |
| avgRecordsPerSecond | REAL | — |
| startedAt | TIMESTAMP | — |
| completedAt | TIMESTAMP | — |
| pausedAt | TIMESTAMP | — |
| cancelledAt | TIMESTAMP | — |
| scheduledFor | TIMESTAMP | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `migrationFieldMappings.migrationId`, `migrationLogs.migrationId`, `migrationValidations.migrationId`, `migrationRollbacks.migrationId`

### `dataRetentionPolicies`

PostgreSQL: `data_retention_policies` · 6 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| retentionDays | INTEGER | NOT NULL |
| autoDelete | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `diversityGoals`

PostgreSQL: `diversity_goals` · 9 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| recruiterId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| organizationId | UUID | FK → `organizations.id` (SET NULL) |
| targetPercentage | INTEGER | NOT NULL |
| currentPercentage | INTEGER | — |
| deadline | TIMESTAMP | — |
| notes | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `diversityReports`

PostgreSQL: `diversity_reports` · 12 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| recruiterId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| organizationId | UUID | FK → `organizations.id` (SET NULL) |
| periodStart | TIMESTAMP | — |
| periodEnd | TIMESTAMP | — |
| executiveSummary | TEXT | — |
| findings | JSONB | — |
| recommendations | JSONB | — |
| metrics | JSONB | — |
| chartData | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `diversitySnapshots`

PostgreSQL: `diversity_snapshots` · 11 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| recruiterId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| organizationId | UUID | FK → `organizations.id` (SET NULL) |
| snapshotDate | TIMESTAMP | NOT NULL |
| overallScore | INTEGER | — |
| pipelineData | JSONB | — |
| demographicSummary | JSONB | — |
| sourcingChannels | JSONB | — |
| hiringOutcomes | JSONB | — |
| departmentBreakdown | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

### `eeAffirmativeMeasures`

PostgreSQL: `ee_affirmative_measures` · 15 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| reportId | UUID | FK → `eeReports.id` (SET NULL) |
| description | TEXT | — |
| beneficiariesCount | INTEGER | — |
| budgetAllocated | REAL | — |
| budgetSpent | REAL | — |
| startDate | TIMESTAMP | — |
| endDate | TIMESTAMP | — |
| expectedOutcome | TEXT | — |
| actualOutcome | TEXT | — |
| progress | INTEGER | — |
| notes | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `eeBarriers`

PostgreSQL: `ee_barriers` · 11 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| reportId | UUID | FK → `eeReports.id` (SET NULL) |
| description | TEXT | NOT NULL |
| identifiedDate | TIMESTAMP | — |
| remediationPlan | TEXT | — |
| targetResolutionDate | TIMESTAMP | — |
| resolvedAt | TIMESTAMP | — |
| notes | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `eeConsultations`

PostgreSQL: `ee_consultations` · 13 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| reportId | UUID | FK → `eeReports.id` (SET NULL) |
| meetingDate | TIMESTAMP | NOT NULL |
| attendees | JSONB | — |
| agendaItems | JSONB | — |
| decisions | JSONB | — |
| keyOutcomes | TEXT | — |
| followUpActions | JSONB | — |
| nextMeetingDate | TIMESTAMP | — |
| notes | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `eeIncomeDifferentials`

PostgreSQL: `ee_income_differentials` · 16 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| reportId | UUID | FK → `eeReports.id` (SET NULL) |
| totalEmployees | INTEGER | — |
| averageSalary | REAL | — |
| medianSalary | REAL | — |
| lowestSalary | REAL | — |
| highestSalary | REAL | — |
| salaryByDemographic | JSONB | — |
| genderPayGapPercent | REAL | — |
| racePayGapPercent | REAL | — |
| remediationPlan | TEXT | — |
| justification | TEXT | — |
| notes | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `eePlans`

PostgreSQL: `ee_plans` · 12 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| reportId | UUID | FK → `eeReports.id` (SET NULL) |
| objective | TEXT | — |
| currentCount | INTEGER | — |
| targetCount | INTEGER | — |
| strategy | TEXT | — |
| progress | INTEGER | — |
| completedAt | TIMESTAMP | — |
| notes | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `eeReports`

PostgreSQL: `ee_reports` · 14 columns · 1 FK out · 5 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| topManagement | JSONB | — |
| seniorManagement | JSONB | — |
| professionallyQualified | JSONB | — |
| skilled | JSONB | — |
| semiSkilled | JSONB | — |
| unskilled | JSONB | — |
| hiredTotal | INTEGER | — |
| hiredBreakdown | JSONB | — |
| targets | JSONB | — |
| submittedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `eePlans.reportId`, `eeBarriers.reportId`, `eeAffirmativeMeasures.reportId`, `eeConsultations.reportId`, `eeIncomeDifferentials.reportId`

### `popiaBreachIncidents`

PostgreSQL: `popia_breach_incidents` · 18 columns · 3 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| dataSubjectsAffected | INTEGER | — |
| dataTypesCompromised | JSONB | — |
| rootCause | TEXT | — |
| containmentActions | TEXT | — |
| remedialActions | TEXT | — |
| reportedToRegulator | BOOLEAN | — |
| regulatorReportDate | TIMESTAMP | — |
| reportedToSubjects | BOOLEAN | — |
| subjectNotificationDate | TIMESTAMP | — |
| detectedAt | TIMESTAMP | — |
| resolvedAt | TIMESTAMP | — |
| reportedBy | UUID | FK → `users.id` (SET NULL) |
| assignedTo | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `popiaRegulatoryFilings.relatedBreachId`

### `popiaComplaints`

PostgreSQL: `popia_complaints` · 12 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| description | TEXT | NOT NULL |
| resolution | TEXT | — |
| internalNotes | TEXT | — |
| regulatorReferral | BOOLEAN | — |
| responseDeadline | TIMESTAMP | — |
| respondedAt | TIMESTAMP | — |
| assignedTo | UUID | FK → `users.id` (SET NULL) |
| resolvedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `popiaConsentTemplates`

PostgreSQL: `popia_consent_templates` · 11 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| templateText | TEXT | NOT NULL |
| version | INTEGER | — |
| isActive | BOOLEAN | — |
| expiryDays | INTEGER | — |
| requiresRenewal | BOOLEAN | — |
| renewalReminderDays | INTEGER | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `popiaConsents`

PostgreSQL: `popia_consents` · 9 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | FK → `users.id` (CASCADE) |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| consentText | TEXT | — |
| consentGiven | BOOLEAN | — |
| consentedAt | TIMESTAMP | — |
| revokedAt | TIMESTAMP | — |
| expiresAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

### `popiaDataMapping`

PostgreSQL: `popia_data_mapping` · 13 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| dataElements | JSONB | — |
| processingPurpose | TEXT | — |
| accessControls | TEXT | — |
| thirdPartyRecipients | JSONB | — |
| crossBorderTransfer | BOOLEAN | — |
| crossBorderCountries | JSONB | — |
| securityMeasures | TEXT | — |
| lastReviewDate | TIMESTAMP | — |
| nextReviewDate | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `popiaDataProcessingAgreements`

PostgreSQL: `popia_data_processing_agreements` · 20 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| dataTypesShared | JSONB | — |
| processingPurpose | TEXT | — |
| agreementDate | TIMESTAMP | — |
| expiryDate | TIMESTAMP | — |
| renewalDate | TIMESTAMP | — |
| complianceVerified | BOOLEAN | — |
| lastAuditDate | TIMESTAMP | — |
| nextAuditDate | TIMESTAMP | — |
| crossBorderTransfer | BOOLEAN | — |
| transferCountries | JSONB | — |
| securityMeasures | TEXT | — |
| breachNotificationClause | BOOLEAN | — |
| subProcessorClause | BOOLEAN | — |
| dataReturnClause | BOOLEAN | — |
| notes | TEXT | — |
| documentUrl | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `popiaImpactAssessments`

PostgreSQL: `popia_impact_assessments` · 17 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| dataTypes | JSONB | — |
| processingPurpose | TEXT | — |
| dataFlowDescription | TEXT | — |
| thirdPartySharing | BOOLEAN | — |
| thirdPartyDetails | TEXT | — |
| crossBorderTransfer | BOOLEAN | — |
| crossBorderDetails | TEXT | — |
| risksIdentified | JSONB | — |
| mitigationMeasures | TEXT | — |
| reviewDate | TIMESTAMP | — |
| approvedBy | UUID | FK → `users.id` (SET NULL) |
| conductedBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `popiaInformationOfficers`

PostgreSQL: `popia_information_officers` · 11 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| registeredWithRegulator | BOOLEAN | — |
| registrationDate | TIMESTAMP | — |
| appointmentDate | TIMESTAMP | — |
| responsibilities | JSONB | — |
| trainingCompleted | BOOLEAN | — |
| trainingDate | TIMESTAMP | — |
| userId | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `popiaRegulatoryFilings`

PostgreSQL: `popia_regulatory_filings` · 12 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| submittedAt | TIMESTAMP | — |
| dueDate | TIMESTAMP | — |
| responseDate | TIMESTAMP | — |
| regulatorResponse | TEXT | — |
| relatedBreachId | UUID | FK → `popiaBreachIncidents.id` (SET NULL) |
| documentUrl | TEXT | — |
| filedBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `popiaTrainingRecords`

PostgreSQL: `popia_training_records` · 10 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| userId | UUID | FK → `users.id` (CASCADE) |
| score | INTEGER | — |
| completedAt | TIMESTAMP | — |
| expiresAt | TIMESTAMP | — |
| certificateUrl | TEXT | — |
| assignedBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## Marketing & Career Site

**51 tables** — Career site pages, job board integrations, employer branding, SEO.

### `blogPosts`

PostgreSQL: `blog_posts` · 12 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| excerpt | TEXT | — |
| content | TEXT | NOT NULL |
| coverImage | TEXT | — |
| tags | JSONB | — |
| published | BOOLEAN | NOT NULL |
| featured | BOOLEAN | NOT NULL |
| metaDescription | TEXT | — |
| readingTimeMinutes | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |
| publishedAt | TIMESTAMP | — |

### `careerPulseSnapshots`

PostgreSQL: `career_pulse_snapshots` · 15 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| skills | JSONB | — |
| profileStrength | INTEGER | — |
| employabilityIndex | INTEGER | — |
| marketDemandScore | INTEGER | — |
| interviewReadiness | INTEGER | — |
| industryAlignment | INTEGER | — |
| pulseData | JSONB | — |
| marketIntelData | JSONB | — |
| skillRadarData | JSONB | — |
| trajectoryData | JSONB | — |
| benchmarkData | JSONB | — |
| generatedAt | TIMESTAMP | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |

### `careerSiteAnalytics`

PostgreSQL: `career_site_analytics` · 7 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| referrer | TEXT | — |
| userAgent | TEXT | — |
| jobId | UUID | — |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

### `careerSiteAwards`

PostgreSQL: `career_site_awards` · 9 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| year | INTEGER | — |
| description | TEXT | — |
| imageUrl | TEXT | — |
| url | TEXT | — |
| displayOrder | INTEGER | — |
| isPublished | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |

### `careerSiteCareerPaths`

PostgreSQL: `career_site_career_paths` · 8 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| levels | JSONB | — |
| isPublished | BOOLEAN | — |
| displayOrder | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `careerSiteDepartments`

PostgreSQL: `career_site_departments` · 14 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| headPhotoUrl | TEXT | — |
| teamSize | INTEGER | — |
| techStack | JSONB | — |
| highlights | JSONB | — |
| photoUrl | TEXT | — |
| openRolesCount | INTEGER | — |
| cultureQuote | TEXT | — |
| displayOrder | INTEGER | — |
| isPublished | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `careerSiteEvents`

PostgreSQL: `career_site_events` · 15 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| startDate | TIMESTAMP | NOT NULL |
| endDate | TIMESTAMP | — |
| isVirtual | BOOLEAN | — |
| virtualLink | TEXT | — |
| registrationUrl | TEXT | — |
| imageUrl | TEXT | — |
| maxAttendees | INTEGER | — |
| registeredCount | INTEGER | — |
| departments | JSONB | — |
| isPublished | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `careerSiteFaqs`

PostgreSQL: `career_site_faqs` · 8 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| question | TEXT | NOT NULL |
| answer | TEXT | NOT NULL |
| displayOrder | INTEGER | — |
| isPublished | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `careerSiteFeaturedJobs`

PostgreSQL: `career_site_featured_jobs` · 7 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| jobId | UUID | NOT NULL |
| displayOrder | INTEGER | — |
| isFeatured | BOOLEAN | — |
| showOnCareerSite | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |

### `careerSitePages`

PostgreSQL: `career_site_pages` · 10 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| content | JSONB | — |
| layout | JSONB | — |
| customCss | TEXT | — |
| isPublished | BOOLEAN | — |
| seoDescription | TEXT | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `careerSiteSettings`

PostgreSQL: `career_site_settings` · 19 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| logoUrl | TEXT | — |
| faviconUrl | TEXT | — |
| heroImageUrl | TEXT | — |
| socialLinks | JSONB | — |
| companyDescription | TEXT | — |
| missionStatement | TEXT | — |
| cultureValues | JSONB | — |
| benefits | JSONB | — |
| officePhotos | JSONB | — |
| teamMembers | JSONB | — |
| applicationSettings | JSONB | — |
| seoSettings | JSONB | — |
| isActive | BOOLEAN | — |
| privacyPolicyUrl | TEXT | — |
| cookieConsentEnabled | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `careerSiteTalentCommunity`

PostgreSQL: `career_site_talent_community` · 9 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| interests | JSONB | — |
| resumeUrl | TEXT | — |
| linkedinUrl | TEXT | — |
| tags | JSONB | — |
| notes | TEXT | — |
| optedInNewsletter | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |

### `careerSiteTestimonials`

PostgreSQL: `career_site_testimonials` · 11 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| photoUrl | TEXT | — |
| quote | TEXT | NOT NULL |
| rating | INTEGER | — |
| yearsAtCompany | INTEGER | — |
| videoUrl | TEXT | — |
| isPublished | BOOLEAN | — |
| displayOrder | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `employerBrandProfiles`

PostgreSQL: `employer_brand_profiles` · 29 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| recruiterId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| mission | TEXT | — |
| culture | JSONB | — |
| benefits | JSONB | — |
| socialLinks | JSONB | — |
| videoUrl | TEXT | — |
| isPublished | BOOLEAN | — |
| logoUrl | TEXT | — |
| coverImageUrl | TEXT | — |
| foundedYear | INTEGER | — |
| website | TEXT | — |
| values | JSONB | — |
| perksDetailed | JSONB | — |
| teamMembers | JSONB | — |
| testimonials | JSONB | — |
| gallery | JSONB | — |
| awards | JSONB | — |
| officeLocations | JSONB | — |
| techStack | JSONB | — |
| brandColors | JSONB | — |
| customSections | JSONB | — |
| seoDescription | TEXT | — |
| evpStatement | TEXT | — |
| viewCount | INTEGER | — |
| milestones | JSONB | — |
| cultureFitQuiz | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `jobBoardAbTests`

PostgreSQL: `job_board_ab_tests` · 10 columns · 2 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| jobId | UUID | NOT NULL, FK → `jobs.id` (CASCADE) |
| winnerId | UUID | — |
| winnerDeclaredAt | TIMESTAMP | — |
| autoPickWinner | BOOLEAN | — |
| minImpressions | INTEGER | — |
| confidenceLevel | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `jobBoardAbVariants.testId`

### `jobBoardAbVariants`

PostgreSQL: `job_board_ab_variants` · 12 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| testId | UUID | NOT NULL, FK → `jobBoardAbTests.id` (CASCADE) |
| title | TEXT | NOT NULL |
| description | TEXT | — |
| impressions | INTEGER | — |
| clicks | INTEGER | — |
| applications | INTEGER | — |
| ctr | INTEGER | — |
| conversionRate | INTEGER | — |
| isWinner | BOOLEAN | — |
| postingId | UUID | FK → `jobBoardPostings.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |

### `jobBoardAnalyticsSnapshots`

PostgreSQL: `job_board_analytics_snapshots` · 15 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| integrationId | UUID | FK → `jobBoardIntegrations.id` (CASCADE) |
| snapshotDate | TIMESTAMP | NOT NULL |
| totalImpressions | INTEGER | — |
| totalClicks | INTEGER | — |
| totalApplications | INTEGER | — |
| totalHires | INTEGER | — |
| activePostings | INTEGER | — |
| expiredPostings | INTEGER | — |
| avgTimeToFill | INTEGER | — |
| clickThroughRate | INTEGER | — |
| applicationRate | INTEGER | — |
| qualityScore | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |

### `jobBoardAutoRefreshRules`

PostgreSQL: `job_board_auto_refresh_rules` · 11 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| isActive | BOOLEAN | — |
| thresholdValue | INTEGER | NOT NULL |
| thresholdPeriodDays | INTEGER | — |
| targetBoards | JSONB | — |
| maxRefreshes | INTEGER | — |
| executionCount | INTEGER | — |
| lastExecutedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `jobBoardAutoRules`

PostgreSQL: `job_board_auto_rules` · 13 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| isActive | BOOLEAN | — |
| conditions | JSONB | — |
| targetBoards | JSONB | — |
| templateId | UUID | FK → `jobBoardPostingTemplates.id` (SET NULL) |
| autoExpireDays | INTEGER | — |
| boostEnabled | BOOLEAN | — |
| boostBudget | INTEGER | — |
| executionCount | INTEGER | — |
| lastExecutedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `jobBoardBudgets`

PostgreSQL: `job_board_budgets` · 10 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| integrationId | UUID | FK → `jobBoardIntegrations.id` (CASCADE) |
| monthlyBudget | INTEGER | — |
| spent | INTEGER | — |
| costPerClick | INTEGER | — |
| costPerApplication | INTEGER | — |
| costPerHire | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `jobBoardCandidateSources`

PostgreSQL: `job_board_candidate_sources` · 9 columns · 4 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| applicationId | UUID | FK → `jobApplications.id` (CASCADE) |
| jobId | UUID | FK → `jobs.id` (CASCADE) |
| postingId | UUID | FK → `jobBoardPostings.id` (SET NULL) |
| candidateQualityScore | INTEGER | — |
| hired | BOOLEAN | — |
| timeToHire | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |

### `jobBoardCompetitorIntel`

PostgreSQL: `job_board_competitor_intel` · 11 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| avgSalaryMin | INTEGER | — |
| avgSalaryMax | INTEGER | — |
| medianSalary | INTEGER | — |
| totalPostings | INTEGER | — |
| avgPostingDuration | INTEGER | — |
| topBenefits | JSONB | — |
| topSkills | JSONB | — |
| competitiveIndex | INTEGER | — |
| snapshotDate | TIMESTAMP | NOT NULL |

### `jobBoardDuplicateCandidates`

PostgreSQL: `job_board_duplicate_candidates` · 9 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| jobId | UUID | FK → `jobs.id` (CASCADE) |
| boardsApplied | JSONB | — |
| applicationIds | JSONB | — |
| firstSeenAt | TIMESTAMP | NOT NULL |
| totalApplications | INTEGER | — |
| resolvedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

### `jobBoardHealthChecks`

PostgreSQL: `job_board_health_checks` · 7 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| integrationId | UUID | NOT NULL, FK → `jobBoardIntegrations.id` (CASCADE) |
| latencyMs | INTEGER | — |
| quotaUsed | INTEGER | — |
| quotaLimit | INTEGER | — |
| errorMessage | TEXT | — |
| checkedAt | TIMESTAMP | NOT NULL |

### `jobBoardIntegrations`

PostgreSQL: `job_board_integrations` · 9 columns · 1 FK out · 5 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| apiKey | TEXT | — |
| apiSecret | TEXT | — |
| isActive | BOOLEAN | — |
| config | JSONB | — |
| lastSyncAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `jobBoardPostings.integrationId`, `jobBoardBudgets.integrationId`, `jobBoardAnalyticsSnapshots.integrationId`, `jobBoardScheduledPosts.integrationId`, `jobBoardHealthChecks.integrationId`

### `jobBoardOptimalTimes`

PostgreSQL: `job_board_optimal_times` · 9 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| dayOfWeek | INTEGER | NOT NULL |
| hourOfDay | INTEGER | NOT NULL |
| engagementIndex | INTEGER | — |
| impressionMultiplier | INTEGER | — |
| applicationMultiplier | INTEGER | — |
| sampleSize | INTEGER | — |
| updatedAt | TIMESTAMP | NOT NULL |

### `jobBoardPostingScores`

PostgreSQL: `job_board_posting_scores` · 13 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| postingId | UUID | NOT NULL, FK → `jobBoardPostings.id` (CASCADE) |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| overallScore | INTEGER | NOT NULL |
| titleScore | INTEGER | — |
| descriptionScore | INTEGER | — |
| visibilityScore | INTEGER | — |
| engagementScore | INTEGER | — |
| conversionScore | INTEGER | — |
| competitivenessScore | INTEGER | — |
| issues | JSONB | — |
| recommendations | JSONB | — |
| scoredAt | TIMESTAMP | NOT NULL |

### `jobBoardPostingTemplates`

PostgreSQL: `job_board_posting_templates` · 11 columns · 1 FK out · 2 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| titleTemplate | TEXT | — |
| descriptionTemplate | TEXT | — |
| companyBlurb | TEXT | — |
| benefitsSection | TEXT | — |
| customFields | JSONB | — |
| isDefault | BOOLEAN | — |
| usageCount | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `jobBoardScheduledPosts.templateId`, `jobBoardAutoRules.templateId`

### `jobBoardPostings`

PostgreSQL: `job_board_postings` · 10 columns · 2 FK out · 3 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| integrationId | UUID | NOT NULL, FK → `jobBoardIntegrations.id` (CASCADE) |
| jobId | UUID | NOT NULL, FK → `jobs.id` (CASCADE) |
| postedAt | TIMESTAMP | — |
| expiresAt | TIMESTAMP | — |
| impressions | INTEGER | — |
| clicks | INTEGER | — |
| applications | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `jobBoardCandidateSources.postingId`, `jobBoardAbVariants.postingId`, `jobBoardPostingScores.postingId`

### `jobBoardScheduledPosts`

PostgreSQL: `job_board_scheduled_posts` · 14 columns · 4 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| jobId | UUID | NOT NULL, FK → `jobs.id` (CASCADE) |
| integrationId | UUID | FK → `jobBoardIntegrations.id` (CASCADE) |
| scheduledAt | TIMESTAMP | NOT NULL |
| expiresAt | TIMESTAMP | — |
| templateId | UUID | FK → `jobBoardPostingTemplates.id` (SET NULL) |
| publishedAt | TIMESTAMP | — |
| customTitle | TEXT | — |
| customDescription | TEXT | — |
| targetAudience | JSONB | — |
| boostBudget | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `marketingAbTests`

PostgreSQL: `marketing_ab_tests` · 12 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| campaignId | UUID | FK → `recruitmentCampaigns.id` (SET NULL) |
| variantA | JSONB | — |
| variantB | JSONB | — |
| confidenceLevel | REAL | — |
| sampleSize | INTEGER | — |
| startDate | TIMESTAMP | — |
| endDate | TIMESTAMP | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `marketingAdvocacyContent`

PostgreSQL: `marketing_advocacy_content` · 12 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| body | TEXT | NOT NULL |
| suggestedCaption | TEXT | — |
| mediaUrl | TEXT | — |
| totalShares | INTEGER | — |
| totalReach | INTEGER | — |
| totalClicks | INTEGER | — |
| expiresAt | TIMESTAMP | — |
| isActive | BOOLEAN | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |

### `marketingAnalyticsSnapshots`

PostgreSQL: `marketing_analytics_snapshots` · 10 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| snapshotDate | TIMESTAMP | NOT NULL |
| channelMetrics | JSONB | — |
| totalSpend | INTEGER | — |
| totalApplications | INTEGER | — |
| totalHires | INTEGER | — |
| sourceAttribution | JSONB | — |
| funnelData | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

### `marketingAudiences`

PostgreSQL: `marketing_audiences` · 11 columns · 2 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| criteria | JSONB | — |
| estimatedSize | INTEGER | — |
| channels | JSONB | — |
| isActive | BOOLEAN | — |
| lastUsed | TIMESTAMP | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `marketingNurtureSequences.audienceId`

### `marketingAutopilotRecs`

PostgreSQL: `marketing_autopilot_recs` · 10 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| campaignId | UUID | FK → `recruitmentCampaigns.id` (SET NULL) |
| description | TEXT | NOT NULL |
| currentMetric | JSONB | — |
| projectedMetric | JSONB | — |
| actionSteps | JSONB | — |
| appliedAt | TIMESTAMP | — |
| dismissedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

### `marketingBrandHealth`

PostgreSQL: `marketing_brand_health` · 11 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| snapshotDate | TIMESTAMP | NOT NULL |
| overallScore | REAL | NOT NULL |
| dimensions | JSONB | — |
| trendDelta | REAL | — |
| topStrengths | JSONB | — |
| improvementAreas | JSONB | — |
| competitorComparison | JSONB | — |
| aiSummary | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

### `marketingCompetitorIntel`

PostgreSQL: `marketing_competitor_intel` · 15 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| openRoles | JSONB | — |
| hiringVolume | INTEGER | — |
| avgSalaryRange | JSONB | — |
| topChannels | JSONB | — |
| talentFlowIn | INTEGER | — |
| talentFlowOut | INTEGER | — |
| strengthAreas | JSONB | — |
| weaknessAreas | JSONB | — |
| brandScore | REAL | — |
| aiInsights | TEXT | — |
| lastAnalyzed | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `marketingContent`

PostgreSQL: `marketing_content` · 12 columns · 2 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| body | TEXT | NOT NULL |
| htmlBody | TEXT | — |
| ctaUrl | TEXT | — |
| tags | JSONB | — |
| thumbnailUrl | TEXT | — |
| performanceData | JSONB | — |
| aiGenerated | BOOLEAN | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `marketingContentPredictions.contentId`

### `marketingContentPredictions`

PostgreSQL: `marketing_content_predictions` · 12 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| contentId | UUID | FK → `marketingContent.id` (SET NULL) |
| overallScore | REAL | NOT NULL |
| dimensions | JSONB | — |
| predictedCtr | REAL | — |
| predictedConversion | REAL | — |
| predictedEngagement | REAL | — |
| suggestions | JSONB | — |
| competitiveEdge | TEXT | — |
| sentimentScore | REAL | — |
| createdAt | TIMESTAMP | NOT NULL |

### `marketingEmployeeAdvocates`

PostgreSQL: `marketing_employee_advocates` · 15 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| userId | UUID | FK → `users.id` (SET NULL) |
| avatarUrl | TEXT | — |
| totalShares | INTEGER | — |
| totalReach | INTEGER | — |
| totalClicks | INTEGER | — |
| totalReferrals | INTEGER | — |
| points | INTEGER | — |
| streak | INTEGER | — |
| badges | JSONB | — |
| isActive | BOOLEAN | — |
| lastShareDate | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `marketingEvents`

PostgreSQL: `marketing_events` · 19 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| isVirtual | BOOLEAN | — |
| virtualLink | TEXT | — |
| startDate | TIMESTAMP | NOT NULL |
| endDate | TIMESTAMP | — |
| capacity | INTEGER | — |
| registrations | INTEGER | — |
| attendees | INTEGER | — |
| leadsGenerated | INTEGER | — |
| applicationsGenerated | INTEGER | — |
| budget | INTEGER | — |
| spent | INTEGER | — |
| tags | JSONB | — |
| targetAudience | JSONB | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `marketingNurtureSequences`

PostgreSQL: `marketing_nurture_sequences` · 12 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| audienceId | UUID | FK → `marketingAudiences.id` (SET NULL) |
| steps | JSONB | — |
| totalEnrolled | INTEGER | — |
| totalCompleted | INTEGER | — |
| totalConverted | INTEGER | — |
| isActive | BOOLEAN | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `marketingSocialPosts`

PostgreSQL: `marketing_social_posts` · 13 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| campaignId | UUID | FK → `recruitmentCampaigns.id` (SET NULL) |
| content | TEXT | NOT NULL |
| mediaUrls | JSONB | — |
| hashtags | JSONB | — |
| scheduledAt | TIMESTAMP | — |
| publishedAt | TIMESTAMP | — |
| metrics | JSONB | — |
| aiGenerated | BOOLEAN | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `marketingTalentHeatmap`

PostgreSQL: `marketing_talent_heatmap` · 14 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| latitude | REAL | — |
| longitude | REAL | — |
| talentDensity | INTEGER | — |
| avgSalary | INTEGER | — |
| competitionIndex | REAL | — |
| demandScore | REAL | — |
| supplyScore | REAL | — |
| topEmployers | JSONB | — |
| bestChannels | JSONB | — |
| growthRate | REAL | — |
| lastUpdated | TIMESTAMP | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |

### `seoBacklinks`

PostgreSQL: `seo_backlinks` · 9 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| sourceUrl | TEXT | NOT NULL |
| targetUrl | TEXT | NOT NULL |
| domainAuthority | INTEGER | — |
| pageAuthority | INTEGER | — |
| firstSeen | TIMESTAMP | — |
| lastChecked | TIMESTAMP | — |
| isToxic | BOOLEAN | — |
| createdAt | TIMESTAMP | — |

### `seoCompetitors`

PostgreSQL: `seo_competitors` · 9 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| domainAuthority | INTEGER | — |
| organicTraffic | INTEGER | — |
| totalKeywords | INTEGER | — |
| commonKeywords | INTEGER | — |
| contentScore | INTEGER | — |
| notes | TEXT | — |
| lastAnalyzed | TIMESTAMP | — |
| createdAt | TIMESTAMP | — |

### `seoCrawlReports`

PostgreSQL: `seo_crawl_reports` · 16 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| totalPages | INTEGER | — |
| healthyPages | INTEGER | — |
| warningPages | INTEGER | — |
| errorPages | INTEGER | — |
| avgLoadTime | NUMERIC | — |
| brokenLinks | INTEGER | — |
| redirectChains | INTEGER | — |
| missingMeta | INTEGER | — |
| missingAltText | INTEGER | — |
| duplicateContent | INTEGER | — |
| thinContent | INTEGER | — |
| mobileIssues | INTEGER | — |
| securityIssues | INTEGER | — |
| details | JSONB | — |
| createdAt | TIMESTAMP | — |

### `seoKeywords`

PostgreSQL: `seo_keywords` · 9 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| volume | INTEGER | — |
| position | INTEGER | — |
| previousPosition | INTEGER | — |
| cpc | NUMERIC | — |
| featuredSnippet | BOOLEAN | — |
| notes | TEXT | — |
| createdAt | TIMESTAMP | — |
| updatedAt | TIMESTAMP | — |

### `seoLocalCitations`

PostgreSQL: `seo_local_citations` · 8 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| listingUrl | TEXT | — |
| napConsistent | BOOLEAN | — |
| address | TEXT | — |
| rating | NUMERIC | — |
| reviewCount | INTEGER | — |
| lastVerified | TIMESTAMP | — |
| createdAt | TIMESTAMP | — |

### `seoPageAudits`

PostgreSQL: `seo_page_audits` · 19 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| metaDescription | TEXT | — |
| seoScore | INTEGER | — |
| performanceScore | INTEGER | — |
| accessibilityScore | INTEGER | — |
| wordCount | INTEGER | — |
| internalLinks | INTEGER | — |
| externalLinks | INTEGER | — |
| imagesTotal | INTEGER | — |
| imagesMissingAlt | INTEGER | — |
| h1Count | INTEGER | — |
| h2Count | INTEGER | — |
| hasStructuredData | BOOLEAN | — |
| isIndexed | BOOLEAN | — |
| isMobileFriendly | BOOLEAN | — |
| loadTimeMs | INTEGER | — |
| issues | JSONB | — |
| lastAudited | TIMESTAMP | — |
| createdAt | TIMESTAMP | — |

### `seoRedirects`

PostgreSQL: `seo_redirects` · 6 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| redirectType | INTEGER | — |
| hits | INTEGER | — |
| isActive | BOOLEAN | — |
| reason | TEXT | — |
| createdAt | TIMESTAMP | — |

## Video

**22 tables** — Video profiles, mock interviews, application intros, B-BBEE verifications.

### `videoApplicationIntros`

PostgreSQL: `video_application_intros` · 8 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| videoProfileId | UUID | NOT NULL, FK → `videoProfiles.id` (CASCADE) |
| jobId | UUID | NOT NULL, FK → `jobs.id` (CASCADE) |
| introVideoUrl | TEXT | — |
| introTranscript | TEXT | — |
| generatedScript | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

### `videoBbbeeVerifications`

PostgreSQL: `video_bbbee_verifications` · 8 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| videoProfileId | UUID | FK → `videoProfiles.id` (SET NULL) |
| demographicDeclaration | JSONB | — |
| transcript | TEXT | — |
| verifiedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `videoInterviewAutomations`

PostgreSQL: `video_interview_automations` · 8 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| conditions | JSONB | — |
| actions | JSONB | — |
| isActive | BOOLEAN | — |
| executionCount | INTEGER | — |
| lastExecutedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

### `videoInterviewBranding`

PostgreSQL: `video_interview_branding` · 9 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| logoUrl | TEXT | — |
| welcomeMessage | TEXT | — |
| thankYouMessage | TEXT | — |
| customCss | TEXT | — |
| showBranding | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `videoInterviewClips`

PostgreSQL: `video_interview_clips` · 14 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| videoInterviewId | UUID | NOT NULL, FK → `videoInterviews.id` (CASCADE) |
| createdBy | UUID | NOT NULL, FK → `users.id` |
| description | TEXT | — |
| startTime | REAL | NOT NULL |
| endTime | REAL | NOT NULL |
| clipUrl | TEXT | — |
| thumbnailUrl | TEXT | — |
| tags | JSONB | — |
| isHighlight | BOOLEAN | — |
| questionIndex | INTEGER | — |
| aiInsight | TEXT | — |
| viewCount | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |

### `videoInterviewDebriefs`

PostgreSQL: `video_interview_debriefs` · 16 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| videoInterviewId | UUID | NOT NULL, FK → `videoInterviews.id` (CASCADE) |
| generatedBy | UUID | NOT NULL, FK → `users.id` |
| summary | TEXT | NOT NULL |
| confidenceScore | REAL | — |
| strengthsSummary | JSONB | — |
| concernsSummary | JSONB | — |
| evaluatorConsensus | JSONB | — |
| keyMoments | JSONB | — |
| comparativeInsights | TEXT | — |
| nextSteps | JSONB | — |
| riskFactors | JSONB | — |
| cultureFitScore | REAL | — |
| technicalFitScore | REAL | — |
| leadershipFitScore | REAL | — |
| createdAt | TIMESTAMP | NOT NULL |

### `videoInterviewEvaluations`

PostgreSQL: `video_interview_evaluations` · 10 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| videoInterviewId | UUID | NOT NULL, FK → `videoInterviews.id` (CASCADE) |
| evaluatorId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| ratings | JSONB | — |
| overallScore | REAL | — |
| strengths | TEXT | — |
| concerns | TEXT | — |
| privateNotes | TEXT | — |
| submittedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

### `videoInterviewNotes`

PostgreSQL: `video_interview_notes` · 7 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| videoInterviewId | UUID | NOT NULL, FK → `videoInterviews.id` (CASCADE) |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| content | TEXT | NOT NULL |
| videoTimestamp | REAL | — |
| isPrivate | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |

### `videoInterviewPrepPackets`

PostgreSQL: `video_interview_prep_packets` · 12 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| videoInterviewId | UUID | NOT NULL, FK → `videoInterviews.id` (CASCADE) |
| generatedBy | UUID | NOT NULL, FK → `users.id` |
| candidateSummary | TEXT | — |
| roleContext | TEXT | — |
| suggestedQuestions | JSONB | — |
| redFlagsToWatch | JSONB | — |
| interviewStrategy | TEXT | — |
| timeAllocation | JSONB | — |
| evaluationFocus | JSONB | — |
| starPrompts | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

### `videoInterviewQuestionAnalytics`

PostgreSQL: `video_interview_question_analytics` · 13 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| questionText | TEXT | NOT NULL |
| timesAsked | INTEGER | — |
| avgResponseDuration | REAL | — |
| avgRetakes | REAL | — |
| avgAiScore | REAL | — |
| discriminationIndex | REAL | — |
| difficultyLevel | REAL | — |
| candidateDropoffRate | REAL | — |
| effectivenessScore | REAL | — |
| lastUsedAt | TIMESTAMP | — |
| updatedAt | TIMESTAMP | NOT NULL |

### `videoInterviewReactions`

PostgreSQL: `video_interview_reactions` · 7 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| videoInterviewId | UUID | NOT NULL, FK → `videoInterviews.id` (CASCADE) |
| userId | UUID | NOT NULL, FK → `users.id` |
| videoTimestamp | REAL | NOT NULL |
| questionIndex | INTEGER | — |
| comment | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

### `videoInterviewRooms`

PostgreSQL: `video_interview_rooms` · 13 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| videoInterviewId | UUID | FK → `videoInterviews.id` (SET NULL) |
| hostUserId | UUID | FK → `users.id` |
| participants | JSONB | — |
| scheduledAt | TIMESTAMP | — |
| startedAt | TIMESTAMP | — |
| endedAt | TIMESTAMP | — |
| duration | INTEGER | — |
| recordingEnabled | BOOLEAN | — |
| recordingUrl | TEXT | — |
| settings | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

### `videoInterviewScorecardResults`

PostgreSQL: `video_interview_scorecard_results` · 11 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| videoInterviewId | UUID | NOT NULL, FK → `videoInterviews.id` (CASCADE) |
| scorecardId | UUID | NOT NULL, FK → `videoInterviewScorecards.id` (CASCADE) |
| evaluatorId | UUID | NOT NULL, FK → `users.id` |
| scores | JSONB | — |
| weightedTotal | REAL | — |
| maxPossible | REAL | — |
| percentageScore | REAL | — |
| summary | TEXT | — |
| submittedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

### `videoInterviewScorecards`

PostgreSQL: `video_interview_scorecards` · 7 columns · 1 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| criteria | JSONB | — |
| isDefault | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `videoInterviewScorecardResults.scorecardId`

### `videoInterviewShares`

PostgreSQL: `video_interview_shares` · 7 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| videoInterviewId | UUID | NOT NULL, FK → `videoInterviews.id` (CASCADE) |
| sharedBy | UUID | NOT NULL, FK → `users.id` |
| permissions | JSONB | — |
| accessedAt | TIMESTAMP | — |
| expiresAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

### `videoInterviewTemplates`

PostgreSQL: `video_interview_templates` · 11 columns · 2 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| questions | JSONB | — |
| settings | JSONB | — |
| brandingConfig | JSONB | — |
| duration | INTEGER | — |
| isBuiltIn | BOOLEAN | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `videoInterviews.templateId`

### `videoInterviews`

PostgreSQL: `video_interviews` · 25 columns · 5 FK out · 9 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| jobId | UUID | FK → `jobs.id` (SET NULL) |
| applicationId | UUID | FK → `jobApplications.id` (SET NULL) |
| templateId | UUID | FK → `videoInterviewTemplates.id` (SET NULL) |
| questions | JSONB | — |
| recordingUrl | TEXT | — |
| transcription | TEXT | — |
| aiAnalysis | JSONB | — |
| aiScore | REAL | — |
| duration | INTEGER | — |
| deadline | TIMESTAMP | — |
| maxRetakes | INTEGER | — |
| timeLimitPerQuestion | INTEGER | — |
| introMessage | TEXT | — |
| evaluatorIds | JSONB | — |
| responseVideos | JSONB | — |
| tags | JSONB | — |
| inviteSentAt | TIMESTAMP | — |
| reminderSentAt | TIMESTAMP | — |
| expiresAt | TIMESTAMP | — |
| scheduledAt | TIMESTAMP | — |
| completedAt | TIMESTAMP | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |

**Referenced by:** `videoInterviewEvaluations.videoInterviewId`, `videoInterviewNotes.videoInterviewId`, `videoInterviewRooms.videoInterviewId`, `videoInterviewClips.videoInterviewId`, `videoInterviewScorecardResults.videoInterviewId`, `videoInterviewShares.videoInterviewId`, `videoInterviewReactions.videoInterviewId`, `videoInterviewDebriefs.videoInterviewId` +1 more

### `videoMockInterviews`

PostgreSQL: `video_mock_interviews` · 10 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| jobId | UUID | FK → `jobs.id` (SET NULL) |
| questionsAsked | JSONB | — |
| responses | JSONB | — |
| overallReport | JSONB | — |
| currentRound | INTEGER | — |
| totalRounds | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `videoProfileReviews`

PostgreSQL: `video_profile_reviews` · 8 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| videoProfileId | UUID | NOT NULL, FK → `videoProfiles.id` (CASCADE) |
| recruiterId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| rating | INTEGER | — |
| notes | TEXT | — |
| isBookmarked | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `videoProfileViews`

PostgreSQL: `video_profile_views` · 7 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| videoProfileId | UUID | NOT NULL, FK → `videoProfiles.id` (CASCADE) |
| viewerId | UUID | FK → `users.id` (SET NULL) |
| watchDuration | INTEGER | — |
| totalDuration | INTEGER | — |
| completionPercent | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |

### `videoProfiles`

PostgreSQL: `video_profiles` · 24 columns · 1 FK out · 5 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| videoUrl | TEXT | — |
| thumbnailUrl | TEXT | — |
| duration | INTEGER | — |
| transcript | TEXT | — |
| aiAnalysis | JSONB | — |
| isPrimary | BOOLEAN | — |
| isVisibleToRecruiters | BOOLEAN | — |
| fileSize | INTEGER | — |
| captions | JSONB | — |
| chapters | JSONB | — |
| trimStart | INTEGER | — |
| trimEnd | INTEGER | — |
| tags | JSONB | — |
| scriptContent | TEXT | — |
| viewCount | INTEGER | — |
| previousAnalysis | JSONB | — |
| highlights | JSONB | — |
| translatedCaptions | JSONB | — |
| portfolioOrder | INTEGER | — |
| bbbeeVerified | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `videoProfileViews.videoProfileId`, `videoProfileReviews.videoProfileId`, `videoRequests.responseVideoProfileId`, `videoApplicationIntros.videoProfileId`, `videoBbbeeVerifications.videoProfileId`

### `videoRequests`

PostgreSQL: `video_requests` · 11 columns · 4 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| recruiterId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| candidateId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| jobId | UUID | FK → `jobs.id` (SET NULL) |
| questions | JSONB | — |
| responseVideoProfileId | UUID | FK → `videoProfiles.id` (SET NULL) |
| message | TEXT | — |
| dueDate | TIMESTAMP | — |
| completedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## Background Checks

**15 tables** — Background check workflows, providers, consent, scoring, adjudication.

### `backgroundCheckAdjudications`

PostgreSQL: `background_check_adjudications` · 12 columns · 4 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| checkId | UUID | NOT NULL, FK → `backgroundChecks.id` (CASCADE) |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| adjudicatorId | UUID | FK → `users.id` (SET NULL) |
| reasoning | TEXT | — |
| conditions | JSONB | — |
| escalatedFrom | UUID | — |
| escalatedTo | UUID | FK → `users.id` (SET NULL) |
| escalationReason | TEXT | — |
| completedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | — |

### `backgroundCheckAlerts`

PostgreSQL: `background_check_alerts` · 9 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| checkId | UUID | FK → `backgroundChecks.id` (CASCADE) |
| message | TEXT | — |
| isRead | BOOLEAN | — |
| isDismissed | BOOLEAN | — |
| actionUrl | TEXT | — |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

### `backgroundCheckCampaigns`

PostgreSQL: `background_check_campaigns` · 18 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| jobId | UUID | — |
| packageId | UUID | — |
| totalCandidates | INTEGER | — |
| completedChecks | INTEGER | — |
| failedChecks | INTEGER | — |
| highRiskCount | INTEGER | — |
| slaDeadline | TIMESTAMP | — |
| checkTypes | JSONB | — |
| candidateEmails | JSONB | — |
| autoConsent | BOOLEAN | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| startedAt | TIMESTAMP | — |
| completedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | — |

### `backgroundCheckConsent`

PostgreSQL: `background_check_consent` · 7 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| checkId | UUID | NOT NULL, FK → `backgroundChecks.id` (CASCADE) |
| consentText | TEXT | — |
| consentGivenAt | TIMESTAMP | — |
| consentExpiresAt | TIMESTAMP | — |
| revokedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

### `backgroundCheckDisputes`

PostgreSQL: `background_check_disputes` · 18 columns · 4 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| checkId | UUID | NOT NULL, FK → `backgroundChecks.id` (CASCADE) |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| disputeReason | TEXT | NOT NULL |
| evidenceProvided | TEXT | — |
| assignedTo | UUID | FK → `users.id` (SET NULL) |
| resolution | TEXT | — |
| resolvedBy | UUID | FK → `users.id` (SET NULL) |
| resolvedAt | TIMESTAMP | — |
| adverseActionSent | BOOLEAN | — |
| adverseActionDate | TIMESTAMP | — |
| preAdverseNoticeSent | BOOLEAN | — |
| preAdverseNoticeDate | TIMESTAMP | — |
| waitingPeriodDays | INTEGER | — |
| candidateResponseDeadline | TIMESTAMP | — |
| candidateResponse | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | — |

### `backgroundCheckDocuments`

PostgreSQL: `background_check_documents` · 12 columns · 4 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| checkId | UUID | NOT NULL, FK → `backgroundChecks.id` (CASCADE) |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| fileSize | INTEGER | — |
| storageUrl | TEXT | — |
| verifiedBy | UUID | FK → `users.id` (SET NULL) |
| verifiedAt | TIMESTAMP | — |
| expiresAt | TIMESTAMP | — |
| metadata | JSONB | — |
| isConfidential | BOOLEAN | — |
| uploadedBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |

### `backgroundCheckNotes`

PostgreSQL: `background_check_notes` · 6 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| checkId | UUID | NOT NULL, FK → `backgroundChecks.id` (CASCADE) |
| authorId | UUID | FK → `users.id` (SET NULL) |
| content | TEXT | NOT NULL |
| isInternal | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |

### `backgroundCheckPackages`

PostgreSQL: `background_check_packages` · 10 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| checkTypes | JSONB | NOT NULL |
| isDefault | BOOLEAN | — |
| estimatedCost | INTEGER | — |
| estimatedDays | INTEGER | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | — |

### `backgroundCheckProviders`

PostgreSQL: `background_check_providers` · 18 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| checkTypes | JSONB | — |
| apiEndpoint | TEXT | — |
| apiKeyEncrypted | TEXT | — |
| avgTurnaroundDays | INTEGER | — |
| successRate | INTEGER | — |
| costPerCheck | INTEGER | — |
| lastHealthCheck | TIMESTAMP | — |
| totalChecksProcessed | INTEGER | — |
| rating | INTEGER | — |
| website | TEXT | — |
| notes | TEXT | — |
| slaGuaranteeDays | INTEGER | — |
| accreditations | JSONB | — |
| regions | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | — |

### `backgroundCheckRescreening`

PostgreSQL: `background_check_rescreening` · 9 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| originalCheckId | UUID | FK → `backgroundChecks.id` (SET NULL) |
| scheduledDate | TIMESTAMP | — |
| completedDate | TIMESTAMP | — |
| newCheckId | UUID | — |
| rescreenIntervalMonths | INTEGER | — |
| isAutomated | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |

### `backgroundCheckScoring`

PostgreSQL: `background_check_scoring` · 18 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| checkId | UUID | NOT NULL, FK → `backgroundChecks.id` (CASCADE) |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| overallScore | INTEGER | — |
| criminalScore | INTEGER | — |
| financialScore | INTEGER | — |
| employmentScore | INTEGER | — |
| educationScore | INTEGER | — |
| identityScore | INTEGER | — |
| socialScore | INTEGER | — |
| aiConfidence | INTEGER | — |
| aiReasoning | TEXT | — |
| flaggedItems | JSONB | — |
| anomalies | JSONB | — |
| benchmarkPercentile | INTEGER | — |
| industryComparison | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | — |

### `backgroundCheckSettings`

PostgreSQL: `background_check_settings` · 10 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| defaultPackageId | UUID | — |
| notifyOnComplete | BOOLEAN | — |
| notifyOnHighRisk | BOOLEAN | — |
| slaWarningDays | INTEGER | — |
| checkExpiryDays | INTEGER | — |
| providers | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | — |

### `backgroundCheckTimeline`

PostgreSQL: `background_check_timeline` · 5 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| checkId | UUID | NOT NULL, FK → `backgroundChecks.id` (CASCADE) |
| description | TEXT | — |
| performedBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |

### `backgroundCheckTrustProfiles`

PostgreSQL: `background_check_trust_profiles` · 19 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| compositeScore | INTEGER | — |
| criminalScore | INTEGER | — |
| financialScore | INTEGER | — |
| employmentScore | INTEGER | — |
| educationScore | INTEGER | — |
| identityScore | INTEGER | — |
| referenceScore | INTEGER | — |
| totalChecksCompleted | INTEGER | — |
| totalChecksFailed | INTEGER | — |
| lastCheckDate | TIMESTAMP | — |
| nextRescreenDate | TIMESTAMP | — |
| shareExpiresAt | TIMESTAMP | — |
| highlights | JSONB | — |
| concerns | JSONB | — |
| verificationSummary | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | — |

### `backgroundChecks`

PostgreSQL: `background_checks` · 15 columns · 4 FK out · 9 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| applicationId | UUID | FK → `jobApplications.id` (SET NULL) |
| result | JSONB | — |
| completedAt | TIMESTAMP | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| estimatedCost | INTEGER | — |
| actualCost | INTEGER | — |
| slaDeadline | TIMESTAMP | — |
| consentRecorded | BOOLEAN | — |
| packageId | UUID | — |
| assignedTo | UUID | FK → `users.id` (SET NULL) |
| expiresAt | TIMESTAMP | — |
| updatedAt | TIMESTAMP | — |

**Referenced by:** `backgroundCheckNotes.checkId`, `backgroundCheckTimeline.checkId`, `backgroundCheckConsent.checkId`, `backgroundCheckDocuments.checkId`, `backgroundCheckDisputes.checkId`, `backgroundCheckAlerts.checkId`, `backgroundCheckScoring.checkId`, `backgroundCheckAdjudications.checkId` +1 more

## Fraud & Security

**30 tables** — Fraud detection, investigations, honeypots, behavioural profiles.

### `fraudAlerts`

PostgreSQL: `fraud_alerts` · 8 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| message | TEXT | NOT NULL |
| relatedEntityId | UUID | — |
| isRead | BOOLEAN | — |
| isDismissed | BOOLEAN | — |
| readBy | UUID | FK → `users.id` (SET NULL) |
| readAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

### `fraudAnomalyEvents`

PostgreSQL: `fraud_anomaly_events` · 12 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| modelId | UUID | — |
| description | TEXT | — |
| expectedValue | REAL | — |
| observedValue | REAL | — |
| deviationPercent | REAL | — |
| confidence | REAL | — |
| affectedUsers | JSONB | — |
| suggestedActions | JSONB | — |
| isAcknowledged | BOOLEAN | — |
| acknowledgedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

### `fraudAuditLog`

PostgreSQL: `fraud_audit_log` · 5 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| detectionId | UUID | FK → `fraudDetections.id` (SET NULL) |
| adminId | UUID | FK → `users.id` (SET NULL) |
| details | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

### `fraudBehavioralProfiles`

PostgreSQL: `fraud_behavioral_profiles` · 12 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL |
| profileData | JSONB | NOT NULL |
| anomalyScore | REAL | — |
| baselineDeviation | REAL | — |
| riskIndicators | JSONB | — |
| isBot | BOOLEAN | — |
| botConfidence | REAL | — |
| lastActivityAt | TIMESTAMP | — |
| sessionsAnalyzed | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `fraudComplianceReports`

PostgreSQL: `fraud_compliance_reports` · 8 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| content | JSONB | NOT NULL |
| generatedFrom | JSONB | — |
| approvedAt | TIMESTAMP | — |
| submittedAt | TIMESTAMP | — |
| dueDate | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `fraudDetections`

PostgreSQL: `fraud_detections` · 8 columns · 1 FK out · 2 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| contentId | UUID | NOT NULL |
| riskScore | REAL | — |
| flags | JSONB | — |
| aiReasoning | TEXT | — |
| reviewedBy | UUID | FK → `users.id` (SET NULL) |
| reviewedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

**Referenced by:** `fraudAuditLog.detectionId`, `fraudReviewNotes.fraudDetectionId`

### `fraudEvidenceBoards`

PostgreSQL: `fraud_evidence_boards` · 9 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| investigationId | UUID | — |
| description | TEXT | — |
| pins | JSONB | — |
| connections | JSONB | — |
| annotations | JSONB | — |
| collaborators | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `fraudFinancialImpact`

PostgreSQL: `fraud_financial_impact` · 14 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| totalLossPrevented | REAL | — |
| totalLossIncurred | REAL | — |
| casesDetected | INTEGER | — |
| casesPrevented | INTEGER | — |
| casesUndetected | INTEGER | — |
| avgDetectionTimeHours | REAL | — |
| avgResolutionTimeHours | REAL | — |
| operationalCost | REAL | — |
| roi | REAL | — |
| breakdownByCategory | JSONB | — |
| breakdownByRiskLevel | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `fraudForensicsCases`

PostgreSQL: `fraud_forensics_cases` · 9 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| subjectUserId | UUID | — |
| contentId | UUID | — |
| verificationResult | JSONB | — |
| riskScore | INTEGER | — |
| notes | TEXT | — |
| completedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `fraudGeoAnalysis`

PostgreSQL: `fraud_geo_analysis` · 6 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| detectionCount | INTEGER | — |
| highRiskCount | INTEGER | — |
| averageRiskScore | REAL | — |
| topFraudTypes | JSONB | — |
| lastUpdated | TIMESTAMP | NOT NULL |

### `fraudHoneypotInteractions`

PostgreSQL: `fraud_honeypot_interactions` · 7 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| honeypotId | UUID | NOT NULL |
| userId | UUID | — |
| userAgent | TEXT | — |
| metadata | JSONB | — |
| isSuspicious | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |

### `fraudHoneypots`

PostgreSQL: `fraud_honeypots` · 11 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| config | JSONB | NOT NULL |
| deployedAt | TIMESTAMP | — |
| expiresAt | TIMESTAMP | — |
| viewCount | INTEGER | — |
| interactionCount | INTEGER | — |
| trapTriggeredCount | INTEGER | — |
| caughtUserIds | JSONB | — |
| lastTriggeredAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `fraudIdentityClusters`

PostgreSQL: `fraud_identity_clusters` · 10 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| primaryUserId | UUID | — |
| linkedUserIds | JSONB | — |
| signals | JSONB | — |
| overallConfidence | REAL | — |
| accountCount | INTEGER | — |
| notes | TEXT | — |
| resolvedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `fraudIncidentTransactions`

PostgreSQL: `fraud_incident_transactions` · 10 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| investigationId | UUID | — |
| detectionId | UUID | — |
| amount | REAL | NOT NULL |
| affectedUserId | UUID | — |
| perpetratorUserId | UUID | — |
| description | TEXT | — |
| recoveredAmount | REAL | — |
| recoveredAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

### `fraudInvestigationNotes`

PostgreSQL: `fraud_investigation_notes` · 6 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| investigationId | UUID | NOT NULL, FK → `fraudInvestigations.id` (CASCADE) |
| authorId | UUID | FK → `users.id` (SET NULL) |
| content | TEXT | NOT NULL |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

### `fraudInvestigations`

PostgreSQL: `fraud_investigations` · 16 columns · 3 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| assignedTo | UUID | FK → `users.id` (SET NULL) |
| reportedBy | UUID | FK → `users.id` (SET NULL) |
| suspectUserId | UUID | FK → `users.id` (SET NULL) |
| linkedDetectionIds | JSONB | — |
| evidence | JSONB | — |
| findings | TEXT | — |
| resolution | TEXT | — |
| riskScore | REAL | — |
| slaDeadline | TIMESTAMP | — |
| escalatedAt | TIMESTAMP | — |
| resolvedAt | TIMESTAMP | — |
| closedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `fraudInvestigationNotes.investigationId`

### `fraudKnownBadActors`

PostgreSQL: `fraud_known_bad_actors` · 9 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| reason | TEXT | — |
| associatedCampaigns | JSONB | — |
| matchCount | INTEGER | — |
| lastMatchedAt | TIMESTAMP | — |
| isActive | BOOLEAN | — |
| expiresAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `fraudNetworkLinks`

PostgreSQL: `fraud_network_links` · 7 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| sourceUserId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| targetUserId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| strength | REAL | — |
| metadata | JSONB | — |
| isConfirmed | BOOLEAN | — |
| detectedAt | TIMESTAMP | NOT NULL |

### `fraudPatternLibrary`

PostgreSQL: `fraud_pattern_library` · 15 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| saSpecific | BOOLEAN | — |
| detectionSignatures | JSONB | — |
| redFlags | JSONB | — |
| exampleScenarios | JSONB | — |
| mitigationSteps | JSONB | — |
| regulatoryReferences | JSONB | — |
| linkedRuleIds | JSONB | — |
| linkedPlaybookIds | JSONB | — |
| detectionCount | INTEGER | — |
| lastDetectedAt | TIMESTAMP | — |
| isActive | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `fraudPlaybookExecutions`

PostgreSQL: `fraud_playbook_executions` · 8 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| playbookId | UUID | NOT NULL |
| triggerDetails | JSONB | — |
| stepsCompleted | INTEGER | — |
| totalSteps | INTEGER | — |
| results | JSONB | — |
| completedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

### `fraudPlaybooks`

PostgreSQL: `fraud_playbooks` · 9 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| triggerConditions | JSONB | — |
| steps | JSONB | — |
| isEnabled | BOOLEAN | — |
| executionCount | INTEGER | — |
| lastExecutedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `fraudPredictiveModels`

PostgreSQL: `fraud_predictive_models` · 14 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| accuracy | REAL | — |
| precisionScore | REAL | — |
| recallScore | REAL | — |
| f1Score | REAL | — |
| lastTrainedAt | TIMESTAMP | — |
| trainingDataSize | INTEGER | — |
| features | JSONB | — |
| hyperparameters | JSONB | — |
| predictions | JSONB | — |
| anomalyThreshold | REAL | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `fraudReviewNotes`

PostgreSQL: `fraud_review_notes` · 5 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| fraudDetectionId | UUID | NOT NULL, FK → `fraudDetections.id` (CASCADE) |
| note | TEXT | NOT NULL |
| reviewedBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |

### `fraudRules`

PostgreSQL: `fraud_rules` · 7 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| isEnabled | BOOLEAN | NOT NULL |
| triggerValue | REAL | NOT NULL |
| notifyAdmin | BOOLEAN | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `fraudScanConfig`

PostgreSQL: `fraud_scan_config` · 4 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| isEnabled | BOOLEAN | NOT NULL |
| minRiskScore | INTEGER | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `fraudSimulations`

PostgreSQL: `fraud_simulations` · 7 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| config | JSONB | NOT NULL |
| results | JSONB | — |
| startedAt | TIMESTAMP | — |
| completedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

### `fraudThreatIntel`

PostgreSQL: `fraud_threat_intel` · 12 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| confidence | INTEGER | — |
| indicators | JSONB | — |
| affectedPlatformAreas | JSONB | — |
| mitigationSteps | JSONB | — |
| isActive | BOOLEAN | — |
| expiresAt | TIMESTAMP | — |
| lastSeenAt | TIMESTAMP | — |
| matchCount | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `fraudUserRiskProfiles`

PostgreSQL: `fraud_user_risk_profiles` · 16 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, UNIQUE, FK → `users.id` (CASCADE) |
| overallRiskScore | REAL | — |
| riskFactors | JSONB | — |
| behaviorFlags | JSONB | — |
| detectionCount | INTEGER | — |
| highRiskDetections | INTEGER | — |
| lastDetectionAt | TIMESTAMP | — |
| accountAge | INTEGER | — |
| ipAddressCount | INTEGER | — |
| deviceCount | INTEGER | — |
| isOnWatchlist | BOOLEAN | — |
| isBlacklisted | BOOLEAN | — |
| lastAssessedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `fraudVelocityRules`

PostgreSQL: `fraud_velocity_rules` · 9 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| maxCount | INTEGER | NOT NULL |
| timeWindowMinutes | INTEGER | NOT NULL |
| isEnabled | BOOLEAN | — |
| triggerCount | INTEGER | — |
| lastTriggeredAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `fraudWatchlist`

PostgreSQL: `fraud_watchlist` · 6 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| reason | TEXT | — |
| addedBy | UUID | FK → `users.id` (SET NULL) |
| isActive | BOOLEAN | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |

## RBAC & Audit

**11 tables** — Role-based access control, audit trail, access review campaigns.

### `accessReviewCampaigns`

PostgreSQL: `access_review_campaigns` · 13 columns · 2 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| targetRoleIds | JSONB | — |
| dueDate | TIMESTAMP | — |
| startedAt | TIMESTAMP | — |
| completedAt | TIMESTAMP | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| reviewerIds | JSONB | — |
| settings | JSONB | — |
| stats | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `accessReviewItems.campaignId`

### `accessReviewItems`

PostgreSQL: `access_review_items` · 8 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| campaignId | UUID | NOT NULL, FK → `accessReviewCampaigns.id` (CASCADE) |
| assignmentId | UUID | NOT NULL, FK → `roleAssignments.id` (CASCADE) |
| reviewerId | UUID | FK → `users.id` (SET NULL) |
| justification | TEXT | — |
| riskScore | INTEGER | — |
| decidedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

### `auditAnomalies`

PostgreSQL: `audit_anomalies` · 12 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| userId | UUID | FK → `users.id` (SET NULL) |
| confidence | REAL | NOT NULL |
| description | TEXT | NOT NULL |
| evidence | JSONB | — |
| relatedEventIds | JSONB | — |
| resolvedBy | UUID | FK → `users.id` (SET NULL) |
| resolvedAt | TIMESTAMP | — |
| resolutionNote | TEXT | — |
| detectedAt | TIMESTAMP | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |

### `auditTrail`

PostgreSQL: `audit_trail` · 14 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| userId | UUID | FK → `users.id` (SET NULL) |
| entityId | UUID | — |
| changes | JSONB | — |
| userAgent | TEXT | — |
| riskScore | INTEGER | NOT NULL |
| metadata | JSONB | — |
| complianceFlags | JSONB | — |
| parentEventId | UUID | — |
| durationMs | INTEGER | — |
| statusCode | INTEGER | — |
| resourceUrl | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

### `auditWatchRules`

PostgreSQL: `audit_watch_rules` · 13 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| conditions | JSONB | NOT NULL |
| notifyChannels | JSONB | — |
| notifyRecipients | JSONB | — |
| cooldownMinutes | INTEGER | — |
| isActive | BOOLEAN | — |
| triggerCount | INTEGER | — |
| lastTriggeredAt | TIMESTAMP | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `rbacAuditLog`

PostgreSQL: `rbac_audit_log` · 7 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| actorId | UUID | FK → `users.id` (SET NULL) |
| targetId | UUID | NOT NULL |
| changes | JSONB | — |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

### `roleAnalyticsEvents`

PostgreSQL: `role_analytics_events` · 6 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| actorId | UUID | FK → `users.id` (SET NULL) |
| roleId | UUID | FK → `roleDefinitions.id` (SET NULL) |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

### `roleAssignments`

PostgreSQL: `role_assignments` · 9 columns · 5 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| roleDefinitionId | UUID | NOT NULL, FK → `roleDefinitions.id` (CASCADE) |
| teamMemberId | UUID | FK → `teamMembers.id` (CASCADE) |
| userId | UUID | FK → `users.id` (CASCADE) |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| assignedBy | UUID | FK → `users.id` (SET NULL) |
| expiresAt | TIMESTAMP | — |
| isActive | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |

**Referenced by:** `accessReviewItems.assignmentId`

### `roleChangeRequests`

PostgreSQL: `role_change_requests` · 16 columns · 6 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| requesterId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| targetUserId | UUID | FK → `users.id` (CASCADE) |
| targetTeamMemberId | UUID | FK → `teamMembers.id` (CASCADE) |
| roleDefinitionId | UUID | FK → `roleDefinitions.id` (SET NULL) |
| currentRoleId | UUID | FK → `roleDefinitions.id` (SET NULL) |
| reason | TEXT | — |
| expiresAt | TIMESTAMP | — |
| approverIds | JSONB | — |
| approvals | JSONB | — |
| requiredApprovals | INTEGER | — |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |
| resolvedAt | TIMESTAMP | — |

### `roleDefinitions`

PostgreSQL: `role_definitions` · 12 columns · 2 FK out · 4 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| permissions | JSONB | — |
| isSystem | BOOLEAN | — |
| isDefault | BOOLEAN | — |
| parentRoleId | UUID | — |
| maxUsers | INTEGER | — |
| metadata | JSONB | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `roleAssignments.roleDefinitionId`, `roleChangeRequests.roleDefinitionId`, `roleChangeRequests.currentRoleId`, `roleAnalyticsEvents.roleId`

### `roles`

PostgreSQL: `roles` · 11 columns · 2 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (SET NULL) |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| description | TEXT | — |
| mustHaveSkills | JSONB | — |
| niceToHaveSkills | JSONB | — |
| knockouts | JSONB | — |
| weights | JSONB | — |
| isActive | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `screenings.roleId`

## Automation

**12 tables** — Workflow automation chains, templates, webhooks, A/B tests.

### `automationAbTests`

PostgreSQL: `automation_ab_tests` · 17 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| variantA | JSONB | NOT NULL |
| variantB | JSONB | NOT NULL |
| splitRatio | INTEGER | — |
| targetSampleSize | INTEGER | — |
| currentSampleA | INTEGER | — |
| currentSampleB | INTEGER | — |
| resultA | JSONB | — |
| resultB | JSONB | — |
| confidenceLevel | INTEGER | — |
| startedAt | TIMESTAMP | — |
| completedAt | TIMESTAMP | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `automationChainExecutions`

PostgreSQL: `automation_chain_executions` · 11 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| chainId | UUID | NOT NULL, FK → `automationChains.id` (CASCADE) |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| stepsCompleted | INTEGER | — |
| totalSteps | INTEGER | NOT NULL |
| stepResults | JSONB | — |
| triggerData | JSONB | — |
| errorMessage | TEXT | — |
| totalDurationMs | INTEGER | — |
| startedAt | TIMESTAMP | NOT NULL |
| completedAt | TIMESTAMP | — |

### `automationChainSteps`

PostgreSQL: `automation_chain_steps` · 6 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| chainId | UUID | NOT NULL, FK → `automationChains.id` (CASCADE) |
| automationId | UUID | FK → `workflowAutomations.id` (SET NULL) |
| stepOrder | INTEGER | NOT NULL |
| config | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

### `automationChains`

PostgreSQL: `automation_chains` · 12 columns · 2 FK out · 2 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| triggerConditions | JSONB | — |
| maxRetries | INTEGER | — |
| timeoutMs | INTEGER | — |
| isActive | BOOLEAN | — |
| executionCount | INTEGER | — |
| lastExecutedAt | TIMESTAMP | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `automationChainSteps.chainId`, `automationChainExecutions.chainId`

### `automationExecutionLogs`

PostgreSQL: `automation_execution_logs` · 10 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| automationId | UUID | NOT NULL, FK → `workflowAutomations.id` (CASCADE) |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| triggerData | JSONB | — |
| actionsExecuted | JSONB | — |
| errorMessage | TEXT | — |
| candidateId | UUID | — |
| jobId | UUID | — |
| executionDurationMs | INTEGER | — |
| executedAt | TIMESTAMP | NOT NULL |

### `automationExecutions`

PostgreSQL: `automation_executions` · 8 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| ruleId | UUID | NOT NULL, FK → `billingAutomationRules.id` (CASCADE) |
| triggerData | JSONB | — |
| actionResult | JSONB | — |
| errorMessage | TEXT | — |
| durationMs | INTEGER | — |
| executedAt | TIMESTAMP | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |

### `automationInsights`

PostgreSQL: `automation_insights` · 10 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| description | TEXT | NOT NULL |
| suggestedAutomation | JSONB | — |
| evidence | JSONB | — |
| predictedTimeSavedMins | INTEGER | — |
| predictedImpactScore | INTEGER | — |
| adoptedAutomationId | UUID | — |
| expiresAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

### `automationSchedules`

PostgreSQL: `automation_schedules` · 9 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| automationId | UUID | NOT NULL, FK → `workflowAutomations.id` (CASCADE) |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| scheduledDays | JSONB | — |
| nextRunAt | TIMESTAMP | — |
| lastRunAt | TIMESTAMP | — |
| isActive | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `automationTemplates`

PostgreSQL: `automation_templates` · 9 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| triggerConditions | JSONB | — |
| actions | JSONB | — |
| tags | JSONB | — |
| popularity | INTEGER | — |
| isGlobal | BOOLEAN | — |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| createdAt | TIMESTAMP | NOT NULL |

### `automationVersions`

PostgreSQL: `automation_versions` · 8 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| automationId | UUID | NOT NULL, FK → `workflowAutomations.id` (CASCADE) |
| version | INTEGER | NOT NULL |
| triggerConditions | JSONB | — |
| actions | JSONB | — |
| changeNote | TEXT | — |
| changedBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |

### `automationWebhookLogs`

PostgreSQL: `automation_webhook_logs` · 12 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| webhookId | UUID | NOT NULL, FK → `automationWebhooks.id` (CASCADE) |
| automationId | UUID | — |
| requestUrl | TEXT | NOT NULL |
| requestHeaders | JSONB | — |
| requestBody | JSONB | — |
| responseStatus | INTEGER | — |
| responseBody | TEXT | — |
| durationMs | INTEGER | — |
| retryAttempt | INTEGER | — |
| error | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

### `automationWebhooks`

PostgreSQL: `automation_webhooks` · 18 columns · 2 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| url | TEXT | NOT NULL |
| headers | JSONB | — |
| payloadTemplate | JSONB | — |
| authConfig | JSONB | — |
| retryPolicy | JSONB | — |
| timeoutMs | INTEGER | — |
| isActive | BOOLEAN | — |
| lastCalledAt | TIMESTAMP | — |
| successCount | INTEGER | — |
| failureCount | INTEGER | — |
| lastStatusCode | INTEGER | — |
| lastError | TEXT | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `automationWebhookLogs.webhookId`

## Onboarding

**6 tables** — Employee onboarding templates, instances, buddies, checklists.

### `onboardingBuddies`

PostgreSQL: `onboarding_buddies` · 11 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| instanceId | UUID | FK → `onboardingInstances.id` (CASCADE) |
| expertise | JSONB | — |
| meetingsScheduled | INTEGER | — |
| meetingsCompleted | INTEGER | — |
| rating | INTEGER | — |
| notes | TEXT | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `onboardingCheckins`

PostgreSQL: `onboarding_checkins` · 13 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| instanceId | UUID | FK → `onboardingInstances.id` (CASCADE) |
| scheduledDate | TIMESTAMP | NOT NULL |
| participants | JSONB | — |
| notes | TEXT | — |
| satisfaction | INTEGER | — |
| actionItems | JSONB | — |
| duration | INTEGER | — |
| completedAt | TIMESTAMP | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `onboardingDocuments`

PostgreSQL: `onboarding_documents` · 11 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| instanceId | UUID | FK → `onboardingInstances.id` (CASCADE) |
| required | BOOLEAN | — |
| deadline | TIMESTAMP | — |
| uploadedAt | TIMESTAMP | — |
| verifiedAt | TIMESTAMP | — |
| notes | TEXT | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `onboardingInstances`

PostgreSQL: `onboarding_instances` · 11 columns · 4 FK out · 3 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| templateId | UUID | FK → `onboardingTemplates.id` (SET NULL) |
| applicationId | UUID | FK → `jobApplications.id` (SET NULL) |
| startDate | TIMESTAMP | — |
| tasks | JSONB | NOT NULL |
| progress | INTEGER | — |
| completedAt | TIMESTAMP | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `onboardingBuddies.instanceId`, `onboardingDocuments.instanceId`, `onboardingCheckins.instanceId`

### `onboardingResources`

PostgreSQL: `onboarding_resources` · 12 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| url | TEXT | — |
| mandatory | BOOLEAN | — |
| tags | JSONB | — |
| views | INTEGER | — |
| completions | INTEGER | — |
| rating | INTEGER | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `onboardingTemplates`

PostgreSQL: `onboarding_templates` · 7 columns · 2 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| tasks | JSONB | NOT NULL |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `onboardingInstances.templateId`

## Recruiter KPIs

**11 tables** — Recruiter performance: KPI targets, call notes, LinkedIn leads, pipelines.

### `callNotes`

PostgreSQL: `call_notes` · 22 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL |
| recruiterId | UUID | NOT NULL |
| contactId | UUID | — |
| duration | INTEGER | — |
| rawNotes | TEXT | NOT NULL |
| aiSummary | TEXT | — |
| aiActionItems | JSONB | — |
| jobId | UUID | — |
| submissionId | UUID | — |
| rating | INTEGER | — |
| tags | JSONB | — |
| pinned | BOOLEAN | — |
| aiKeyPoints | JSONB | — |
| aiFollowUpSuggestion | TEXT | — |
| followUpRequired | BOOLEAN | — |
| followUpDate | TIMESTAMP | — |
| followUpNotes | TEXT | — |
| followUpCompletedAt | TIMESTAMP | — |
| completed | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `callObjections`

PostgreSQL: `call_objections` · 9 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL |
| recruiterId | UUID | NOT NULL |
| callNoteId | UUID | — |
| objection | TEXT | NOT NULL |
| aiRebuttal | TEXT | — |
| userRebuttal | TEXT | — |
| frequency | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |

### `callPlaybooks`

PostgreSQL: `call_playbooks` · 9 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL |
| recruiterId | UUID | NOT NULL |
| description | TEXT | — |
| steps | JSONB | — |
| isShared | BOOLEAN | — |
| usageCount | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `kpiActivityLog`

PostgreSQL: `kpi_activity_log` · 11 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL |
| recruiterId | UUID | NOT NULL |
| description | TEXT | — |
| relatedJobId | UUID | — |
| relatedCandidateId | UUID | — |
| revenueImpact | INTEGER | — |
| duration | INTEGER | — |
| notes | TEXT | — |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

### `kpiTargets`

PostgreSQL: `kpi_targets` · 20 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL |
| recruiterId | UUID | NOT NULL |
| callsTarget | INTEGER | — |
| emailsTarget | INTEGER | — |
| sourcingTarget | INTEGER | — |
| screeningTarget | INTEGER | — |
| submissionsTarget | INTEGER | — |
| interviewsTarget | INTEGER | — |
| offersTarget | INTEGER | — |
| placementsTarget | INTEGER | — |
| revenueTarget | INTEGER | — |
| pipelineTarget | INTEGER | — |
| submissionToInterviewTarget | INTEGER | — |
| interviewToOfferTarget | INTEGER | — |
| offerToPlacementTarget | INTEGER | — |
| avgTimeToFillTarget | INTEGER | — |
| isActive | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `leadNurtureEnrollments`

PostgreSQL: `lead_nurture_enrollments` · 8 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| sequenceId | UUID | NOT NULL, FK → `leadNurtureSequences.id` (CASCADE) |
| leadId | UUID | NOT NULL, FK → `linkedinLeads.id` (CASCADE) |
| currentStep | INTEGER | — |
| nextStepAt | TIMESTAMP | — |
| enrolledAt | TIMESTAMP | NOT NULL |
| completedAt | TIMESTAMP | — |
| stepResults | JSONB | — |

### `leadNurtureSequences`

PostgreSQL: `lead_nurture_sequences` · 11 columns · 1 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| recruiterId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| description | TEXT | — |
| steps | JSONB | — |
| stopConditions | JSONB | — |
| enrolledCount | INTEGER | — |
| completedCount | INTEGER | — |
| responseRate | REAL | — |
| isActive | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `leadNurtureEnrollments.sequenceId`

### `linkedinLeadDuplicates`

PostgreSQL: `linkedin_lead_duplicates` · 8 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| recruiterId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| leadId1 | UUID | NOT NULL, FK → `linkedinLeads.id` (CASCADE) |
| leadId2 | UUID | NOT NULL, FK → `linkedinLeads.id` (CASCADE) |
| confidence | REAL | NOT NULL |
| mergedIntoId | UUID | — |
| detectedAt | TIMESTAMP | NOT NULL |
| resolvedAt | TIMESTAMP | — |

### `linkedinLeadJobMatches`

PostgreSQL: `linkedin_lead_job_matches` · 9 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| leadId | UUID | NOT NULL, FK → `linkedinLeads.id` (CASCADE) |
| jobId | UUID | NOT NULL, FK → `jobs.id` (CASCADE) |
| matchScore | INTEGER | NOT NULL |
| matchExplanation | TEXT | — |
| matchedSkills | JSONB | — |
| missingSkills | JSONB | — |
| isRecommended | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |

### `linkedinLeads`

PostgreSQL: `linkedin_leads` · 27 columns · 1 FK out · 4 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| recruiterId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| headline | TEXT | — |
| linkedinProfileUrl | TEXT | — |
| customFields | JSONB | — |
| convertedCandidateId | UUID | — |
| notes | TEXT | — |
| tags | JSONB | — |
| leadScore | INTEGER | — |
| lastContactedAt | TIMESTAMP | — |
| nextFollowUpAt | TIMESTAMP | — |
| assignedTo | UUID | — |
| activityLog | JSONB | — |
| aiScore | INTEGER | — |
| aiInsights | JSONB | — |
| aiScoredAt | TIMESTAMP | — |
| outreachHistory | JSONB | — |
| conversionProbability | REAL | — |
| predictedConvertBy | TIMESTAMP | — |
| predictionUpdatedAt | TIMESTAMP | — |
| linkedTalentPoolIds | JSONB | — |
| linkedSequenceIds | JSONB | — |
| linkedCallNoteIds | JSONB | — |
| crossPlatformActions | JSONB | — |
| importedAt | TIMESTAMP | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `linkedinLeadJobMatches.leadId`, `leadNurtureEnrollments.leadId`, `linkedinLeadDuplicates.leadId1`, `linkedinLeadDuplicates.leadId2`

### `recruiterKpis`

PostgreSQL: `recruiter_kpis` · 23 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL |
| recruiterId | UUID | NOT NULL |
| periodStart | TIMESTAMP | NOT NULL |
| periodEnd | TIMESTAMP | NOT NULL |
| callsMade | INTEGER | — |
| emailsSent | INTEGER | — |
| candidatesSourced | INTEGER | — |
| candidatesScreened | INTEGER | — |
| submissionsMade | INTEGER | — |
| interviewsScheduled | INTEGER | — |
| interviewsConducted | INTEGER | — |
| offersMade | INTEGER | — |
| offersAccepted | INTEGER | — |
| placementsMade | INTEGER | — |
| revenueGenerated | INTEGER | — |
| revenueTarget | INTEGER | — |
| pipelineValue | INTEGER | — |
| submissionToInterview | INTEGER | — |
| interviewToOffer | INTEGER | — |
| offerToPlacement | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## Referrals & References

**4 tables** — Referral programmes, campaigns, reference requests and responses.

### `referenceRequests`

PostgreSQL: `reference_requests` · 6 columns · 2 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| recruiterId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| candidateId | UUID | FK → `candidates.id` (SET NULL) |
| sentAt | TIMESTAMP | — |
| completedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

**Referenced by:** `referenceResponses.requestId`

### `referenceResponses`

PostgreSQL: `reference_responses` · 8 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| requestId | UUID | NOT NULL, FK → `referenceRequests.id` (CASCADE) |
| ratings | JSONB | — |
| strengths | TEXT | — |
| concerns | TEXT | — |
| rawResponses | JSONB | — |
| aiSummary | TEXT | — |
| completedAt | TIMESTAMP | NOT NULL |

### `referralCampaigns`

PostgreSQL: `referral_campaigns` · 13 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| jobId | UUID | FK → `jobs.id` (SET NULL) |
| targetSkills | TEXT | — |
| bonusTiers | JSONB | — |
| defaultBonusAmount | INTEGER | — |
| targetCount | INTEGER | — |
| startsAt | TIMESTAMP | — |
| expiresAt | TIMESTAMP | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `referrals`

PostgreSQL: `referrals` · 18 columns · 4 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| jobId | UUID | FK → `jobs.id` (CASCADE) |
| referrerUserId | UUID | FK → `users.id` (SET NULL) |
| candidateLinkedin | TEXT | — |
| recommendation | TEXT | — |
| resumeUrl | TEXT | — |
| applicationId | UUID | FK → `jobApplications.id` (SET NULL) |
| bonusAmount | INTEGER | — |
| bonusPaidAt | TIMESTAMP | — |
| skills | TEXT | — |
| notes | TEXT | — |
| rating | INTEGER | — |
| interviewDate | TIMESTAMP | — |
| hiredDate | TIMESTAMP | — |
| rejectedReason | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## White Label

**15 tables** — White-label configurations: themes, domains, email templates, branding.

### `whiteLabelAnalytics`

PostgreSQL: `white_label_analytics` · 9 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| metricDate | TIMESTAMP | NOT NULL |
| count | INTEGER | — |
| uniqueVisitors | INTEGER | — |
| avgLoadTime | REAL | — |
| bounceRate | REAL | — |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

### `whiteLabelAssets`

PostgreSQL: `white_label_assets` · 12 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| url | TEXT | NOT NULL |
| thumbnailUrl | TEXT | — |
| fileSizeBytes | INTEGER | — |
| dimensions | JSONB | — |
| usageContext | JSONB | — |
| isActive | BOOLEAN | — |
| sortOrder | INTEGER | — |
| uploadedBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `whiteLabelAuditLogs`

PostgreSQL: `white_label_audit_logs` · 8 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| userId | UUID | FK → `users.id` (SET NULL) |
| entityId | UUID | — |
| previousValues | JSONB | — |
| newValues | JSONB | — |
| userAgent | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

### `whiteLabelBrandAudits`

PostgreSQL: `white_label_brand_audits` · 13 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| overallScore | INTEGER | NOT NULL |
| colorConsistencyScore | INTEGER | — |
| typographyConsistencyScore | INTEGER | — |
| logoUsageScore | INTEGER | — |
| accessibilityScore | INTEGER | — |
| messagingConsistencyScore | INTEGER | — |
| issues | JSONB | — |
| recommendations | JSONB | — |
| entityCounts | JSONB | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |

### `whiteLabelChangeRequests`

PostgreSQL: `white_label_change_requests` · 12 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| requestedBy | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| entityId | UUID | — |
| proposedChanges | JSONB | NOT NULL |
| currentValues | JSONB | — |
| reason | TEXT | — |
| reviewedBy | UUID | FK → `users.id` (SET NULL) |
| reviewNotes | TEXT | — |
| reviewedAt | TIMESTAMP | — |
| policyViolations | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

### `whiteLabelConfigs`

PostgreSQL: `white_label_configs` · 7 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, UNIQUE, FK → `organizations.id` (CASCADE) |
| logoUrl | TEXT | — |
| customCss | TEXT | — |
| isActive | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `whiteLabelDomains`

PostgreSQL: `white_label_domains` · 10 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| dnsRecords | JSONB | — |
| sslCertificateExpiry | TIMESTAMP | — |
| lastVerifiedAt | TIMESTAMP | — |
| isPrimary | BOOLEAN | — |
| redirectHttps | BOOLEAN | — |
| wwwRedirect | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `whiteLabelEmailTemplates`

PostgreSQL: `white_label_email_templates` · 16 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| headerHtml | TEXT | — |
| bodyHtml | TEXT | — |
| footerHtml | TEXT | — |
| colorScheme | JSONB | — |
| socialLinks | JSONB | — |
| isDefault | BOOLEAN | — |
| isActive | BOOLEAN | — |
| lastSentAt | TIMESTAMP | — |
| sendCount | INTEGER | — |
| openRate | REAL | — |
| clickRate | REAL | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `whiteLabelPageLayouts`

PostgreSQL: `white_label_page_layouts` · 14 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| layout | JSONB | — |
| headerConfig | JSONB | — |
| footerConfig | JSONB | — |
| seoConfig | JSONB | — |
| customCss | TEXT | — |
| customJs | TEXT | — |
| isActive | BOOLEAN | — |
| isPublished | BOOLEAN | — |
| publishedAt | TIMESTAMP | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `whiteLabelPolicies`

PostgreSQL: `white_label_policies` · 10 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| rules | JSONB | — |
| isActive | BOOLEAN | — |
| violationCount | INTEGER | — |
| lastTriggeredAt | TIMESTAMP | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `whiteLabelPreviewLinks`

PostgreSQL: `white_label_preview_links` · 9 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| brandSnapshot | JSONB | NOT NULL |
| themeSnapshot | JSONB | — |
| expiresAt | TIMESTAMP | NOT NULL |
| viewCount | INTEGER | — |
| maxViews | INTEGER | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |

### `whiteLabelThemes`

PostgreSQL: `white_label_themes` · 14 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| isDefault | BOOLEAN | — |
| isActive | BOOLEAN | — |
| colors | JSONB | — |
| typography | JSONB | — |
| spacing | JSONB | — |
| effects | JSONB | — |
| previewImageUrl | TEXT | — |
| cssOverrides | TEXT | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `whiteLabelVariantAssignments`

PostgreSQL: `white_label_variant_assignments` · 4 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| variantId | UUID | NOT NULL, FK → `whiteLabelVariants.id` (CASCADE) |
| entityId | UUID | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |

### `whiteLabelVariants`

PostgreSQL: `white_label_variants` · 13 columns · 2 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| parentVariantId | UUID | — |
| isMaster | BOOLEAN | — |
| brandOverrides | JSONB | — |
| themeId | UUID | — |
| domainId | UUID | — |
| emailTemplateIds | JSONB | — |
| metadata | JSONB | — |
| isActive | BOOLEAN | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `whiteLabelVariantAssignments.variantId`

### `whiteLabelVersions`

PostgreSQL: `white_label_versions` · 9 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| entityId | UUID | NOT NULL |
| versionNumber | INTEGER | NOT NULL |
| snapshot | JSONB | NOT NULL |
| changeSummary | TEXT | — |
| isCurrentVersion | BOOLEAN | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |

## Data Migration

**14 tables** — Data migration pipelines, field mappings, connectors, compliance.

### `migrationApprovals`

PostgreSQL: `migration_approvals` · 10 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| migrationId | UUID | — |
| exportId | UUID | — |
| requestedBy | UUID | — |
| reviewedBy | UUID | — |
| requestReason | TEXT | — |
| reviewNotes | TEXT | — |
| expiresAt | TIMESTAMP | — |
| reviewedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

### `migrationComplianceAudit`

PostgreSQL: `migration_compliance_audit` · 7 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| ruleId | UUID | — |
| migrationId | UUID | — |
| details | JSONB | — |
| resolvedAt | TIMESTAMP | — |
| resolvedBy | UUID | — |
| createdAt | TIMESTAMP | NOT NULL |

### `migrationComplianceRules`

PostgreSQL: `migration_compliance_rules` · 12 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| fieldPatterns | JSONB | — |
| retentionDays | INTEGER | — |
| appliesTo | JSONB | — |
| isSystemRule | BOOLEAN | — |
| isActive | BOOLEAN | — |
| violationCount | INTEGER | — |
| lastTriggeredAt | TIMESTAMP | — |
| createdBy | UUID | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `migrationConnectors`

PostgreSQL: `migration_connectors` · 18 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| credentials | JSONB | — |
| config | JSONB | — |
| healthScore | INTEGER | — |
| lastHealthCheck | TIMESTAMP | — |
| lastSyncAt | TIMESTAMP | — |
| totalSyncs | INTEGER | — |
| totalRecordsSynced | INTEGER | — |
| errorLog | JSONB | — |
| rateLimitRemaining | INTEGER | — |
| rateLimitResetAt | TIMESTAMP | — |
| autoReconnect | BOOLEAN | — |
| retryAttempts | INTEGER | — |
| timeoutMs | INTEGER | — |
| isActive | BOOLEAN | — |
| createdBy | UUID | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `migrationDataProfiles`

PostgreSQL: `migration_data_profiles` · 17 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| migrationId | UUID | — |
| connectorId | UUID | — |
| totalRecords | INTEGER | — |
| sampleSize | INTEGER | — |
| qualityScore | INTEGER | — |
| completenessScore | INTEGER | — |
| accuracyScore | INTEGER | — |
| consistencyScore | INTEGER | — |
| uniquenessScore | INTEGER | — |
| fieldAnalysis | JSONB | — |
| anomalies | JSONB | — |
| duplicateGroups | INTEGER | — |
| piiFieldsDetected | JSONB | — |
| recommendations | JSONB | — |
| profiledAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

### `migrationExports`

PostgreSQL: `migration_exports` · 18 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| connectorId | UUID | — |
| dataTypes | JSONB | — |
| filters | JSONB | — |
| fieldSelection | JSONB | — |
| totalRecords | INTEGER | — |
| exportedRecords | INTEGER | — |
| errorCount | INTEGER | — |
| fileUrl | TEXT | — |
| fileSize | INTEGER | — |
| complianceChecked | BOOLEAN | — |
| piiMasked | BOOLEAN | — |
| startedAt | TIMESTAMP | — |
| completedAt | TIMESTAMP | — |
| expiresAt | TIMESTAMP | — |
| createdBy | UUID | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `migrationFieldMappings`

PostgreSQL: `migration_field_mappings` · 7 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| migrationId | UUID | FK → `dataMigrations.id` (CASCADE) |
| templateId | UUID | FK → `migrationTemplates.id` (CASCADE) |
| mappings | JSONB | — |
| isActive | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `migrationLogs`

PostgreSQL: `migration_logs` · 5 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| migrationId | UUID | NOT NULL, FK → `dataMigrations.id` (CASCADE) |
| message | TEXT | NOT NULL |
| details | JSONB | — |
| timestamp | TIMESTAMP | NOT NULL |

### `migrationPipelineRuns`

PostgreSQL: `migration_pipeline_runs` · 13 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| pipelineId | UUID | NOT NULL |
| startedAt | TIMESTAMP | — |
| completedAt | TIMESTAMP | — |
| durationMs | INTEGER | — |
| recordsInput | INTEGER | — |
| recordsOutput | INTEGER | — |
| recordsFiltered | INTEGER | — |
| recordsErrored | INTEGER | — |
| stepResults | JSONB | — |
| errors | JSONB | — |
| createdBy | UUID | — |
| createdAt | TIMESTAMP | NOT NULL |

### `migrationPipelines`

PostgreSQL: `migration_pipelines` · 16 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| connectorId | UUID | — |
| steps | JSONB | — |
| inputSchema | JSONB | — |
| outputSchema | JSONB | — |
| errorHandling | JSONB | — |
| schedule | JSONB | — |
| lastRunAt | TIMESTAMP | — |
| runCount | INTEGER | — |
| avgDurationMs | INTEGER | — |
| totalRecordsProcessed | INTEGER | — |
| isActive | BOOLEAN | — |
| createdBy | UUID | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `migrationRollbacks`

PostgreSQL: `migration_rollbacks` · 10 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| migrationId | UUID | NOT NULL, FK → `dataMigrations.id` (CASCADE) |
| recordsReverted | INTEGER | — |
| totalToRevert | INTEGER | — |
| reason | TEXT | — |
| rollbackData | JSONB | — |
| initiatedBy | UUID | FK → `users.id` (SET NULL) |
| startedAt | TIMESTAMP | — |
| completedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

### `migrationSchedules`

PostgreSQL: `migration_schedules` · 16 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| templateId | UUID | FK → `migrationTemplates.id` (SET NULL) |
| dataTypes | JSONB | — |
| scheduledAt | TIMESTAMP | — |
| nextRunAt | TIMESTAMP | — |
| lastRunAt | TIMESTAMP | — |
| runCount | INTEGER | — |
| maxRetries | INTEGER | — |
| isActive | BOOLEAN | — |
| config | JSONB | — |
| notifyOnComplete | BOOLEAN | — |
| notifyOnError | BOOLEAN | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `migrationTemplates`

PostgreSQL: `migration_templates` · 13 columns · 1 FK out · 3 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| dataTypes | JSONB | — |
| fieldMappings | JSONB | — |
| transformations | JSONB | — |
| validationRules | JSONB | — |
| isSystemTemplate | BOOLEAN | — |
| isActive | BOOLEAN | — |
| usageCount | INTEGER | — |
| avgSuccessRate | REAL | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `migrationFieldMappings.templateId`, `migrationSchedules.templateId`, `migrationValidations.templateId`

### `migrationValidations`

PostgreSQL: `migration_validations` · 9 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| migrationId | UUID | FK → `dataMigrations.id` (CASCADE) |
| templateId | UUID | FK → `migrationTemplates.id` (CASCADE) |
| config | JSONB | — |
| passCount | INTEGER | — |
| failCount | INTEGER | — |
| failedRecords | JSONB | — |
| isActive | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |

## Other

**140 tables** — Miscellaneous tables: analytics, workforce planning, vendor management, etc.

### `adminCvFlags`

PostgreSQL: `admin_cv_flags` · 9 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| cvId | UUID | NOT NULL, FK → `cvs.id` (CASCADE) |
| flaggedBy | UUID | NOT NULL, FK → `users.id` |
| notes | TEXT | — |
| resolvedBy | UUID | FK → `users.id` |
| resolvedAt | TIMESTAMP | — |
| resolutionNotes | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `adminCvNotes`

PostgreSQL: `admin_cv_notes` · 7 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| cvId | UUID | NOT NULL, FK → `cvs.id` (CASCADE) |
| authorId | UUID | NOT NULL, FK → `users.id` |
| content | TEXT | NOT NULL |
| isPinned | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `adminCvPoolMembers`

PostgreSQL: `admin_cv_pool_members` · 7 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| poolId | UUID | NOT NULL, FK → `adminCvPools.id` (CASCADE) |
| cvId | UUID | NOT NULL, FK → `cvs.id` (CASCADE) |
| addedBy | UUID | NOT NULL, FK → `users.id` |
| notes | TEXT | — |
| rating | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |

### `adminCvPools`

PostgreSQL: `admin_cv_pools` · 7 columns · 1 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| criteria | JSONB | — |
| isActive | BOOLEAN | — |
| createdBy | UUID | NOT NULL, FK → `users.id` |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `adminCvPoolMembers.poolId`

### `adminCvTagAssignments`

PostgreSQL: `admin_cv_tag_assignments` · 5 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| cvId | UUID | NOT NULL, FK → `cvs.id` (CASCADE) |
| tagId | UUID | NOT NULL, FK → `adminCvTags.id` (CASCADE) |
| assignedBy | UUID | NOT NULL, FK → `users.id` |
| createdAt | TIMESTAMP | NOT NULL |

### `adminCvTags`

PostgreSQL: `admin_cv_tags` · 3 columns · 1 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| createdBy | UUID | NOT NULL, FK → `users.id` |
| createdAt | TIMESTAMP | NOT NULL |

**Referenced by:** `adminCvTagAssignments.tagId`

### `analyticsAnnotations`

PostgreSQL: `analytics_annotations` · 5 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| date | TIMESTAMP | NOT NULL |
| description | TEXT | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |

### `analyticsGoals`

PostgreSQL: `analytics_goals` · 7 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| targetValue | REAL | NOT NULL |
| currentValue | REAL | — |
| deadline | TIMESTAMP | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `analyticsSavedSegments`

PostgreSQL: `analytics_saved_segments` · 8 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| filters | JSONB | NOT NULL |
| cachedCount | INTEGER | — |
| cachedAt | TIMESTAMP | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `approvalAuditLog`

PostgreSQL: `approval_audit_log` · 7 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| workflowId | UUID | FK → `approvalWorkflows.id` (SET NULL) |
| actorId | UUID | FK → `users.id` (SET NULL) |
| details | TEXT | — |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

### `approvalDelegations`

PostgreSQL: `approval_delegations` · 9 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| fromUserId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| toUserId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| reason | TEXT | — |
| startDate | TIMESTAMP | NOT NULL |
| endDate | TIMESTAMP | — |
| isActive | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |

### `approvalPolicyRules`

PostgreSQL: `approval_policy_rules` · 9 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| actionConfig | JSONB | — |
| priority | INTEGER | — |
| isActive | BOOLEAN | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `approvalSteps`

PostgreSQL: `approval_steps` · 7 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| workflowId | UUID | NOT NULL, FK → `approvalWorkflows.id` (CASCADE) |
| approverId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| order | INTEGER | — |
| comment | TEXT | — |
| decidedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

### `approvalWorkflowComments`

PostgreSQL: `approval_workflow_comments` · 6 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| workflowId | UUID | NOT NULL, FK → `approvalWorkflows.id` (CASCADE) |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| message | TEXT | NOT NULL |
| isSystemMessage | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |

### `approvalWorkflowTemplates`

PostgreSQL: `approval_workflow_templates` · 8 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| steps | JSONB | NOT NULL |
| isActive | BOOLEAN | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `approvalWorkflows`

PostgreSQL: `approval_workflows` · 8 columns · 2 FK out · 3 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| entityId | UUID | NOT NULL |
| approvers | JSONB | — |
| currentStep | INTEGER | — |
| submittedBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `approvalSteps.workflowId`, `approvalWorkflowComments.workflowId`, `approvalAuditLog.workflowId`

### `autoApplyLog`

PostgreSQL: `auto_apply_log` · 7 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| jobId | UUID | NOT NULL, FK → `jobs.id` (CASCADE) |
| matchResultId | UUID | — |
| score | REAL | — |
| jobSnapshot | JSONB | — |
| appliedAt | TIMESTAMP | NOT NULL |

### `autoSearchPreferences`

PostgreSQL: `auto_search_preferences` · 23 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, UNIQUE, FK → `users.id` (CASCADE) |
| jobTitles | JSONB | — |
| radiusKm | INTEGER | — |
| employmentTypes | JSONB | — |
| industries | JSONB | — |
| subIndustries | JSONB | — |
| salaryMin | INTEGER | — |
| salaryMax | INTEGER | — |
| workArrangements | JSONB | — |
| isActive | BOOLEAN | — |
| lastRunAt | TIMESTAMP | — |
| autoApplyEnabled | BOOLEAN | — |
| autoApplyThreshold | INTEGER | — |
| autoApplyMaxPerRun | INTEGER | — |
| autoApplyRules | JSONB | — |
| autoApplyExcludeCompanies | JSONB | — |
| alertEnabled | BOOLEAN | — |
| alertChannels | JSONB | — |
| alertMinScore | INTEGER | — |
| lastAlertedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `autoSearchResults`

PostgreSQL: `auto_search_results` · 18 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| jobId | UUID | NOT NULL, FK → `jobs.id` (CASCADE) |
| heuristicScore | REAL | — |
| llmScore | REAL | — |
| finalScore | REAL | — |
| explanation | TEXT | — |
| highlightedSkills | JSONB | — |
| skillsJaccard | REAL | — |
| salaryAlignment | REAL | — |
| seniorityAlignment | REAL | — |
| risks | JSONB | — |
| matchedSkills | JSONB | — |
| missingSkills | JSONB | — |
| jobSnapshot | JSONB | — |
| scoreBreakdown | JSONB | — |
| dismissed | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |

### `awards`

PostgreSQL: `awards` · 5 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| candidateId | UUID | NOT NULL, FK → `candidates.id` (CASCADE) |
| year | INTEGER | — |
| description | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

### `biasAlertEvents`

PostgreSQL: `bias_alert_events` · 12 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| ruleId | UUID | FK → `biasAlertRules.id` (CASCADE) |
| auditId | UUID | FK → `aiBiasAudits.id` (SET NULL) |
| metricValue | REAL | — |
| thresholdValue | REAL | — |
| message | TEXT | — |
| acknowledgedBy | UUID | FK → `users.id` (SET NULL) |
| acknowledgedAt | TIMESTAMP | — |
| resolvedAt | TIMESTAMP | — |
| resolutionNotes | TEXT | — |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

### `biasAlertRules`

PostgreSQL: `bias_alert_rules` · 13 columns · 1 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| featureKeys | JSONB | — |
| threshold | REAL | NOT NULL |
| isActive | BOOLEAN | — |
| cooldownMinutes | INTEGER | — |
| lastTriggeredAt | TIMESTAMP | — |
| triggerCount | INTEGER | — |
| escalationPolicy | JSONB | — |
| notificationChannels | JSONB | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `biasAlertEvents.ruleId`

### `biasAuditSchedules`

PostgreSQL: `bias_audit_schedules` · 12 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| featureKeys | JSONB | — |
| nextRunAt | TIMESTAMP | — |
| lastRunAt | TIMESTAMP | — |
| isActive | BOOLEAN | — |
| notifyOnFailure | BOOLEAN | — |
| notifyOnThresholdBreach | BOOLEAN | — |
| thresholdScore | REAL | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `biasBenchmarks`

PostgreSQL: `bias_benchmarks` · 8 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| benchmarkValue | REAL | NOT NULL |
| currentValue | REAL | — |
| gap | REAL | — |
| targetDate | TIMESTAMP | — |
| percentile | REAL | — |
| updatedAt | TIMESTAMP | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |

### `biasCausalAnalysis`

PostgreSQL: `bias_causal_analysis` · 12 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| auditId | UUID | FK → `aiBiasAudits.id` (SET NULL) |
| proxyVariables | JSONB | — |
| featureAttributions | JSONB | — |
| rootCauses | JSONB | — |
| causalGraph | JSONB | — |
| dataSliceFindings | JSONB | — |
| correlationMatrix | JSONB | — |
| overallRiskScore | REAL | — |
| recommendations | JSONB | — |
| technicalDetails | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

### `biasCopilotInsights`

PostgreSQL: `bias_copilot_insights` · 13 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| summary | TEXT | NOT NULL |
| detailedAnalysis | TEXT | — |
| affectedFeatures | JSONB | — |
| affectedDemographics | JSONB | — |
| suggestedActions | JSONB | — |
| evidenceData | JSONB | — |
| confidenceScore | REAL | — |
| relatedAuditIds | JSONB | — |
| riskScore | REAL | — |
| dismissedReason | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| expiresAt | TIMESTAMP | — |

### `biasFairnessPulse`

PostgreSQL: `bias_fairness_pulse` · 11 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| fairnessScore | REAL | NOT NULL |
| decisionCount | INTEGER | — |
| affectedCandidates | INTEGER | — |
| demographicScores | JSONB | — |
| anomalyDetected | BOOLEAN | — |
| anomalyMagnitude | REAL | — |
| driftFromBaseline | REAL | — |
| baselineScore | REAL | — |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

### `biasHumanImpactRecords`

PostgreSQL: `bias_human_impact_records` · 15 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| totalDecisions | INTEGER | — |
| affectedCandidates | INTEGER | — |
| advantagedCandidates | INTEGER | — |
| demographicBreakdown | JSONB | — |
| estimatedLegalExposure | REAL | — |
| estimatedRevenueImpact | REAL | — |
| diversityPipelineImpact | JSONB | — |
| fairnessDebt | REAL | — |
| candidateExperienceImpact | REAL | — |
| retentionRiskScore | REAL | — |
| brandReputationRisk | REAL | — |
| counterfactualOutcomes | JSONB | — |
| remediationSavings | REAL | — |
| createdAt | TIMESTAMP | NOT NULL |

### `biasIntersectionalRecords`

PostgreSQL: `bias_intersectional_records` · 10 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| auditId | UUID | FK → `aiBiasAudits.id` (CASCADE) |
| fairnessScore | REAL | NOT NULL |
| selectionRate | REAL | — |
| adverseImpactRatio | REAL | — |
| sampleSize | INTEGER | — |
| statisticalSignificance | REAL | — |
| confidenceInterval | JSONB | — |
| disparityIndex | REAL | — |
| createdAt | TIMESTAMP | NOT NULL |

### `biasRemediationActions`

PostgreSQL: `bias_remediation_actions` · 14 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| auditId | UUID | FK → `aiBiasAudits.id` (CASCADE) |
| description | TEXT | — |
| assignedTo | UUID | FK → `users.id` (SET NULL) |
| expectedImpact | REAL | — |
| actualImpact | REAL | — |
| dueDate | TIMESTAMP | — |
| completedAt | TIMESTAMP | — |
| verifiedBy | UUID | FK → `users.id` (SET NULL) |
| verifiedAt | TIMESTAMP | — |
| notes | TEXT | — |
| evidence | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `biasReports`

PostgreSQL: `bias_reports` · 15 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| featureKeys | JSONB | — |
| auditIds | JSONB | — |
| content | JSONB | — |
| summary | TEXT | — |
| keyFindings | JSONB | — |
| overallFairnessScore | REAL | — |
| recommendations | JSONB | — |
| generatedBy | UUID | FK → `users.id` (SET NULL) |
| approvedBy | UUID | FK → `users.id` (SET NULL) |
| approvedAt | TIMESTAMP | — |
| publishedAt | TIMESTAMP | — |
| scheduledDelivery | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `biasSimulations`

PostgreSQL: `bias_simulations` · 15 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| baselineAuditId | UUID | FK → `aiBiasAudits.id` (SET NULL) |
| parameters | JSONB | NOT NULL |
| results | JSONB | — |
| baselineFairness | REAL | — |
| simulatedFairness | REAL | — |
| fairnessChange | REAL | — |
| accuracyTradeoff | REAL | — |
| demographicImpacts | JSONB | — |
| riskAssessment | JSONB | — |
| recommendation | TEXT | — |
| appliedAt | TIMESTAMP | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |

### `brandVoiceProfiles`

PostgreSQL: `brand_voice_profiles` · 15 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, UNIQUE, FK → `organizations.id` (CASCADE) |
| formalityLevel | INTEGER | NOT NULL |
| warmthLevel | INTEGER | NOT NULL |
| confidenceLevel | INTEGER | NOT NULL |
| innovationLevel | INTEGER | NOT NULL |
| jargonLevel | INTEGER | NOT NULL |
| humorLevel | INTEGER | NOT NULL |
| vocabulary | JSONB | — |
| writingRules | JSONB | — |
| samplePhrases | JSONB | — |
| contentTypeOverrides | JSONB | — |
| isActive | BOOLEAN | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `campaignRedemptions`

PostgreSQL: `campaign_redemptions` · 7 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| campaignId | UUID | NOT NULL, FK → `campaigns.id` |
| subscriptionId | UUID | FK → `subscriptions.id` |
| holderId | UUID | NOT NULL |
| discountAppliedCents | INTEGER | NOT NULL |
| redeemedAt | TIMESTAMP | NOT NULL |
| convertedAt | TIMESTAMP | — |

### `campaigns`

PostgreSQL: `campaigns` · 13 columns · 1 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| discountValue | INTEGER | NOT NULL |
| applicablePlans | JSONB | NOT NULL |
| maxRedemptions | INTEGER | — |
| perUserLimit | INTEGER | — |
| trialDays | INTEGER | — |
| startsAt | TIMESTAMP | NOT NULL |
| endsAt | TIMESTAMP | — |
| isActive | BOOLEAN | — |
| createdBy | UUID | FK → `users.id` |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `campaignRedemptions.campaignId`

### `candidateExperienceConfig`

PostgreSQL: `candidate_experience_config` · 26 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, UNIQUE, FK → `organizations.id` (CASCADE) |
| requireCoverLetter | BOOLEAN | — |
| requireVideoIntro | BOOLEAN | — |
| maxVideoSeconds | INTEGER | — |
| customQuestions | JSONB | — |
| stageSlaDays | JSONB | — |
| slaWarningEnabled | BOOLEAN | — |
| slaEscalationEnabled | BOOLEAN | — |
| applicationReceivedTemplate | TEXT | — |
| rejectionTemplate | TEXT | — |
| interviewInviteTemplate | TEXT | — |
| offerTemplate | TEXT | — |
| autoRejectionMessage | TEXT | — |
| portalEnabled | BOOLEAN | — |
| showApplicationTimeline | BOOLEAN | — |
| showEstimatedTimeline | BOOLEAN | — |
| allowWithdrawal | BOOLEAN | — |
| allowReschedule | BOOLEAN | — |
| npsEnabled | BOOLEAN | — |
| npsReminderDays | INTEGER | — |
| communicationChannels | JSONB | — |
| responseTimeGoalHours | INTEGER | — |
| autoAcknowledge | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `candidateExperienceSurveys`

PostgreSQL: `candidate_experience_surveys` · 30 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| applicationId | UUID | FK → `jobApplications.id` (CASCADE) |
| userId | UUID | FK → `users.id` (CASCADE) |
| overallRating | INTEGER | — |
| processRating | INTEGER | — |
| communicationRating | INTEGER | — |
| fairnessRating | INTEGER | — |
| timelinessRating | INTEGER | — |
| transparencyRating | INTEGER | — |
| interviewerProfessionalismRating | INTEGER | — |
| npsScore | INTEGER | — |
| wouldRecommend | BOOLEAN | — |
| feedback | TEXT | — |
| suggestions | TEXT | — |
| bestPart | TEXT | — |
| worstPart | TEXT | — |
| interviewStages | JSONB | — |
| totalDurationDays | INTEGER | — |
| numberOfInterviews | INTEGER | — |
| flagDetails | TEXT | — |
| isFlagged | BOOLEAN | — |
| isAnonymous | BOOLEAN | — |
| isSharedToCommunity | BOOLEAN | — |
| categoryTags | JSONB | — |
| aiAnalysis | JSONB | — |
| aiCoachAdvice | JSONB | — |
| responseTimeMinutes | INTEGER | — |
| expiresAt | TIMESTAMP | — |
| completedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

### `candidateSourcingProfiles`

PostgreSQL: `candidate_sourcing_profiles` · 8 columns · 1 FK out · 6 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| skills | JSONB | — |
| experience | JSONB | — |
| sourceUrl | TEXT | — |
| matchScore | REAL | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `sourcingCampaignCandidates.candidateProfileId`, `aiSourcingSequenceEnrollments.candidateProfileId`, `aiSourcingPassiveSignals.candidateProfileId`, `aiSourcingResumeUploads.matchedProfileId`, `aiSourcingCandidateDna.candidateProfileId`, `aiSourcingCraftedMessages.candidateProfileId`

### `candidateTemperatures`

PostgreSQL: `candidate_temperatures` · 12 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| candidateId | UUID | FK → `candidates.id` (CASCADE) |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| matchScore | INTEGER | — |
| daysDormant | INTEGER | — |
| lastActivityDescription | TEXT | — |
| lastActivityDate | TIMESTAMP | — |
| reEngagementAttempts | INTEGER | — |
| lastOutreachDate | TIMESTAMP | — |
| notes | TEXT | — |
| calculatedAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `certifications`

PostgreSQL: `certifications` · 9 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| candidateId | UUID | NOT NULL, FK → `candidates.id` (CASCADE) |
| year | INTEGER | — |
| issueDate | TIMESTAMP | — |
| expiryDate | TIMESTAMP | — |
| credentialUrl | TEXT | — |
| isPublic | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `channelAdapterConfigs`

PostgreSQL: `channel_adapter_configs` · 10 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| isEnabled | BOOLEAN | — |
| credentials | JSONB | — |
| webhookSecret | TEXT | — |
| webhookUrl | TEXT | — |
| lastHealthCheckAt | TIMESTAMP | — |
| config | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `channelEventRoutes`

PostgreSQL: `channel_event_routes` · 15 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| conditions | JSONB | — |
| pipeline | JSONB | NOT NULL |
| isActive | BOOLEAN | — |
| priority | INTEGER | — |
| rateLimitPerHour | INTEGER | — |
| executionCount | INTEGER | — |
| lastExecutedAt | TIMESTAMP | — |
| lastErrorAt | TIMESTAMP | — |
| lastError | TEXT | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `channelEvents`

PostgreSQL: `channel_events` · 12 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (SET NULL) |
| userId | UUID | FK → `users.id` (SET NULL) |
| payload | JSONB | NOT NULL |
| metadata | JSONB | NOT NULL |
| ppiRedacted | BOOLEAN | — |
| routesMatched | INTEGER | — |
| processedAt | TIMESTAMP | — |
| processingDurationMs | INTEGER | — |
| errorMessage | TEXT | — |
| expiresAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

### `collaborativeHiringVotes`

PostgreSQL: `collaborative_hiring_votes` · 9 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| applicationId | UUID | NOT NULL, FK → `jobApplications.id` (CASCADE) |
| voterId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| confidence | INTEGER | — |
| reasoning | TEXT | — |
| isBlind | BOOLEAN | — |
| criteria | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `companyResponseStats`

PostgreSQL: `company_response_stats` · 5 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| medianResponseDays | INTEGER | — |
| responseRate | REAL | — |
| totalApplications | INTEGER | — |
| updatedAt | TIMESTAMP | NOT NULL |

### `competitorBenchmarks`

PostgreSQL: `competitor_benchmarks` · 10 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| priceCents | INTEGER | — |
| featureCount | INTEGER | — |
| features | JSONB | — |
| sourceUrl | TEXT | — |
| notes | TEXT | — |
| lastVerified | TIMESTAMP | — |
| createdBy | UUID | FK → `users.id` |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `complianceReports`

PostgreSQL: `compliance_reports` · 8 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| data | JSONB | — |
| generatedFile | TEXT | — |
| submittedAt | TIMESTAMP | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `complianceSettings`

PostgreSQL: `compliance_settings` · 8 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, UNIQUE, FK → `organizations.id` (CASCADE) |
| eeDataCapture | BOOLEAN | — |
| consentText | TEXT | — |
| dataRetentionDays | INTEGER | — |
| popiaCompliant | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `contractWorkers`

PostgreSQL: `contract_workers` · 8 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| startDate | TIMESTAMP | — |
| endDate | TIMESTAMP | — |
| hourlyRate | INTEGER | — |
| shifts | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `customReports`

PostgreSQL: `custom_reports` · 10 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| metrics | JSONB | — |
| filters | JSONB | — |
| schedule | JSONB | — |
| lastGeneratedAt | TIMESTAMP | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `customerRevenueDna`

PostgreSQL: `customer_revenue_dna` · 22 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| overallScore | INTEGER | NOT NULL |
| ltvScore | INTEGER | — |
| paymentReliability | INTEGER | — |
| engagementScore | INTEGER | — |
| expansionProbability | INTEGER | — |
| churnRisk | INTEGER | — |
| currentMrrCents | INTEGER | — |
| lifetimeValueCents | INTEGER | — |
| daysSinceSignup | INTEGER | — |
| daysSinceLastLogin | INTEGER | — |
| failedPaymentCount | INTEGER | — |
| overdueInvoiceCount | INTEGER | — |
| featureAdoptionPct | INTEGER | — |
| supportTicketCount | INTEGER | — |
| upgradeHistory | JSONB | — |
| riskFactors | JSONB | — |
| opportunities | JSONB | — |
| lastCalculatedAt | TIMESTAMP | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `disputeEvidence`

PostgreSQL: `dispute_evidence` · 6 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| disputeId | UUID | NOT NULL, FK → `billingDisputes.id` (CASCADE) |
| content | TEXT | — |
| fileUrl | TEXT | — |
| uploadedBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |

### `education`

PostgreSQL: `education` · 4 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| candidateId | UUID | NOT NULL, FK → `candidates.id` (CASCADE) |
| gradDate | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

### `entitlementDrafts`

PostgreSQL: `entitlement_drafts` · 9 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| changes | JSONB | NOT NULL |
| createdBy | UUID | — |
| reviewedBy | UUID | — |
| reviewNote | TEXT | — |
| appliedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `entitlementSnapshots`

PostgreSQL: `entitlement_snapshots` · 4 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| snapshot | JSONB | NOT NULL |
| createdBy | UUID | — |
| createdAt | TIMESTAMP | NOT NULL |

### `experiences`

PostgreSQL: `experiences` · 7 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| candidateId | UUID | NOT NULL, FK → `candidates.id` (CASCADE) |
| startDate | TIMESTAMP | — |
| endDate | TIMESTAMP | — |
| isCurrent | BOOLEAN | — |
| bullets | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

### `experimentEvents`

PostgreSQL: `experiment_events` · 6 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| experimentId | UUID | NOT NULL, FK → `pricingExperiments.id` (CASCADE) |
| variantId | UUID | NOT NULL, FK → `pricingVariants.id` (CASCADE) |
| userId | UUID | FK → `users.id` (SET NULL) |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

### `gatewayHealthLogs`

PostgreSQL: `gateway_health_logs` · 7 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| gatewayId | UUID | NOT NULL, FK → `paymentGateways.id` (CASCADE) |
| responseTimeMs | INTEGER | — |
| errorMessage | TEXT | — |
| transactionsProcessed | INTEGER | — |
| transactionsFailed | INTEGER | — |
| checkedAt | TIMESTAMP | NOT NULL |

### `gatewayRoutingRules`

PostgreSQL: `gateway_routing_rules` · 7 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| gatewayId | UUID | NOT NULL, FK → `paymentGateways.id` (CASCADE) |
| priority | INTEGER | — |
| isActive | BOOLEAN | — |
| description | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `healthPulseReports`

PostgreSQL: `health_pulse_reports` · 8 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| reportDate | TIMESTAMP | NOT NULL |
| overallScore | REAL | — |
| signals | JSONB | — |
| aiNarrative | TEXT | — |
| recommendations | JSONB | — |
| monitorRunIds | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

### `hiringManagerReviews`

PostgreSQL: `hiring_manager_reviews` · 9 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| applicationId | UUID | NOT NULL, FK → `jobApplications.id` (CASCADE) |
| managerId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| rating | INTEGER | — |
| strengths | TEXT | — |
| concerns | TEXT | — |
| notes | TEXT | — |
| submittedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

### `hrisIntegrations`

PostgreSQL: `hris_integrations` · 6 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| config | JSONB | — |
| lastSyncAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `internalJobBoard`

PostgreSQL: `internal_job_board` · 7 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| jobId | UUID | NOT NULL, FK → `jobs.id` (CASCADE) |
| eligibilityCriteria | JSONB | — |
| isActive | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `jobAggregatorConfigs`

PostgreSQL: `job_aggregator_configs` · 15 columns · 0 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| isActive | BOOLEAN | — |
| apiKey | TEXT | — |
| apiSecret | TEXT | — |
| searchKeywords | JSONB | — |
| searchLocations | JSONB | — |
| maxResultsPerSync | INTEGER | — |
| autoSyncEnabled | BOOLEAN | — |
| autoSyncIntervalMinutes | INTEGER | — |
| defaultExpiryDays | INTEGER | — |
| lastSyncAt | TIMESTAMP | — |
| lastSyncJobCount | INTEGER | — |
| lastSyncError | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `jobAggregatorSyncLogs.configId`

### `jobAggregatorSyncLogs`

PostgreSQL: `job_aggregator_sync_logs` · 9 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| configId | UUID | NOT NULL, FK → `jobAggregatorConfigs.id` (CASCADE) |
| jobsFetched | INTEGER | — |
| jobsImported | INTEGER | — |
| jobsSkippedDuplicate | INTEGER | — |
| jobsSkippedError | INTEGER | — |
| errorMessage | TEXT | — |
| startedAt | TIMESTAMP | NOT NULL |
| completedAt | TIMESTAMP | — |

### `languageSettings`

PostgreSQL: `language_settings` · 5 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| settingValue | JSONB | NOT NULL |
| description | TEXT | — |
| updatedBy | UUID | FK → `users.id` |
| updatedAt | TIMESTAMP | NOT NULL |

### `languageStyleGuides`

PostgreSQL: `language_style_guides` · 12 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| toneDescription | TEXT | — |
| forbiddenTerms | JSONB | — |
| preferredTerms | JSONB | — |
| grammarRules | JSONB | — |
| maxCharacterRatio | REAL | — |
| punctuationRules | TEXT | — |
| examples | JSONB | — |
| isPublished | BOOLEAN | — |
| createdBy | UUID | FK → `users.id` |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `languageUsageEvents`

PostgreSQL: `language_usage_events` · 4 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | FK → `users.id` |
| userAgent | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

### `managerApprovalSteps`

PostgreSQL: `manager_approval_steps` · 10 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| workflowId | UUID | NOT NULL, FK → `managerApprovalWorkflows.id` (CASCADE) |
| approverId | UUID | NOT NULL, FK → `users.id` |
| stepOrder | INTEGER | NOT NULL |
| comments | TEXT | — |
| conditions | JSONB | — |
| decidedAt | TIMESTAMP | — |
| dueDate | TIMESTAMP | — |
| reminderSent | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |

### `managerApprovalWorkflows`

PostgreSQL: `manager_approval_workflows` · 11 columns · 2 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| createdBy | UUID | NOT NULL, FK → `users.id` |
| referenceId | UUID | — |
| currentStepOrder | INTEGER | — |
| totalSteps | INTEGER | — |
| metadata | JSONB | — |
| dueDate | TIMESTAMP | — |
| completedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `managerApprovalSteps.workflowId`

### `managerCandidateComparisons`

PostgreSQL: `manager_candidate_comparisons` · 12 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| createdBy | UUID | NOT NULL, FK → `users.id` |
| jobId | UUID | FK → `jobs.id` |
| candidateIds | JSONB | NOT NULL |
| criteria | JSONB | — |
| scores | JSONB | — |
| aiRecommendation | JSONB | — |
| notes | TEXT | — |
| sharedWith | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `managerCandidateNotes`

PostgreSQL: `manager_candidate_notes` · 7 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| applicationId | UUID | NOT NULL, FK → `jobApplications.id` (CASCADE) |
| managerId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| content | TEXT | NOT NULL |
| isPrivate | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `managerCoachingInsights`

PostgreSQL: `manager_coaching_insights` · 8 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| recruiterId | UUID | NOT NULL, FK → `users.id` |
| description | TEXT | NOT NULL |
| dataPoints | JSONB | — |
| actionItems | JSONB | — |
| isAcknowledged | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |

### `managerDecisionRoomParticipants`

PostgreSQL: `manager_decision_room_participants` · 8 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| roomId | UUID | NOT NULL, FK → `managerDecisionRooms.id` (CASCADE) |
| userId | UUID | NOT NULL, FK → `users.id` |
| hasVoted | BOOLEAN | — |
| votes | JSONB | — |
| joinedAt | TIMESTAMP | — |
| leftAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

### `managerDecisionRooms`

PostgreSQL: `manager_decision_rooms` · 15 columns · 3 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| createdBy | UUID | NOT NULL, FK → `users.id` |
| description | TEXT | — |
| scheduledAt | TIMESTAMP | — |
| startedAt | TIMESTAMP | — |
| endedAt | TIMESTAMP | — |
| jobId | UUID | FK → `jobs.id` |
| candidateIds | JSONB | — |
| agenda | JSONB | — |
| decisions | JSONB | — |
| summary | TEXT | — |
| isBlindReview | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `managerDecisionRoomParticipants.roomId`

### `managerDeiSnapshots`

PostgreSQL: `manager_dei_snapshots` · 10 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| snapshotDate | TIMESTAMP | NOT NULL |
| pipelineDiversity | JSONB | — |
| sourcingDiversity | JSONB | — |
| hiringOutcomes | JSONB | — |
| biasAlerts | JSONB | — |
| equityGaps | JSONB | — |
| overallDiversityScore | REAL | — |
| createdAt | TIMESTAMP | NOT NULL |

### `managerDelegationLogs`

PostgreSQL: `manager_delegation_logs` · 11 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| delegatorId | UUID | NOT NULL, FK → `users.id` |
| delegateId | UUID | NOT NULL, FK → `users.id` |
| scopeReferenceId | UUID | — |
| reason | TEXT | — |
| startDate | TIMESTAMP | NOT NULL |
| endDate | TIMESTAMP | — |
| actionsPerformed | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |
| revokedAt | TIMESTAMP | — |

### `managerInterviewCalibrations`

PostgreSQL: `manager_interview_calibrations` · 15 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| interviewerId | UUID | NOT NULL, FK → `users.id` |
| totalInterviews | INTEGER | — |
| avgRatingGiven | REAL | — |
| ratingStdDev | REAL | — |
| passRate | REAL | — |
| correlationWithOutcome | REAL | — |
| biasIndicators | JSONB | — |
| calibrationScore | REAL | — |
| strengths | JSONB | — |
| improvementAreas | JSONB | — |
| lastCalibratedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `managerOfferScenarios`

PostgreSQL: `manager_offer_scenarios` · 17 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| createdBy | UUID | NOT NULL, FK → `users.id` |
| candidateId | UUID | — |
| jobId | UUID | FK → `jobs.id` |
| baseSalary | INTEGER | NOT NULL |
| bonus | INTEGER | — |
| equity | INTEGER | — |
| signingBonus | INTEGER | — |
| benefits | JSONB | — |
| totalComp | INTEGER | — |
| compRatio | REAL | — |
| acceptanceProbability | REAL | — |
| competitorBenchmark | JSONB | — |
| aiInsights | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `managerPipelineRisks`

PostgreSQL: `manager_pipeline_risks` · 10 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| entityId | UUID | — |
| description | TEXT | NOT NULL |
| impactedCount | INTEGER | — |
| suggestedAction | TEXT | — |
| isResolved | BOOLEAN | — |
| resolvedAt | TIMESTAMP | — |
| resolvedBy | UUID | FK → `users.id` |
| createdAt | TIMESTAMP | NOT NULL |

### `managerPredictiveScores`

PostgreSQL: `manager_predictive_scores` · 13 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| applicationId | UUID | — |
| dropoffRisk | REAL | — |
| offerAcceptanceLikelihood | REAL | — |
| predictedPerformance | REAL | — |
| retentionProbability | REAL | — |
| timeToDecision | INTEGER | — |
| optimalOfferWindow | JSONB | — |
| riskFactors | JSONB | — |
| signals | JSONB | — |
| lastAnalyzedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

### `managerPreferences`

PostgreSQL: `manager_preferences` · 12 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| managerId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| autoAssignRules | JSONB | — |
| delegateTo | UUID | FK → `users.id` (SET NULL) |
| scoringCriteria | JSONB | — |
| notifyNewCandidates | BOOLEAN | — |
| notifyReviewReminders | BOOLEAN | — |
| notifyInterviewUpdates | BOOLEAN | — |
| notifyTeamActivity | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `managerShortlists`

PostgreSQL: `manager_shortlists` · 8 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| managerId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| description | TEXT | — |
| jobId | UUID | FK → `jobs.id` (SET NULL) |
| candidateIds | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `managerSlaConfigs`

PostgreSQL: `manager_sla_configs` · 12 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| managerId | UUID | NOT NULL, FK → `users.id` |
| targetDays | INTEGER | NOT NULL |
| warningThresholdDays | INTEGER | NOT NULL |
| isActive | BOOLEAN | — |
| escalationRules | JSONB | — |
| currentAvgDays | REAL | — |
| complianceRate | REAL | — |
| breachCount | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `managerTalentBenchmarks`

PostgreSQL: `manager_talent_benchmarks` · 12 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| managerId | UUID | NOT NULL, FK → `users.id` |
| marketMedianSalary | INTEGER | — |
| internalMedianSalary | INTEGER | — |
| salaryRange | JSONB | — |
| supplyDemandRatio | REAL | — |
| avgTimeToFillMarket | INTEGER | — |
| skillsInDemand | JSONB | — |
| recommendations | JSONB | — |
| lastUpdated | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

### `managerTeamActivities`

PostgreSQL: `manager_team_activities` · 8 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| userId | UUID | NOT NULL, FK → `users.id` |
| entityId | UUID | — |
| description | TEXT | — |
| metadata | JSONB | — |
| isRead | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |

### `managerTeamGoals`

PostgreSQL: `manager_team_goals` · 12 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| managerId | UUID | NOT NULL, FK → `users.id` |
| description | TEXT | — |
| targetValue | INTEGER | NOT NULL |
| currentValue | INTEGER | — |
| startDate | TIMESTAMP | NOT NULL |
| endDate | TIMESTAMP | NOT NULL |
| assignedTo | JSONB | — |
| milestones | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `managerWorkforcePlans`

PostgreSQL: `manager_workforce_plans` · 14 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| managerId | UUID | NOT NULL, FK → `users.id` |
| plannedHeadcount | INTEGER | — |
| currentHeadcount | INTEGER | — |
| approvedHeadcount | INTEGER | — |
| totalBudget | INTEGER | — |
| spentBudget | INTEGER | — |
| costPerHire | INTEGER | — |
| avgTimeToFill | INTEGER | — |
| roles | JSONB | — |
| notes | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `performanceRecords`

PostgreSQL: `performance_records` · 8 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| overallRating | REAL | — |
| goals | JSONB | — |
| feedback | JSONB | — |
| sourceHire | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `platformHealthMetrics`

PostgreSQL: `platform_health_metrics` · 4 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| value | REAL | NOT NULL |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

### `platformLanguages`

PostgreSQL: `platform_languages` · 10 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| isEnabled | BOOLEAN | — |
| isDefault | BOOLEAN | — |
| translationProgress | INTEGER | — |
| totalKeys | INTEGER | — |
| translatedKeys | INTEGER | — |
| approvedKeys | INTEGER | — |
| sortOrder | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `predictiveAnalytics`

PostgreSQL: `predictive_analytics` · 8 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| metricValue | REAL | — |
| confidence | REAL | — |
| prediction | JSONB | — |
| periodStart | TIMESTAMP | — |
| periodEnd | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

### `projects`

PostgreSQL: `projects` · 6 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| candidateId | UUID | NOT NULL, FK → `candidates.id` (CASCADE) |
| what | TEXT | — |
| impact | TEXT | — |
| link | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

### `reEngagementActivityLog`

PostgreSQL: `re_engagement_activity_log` · 10 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| recruiterId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| candidateId | UUID | — |
| description | TEXT | — |
| campaignId | UUID | — |
| sequenceId | UUID | — |
| automationRuleId | UUID | — |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

### `reEngagementAutomationRules`

PostgreSQL: `re_engagement_automation_rules` · 10 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| recruiterId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| triggerDays | INTEGER | — |
| templateId | UUID | — |
| isActive | BOOLEAN | — |
| candidatesMatched | INTEGER | — |
| lastTriggered | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `reEngagementCampaigns`

PostgreSQL: `re_engagement_campaigns` · 8 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| recruiterId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| targetCriteria | JSONB | — |
| messageTemplate | TEXT | — |
| candidateCount | INTEGER | — |
| responseCount | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `reEngagementSequenceSteps`

PostgreSQL: `re_engagement_sequence_steps` · 8 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| sequenceId | UUID | NOT NULL, FK → `reEngagementSequences.id` (CASCADE) |
| stepOrder | INTEGER | NOT NULL |
| delayDays | INTEGER | — |
| templateId | UUID | — |
| completedCount | INTEGER | — |
| respondedCount | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |

### `reEngagementSequences`

PostgreSQL: `re_engagement_sequences` · 9 columns · 2 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| recruiterId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| totalSteps | INTEGER | — |
| activeCandidates | INTEGER | — |
| completionRate | INTEGER | — |
| responseRate | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `reEngagementSequenceSteps.sequenceId`

### `reEngagementTemplates`

PostgreSQL: `re_engagement_templates` · 9 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| recruiterId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| body | TEXT | NOT NULL |
| responseRate | INTEGER | — |
| useCount | INTEGER | — |
| isGlobal | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `recruiterAchievements`

PostgreSQL: `recruiter_achievements` · 6 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL |
| recruiterId | UUID | NOT NULL |
| description | TEXT | — |
| earnedAt | TIMESTAMP | NOT NULL |
| metadata | JSONB | — |

### `recruitmentCampaigns`

PostgreSQL: `recruitment_campaigns` · 14 columns · 2 FK out · 3 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| targetAudience | JSONB | — |
| content | JSONB | — |
| budget | INTEGER | — |
| spent | INTEGER | — |
| impressions | INTEGER | — |
| clicks | INTEGER | — |
| applications | INTEGER | — |
| startDate | TIMESTAMP | — |
| endDate | TIMESTAMP | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `marketingSocialPosts.campaignId`, `marketingAbTests.campaignId`, `marketingAutopilotRecs.campaignId`

### `recruitmentSequences`

PostgreSQL: `recruitment_sequences` · 14 columns · 2 FK out · 3 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| triggerConditions | JSONB | — |
| exitConditions | JSONB | — |
| settings | JSONB | — |
| tags | JSONB | — |
| totalEnrolled | INTEGER | — |
| totalCompleted | INTEGER | — |
| totalReplied | INTEGER | — |
| totalBounced | INTEGER | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `sequenceSteps.sequenceId`, `sequenceEnrollments.sequenceId`, `sequenceEvents.sequenceId`

### `rejectionAnalyses`

PostgreSQL: `rejection_analyses` · 6 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| applicationId | UUID | NOT NULL, FK → `jobApplications.id` (CASCADE) |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| analysis | JSONB | — |
| bounceBackJobIds | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

### `salaryBands`

PostgreSQL: `salary_bands` · 5 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| minSalary | INTEGER | — |
| maxSalary | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |

### `savedQuestionSets`

PostgreSQL: `saved_question_sets` · 11 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| skills | JSONB | — |
| questions | JSONB | — |
| tags | JSONB | — |
| generationParams | JSONB | — |
| isFavorite | BOOLEAN | — |
| jobId | UUID | FK → `jobs.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `savedSearches`

PostgreSQL: `saved_searches` · 12 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| criteria | JSONB | NOT NULL |
| notes | TEXT | — |
| isActive | BOOLEAN | NOT NULL |
| alertEnabled | BOOLEAN | NOT NULL |
| lastRunAt | TIMESTAMP | — |
| runCount | INTEGER | NOT NULL |
| lastMatchCount | INTEGER | — |
| isPinned | BOOLEAN | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `scheduledMessages`

PostgreSQL: `scheduled_messages` · 8 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| conversationId | UUID | NOT NULL, FK → `conversations.id` (CASCADE) |
| senderId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| body | TEXT | NOT NULL |
| scheduledFor | TIMESTAMP | NOT NULL |
| sentAt | TIMESTAMP | — |
| failureReason | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

### `sequenceEnrollments`

PostgreSQL: `sequence_enrollments` · 19 columns · 3 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| sequenceId | UUID | NOT NULL, FK → `recruitmentSequences.id` (CASCADE) |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| jobId | UUID | — |
| currentStepId | UUID | — |
| currentStepOrder | INTEGER | — |
| nextActionAt | TIMESTAMP | — |
| enrolledAt | TIMESTAMP | NOT NULL |
| completedAt | TIMESTAMP | — |
| lastContactedAt | TIMESTAMP | — |
| totalStepsCompleted | INTEGER | — |
| totalOpens | INTEGER | — |
| totalClicks | INTEGER | — |
| hasReplied | BOOLEAN | — |
| repliedAt | TIMESTAMP | — |
| metadata | JSONB | — |
| enrolledBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `sequenceEvents.enrollmentId`

### `sequenceEvents`

PostgreSQL: `sequence_events` · 7 columns · 4 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| sequenceId | UUID | NOT NULL, FK → `recruitmentSequences.id` (CASCADE) |
| enrollmentId | UUID | FK → `sequenceEnrollments.id` (CASCADE) |
| stepId | UUID | FK → `sequenceSteps.id` (SET NULL) |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

### `sequenceSteps`

PostgreSQL: `sequence_steps` · 20 columns · 1 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| sequenceId | UUID | NOT NULL, FK → `recruitmentSequences.id` (CASCADE) |
| stepOrder | INTEGER | NOT NULL |
| body | TEXT | — |
| bodyHtml | TEXT | — |
| delayDays | INTEGER | — |
| delayHours | INTEGER | — |
| delayMinutes | INTEGER | — |
| conditions | JSONB | — |
| abVariant | JSONB | — |
| personalization | JSONB | — |
| taskDescription | TEXT | — |
| isActive | BOOLEAN | — |
| totalSent | INTEGER | — |
| totalOpened | INTEGER | — |
| totalClicked | INTEGER | — |
| totalReplied | INTEGER | — |
| totalBounced | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `sequenceEvents.stepId`

### `sequenceTemplateLibrary`

PostgreSQL: `sequence_template_library` · 10 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| isGlobal | BOOLEAN | — |
| steps | JSONB | — |
| tags | JSONB | — |
| usageCount | INTEGER | — |
| avgReplyRate | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `sourcingAnalyticsSnapshots`

PostgreSQL: `sourcing_analytics_snapshots` · 8 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| totalSourced | INTEGER | — |
| bySource | JSONB | — |
| byStatus | JSONB | — |
| conversionRate | REAL | — |
| avgResponseTimeHours | REAL | — |
| createdAt | TIMESTAMP | NOT NULL |

### `sourcingCampaignCandidates`

PostgreSQL: `sourcing_campaign_candidates` · 7 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| campaignId | UUID | NOT NULL, FK → `sourcingCampaigns.id` (CASCADE) |
| candidateProfileId | UUID | FK → `candidateSourcingProfiles.id` (CASCADE) |
| contactedAt | TIMESTAMP | — |
| respondedAt | TIMESTAMP | — |
| notes | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

### `sourcingCampaigns`

PostgreSQL: `sourcing_campaigns` · 9 columns · 2 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| targetCriteria | JSONB | — |
| emailTemplateId | UUID | — |
| stats | JSONB | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `sourcingCampaignCandidates.campaignId`

### `subscribers`

PostgreSQL: `subscribers` · 2 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| createdAt | TIMESTAMP | NOT NULL |

### `successionPlans`

PostgreSQL: `succession_plans` · 8 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| candidates | JSONB | — |
| readinessLevels | JSONB | — |
| developmentPlans | JSONB | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `surveyExperienceGoals`

PostgreSQL: `survey_experience_goals` · 7 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| goalDescription | TEXT | — |
| currentValue | REAL | — |
| targetValue | REAL | — |
| createdAt | TIMESTAMP | NOT NULL |
| completedAt | TIMESTAMP | — |

### `teamPerformanceConfig`

PostgreSQL: `team_performance_config` · 27 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, UNIQUE, FK → `organizations.id` (CASCADE) |
| leaderboardEnabled | BOOLEAN | — |
| leaderboardMetrics | JSONB | — |
| gamificationEnabled | BOOLEAN | — |
| badgesEnabled | BOOLEAN | — |
| streaksEnabled | BOOLEAN | — |
| pointsEnabled | BOOLEAN | — |
| pointsPerCall | INTEGER | — |
| pointsPerEmail | INTEGER | — |
| pointsPerScreening | INTEGER | — |
| pointsPerInterview | INTEGER | — |
| pointsPerPlacement | INTEGER | — |
| pointsPerOfferAccepted | INTEGER | — |
| defaultCallsTarget | INTEGER | — |
| defaultEmailsTarget | INTEGER | — |
| defaultSourcingTarget | INTEGER | — |
| defaultScreeningTarget | INTEGER | — |
| defaultSubmissionsTarget | INTEGER | — |
| defaultInterviewsTarget | INTEGER | — |
| defaultOffersTarget | INTEGER | — |
| defaultPlacementsTarget | INTEGER | — |
| defaultRevenueTarget | INTEGER | — |
| defaultTimeToFillDays | INTEGER | — |
| achievementDefinitions | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `templateFavorites`

PostgreSQL: `template_favorites` · 5 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL |
| templateId | UUID | NOT NULL |
| notes | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

### `templateRatings`

PostgreSQL: `template_ratings` · 6 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL |
| templateId | UUID | NOT NULL |
| rating | INTEGER | NOT NULL |
| review | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

### `templateUsageLogs`

PostgreSQL: `template_usage_logs` · 5 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL |
| templateId | UUID | NOT NULL |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

### `translationAssignments`

PostgreSQL: `translation_assignments` · 10 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| contributorId | UUID | NOT NULL, FK → `translationContributors.id` (CASCADE) |
| namespaceId | UUID | FK → `translationNamespaces.id` |
| totalKeys | INTEGER | — |
| completedKeys | INTEGER | — |
| dueDate | TIMESTAMP | — |
| assignedBy | UUID | FK → `users.id` |
| notes | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `translationBatchJobs`

PostgreSQL: `translation_batch_jobs` · 10 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| namespaceId | UUID | FK → `translationNamespaces.id` |
| totalKeys | INTEGER | — |
| completedKeys | INTEGER | — |
| failedKeys | INTEGER | — |
| startedAt | TIMESTAMP | — |
| completedAt | TIMESTAMP | — |
| errorMessage | TEXT | — |
| createdBy | UUID | FK → `users.id` |
| createdAt | TIMESTAMP | NOT NULL |

### `translationComplianceAudits`

PostgreSQL: `translation_compliance_audits` · 10 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| totalChecks | INTEGER | — |
| passedChecks | INTEGER | — |
| warningChecks | INTEGER | — |
| failedChecks | INTEGER | — |
| findings | JSONB | — |
| complianceScore | REAL | — |
| runBy | UUID | FK → `users.id` |
| createdAt | TIMESTAMP | NOT NULL |
| completedAt | TIMESTAMP | — |

### `translationContributors`

PostgreSQL: `translation_contributors` · 13 columns · 1 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | FK → `users.id` |
| languageCodes | JSONB | — |
| totalTranslations | INTEGER | — |
| approvedTranslations | INTEGER | — |
| rejectedTranslations | INTEGER | — |
| qualityScore | REAL | — |
| specializations | JSONB | — |
| bio | TEXT | — |
| isNativeSpeaker | BOOLEAN | — |
| lastActiveAt | TIMESTAMP | — |
| joinedAt | TIMESTAMP | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |

**Referenced by:** `translationAssignments.contributorId`

### `translationGlossary`

PostgreSQL: `translation_glossary` · 6 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| definition | TEXT | — |
| isApproved | BOOLEAN | — |
| createdBy | UUID | FK → `users.id` |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `translationImportExports`

PostgreSQL: `translation_import_exports` · 12 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| fileSize | INTEGER | — |
| totalKeys | INTEGER | — |
| processedKeys | INTEGER | — |
| newKeys | INTEGER | — |
| updatedKeys | INTEGER | — |
| skippedKeys | INTEGER | — |
| errorKeys | INTEGER | — |
| errorMessage | TEXT | — |
| createdBy | UUID | FK → `users.id` |
| createdAt | TIMESTAMP | NOT NULL |
| completedAt | TIMESTAMP | — |

### `translationKeys`

PostgreSQL: `translation_keys` · 10 columns · 1 FK out · 2 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| namespaceId | UUID | FK → `translationNamespaces.id` |
| defaultValue | TEXT | NOT NULL |
| context | TEXT | — |
| maxLength | INTEGER | — |
| isPlural | BOOLEAN | — |
| tags | JSONB | — |
| screenshotUrl | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `translationValues.keyId`, `aiTranslationSessions.keyId`

### `translationNamespaces`

PostgreSQL: `translation_namespaces` · 4 columns · 0 FK out · 3 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| keyCount | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |

**Referenced by:** `translationKeys.namespaceId`, `translationBatchJobs.namespaceId`, `translationAssignments.namespaceId`

### `translationQualityIssues`

PostgreSQL: `translation_quality_issues` · 8 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| translationValueId | UUID | FK → `translationValues.id` (CASCADE) |
| description | TEXT | — |
| suggestedFix | TEXT | — |
| reportedBy | UUID | FK → `users.id` |
| resolvedBy | UUID | FK → `users.id` |
| resolvedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

### `translationValues`

PostgreSQL: `translation_values` · 11 columns · 3 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| keyId | UUID | NOT NULL, FK → `translationKeys.id` (CASCADE) |
| value | TEXT | NOT NULL |
| translatedBy | UUID | FK → `users.id` |
| reviewedBy | UUID | FK → `users.id` |
| isAiGenerated | BOOLEAN | — |
| aiConfidence | REAL | — |
| version | INTEGER | — |
| reviewNotes | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `translationQualityIssues.translationValueId`

### `vendorManagement`

PostgreSQL: `vendor_management` · 9 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| feeStructure | JSONB | — |
| sla | JSONB | — |
| performanceMetrics | JSONB | — |
| startDate | TIMESTAMP | — |
| endDate | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

### `wellbeingCheckins`

PostgreSQL: `wellbeing_checkins` · 6 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| applicationCountThatWeek | INTEGER | — |
| interviewCountThatWeek | INTEGER | — |
| note | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

### `wikiLinks`

PostgreSQL: `wiki_links` · 6 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| sourcePageId | UUID | NOT NULL, FK → `wikiPages.id` (CASCADE) |
| targetPageId | UUID | NOT NULL, FK → `wikiPages.id` (CASCADE) |
| context | TEXT | — |
| sourcePageIdIdx | INDEX | — |
| targetPageIdIdx | INDEX | — |

### `wikiLog`

PostgreSQL: `wiki_log` · 7 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| wikiId | UUID | NOT NULL, FK → `wikiSpaces.id` (CASCADE) |
| description | TEXT | NOT NULL |
| details | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| wikiIdIdx | INDEX | — |
| wikiIdOperationIdx | INDEX | — |

### `wikiPages`

PostgreSQL: `wiki_pages` · 12 columns · 2 FK out · 2 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| wikiId | UUID | NOT NULL, FK → `wikiSpaces.id` (CASCADE) |
| content | TEXT | NOT NULL |
| frontmatter | JSONB | — |
| sourceId | UUID | FK → `wikiSources.id` |
| inboundLinkCount | INTEGER | NOT NULL |
| outboundLinkCount | INTEGER | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |
| wikiSlugIdx | UNIQUEINDEX | — |
| wikiIdIdx | INDEX | — |
| pageTypeIdx | INDEX | — |

**Referenced by:** `wikiLinks.sourcePageId`, `wikiLinks.targetPageId`

### `wikiSources`

PostgreSQL: `wiki_sources` · 10 columns · 1 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| wikiId | UUID | NOT NULL, FK → `wikiSpaces.id` (CASCADE) |
| fileUrl | TEXT | — |
| rawContent | TEXT | — |
| wordCount | INTEGER | — |
| metadata | JSONB | — |
| errorMessage | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| wikiIdIdx | INDEX | — |
| statusIdx | INDEX | — |

**Referenced by:** `wikiPages.sourceId`

### `wikiSpaces`

PostgreSQL: `wiki_spaces` · 10 columns · 1 FK out · 3 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| orgId | UUID | — |
| description | TEXT | — |
| schemaConfig | JSONB | — |
| pageCount | INTEGER | NOT NULL |
| sourceCount | INTEGER | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |
| userIdIdx | INDEX | — |

**Referenced by:** `wikiSources.wikiId`, `wikiPages.wikiId`, `wikiLog.wikiId`

### `workflowAutomations`

PostgreSQL: `workflow_automations` · 10 columns · 2 FK out · 4 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| triggerConditions | JSONB | — |
| actions | JSONB | — |
| isActive | BOOLEAN | — |
| executionCount | INTEGER | — |
| lastExecutedAt | TIMESTAMP | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `automationExecutionLogs.automationId`, `automationSchedules.automationId`, `automationVersions.automationId`, `automationChainSteps.automationId`

### `workforcePlans`

PostgreSQL: `workforce_plans` · 8 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| scenario | JSONB | — |
| projections | JSONB | — |
| assumptions | JSONB | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

---

## References

- [[01-entities/sebenza-hub]] — Platform overview
- [[02-concepts/tech-stack]] — Technology stack
- [[02-concepts/billing-system]] — Billing deep-dive
- [[02-concepts/rbac]] — Permission system
- [[02-concepts/multi-tenancy]] — Organisation model
- [[02-concepts/authentication]] — Magic-link auth
- [[02-concepts/application-lifecycle]] — Hiring pipeline
- [[09-sources/repo-audit-2026-04-07]] — Original codebase audit