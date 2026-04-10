---
title: "ERD — Fraud & Security"
type: reference
created: 2026-04-10
updated: 2026-04-10
tags: [database, erd, fraud-and-security]
status: active
---

# ERD — Fraud & Security

**30 tables** · **16 FK relationships** — Fraud detection, investigations, honeypots, behavioural profiles.

← Back to [[13-raw/data/erd/index|ERD Index]]

## `fraudAlerts`

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

## `fraudAnomalyEvents`

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

## `fraudAuditLog`

PostgreSQL: `fraud_audit_log` · 5 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| detectionId | UUID | FK → `fraudDetections.id` (SET NULL) |
| adminId | UUID | FK → `users.id` (SET NULL) |
| details | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

## `fraudBehavioralProfiles`

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

## `fraudComplianceReports`

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

## `fraudDetections`

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

## `fraudEvidenceBoards`

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

## `fraudFinancialImpact`

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

## `fraudForensicsCases`

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

## `fraudGeoAnalysis`

PostgreSQL: `fraud_geo_analysis` · 6 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| detectionCount | INTEGER | — |
| highRiskCount | INTEGER | — |
| averageRiskScore | REAL | — |
| topFraudTypes | JSONB | — |
| lastUpdated | TIMESTAMP | NOT NULL |

## `fraudHoneypotInteractions`

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

## `fraudHoneypots`

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

## `fraudIdentityClusters`

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

## `fraudIncidentTransactions`

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

## `fraudInvestigationNotes`

PostgreSQL: `fraud_investigation_notes` · 6 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| investigationId | UUID | NOT NULL, FK → `fraudInvestigations.id` (CASCADE) |
| authorId | UUID | FK → `users.id` (SET NULL) |
| content | TEXT | NOT NULL |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

## `fraudInvestigations`

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

## `fraudKnownBadActors`

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

## `fraudNetworkLinks`

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

## `fraudPatternLibrary`

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

## `fraudPlaybookExecutions`

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

## `fraudPlaybooks`

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

## `fraudPredictiveModels`

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

## `fraudReviewNotes`

PostgreSQL: `fraud_review_notes` · 5 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| fraudDetectionId | UUID | NOT NULL, FK → `fraudDetections.id` (CASCADE) |
| note | TEXT | NOT NULL |
| reviewedBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |

## `fraudRules`

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

## `fraudScanConfig`

PostgreSQL: `fraud_scan_config` · 4 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| isEnabled | BOOLEAN | NOT NULL |
| minRiskScore | INTEGER | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `fraudSimulations`

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

## `fraudThreatIntel`

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

## `fraudUserRiskProfiles`

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

## `fraudVelocityRules`

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

## `fraudWatchlist`

PostgreSQL: `fraud_watchlist` · 6 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| reason | TEXT | — |
| addedBy | UUID | FK → `users.id` (SET NULL) |
| isActive | BOOLEAN | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |

---
← Back to [[13-raw/data/erd/index|ERD Index]]