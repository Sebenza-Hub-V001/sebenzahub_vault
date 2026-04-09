**Ready for review**

Select text to add comments on the plan

# 

## Context

AI skill prompts degrade over time ("prompt decay") as models evolve and use cases shift. This feature adds an admin workflow to flag stale skills (90+ days without update), display per-skill usage metrics, auto-generate optimization suggestions, and track quarterly review completion. It lives in the existing **AI Governance** admin nav section as a standalone page.

## Files to Create

1. **`server/admin-ai-skill-review-routes.ts`** -- Backend API routes
2. **`client/src/pages/admin/AdminAISkillReview.tsx`** -- Frontend page

## Files to Modify

3. **`shared/schema.ts`** -- Add `ai_skill_reviews` table (~line 18830)
4. **`server/storage.ts`** -- Add storage interface methods + DatabaseStorage implementation
5. **`server/routes.ts`** -- Register new route file (~line 60062)
6. **`client/src/pages/admin/AdminDashboard.tsx`** -- Add lazy import, nav item, route

---

## Step 1: Schema -- `shared/schema.ts`

Add `ai_skill_reviews` table after `aiSkillPrompts` (line ~18830):

|Column|Type|Notes|
|---|---|---|
|id|uuid PK|defaultRandom|
|skillId|uuid FK→ai_skill_prompts.id|onDelete cascade, notNull|
|reviewStatus|varchar(20)|'pending' / 'reviewed' / 'deferred' / 'flagged', default 'pending'|
|riskLevel|varchar(20)|'low' / 'medium' / 'high' / 'critical', default 'low'|
|reviewerNotes|text|nullable|
|reviewedBy|uuid FK→users.id|nullable|
|reviewedAt|timestamp|nullable|
|snoozedUntil|timestamp|nullable|
|quarterLabel|varchar(10)|e.g. '2026-Q2', notNull|
|autoSuggestions|jsonb|string[]|
|createdAt|timestamp|defaultNow|
|updatedAt|timestamp|defaultNow|

Indexes: unique on `(skillId, quarterLabel)`, index on `reviewStatus`, index on `quarterLabel`.

Export `AiSkillReview` and `InsertAiSkillReview` types.

---

## Step 2: Storage -- `server/storage.ts`

Add to IStorage interface and DatabaseStorage class:

- `getAiSkillReview(id: string)`
- `getAiSkillReviewBySkillAndQuarter(skillId: string, quarter: string)`
- `listAiSkillReviews(filters?)` -- quarter, status, riskLevel, pagination
- `createAiSkillReview(data: InsertAiSkillReview)`
- `updateAiSkillReview(id: string, data: Partial<InsertAiSkillReview>)`
- `getSkillReviewDashboardData(quarter: string)` -- joins ai_skill_prompts + ai_skill_reviews + usage_analytics to compute: days since update, usage counts (last 30 vs prior 30), risk level, per-skill data
- `getSkillUsageTimeSeries(featureKey: string, days: number)` -- daily usage counts for sparkline

---

## Step 3: Routes -- `server/admin-ai-skill-review-routes.ts`

|Method|Path|Purpose|
|---|---|---|
|GET|`/api/admin/ai-skill-review/dashboard`|Dashboard summary: totals, stale count, review %, risk breakdown|
|GET|`/api/admin/ai-skill-review/skills`|Enriched skill list with metrics, suggestions, review status. Params: quarter, riskLevel, reviewStatus, search|
|GET|`/api/admin/ai-skill-review/skills/:skillId/metrics`|Detailed usage time series for one skill|
|POST|`/api/admin/ai-skill-review/skills/:skillId/review`|Submit review action (reviewed/deferred/flagged + notes)|
|POST|`/api/admin/ai-skill-review/initialize-quarter`|Create pending records for all active skills (idempotent)|

**Auto-suggestion rules** (computed server-side, rule-based):

- Stale + high usage → "HIGH PRIORITY: Heavily used but not updated in 90+ days"
- Stale + low usage → "Consider retiring -- stale and rarely used"
- Stale + declining trend → "Usage declining and prompt outdated -- evaluate need"
- Declining (not stale) → "Usage dropping -- investigate prompt quality"
- High + growing → "Consider splitting into specialized sub-skills"
- Disabled → "Currently disabled -- confirm if intentional"
- Version 1 + 30+ days → "Still on v1 -- iterate based on user feedback"

**getCurrentQuarter()** helper: derives '2026-Q2' from current date.

Register in `server/routes.ts` after line 60062:

```typescript
const { registerAdminAiSkillReviewRoutes } = await import("./admin-ai-skill-review-routes");
registerAdminAiSkillReviewRoutes(app);
```

---

## Step 4: Frontend -- `client/src/pages/admin/AdminAISkillReview.tsx`

### Layout:

1. **Header** -- "AI Skill Review" title + quarter selector dropdown + "Initialize Quarter" button
2. **Dashboard cards** (4-card grid):
    - Total Skills | Stale Skills (warning color) | Review Completion % (progress bar) | Critical Risk (red)
3. **Filter bar** -- Risk level, review status, search input
4. **Skills table** -- Sortable columns:
    - Name + category badge
    - Version
    - Days Since Update (color: green <30, yellow 30-89, red 90+)
    - Usage (count + inline SVG sparkline)
    - Trend (arrow + %)
    - Risk Level badge
    - Review Status badge
    - "Review" action button
5. **Review dialog** (shadcn Dialog):
    - Skill summary (name, category, version, last updated)
    - Auto-suggestions list (lightbulb icons)
    - Action buttons: Mark Reviewed / Defer / Flag for Update
    - Notes textarea
    - Snooze date picker (for Defer)
    - "Edit Skill" link → navigates to `/admin/ai-skills-registry`

### Inline Sparkline (no deps):

SVG polyline component, ~10 lines, renders 30-day usage trend.

### React Query hooks:

- `useQuery(['/api/admin/ai-skill-review/dashboard?quarter=...'])`
- `useQuery(['/api/admin/ai-skill-review/skills?quarter=...&...'])`
- `useMutation` for review actions + quarter init

---

## Step 5: Navigation -- `AdminDashboard.tsx`

1. Add lazy import: `const AdminAISkillReview = lazy(() => import("./AdminAISkillReview"));` (after line 37)
2. Add nav item in AI Governance group (after line 97): `{ href: "/admin/ai-skill-review", label: "Skill Review", icon: ClipboardCheck }`
3. Add `ClipboardCheck` to lucide-react import (line 6-10)
4. Add route (after line 218): `<Route path="/admin/ai-skill-review"><AdminAISkillReview /></Route>`

---

## Step 6: Migration

Run `npx drizzle-kit generate` then `npx drizzle-kit push` (or the project's existing migration approach) to create the `ai_skill_reviews` table.

---

## Verification

1. Start dev server, navigate to `/admin/ai-skill-review`
2. Click "Initialize Quarter" -- should create pending review records for all skills
3. Verify dashboard cards show correct counts (stale = skills with updatedAt 90+ days ago)
4. Verify skills table shows all skills with usage metrics and risk levels
5. Click "Review" on a skill -- submit a review, verify status updates
6. Filter by risk level and review status -- confirm filtering works
7. Check that sparklines render usage data (or show flat line for zero usage)

Add Comment