---
title: "ERD — Pipeline & Offers"
type: reference
created: 2026-04-10
updated: 2026-04-10
tags: [database, erd, pipeline-and-offers]
status: active
---

# ERD — Pipeline & Offers

**26 tables** · **55 FK relationships** — Recruitment pipeline stages, scorecards, offers, negotiations, placements.

← Back to [[13-raw/data/erd/index|ERD Index]]

## `negotiationApprovals`

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

## `negotiationBenchmarks`

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

## `negotiationCommunications`

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

## `negotiationCompPackages`

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

## `negotiationDeadlines`

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

## `negotiationStrategies`

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

## `offerActivityLog`

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

## `offerApprovalChains`

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

## `offerBenchmarks`

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

## `offerComparisons`

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

## `offerComplianceChecks`

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

## `offerLetters`

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

## `offerNegotiations`

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

## `offerPredictionsLog`

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

## `offerTemplateClauses`

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

## `offerTemplateVersions`

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

## `offerTemplates`

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

## `offers`

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

## `pipelineAutomationRules`

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

## `pipelineOutreachSequences`

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

## `pipelineStages`

PostgreSQL: `pipeline_stages` · 5 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| order | INTEGER | — |
| isDefault | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |

## `pipelineVelocityMetrics`

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

## `placements`

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

## `scorecardResponses`

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

## `scorecards`

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

## `submissions`

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

---
← Back to [[13-raw/data/erd/index|ERD Index]]