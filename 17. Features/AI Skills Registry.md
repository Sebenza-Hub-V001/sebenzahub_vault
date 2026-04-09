
# AI Skills Registry — Implementation Plan

## Context

The platform has hardcoded AI prompts scattered across features. This registry decouples AI behavior from code by storing reusable AI skill prompts in a database table. Admin can add/edit/disable/duplicate skills per feature, enabling rapid iteration without code changes.

## Architecture

- **Single table**: `aiSkillPrompts` stores structured prompt templates
- **Admin CRUD page**: Under AI Governance in admin dashboard
- **Public API**: `GET /api/ai-skills/:featureKey` for AI services to fetch active prompts
- **Seed data**: 5 pre-built skills (skill-creator, resume-parser, job-matcher, interview-coach, jd-generator)

---

## Implementation Steps

### 1. Schema (`shared/schema.ts`)

Append after line 18746:

- `aiSkillPrompts` table: id, skillKey (unique), name, description, category, featureKey, promptContent, outputFormat, constraints, keywords (jsonb), version, isEnabled, createdBy, timestamps
- Indexes on skillKey, featureKey, category, isEnabled
- Zod schemas + TypeScript types

### 2. Storage (`server/storage.ts`)

- Add to IStorage interface: getAiSkillPrompt, getAiSkillPromptByKey, getAiSkillPromptByFeature, listAiSkillPrompts, createAiSkillPrompt, updateAiSkillPrompt, deleteAiSkillPrompt
- Implement in DatabaseStorage class with standard Drizzle patterns
- listAiSkillPrompts supports filtering by category, featureKey, isEnabled, search text

### 3. Routes (new: `server/admin-ai-skills-registry-routes.ts`)

Admin endpoints (requireAuth):

- `GET /api/admin/ai-skills-registry` — list with filters
- `GET /api/admin/ai-skills-registry/:id` — get single
- `POST /api/admin/ai-skills-registry` — create
- `PUT /api/admin/ai-skills-registry/:id` — update (auto-increment version if promptContent changes)
- `DELETE /api/admin/ai-skills-registry/:id` — delete
- `POST /api/admin/ai-skills-registry/:id/toggle` — enable/disable
- `POST /api/admin/ai-skills-registry/:id/duplicate` — clone skill

Public endpoint:

- `GET /api/ai-skills/:featureKey` — get active skill for feature (used by AI services)

### 4. Route Registration (`server/routes.ts`)

Dynamic import + register call after wiki routes.

### 5. Admin Page (new: `client/src/pages/admin/AdminAISkillsRegistry.tsx`)

4-tab layout:

- **Overview**: Stats cards (total, active, by category/feature), recent skills
- **Registry**: DataTable with search/filter, row actions (edit, toggle, duplicate, delete)
- **Skill Editor**: Full form with markdown textarea for promptContent, category/feature selects
- **Skill Creator**: Meta-skill UI — enter a goal, generate a structured skill template

### 6. Navigation (`client/src/pages/admin/AdminDashboard.tsx`)

- Lazy import `AdminAISkillsRegistry`
- Add nav item under "AI Governance": `{ href: "/admin/ai-skills-registry", label: "AI Skills Registry", icon: Sparkles }`
- Add `<Route>` in Switch block
- Import `Sparkles` from lucide-react

### 7. Seed Data

Seed 5 skills inline during route registration or as a separate seed function:

- skill-creator-meta-skill (meta), resume-parser (recruitment), job-matcher (recruitment), interview-coach (interview), jd-generator (recruitment)

---

## Key Files

|File|Action|
|---|---|
|`shared/schema.ts`|Add table + types (append)|
|`server/storage.ts`|Add interface methods + implementations|
|`server/admin-ai-skills-registry-routes.ts`|New file — all endpoints|
|`server/routes.ts`|Register new routes|
|`client/src/pages/admin/AdminAISkillsRegistry.tsx`|New file — admin page|
|`client/src/pages/admin/AdminDashboard.tsx`|Add nav + route|

## Verification

1. Run `npm run db:push` to apply schema
2. Start dev server, verify admin page loads at `/admin/ai-skills-registry`
3. Test full CRUD: create skill, edit, toggle, duplicate, delete
4. Verify `GET /api/ai-skills/:featureKey` returns active skill
5. Test seed data appears on first load

Add Comment