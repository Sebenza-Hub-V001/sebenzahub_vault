---
title: "Authentication System"
type: concept
created: 2026-04-07
updated: 2026-04-07
tags: [auth, security, magic-link, session]
sources: [repo-audit-2026-04-07]
status: active
confidence: high
---

# Authentication System

Sebenza Hub uses **passwordless magic-link authentication**. Users enter their email, receive a one-time link, and click it to log in. No passwords are ever stored.

## How It Works

```
1. User enters email at /login or /get-started
2. POST /api/auth/magic-link
   → Generate 32-byte random token
   → Store SHA256 hash in magic_link_tokens table
   → Send email via Resend with link: {publicUrl}/auth/verify?token={rawToken}
   → Token expires in 15 minutes

3. User clicks magic link
4. GET /auth/verify?token={rawToken}
   → Hash the token → look up in DB
   → If expired/invalid → redirect /login?error=expired_token
   → If valid:
     - Mark token as consumed (one-time use)
     - Find or create user record
     - Initialize fresh session
     - Check onboardingComplete flag
       → If FALSE → redirect /onboarding
       → If TRUE → redirect to dashboard (based on role)
```

## Key Endpoints

| Endpoint | Method | Purpose |
|----------|--------|---------|
| `/api/auth/check-email` | POST | Check email availability |
| `/api/auth/magic-link` | POST | Request magic link |
| `/api/auth/verify` | GET | Verify token and create session |

## Session Management

- **Store:** PostgreSQL (production) via `connect-pg-simple`, or in-memory (dev)
- **Cookie:** `connect.sid` (httpOnly, secure in production, sameSite=lax)
- **Timeout:** 24-hour rolling expiry based on inactivity
- **Caching:** Redis with 60-second TTL for user lookups; `invalidateUserCache(userId)` on update

## Rate Limiting

- Magic link requests: **5 per 60 seconds** per email address
- Redis key: `ratelimit:{email}` with TTL
- Falls back to in-memory map if Redis is unavailable
- Auto-pruned every 5 minutes

## Important Implementation Details

- **Verify endpoint skips session middleware** — to prevent corrupted/old session cookies from blocking login. The verify endpoint manually initializes a clean session after token validation.
- **Role is locked after onboarding** — users cannot change their role once `onboardingComplete = true`. Only Admins can force role changes.
- **No OAuth/social login in core flow** — but `connectedAccounts` and `oauthStateTokens` tables exist for optional LinkedIn/Google connections.

## Database Tables

| Table | Purpose |
|-------|---------|
| `magic_link_tokens` | Hashed tokens with expiry, optional firstName/lastName |
| `refresh_tokens` | JWT refresh tokens (present in schema, not actively used) |
| `sessions` | Express session storage |
| `connectedAccounts` | OAuth integrations (Google, LinkedIn) |
| `oauthStateTokens` | OAuth flow state management |

## Email Delivery

- **Primary:** BullMQ queue (if Redis available)
- **Fallback 1:** Resend API directly
- **Fallback 2:** Console log (development/testing)
- Branded HTML templates with CTA buttons and safety notices

## Open Questions

- Is the `refresh_tokens` table actively used or leftover from an earlier auth approach?
- What happens if a user tries to change their email?
- Is there a "remember me" / long-lived session option?

## References

- [[02-concepts/rbac]] — Permission system after authentication
- [[01-entities/individual-user]] — Individual onboarding flow
- [[01-entities/recruiter-user]] — Recruiter onboarding flow
- [[01-entities/business-user]] — Business onboarding flow
- Source: [[09-sources/repo-audit-2026-04-07]]
