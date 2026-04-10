---
title: "ERD — Other"
type: reference
created: 2026-04-10
updated: 2026-04-10
tags: [database, erd, other]
status: active
---

# ERD — Other

**140 tables** · **213 FK relationships** — Miscellaneous tables: analytics, workforce planning, vendor management, etc.

← Back to [[13-raw/data/erd/index|ERD Index]]

## `adminCvFlags`

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

## `adminCvNotes`

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

## `adminCvPoolMembers`

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

## `adminCvPools`

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

## `adminCvTagAssignments`

PostgreSQL: `admin_cv_tag_assignments` · 5 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| cvId | UUID | NOT NULL, FK → `cvs.id` (CASCADE) |
| tagId | UUID | NOT NULL, FK → `adminCvTags.id` (CASCADE) |
| assignedBy | UUID | NOT NULL, FK → `users.id` |
| createdAt | TIMESTAMP | NOT NULL |

## `adminCvTags`

PostgreSQL: `admin_cv_tags` · 3 columns · 1 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| createdBy | UUID | NOT NULL, FK → `users.id` |
| createdAt | TIMESTAMP | NOT NULL |

**Referenced by:** `adminCvTagAssignments.tagId`

## `analyticsAnnotations`

PostgreSQL: `analytics_annotations` · 5 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| date | TIMESTAMP | NOT NULL |
| description | TEXT | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |

## `analyticsGoals`

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

## `analyticsSavedSegments`

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

## `approvalAuditLog`

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

## `approvalDelegations`

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

## `approvalPolicyRules`

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

## `approvalSteps`

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

## `approvalWorkflowComments`

PostgreSQL: `approval_workflow_comments` · 6 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| workflowId | UUID | NOT NULL, FK → `approvalWorkflows.id` (CASCADE) |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| message | TEXT | NOT NULL |
| isSystemMessage | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |

## `approvalWorkflowTemplates`

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

## `approvalWorkflows`

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

## `autoApplyLog`

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

## `autoSearchPreferences`

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

## `autoSearchResults`

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

## `awards`

PostgreSQL: `awards` · 5 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| candidateId | UUID | NOT NULL, FK → `candidates.id` (CASCADE) |
| year | INTEGER | — |
| description | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

## `biasAlertEvents`

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

## `biasAlertRules`

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

## `biasAuditSchedules`

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

## `biasBenchmarks`

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

## `biasCausalAnalysis`

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

## `biasCopilotInsights`

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

## `biasFairnessPulse`

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

## `biasHumanImpactRecords`

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

## `biasIntersectionalRecords`

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

## `biasRemediationActions`

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

## `biasReports`

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

## `biasSimulations`

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

## `brandVoiceProfiles`

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

## `campaignRedemptions`

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

## `campaigns`

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

## `candidateExperienceConfig`

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

## `candidateExperienceSurveys`

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

## `candidateSourcingProfiles`

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

## `candidateTemperatures`

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

## `certifications`

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

## `channelAdapterConfigs`

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

## `channelEventRoutes`

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

## `channelEvents`

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

## `collaborativeHiringVotes`

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

## `companyResponseStats`

PostgreSQL: `company_response_stats` · 5 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| medianResponseDays | INTEGER | — |
| responseRate | REAL | — |
| totalApplications | INTEGER | — |
| updatedAt | TIMESTAMP | NOT NULL |

## `competitorBenchmarks`

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

## `complianceReports`

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

## `complianceSettings`

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

## `contractWorkers`

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

## `customReports`

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

## `customerRevenueDna`

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

## `disputeEvidence`

PostgreSQL: `dispute_evidence` · 6 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| disputeId | UUID | NOT NULL, FK → `billingDisputes.id` (CASCADE) |
| content | TEXT | — |
| fileUrl | TEXT | — |
| uploadedBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |

## `education`

PostgreSQL: `education` · 4 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| candidateId | UUID | NOT NULL, FK → `candidates.id` (CASCADE) |
| gradDate | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

## `entitlementDrafts`

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

## `entitlementSnapshots`

PostgreSQL: `entitlement_snapshots` · 4 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| snapshot | JSONB | NOT NULL |
| createdBy | UUID | — |
| createdAt | TIMESTAMP | NOT NULL |

## `experiences`

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

## `experimentEvents`

PostgreSQL: `experiment_events` · 6 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| experimentId | UUID | NOT NULL, FK → `pricingExperiments.id` (CASCADE) |
| variantId | UUID | NOT NULL, FK → `pricingVariants.id` (CASCADE) |
| userId | UUID | FK → `users.id` (SET NULL) |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

## `gatewayHealthLogs`

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

## `gatewayRoutingRules`

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

## `healthPulseReports`

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

## `hiringManagerReviews`

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

## `hrisIntegrations`

PostgreSQL: `hris_integrations` · 6 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| config | JSONB | — |
| lastSyncAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `internalJobBoard`

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

## `jobAggregatorConfigs`

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

## `jobAggregatorSyncLogs`

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

## `languageSettings`

PostgreSQL: `language_settings` · 5 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| settingValue | JSONB | NOT NULL |
| description | TEXT | — |
| updatedBy | UUID | FK → `users.id` |
| updatedAt | TIMESTAMP | NOT NULL |

## `languageStyleGuides`

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

## `languageUsageEvents`

PostgreSQL: `language_usage_events` · 4 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | FK → `users.id` |
| userAgent | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

## `managerApprovalSteps`

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

## `managerApprovalWorkflows`

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

## `managerCandidateComparisons`

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

## `managerCandidateNotes`

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

## `managerCoachingInsights`

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

## `managerDecisionRoomParticipants`

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

## `managerDecisionRooms`

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

## `managerDeiSnapshots`

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

## `managerDelegationLogs`

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

## `managerInterviewCalibrations`

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

## `managerOfferScenarios`

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

## `managerPipelineRisks`

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

## `managerPredictiveScores`

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

## `managerPreferences`

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

## `managerShortlists`

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

## `managerSlaConfigs`

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

## `managerTalentBenchmarks`

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

## `managerTeamActivities`

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

## `managerTeamGoals`

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

## `managerWorkforcePlans`

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

## `performanceRecords`

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

## `platformHealthMetrics`

PostgreSQL: `platform_health_metrics` · 4 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| value | REAL | NOT NULL |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

## `platformLanguages`

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

## `predictiveAnalytics`

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

## `projects`

PostgreSQL: `projects` · 6 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| candidateId | UUID | NOT NULL, FK → `candidates.id` (CASCADE) |
| what | TEXT | — |
| impact | TEXT | — |
| link | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

## `reEngagementActivityLog`

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

## `reEngagementAutomationRules`

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

## `reEngagementCampaigns`

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

## `reEngagementSequenceSteps`

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

## `reEngagementSequences`

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

## `reEngagementTemplates`

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

## `recruiterAchievements`

PostgreSQL: `recruiter_achievements` · 6 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL |
| recruiterId | UUID | NOT NULL |
| description | TEXT | — |
| earnedAt | TIMESTAMP | NOT NULL |
| metadata | JSONB | — |

## `recruitmentCampaigns`

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

## `recruitmentSequences`

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

## `rejectionAnalyses`

PostgreSQL: `rejection_analyses` · 6 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| applicationId | UUID | NOT NULL, FK → `jobApplications.id` (CASCADE) |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| analysis | JSONB | — |
| bounceBackJobIds | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

## `salaryBands`

PostgreSQL: `salary_bands` · 5 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| minSalary | INTEGER | — |
| maxSalary | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |

## `savedQuestionSets`

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

## `savedSearches`

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

## `scheduledMessages`

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

## `sequenceEnrollments`

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

## `sequenceEvents`

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

## `sequenceSteps`

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

## `sequenceTemplateLibrary`

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

## `sourcingAnalyticsSnapshots`

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

## `sourcingCampaignCandidates`

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

## `sourcingCampaigns`

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

## `subscribers`

PostgreSQL: `subscribers` · 2 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| createdAt | TIMESTAMP | NOT NULL |

## `successionPlans`

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

## `surveyExperienceGoals`

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

## `teamPerformanceConfig`

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

## `templateFavorites`

PostgreSQL: `template_favorites` · 5 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL |
| templateId | UUID | NOT NULL |
| notes | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

## `templateRatings`

PostgreSQL: `template_ratings` · 6 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL |
| templateId | UUID | NOT NULL |
| rating | INTEGER | NOT NULL |
| review | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

## `templateUsageLogs`

PostgreSQL: `template_usage_logs` · 5 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL |
| templateId | UUID | NOT NULL |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

## `translationAssignments`

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

## `translationBatchJobs`

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

## `translationComplianceAudits`

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

## `translationContributors`

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

## `translationGlossary`

PostgreSQL: `translation_glossary` · 6 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| definition | TEXT | — |
| isApproved | BOOLEAN | — |
| createdBy | UUID | FK → `users.id` |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `translationImportExports`

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

## `translationKeys`

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

## `translationNamespaces`

PostgreSQL: `translation_namespaces` · 4 columns · 0 FK out · 3 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| keyCount | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |

**Referenced by:** `translationKeys.namespaceId`, `translationBatchJobs.namespaceId`, `translationAssignments.namespaceId`

## `translationQualityIssues`

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

## `translationValues`

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

## `vendorManagement`

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

## `wellbeingCheckins`

PostgreSQL: `wellbeing_checkins` · 6 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| applicationCountThatWeek | INTEGER | — |
| interviewCountThatWeek | INTEGER | — |
| note | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

## `wikiLinks`

PostgreSQL: `wiki_links` · 6 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| sourcePageId | UUID | NOT NULL, FK → `wikiPages.id` (CASCADE) |
| targetPageId | UUID | NOT NULL, FK → `wikiPages.id` (CASCADE) |
| context | TEXT | — |
| sourcePageIdIdx | INDEX | — |
| targetPageIdIdx | INDEX | — |

## `wikiLog`

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

## `wikiPages`

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

## `wikiSources`

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

## `wikiSpaces`

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

## `workflowAutomations`

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

## `workforcePlans`

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
← Back to [[13-raw/data/erd/index|ERD Index]]