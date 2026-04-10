---
title: "ERD — Marketing & Career Site"
type: reference
created: 2026-04-10
updated: 2026-04-10
tags: [database, erd, marketing-and-career-site]
status: active
---

# ERD — Marketing & Career Site

**51 tables** · **71 FK relationships** — Career site pages, job board integrations, employer branding, SEO.

← Back to [[13-raw/data/erd/index|ERD Index]]

## `blogPosts`

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

## `careerPulseSnapshots`

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

## `careerSiteAnalytics`

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

## `careerSiteAwards`

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

## `careerSiteCareerPaths`

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

## `careerSiteDepartments`

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

## `careerSiteEvents`

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

## `careerSiteFaqs`

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

## `careerSiteFeaturedJobs`

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

## `careerSitePages`

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

## `careerSiteSettings`

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

## `careerSiteTalentCommunity`

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

## `careerSiteTestimonials`

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

## `employerBrandProfiles`

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

## `jobBoardAbTests`

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

## `jobBoardAbVariants`

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

## `jobBoardAnalyticsSnapshots`

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

## `jobBoardAutoRefreshRules`

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

## `jobBoardAutoRules`

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

## `jobBoardBudgets`

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

## `jobBoardCandidateSources`

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

## `jobBoardCompetitorIntel`

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

## `jobBoardDuplicateCandidates`

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

## `jobBoardHealthChecks`

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

## `jobBoardIntegrations`

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

## `jobBoardOptimalTimes`

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

## `jobBoardPostingScores`

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

## `jobBoardPostingTemplates`

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

## `jobBoardPostings`

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

## `jobBoardScheduledPosts`

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

## `marketingAbTests`

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

## `marketingAdvocacyContent`

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

## `marketingAnalyticsSnapshots`

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

## `marketingAudiences`

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

## `marketingAutopilotRecs`

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

## `marketingBrandHealth`

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

## `marketingCompetitorIntel`

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

## `marketingContent`

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

## `marketingContentPredictions`

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

## `marketingEmployeeAdvocates`

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

## `marketingEvents`

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

## `marketingNurtureSequences`

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

## `marketingSocialPosts`

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

## `marketingTalentHeatmap`

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

## `seoBacklinks`

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

## `seoCompetitors`

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

## `seoCrawlReports`

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

## `seoKeywords`

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

## `seoLocalCitations`

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

## `seoPageAudits`

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

## `seoRedirects`

PostgreSQL: `seo_redirects` · 6 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| redirectType | INTEGER | — |
| hits | INTEGER | — |
| isActive | BOOLEAN | — |
| reason | TEXT | — |
| createdAt | TIMESTAMP | — |

---
← Back to [[13-raw/data/erd/index|ERD Index]]