---
title: "Chapter 15 — Configuring screening at the job level"
type: concept
created: 2026-04-09
updated: 2026-04-09
tags: [manual, recruiter, screening, knockouts, automation]
status: draft
user-types: [recruiter]
---

# Chapter 15 — Configuring screening at the job level

You posted a job in Chapter 11. Now we go back to one section of that form — the **vetting / screening configuration** — and treat it properly. Screening configuration is the most leveraged 15 minutes of work you do per role: a well-tuned screen rejects 70%+ of unqualified applicants automatically, leaving you with a focused shortlist instead of an inbox full of noise.

## The four screening layers

Sebenza Hub gives you four screening tools that activate at different points:

| Layer | When it runs | What it does |
|---|---|---|
| **Knockout questions** | At application time | Auto-reject anyone failing hard requirements |
| **Screening chatbot** | Right after application | Conversational AI screen of motivation and fit |
| **Assessment bundle** | After chatbot passes | Competency tests, sent automatically |
| **AI auto-scoring** | Always on | Background match scoring; doesn't reject, but ranks |

You configure all four when you create the job (Chapter 11) or by editing the job's *Vetting* section later. They run in order automatically.

## Layer 1 — Knockout questions

Knockout questions are yes/no questions that auto-reject the applicant if answered "no". They're the cheapest filter — they cost nothing per application — and they're the most effective.

### How to write good knockouts

A knockout should be:

- **Hard.** Truly disqualifying, not nice-to-have. If you'd accept "no", it shouldn't be a knockout.
- **Clear.** No ambiguity. "Do you have 5+ years of Postgres experience?" is clear; "Are you familiar with databases?" is not.
- **Verifiable.** The candidate can answer honestly. Don't ask things only an interview could discover.

### Examples that work

- "Do you have a valid South African work permit?" (immigration)
- "Are you able to work from our Sandton office at least 2 days per week?" (location)
- "Do you have at least 5 years of professional experience with [specific technology]?" (technical baseline)
- "Is your minimum salary expectation R600,000 per year or below?" (compensation alignment)
- "Do you have a current valid driver's licence?" (role requirement)

### Examples that don't work

- "Are you a hard worker?" (everyone says yes)
- "Are you familiar with agile methodologies?" (too vague to be a hard requirement)
- "Do you have leadership experience?" (subjective)

### How many knockouts

Two to four is the sweet spot. One feels token; five becomes hostile and tanks your application rate. The goal is to filter out the genuinely unqualified, not to discourage everyone.

## Layer 2 — Screening chatbot

After a candidate passes knockouts, the screening chatbot opens an automated conversational screen. The chatbot asks open-ended questions, captures answers, scores the responses, and routes the candidate to one of three outcomes:

- **Pass to human review** — strong responses, recommended for shortlist
- **Maybe** — mixed responses, your discretion
- **Reject** — clear misalignment

### Configuring the chatbot

The screening chatbot is configured via templates. You can:

1. **Use a default template** for the job's seniority and category.
2. **Customise** the questions for the specific role.
3. **Save** your customisation as a reusable template for similar roles.

Good chatbot questions are open-ended:

- "Tell me briefly about your most relevant project in the last 12 months and what your role was."
- "What would you want to learn or build in the next 6 months in this kind of role?"
- "What's your preferred working style — solo deep work, paired collaboration, or team coordination?"

The AI scores responses on relevance, depth, and signal-to-noise. Avoid yes/no questions in the chatbot — those belong in knockouts.

### When to skip the chatbot

- **Very senior or executive roles** — chatbots feel patronising at this level. Skip for C-suite, board roles, or senior leadership where the conversational screen should be a human one.
- **Roles where you want human-only screening** for quality reasons.
- **Roles where the volume is so low you'll personally review every applicant anyway.**

## Layer 3 — Assessment bundles (competency tests)

After chatbot pass, the platform can send an assessment bundle automatically. Bundles are groups of tests:

- Technical skill tests (Postgres, Python, Excel, etc.)
- Cognitive ability assessments
- Personality or work-style inventories
- Custom tests you've built (Chapter 17)

### Configuring the bundle

1. From the job's *Vetting* section, click **+ Assessment bundle**.
2. Pick from the **Test Library** — pre-built tests for common skills and roles.
3. Set the time limit per test and the order they should be sent.
4. Set the pass threshold per test (e.g. "60% on the SQL test required to advance").
5. Decide what happens on fail — auto-reject, manual review, or notify the recruiter.

### Tests and metering

Many tests draw from licensed test libraries that consume credits per administration. Check Chapter 4.5 and the billing usage page before launching a test bundle on a high-volume role — testing 200 applicants at R20 of credits each is real money.

## Layer 4 — AI auto-scoring

AI auto-scoring runs silently on every application, whether you configured it or not. It produces:

- **Match score** (0–100) — overall fit against the job requirements
- **Matched skills** — which job-required skills the candidate has
- **Missing skills** — which they don't
- **Ghost risk score** — fraud detection (suspected fake applications)

The auto-score doesn't reject anyone — it just ranks. You see it on every candidate card in the Pipeline (Chapter 16). Use it to triage, not to gate.

> ⚠️ **Don't use AI scores as the only criterion.** AI scores are useful as a sorting tool, not as a hiring decision. They can be biased against unconventional career paths, gaps, and underrepresented backgrounds. Your Diversity Analytics (Chapter 26) tracks whether your AI-assisted decisions are skewing demographics — pay attention.

## The right configuration for the right role

Different roles need different screening intensity:

| Role type | Knockouts | Chatbot | Tests | AI scoring |
|---|---|---|---|---|
| **High-volume junior** (e.g. graduate dev) | 3–4 | Yes | Yes (cheap aptitude) | On |
| **Mid-level specialist** (e.g. senior backend) | 2–3 | Yes | Yes (technical) | On |
| **Senior individual contributor** | 2 | Optional | Optional | On |
| **Leadership / executive** | 1–2 (visa, location) | No | No | On (used for context only) |
| **Confidential search** | 1 | No | No | On (you're manually triaging) |

The general rule: **the more senior the role, the lighter the automation**. Junior roles need heavy filtering because you'll get hundreds of applications. Senior roles need a human touch because the cost of rejecting a strong passive candidate is far higher than the cost of one extra interview.

## Iterating on a job's screening

Once a job is live, you can adjust the screening config based on results:

- **Too few applications?** Loosen the knockouts. Often one knockout is doing 80% of the rejecting; relax it and watch the volume increase.
- **Too many low-quality applications?** Add a knockout, sharpen the chatbot questions, or add a test.
- **Right volume but wrong fit?** Audit your AI auto-scoring against the candidates you actually shortlisted — maybe your job requirements are mis-tagged.

Sebenza Hub's `/dashboard/recruiter/requirement-check` is built for exactly this kind of audit (Chapter 25). It tells you which screening criteria are doing the rejecting and whether the rejections look right.

## Pro tips

- **Test your knockouts on yourself.** Before publishing, walk through the application as a candidate would. If a knockout question confuses *you*, it'll confuse 50% of candidates and you'll lose people who would have been good.
- **One iteration after the first 20 applications.** Don't tune the screen forever — set it, run 20 applications through it, then adjust once based on what you see. Don't tune it 5 more times after that.
- **Document the screening rationale in your client engagement notes.** When a client questions why you rejected a particular candidate, "the knockout question on work permit auto-rejected them" is a defensible answer.
- **Watch the diversity numbers.** A heavy screen reduces volume but can also unintentionally bias the funnel. Check `/dashboard/recruiter/diversity` after every job's first batch of applications.

## Checklist

- [ ] Your job has 2–4 knockout questions, and they're hard requirements not nice-to-haves
- [ ] You've decided whether the screening chatbot is appropriate for this role
- [ ] If using tests, you know how many credits each administration costs
- [ ] You understand AI auto-scoring is for ranking, not gating
- [ ] You've previewed the candidate's-eye view of the application before publishing
- [ ] You'll review the screening config after 20 applications come in

## Next chapter

[[16-manuals/recruiter/16-the-pipeline|Chapter 16 — The Pipeline (Kanban): your daily workspace]]

## References

- [[02-concepts/ai-features]] — AI scoring and chatbot capabilities
- [[02-concepts/application-lifecycle]] — Where screening sits in the full lifecycle
- [[16-manuals/recruiter/11-posting-a-job|Chapter 11 — Posting a job]]
- [[16-manuals/recruiter/16-the-pipeline|Chapter 16 — The Pipeline]]
- [[16-manuals/recruiter/17-screening-tools|Chapter 17 — Screening tools]]
