---
title: "ERD — Billing & Subscriptions"
type: reference
created: 2026-04-10
updated: 2026-04-10
tags: [database, erd, billing-and-subscriptions]
status: active
---

# ERD — Billing & Subscriptions

**48 tables** · **39 FK relationships** — 18 subscription plans, credits, payments, invoices, pricing experiments.

← Back to [[13-raw/data/erd/index|ERD Index]]

## `billingAlerts`

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

## `billingAutomationRules`

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

## `billingCredits`

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

## `billingDisputes`

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

## `billingPreferences`

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

## `billingReferrals`

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

## `billingScenarios`

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

## `coupons`

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

## `creditTransactions`

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

## `featureAlertRules`

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

## `featureAlerts`

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

## `featureCategories`

PostgreSQL: `feature_categories` · 4 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| description | TEXT | — |
| sortOrder | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |

## `featureChangelog`

PostgreSQL: `feature_changelog` · 4 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| details | JSONB | — |
| userId | UUID | — |
| createdAt | TIMESTAMP | NOT NULL |

## `featureDependencies`

PostgreSQL: `feature_dependencies` · 2 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| createdAt | TIMESTAMP | NOT NULL |

## `featureEntitlements`

PostgreSQL: `feature_entitlements` · 6 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| planId | UUID | NOT NULL, FK → `plans.id` (CASCADE) |
| enabled | BOOLEAN | — |
| monthlyCap | INTEGER | — |
| overageUnitCents | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |

## `featureExperiments`

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

## `featureFlags`

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

## `featureGovernanceAuditLog`

PostgreSQL: `feature_governance_audit_log` · 4 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| details | TEXT | — |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

## `featureGovernancePolicies`

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

## `featureGovernanceRequests`

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

## `featurePricingSimulations`

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

## `featureRequests`

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

## `featureVersions`

PostgreSQL: `feature_versions` · 4 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| changes | JSONB | NOT NULL |
| changedBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |

## `features`

PostgreSQL: `features` · 4 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| description | TEXT | — |
| stageChangedAt | TIMESTAMP | — |
| rolloutPercent | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |

## `invoiceMilestones`

PostgreSQL: `invoice_milestones` · 6 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| placementId | UUID | NOT NULL |
| amount | INTEGER | NOT NULL |
| dueDate | TIMESTAMP | — |
| paidDate | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

## `paymentEvents`

PostgreSQL: `payment_events` · 4 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| payload | JSONB | — |
| processed | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |

## `paymentGateways`

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

## `planAbTests`

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

## `planAuditLog`

PostgreSQL: `plan_audit_log` · 6 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| planId | UUID | FK → `plans.id` |
| changes | JSONB | — |
| performedBy | UUID | FK → `users.id` |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

## `planEvents`

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

## `planHealthMetrics`

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

## `planRecommendations`

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

## `plans`

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

## `pricingExperiments`

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

## `pricingScenarios`

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

## `pricingVariants`

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

## `revenueAnomalies`

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

## `revenueLeakageFindings`

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

## `revenueRecognitionEntries`

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

## `revenueRecognitionRules`

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

## `revenueRecognitionSchedule`

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

## `revenueSnapshots`

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

## `subscriptions`

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

## `usage`

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

## `usageAlerts`

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

## `usageAnalytics`

PostgreSQL: `usage_analytics` · 5 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | FK → `users.id` (SET NULL) |
| organizationId | UUID | FK → `organizations.id` (SET NULL) |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

## `usageMeterDefinitions`

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

## `usageMeterEvents`

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

---
← Back to [[13-raw/data/erd/index|ERD Index]]