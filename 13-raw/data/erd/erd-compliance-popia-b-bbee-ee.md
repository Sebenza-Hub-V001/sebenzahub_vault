---
title: "ERD — Compliance (POPIA/B-BBEE/EE)"
type: reference
created: 2026-04-10
updated: 2026-04-10
tags: [database, erd, compliance-popia-b-bbee-ee]
status: active
---

# ERD — Compliance (POPIA/B-BBEE/EE)

**54 tables** · **98 FK relationships** — South African compliance: POPIA consent/breach, B-BBEE scoring, Employment Equity.

← Back to [[13-raw/data/erd/index|ERD Index]]

## `bbbeeCertificates`

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

## `bbbeeClientPortfolio`

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

## `bbbeeCommitteeMeetings`

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

## `bbbeeComplianceAlerts`

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

## `bbbeeComplianceChecklist`

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

## `bbbeeComplianceDeadlines`

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

## `bbbeeDocumentVault`

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

## `bbbeeImprovementPlans`

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

## `bbbeeOwnershipAnalysis`

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

## `bbbeePlacementImpacts`

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

## `bbbeeScoreHistory`

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

## `bbbeeScores`

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

## `bbbeeSectorBenchmarks`

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

## `bbbeeSedProjects`

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

## `bbbeeSkillsPrograms`

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

## `bbbeeSupplierDevelopment`

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

## `blindHiringAbExperiments`

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

## `blindHiringAdverseImpactAnalyses`

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

## `blindHiringAuditLog`

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

## `blindHiringBenchmarks`

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

## `blindHiringBiasScans`

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

## `blindHiringCalibrationReviewers`

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

## `blindHiringCalibrationSessions`

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

## `blindHiringChallengeSubmissions`

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

## `blindHiringComplianceAssessments`

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

## `blindHiringConfigs`

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

## `blindHiringDataRetentionPolicies`

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

## `blindHiringFairnessCertificates`

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

## `blindHiringPresets`

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

## `blindHiringReviewerMetrics`

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

## `blindHiringReviews`

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

## `blindHiringSkillsChallenges`

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

## `dataDeletionRequests`

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

## `dataMigrations`

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

## `dataRetentionPolicies`

PostgreSQL: `data_retention_policies` · 6 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| retentionDays | INTEGER | NOT NULL |
| autoDelete | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `diversityGoals`

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

## `diversityReports`

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

## `diversitySnapshots`

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

## `eeAffirmativeMeasures`

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

## `eeBarriers`

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

## `eeConsultations`

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

## `eeIncomeDifferentials`

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

## `eePlans`

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

## `eeReports`

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

## `popiaBreachIncidents`

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

## `popiaComplaints`

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

## `popiaConsentTemplates`

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

## `popiaConsents`

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

## `popiaDataMapping`

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

## `popiaDataProcessingAgreements`

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

## `popiaImpactAssessments`

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

## `popiaInformationOfficers`

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

## `popiaRegulatoryFilings`

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

## `popiaTrainingRecords`

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

---
← Back to [[13-raw/data/erd/index|ERD Index]]