**Ready for review**

Select text to add comments on the plan

# Recruiter Capability Uplift Skills — Implementation Plan

## Context

Generic AI models perform poorly on South African-specific recruitment tasks: they confuse POPIA with GDPR, don't know BCEA thresholds, miscalculate B-BBEE scorecards, and default to US/UK salary structures instead of CTC. This plan adds 8 specialized AI skill prompts to the existing Skills Registry, bridging these knowledge gaps for recruiters.

The platform already has rich SA-specific recruiter pages (RecruiterBBBEE, RecruiterEE, RecruiterCompliance, RecruiterOfferCompliance, RecruiterDiversityAnalytics) but lacks the AI skill prompts that would power intelligent assistance on those pages.

## What Changes

**Single file modified:** `server/admin-ai-skills-registry-routes.ts`

### 1. Add 8 New Skills to `SEED_SKILLS` array (after line 181)

|#|skillKey|Category|Feature Linked To|Gap Bridged|
|---|---|---|---|---|
|1|`sa-labour-law-advisor`|compliance|sa-labour-law-advisor|BCEA/LRA/EEA specifics: earnings thresholds, s189 retrenchment, notice periods, probation myths|
|2|`bbbee-scorecard-advisor`|recruitment|bbbee-scorecard-advisor|Generic/QSE/EME scorecards, element weightings, priority elements, level calculations, verification|
|3|`ee-plan-generator`|recruitment|ee-plan-generator|EAP benchmarks, numerical targets by occupational level, barrier analysis, EEA2/EEA4 forms|
|4|`popia-recruitment-advisor`|compliance|popia-recruitment-advisor|POPIA vs GDPR distinctions, s11 lawful basis, special personal info for EE, retention schedules|
|5|`popia-candidate-communicator`|communication|popia-candidate-communicator|s18 notification templates, rejection letters with data handling, talent pool opt-in/out|
|6|`sa-salary-benchmarker`|recruitment|sa-salary-benchmarker|CTC model, PAYE/UIF/SDL, Paterson grading, regional adjustments, take-home calculations|
|7|`sa-offer-compliance-checker`|compliance|sa-offer-compliance-checker|BCEA s29 written particulars, restraint-of-trade reasonableness, leave/hours validation|
|8|`seta-skills-development-advisor`|analytics|seta-skills-development-advisor|21 SETAs, SDL levy/grants, WSP/ATR, learnership structuring, NQF alignment, B-BBEE skills multiplier|

Each skill follows the established pattern: `# Title` > `## Role` > `## Instructions` (numbered steps with SA-specific legal references) > `## Output Format` > `## Constraints`.

### 2. Fix Seeding Logic (lines 337-352)

Current logic only seeds when table is empty (`skills.length === 0`), so existing deployments won't get new skills. Change to idempotent per-key seeding:

```typescript
for (const seed of SEED_SKILLS) {
  const existing = await storage.getAiSkillPromptByKey(seed.skillKey);
  if (!existing) {
    await storage.createAiSkillPrompt(seed);
  }
}
```

### 3. Update Features Endpoint (lines 491-502)

Add 8 new feature key entries to the `/api/admin/ai-skills-registry/features` response array.

### 4. Enhance CATEGORY_KEYWORDS (line 201-209)

Add SA-specific terms:

- `compliance`: add "bcea", "lra", "eea", "labour", "offer letter", "restraint", "notice period", "probation"
- `recruitment`: add "bbbee", "b-bbee", "equity", "seta", "learnership", "salary", "ctc", "benchmarking"

## What Does NOT Change

- No schema/migration changes (existing `text` columns handle longer prompts)
- No UI changes (AdminAISkillsRegistry already supports filtering by category and browsing all skills)
- No new API routes
- No changes to `storage.ts` or `shared/schema.ts`

## Verification

1. `npx tsx server/admin-ai-skills-registry-routes.ts` — ensure no TypeScript errors
2. Start the server and confirm all 13 skills appear at `GET /api/admin/ai-skills-registry`
3. Verify the Admin AI Skills Registry page loads and shows the new skills with correct categories
4. Test category inference: the `/generate` endpoint should correctly classify SA-specific descriptions into `compliance`/`recruitment`
5. Verify idempotent seeding: restart server twice — skill count should remain 13, not duplicate

Add Comment
### The 8 New Skills

|Skill|Category|What It Fixes|
|---|---|---|
|**SA Labour Law Advisor**|compliance|BCEA thresholds, s189 retrenchment, notice periods, probation myths|
|**B-BBEE Scorecard Advisor**|recruitment|Generic/QSE/EME scorecards, priority elements, level calculations, fronting|
|**EE Plan Generator**|recruitment|EAP benchmarks, numerical targets by occupational level, EEA2/EEA4 forms|
|**POPIA Recruitment Advisor**|compliance|POPIA vs GDPR distinctions, s11 lawful bases, special personal info for EE|
|**POPIA Candidate Communicator**|communication|s18 notification templates, rejection letters, talent pool opt-in/out|
|**SA Salary Benchmarker**|recruitment|CTC model (not base salary), PAYE/UIF/SDL, Paterson grading, regional adjustments|
|**SA Offer Compliance Checker**|compliance|BCEA s29 written particulars, restraint-of-trade, probation unlawful clauses|
|**SETA & Skills Development Advisor**|analytics|21 SETAs, SDL levy/grants, WSP/ATR, learnership structuring, 2.5x B-BBEE multiplier|

Each skill follows the established `<!-- SYSTEM -->` / `<!-- USER -->` prompt convention with `{{variable}}` interpolation, and will be auto-seeded on next server startup via the existing idempotent upsert mechanism