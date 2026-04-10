---
title: "Chapter 19 — Video interviews and AI video analysis"
type: concept
created: 2026-04-09
updated: 2026-04-09
tags: [how-to, recruiter, video, interviews, ai-analysis]
status: draft
user-types: [recruiter]
---

# Chapter 19 — Video interviews and AI video analysis

Video interviews used to mean "Zoom call instead of in-person". On Sebenza Hub, video interviews are a structured product with two distinct modes — async and live — and an AI analysis layer that turns watched footage into searchable, comparable data. This chapter explains both modes, when to use which, and how to read the AI output without putting too much weight on it.

## Where it lives

| Page | What it does |
|---|---|
| `/dashboard/recruiter/video-interviews` | Set up, manage, and review video interviews |
| `/dashboard/recruiter/video-analysis` | View AI analysis results for completed videos |

## The two modes

### Async (one-way) video interviews

The candidate records themselves answering preset questions on their own time. No interviewer present. Use cases:

- **High-volume early screening** — 50 candidates can each do a 15-minute async video and you can watch them at 2x speed in your own time
- **Time zone problems** — candidate in a different time zone than your interviewers
- **Initial screening before committing interviewer time** — async video as a "show me you can talk about your work" filter

### Live video interviews

A real-time video call with one or more interviewers. The same Zoom / Teams / Meet integration from Chapter 18, but recorded and stored on the platform with the rest of the candidate's record.

Use for: standard interview rounds where back-and-forth conversation matters.

## Setting up an async interview

1. Open `/dashboard/recruiter/video-interviews` and click **+ New async interview**.
2. Pick the job you're hiring for.
3. Add 3–5 questions. Each question gets:
   - A prompt (the question text the candidate sees)
   - A response time limit (typical: 90 seconds to 3 minutes per question)
   - A retake limit (allow the candidate 1–2 retakes, then the recording is final)
4. Set the deadline by which the candidate must record.
5. Pick the candidates to send it to (single or bulk).
6. Customise the invitation email (or use a default template).
7. Send.

The candidate receives an email with a unique link. They click, allow camera access, and record their responses. Each question is recorded separately, so you can jump straight to a specific answer when reviewing.

### Async question patterns that work

- **Brief intro** (90s): "Tell me about yourself in under 90 seconds — focus on what makes you a fit for this role specifically."
- **Recent project** (3 min): "Walk me through a project from the last 12 months that you're proud of. What was your role and what did you contribute?"
- **Technical depth** (3 min): "Explain [specific technical concept relevant to the role] as if I'm a non-technical hiring manager."
- **Motivation** (90s): "Why this role? Why now? Why us specifically — what made you apply?"

Avoid:
- Yes/no questions (waste of video format)
- Questions that need a back-and-forth (those go in live interviews)
- More than 5 questions total (candidate fatigue, drop-off)

## Live video interviews

Live video interviews are scheduled the same way as any other interview (Chapter 18). The difference: the platform records the call automatically (with consent) and stores it on the candidate's record.

### Recording consent

Recording requires the candidate's explicit consent under POPIA. The platform handles this:

1. The candidate sees a consent prompt before the call starts.
2. They click "I consent to recording" or "I do not consent."
3. If they don't consent, the call still happens but isn't recorded.

Don't try to record without consent. It's both illegal and the kind of trust violation that ends an agency's reputation overnight.

### What you can do with a recording

Once a live interview is recorded, you can:

- **Re-watch** specific moments
- **Share with the hiring manager** (via the Hiring Manager Portal — Chapter 18) so they can see the candidate without you having to summarise
- **Transcribe** automatically (the platform generates a searchable transcript)
- **Run AI analysis** on the recording

## AI video analysis — `/dashboard/recruiter/video-analysis`

This is where it gets interesting. The platform's AI analyses video recordings (async or live) and produces:

- **Communication clarity** score (0–100) — based on speech rhythm, vocabulary range, structure
- **Confidence indicators** — pace consistency, filler word frequency, eye contact patterns
- **Content coverage** — does the candidate's answer actually address the question? (Surprisingly often, no.)
- **Sentiment** — overall affect during the response
- **Topic detection** — what subjects the candidate spent time on
- **Comparison view** — side-by-side AI scores across multiple candidates for the same question

### How to read AI video analysis

The AI is **good at**:

- Spotting candidates who didn't actually answer the question (they talked but said nothing)
- Identifying communication clarity differences across a large pool
- Generating searchable transcripts
- Time-stamping the moments where specific topics were discussed

The AI is **bad at**:

- Judging the *quality* of technical answers (it doesn't understand what's correct)
- Assessing intelligence or capability
- Cultural and contextual fit
- Candidates whose first language isn't English (real bias, well-documented across all video AI systems)

### The bias warning

Video AI analysis is the most demographically biased AI in the recruitment stack. Studies repeatedly show:

- Lower scores for non-native English speakers
- Lower scores for candidates with strong regional accents
- Lower scores for candidates with visible disabilities affecting speech or facial expression
- Lower scores for older candidates
- Lower scores for women on certain "confidence" metrics

**Use AI video analysis only as a sorting aid, never as a decision criterion.** The platform's Bias Auditing dashboard (managed by Sebenza Hub admins) tracks systemic bias in AI tools, but you are responsible for catching it on your individual roles.

A good rule: if you find yourself rejecting a candidate primarily because their AI video score was low, **stop and watch the video yourself**. Don't let the AI make the decision.

## Video as a metered feature

Video interview hours are metered against your plan (Chapter 4.5). The metering:

- **Async video storage** — capped per plan (older recordings auto-archive)
- **Live video recording hours** — capped per plan
- **AI video analysis runs** — each analysis consumes credits

If you're a high-volume video user, the Premium plan is significantly more cost-effective than topping up with credits. Watch the usage page weekly during high-activity months.

## When to use video, when to skip

### Use video when:

- You're screening at high volume and need a faster filter than CV-only
- The role requires strong communication (sales, customer-facing, leadership)
- The candidate is geographically distant and an in-person meeting is months away
- The hiring manager wants to "meet" candidates without scheduling 10 calls

### Skip video when:

- The role is technical and the AI analysis would only inject bias
- The candidate has stated accessibility needs that make video uncomfortable
- The role is sensitive (executive search, confidential moves) and recordings could leak
- You can do a 20-minute live call instead and learn more

## Pro tips

- **Watch the videos at 1.5x speed.** It's the right speed for review without losing nuance. 2x is too fast for content; 1x is wasted time.
- **Read the transcript first, watch the video second.** The transcript is searchable; the video gives you tone. Use both.
- **Don't share unanalysed raw videos with clients.** Edit highlights or share via the Hiring Manager Portal which controls access. Forwarding raw video files is a privacy and brand risk.
- **Always re-watch a low AI score before rejecting.** This is the most important habit in this chapter. If you reject 100 candidates based on AI scores without ever watching a low-score recording, you're flying blind on bias.
- **Async video questions should be 4 max.** 3 is better. 5 hits drop-off.

## Checklist

- [ ] You understand the difference between async and live video
- [ ] You've set up at least one async interview template (or know how to)
- [ ] You know that recording consent is mandatory under POPIA
- [ ] You understand the bias risks in AI video analysis
- [ ] You have a habit of watching videos personally before rejecting on AI score
- [ ] You're aware of your plan's video hour limits

## Next chapter

[[16-how-tos/recruiter/20-making-an-offer|Chapter 20 — Making an offer]]

## References

- [[02-concepts/ai-features]] — AI capabilities and bias warnings
- [[02-concepts/compliance]] — POPIA consent for recording
- [[16-how-tos/recruiter/18-interview-scheduling|Chapter 18 — Interview scheduling]]
- [[16-how-tos/recruiter/20-making-an-offer|Chapter 20 — Making an offer]]
- [[16-how-tos/recruiter/04.5-how-we-charge|Chapter 4.5 — How Sebenza Hub charges you]]
