**Ready for review**

Select text to add comments on the plan



## Context

All ~411 `chatJSON` calls across 7 server files use hardcoded inline system prompts (500-2000 tokens each). The AI Skills Registry exists in DB with admin CRUD UI but is **disconnected** from actual AI calls. This wastes tokens and prevents dynamic prompt management. The fix: make `chatJSON` resolve prompts from the skill registry with a three-tier loading system.

## Three-Tier Design

|Tier|What loads|Use case|
|---|---|---|
|**1 - Metadata**|featureKey, name, description, category, keywords|Frontend feature discovery, listing available AI tools|
|**2 - Instructions**|Tier 1 + promptContent|System prompt for AI calls (default)|
|**3 - Full Context**|Tier 2 + outputFormat + constraints|Structured output validation, detailed formatting guidance|

## Implementation

### Phase 1: Core — `server/ai.ts`

1. **Add `resolveSkillPrompt()` function** with 5-minute TTL cache (same pattern as existing `resolveModel`):
    
    - Looks up `ai_skill_prompts` by featureKey via `storage.getAiSkillPromptByFeature()`
    - Returns `{ promptContent, outputFormat?, constraints? }` or null
    - Caches results to avoid DB hit per AI call
2. **Make `system` optional in `chatJSON`** signature:
    
    ```typescript
    chatJSON<T>(opts: {
      featureKey: string;
      system?: string;  // was required, now optional
      user: string;
      tier?: 2 | 3;     // new: controls how much skill context to load
    })
    ```
    
    - Resolution chain: caller-provided `system` → DB skill prompt → generic fallback
    - Tier 3 appends `outputFormat` + `constraints` to the prompt
    - **Zero breaking changes** — all existing callers still pass `system`
3. **Export `clearSkillCache()`** for cache invalidation
    

### Phase 2: Tier 1 Metadata Endpoint — `server/admin-ai-skills-registry-routes.ts`

4. **Add `GET /api/ai-skills`** (no `:featureKey`) — returns lightweight metadata array:
    
    - Query: `listAiSkillPrompts({ isEnabled: true })` then project to `{ featureKey, name, description, category, keywords }` only
    - No `promptContent` in response = minimal payload
5. **Call `clearSkillCache()`** from skill update/toggle/delete endpoints to bust stale cache
    

### Phase 3: Streaming Endpoint — `server/routes.ts:32425`

6. **Remove hardcoded system prompt** from `/api/ai/stream`:
    - Delete `system: "You are a helpful AI assistant..."`
    - Let `chatJSON` resolve from DB skill or fall back to generic

### Phase 4: Frontend Discovery Hook — `client/src/hooks/use-ai-features.ts` (new)

7. **Create `useAIFeatures()` hook** — calls `GET /api/ai-skills` for Tier 1 metadata
    - Returns `{ features, isLoading }` for UI feature listings
    - Lightweight — no prompt content loaded until an AI call is triggered

### Phase 5: Migrate Seeded Skills (5 call sites)

8. **Find call sites** for the 5 seeded featureKeys (`resume-parser`, `job-matcher`, `interview-coach`, `jd-generator`, `skill-creator`) and remove their inline `system` prompts, letting DB skill take over.

## Key Files

- [server/ai.ts](vscode-webview://19fc6h4v3qtfnca0qu1oe8qv8e3nq7km03ja2jl3bvo4jv15uhka/server/ai.ts) — Add `resolveSkillPrompt`, modify `chatJSON` (Phase 1)
- [server/admin-ai-skills-registry-routes.ts](vscode-webview://19fc6h4v3qtfnca0qu1oe8qv8e3nq7km03ja2jl3bvo4jv15uhka/server/admin-ai-skills-registry-routes.ts) — Tier 1 endpoint + cache bust (Phase 2)
- [server/routes.ts](vscode-webview://19fc6h4v3qtfnca0qu1oe8qv8e3nq7km03ja2jl3bvo4jv15uhka/server/routes.ts) — Streaming endpoint migration (Phase 3)
- [client/src/hooks/use-ai-features.ts](vscode-webview://19fc6h4v3qtfnca0qu1oe8qv8e3nq7km03ja2jl3bvo4jv15uhka/client/src/hooks/use-ai-features.ts) — New hook (Phase 4)

## Verification

1. Start dev server, confirm existing AI calls still work (system prompt passed = no behavior change)
2. Call `GET /api/ai-skills` — verify lightweight metadata response (no promptContent)
3. Call `/api/ai/stream` with a seeded featureKey (e.g., `resume-parser`) — verify it loads the DB skill prompt instead of generic
4. Call `/api/ai/stream` with an unknown featureKey — verify generic fallback works
5. Edit a skill via admin UI — verify cache busts and new prompt is used on next call
6. Check AI usage logs to confirm metrics still record correctly

Add Comment