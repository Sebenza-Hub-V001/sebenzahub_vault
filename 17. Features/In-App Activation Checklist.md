## Context

Founders observed that new users find the platform overwhelming: 24 chapters / ~85 features for Individuals, 34 chapters / 100+ pages for Recruiters, 15 chapters / multi-stakeholder enterprise setup for Corporates. The wiki side has been addressed with three "Quick Start" pages (`00-quick-start.md` per persona) that reduce the day-one path to three concrete actions.

The wiki fix is the smaller half. The bigger lever is **inside the product itself**: a persistent, dismissable activation checklist on the dashboard that mirrors the same three actions and tracks completion in real time. Docs help users who came looking for help; the in-app checklist catches the much larger group who never read docs and would otherwise click around blindly until they bounce.

This is an idea worth building, not a spec to ship as-is — capturing it here so it doesn't get lost.

## What it is

A persistent component on the dashboard (top-right of the main content area, or as a collapsible right-rail panel) that shows a short ordered list of actions, each with a status indicator. As the user completes each action — by doing the actual underlying behaviour, not by ticking a box — the item moves from `pending` → `complete`. Once all items are complete, the checklist collapses into a small "Welcome complete ✓" badge that the user can dismiss permanently.

The list is **per persona**, not universal:

- **Individual:** 1) Upload a CV. 2) Run CV Review. 3) View your match score on at least one job.
- **Recruiter:** 1) Fill in agency profile basics. 2) Add one client. 3) Save one job draft.
- **Corporate:** 1) Add company logo and brand colour. 2) Save one requisition draft. 3) (Optional) Invite one teammate.

Each item links directly to the page where the action happens, so the checklist is itself the navigation.

## Why it matters

Three reasons:

1. **Activation rate is the leading indicator of every other metric.** Users who complete a meaningful first action in their first session retain at much higher rates than users who don't, and the platform currently has no in-product mechanism that nudges them toward that action. Docs help; checklists *push*.
2. **It de-risks the "feature dump" problem at the source.** Both quick-start chapters and the index "Start here" callouts try to solve overwhelm at the docs layer, but the docs layer is downstream of the product. A user who lands on the dashboard and sees "1 of 3 — Upload your CV" with a button has a clear next action; a user who sees 9 sidebar sections doesn't.
3. **It generates structured activation telemetry.** Knowing how many users hit step 1 vs step 2 vs step 3 — and where they drop off — is exactly the data needed to refine the quick-starts, the onboarding flow, and the dashboard itself. There is no equivalent signal in docs analytics.

## Architecture (sketch)

Not a full spec. Enough to think about scope.

- **Storage.** Add `userActivationChecklist` table keyed by user id, with one row per `(user_id, item_key)` recording state (`pending`, `complete`, `dismissed`) and timestamps. Item keys are namespaced per persona (`individual.upload_cv`, `recruiter.add_client`, etc).
- **Detection.** Each checklist item has a server-side rule that observes the user's actual state, not a click on the checklist. Examples:
  - `individual.upload_cv` → completed when `cvs.count > 0` for that user.
  - `individual.run_cv_review` → completed when `cvReviews.count > 0`.
  - `recruiter.add_client` → completed when `clients.count > 0` for that recruiter's org.
  - `recruiter.create_job_draft` → completed when `jobs.count > 0` (any status, including draft).
- **Rendering.** A single React component that fetches the user's checklist state on dashboard mount, renders the persona-appropriate list, and links each pending item to the relevant route. Re-renders on activation events via the existing event bus.
- **Dismissal.** Once all items are complete, show a one-time celebratory state, then collapse to a small badge. Allow permanent dismissal via the badge's overflow menu — never re-show after that.

## Companion piece: empty-state CTAs

The checklist is the persistent nudge. The complement is **active empty-state CTAs** on the pages the checklist points to — so when a user lands on **My CVs** for the first time, instead of an empty list, they see a primary "Upload your first CV" action front and centre. Both pieces should ship together; either alone is half the value.

## Open questions

- **Does the checklist appear on every dashboard page, or only the home view?** Right-rail on home only is probably enough; pinning it everywhere risks feeling intrusive.
- **What happens for users who created their account before the checklist shipped?** Probably hide it for them by default — backfilling activation state is messy and the value is concentrated in net-new signups.
- **Should there be a "Show me what's next" mini-checklist after the first three items are complete** (e.g., for Individual: 4) Add a verified skill, 5) Apply to your first job)? Maybe — but only after the basic three is proven to lift activation. Don't gold-plate before measuring.
- **Should completion fire a small reward** (a toast, a confetti animation, a "Welcome aboard" email)? Trial — small celebrations boost retention but can feel patronising if overdone.

## References

- Wiki quick-start chapters that this would mirror in-product:
  - [[01 How-To Documents/individual/00-quick-start]]
  - [[01 How-To Documents/recruiter/00-quick-start]]
  - [[01 How-To Documents/corporate/00-quick-start]]
- Source spines for the journeys the checklist front-loads:
  - [[03-workflows/individual-journey]]
  - [[03-workflows/recruiter-journey]]
  - [[03-workflows/business-journey]]
