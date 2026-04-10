---
title: "Chapter 30 — Recruitment Marketing, Referrals, and Candidate NPS"
type: concept
created: 2026-04-09
updated: 2026-04-09
tags: [manual, recruiter, marketing, referrals, nps, growth]
status: draft
user-types: [recruiter]
---

# Chapter 30 — Recruitment Marketing, Referrals, and Candidate NPS

Chapter 29 covered the *infrastructure* of brand and growth — your Brand Page, Career Site, job boards. This chapter covers the *active* growth tools: marketing campaigns, structured referral programmes, and candidate satisfaction tracking. These three tools share a common premise: **the best source of candidates is the candidates you've already worked with.**

## Where it lives

| Page | Purpose |
|---|---|
| `/dashboard/recruiter/recruitment-marketing` | Marketing campaigns to candidates and clients |
| `/dashboard/recruiter/referrals` | Structured referral programmes |
| `/dashboard/recruiter/feedback` (Candidate NPS) | NPS surveys and response tracking |
| `/dashboard/recruiter/reference-checks` | Automated reference collection |

## 1. Recruitment Marketing — `/dashboard/recruiter/recruitment-marketing`

Recruitment Marketing is the campaign tool for reaching candidates and prospective clients at scale across multiple channels. Where Sequences (Chapter 23) are 1:1 nurture flows, recruitment marketing campaigns are 1:many broadcasts with messaging, audience targeting, and analytics.

### Campaign types

- **Job promotion campaigns** — promote a specific role across email, social, paid channels
- **Employer brand campaigns** — promote a *client's* employer brand to attract candidates passively
- **Re-engagement campaigns** — bring dormant candidates back into active conversation
- **Sector launch campaigns** — announce that your agency now serves a new sector or geography
- **Event campaigns** — promote meetups, hackathons, networking events you're hosting or attending
- **Thought leadership** — share insights to position your agency as a sector expert

### Channels

- **Email** to your candidate database (filtered by tags, pools, status)
- **WhatsApp** (where consent exists — Chapter 24)
- **LinkedIn organic posts** (via integration)
- **Paid social** (LinkedIn Ads, Facebook Ads via integration)
- **Your Brand Page and Career Site** (banner placements, featured roles)

### Building a campaign

1. Open `/dashboard/recruiter/recruitment-marketing`.
2. Click **+ New campaign**.
3. Pick a campaign type (the platform pre-configures some defaults based on type).
4. Define the audience:
   - For candidate campaigns: a talent pool, a tag filter, or an uploaded list
   - For client campaigns: prospects from your client pipeline, sector targeting
5. Build the creative:
   - Subject lines and body copy per channel
   - Images, videos, links
   - Call to action
6. Pick a launch date and schedule
7. Set tracking goals (clicks, applications, replies, calls booked)
8. Launch

### Measuring marketing

Marketing without measurement is decoration. Every campaign produces:

- **Reach** — how many people saw it
- **Engagement** — opens, clicks, watches
- **Conversion** — how many took the desired action (applied, signed up, replied)
- **Cost** (for paid campaigns) — total spend and cost-per-conversion
- **ROI** — for campaigns that lead to placements, the revenue attributable

The number that matters most: **placements attributable to the campaign**. A campaign that gets 10,000 views and 0 placements is worse than a campaign with 100 views and 2 placements. Watch the conversion to the bottom of the funnel.

## 2. Referrals — `/dashboard/recruiter/referrals`

A structured referral programme is the highest-leverage growth tool you have. The math: every successful placement is a candidate who now knows you, trusts you, and probably has 5–20 colleagues with similar skills you'd love to recruit. If even 1 in 10 placed candidates refers a single colleague who eventually places, your candidate acquisition cost drops dramatically.

### How the platform supports referrals

The Referrals page lets you:

- **Generate unique referral links** for each candidate (so you can track who referred whom)
- **Set referral incentives** (cash, gift cards, charity donations, agency swag — whatever fits your brand)
- **Track the referral funnel** — referrals received → applications → interviews → placements
- **Manage payouts** when a referral converts to a placement
- **Measure referral effectiveness** — which candidates refer the most, which referrals convert highest

### Setting up a referral programme

1. Open `/dashboard/recruiter/referrals`.
2. Click **Configure programme**.
3. Set the incentive structure:
   - **Tier 1**: Reward when a referred candidate is hired (most common)
   - **Tier 2**: Smaller reward when a referred candidate reaches interview stage (encourages more referrals)
   - **Tier 3**: Token reward just for referring (encourages volume but dilutes quality)
4. Set the legal terms (these are visible to referrers — be clear about timing, conditions, taxation)
5. Build the referrer journey: how they get the link, how they share it, how they get notified
6. Save and activate

### Where to ask for referrals

The right moments to ask:

- **After a successful placement, at the 30-day check-in** — the candidate is happy, settled, and reminded of your role in their good week
- **After a high candidate NPS score (9–10)** — they explicitly told you they'd recommend you; let them
- **In your re-engagement messaging** to dormant candidates — "by the way, if you know someone who might fit a role we're working on..."
- **In your Tier A client check-ins** — corporate referrals (one client recommending you to another) are extremely high value

### What NOT to do

- **Don't ask for referrals from rejected candidates.** Awkward and rarely productive.
- **Don't ask immediately after the first placement check-in.** Give it 30 days so the candidate has actual experience to recommend.
- **Don't make the referral process require effort.** A unique link they share is fine; a 5-page form is not.
- **Don't underpay the incentive.** A R500 voucher for a referral that earns you a R30,000 fee is insulting and people notice.

## 3. Candidate NPS — `/dashboard/recruiter/feedback`

NPS (Net Promoter Score) is the most diagnostic single metric in recruitment. Asked at the right moments, in the right way, it tells you whether candidates would recommend you (Promoters), tolerate you (Passives), or warn others against you (Detractors).

### When the platform asks NPS

NPS surveys are sent automatically at key moments:

- **After application submission** — was the application experience smooth?
- **After interview rejection** — was the rejection handled well?
- **After offer acceptance** — was the recruiting process worth their time?
- **After 30 days in the new role** — has the placement matched expectations?
- **After 90 days in the new role** — same again, with retention as the question

Each survey is short (1–3 questions) so completion rates stay high.

### Reading the responses

The classic NPS interpretation:

- **9–10: Promoters** — actively recommend you. Ask them to refer (above) or post a public testimonial.
- **7–8: Passives** — neutral. They tolerate you but won't promote you. Ask what would have made them a 9 — usually a small, fixable thing.
- **0–6: Detractors** — at risk of damaging your brand. Reply within 24 hours with a personal message and address whatever went wrong.

### The detractor playbook

A detractor response is a fire alarm. The right sequence:

1. **Within 24 hours, reply personally.** Not a template. Acknowledge their score and ask what went wrong.
2. **Within 48 hours, schedule a call** if their concern is substantive. Email back-and-forth on a complaint usually escalates; voice de-escalates.
3. **Document the conversation** in their record (Chapter 14 / 22).
4. **Fix what you can.** If they were ghosted, apologise and explain why. If they were treated rudely, address it with the team member involved.
5. **Follow up two weeks later** to confirm the issue is resolved (or that they appreciate the response).

A detractor who feels heard often becomes a passive. A passive who feels heard often becomes a promoter. The reverse — ignored detractors — turns into Glassdoor reviews and lost future deals.

### NPS feeds your Reputation Score

Candidate NPS is one of the four sub-scores in your Reputation Score (Chapter 6). High NPS → high reputation → better visibility in inbound matching → more inbound clients. The connection is direct.

## 4. Reference Checks — `/dashboard/recruiter/reference-checks`

Reference checks are the structured verification of a candidate's claims with their previous managers and colleagues. Sebenza Hub automates the collection so you don't have to chase referees manually.

### How it works

1. From a candidate's record, click **Request references**.
2. The candidate enters referee names, roles, and contact details.
3. The platform sends each referee a digital reference form.
4. Referees fill out structured questions (rating scales + open text).
5. Responses are collected, scored, and added to the candidate's record.
6. You see a summary, and the AI flags any inconsistencies between referees.

### What to ask

Standard reference questions (the platform provides templates):

- Confirm role, dates, responsibilities
- Rate technical capability, communication, reliability, cultural fit
- "Would you rehire this person?" (the most diagnostic single question)
- Open text: strengths, areas for development, anything else relevant

### Why automated beats manual

- **Faster** — referees fill out a form in 5 minutes instead of taking a 20-minute phone call
- **Higher response rate** — referees who'd avoid a phone call will fill in a form
- **Standardised** — every reference produces comparable data
- **Audited** — every reference is logged in the audit trail
- **No phone tag** — no losing days to "I'll call you back tomorrow"

### When to do reference checks

- **At the offer stage**, before sending the offer — references can change your assessment
- **For senior or sensitive roles** where verification matters most
- **For client-mandated references** (some clients require N references before they'll consider an offer)

Don't reference-check every shortlisted candidate. It's not worth the candidate friction. Check the candidate(s) you're seriously about to offer.

## How these tools compound

The cycle that high-growth agencies build:

```
Run a recruitment marketing campaign
       ↓
Get applications and place candidates
       ↓
Survey them via NPS at 30 days
       ↓
The 9–10s become Promoters
       ↓
Ask Promoters to refer via the Referral programme
       ↓
Promoters refer their network
       ↓
The new referrals enter your funnel as warm leads
       ↓
Place them, survey them, ask them to refer
       ↓
Compound
```

This is the loop. Recruitment marketing fills the top, NPS identifies the gold, referrals turn gold into more applicants, references verify quality at the offer stage. None of these tools is decisive on its own. Together they're a moat.

## Pro tips

- **NPS surveys must be short.** 1–3 questions. The moment you go to 5+ questions, completion rates crater and you have less data, not more.
- **Detractor responses are mandatory.** If you can't respond personally within 24 hours, you're not ready to send NPS surveys at all. Better no NPS than ignored detractors.
- **Reference check fatigue is real.** Don't reference-check 5 candidates per role. Pick the one or two you're seriously considering and check them.
- **Referral incentives should be meaningful.** Cheap incentives signal that you don't value referrals. Generous ones (5–10% of the placement fee for the referrer is common) turn referrals into a real channel.
- **Marketing campaigns need conversion goals, not vanity metrics.** Reach is meaningless. Placements attributable is the metric.

## Checklist

- [ ] You're sending NPS surveys at the standard moments
- [ ] You have a process for responding to detractors within 24 hours
- [ ] You've set up at least a basic referral programme
- [ ] You know what the incentive structure is and can explain it to a candidate
- [ ] You use automated reference checks instead of phone calls for routine roles
- [ ] At least one recruitment marketing campaign has run with measurable conversion goals

## Next chapter

[[16-manuals/recruiter/31-fill-rate-dropping|Chapter 31 — "My fill rate is dropping"]]

## References

- [[02-concepts/ai-features]] — AI scoring of NPS sentiment and references
- [[16-manuals/recruiter/06-ai-profile-assets|Chapter 6 — AI profile assets (NPS feeds Reputation)]]
- [[16-manuals/recruiter/14-talent-pools-crm|Chapter 14 — Talent Pools and Talent CRM]]
- [[16-manuals/recruiter/29-career-site-brand|Chapter 29 — Career Site, Brand Page, and Job Boards]]
- [[16-manuals/recruiter/31-fill-rate-dropping|Chapter 31 — Troubleshooting: fill rate dropping]]
