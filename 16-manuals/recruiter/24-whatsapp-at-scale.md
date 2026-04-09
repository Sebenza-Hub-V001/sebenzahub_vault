---
title: "Chapter 24 — WhatsApp at scale"
type: concept
created: 2026-04-09
updated: 2026-04-09
tags: [manual, recruiter, whatsapp, communication, popia]
status: draft
user-types: [recruiter]
---

# Chapter 24 — WhatsApp at scale: Apply, Command Center, Campaigns

WhatsApp is how South Africans communicate. Email response rates here are 20–30%. WhatsApp response rates are 60–80%. If you're recruiting in South Africa and not using WhatsApp seriously, you're competing with one hand tied behind your back. Sebenza Hub takes WhatsApp seriously — there are **16 dedicated WhatsApp tabs** in the recruiter dashboard, more than any other single feature category. This chapter explains the three you'll use most.

## Where it lives

| Page | Purpose |
|---|---|
| `/dashboard/recruiter/whatsapp-apply` | Let candidates apply via WhatsApp |
| `/dashboard/recruiter/whatsapp-bot` | The WhatsApp Command Center — manage all WA conversations |
| `/dashboard/recruiter/whatsapp-campaigns` | Bulk WhatsApp campaigns |

These three are the day-to-day surfaces. The other 13 WhatsApp tabs handle template approvals, opt-out management, broadcast configuration, integration settings, and analytics — most are configure-once-and-forget.

## Before anything else: WhatsApp Business API and POPIA

WhatsApp for recruiting is **not** the same as personal WhatsApp on your phone. It uses the WhatsApp Business API, which has rules:

- **Template messages** — outbound messages to people who haven't messaged you in 24 hours must use pre-approved templates. WhatsApp reviews and approves each template; the platform handles the submission flow.
- **Session messages** — once a candidate has messaged you, you have a 24-hour window to respond freely (no templates required).
- **Opt-in required** — you must have explicit consent to message someone on WhatsApp. POPIA enforces this in South Africa; WhatsApp itself enforces it globally.
- **Per-message charges** — WhatsApp Business API charges per template message sent. The platform passes these through with metering (Chapter 4.5).

> ⚠️ **The biggest WhatsApp risk for recruiters is messaging without consent.** Sending an unsolicited "we have a role for you" WhatsApp to a candidate who hasn't opted in violates POPIA, violates WhatsApp's terms, and can get your account suspended. Always check the `whatsappConsent` flag on a contact before sending.

## 1. WhatsApp Apply

WhatsApp Apply lets candidates apply for a job by sending a WhatsApp message instead of filling out an application form. For high-volume roles where the candidate pool is mobile-first (entry-level, hospitality, retail, blue-collar trades), this is a step change in application volume.

### How it works

1. You enable **WhatsApp Apply** for a job in the job's screening configuration (Chapter 15).
2. The job listing shows a "Apply via WhatsApp" button alongside the normal apply button.
3. The candidate clicks, opens WhatsApp, sends a starter message ("Apply for [job title]").
4. Your WhatsApp chatbot (different from the web chatbot in Chapter 23 — this one runs in WhatsApp itself) walks them through application questions:
   - "What's your full name?"
   - "Do you have at least 2 years of experience in [skill]?"
   - "What's your minimum salary expectation?"
   - "Can you start within 30 days?"
5. Their answers are captured as a structured application in your Pipeline.
6. The candidate gets a confirmation and is opted in to further WhatsApp communication for this role.

### When to use it

- **High-volume roles** with candidate pools that are mobile-first
- **Roles where the application form is a barrier** (literacy, language, time)
- **Roles in informal sectors** where email is rare

### When NOT to use it

- **Senior or specialised roles** — these candidates expect email
- **Roles requiring portfolios or CVs** — file uploads via WhatsApp are clunky
- **When you can't handle the volume** — WhatsApp Apply can generate 5–10× more applications. Make sure your screening can keep up.

## 2. WhatsApp Command Center — `/dashboard/recruiter/whatsapp-bot`

The Command Center is where you and your team manage all active WhatsApp conversations across all candidates. Think of it as the WhatsApp equivalent of the Unified Inbox, but with WhatsApp-specific features.

### What you can do here

- **See every active WA conversation** in a list
- **Reply to any conversation** from your desktop (no need to use your phone)
- **Assign conversations** to specific team members
- **Apply tags** to conversations (e.g. `interested`, `not-now`, `salary-issue`)
- **Mark resolved** when a conversation is complete
- **Quick-action shortcuts** — schedule interview, send job link, request CV, opt-out

### Conversation routing

If your agency has multiple recruiters, conversations can be auto-routed:

- **Round-robin** — distribute new conversations evenly across the team
- **Skill-based** — route conversations about specific roles to the recruiter who owns that role
- **Sticky** — once a candidate has talked to a specific recruiter, all their future messages route to the same person

### Team handoff

When you go on leave, mark yourself unavailable in the Command Center settings. Your active conversations auto-reassign to the team member who covers your desk, with a brief context note.

## 3. WhatsApp Campaigns — `/dashboard/recruiter/whatsapp-campaigns`

Campaigns are bulk WhatsApp messages sent to a target audience — your equivalent of an email blast, but on the channel where people actually read.

### What you can broadcast

- **Job promotions** — "We just opened 5 senior dev roles in Cape Town"
- **Re-engagement** — "It's been a while; here's what's new at our agency"
- **Event invites** — "We're hosting a tech meetup next week"
- **Survey requests** — "Quick favour: 30-second feedback on our process?"

### Building a campaign

1. Open `/dashboard/recruiter/whatsapp-campaigns`.
2. Click **+ New campaign**.
3. Pick the audience:
   - A talent pool (Chapter 14)
   - A custom filter (e.g. all candidates with `whatsappConsent: true` AND `tag:senior_dev`)
   - A list you upload manually
4. Pick the **template** — must be a WhatsApp-approved template
5. Set the send window (recommended: weekday business hours in the recipient's local time)
6. Estimate the cost (visible before you click send)
7. Send

### The cost reality

WhatsApp template messages cost real money — typically R0.30 to R1.00 per message depending on the template type and the carrier. A campaign to 500 people costs R150–R500. The Premium plan includes a generous monthly allowance; Standard has a smaller one; Free essentially has none. Watch your usage page.

### The opt-out rule

Every WhatsApp campaign message **must include an opt-out link or instruction** ("Reply STOP to unsubscribe"). The platform handles this automatically when you use approved templates. **Never** strip out the opt-out language to make a template look cleaner — that's a fast way to lose your WhatsApp Business account.

When a candidate opts out, the platform:

1. Adds them to your suppression list immediately
2. Updates their `whatsappConsent` flag to false
3. Prevents any future campaigns from including them
4. Logs the opt-out in the audit trail

You cannot manually re-add someone who opted out. They have to explicitly opt back in via a fresh message.

## Best practices for WhatsApp recruitment

### Timing

- **Tuesday–Thursday, 10:00–16:00** — highest open and reply rates
- **Avoid weekends** — feels intrusive on personal time
- **Never after 19:00 or before 08:00** — that's a hard boundary

### Tone

WhatsApp is informal. Don't use corporate email tone. Don't use "Dear Sir/Madam." Write the way you'd write to a friend who happens to be a candidate:

> "Hey Thandi, hope you're well — quick one. We just opened a senior Postgres role at a fintech in Sandton, R900–1.1m, hybrid 3 days/week. Vibe seems like a fit for what you mentioned last time we chatted. Want to know more?"

Not:

> "Dear Thandi, We trust this message finds you well. We are pleased to inform you of an exciting career opportunity that has recently become available with one of our valued corporate clients..."

The first message gets replies. The second gets blocked.

### Length

Three sentences. Maybe four. WhatsApp is not email. If you're writing more than 4 sentences, send a message with the headline and offer a call instead.

### Personalisation

Always reference something specific to the candidate. "We met at PyConZA", "you mentioned wanting to leave [current company] when we last spoke", "your Postgres background fits this perfectly." Generic messages get the same fate as generic emails — ignored.

## The 16 WhatsApp tabs (briefly)

For completeness, the full list of WhatsApp-related dashboard pages:

- **WhatsApp Apply** — application via WhatsApp (covered above)
- **WhatsApp Command Center** — manage conversations (covered above)
- **WhatsApp Campaigns** — bulk messaging (covered above)
- **WhatsApp Templates** — template library and approval status
- **WhatsApp Opt-Outs** — suppression list management
- **WhatsApp Broadcasts** — broadcast lists for one-to-many
- **WhatsApp Auto-Responses** — automated replies to common questions
- **WhatsApp Webhooks** — integration configuration
- **WhatsApp Numbers** — manage your business numbers
- **WhatsApp Quality** — quality rating from WhatsApp
- **WhatsApp Costs** — per-message cost tracking
- **WhatsApp Analytics** — performance metrics
- **WhatsApp Compliance** — POPIA/consent audit
- **WhatsApp Settings** — global configuration
- **WhatsApp Test Sandbox** — test templates before sending live
- **WhatsApp Help** — documentation and support

You'll touch most of these only when configuring or troubleshooting. Day-to-day, the three covered in detail above are 95% of the work.

## Pro tips

- **Get your high-priority templates approved first.** Template approval can take 24–48 hours. Submit your essentials (interview confirm, offer follow-up, re-engagement) early so they're ready when you need them.
- **Watch your quality rating.** WhatsApp tracks "quality" of your number based on opt-outs and complaints. A degraded rating throttles your sending limits. Keep templates conversational, opt-outs honoured, and complaints rare.
- **Don't blast your Top 50 pool with campaigns.** Top 50 candidates are individual relationships — campaign blasts cheapen them. Hand-write to your Top 50, campaign to the broader funnel.
- **Use WhatsApp for confirmation, not first touch.** The first interaction with a senior candidate should be email or LinkedIn, where the formality matches their expectations. WhatsApp is for after the relationship is established.
- **Audit consent monthly.** WhatsApp consent rots — people change their minds. Quarterly, run a "still want to hear from us?" check on candidates you haven't messaged in 6+ months.

## Checklist

- [ ] You understand the difference between template messages and session messages
- [ ] You only message candidates with `whatsappConsent: true`
- [ ] You've enabled WhatsApp Apply on at least one high-volume role (or know how to)
- [ ] You can find and reply to a WhatsApp conversation in the Command Center
- [ ] You've read and understood the cost-per-message reality
- [ ] You always include opt-out language in campaigns

## Next chapter

[[16-manuals/recruiter/25-reading-your-analytics|Chapter 25 — Reading your analytics]]

## References

- [[02-concepts/whatsapp-integration]] — WhatsApp Business API architecture
- [[02-concepts/compliance]] — POPIA consent requirements for messaging
- [[16-manuals/recruiter/22-unified-inbox|Chapter 22 — Unified Inbox]]
- [[16-manuals/recruiter/23-templates-sequences-chatbot|Chapter 23 — Templates, sequences, and the chatbot]]
- [[16-manuals/recruiter/04.5-how-we-charge|Chapter 4.5 — How Sebenza Hub charges you]]
