---
title: "Chapter 7 — Adding skills, credentials, and a video intro"
type: concept
created: 2026-04-09
updated: 2026-04-20
tags: [how-to, individual, profile, skills, credentials, competency-tests, credential-gap, credential-roadmap]
status: active
user-types: [individual]
---

# Chapter 7 — Adding skills, credentials, and a video intro

A good CV gets you read. A complete profile gets you *picked*. This chapter is about everything that lives on your profile *outside* the CV file: skills with proficiency levels, verified skills, credentials, an optional video introduction, and an optional portfolio.

You don't have to do all of this in one sitting. Treat the chapter as a checklist you work through over a few days. The order matters less than the fact that you eventually do all of it.

![[13-raw/screenshots/i-ch07-profile-skills-nav.png]]

## Why this matters

Recruiters and Auto Match both filter on profile fields, not on the contents of your CV file. If your CV says "PostgreSQL" but PostgreSQL isn't in your skills list, you won't show up in a recruiter search for PostgreSQL developers. The CV file is for humans; the profile fields are for the system.

A complete profile also unlocks better matches. The more the platform knows about you, the better Auto Match's recommendations are in Chapter 9.

## Part A — Skills (with proficiency)

You added 1–10 skills during onboarding (Chapter 3). Now expand and refine that list.

### Step 1 — Add the skills that aren't there yet

Go to **Profile** (`/dashboard/individual/profile`) and find the Skills section. Add every skill that:

- Is mentioned in your CV
- You've used professionally for more than a few months
- Is relevant to the kind of role you want next

Don't add:

- Skills you've only touched once
- Personal interests that aren't job-relevant
- Buzzwords you don't actually know ("synergy", "leadership" — neither of these is a skill)

There's no hard upper limit, but somewhere between 10 and 25 well-chosen skills is the sweet spot. More than 30 starts to look like padding.

### Step 2 — Set proficiency levels honestly

Each skill takes a proficiency rating. The exact labels depend on the skill type, but they generally map to:

| Level | What it means |
|-------|---------------|
| **Beginner** | You've used it. You'd need help to ship something with it. |
| **Intermediate** | You can work independently with it. You know what you don't know. |
| **Advanced** | You're a strong contributor. People come to you with questions. |
| **Expert** | You could teach it. You've made non-obvious decisions about it under pressure. |

Most professionals are Intermediate or Advanced on most of their skills. Almost nobody is Expert on more than two or three things. If your profile shows you as Expert on ten things, recruiters will discount the entire list.

### Step 3 — Re-rate when you're wrong

Come back to this once a quarter. People consistently over-rate skills they haven't used recently and under-rate skills they use every day. Both hurt your matching.

## Part B — Skill Verifications and Competency Tests

Anyone can claim a skill. Verified skills are different — they carry a badge that's visible to recruiters and signals you've proven the skill against a standardised test.

### Competency Tests — _Tier: Free_

**What this feature is.** Competency Tests are skills tests you can take either when a recruiter assigns one as part of an application or as a self-assessment from your profile. Scores are recorded on your profile and visible to recruiters reviewing you.

**Why it matters.** Without verified skills, candidates look the same as everyone else in the pile. Free tests are critical for surfacing unknown talent — a degree-less self-taught developer proves themselves here, and a senior with two decades of experience can confirm they still know the fundamentals. Keeping tests free means no candidate gets locked out of proving they're real.

**How to use it.** Most tests come to you — when you apply to a role that uses one, the recruiter assigns it and you'll see it in your Inbox or Application Portal. To take a self-assessment, go to your **Profile** → **Skills** section, find a skill that has a test available, and click **Take test**. Tests are typically a mix of multiple choice and short structured tasks, timed, and run inside the browser. Your score sits next to the skill on your profile from then on.

![[13-raw/screenshots/i-ch07-competency-test-interface.png]]

### When to bother

Verify skills that are:

1. **Central to your target role.** A verified PostgreSQL badge helps if you're applying to backend roles. It doesn't matter if you're applying to marketing roles.
2. **Generally easy to test objectively.** Technical skills, languages, structured tools — these are well-suited to verification. "Strategic thinking" isn't.
3. **Differentiated.** A verified badge on a skill every applicant has is less useful than a verified badge on something rarer.

### How to verify

1. Go to **Skill Verifications** (`/dashboard/individual/skill-verifications`).
2. Pick a skill from your profile that has a verification test available.
3. Take the test. Tests are typically multiple choice plus short structured tasks, timed.
4. Pass → a verified badge attaches to that skill on your profile.
5. Fail → you can usually retake after a cooldown period.

> The platform calls this "blockchain-style verification" because the result is tamper-evident — you can't fake a verified badge after the fact, and recruiters can trust them.

Plan to verify 2–5 skills, not all of them. Quality over quantity.

## Part C — Credentials

Credentials are the formal stuff: certifications, degrees, licences, professional memberships.

### Step 1 — Upload what you already have

Go to **Credentials** (`/dashboard/individual/credentials`) and upload:

- Degree certificates
- Professional certifications (PMP, AWS, Google, Microsoft, CFA, ACCA, etc.)
- Trade qualifications
- Licences (driving, professional registration)
- Course completion certificates that are *substantive* — not the ones you got for finishing a 30-minute video

Each credential takes:

- A name ("BCom Accounting", "AWS Solutions Architect — Associate")
- The issuing body
- Issue date
- Expiry date (if applicable)
- The document file itself (PDF, image)
- Optionally, a verification source link

### Step 2 — Set expiry reminders

Several credentials expire (AWS certs every three years, professional registrations annually, etc.). Sebenza Hub can remind you before yours lapse — set the reminder when you upload, not later.

### Why verified credentials matter

When a recruiter sees a credential with a trust badge attached, it removes a step from screening: they don't have to chase you for the document or verify it themselves. That's often the difference between getting shortlisted and getting passed over for a candidate who made the screener's job easier.

### Step 3 — Check what's missing

Once your existing credentials are loaded, the obvious next question is: *what should I get next?* Sebenza Hub answers that with two related tools — one diagnostic, one prescriptive.

#### Credential Gap Analysis — _Tier: Standard_

**What this feature is.** Credential Gap Analysis compares your credentials — qualifications, certifications, NQF levels — against the typical requirements for your target roles in the South African market. The output is a ranked list of gaps: which credentials you're missing, how often the missing credentials block applications in your target band, and what alternatives might count.

**Why it matters.** SA hiring is credential-heavy, and many roles auto-reject on NQF level alone. This tells you whether a R30,000 certification is actually going to unlock the next tier of roles or whether it's vanity spend. The same analysis also reveals when your credentials *are* sufficient and the problem is somewhere else (CV, profile, network) — so you stop chasing certificates you don't need.

**How to use it.**

1. Go to **Credential Gap Analysis** (`/dashboard/individual/credential-gap-analysis`).
2. Confirm the target role(s) you're aiming for. The analysis pulls from your profile preferences, but you can adjust them per run.
3. Run the analysis. Results come back with each gap categorised as critical, useful, or nice-to-have.
4. Cross-reference with your own market research — the AI doesn't know about regional nuances or specific employers' quirks.

![[13-raw/screenshots/i-ch07-credential-gap-output.png]]

#### Credential Roadmap — _Tier: Premium_

**What this feature is.** Credential Roadmap is a visual, time-sequenced plan of which credentials to pursue and in what order. It includes providers, timelines, cost estimates, and the projected job-market payoff at each step — so the path from your current state to your target role becomes a concrete sequence rather than an open-ended ambition.

**Why it matters.** Credentials take months or years and can't be redone — choosing the wrong sequence is expensive in both money and time. A roadmap turns lifelong-learning anxiety into a plan with milestones you can actually measure against. This is Premium because it's the kind of thing serious career-changers will pay for once and follow for two years.

**How to use it.** Open **Credential Roadmap** (`/dashboard/individual/credential-roadmap`) — it builds on top of the gap analysis. Pick the target role, set a realistic time horizon (12 months, 24 months, longer), and the platform generates a sequenced plan. Treat it as a draft: validate provider costs and timelines yourself before committing, and revisit the roadmap every six months as your situation and the market shift.

![[13-raw/screenshots/i-ch07-credential-roadmap-timeline.png]]

## Part D — Video Profile (optional but powerful)

A 60–90 second video introduction. Recruiters can watch it before deciding to reach out.

### Should you bother?

| If… | Verdict |
|-----|---------|
| You're applying to client-facing or sales roles | **Yes — high value** |
| You're applying to leadership or management roles | **Yes — high value** |
| You're applying to creative roles where personality is part of the brief | **Yes — high value** |
| You're applying to deep technical IC roles | **Optional — modest value** |
| You hate being on camera | **Skip it — a bad video is worse than no video** |

### How to make a good one

Three things matter:

1. **Lighting.** Face a window. Don't sit with the window behind you.
2. **Sound.** Use earbuds with a mic if you have them. Bad audio kills a good video.
3. **What you say.** Three beats, in order:
   - Who you are professionally (one sentence)
   - What you're looking for (one sentence)
   - One concrete thing that makes you a strong candidate (one or two sentences)

That's it. Don't read from a script — practise three times and then record. Sixty to ninety seconds is enough.

### How to record

1. Go to **Video Profile** (`/dashboard/individual/video-profile`).
2. Either record directly in the browser or upload a video file you've recorded elsewhere.
3. Preview it. If it makes you cringe in a fixable way, re-record. If it's just first-time-on-camera awkwardness, post it anyway — it's still better than no video.

![[13-raw/screenshots/i-ch07-video-profile-recorder.png]]

## Part E — Portfolio (only if relevant)

A portfolio is a collection of actual work samples — projects, code, designs, case studies, writing.

### Should you build one?

Build a portfolio if your work is:

- **Visual** (design, photography, video, illustration)
- **Demonstrable** (open-source code, public writing, products)
- **Project-based with clear outputs** (case studies, consulting deliverables, campaigns)

Skip the portfolio if your value is mostly process-based, confidential, or relational — operations leaders, finance professionals, HR, sales — for these roles, a strong CV plus credentials does more.

### How to build one

1. Go to **Portfolio Builder** (`/dashboard/individual/portfolio-builder`).
2. Add projects. Each project takes a title, a one-paragraph description, and the work itself (file uploads, links, embedded media).
3. Organise by skill or industry — whichever helps a recruiter scan it quickly.
4. Save and share the portfolio link. You can paste it into applications and your video intro.

## What recruiters see when you're done

Once Parts A–C are done (skills + verifications + credentials), your profile is in the top tier of completeness for most Individual users. With Part D (video) and/or Part E (portfolio) on top, you stand out further, but only in roles where those add value.

The next chapter (Chapter 8) covers what's *visible* and what isn't, and the privacy controls that govern it. Read that before you go live.

## Checklist

- [ ] Added at least 10 skills with honest proficiency ratings
- [ ] Verified 2–5 of your most important skills
- [ ] Taken at least one Competency Test for a self-assessment
- [ ] Uploaded all current credentials (certs, degrees, licences) with expiry dates set
- [ ] Run Credential Gap Analysis at least once to see what's missing
- [ ] If on Premium and serious about a career step, generated a Credential Roadmap
- [ ] Decided whether you need a Video Profile and recorded one if so
- [ ] Decided whether you need a Portfolio and built one if so

## Features covered in this chapter

| # | Feature | Tier |
|---|---------|------|
| 1 | Competency Tests | Free |
| 2 | Credential Gap Analysis | Standard |
| 3 | Credential Roadmap | Premium |

## Next chapter

[[01 How-To Documents/individual/08-privacy-and-popia|Chapter 8 — Privacy and POPIA]]

## References

- [[03-workflows/individual-journey]] — Step 3 (Build Profile → Credentials & Verification)
- [[01 How-To Documents/individual/08-privacy-and-popia|Chapter 8 — Privacy and POPIA]]
