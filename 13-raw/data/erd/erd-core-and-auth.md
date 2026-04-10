---
title: "ERD — Core & Auth"
type: reference
created: 2026-04-10
updated: 2026-04-10
tags: [database, erd, core-and-auth]
status: active
---

# ERD — Core & Auth

**21 tables** · **24 FK relationships** — Foundation tables: users, organisations, authentication, sessions, team management.

← Back to [[13-raw/data/erd/index|ERD Index]]

## `apiIntegrations`

PostgreSQL: `api_integrations` · 7 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| encryptedApiKey | TEXT | NOT NULL |
| isActive | BOOLEAN | — |
| lastTestedAt | TIMESTAMP | — |
| createdBy | UUID | FK → `users.id` |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `connectedAccounts`

PostgreSQL: `connected_accounts` · 10 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| profileUrl | TEXT | — |
| accessToken | TEXT | — |
| refreshToken | TEXT | — |
| tokenExpiresAt | TIMESTAMP | — |
| scopes | TEXT | — |
| lastSyncedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `magicLinkTokens`

PostgreSQL: `magic_link_tokens` · 5 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | FK → `users.id` (CASCADE) |
| expiresAt | TIMESTAMP | NOT NULL |
| consumedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

## `memberships`

PostgreSQL: `memberships` · 5 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `oauthStateTokens`

PostgreSQL: `oauth_state_tokens` · 5 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| redirectUrl | TEXT | — |
| expiresAt | TIMESTAMP | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |

## `organizationApiKeys`

PostgreSQL: `organization_api_keys` · 10 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| keyHash | TEXT | NOT NULL |
| scopes | JSONB | — |
| lastUsedAt | TIMESTAMP | — |
| expiresAt | TIMESTAMP | — |
| isActive | BOOLEAN | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| rateLimit | INTEGER | — |
| createdAt | TIMESTAMP | NOT NULL |

## `organizationBranding`

PostgreSQL: `organization_branding` · 17 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, UNIQUE, FK → `organizations.id` (CASCADE) |
| aboutUs | TEXT | — |
| linkedinUrl | TEXT | — |
| twitterUrl | TEXT | — |
| facebookUrl | TEXT | — |
| instagramUrl | TEXT | — |
| youtubeUrl | TEXT | — |
| glassdoorUrl | TEXT | — |
| careerPageUrl | TEXT | — |
| coverImageUrl | TEXT | — |
| cultureVideoUrl | TEXT | — |
| employeeTestimonials | JSONB | — |
| companyValues | JSONB | — |
| benefits | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `organizationEmailSignatures`

PostgreSQL: `organization_email_signatures` · 7 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| content | TEXT | NOT NULL |
| isDefault | BOOLEAN | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `organizationIntegrations`

PostgreSQL: `organization_integrations` · 6 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, UNIQUE, FK → `organizations.id` (CASCADE) |
| slackWebhook | TEXT | — |
| atsApiKey | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `organizationWebhooks`

PostgreSQL: `organization_webhooks` · 13 columns · 2 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| url | TEXT | NOT NULL |
| secret | TEXT | — |
| events | JSONB | — |
| isActive | BOOLEAN | — |
| retryCount | INTEGER | — |
| lastTriggeredAt | TIMESTAMP | — |
| lastStatus | INTEGER | — |
| failureCount | INTEGER | — |
| createdBy | UUID | FK → `users.id` (SET NULL) |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `organizations`

PostgreSQL: `organizations` · 8 columns · 0 FK out · 333 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| website | TEXT | — |
| logoUrl | TEXT | — |
| description | TEXT | — |
| address | TEXT | — |
| isVerified | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `memberships.organizationId`, `teamMembers.organizationId`, `interviewSettings.organizationId`, `complianceSettings.organizationId`, `organizationIntegrations.organizationId`, `jobTemplates.organizationId`, `jdDrafts.organizationId`, `salaryBands.organizationId` +325 more

## `refreshTokens`

PostgreSQL: `refresh_tokens` · 4 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| expiresAt | TIMESTAMP | NOT NULL |
| createdAt | TIMESTAMP | NOT NULL |

## `sessions`

PostgreSQL: `sessions` · 1 columns · 0 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| sess | JSONB | NOT NULL |

## `ssoConfigs`

PostgreSQL: `sso_configs` · 7 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, UNIQUE, FK → `organizations.id` (CASCADE) |
| clientSecret | TEXT | — |
| metadata | JSONB | — |
| isActive | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `teamMembers`

PostgreSQL: `team_members` · 7 columns · 2 FK out · 2 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| organizationId | UUID | NOT NULL, FK → `organizations.id` (CASCADE) |
| permissions | JSONB | — |
| invitedBy | UUID | FK → `users.id` (SET NULL) |
| roleDefinitionId | UUID | — |
| joinedAt | TIMESTAMP | — |
| createdAt | TIMESTAMP | NOT NULL |

**Referenced by:** `roleAssignments.teamMemberId`, `roleChangeRequests.targetTeamMemberId`

## `userDocuments`

PostgreSQL: `user_documents` · 8 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| fileUrl | TEXT | NOT NULL |
| fileSizeBytes | INTEGER | — |
| aiClassification | JSONB | — |
| uploadBatchId | UUID | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `userEducation`

PostgreSQL: `user_education` · 9 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| startDate | TIMESTAMP | — |
| endDate | TIMESTAMP | — |
| isCurrentlyStudying | BOOLEAN | — |
| activities | TEXT | — |
| saqaVerified | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `userExperiences`

PostgreSQL: `user_experiences` · 11 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| startDate | TIMESTAMP | — |
| endDate | TIMESTAMP | — |
| isCurrent | BOOLEAN | — |
| description | TEXT | — |
| achievements | JSONB | — |
| skills | JSONB | — |
| gapExplanation | TEXT | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `userInvoices`

PostgreSQL: `user_invoices` · 11 columns · 2 FK out · 2 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| subscriptionId | UUID | FK → `subscriptions.id` (SET NULL) |
| amountCents | INTEGER | NOT NULL |
| description | TEXT | — |
| periodStart | TIMESTAMP | — |
| periodEnd | TIMESTAMP | — |
| paymentDate | TIMESTAMP | — |
| dueDate | TIMESTAMP | — |
| metadata | JSONB | — |
| createdAt | TIMESTAMP | NOT NULL |

**Referenced by:** `billingDisputes.invoiceId`, `revenueRecognitionEntries.invoiceId`

## `userPaymentMethods`

PostgreSQL: `user_payment_methods` · 7 columns · 1 FK out · 0 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| userId | UUID | NOT NULL, FK → `users.id` (CASCADE) |
| expiryMonth | INTEGER | — |
| expiryYear | INTEGER | — |
| isDefault | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

## `users`

PostgreSQL: `users` · 7 columns · 0 FK out · 461 FK in

| Column | Type | Constraints |
|--------|------|-------------|
| id | UUID | PK |
| avatarUrl | TEXT | — |
| emailVerified | BOOLEAN | — |
| isActive | BOOLEAN | — |
| onboardingComplete | BOOLEAN | — |
| createdAt | TIMESTAMP | NOT NULL |
| updatedAt | TIMESTAMP | NOT NULL |

**Referenced by:** `magicLinkTokens.userId`, `refreshTokens.userId`, `connectedAccounts.userId`, `oauthStateTokens.userId`, `memberships.userId`, `teamMembers.invitedBy`, `jdDrafts.createdBy`, `candidateProfiles.userId` +453 more

---
← Back to [[13-raw/data/erd/index|ERD Index]]