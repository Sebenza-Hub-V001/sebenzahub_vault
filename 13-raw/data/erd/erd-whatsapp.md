---
title: "ERD — WhatsApp"
type: reference
created: 2026-04-10
updated: 2026-04-10
tags: [database, erd, whatsapp]
status: active
---

# ERD — WhatsApp

**49 tables** · **48 FK relationships** — WhatsApp Business API: conversations, bots, flows, campaigns, apply-via-WhatsApp.

← Back to [[13-raw/data/erd/index|ERD Index]]

## `metaWhatsAppTemplates`

PostgreSQL: `meta_whatsapp_templates` · 6 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| metaTemplateId | TEXT | NOT NULL, UNIQUE |
| components | JSONB | — |
| lastSyncedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | — |
| updatedAt | TIMESTAMP | — |

## `waCampaignAudiences`

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

## `waCampaignContacts`

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

## `waCampaignSendLogs`

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

## `waCampaignTemplates`

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

## `waContactListMembers`

PostgreSQL: `wa_contact_list_members` · 3 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| listId | UUID | NOT NULL, FK → `waContactLists.id` (CASCADE) |
| addedAt | TIMESTAMP | — |

## `waContactLists`

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

## `waDripEnrollments`

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

## `waDripSequences`

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

## `whatsappAbTests`

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

## `whatsappAgents`

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

## `whatsappAnalytics`

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

## `whatsappApplyAbTests`

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

## `whatsappApplyAnalytics`

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

## `whatsappApplyApplications`

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

## `whatsappApplyAutoResponders`

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

## `whatsappApplyCampaigns`

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

## `whatsappApplyLinks`

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

## `whatsappApplyTemplates`

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

## `whatsappAssessmentSessions`

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

## `whatsappAutoResponders`

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

## `whatsappBotConfig`

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

## `whatsappBotFlows`

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

## `whatsappBotTemplates`

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

## `whatsappBotTraining`

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

## `whatsappBroadcasts`

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

## `whatsappCannedResponses`

PostgreSQL: `whatsapp_canned_responses` · 5 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | SERIAL | PK |
| message | TEXT | NOT NULL |
| usageCount | INTEGER | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `whatsappComplianceLogs`

PostgreSQL: `whatsapp_compliance_logs` · 5 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | — |
| conversationId | UUID | — |
| details | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

## `whatsappConversationNotes`

PostgreSQL: `whatsapp_conversation_notes` · 6 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| conversationId | UUID | NOT NULL |
| content | TEXT | NOT NULL |
| createdBy | UUID | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `whatsappConversationTags`

PostgreSQL: `whatsapp_conversation_tags` · 5 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| conversationId | UUID | NOT NULL |
| autoApplied | BOOLEAN | — |
| appliedBy | UUID | — |
| createdAt | TIMESTAMP | NOT NULL |

## `whatsappConversations`

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

## `whatsappCsatSurveys`

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

## `whatsappDeepLinks`

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

## `whatsappFlows`

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

## `whatsappJobMatchCards`

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

## `whatsappMediaUploads`

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

## `whatsappMessages`

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

## `whatsappQuickReplies`

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

## `whatsappReengagementCampaigns`

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

## `whatsappReferralChains`

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

## `whatsappReferralCodes`

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

## `whatsappRoutingRules`

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

## `whatsappScheduledMessages`

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

## `whatsappScreeningFlows`

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

## `whatsappScreeningSessions`

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

## `whatsappSegments`

PostgreSQL: `whatsapp_segments` · 6 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | SERIAL | PK |
| description | TEXT | — |
| criteria | TEXT | NOT NULL |
| contactCount | INTEGER | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `whatsappSimulatorSessions`

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

## `whatsappStatusCards`

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

## `whatsappVoiceNotes`

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

---
← Back to [[13-raw/data/erd/index|ERD Index]]