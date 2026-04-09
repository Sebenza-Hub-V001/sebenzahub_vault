
# Skill Creator Meta-Skill — Implementation Plan

## Context

Admins need the ability to generate new AI skill prompts from natural language descriptions, making the AI Skills Registry self-extending. This adds a new admin page at `/admin/skill-creator` under the "AI Governance" nav group.

## Implementation Steps

### 1. Database Schema (`shared/schema.ts`)

Add two tables at end of file:

- **`ai_skills`**: id, name, slug (unique), description, category, keywords (jsonb), features (jsonb), instructions, constraints, outputFormat, markdownContent, sourceDescription, isActive, version, createdBy (FK users), timestamps
- **`ai_skill_usage_logs`**: id, skillId (FK), userId (FK), action, metadata (jsonb), createdAt
- Add Drizzle insert/select schemas + TypeScript types
- Run `npx drizzle-kit generate` for migration

### 2. Validation Schemas (`server/validation-schemas.ts`)

- `generateSkillSchema`: description (min 10), optional category
- `createAiSkillSchema`: name, description, category, keywords[], features[], instructions, constraints, outputFormat, markdownContent, sourceDescription
- `updateAiSkillSchema`: partial of create + optional isActive

### 3. API Routes (new `server/admin-skill-creator-routes.ts`)

|Method|Path|Purpose|
|---|---|---|
|POST|`/api/admin/ai-skills/generate`|Simulate AI generation from description|
|GET|`/api/admin/ai-skills`|List all skills (search/filter)|
|GET|`/api/admin/ai-skills/:id`|Get single skill|
|POST|`/api/admin/ai-skills`|Save new skill|
|PUT|`/api/admin/ai-skills/:id`|Update skill|
|DELETE|`/api/admin/ai-skills/:id`|Delete skill|
|PATCH|`/api/admin/ai-skills/:id/toggle`|Toggle active/inactive|
|GET|`/api/admin/ai-skills/analytics/summary`|Aggregate usage stats|

- Uses raw `pool.query()` pattern (like other admin route files)
- Generation logic in isolated `generateSkillFromDescription()` function (ready for real AI swap)
- Register in `server/routes.ts`

### 4. Frontend Page (`client/src/pages/admin/AdminSkillCreator.tsx`)

Three tabs:

- **Creator**: Textarea for goal description + category select -> Generate button -> editable preview (form fields left, markdown preview right) -> Save to Registry
- **Registry**: Search + filter table of all skills with edit/toggle/delete actions
- **Analytics**: Summary cards (total, active, invocations) + per-skill usage table

### 5. Dashboard Integration (`client/src/pages/admin/AdminDashboard.tsx`)

- Add `Sparkles` icon import
- Lazy import: `const AdminSkillCreator = lazy(() => import("./AdminSkillCreator"))`
- Nav item in "AI Governance" group: `{ href: "/admin/skill-creator", label: "Skill Creator", icon: Sparkles }`
- Route: `<Route path="/admin/skill-creator"><AdminSkillCreator /></Route>`

## Critical Files

- `shared/schema.ts` — add tables + types
- `server/admin-skill-creator-routes.ts` — new file, all endpoints
- `server/routes.ts` — register new routes
- `server/validation-schemas.ts` — add Zod schemas
- `client/src/pages/admin/AdminSkillCreator.tsx` — new page
- `client/src/pages/admin/AdminDashboard.tsx` — nav + route

## Verification

1. Navigate to `/admin/skill-creator` — page loads with 3 tabs
2. Creator tab: type description, click Generate, see structured preview, edit fields, save
3. Registry tab: new skill appears in table, can toggle/edit/delete
4. Analytics tab: shows skill counts and usage data
5. No TypeScript errors, no console errors

Add Comment