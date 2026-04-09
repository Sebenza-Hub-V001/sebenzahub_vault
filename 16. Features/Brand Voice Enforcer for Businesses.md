## Context

Businesses need all AI-generated content (JDs, emails, chatbot responses, offer letters, outreach) to consistently match their brand personality. Currently, the AI functions (`generateJobDescription`, `composeEmail`, etc.) use hardcoded tone presets ("professional", "casual", etc.) with no per-organization customization. The Brand Voice Enforcer lets each business configure a rich tone profile that automatically injects into all AI-generated content.

The system already has `analyzeToneDNA()` (8 dimensions: warmth, urgency, confidence, formality, inclusivity, innovation, authority, authenticity) which we'll leverage as the foundation.

## Architecture

### 1. Database Table — `shared/schema.ts`

Add `brandVoiceProfiles` table (one per org):

|Column|Type|Purpose|
|---|---|---|
|id|uuid PK||
|organizationId|uuid FK (unique)|One profile per org|
|toneName|varchar|Custom label (e.g. "TechCorp Formal")|
|formalityLevel|integer 1-10|Casual ↔ Formal slider|
|warmthLevel|integer 1-10|Reserved ↔ Warm|
|confidenceLevel|integer 1-10|Humble ↔ Bold|
|innovationLevel|integer 1-10|Traditional ↔ Cutting-edge|
|jargonLevel|integer 1-10|Plain language ↔ Industry-heavy|
|humorLevel|integer 1-10|Serious ↔ Playful|
|vocabulary|jsonb|Preferred words, banned words, industry terms|
|writingRules|jsonb|Array of custom rules (e.g. "Always use 'team member' not 'employee'")|
|samplePhrases|jsonb|Example phrases that capture the voice|
|contentTypeOverrides|jsonb|Per-content-type tweaks (JD more formal, emails warmer, etc.)|
|isActive|boolean|Enable/disable enforcement|
|createdAt/updatedAt|timestamps||

Add Zod validation schema + TypeScript types.

### 2. Storage Layer — `server/storage.ts`

Add to `IStorage` interface + `DatabaseStorage` class:

- `getBrandVoiceProfile(orgId: string)` → profile or undefined
- `upsertBrandVoiceProfile(orgId: string, data)` → profile

### 3. API Routes — `server/routes.ts`

|Method|Path|Purpose|
|---|---|---|
|GET|`/api/business/brand-voice`|Fetch org's voice profile|
|PUT|`/api/business/brand-voice`|Create/update voice profile|
|POST|`/api/business/brand-voice/preview`|Generate sample content using the profile|
|POST|`/api/business/brand-voice/analyze`|Score existing content against the profile|

### 4. AI Integration — `server/ai.ts`

Add helper function `buildBrandVoicePrompt(profile)` that converts the DB profile into a system prompt segment. This gets injected into:

- `generateJobDescription()` — when org has active profile
- `composeEmail()` — for outreach/offer emails
- `rewriteJDTone()` — respects brand voice instead of generic presets
- Future: screening bot, chatbot responses

Add `scoreBrandVoiceCompliance(content, profile)` — AI function that scores how well content matches the profile (0-100) with suggestions.

Add `generateBrandVoicePreview(profile, contentType)` — generates sample content in the voice for preview.

### 5. Frontend — New page `client/src/pages/business/BusinessBrandVoice.tsx`

**Standalone page** (not buried in settings tabs) because this is a strategic feature.

Sections:

1. **Voice Identity** — Name, sliders for formality/warmth/confidence/innovation/jargon/humor
2. **Vocabulary** — Preferred words, banned words, industry terms (tag inputs)
3. **Writing Rules** — Custom rules list (add/remove)
4. **Sample Phrases** — Example phrases that capture the voice
5. **Content Type Overrides** — Per-type adjustments (JD, email, offer letter, chatbot)
6. **Live Preview** — Generate sample JD/email/chatbot response using current settings
7. **Voice Score** — Paste existing content to score against profile

### 6. Navigation — `BusinessDashboard.tsx`

Add to "Communication & Automation" nav group:

```
{ href: "/dashboard/business/brand-voice", label: "Brand Voice", icon: Mic2 }
```

Add route and lazy import.

## Files to Modify

1. `shared/schema.ts` — Add table + types + validation
2. `server/storage.ts` — Add interface methods + implementation
3. `server/routes.ts` — Add 4 endpoints
4. `server/ai.ts` — Add `buildBrandVoicePrompt`, `scoreBrandVoiceCompliance`, `generateBrandVoicePreview`; modify `generateJobDescription` and `composeEmail` to accept optional brand voice
5. `client/src/pages/business/BusinessBrandVoice.tsx` — New page (full UI)
6. `client/src/pages/business/BusinessDashboard.tsx` — Add nav item + route + lazy import

## Verification

1. Start dev server, navigate to Business Dashboard
2. Click "Brand Voice" in sidebar → page loads with empty state
3. Configure sliders, vocabulary, rules → save → reload → persists
4. Click "Live Preview" → generates sample JD/email matching the configured voice
5. Paste content into "Voice Score" → returns compliance score + suggestions
6. Generate a JD via AI Writer → should reflect brand voice when profile is active

Add Comment