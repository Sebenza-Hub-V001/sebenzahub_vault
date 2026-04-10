---
title: "ERD — User Profiles"
type: reference
created: 2026-04-10
updated: 2026-04-10
tags: [database, erd, user-profiles]
status: active
---

# ERD — User Profiles

**10 tables** · **11 FK relationships** — Extended profile data for each user type: candidate, recruiter, individual.

← Back to [[13-raw/data/erd/index|ERD Index]]

## `candidateProfiles`

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

## `credentialMatchCache`

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

## `credentialPortfolioSettings`

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

## `credentialVerifications`

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

## `individualNotificationSettings`

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

## `individualPreferences`

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

## `individualSettings`

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

## `recruiterNotificationSettings`

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

## `recruiterPitches`

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

## `recruiterProfiles`

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

---
← Back to [[13-raw/data/erd/index|ERD Index]]