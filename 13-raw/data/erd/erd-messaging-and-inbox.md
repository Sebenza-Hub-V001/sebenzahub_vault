---
title: "ERD — Messaging & Inbox"
type: reference
created: 2026-04-10
updated: 2026-04-10
tags: [database, erd, messaging-and-inbox]
status: active
---

# ERD — Messaging & Inbox

**47 tables** · **82 FK relationships** — Email templates, sequences, unified inbox, chatbot, notifications.

← Back to [[13-raw/data/erd/index|ERD Index]]

## `chatbotAbTests`

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

## `chatbotAiTraining`

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

## `chatbotAnalytics`

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

## `chatbotCannedResponses`

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

## `chatbotConversationNotes`

PostgreSQL: `chatbot_conversation_notes` · 5 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| conversationId | UUID | FK → `chatbotConversations.id` (CASCADE) |
| authorId | UUID | FK → `users.id` (SET NULL) |
| content | TEXT | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |

## `chatbotConversationTags`

PostgreSQL: `chatbot_conversation_tags` · 3 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| conversationId | UUID | FK → `chatbotConversations.id` (CASCADE) |
| createdAt | TIMESTAMP | NOT NULL |

## `chatbotConversations`

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

## `chatbotEmbedConfigs`

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

## `chatbotFaqs`

PostgreSQL: `chatbot_faqs` · 6 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | SERIAL | PK |
| question | TEXT | NOT NULL |
| answer | TEXT | NOT NULL |
| usageCount | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `chatbotFlows`

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

## `chatbotHandoffRules`

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

## `chatbotIntelligenceReports`

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

## `chatbotIntents`

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

## `chatbotKnowledgeBase`

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

## `chatbotLeadScores`

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

## `chatbotLeadScoringRules`

PostgreSQL: `chatbot_lead_scoring_rules` · 5 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| points | INTEGER | NOT NULL |
| isActive | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |

## `chatbotLiveSessions`

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

## `chatbotProactiveTriggers`

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

## `chatbotSatisfaction`

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

## `chatbotSimulatorSessions`

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

## `chatbotVisitors`

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

## `chatbotWidgetConfig`

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

## `conversationLabels`

PostgreSQL: `conversation_labels` · 4 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| conversationId | UUID | NOT NULL, FK → `conversations.id` (CASCADE) |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| createdAt | TIMESTAMP | NOT NULL |

## `conversationNotes`

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

## `conversations`

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

## `emailSequenceExecutions`

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

## `emailSequenceSteps`

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

## `emailSequences`

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

## `emailTemplates`

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

## `messageReactions`

PostgreSQL: `message_reactions` · 4 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| messageId | UUID | NOT NULL, FK → `messages.id` (CASCADE) |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| createdAt | TIMESTAMP | NOT NULL |

## `messageTemplates`

PostgreSQL: `message_templates` · 5 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| body | TEXT | NOT NULL |
| usageCount | INTEGER | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |

## `messages`

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

## `notifications`

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

## `unifiedInboxCannedResponses`

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

## `unifiedInboxContacts`

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

## `unifiedInboxFollowUpRules`

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

## `unifiedInboxIntelligence`

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

## `unifiedInboxLabels`

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

## `unifiedInboxMessages`

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

## `unifiedInboxNotes`

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

## `unifiedInboxSavedViews`

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

## `unifiedInboxScheduledMessages`

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

## `unifiedInboxSignatures`

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

## `unifiedInboxSlaConfigs`

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

## `unifiedInboxThreadLabels`

PostgreSQL: `unified_inbox_thread_labels` · 4 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| threadId | UUID | NOT NULL, FK → `unifiedInboxThreads.id` (CASCADE) |
| labelId | UUID | NOT NULL, FK → `unifiedInboxLabels.id` (CASCADE) |
| createdAt | TIMESTAMP | NOT NULL |

## `unifiedInboxThreads`

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

## `unifiedInboxTranslations`

PostgreSQL: `unified_inbox_translations` · 6 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| messageId | UUID | NOT NULL |
| originalText | TEXT | NOT NULL |
| translatedText | TEXT | NOT NULL |
| confidence | REAL | — |
| createdAt | TIMESTAMP | NOT NULL |

---
← Back to [[13-raw/data/erd/index|ERD Index]]