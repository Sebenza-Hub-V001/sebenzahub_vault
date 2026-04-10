---
title: "ERD — RBAC & Audit"
type: reference
created: 2026-04-10
updated: 2026-04-10
tags: [database, erd, rbac-and-audit]
status: active
---

# ERD — RBAC & Audit

**11 tables** · **32 FK relationships** — Role-based access control, audit trail, access review campaigns.

← Back to [[13-raw/data/erd/index|ERD Index]]

## `accessReviewCampaigns`

PostgreSQL: `access_review_campaigns` · 13 columns · 2 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| targetRoleIds | JSONB | — |
| dueDate | TIMESTAMP | — |
| startedAt | TIMESTAMP | — |
| completedAt | TIMESTAMP | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| reviewerIds | JSONB | — |
| settings | JSONB | — |
| stats | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `accessReviewItems.campaignId`

## `accessReviewItems`

PostgreSQL: `access_review_items` · 8 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| campaignId | UUID | NOT NULL, FK → `accessReviewCampaigns.id` (CASCADE) |
| assignmentId | UUID | NOT NULL, FK → `roleAssignments.id` (CASCADE) |
| reviewerId | UUID | FK → `users.id` (SET NULL) |
| justification | TEXT | — |
| riskScore | INTEGER | — |
| decidedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

## `auditAnomalies`

PostgreSQL: `audit_anomalies` · 12 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| userId | UUID | FK → `users.id` (SET NULL) |
| confidence | REAL | NOT NULL |
| description | TEXT | NOT NULL |
| evidence | JSONB | — |
| relatedEventIds | JSONB | — |
| resolvedBy | UUID | FK → `users.id` (SET NULL) |
| resolvedAt | TIMESTAMP | — |
| resolutionNote | TEXT | — |
| detectedAt | TIMESTAMP | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |

## `auditTrail`

PostgreSQL: `audit_trail` · 14 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| userId | UUID | FK → `users.id` (SET NULL) |
| entityId | UUID | — |
| changes | JSONB | — |
| userAgent | TEXT | — |
| riskScore | INTEGER | NOT NULL |
| metadata | JSONB | — |
| complianceFlags | JSONB | — |
| parentEventId | UUID | — |
| durationMs | INTEGER | — |
| statusCode | INTEGER | — |
| resourceUrl | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

## `auditWatchRules`

PostgreSQL: `audit_watch_rules` · 13 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| conditions | JSONB | NOT NULL |
| notifyChannels | JSONB | — |
| notifyRecipients | JSONB | — |
| cooldownMinutes | INTEGER | — |
| isActive | BOOLEAN | — |
| triggerCount | INTEGER | — |
| lastTriggeredAt | TIMESTAMP | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `rbacAuditLog`

PostgreSQL: `rbac_audit_log` · 7 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| actorId | UUID | FK → `users.id` (SET NULL) |
| targetId | UUID | NOT NULL |
| changes | JSONB | — |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

## `roleAnalyticsEvents`

PostgreSQL: `role_analytics_events` · 6 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| actorId | UUID | FK → `users.id` (SET NULL) |
| roleId | UUID | FK → `roleDefinitions.id` (SET NULL) |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

## `roleAssignments`

PostgreSQL: `role_assignments` · 9 columns · 5 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| roleDefinitionId | UUID | NOT NULL, FK → `roleDefinitions.id` (CASCADE) |
| teamMemberId | UUID | FK → `teamMembers.id` (CASCADE) |
| userId | UUID | FK → `users.id` (CASCADE) |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| assignedBy | UUID | FK → `users.id` (SET NULL) |
| expiresAt | TIMESTAMP | — |
| isActive | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |

**Referenced by:** `accessReviewItems.assignmentId`

## `roleChangeRequests`

PostgreSQL: `role_change_requests` · 16 columns · 6 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| requesterId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| targetUserId | UUID | FK → `users.id` (CASCADE) |
| targetTeamMemberId | UUID | FK → `teamMembers.id` (CASCADE) |
| roleDefinitionId | UUID | FK → `roleDefinitions.id` (SET NULL) |
| currentRoleId | UUID | FK → `roleDefinitions.id` (SET NULL) |
| reason | TEXT | — |
| expiresAt | TIMESTAMP | — |
| approverIds | JSONB | — |
| approvals | JSONB | — |
| requiredApprovals | INTEGER | — |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |
| resolvedAt | TIMESTAMP | — |

## `roleDefinitions`

PostgreSQL: `role_definitions` · 12 columns · 2 FK out · 4 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| permissions | JSONB | — |
| isSystem | BOOLEAN | — |
| isDefault | BOOLEAN | — |
| parentRoleId | UUID | — |
| maxUsers | INTEGER | — |
| metadata | JSONB | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `roleAssignments.roleDefinitionId`, `roleChangeRequests.roleDefinitionId`, `roleChangeRequests.currentRoleId`, `roleAnalyticsEvents.roleId`

## `roles`

PostgreSQL: `roles` · 11 columns · 2 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (SET NULL) |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| description | TEXT | — |
| mustHaveSkills | JSONB | — |
| niceToHaveSkills | JSONB | — |
| knockouts | JSONB | — |
| weights | JSONB | — |
| isActive | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `screenings.roleId`

---
← Back to [[13-raw/data/erd/index|ERD Index]]