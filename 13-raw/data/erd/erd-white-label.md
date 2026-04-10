---
title: "ERD — White Label"
type: reference
created: 2026-04-10
updated: 2026-04-10
tags: [database, erd, white-label]
status: active
---

# ERD — White Label

**15 tables** · **27 FK relationships** — White-label configurations: themes, domains, email templates, branding.

← Back to [[13-raw/data/erd/index|ERD Index]]

## `whiteLabelAnalytics`

PostgreSQL: `white_label_analytics` · 9 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| metricDate | TIMESTAMP | NOT NULL |
| count | INTEGER | — |
| uniqueVisitors | INTEGER | — |
| avgLoadTime | REAL | — |
| bounceRate | REAL | — |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

## `whiteLabelAssets`

PostgreSQL: `white_label_assets` · 12 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| url | TEXT | NOT NULL |
| thumbnailUrl | TEXT | — |
| fileSizeBytes | INTEGER | — |
| dimensions | JSONB | — |
| usageContext | JSONB | — |
| isActive | BOOLEAN | — |
| sortOrder | INTEGER | — |
| uploadedBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `whiteLabelAuditLogs`

PostgreSQL: `white_label_audit_logs` · 8 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| userId | UUID | FK → `users.id` (SET NULL) |
| entityId | UUID | — |
| previousValues | JSONB | — |
| newValues | JSONB | — |
| userAgent | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |

## `whiteLabelBrandAudits`

PostgreSQL: `white_label_brand_audits` · 13 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| overallScore | INTEGER | NOT NULL |
| colorConsistencyScore | INTEGER | — |
| typographyConsistencyScore | INTEGER | — |
| logoUsageScore | INTEGER | — |
| accessibilityScore | INTEGER | — |
| messagingConsistencyScore | INTEGER | — |
| issues | JSONB | — |
| recommendations | JSONB | — |
| entityCounts | JSONB | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |

## `whiteLabelChangeRequests`

PostgreSQL: `white_label_change_requests` · 12 columns · 3 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| requestedBy | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| entityId | UUID | — |
| proposedChanges | JSONB | NOT NULL |
| currentValues | JSONB | — |
| reason | TEXT | — |
| reviewedBy | UUID | FK → `users.id` (SET NULL) |
| reviewNotes | TEXT | — |
| reviewedAt | TIMESTAMP | — |
| policyViolations | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

## `whiteLabelConfigs`

PostgreSQL: `white_label_configs` · 7 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, UNIQUE, FK → `organizations.id` (CASCADE) |
| logoUrl | TEXT | — |
| customCss | TEXT | — |
| isActive | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `whiteLabelDomains`

PostgreSQL: `white_label_domains` · 10 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| dnsRecords | JSONB | — |
| sslCertificateExpiry | TIMESTAMP | — |
| lastVerifiedAt | TIMESTAMP | — |
| isPrimary | BOOLEAN | — |
| redirectHttps | BOOLEAN | — |
| wwwRedirect | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `whiteLabelEmailTemplates`

PostgreSQL: `white_label_email_templates` · 16 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| headerHtml | TEXT | — |
| bodyHtml | TEXT | — |
| footerHtml | TEXT | — |
| colorScheme | JSONB | — |
| socialLinks | JSONB | — |
| isDefault | BOOLEAN | — |
| isActive | BOOLEAN | — |
| lastSentAt | TIMESTAMP | — |
| sendCount | INTEGER | — |
| openRate | REAL | — |
| clickRate | REAL | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `whiteLabelPageLayouts`

PostgreSQL: `white_label_page_layouts` · 14 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| layout | JSONB | — |
| headerConfig | JSONB | — |
| footerConfig | JSONB | — |
| seoConfig | JSONB | — |
| customCss | TEXT | — |
| customJs | TEXT | — |
| isActive | BOOLEAN | — |
| isPublished | BOOLEAN | — |
| publishedAt | TIMESTAMP | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `whiteLabelPolicies`

PostgreSQL: `white_label_policies` · 10 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| rules | JSONB | — |
| isActive | BOOLEAN | — |
| violationCount | INTEGER | — |
| lastTriggeredAt | TIMESTAMP | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `whiteLabelPreviewLinks`

PostgreSQL: `white_label_preview_links` · 9 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| brandSnapshot | JSONB | NOT NULL |
| themeSnapshot | JSONB | — |
| expiresAt | TIMESTAMP | NOT NULL |
| viewCount | INTEGER | — |
| maxViews | INTEGER | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |

## `whiteLabelThemes`

PostgreSQL: `white_label_themes` · 14 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | FK → `organizations.id` (CASCADE) |
| description | TEXT | — |
| isDefault | BOOLEAN | — |
| isActive | BOOLEAN | — |
| colors | JSONB | — |
| typography | JSONB | — |
| spacing | JSONB | — |
| effects | JSONB | — |
| previewImageUrl | TEXT | — |
| cssOverrides | TEXT | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `whiteLabelVariantAssignments`

PostgreSQL: `white_label_variant_assignments` · 4 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| variantId | UUID | NOT NULL, FK → `whiteLabelVariants.id` (CASCADE) |
| entityId | UUID | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |

## `whiteLabelVariants`

PostgreSQL: `white_label_variants` · 13 columns · 2 FK out · 1 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| parentVariantId | UUID | — |
| isMaster | BOOLEAN | — |
| brandOverrides | JSONB | — |
| themeId | UUID | — |
| domainId | UUID | — |
| emailTemplateIds | JSONB | — |
| metadata | JSONB | — |
| isActive | BOOLEAN | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `whiteLabelVariantAssignments.variantId`

## `whiteLabelVersions`

PostgreSQL: `white_label_versions` · 9 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| entityId | UUID | NOT NULL |
| versionNumber | INTEGER | NOT NULL |
| snapshot | JSONB | NOT NULL |
| changeSummary | TEXT | — |
| isCurrentVersion | BOOLEAN | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |

---
← Back to [[13-raw/data/erd/index|ERD Index]]