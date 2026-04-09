---
title: "Chapter 17 — I'm not getting responses"
type: concept
created: 2026-04-09
updated: 2026-04-09
tags: [manual, individual, troubleshooting]
status: draft
user-types: [individual]
---

# Chapter 17 — "I'm not getting responses"

You've followed Parts 1–4. You've applied to a reasonable number of jobs. Weeks have gone by and the response rate is approximately zero. This is the most common job-search problem, and it's almost always fixable — but only if you diagnose the actual cause instead of guessing.

What follows is a structured troubleshooting guide. Don't skip the diagnosis step.

## First — be sure the problem is real

Before you change anything, check that you've actually given the system enough data to draw a conclusion.

| Question | Answer |
|----------|--------|
| How many applications have you submitted? | If fewer than 10, it's too early to tell. Apply more, then come back. |
| Over how many weeks? | If less than 2 weeks, it may be too early. Many roles take 2–3 weeks to start screening. |
| What's a "response"? | Any human contact — even a "thanks but no" — counts. Auto-acknowledgements don't. |

If you have 10–20 applications across 2+ weeks and you're getting close to zero responses, then yes, there's something to fix.

## Step 1 — Diagnose using Application Analytics

Open **Application Analytics** (`/dashboard/individual/application-analytics`). Don't skip this. Without the data, you'll guess at the wrong cause.

Look for:

- **Stage distribution.** What fraction of your applications have moved past `Applied`?
- **Response rate.** What percentage of applications got any human response?
- **Stage where you're getting stuck.** Are most rejections at screening, at interview, or after the first conversation?
- **Source breakdown.** Are Auto Match applications doing better or worse than Manual Search applications? What about referrals?

The pattern in the data tells you what to fix. Three common patterns:

| Pattern | What it suggests |
|---------|-------------------|
| Almost all applications stuck at `Applied`, no responses | The problem is *targeting* — you're applying to wrong-fit roles, or your profile/CV isn't surfacing |
| Some movement to screening but lots of rejection there | The problem is the *CV* — it gets seen but not selected |
| Get to interviews but rarely past the first round | The problem is *interview performance* — see Chapter 13 |

Pick the most likely cause based on your actual data, not your worst-case fear.

## Cause A — Wrong jobs (targeting)

If you're not even getting screened, the AI doesn't think you're a fit and neither do recruiters. The fix is on the targeting side, not the application side.

### Diagnostic questions

- What's the typical AI Match Score on the jobs you're applying to?
- Are you applying to roles a level above where your experience supports?
- Are you applying to roles in industries you haven't worked in before?
- Are most of your applications coming from manual search, where you might be ignoring the AI's filtering?

### Fixes

1. **Trust Auto Match more.** Apply to jobs with match scores above 70 and see if response rates improve. If they do, the problem was that you were applying too widely.
2. **Tighten your target role.** If your onboarding job title is too generic, change it to something more specific. "Engineer" matches everything; "Senior Backend Engineer (PostgreSQL)" matches the right things.
3. **Update your skills list.** If your matched-skills list is consistently small on the applications you've made, the AI doesn't see you as a fit. Add the relevant skills that are actually in your CV (Chapter 7).
4. **Re-rate proficiency honestly.** If you've over-rated yourself as Expert across the board, recruiters will be skeptical. Bring it down to where you actually are.
5. **Set Career DNA and Opportunity Weights.** These go further than basic skills — see Chapter 21.

After making changes, give it another 2 weeks and 10+ applications before re-evaluating.

## Cause B — Weak CV

If you're getting screened but rejected at the screening stage, the CV is the bottleneck. People are reading it and saying no.

### Diagnostic questions

- When did you last run CV Review (Chapter 6)?
- Did you actually act on the feedback, or just glance at it?
- Is your CV one generic version, or tailored to the kind of role you want?
- Does your CV file pass an ATS (Applicant Tracking System)?

### Fixes

1. **Re-run CV Review.** Read the feedback this time. Action it.
2. **Run Skill Gap Analysis** (`/dashboard/individual/skill-gap`). It compares your skills to your target role and tells you what's missing. The missing items are usually exactly what's hurting you on screening.
3. **Tailor a CV for one specific role you want.** Don't apply with a generic CV to a senior role; rewrite it with that role in mind. This is the highest-ROI thing you can do if your problem is screening.
4. **Switch to an ATS-friendly template.** If you're using a fancy template with tables and columns, replace it with a Modern or Professional template from CV Templates (Chapter 5). Many ATS systems can't read decorative layouts.
5. **Have a human read your CV.** Ideally someone who hires for the kind of role you're going after. AI feedback is good but not perfect.

## Cause C — Profile gaps

If your CV is good but your profile fields are incomplete, you might be invisible in recruiter searches. Recruiters search the profile, not the CV file.

### Diagnostic questions

- How many skills are on your profile (vs in your CV)?
- Have you verified any skills?
- Do you have credentials uploaded?
- Is your profile set to public?
- When did you last update your profile?

### Fixes

1. **Make sure your profile is public** (Chapter 8). If it's private, recruiters cannot search for you. The only applications they'll see are the ones you submit yourself.
2. **Add every relevant skill** from your CV to your profile, with honest proficiency levels (Chapter 7).
3. **Verify 2–5 high-value skills.** A verified badge is a strong filter signal recruiters use.
4. **Upload credentials.** Even old ones — degrees and certifications you take for granted aren't visible to the platform until you upload them.
5. **Add a video profile** (Chapter 7) if you're applying to client-facing or leadership roles. It's a small signal but it does shift response rates.

## Cause D — Coaching helps when you're stuck on diagnosis

If you've done the above and you're still stuck, try **AI Coaching** (`/dashboard/individual/coaching`). It's a structured conversation tool that asks you about your situation, your goals, and your constraints, and then suggests specific next steps. It's most useful when you don't yet know what your real problem is — not when you already do.

## When the problem isn't you

Sometimes the market is the problem, not your profile or your CV. Specifically:

- **Sector-wide hiring freezes.** If your industry is contracting, applications go unanswered for everyone. Look at hiring trends in adjacent sectors.
- **Seasonal lulls.** December and early January are dead in South Africa. Late January through March is much busier.
- **Geographic mismatch.** If you're applying to roles outside your city without remote being on the table, expect lower response rates.
- **Niche specialism.** Very specific niches have fewer roles. Lower response *volume* doesn't mean lower response *rate per fitting role*.

If you've checked all the above and the data still says it's the market, your two options are:

1. **Wait it out**, keeping applications going at a sustainable pace
2. **Broaden the target** — adjacent industries, related role types, more locations, remote-friendly roles

Both are legitimate. Don't grind in the same narrow target for months hoping the market will change.

## What not to do

- **Don't apply to twice as many jobs.** If your conversion rate is broken, doubling the volume just doubles the wasted effort. Fix the rate first.
- **Don't rewrite your CV every week.** Make one well-considered set of changes, give it 2+ weeks of new applications, then re-evaluate.
- **Don't spiral.** Job hunting is genuinely hard. The fact that you're not getting responses is not personal information about your worth. It's information about your current targeting and presentation, which are both changeable.

## Pick one fix and try it for two weeks

The single biggest mistake at this point is changing too many things at once. If you fix five things and your response rate goes up, you don't know which fix worked, and you can't repeat it for the next person who needs to know.

Pick the one cause that best matches your data. Make the fix. Apply 10+ jobs over the next 2 weeks. Re-check Application Analytics. *Then* decide whether to fix more.

## Checklist

- [ ] Reviewed Application Analytics and identified the actual pattern
- [ ] Picked one cause (A, B, C, or D) based on the data
- [ ] Took the recommended action for that cause
- [ ] Resisted the urge to change everything at once
- [ ] Set a date 2 weeks out to re-evaluate

## Next chapter

[[16-manuals/individual/18-no-direction|Chapter 18 — "I don't know what to apply for"]]

## References

- [[01-entities/individual-user]] — Coaching, CV Review, Skill Gap, Application Analytics
- [[03-workflows/individual-journey]] — Track A: AI Assistance scenarios
- [[16-manuals/individual/06-cv-review|Chapter 6]] — CV Review
- [[16-manuals/individual/07-skills-credentials-video|Chapter 7]] — Profile completeness
- [[16-manuals/individual/12-tracking-applications|Chapter 12]] — Application Analytics
