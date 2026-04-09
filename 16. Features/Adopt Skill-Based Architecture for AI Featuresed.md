**Ready for review**

Select text to add comments on the plan

#

## Context

The codebase already has an `ai_skill_prompts` DB table, admin CRUD routes, and a full admin UI for managing AI skills. However, the **130+ AI functions** in `server/ai.ts` all have **hardcoded prompts** — none of them use the skills registry. This plan connects those two halves with an execution engine, seeds all existing prompts into the registry, and migrates AI functions to pull prompts from the DB.

**Outcome**: Admins can edit any AI feature's behavior (prompts, constraints, output format) through the existing registry UI without code changes.

---

## Phase 1: Skill Execution Engine

### Create `server/skill-engine.ts` (~150 lines)

**Core components:**

1. **`interpolate(template, vars)`** — Replaces `{{variable}}` placeholders with input values
    
    - Supports `{{var}}`, `{{var:default}}`, `{{var|truncate:5000}}`
    - Simple regex, no library needed (~20 lines)
2. **In-memory cache** — `Map<featureKey, { skill, cachedAt }>` with 2-min TTL
    
    - Avoids DB hit on every AI call
    - `clearSkillCache(featureKey?)` export for admin route invalidation
3. **`getSkillPrompt(featureKey)`** — Cache-first lookup, falls back to `storage.getAiSkillPromptByFeature()`
    
4. **`runSkill<T>(featureKey, input, fallback)`** — Main entry point:
    
    ```
    1. Fetch skill from registry (cached)
    2. If found: interpolate promptContent with input vars, split into system/user via <!-- SYSTEM --> / <!-- USER --> markers
    3. If not found: use fallback (the original hardcoded prompt)
    4. Call chatJSON<T>({ featureKey, system, user })
    5. Return { data, skillVersion, source: "registry" | "fallback" }
    ```
    

**Prompt template convention** (stored in `promptContent`):

```
<!-- SYSTEM -->
You are a recruiting AI. Score how well a candidate matches a job.
Return JSON: { score (0-100), explanation, matchedSkills, ... }

<!-- USER -->
## Job
Title: {{jobTitle}}
Description: {{jobDescription|truncate:3000}}

## Candidate
Skills: {{candidateSkills}}
```

If no `<!-- USER -->` marker, the entire content is the system prompt and inputs are auto-formatted as `## Key\nvalue` pairs.

---

## Phase 2: Seed All Existing Skills

### Create `server/ai-skill-seeds.ts` (~2500 lines)

Extract prompts from every `chatJSON()` call in `server/ai.ts` into seed records. Each seed maps to an existing function:

|Category|Example Skills|~Count|
|---|---|---|
|recruitment|parseResume, matchCandidateToJob, screenCandidate, generateJobDescription|~15|
|interview|generateInterviewQuestions, conductAiInterview, interviewScorecard|~12|
|career|coachCandidate (all 16 coaching tools), careerPath, skillGap|~20|
|cv-analysis|improveCv, tailorCv, atsScan, keywordAnalysis, redFlags|~12|
|cover-letter|generateCoverLetter, analyzeCoverLetter, coverLetterVariants|~10|
|jd-tools|regenerateJDSection, rewriteJDTone, analyzeJDSEO|~8|
|predictive|predictHiring variants, cultureFit variants|~10|
|communication|composeEmail, whatsappMessage, outreach|~5|
|search|hybridSearch, candidateComparison, searchCopilot|~8|
|talent|reEngagement, referenceQuestions, employerBrand|~8|
|video|videoInterviewAnalysis variants|~6|
|analytics|engagementScoring, diversityAnalytics, pipelineIntelligence|~6|
|location|all location intelligence features|~6|

**Seed strategy**: Upsert by `skillKey` — insert only if not exists, preserving any admin edits.

### Modify `server/admin-ai-skills-registry-routes.ts` (~15 lines changed)

- Replace the existing 5-skill seed block with a call to `seedAllSkills()` from the new seeds file
- Add `clearSkillCache()` calls after update, delete, and toggle operations

---

## Phase 3: Migrate AI Functions (Incremental)

Refactor each function in `server/ai.ts` to use `runSkill()`. This is mechanical — the pattern for each:

**Before:**

```typescript
export async function matchCandidateToJob(candidate, job): Promise<MatchResult> {
  return chatJSON<MatchResult>({
    featureKey: "matchCandidateToJob",
    system: `You are a recruiting AI...`,
    user: `## Job\nTitle: ${job.title}\n...`,
  });
}
```

**After:**

```typescript
export async function matchCandidateToJob(candidate, job): Promise<MatchResult> {
  const result = await runSkill<MatchResult>(
    "matchCandidateToJob",
    { jobTitle: job.title, jobDescription: job.description, candidateSkills: candidate.skills.join(", "), ... },
    { system: `You are a recruiting AI...`, user: `## Job\nTitle: ${job.title}\n...` }
  );
  return result.data;
}
```

**Key properties:**

- Function signatures unchanged — **zero changes to route handlers or frontend**
- Original prompt preserved as fallback — if DB skill missing, behavior is identical to today
- Can be done one function at a time, tested individually
- Migration order: high-traffic first (parseResume, matchCandidateToJob, screenCandidate, coachCandidate suite)

---

## Files Changed

|File|Action|Description|
|---|---|---|
|`server/skill-engine.ts`|**Create**|Execution engine: interpolate, cache, runSkill|
|`server/ai-skill-seeds.ts`|**Create**|Seed data for all ~130 skills|
|`server/admin-ai-skills-registry-routes.ts`|**Modify**|Use new seeds, add cache invalidation|
|`server/ai.ts`|**Modify**|Migrate functions to use runSkill (incremental)|
|`server/routes.ts`|No change|Route handlers untouched|
|`shared/schema.ts`|No change|Existing table sufficient|
|Client code|No change|API contracts unchanged|

---

## Verification

1. **Engine unit test**: Create a skill in DB, call `runSkill()`, verify it uses the DB prompt instead of fallback
2. **Fallback test**: Call `runSkill()` with a non-existent featureKey, verify it uses the hardcoded fallback
3. **Cache invalidation**: Update a skill via admin API, verify next `runSkill()` uses the updated prompt
4. **Seed verification**: After startup, verify all ~130 skills appear in the admin registry UI
5. **E2E**: Use an existing AI feature (e.g., CV Review), then edit its skill prompt in admin, verify the changed behavior
6. **Regression**: Existing AI features continue working identically when no DB skill exists (fallback path)

Add Comment