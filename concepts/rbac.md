---
title: "Role-Based Access Control (RBAC)"
type: concept
created: 2026-04-07
updated: 2026-04-07
tags: [rbac, permissions, security, roles]
sources: [repo-audit-2026-04-07]
status: active
confidence: high
---

# Role-Based Access Control (RBAC)

Sebenza Hub uses a two-layer permission system: **platform roles** (which user type you are) and **organization roles** (what you can do within a team).

## Platform Roles

Set on `users.role` field. Determines which dashboard and features you see.

| Role | Value | Description |
|------|-------|-------------|
| Individual | `"individual"` | Job seeker — default role for new users |
| Recruiter | `"recruiter"` | Recruitment agency professional |
| Business | `"business"` | Employer / corporate HR |
| Admin | `"admin"` | Platform operator — **bypasses all permission checks** |

### Route Protection

```
requireAuth          → Any authenticated user
requireRole("admin") → Admin only
requireRole("recruiter", "business", "admin") → Multiple roles
```

Middleware defined in `/server/auth-middleware.ts`:
- `authenticateSession(req, res, next)` — Validates session, loads user
- `requireAuth` — Requires any authenticated user
- `requireRole(...roles)` — Requires specific role(s)

## Organization Roles

For Recruiters and Businesses who work in teams. Set on `memberships.role`.

| Role | Level | Description |
|------|-------|-------------|
| Owner | Highest | Full control, cannot be removed |
| Admin | High | Administrative access |
| Manager | Medium | Team management |
| Recruiter | Medium | Limited to recruitment functions |
| Viewer | Low | Read-only access |
| Member | Default | Standard team member |

## Granular Permissions

The RBAC system (`/server/rbac.ts`) defines **40+ permissions** across categories:

| Category | Example Permissions |
|----------|-------------------|
| Jobs | `jobs:create`, `jobs:view`, `jobs:edit`, `jobs:delete`, `jobs:publish`, `jobs:archive` |
| Candidates | `candidates:view`, `candidates:create`, `candidates:edit`, `candidates:import`, `candidates:export` |
| Pipeline | `pipeline:view`, `pipeline:manage`, `pipeline:configure` |
| Interviews | `interviews:view`, `interviews:schedule`, `interviews:feedback`, `interviews:manage` |
| Offers | `offers:view`, `offers:create`, `offers:approve`, `offers:send` |
| Clients | `clients:view`, `clients:manage`, `clients:contracts` |
| Billing | `billing:view`, `billing:manage` |
| Analytics | `analytics:view` |
| Team | `team:invite`, `team:manage`, `team:roles` |
| Communications | `comms:email`, `comms:templates`, `comms:bulk` |
| Data | `data:pii_access`, `data:export`, `data:delete` |
| Audit | `audit:view` |

Permissions are stored in `teamMembers.permissions` as a JSONB array, and in `roleDefinitions` as reusable templates per organization.

## How Permissions Are Checked

```
Request → authenticateSession (load user)
       → requireRole (check platform role)
       → resolveOrgContext (determine which organization)
       → checkPermission (verify granular permission)
       → Handler executes
```

The `resolveOrgContext` middleware:
- Adds `req.orgContext: { organizationId, organizationType }`
- Adds `req.memberships: [{ organizationId, userId, role, permissions }]`
- Enforces data isolation — user cannot access another org's data

## Admin Bypass

Admin users (`users.role = "admin"`) bypass all permission checks entirely. They can:
- Access all `/admin/*` endpoints
- View/modify any user, job, application, or organization
- Force role changes post-onboarding
- Toggle features, manage billing, generate compliance reports

## Role Locking

Users cannot change their own role after onboarding:

```typescript
if (role && req.user.onboardingComplete) {
  return res.status(403).json({ message: "Role cannot be changed after onboarding" });
}
```

Only Admin can force role changes via separate admin endpoints.

## Open Questions

- Can custom `roleDefinitions` override the default permission set?
- Are there any "super-admin" vs "regular admin" distinctions?
- How are permission conflicts resolved (e.g., team role says "viewer" but custom permissions include "jobs:create")?

## References

- [[concepts/authentication]] — How users get authenticated before RBAC kicks in
- [[concepts/multi-tenancy]] — Organization model that RBAC operates within
- [[entities/admin-user]] — Admin role that bypasses RBAC
- [[entities/business-user]] — Team permission management
- Source: [[sources/repo-audit-2026-04-07]]
