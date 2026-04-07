---
title: "Todo"
type: overview
created: 2026-04-06
updated: 2026-04-07
tags: [tasks, tracking]
status: active
---

# Todo

## Wiki Maintenance

- [x] **Ingest raw docs** — Formally ingested all 6 raw source docs (features-inventory, individual-features, recruitment-features, ai-enhancement-opportunities, seo-plan, whatsapp-bot-training-manual)
- [x] **Resolve open questions** — Updated all 4 question pages with data from new sources (confidence raised to medium for all)
- [x] **Add job aggregation entity page** — Created [[entities/job-aggregation]] covering Adzuna + CareerJet
- [x] **Add entity page for WhatsApp Bot** — Created [[entities/whatsapp-bot]] deep-dive (20 admin tabs, flow builder, DNA analyzer)
- [x] **Cross-reference audit** — Ran lint pass, found 5 orphans and 11 gaps, fixed all
- [x] **Evolve overview** — Rewrote overview.md with deeper synthesis from all 7 sources
- [x] **Create SEO strategy concept page** — Created [[concepts/seo-strategy]]

## Remaining Wiki Work

- [ ] **Fully resolve open questions** — All 4 questions are at medium confidence; need codebase access to reach high confidence:
  - [[questions/recruiter-business-relationship]] — Need to read vendor management page code
  - [[questions/trust-tier-calculation]] — Need to find trust score calculation in server code
  - [[questions/subscription-plans]] — Need to read plans seed data and pricing page component
  - [[questions/ai-provider-selection]] — Need to read `ai_feature_configs` table and routing logic

## Future Investigations

- [ ] Read the pricing page component to document the 18 subscription plans
- [ ] Map the complete database schema relationships (ERD diagram)
- [ ] Document the BullMQ job queue — what async operations exist?
- [ ] Investigate the PWA/service worker caching strategy
- [ ] Document the Slack webhook integration
- [ ] Create a decision record for SSR/prerendering approach (Rendertron vs SSG vs Next.js)
- [ ] Document the AI prompt engineering approach — are prompts versioned?
- [ ] Create workflow pages for admin operations (WhatsApp bot setup, AI monitoring)
- [ ] Investigate WhatsApp message volume and per-message cost model
- [ ] Document the Contact CRM lifecycle and how it syncs with main application lifecycle
