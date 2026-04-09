
## Context

When a Business creates a Job Description, they currently have no quick way to distribute it across channels. This feature auto-generates platform-specific content from a JD: WhatsApp broadcast text, LinkedIn post, email snippet, and SMS summary. This reduces manual effort and ensures consistent messaging across recruitment channels.

## Architecture

### Approach: New page + API endpoint following existing AI patterns

The codebase already has a well-established pattern:

- **Frontend**: Mutation-based generation with `useMutation` + `apiRequest` (see `AIMotivationLetterGenerator.tsx`)
- **Backend**: `chatJSON<T>()` from `server/ai.ts` for structured AI output with provider-agnostic model resolution
- **UI**: Tabs for multi-format output, copy-to-clipboard with toast feedback

### Files to Create

1. **`client/src/pages/business/BusinessContentRepurpose.tsx`** — New page component
    
    - Job selector dropdown (fetches from `/api/jobs/my`)
    - "Generate All" button that calls the API
    - Tabbed output: WhatsApp | LinkedIn | Email | SMS
    - Each tab has: generated content display, Copy button, character count
    - Loading state with `Loader2` spinner
2. **No new server AI function needed in `ai.ts`** — use `chatJSON` directly in the route handler with a well-crafted prompt
    

### Files to Modify

3. **`server/routes.ts`** — Add endpoint:
    
    - `POST /api/ai/jd/content-repurpose` — accepts `{ jobId: string }`, fetches full job, calls `chatJSON` with platform-specific formatting instructions, returns `{ whatsapp, linkedin, email, sms }`
    - Auth: `requireRole("recruiter", "business", "admin")`
    - Uses `isAIAvailable()` guard
4. **`client/src/pages/business/BusinessDashboard.tsx`** — Wire up:
    
    - Add nav item under "Post Jobs" group: `{ href: "/dashboard/business/content-repurpose", label: "Content Repurpose", icon: Share2 }`
    - Add lazy import + `<Route>` for the new page

## Implementation Details

### API Endpoint (`POST /api/ai/jd/content-repurpose`)

```
Input: { jobId: string }
Process:
  1. Fetch job from storage.getJob(jobId)
  2. Build a combined text from job.title, job.core, job.compensation, job.roleDetails
  3. Call chatJSON with system prompt instructing 4 platform outputs
  4. Return structured JSON
Output: {
  whatsapp: string,   // ~300 chars, emoji-friendly, casual, includes apply link placeholder
  linkedin: string,   // ~600 chars, professional, hashtags, engaging hook
  email: string,      // Subject + body, formal, includes key details
  sms: string         // ~160 chars, ultra-concise, link placeholder
}
```

### Frontend Component

- Uses `useQuery` to fetch `/api/jobs/my` for job list
- Select component to pick a job
- Single `useMutation` call to generate all 4 formats at once
- Tabs component with 4 tabs, each showing:
    - Content in styled `<div>` with `whitespace-pre-wrap`
    - Copy button (navigator.clipboard + toast)
    - Character count badge
- Follows existing patterns from `AIMotivationLetterGenerator.tsx`

## Verification

1. Navigate to Business Dashboard > Post Jobs > Content Repurpose
2. Select an existing job from dropdown
3. Click Generate — all 4 tabs should populate
4. Test Copy button on each tab
5. Verify character counts are appropriate per platform
6. Test with no AI key configured (should show 503 error gracefully)

Add Comment