---
title: "ERD — Talent CRM"
type: reference
created: 2026-04-10
updated: 2026-04-10
tags: [database, erd, talent-crm]
status: active
---

# ERD — Talent CRM

**26 tables** · **63 FK relationships** — Talent pools, CRM contacts, engagement signals, nurture autopilots, rediscovery.

← Back to [[13-raw/data/erd/index|ERD Index]]

## `rediscoveryAnalyticsEvents`

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

## `rediscoveryCampaignSteps`

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

## `rediscoveryCampaigns`

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

## `rediscoveryCandidateNotes`

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

## `rediscoveryCandidateRatings`

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

## `rediscoveryIntelligence`

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

## `rediscoveryLossReasons`

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

## `rediscoveryOutreachTemplates`

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

## `rediscoveryPoolHealth`

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

## `rediscoverySegmentMembers`

PostgreSQL: `rediscovery_segment_members` · 4 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| segmentId | UUID | NOT NULL, FK → `rediscoverySegments.id` (CASCADE) |
| candidateId | UUID | NOT NULL, FK → `candidates.id` (CASCADE) |
| addedAt | TIMESTAMP | NOT NULL |

## `rediscoverySegments`

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

## `rediscoverySignals`

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

## `rediscoveryWatchlist`

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

## `talentCrmActivities`

PostgreSQL: `talent_crm_activities` · 6 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| contactId | UUID | NOT NULL, FK → `talentCrmContacts.id` (CASCADE) |
| userId | UUID | FK → `users.id` (SET NULL) |
| body | TEXT | — |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

## `talentCrmConnections`

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

## `talentCrmContacts`

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

## `talentCrmEngagementSignals`

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

## `talentCrmIntelligence`

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

## `talentCrmMatchResults`

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

## `talentCrmNurtureAutopilots`

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

## `talentCrmNurtureTouchpoints`

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

## `talentCrmRevenueSnapshots`

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

## `talentPoolMembers`

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

## `talentPools`

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

## `talentRediscoveryEngagements`

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

## `talentRediscoveryMatches`

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

---
← Back to [[13-raw/data/erd/index|ERD Index]]