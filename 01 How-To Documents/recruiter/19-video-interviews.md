---
title: "Chapter 19 — Video interviews and AI video analysis"
type: concept
created: 2026-04-09
updated: 2026-04-20
tags: [how-to, recruiter, video, interviews, ai-analysis, sentiment, behavioral, conversational-ai, authenticity]
status: draft
user-types: [recruiter]
---

# Chapter 19 — Video interviews and AI video analysis

Video interviews used to mean "Zoom call instead of in-person". On Sebenza Hub, video interviews are a structured product with two distinct modes — async and live — wrapped in an AI analysis layer that turns watched footage into searchable, comparable data. This chapter walks through the platform itself, the conversational AI that can run a first-round interview without a human, and the eight analysis features that read the resulting recordings.

## Where it lives

| Page | What it does |
|---|---|
| `/dashboard/recruiter/video-interviews` | Set up, manage, and review video interviews |
| `/dashboard/recruiter/video-analysis` | View AI analysis results for completed videos |

## The platform itself

### Video Interviews — _Tier: Standard_

**What this feature is.** A built-in video interview platform with recording, transcripts, and shareable links — async and live both.

**Why it matters.** Recruiters currently juggle Zoom + Calendly + Loom + a folder of recordings somewhere. One built-in platform cuts tool sprawl and keeps every video artefact tied to the candidate record where you (and the hiring manager) can find it later.

**How to use it.** Open `/dashboard/recruiter/video-interviews` to set up either mode. The rest of this chapter walks through the modes, the conversational AI option, and the analysis features.

![[13-raw/screenshots/r-ch19-video-interview-session.png]]

## The two modes

### Async (one-way) video interviews

The candidate records themselves answering preset questions on their own time. No interviewer present. Use cases:

- **High-volume early screening** — 50 candidates can each do a 15-minute async video and you can watch them at 2x speed in your own time
- **Time zone problems** — candidate in a different time zone than your interviewers
- **Initial screening before committing interviewer time** — async video as a "show me you can talk about your work" filter

### Live video interviews

A real-time video call with one or more interviewers. The same Zoom / Teams / Meet integration from Chapter 18, but recorded and stored on the platform with the rest of the candidate's record.

Use for: standard interview rounds where back-and-forth conversation matters.

### AI Conversational Interview — _Tier: Premium_

**What this feature is.** A fully AI-conducted conversational interview — no human interviewer required. The AI talks to the candidate, asks role-relevant questions, adapts to answers, and produces a transcript, scores, and a hiring recommendation.

**Why it matters.** First-round interviews are high-volume and low-signal — most of them just confirm what the CV already said. The AI can run them 24/7 without burning recruiter time, freeing your senior staff for the final-round human judgement where it actually matters.

**How to use it.** From the candidate's record, click **Schedule** → **AI Conversational Interview**. Pick the question pack (auto-generated from the JD or one of yours). The candidate gets a link, talks to the AI in their browser, and you get the transcript and scores within minutes of completion. Use it for high-volume entry-level and mid-level roles; use a human for senior and above.

![[13-raw/screenshots/r-ch19-ai-conversational-interview-chat.png]]

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

This is where it gets interesting. The platform layers eight distinct AI analyses over recorded interviews — each one optimised for a specific question you'd otherwise ask yourself by re-watching the video. They split into three tiers of work: the headline analysis, the deep-dive analyses, and the post-interview tools.

### AI Video Interview Analysis — _Tier: Premium_

**What this feature is.** The headline analysis: AI evaluates a recorded video interview for communication clarity, presentation quality, content coverage, and overall response quality, with timestamped moments.

**Why it matters.** Video debrief between panel members is subjective; AI analysis adds an objective reference that anchors the discussion. Especially useful for distributed panels who can't all attend live.

**How to use it.** Runs automatically on every recorded interview (with consent). Open the **Analysis** tab on the recording. Use the timestamped clarity and content-coverage signals to jump to the parts of the video worth re-watching.

### Scorecard Analysis — _Tier: Premium_

**What this feature is.** AI analysis of completed interview scorecards across many interviews — pattern detection, bias signals, scoring consistency between interviewers.

**Why it matters.** Over 100 interviews, patterns emerge — one interviewer always scores women 0.5 points lower; another inflates scores for alma mater matches. Analysis surfaces these systematic distortions so you can coach the outliers and recalibrate the panel.

**How to use it.** Open `/dashboard/recruiter/scorecard-analysis`. Filter by role family or by interviewer. The report flags consistent distortions with confidence scores. Take it into your monthly panel calibration session.

### Video Sentiment Timeline — _Tier: Premium_

**What this feature is.** A chronological sentiment and engagement map throughout the video — energy, confidence, mood shifts plotted minute by minute.

**Why it matters.** Minute 18 of an interview often reveals something minute 2 didn't. Timeline analysis surfaces the moment the candidate's energy dropped (or spiked) — a signal panels rarely catch live because they're focused on what's being said.

**How to use it.** Open the **Sentiment** tab on any recorded interview. Hover the timeline to see the spoken context at each inflection point. Re-watch the dips before deciding.

![[13-raw/screenshots/r-ch19-sentiment-timeline-chart.png]]

### Video Behavioral Analysis — _Tier: Premium_

**What this feature is.** Behavioural competency mapping from the video — STAR (Situation, Task, Action, Result) response detection, emotional intelligence signals, specific-example rate.

**Why it matters.** Behavioural evidence is what separates "I could do that" from "I have done that". Automated mapping forces the evidence question that interviewers often forget to push on under time pressure.

**How to use it.** Open the **Behavioural** tab. The AI marks each behavioural question with whether the candidate gave a STAR-format answer or vagued out. Targets coaching feedback for the candidate (Chapter 28 covers shareable feedback).

![[13-raw/screenshots/r-ch19-behavioral-star-detection.png]]

### Video Communication Deep Dive — _Tier: Premium_

**What this feature is.** Exhaustive analysis of speech patterns, vocabulary range, filler-word rate, and overall communication style.

**Why it matters.** Communication quality predicts on-the-job performance in most roles. The deep dive gives a defensible, quantified view rather than "he came across well" — useful when the hiring manager wants justification for ranking one strong candidate over another.

**How to use it.** Open the **Communication** tab. Use it as supporting evidence in panel debriefs, not as a primary criterion. **Bias warning** — non-native English speakers, candidates with strong regional accents, and candidates with speech-affecting disabilities consistently score lower on this metric. Read the substance, not the score.

![[13-raw/screenshots/r-ch19-communication-deep-dive-metrics.png]]

### Video Follow-Up Questions — _Tier: Premium_

**What this feature is.** AI generates targeted follow-up questions and coaching notes for the interviewer after they've reviewed the video.

**Why it matters.** Most interviewers can't remember what they should have asked. Follow-ups close the loops the first interview left open — critical for making confident hire / no-hire decisions on borderline candidates.

**How to use it.** After watching a recording, open **Follow-ups**. The AI proposes 3–5 questions to ask in the next round (or as a quick async video). Send the candidate the questions or use them as the spine of round two.

### Video Hiring Recommendation — _Tier: Premium_

**What this feature is.** A comprehensive AI hiring recommendation combining the scorecard, behavioural analysis, communication scores, and risk assessment into a suggested decision.

**Why it matters.** Recommendation isn't replacement — it's a defensible baseline the panel argues with. Often surfaces risks a human panel overlooks in the positivity bias of a good conversation.

**How to use it.** Appears at the top of the candidate's video record. Read the recommendation, read the reasoning, then form your own view. **Never** submit the recommendation directly to the client — it's an internal tool.

![[13-raw/screenshots/r-ch19-hiring-recommendation-card.png]]

### Answer Authenticity Detection — _Tier: Premium_

**What this feature is.** Detects rehearsed vs genuine responses, contradictions across the interview, and consistency patterns.

**Why it matters.** Coached candidates can perform an interview; authentic candidates live it. Authenticity signals separate the two — especially useful for trust-sensitive roles (finance, compliance, leadership) where pattern-matched answers are red flags.

**How to use it.** Open the **Authenticity** tab. The AI flags responses that pattern-match to common rehearsed templates and surfaces internal contradictions. Treat flags as conversation prompts for the next interview, not as auto-rejects — well-prepared candidates aren't dishonest candidates.

### How to read AI video analysis (general principles)

The AI is **good at**:

- Spotting candidates who didn't actually answer the question
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

![[13-raw/screenshots/r-ch19-bias-audit-overlay.png]]

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
- [ ] You've used AI Conversational Interview at least once on a high-volume role
- [ ] You read the Sentiment Timeline and Behavioural tabs before relying on the headline recommendation

## Features covered in this chapter

| # | Feature | Tier |
|---|---------|------|
| 147 | AI Conversational Interview | Premium |
| 148 | AI Video Interview Analysis | Premium |
| 151 | Scorecard Analysis | Premium |
| 153 | Video Sentiment Timeline | Premium |
| 154 | Video Behavioral Analysis | Premium |
| 155 | Video Communication Deep Dive | Premium |
| 156 | Video Follow-Up Questions | Premium |
| 157 | Video Hiring Recommendation | Premium |
| 161 | Answer Authenticity Detection | Premium |
| 213 | Video Interviews | Standard |

## Next chapter

[[01 How-To Documents/recruiter/20-making-an-offer|Chapter 20 — Making an offer]]

## References

- [[02-concepts/ai-features]] — AI capabilities and bias warnings
- [[02-concepts/compliance]] — POPIA consent for recording
- [[01 How-To Documents/recruiter/18-interview-scheduling|Chapter 18 — Interview scheduling]]
- [[01 How-To Documents/recruiter/20-making-an-offer|Chapter 20 — Making an offer]]
- [[01 How-To Documents/recruiter/04.5-how-we-charge|Chapter 4.5 — How Sebenza Hub charges you]]
