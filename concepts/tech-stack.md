---
title: "Tech Stack"
type: concept
created: 2026-04-07
updated: 2026-04-07
tags: [technology, architecture, infrastructure, stack]
sources: [repo-audit-2026-04-07]
status: active
confidence: high
---

# Tech Stack

Sebenza Hub is a full-stack TypeScript monorepo with `client/`, `server/`, and `shared/` directories.

## Architecture Overview

```
┌─────────────────────────────────────────────────┐
│                  CLIENT (React)                  │
│  React 18 + TypeScript + Vite + Tailwind CSS     │
│  Radix UI components, wouter routing             │
│  PWA with service worker                         │
└──────────────────────┬──────────────────────────┘
                       │ /api/* and /auth/*
┌──────────────────────▼──────────────────────────┐
│                  SERVER (Express)                 │
│  Express.js + TypeScript                         │
│  120 route files, 3586 API endpoints             │
│  Session auth, RBAC middleware                   │
└──────────────────────┬──────────────────────────┘
                       │
┌──────────────────────▼──────────────────────────┐
│                  DATA LAYER                       │
│  PostgreSQL (Neon serverless) + Drizzle ORM      │
│  755 tables, 28 migrations                       │
│  Redis (BullMQ queues, caching, rate limiting)   │
│  Cloudflare R2 (file storage)                    │
└─────────────────────────────────────────────────┘
```

## Frontend

| Technology | Version | Purpose |
|-----------|---------|---------|
| React | 18.3.1 | UI framework |
| TypeScript | 5.6.3 | Type safety |
| Vite | - | Build tool and dev server |
| Tailwind CSS | 3.4.17 | Utility-first CSS |
| Radix UI | 20+ packages | Accessible component primitives |
| wouter | 3.3.5 | Lightweight client routing |
| TanStack React Query | 5.60.5 | Server state management |
| React Hook Form | 7.54.2 | Form management |
| Zod | 3.24.1 | Schema validation |
| Framer Motion | 11.15.0 | Animations |
| Recharts | 2.15.0 | Charts and data visualization |
| Lucide React | - | Icon library |

**Code splitting:** Vendor chunks for react, recharts, framer-motion, react-query, radix-ui.
**PWA:** Service worker with NetworkFirst caching strategy, auto-update.

## Backend

| Technology | Version | Purpose |
|-----------|---------|---------|
| Express.js | - | HTTP server framework |
| TypeScript | 5.6.3 | Type safety |
| Drizzle ORM | 0.39.1 | Database ORM |
| express-session | 1.18.1 | Session management |
| connect-pg-simple | 10.0.0 | PostgreSQL session store |
| Helmet | 8.1.0 | Security headers |
| CORS | 2.8.5 | Cross-origin resource sharing |
| express-rate-limit | 8.2.1 | Rate limiting |
| Compression | - | Gzip/Brotli response compression |
| ws | 8.18.0 | WebSocket support |
| BullMQ | 5.61.0 | Job queue (Redis-backed) |
| ioredis | 5.4.2 | Redis client |
| Multer | 2.1.0 | File upload handling |

## Database

| Technology | Purpose |
|-----------|---------|
| PostgreSQL (Neon) | Primary data store (serverless) |
| Drizzle ORM | Type-safe queries and schema |
| Drizzle Kit | 0.30.1 — Migration management |
| Redis | Caching, rate limiting, job queue |

**Schema:** 755 tables defined in `shared/schema.ts`
**Migrations:** 28 files in `migrations/`

## File Processing

| Library | Purpose |
|---------|---------|
| pdf-lib, pdf-parse | PDF creation and parsing |
| mammoth | Word document (.docx) to HTML |
| docx | Word document generation |
| csv-parse | CSV parsing |
| sharp | 0.34.5 — Image processing |

## AI Providers

| Provider | SDK | Version |
|----------|-----|---------|
| OpenAI | openai | 4.77.0 |
| Anthropic Claude | @anthropic-ai/sdk | 0.78.0 |
| Google Gemini | @google/generative-ai | 0.24.1 |

## External Services

| Service | Purpose |
|---------|---------|
| Resend | 4.0.1 — Email delivery (magic links, notifications) |
| Cloudflare R2 | File storage (CVs, logos, documents) via @aws-sdk/client-s3 |
| Adzuna API | Job aggregation |
| CareerJet API | Job aggregation |
| LinkedIn API | Lead import, profile verification |
| WhatsApp Business API | Messaging, chatbots, apply-via-WhatsApp |
| Slack | Webhook notifications |
| Apify | Web scraping |

## Hosting & Deployment

| Component | Technology |
|-----------|-----------|
| Hosting | Railway.app |
| CI/CD | GitHub Actions → Railway webhook |
| Build | nixpacks (Railway) |
| Deploy branch | `claude/build-sebenza-hub-website-559Nz` |
| Production URL | `sebenzahub.co.za` |
| Staging URL | `sebenzahubclaudev2-staging.up.railway.app` |

## Testing

| Framework | Purpose |
|-----------|---------|
| Playwright | 1.59.1 — E2E testing (66 test suites) |
| Static analysis | Custom scripts in `scripts/static-analysis/` |

Test configurations: UI, API, E2E, AI-quality, WhatsApp-specific.

## Performance Optimizations

- Gzip/Brotli compression (threshold 1KB)
- Static assets with 1-year max-age cache
- Vite code splitting by vendor
- Service worker with NetworkFirst strategy
- Node.js 4GB heap for development
- Database connection pooling via Neon serverless

## References

- [[entities/sebenza-hub]] — Platform overview
- [[concepts/authentication]] — Auth tech details
- Source: [[sources/repo-audit-2026-04-07]]
