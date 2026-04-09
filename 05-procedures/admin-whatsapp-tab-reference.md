---
title: "Admin WhatsApp Command Center — Tab-by-Tab Reference"
type: procedure
created: 2026-04-09
updated: 2026-04-09
tags: [admin, whatsapp, reference, tabs, dashboard]
sources: [whatsapp-bot-training-manual]
status: active
confidence: high
user-types: [admin]
dashboard-path: /admin/whatsapp
---

# Admin WhatsApp Command Center — Tab-by-Tab Reference

> **Companion to:** [[admin-whatsapp-command-center-setup]] (the setup runbook).
> **Purpose:** every tab in `/admin/whatsapp` explained — what you see, what you can do, what the numbers mean, and when to open it.
> **Tab count:** 21 (12 in row 1, 9 in row 2).

The Command Center has *a lot* of surface area. You'll only use 5-6 tabs daily; the others are weekly/monthly. The "When to open this tab" line on each entry tells you the cadence.

## Quick map

| # | Tab | Cadence | Read or Edit? |
|---|---|---|---|
| 1 | Command Center | Daily | Read |
| 2 | Conversations | Daily | Read + Edit |
| 3 | Campaigns | Weekly | Edit |
| 4 | Broadcast Studio | Weekly | Edit |
| 5 | Automation | At setup, then monthly | Edit |
| 6 | Compliance | Monthly | Read |
| 7 | Quality & CSAT | Weekly | Read |
| 8 | AI Intelligence | Weekly | Read |
| 9 | Templates | Monthly | Edit |
| 10 | Configuration | At setup, then on token rotation | Edit |
| 11 | Contact CRM | Weekly | Edit |
| 12 | Team Inbox | Daily (if you have agents) | Edit |
| 13 | Flow Builder | At setup, then ad-hoc | Edit |
| 14 | Bot Training | Weekly | Edit |
| 15 | Bot Templates | At setup, then monthly | Edit |
| 16 | Deep Analytics | Monthly | Read |
| 17 | Replay & Debug | Weekly + after every escalation | Read |
| 18 | AI Matcher | Weekly | Edit |
| 19 | Growth Engine | Monthly | Read |
| 20 | DNA Analyzer | Ad-hoc | Read |
| 21 | War Room | Daily (during business hours) | Edit |

---

# Hidden gems & non-obvious features

Eight things buried in the codebase that aren't documented in the original [Sebenza Hub WhatsApp Bot Training Manual](../../Sebenza_Hub_Claude/Sebenza_Hub_Claude_V2/docs/WhatsApp-Bot-Training-Manual.md) and that most admins miss.

## 1. Broadcast Studio is a 3-in-1 — you don't need a separate ad-hoc CRM workflow

Broadcast Studio is the **biggest single-tab UI in the Command Center** at [664 lines](../../Sebenza_Hub_Claude/Sebenza_Hub_Claude_V2/client/src/pages/admin/AdminWhatsApp.tsx#L2503-L3167). It bundles three things that most platforms split into separate tools:

1. **Broadcasts** — fire-and-forget bulk sends
2. **Drip Sequences** — multi-step automated journeys with delay-between-step
3. **Contact List management** — name + import/manage members + reuse across sends

**Implication:** for ad-hoc audiences (e.g. "everyone who attended the careers fair last Saturday"), you don't need to leave Broadcast Studio. Create a Contact List, add members directly via the Manage List Members sheet, then send to that list. No need to round-trip through Contact CRM.

## 2. Team Inbox polls aggressively — leave it open all day

Verified intervals from [WhatsAppTeamInbox.tsx](../../Sebenza_Hub_Claude/Sebenza_Hub_Claude_V2/client/src/pages/admin/whatsapp/WhatsAppTeamInbox.tsx):

- Stats: **15 seconds**
- Agents list: **10 seconds**
- Queue: **10 seconds**

This is the closest thing the Command Center has to a true real-time view. Pin it to a second monitor during business hours — you don't need to refresh manually, and the queue priority counters update on their own as new conversations land.

## 3. War Room polls every 10-15s and surfaces a 30-minute forward prediction

The War Room ([WhatsAppEscalationWarRoom.tsx](../../Sebenza_Hub_Claude/Sebenza_Hub_Claude_V2/client/src/pages/admin/whatsapp/WhatsAppEscalationWarRoom.tsx)) refetches active escalations and stats every **10-15 seconds** — comparable to Team Inbox.

The header carries a `predictedNext30Min` count alongside the live `activeEscalations` figure. **This is the most useful single number on the page** — it tells you how many escalations the model expects in the next half hour, so you can staff up before the queue actually fills.

> ⚠️ **Earlier doc correction:** previous versions of this reference described a "Crisis banner" with specific firing thresholds (3+ critical in 5 min, sentiment cluster, delivery drop). Those thresholds were not actually present in the source code — they were extrapolation. The real signal is the `activeEscalations` and `predictedNext30Min` numbers in the header. Watch those.

## 4. Contact CRM ≠ Contact CRM in the codebase

The tab labelled **Contact CRM** is rendered by the component **`WhatsAppContactIntelligence`**. The mismatch:

- Tab label: `Contact CRM` ([AdminWhatsApp.tsx:1396](../../Sebenza_Hub_Claude/Sebenza_Hub_Claude_V2/client/src/pages/admin/AdminWhatsApp.tsx#L1396))
- Import: `WhatsAppContactIntelligence` ([AdminWhatsApp.tsx:47](../../Sebenza_Hub_Claude/Sebenza_Hub_Claude_V2/client/src/pages/admin/AdminWhatsApp.tsx#L47))
- Render: [AdminWhatsApp.tsx:5318](../../Sebenza_Hub_Claude/Sebenza_Hub_Claude_V2/client/src/pages/admin/AdminWhatsApp.tsx#L5318)
- File: [client/src/pages/admin/whatsapp/WhatsAppContactIntelligence.tsx](../../Sebenza_Hub_Claude/Sebenza_Hub_Claude_V2/client/src/pages/admin/whatsapp/WhatsAppContactIntelligence.tsx)

If you ever grep the codebase for "ContactCRM" expecting to find the component, you'll come up empty. Search for `ContactIntelligence` instead. Same for any backend endpoints — they're under `/api/admin/whatsapp/contact-intelligence/*`, not `/contact-crm/*`.

## 5. The Automation tab can attach a PDF to the greeting

When you edit the **Greeting Message** or **Fallback Message** in the Automation tab, there's a **PDF attachment** field next to each that most admins don't notice. It accepts a single PDF file — Sebenza Hub will deliver that PDF as the message media when the greeting/fallback fires.

**Use cases:**
- Attach a **company brochure** to the greeting (every new candidate gets it automatically)
- Attach a **POPIA consent document** to the consent prompt for full transparency
- Attach a **price list** or **service catalogue** to the fallback message

Stored as `greeting_attachment_name` and `fallback_attachment_name` on `whatsappBotConfig`. Combined with the optional Meta Template selector on the same fields, this gives you four ways to format a greeting: plain text, plain text + PDF, Meta template, or Meta template + PDF.

## 6. Estimated Cost in ZAR — your single most important monthly number

Inside Broadcast Studio, the **Usage & Cost Tracker** card shows six metrics:

- Messages Sent
- Messages Received
- Template Messages
- Session Messages
- Media Sent
- **Estimated Cost (ZAR)**

The last one is calculated from Meta's per-message pricing model (utility vs marketing vs authentication templates have different rates) and aggregated across the whole month. **It's the easiest single number to spot a runaway broadcast or a campaign that's overspending.**

Bookmark Broadcast Studio specifically for the 1st-of-month review. Compare this number to the cost-per-placement figure in Deep Analytics → Financial / ROI to know if WhatsApp is paying for itself.

> 💡 The Top Templates list directly below shows which templates are driving the cost — useful for spotting that one re-engagement template that's burning budget.

## 7. Bot Training has a Playground — stop testing through real WhatsApp

The Bot Training tab's **Conversation Playground** sub-tab is a chat interface that runs every message you type through the **real bot pipeline** (intent classifier → state machine → flow → response). It returns:

- **Detected Intent** + **confidence score** (0-100, colour-coded)
- **Bot's chosen response**
- **Suggested Responses** if confidence was below threshold

You can iterate dozens of phrasings in 60 seconds. **Use this every time you add a new training phrase or FAQ** — it's 10× faster than messaging through your phone, and you get visibility into *why* the bot made each decision.

**Workflow tip:** when you add an intent, immediately test 5-10 variations in the Playground. If any drop below 80% confidence, add them as training phrases on the spot.

## 8. Replay & Debug auto-flags Critical Moments — you don't have to find the broken step

The Replay & Debug tab has a **Debug panel** (toggle via the Bug icon) that includes a **Critical Moments** list. The system auto-detects and surfaces:

- The exact step where a fallback was triggered
- The exact step where an escalation triggered
- Sudden sentiment drops (a "sentiment cliff")
- Long bot processing times (slow LLM round-trips)

Each critical moment has a step index and a description. **You don't have to scrub through 50 messages to find where things went wrong** — the system points you straight at it. Click any critical moment to jump the replay viewer to that step.

**Workflow tip:** for any escalated conversation, open Replay & Debug → toggle Debug panel → look at Critical Moments first. 80% of the time the root cause is in the first or second flagged moment.

---

# Row 1 — Operations & configuration

## Tab 1 — Command Center

**Purpose:** Real-time operations dashboard. Your home page.
**Source:** [client/src/pages/admin/AdminWhatsApp.tsx:1433-1854](../../Sebenza_Hub_Claude/Sebenza_Hub_Claude_V2/client/src/pages/admin/AdminWhatsApp.tsx#L1433)

### What you see (top to bottom)
1. **Master Bot Toggle** — same toggle as on Configuration. Confirms the bot is enabled.
2. **Quick Send card** — input a SA phone number, type a message, hit **Send**. Bypasses the bot entirely; useful for ad-hoc manual outreach.
3. **Live Pulse banner** — 7 real-time metrics in a strip:
   - Active Now (open conversations)
   - Last 5 min (messages in)
   - Last Hour (messages in)
   - Bot Handled
   - Human Handled
   - Avg Response (seconds)
   - Escalations (pending)
4. **System Health Monitor** — 6 KPIs: Status, Uptime, Message Rate, Error Rate (red if >5%), Webhook Latency, Queue Size (amber if >100).
5. **Four KPI cards:** Total Conversations, Messages Sent, Delivery Rate, Avg Response Time.
6. **Bot State Distribution chart + Conversion Funnel** (two columns).
7. **Sentiment Analysis breakdown + Recent Activity Feed** (two columns).
8. **Optimal Send Times heatmap** — 7-day × 24-hour grid with colour-coded message density.

### What you can do
- Send a one-off manual message via Quick Send.
- Toggle the bot on/off.
- Click **Refresh** to force-poll the live data (auto-refreshes every 5 seconds).

### When to open this tab
**First thing every morning.** 30-second glance — green/red check on Live Pulse, Sentiment, Funnel, and Bot Health. If any is red, drill into the relevant tab.

> 📡 **Polls:** Live Pulse refetches every **10 seconds** ([AdminWhatsApp.tsx:481](../../Sebenza_Hub_Claude/Sebenza_Hub_Claude_V2/client/src/pages/admin/AdminWhatsApp.tsx#L481)); other queries on this tab refetch at 10-30s intervals.

---

## Tab 2 — Conversations

**Purpose:** Browse, filter, and manage every WhatsApp conversation.
**Source:** [AdminWhatsApp.tsx:1859-2150](../../Sebenza_Hub_Claude/Sebenza_Hub_Claude_V2/client/src/pages/admin/AdminWhatsApp.tsx#L1859)

### What you see
1. **Quick stats row** — 5 cards: Total / Active / Escalated / Bot Managed / Opted In.
2. **Search & Filter bar** — search by phone number, plus a State dropdown (All / Active / Main Menu / Escalated / Completed / Opted Out) and a Refresh button.
3. **Conversations table** with 8 columns: Phone, State, Match (linked user), Sentiment, POPIA, Handler (Bot/Human), Last Activity, Actions.
4. **Pagination** at the bottom.
5. **Conversation Detail Sheet** (slides in from the right when you click a row):
   - Phone + state badge header
   - **Take Over** / **Release to Bot** action button
   - Tags input (add/remove freeform tags)
   - Full message thread
   - Notes textarea
   - Chat composer for sending messages

### What you can do
- **View** any conversation's full history (Eye icon on a row).
- **Delete** a conversation (Trash icon, red — POPIA erasure).
- **Take Over** — switches the conversation from `bot` to `human` mode. The bot stops auto-responding; you handle replies until you Release.
- **Release to Bot** — returns control to the bot.
- **Tag** and **Note** for internal tracking.
- **Match** — link an unmatched conversation to an existing user profile (the AI Matcher tab automates this in bulk).
- **Send a manual message** in any open conversation via the embedded chat composer.

### Reading the badges
| Column | Colour | Meaning |
|---|---|---|
| State | green / red / gray / blue | active / escalated / completed/opted_out / main_menu |
| Sentiment | green ↑ / gray ○ / red ↓ | score >0.3 / neutral / <-0.3 |
| POPIA | green / amber / gray | consented / partial / none |
| Handler | purple "Bot" / orange "Human" | which side is replying |

### When to open this tab
- When a candidate names a specific number ("can you check on Thandi at 0821234567")
- When you need to take over a conversation manually
- For POPIA erasure requests
- For spot-checking conversation health

---

## Tab 3 — Campaigns

**Purpose:** Schedule, run, and measure re-engagement campaigns with optional A/B testing.
**Source:** [AdminWhatsApp.tsx:2155-2498](../../Sebenza_Hub_Claude/Sebenza_Hub_Claude_V2/client/src/pages/admin/AdminWhatsApp.tsx#L2155)

### What you see
1. **Four summary cards:** Total Campaigns / Active / Total Sent / Audiences.
2. **"New Audience" + "New Campaign"** buttons in the header.
3. **Campaign list table** — 9 columns: Name, Status (draft/active/paused/completed), Audience, Target count, Sent count, Progress bar, A/B Test indicator, Scheduled time, Actions.
4. **Saved Audiences table** (only visible if any audiences exist) — Name, Criteria, Estimated size, Created date.

### What you can do
**Create a campaign** (`+ New Campaign`):
- Name, target audience (free text or pick a saved audience), target count, scheduled datetime
- **Variant A** message body (the main template)
- **Variant B** message body (optional — enables A/B testing)
- Click **Create**, then **Play** to launch.

**Per-campaign actions:**
- ▶️ **Play** — launch (draft/paused → running)
- ⏸️ **Pause** — pause an active campaign
- 📋 **Copy** — duplicate as a new draft
- 📊 **Results** — opens a dialog showing Sent / Delivered / Read / Failed / Response Rate, plus per-variant comparison if A/B
- 🗑️ **Delete** — only available on drafts

**Create a saved audience:**
- Name + freeform criteria text. Audiences are reusable across campaigns.

### When to open this tab
- Weekly: launch one re-engagement campaign to dormant contacts
- Monthly: review last month's campaign Results dialogs to see what worked
- Whenever you want to A/B test message wording

> 💡 **A/B testing tip:** keep variants narrow — vary one thing at a time (subject line, CTA wording, length). Otherwise you can't tell what moved the needle.

---

## Tab 4 — Broadcast Studio

**Purpose:** Mass-send broadcasts, build drip sequences, and manage contact lists.
**Source:** [AdminWhatsApp.tsx:2503-3167](../../Sebenza_Hub_Claude/Sebenza_Hub_Claude_V2/client/src/pages/admin/AdminWhatsApp.tsx#L2503) (664 lines — the biggest single-tab UI)

This is **distinct from Campaigns** — Campaigns are scheduled and tracked, Broadcasts are fire-and-forget bulk sends. Drip sequences are multi-step automated journeys.

### What you see
1. **Header:** "New Drip Sequence" + "New Broadcast" buttons.
2. **Four stat cards:** Total Contacts / Reachable / Opted Out / Active Drips.
3. **Drip Sequences table** — 7 columns: Name, Status, Steps, Enrolled, Completed, Completion Rate, Actions.
4. **Broadcast History table** — 8 columns: Name, Status, Recipients, Delivered, Read, Failed (red if >0), Created, Actions.
5. **Contact Lists manager** — your custom segments. Each list has a name, description, contact count.
6. **Usage & Cost Tracker** — 6 metrics: Messages Sent / Received / Template Messages / Session Messages / Media Sent / Estimated Cost (in ZAR), plus a Top Templates list.

### What you can do
**Create a Broadcast:**
- Name, audience (All / Active / Inactive / New / a contact list), Meta-approved template, message body, optional image, optional file attachments (PDF/DOC/XLS), optional scheduled datetime.
- Click **Send** for immediate or schedule for later.

**Create a Drip Sequence:**
- Name + description.
- Add steps dynamically — each step has a delay (in hours) and a message body.
- Activate the sequence and contacts auto-progress through the steps.

**Create a Contact List:**
- Name + description.
- Click into the list to open the Manage List Members sheet — add contacts by phone + first/last name, or remove existing members.

**Per-broadcast/drip actions:**
- Send / Pause / Activate / Delete

### Reading the cost tracker
Estimated Cost is in ZAR and reflects Meta's per-message pricing for marketing/utility templates. **Watch this monthly** — it's the easiest way to spot a runaway broadcast.

### When to open this tab
- Weekly: send a re-engagement broadcast to dormant contacts
- At setup: build your first 2-3 contact lists (Hot Candidates, Cold Leads, etc.)
- Monthly: review the Usage & Cost Tracker, optimise drip sequences with low completion rates

> ⚠️ **POPIA discipline:** opted-out contacts are *always* excluded from broadcasts and drips, regardless of which audience you pick. The "Reachable" count is the number that will actually receive a message.

---

## Tab 5 — Automation

**Purpose:** Configure the bot itself — greeting, languages, features, business hours, escalation rules.
**Source:** [AdminWhatsApp.tsx:3172-4113](../../Sebenza_Hub_Claude/Sebenza_Hub_Claude_V2/client/src/pages/admin/AdminWhatsApp.tsx#L3172) (941 lines — the most settings-dense tab)

This tab is the **heart of the bot's behaviour**. The setup runbook walks through every field in [Part 6](admin-whatsapp-command-center-setup.md#part-6--bot-settings-the-heart-of-the-automation) — the summary below is for quick reference.

### What you see
A single big **Bot Configuration card** with an Edit/Save toggle. In view mode it's read-only badges; click **Edit** to make everything editable.

**Left column:**
- Master Bot Toggle (switches the whole bot on/off)
- Auto-Reply toggle
- 6 language checkboxes: EN / AF / ZU / XH / ST / TN
- **Greeting Message** textarea + optional PDF attachment + optional Meta Template selector
- **Fallback Message** textarea + optional PDF attachment + optional Meta Template selector

**Right column:**
- **Menu Features** (4 toggles): Browse Jobs, Status Check, CV Upload, Career Coaching (+ "Talk to Recruiter" is always-on)
- **Conversational Intent Detection** (2 toggles): Keyword Matching (fast, primary), AI Intent Fallback (slower, ~300ms LLM round-trip)
- **Escalation Rules** textarea (freeform — describes when to escalate)
- **Enforce Business Hours** toggle
- **Business Hours Start / End** time inputs
- **After Hours Message** textarea
- **Escalation Threshold** number (default 3 — how many negative messages trigger handover)
- **Idle Timeout Minutes** number (default 30)

Below the Bot Configuration card sits the **Auto-Responder Rules** section (keyword/regex rules — see Part 8 of the runbook).

### What you can do
- Click **Edit**, change anything, click **Save**.
- Toggle the master bot on/off without entering edit mode.
- Attach a PDF to the greeting (e.g. company brochure).
- Pick a Meta-approved template instead of a freeform message (recommended for the greeting if you ever need to send it outside the 24-hour window).

### When to open this tab
- **At setup**, once, to configure everything
- Monthly to refine greeting/fallback wording based on what the Unmatched Log is showing
- Whenever you add a new language

---

## Tab 6 — Compliance

**Purpose:** POPIA dashboard. Read-only audit view.
**Source:** [AdminWhatsApp.tsx:4114-4281](../../Sebenza_Hub_Claude/Sebenza_Hub_Claude_V2/client/src/pages/admin/AdminWhatsApp.tsx#L4114)

### What you see
1. **POPIA Compliance Score card** — large circular percentage (e.g. 87%) with three sub-badges: Consented (green) / Pending (amber) / Opted Out (red).
2. **Four metric cards:** Total Opt-Ins / Total Opt-Outs / Opt-Out Rate % / Retention Days.
3. **Consent Status Breakdown** — 4 progress bars: POPIA Consented / Opted In No POPIA / Pending Consent / Opted Out.
4. **Recent Opt-Outs list** — phone (masked), reason, timestamp.
5. **POPIA Compliance Checklist** — 6 items, each pass/fail:
   - Explicit opt-in consent collected
   - POPIA consent recorded
   - Opt-out mechanism available
   - Data retention policy set
   - Message templates approved
   - Last compliance audit

### What you can do
**Nothing — this tab is read-only.** All changes happen elsewhere (Automation tab for retention settings, Conversations tab for individual erasure).

### Targets
- POPIA Compliance Score: **>85%** is healthy
- Opt-Out Rate: **<5%** is healthy; spikes usually mean a campaign was too aggressive
- All 6 checklist items should be green ✅

### When to open this tab
- **Monthly** for the compliance review
- **After every campaign** to spot opt-out spikes
- **Before any external audit**

---

## Tab 7 — Quality & CSAT

**Purpose:** Conversation quality metrics and customer satisfaction tracking.
**Source:** [AdminWhatsApp.tsx:4286-4434](../../Sebenza_Hub_Claude/Sebenza_Hub_Claude_V2/client/src/pages/admin/AdminWhatsApp.tsx#L4286)

### What you see
1. **Four KPI cards** with status badges (Excellent / Good / Needs improvement):
   - Avg Response Time (seconds)
   - Delivery Rate (%)
   - Bot Resolution Rate (%)
   - Escalation Rate (%)
2. **Response Time Benchmarks** — 4 progress bars against targets:
   - Bot First Response (target <5s)
   - Human Takeover Response (target <60s)
   - Query Resolution (target <5min)
   - Escalation Response (target <2min)
3. **Quality Score Breakdown** — 5 dimensions, each 0-100:
   - Message Clarity
   - Relevance
   - Helpfulness
   - Professionalism
   - Resolution Speed
4. **CSAT Feedback card:**
   - Large average score (e.g. 4.2/5) with 5-star display
   - Star distribution bars (5/4/3/2/1)
   - **Top Positive Feedback themes** (green box)
   - **Areas for Improvement** themes (red box)

### What you can do
**Nothing — read-only.** Use the insights here to drive changes in Bot Training, Bot Templates, and Automation.

### Reading the colours
- Green = at or above target
- Amber = within 25% of target
- Red = below target — investigate

### When to open this tab
- **Weekly** to track trends
- **After major campaigns** to see if quality dipped
- **Before any product review meeting** — these are your lead-with metrics

---

## Tab 8 — AI Intelligence

**Purpose:** AI-driven sentiment, topic, and intent analysis with actionable recommendations.
**Source:** [AdminWhatsApp.tsx:4439-4628](../../Sebenza_Hub_Claude/Sebenza_Hub_Claude_V2/client/src/pages/admin/AdminWhatsApp.tsx#L4439)

### What you see
1. **AI Sentiment Overview** card (purple gradient) with three columns:
   - **Overall Sentiment** — large coloured number
   - **Sentiment Distribution** — 3 progress bars (Positive / Neutral / Negative)
   - **Weekly Trend** — 7-bar mini chart (hover for week+score tooltip)
2. **Topic Insights** card — Top Positive Topics + Top Negative Topics (badge lists, e.g. "Job opportunities", "Quick responses" vs "Slow response", "Misunderstood query")
3. **Intent Classification** card — 7 intents with percentages and counts (e.g. Job Search 38%, Application Status 22%, CV Upload 15%, General Inquiry 12%, Interview Info 8%, Opt-out Request 3%, Other 2%)
4. **AI Recommendations** card — 6 actionable cards with icons and priority badges:
   - Optimize Send Times (High)
   - Reduce Bot Fallbacks (High)
   - Re-engage Inactive (Medium)
   - Template Performance (Low)
   - Language Support (Medium)
   - Escalation Optimization (Medium)

### What you can do
**Read-only.** Recommendations are descriptive, not actionable buttons — they point you at what to fix in other tabs.

### When to open this tab
- **Weekly** alongside Quality & CSAT
- When the **Negative Topics** list shifts — that's a leading indicator
- Whenever an **AI Recommendation** flips to "High" priority

---

## Tab 9 — Templates

**Purpose:** Manage **Meta-approved** WhatsApp message templates (the ones submitted to Meta for approval).
**Source:** [AdminWhatsApp.tsx:4633-5134](../../Sebenza_Hub_Claude/Sebenza_Hub_Claude_V2/client/src/pages/admin/AdminWhatsApp.tsx#L4633)

> ⚠️ **Don't confuse with Bot Templates (Tab 15).** These templates go to Meta for approval and are required for messaging *outside the 24-hour customer service window*. Bot Templates are internal in-app message strings.

### What you see
1. **"New Template"** button.
2. **Meta Template Requirements card** (amber) — How to Create + Best Practices reference.
3. **Meta Templates (Synced)** card with **Sync from Meta** button:
   - Table: Name (monospace) / Status (APPROVED/REJECTED/PENDING) / Category (UTILITY/MARKETING/AUTHENTICATION) / Language / Body Preview (80 chars) / Param count / Actions
4. **Meta Template Preview Dialog** (when you click a row) — WhatsApp-style mock-up showing exactly how the template will render on a candidate's phone.

### What you can do
- **Create** a new template (Name, Category, Language, Header, Body, Footer, Buttons, then **Submit to Meta**).
- **Sync from Meta** — pull the latest approval statuses (templates can be approved/rejected hours after submission).
- **Preview** any template against sample variable values.

### Status badge colours
- 🟢 APPROVED — ready to use in campaigns/broadcasts
- 🟡 PENDING — waiting on Meta (typically 15 min – 24 hours)
- 🔴 REJECTED — rewrite and resubmit. Click for Meta's rejection reason.

### When to open this tab
- **Quarterly** to submit new templates ahead of upcoming campaigns
- **After submitting a new template** — Sync until status flips to APPROVED
- Whenever a campaign fails with a "template not approved" error

---

## Tab 10 — Configuration

**Purpose:** Meta credentials, test connection, webhook URL, quick links.
**Source:** [AdminWhatsApp.tsx:5135-5312](../../Sebenza_Hub_Claude/Sebenza_Hub_Claude_V2/client/src/pages/admin/AdminWhatsApp.tsx#L5135)

This is where you spent [Parts 2-5 of the setup runbook](admin-whatsapp-command-center-setup.md#part-2--paste-credentials-into-sebenza-hub).

### What you see
1. **Connection Status card** — green/red border, big Wifi icon, "WhatsApp Connected" or "Not Configured", plus Phone ID and WABA chips.
2. **Master Bot Toggle** — same as Command Center.
3. **API Credentials card** (left) — 4 inputs: Phone Number ID / Access Token (with eye toggle to show/hide) / WABA ID / Verify Token. **Save Credentials** button.
4. **Test Connection card** (right) — phone number input + **Send Test Message** button.
5. **Webhook URL card** — copyable monospace URL + 4-step instructions.
6. **Quick Links card** — 5 external links to Meta Business Manager, WhatsApp Manager, Meta App Dashboard, WhatsApp Cloud API Docs, Message Template Guidelines.

### What you can do
- Save / rotate credentials.
- Send a test message to any SA number.
- Copy the webhook URL.
- Jump to Meta tools.

### When to open this tab
- **Once** during setup
- Whenever you **rotate the access token** in Meta
- Whenever the Connection Status flips from green to red

---

## Tab 11 — Contact CRM

**Purpose:** Your candidate database — lifecycle stages, engagement, risk scoring.
**Source:** [client/src/pages/admin/whatsapp/WhatsAppContactIntelligence.tsx](../../Sebenza_Hub_Claude/Sebenza_Hub_Claude_V2/client/src/pages/admin/whatsapp/WhatsAppContactIntelligence.tsx)

### What you see
1. **Contact list / search** — filter by lifecycle stage, engagement, risk.
2. **Contact detail panel** — full profile with CV data, extracted skills, application history.
3. **Segmentation tools** — save filters as named audiences (consumed by Broadcast Studio).
4. **Import / Export** — CSV bulk operations.

### Lifecycle stages
`New → Engaged → Applied → Interviewing → Placed → Inactive → Churned`

### Scoring
- **Engagement score** (0-100) — based on message frequency and recency
- **Risk score** — ML churn prediction; high risk = likely to ghost

### What you can do
- Search/filter contacts.
- Open a contact to see full enrichment (CV, skills, applications).
- Tag, segment, and save audiences.
- Bulk import (CSV) and export.
- Move contacts between lifecycle stages manually if the auto-detection got it wrong.

### When to open this tab
- **Weekly** to triage new high-risk contacts
- Before any campaign — build the audience here
- When a recruiter asks "what do we know about 0821234567?"

---

## Tab 12 — Team Inbox

**Purpose:** Multi-agent workspace with queue management, agent performance, SLA tracking, routing rules.
**Source:** [client/src/pages/admin/whatsapp/WhatsAppTeamInbox.tsx](../../Sebenza_Hub_Claude/Sebenza_Hub_Claude_V2/client/src/pages/admin/whatsapp/WhatsAppTeamInbox.tsx) (863 lines)

### What you see
1. **Live Dashboard banner** (orange gradient, animated pulse icon) — 8 metrics in a strip:
   Online Agents / Queue Size / Active Chats / Avg Response / SLA Compliance / CSAT Score / Escalations / Messages Today
2. **SLA Summary strip** — 3 cards: Within Target (green) / Warning (amber) / Breached (red)
3. **Five sub-tabs:**
   - **Queue** — priority filter dropdown + queue table (Contact / Priority / Topic / Language / Waiting Since / Wait Time / SLA Status / Assigned Agent / Actions)
   - **Agents** — agent cards with status dot, role, capacity, avg response time, CSAT, messages today, skills, languages
   - **Performance** — agent leaderboards and KPI comparison
   - **Canned Responses** — quick-reply template library
   - **Routing Rules** — auto-routing configuration

### What you can do
**Queue tab:**
- Filter queue by priority (Urgent / High / Normal / Low).
- **Assign** a queued conversation to a specific agent.

**Agents tab:**
- Set an agent's status (online / away / busy / offline).
- See per-agent stats live.

**Canned Responses tab:**
- **+ Add Canned Response** — Title, Message, Category. Agents access these in the chat composer.

**Routing Rules tab:**
- **+ Add Routing Rule** — Name, Condition (e.g. language=zu), Action, Target Team, Priority, Enabled toggle.

### Status dot colours
- 🟢 Online | 🟡 Away | 🔴 Busy | ⚫ Offline

### SLA badge colours
- 🟢 Within Target | 🟡 Warning (within 25% of breach) | 🔴 Breached

### When to open this tab
- **Daily** if you have any human agents handling escalations
- When the queue size on Command Center spikes
- Weekly to review agent performance and adjust routing rules

> 📡 **Polls:** stats every 15 seconds, agents and queue every 10 seconds.

---

# Row 2 — Building, training, analysing

## Tab 13 — Flow Builder

**Purpose:** Visual node-based conversation flow designer.
**Source:** [client/src/pages/admin/whatsapp/WhatsAppFlowBuilder.tsx](../../Sebenza_Hub_Claude/Sebenza_Hub_Claude_V2/client/src/pages/admin/whatsapp/WhatsAppFlowBuilder.tsx) (688 lines)

### What you see
1. **Header:** "Conversation Flow Builder" with **+ New Flow** button.
2. **Stats row** — 5 cards: Total Flows / Active Flows / Total Entries / Avg Completion % / Avg Duration.
3. **Three sub-tabs:**

**My Flows** — grid of flow cards, each with:
- Title + status badge (active/draft/paused/archived)
- Description
- 3-stat row: Nodes / Entries / Completion %
- Trigger info ("Trigger: keyword = apply")
- Actions: View / Play-Pause / Copy

**Templates** — grid of 9 pre-built templates (Job Application, Screening, CV Upload, etc.) with category, node count, popularity %, and a **Use Template** button.

**Analytics** — Node Type Distribution (count of each node type used across all flows) + Flow Performance Comparison (entry count and completion rate per flow).

### Node types
| Node | Icon colour | Purpose |
|---|---|---|
| Message | blue | Send plain text |
| Question | purple | Ask + capture answer |
| Condition | amber | Branch on variable |
| Action | green | Server action (parse CV, score answer) |
| Delay | gray | Wait N seconds |
| API Call | indigo | Hit Sebenza Hub endpoint |
| Assign Agent | orange | Hand off to Team Inbox |
| Tag | teal | Add tag to conversation/contact |
| End | red | Terminate flow |

### What you can do
- Create a new flow from scratch or from a template.
- Open a flow to see the visual canvas — drag/drop nodes, connect them, configure each node.
- **Activate / Pause** flows.
- **Duplicate** to test variants safely.
- See per-node analytics (entries, exits, drop-off rate).

### When to open this tab
- At setup — build your screening + CV upload + status check flows from templates
- When the Bot Training "Unmatched Log" surfaces a recurring conversation pattern
- Monthly to review per-node drop-off rates and trim unhelpful steps

---

## Tab 14 — Bot Training

**Purpose:** Train intents, manage FAQs, test the bot in a playground, monitor training metrics + unmatched messages.
**Source:** [client/src/pages/admin/whatsapp/WhatsAppChatbotTraining.tsx](../../Sebenza_Hub_Claude/Sebenza_Hub_Claude_V2/client/src/pages/admin/whatsapp/WhatsAppChatbotTraining.tsx) (1190 lines)

This is the **single most important tab for improving the bot over time.** Open it weekly.

### What you see
1. **Training Stats row** — cards include Total Intents, Active Intents, Avg Accuracy, Total FAQs, FAQ Hit Rate, Fallback Rate, and **Unmatched** count ([source line 409](../../Sebenza_Hub_Claude/Sebenza_Hub_Claude_V2/client/src/pages/admin/whatsapp/WhatsAppChatbotTraining.tsx#L409)).
2. **Four sub-tabs** ([source lines 424-427](../../Sebenza_Hub_Claude/Sebenza_Hub_Claude_V2/client/src/pages/admin/whatsapp/WhatsAppChatbotTraining.tsx#L424)):

**Intents** (`value="intents"`):
- Search bar + **+ New Intent** button
- Table: Intent Name / Description / Training Phrases count / Accuracy % / Status / Actions
- Create Intent dialog: Name, Description, Training Phrases (textarea, comma-separated)

**FAQ Knowledge Base** (`value="faqs"`):
- Search + Category filter + **+ New FAQ** button
- Table: Question / Answer Preview / Category / Usage Count / Actions
- Create FAQ dialog: Question, Answer, Category

**Conversation Playground** (`value="playground"`):
- Left: chat history (alternating user/bot bubbles)
- Right: **Response Details panel** showing detected intent, confidence score, suggested responses
- Bottom: input + **Send** + **Clear Chat**

**Training Metrics** (`value="metrics"`):
- Performance dashboards
- **Unmatched Messages Queue** (rendered inside this sub-tab at [source line 1028](../../Sebenza_Hub_Claude/Sebenza_Hub_Claude_V2/client/src/pages/admin/whatsapp/WhatsAppChatbotTraining.tsx#L1028)) — table of messages the bot couldn't classify, with a **Train this message** button per row that auto-creates an intent from the unmatched text + suggested intent

> ⚠️ **Note on the Unmatched Messages feature.** Earlier versions of this doc described "Unmatched Messages" as its own sub-tab — that's wrong. It's a section *inside* the Training Metrics sub-tab. The feature itself is real and works as described.

### Targets
- **Avg Accuracy:** >85%
- **FAQ Hit Rate:** >40% (the higher, the less the bot has to think)
- **Fallback Rate:** <10% (above 15% means intent training needs work)

### What you can do
- Create / edit / delete / activate intents.
- Create / edit / delete FAQs.
- Test any phrase in the Playground and see the bot's reasoning live.
- Convert any unmatched message into a new training phrase or new intent in one click.

### When to open this tab
- **Weekly** for a 30-minute Unmatched Log triage session
- Whenever you add a new feature or campaign (you'll need new intents)
- Whenever Quality & CSAT shows the Fallback Rate creeping up

---

## Tab 15 — Bot Templates

**Purpose:** The **internal** message strings the bot uses *during* a conversation. Not the same as Meta-approved templates.
**Source:** [client/src/pages/admin/whatsapp/WhatsAppBotTemplates.tsx](../../Sebenza_Hub_Claude/Sebenza_Hub_Claude_V2/client/src/pages/admin/whatsapp/WhatsAppBotTemplates.tsx) (1041 lines)

> See [setup runbook Part 7.2](admin-whatsapp-command-center-setup.md#72-in-app-bot-templates-the-bot-templates-tab) for the full distinction.

### What you see
1. **Category filter** dropdown — 14 categories: greeting, menu, job_browse, job_detail, applying, cv_upload, screening, assessment, status_check, faq, coaching, escalation, opt_out, error.
2. **Language filter** dropdown — All / EN / AF / ZU / XH / ST / TN.
3. **Template list** — each row shows category badge (colour-coded), language, body preview, "Is Interactive" indicator, plus Edit / Preview / Delete buttons.

### What you can do
- Filter by category and language to find a specific template fast.
- **Edit** any template's body (variables use `{{1}}`, `{{2}}` or named placeholders like `{{candidate_name}}`).
- **Preview** with sample data before saving.
- Mark a template as **Interactive** (Quick Reply buttons or list selectors) and configure the JSON payload.
- **Reset to Default** if you've broken something.

### Category colour key (visual aid)
| Category | Colour |
|---|---|
| greeting | green |
| menu | blue |
| job_browse / job_detail | purple/indigo |
| applying / cv_upload | amber/orange |
| screening / assessment | cyan/teal |
| status_check / faq / coaching | sky/violet/pink |
| escalation / opt_out / error | red/gray/dark red |

### When to open this tab
- **At setup** — review and personalise every default template
- Monthly to refresh wording
- Whenever you enable a new language (clone English templates and translate)

---

## Tab 16 — Deep Analytics

**Purpose:** Heavyweight reporting — ROI, cohorts, predictive forecasts, scheduled reports.
**Source:** [client/src/pages/admin/whatsapp/WhatsAppAnalyticsDeepDive.tsx](../../Sebenza_Hub_Claude/Sebenza_Hub_Claude_V2/client/src/pages/admin/whatsapp/WhatsAppAnalyticsDeepDive.tsx) (1780 lines — the second-biggest sub-component)

### What you see
Multiple sections (some implementations expose them as sub-tabs):

**Financial / ROI:**
- Total Investment (ZAR), Total Revenue (ZAR), ROI %, Cost Per Conversation, Cost Per Application, Cost Per Placement
- Monthly breakdown table: month / API cost / Template cost / Media cost / Revenue (all in ZAR)
- Channel comparison: Cost per Lead / Conversion Rate / Volume per channel

**Cohort Analysis:**
- Per-cohort retention curves (signup week → retention rates over subsequent weeks)

**Predictive Analytics:**
- Volume forecast (next 7 / 30 days)
- Trend direction
- Churn risk distribution (High / Medium / Low counts)
- Best send times (day, hour, score 1-100)
- Campaign success rate, growth rate, seasonal index

**Custom Reports:**
- List of saved reports with type / format / schedule / last generated
- **Schedule Report** dialog: Name, Type, Format (PDF/CSV/Excel), Schedule (daily/weekly/monthly/one-time)
- Per-report: Download, Delete, Edit

### What you can do
- Schedule recurring PDF/CSV/Excel reports to email.
- Download any past report.
- Read the cohort retention curves to understand long-term engagement.

### When to open this tab
- **Monthly** for the financial review
- **Quarterly** for cohort retention deep-dive
- Whenever someone asks "what does WhatsApp cost us per placement"

> 💡 **Set up at least one scheduled report** — a monthly ROI PDF emailed on the 1st is a useful forcing function.

---

## Tab 17 — Replay & Debug

**Purpose:** Step-by-step conversation replay with full bot decision tracing. Your debugger.
**Source:** [client/src/pages/admin/whatsapp/WhatsAppConversationReplay.tsx](../../Sebenza_Hub_Claude/Sebenza_Hub_Claude_V2/client/src/pages/admin/whatsapp/WhatsAppConversationReplay.tsx) (666 lines)

### What you see
1. **Conversation list** (left/top) with search by phone and outcome filter (all / completed / escalated / fallback). Each card shows phone, state, message count, sentiment, escalation/fallback flags, duration.
2. **Replay viewer** (main panel):
   - Conversation meta header
   - **Playback controls:** Play / Pause / Skip Back / Skip Forward / Speed selector (0.5x / 1x / 1.5x / 2x) / Reset
   - Current message bubble with direction, timestamp, delivery status
   - **Bot Decision panel:** detected intent + confidence, bot state before/after, matched rule, processing time
   - **Sentiment arc** mini chart
3. **Debug panel** (toggle on/off via Bug icon) — full step metadata:
   - Detected Intent + Confidence
   - Bot State Before / After
   - Matched Rule
   - Fallback Triggered (boolean, red if true)
   - Escalation Triggered (boolean, red if true)
   - Flow Node reference
   - Decision Reason (text)
   - Processing Time (ms)
   - **Critical Moments** list — auto-flagged steps where things went wrong

### What you can do
- Pick any past conversation, hit Play, watch it unfold step by step.
- See exactly what the bot detected and decided at every turn.
- Identify the *exact* message where a fallback or escalation triggered.
- Toggle the Debug panel for full ML metadata.

### When to open this tab
- **After every escalation** in your first month — it's the fastest way to learn where the bot is weak
- Whenever a candidate complains
- Weekly: pick 5 random escalated conversations and replay them

---

## Tab 18 — AI Matcher

**Purpose:** Extract skills from WhatsApp conversations and match candidates to live jobs. Drives the conversations → skills → job-cards-sent → applications → placements funnel.
**Source:** [client/src/pages/admin/whatsapp/WhatsAppCandidateMatcher.tsx](../../Sebenza_Hub_Claude/Sebenza_Hub_Claude_V2/client/src/pages/admin/whatsapp/WhatsAppCandidateMatcher.tsx) (1438 lines)

> ⚠️ **Earlier doc correction:** previous versions of this reference described AI Matcher as a phone-number-to-profile matcher (matching WhatsApp numbers against user/candidate/recruiter records). **That was wrong.** The tool actually extracts *skills* from conversation content and CV uploads, then matches those skills to live job postings. There is no phone-matching feature in this tab.

### What you see
1. **Skills cloud / top skills** stat block at the top.
2. **Conversion Funnel** — 5 stages from [source line 384](../../Sebenza_Hub_Claude/Sebenza_Hub_Claude_V2/client/src/pages/admin/whatsapp/WhatsAppCandidateMatcher.tsx#L384):
   - Conversations → Skills Extracted → Jobs Matched → Cards Sent → Applications
3. **Four sub-tabs** ([source lines 434-445](../../Sebenza_Hub_Claude/Sebenza_Hub_Claude_V2/client/src/pages/admin/whatsapp/WhatsAppCandidateMatcher.tsx#L434)):
   - **Live Matches** (`value="live-matches"`) — recent candidate-to-job matches with confidence + status
   - **Skill Extraction** (`value="skill-extraction"`) — extracted skills per conversation with extraction method (NLP / Keyword / CV Parse)
   - **Configuration** (`value="configuration"`) — matching weights and thresholds
   - **Analytics** (`value="analytics"`) — funnel charts and conversion rates

### Status badges (per match)
| Status | Badge | Meaning |
|---|---|---|
| `pending` | Pending (gray) | Match suggested, no action yet |
| `sent` | Card Sent (blue) | Job card pushed to candidate via WhatsApp |
| `applied` | Applied (purple) | Candidate clicked through and applied |
| `placed` | Placed (green) | Candidate hired |

### Confidence badges
- 🟢 **High** — confidence ≥0.85
- 🟡 **Medium** — confidence ≥0.60
- 🔴 **Low** — confidence <0.60

### Skill extraction methods
- **NLP** (purple) — natural language processing of conversation text
- **Keyword** (blue) — direct keyword matching against the skill taxonomy
- **CV Parse** (indigo) — extracted from an uploaded CV via the file parser

### What you can do
- Tune the matching weights and thresholds in the Configuration sub-tab.
- Review live candidate-to-job matches and see why each was suggested.
- Spot which extraction method is producing the best matches and adjust the balance.
- Track the funnel — the gap between "Cards Sent" and "Applications" tells you whether your job cards are compelling.

### When to open this tab
- **Weekly** to review match quality and tune thresholds
- After adding new job postings to check the bot is matching to them
- Monthly to review the Conversations → Placements ratio

---

## Tab 19 — Growth Engine

**Purpose:** Viral coefficient (K-factor) tracking, referral chains, QR/deep-link campaigns, source attribution.
**Source:** [client/src/pages/admin/whatsapp/WhatsAppGrowthEngine.tsx](../../Sebenza_Hub_Claude/Sebenza_Hub_Claude_V2/client/src/pages/admin/whatsapp/WhatsAppGrowthEngine.tsx) (1489 lines)

> ⚠️ **Earlier doc correction:** previous versions described sub-sections like "Funnel Analysis", "Win-Back Campaigns", "Audience Insights" — those don't actually exist. The real sub-tab structure is the 5 sub-tabs below.

### What you see
**Five sub-tabs** ([source lines 350-354](../../Sebenza_Hub_Claude/Sebenza_Hub_Claude_V2/client/src/pages/admin/whatsapp/WhatsAppGrowthEngine.tsx#L350)):

1. **Growth Dashboard** (`value="dashboard"`) — KPIs and growth charts. The **K-factor (viral coefficient)** is the headline metric, with a labelled state:
   - **Explosive Growth** — K ≥ 1.5 (green)
   - **Viral Growth** — K ≥ 1.0 (emerald)
   - **Steady Growth** — K ≥ 0.5 (amber)
   - **Sub-Viral** — K < 0.5 (red)
   Plus monthly growth (`monthlyGrowth.newContacts`), source breakdown (`sourceBreakdown` map), and trend deltas.
2. **Referral Chains** (`value="referrals"`) — visualises chains of who referred whom; track viral loop depth.
3. **QR Campaigns** (`value="qr"`) — generate per-campaign QR codes that open WhatsApp pre-filled with a tracking message. Print on flyers, billboards, business cards. Each QR has scan/conversion analytics.
4. **Deep Links** (`value="deeplinks"`) — UTM-tracked deep links with conversion attribution.
5. **Viral Analytics** (`value="viral"`) — viral loop instances, invite response rates, share counts.

### K-factor targets
- **K >1.0** is the holy grail — each contact brings in more than one new contact (viral)
- **K 0.5-0.99** — steady growth, sustainable
- **K <0.5** — you're losing contacts faster than you're acquiring them organically

### What you can do
- Generate new QR codes and deep links for tracked campaigns.
- View referral chain trees to see your top referrers.
- Track which sources (`sourceBreakdown`) drive the most new contacts.
- Monitor month-over-month growth and trend direction.

### When to open this tab
- **Monthly** for the growth review
- After launching any QR campaign or referral push (immediate scan/share metrics)
- When the K-factor drops below 1.0 — diagnose the broken loop

---

## Tab 20 — DNA Analyzer

**Purpose:** Conversation pattern analysis — personality traits, communication styles, dialogue flow entropy.
**Source:** [client/src/pages/admin/whatsapp/WhatsAppConversationDNA.tsx](../../Sebenza_Hub_Claude/Sebenza_Hub_Claude_V2/client/src/pages/admin/whatsapp/WhatsAppConversationDNA.tsx) (624 lines)

This is a more experimental analytical tool — useful for understanding *why* certain conversations succeed and others fail.

### What you see
1. **Conversation selector** (search or browse).
2. **Analysis results card:**
   - **Personality Traits** — 5+ traits scored 0-100 (e.g. Decisive, Collaborative, Cautious, Bold), shown as radar chart or horizontal bars
   - **Communication Style** — Formal / Casual / Technical / Emotional with percentage breakdown
   - **Dialogue Flow Entropy** — 0-1 scale (0 = very predictable; 1 = chaotic)
   - **Intent Evolution** — timeline showing how the candidate's intent shifted
   - **Sentiment Journey** — line chart with green→gray→red gradient

### What you can do
- Pick any conversation and analyse its "DNA".
- Download a per-conversation DNA report.
- Compare winning vs losing patterns to see what successful conversations share.

### When to open this tab
- **Ad-hoc** when investigating an unusually successful or unusually broken conversation
- When you're A/B testing greeting wording — DNA analysis can reveal whether the new greeting attracts a different *kind* of candidate

> 💡 This is the tab to open when you want to ask "what did our top 10 placements have in common conversationally?"

---

## Tab 21 — War Room

**Purpose:** Real-time escalation triage. The crisis room.
**Source:** [client/src/pages/admin/whatsapp/WhatsAppEscalationWarRoom.tsx](../../Sebenza_Hub_Claude/Sebenza_Hub_Claude_V2/client/src/pages/admin/whatsapp/WhatsAppEscalationWarRoom.tsx) (800 lines)

### What you see
1. **Header** — title "Smart Escalation War Room" with two key stats:
   - **Active escalations** count (icon: AlertOctagon)
   - **`predictedNext30Min`** — escalations the model expects in the next 30 minutes
2. **Escalation Queue** table — sorted by priority/sentiment/wait time:
   - Contact / Issue / Sentiment badge / Wait Time / Assigned Agent / Status / Actions
   - Rows colour-coded by severity
3. **Issue Categorization** — top issue types and counts
4. **Agent Dispatch panel** — available agents and assignment controls

> ⚠️ **Earlier doc correction:** previous versions referenced a "Crisis Dashboard banner" that fires on specific thresholds (3+ critical in 5 min, sentiment cluster, delivery drop). **Those thresholds aren't in the code** — they were extrapolation. The real signals are the `activeEscalations` and `predictedNext30Min` numbers in the header. Watch those instead.

### What you can do
- Filter the queue by severity.
- **Assign** a critical escalation to an available agent.
- **Resolve** an escalation (marks as handled).
- **Add Note** to an escalation for context.
- **Escalate Further** — bump priority to critical.

### Status badge colours
- 🔴 Critical (sentiment <-0.5 or wait time breached)
- 🟠 High
- 🟡 Medium
- ⚪ Low

### Header stats
The War Room header shows a `predictedNext30Min` count — escalations the model expects to happen in the next 30 minutes — alongside the live `activeEscalations` count. Use this as a forward-looking signal: if it's >5, get ahead of the queue now.

### When to open this tab
- **First thing every morning** alongside Command Center
- **Throughout the day** during business hours — set yourself a personal SLA of <15 min
- Whenever the active count or predicted count spikes
- Before you log off for the day — clear the queue

> 📡 **Polls every 10-15 seconds** for active escalations and stats ([WhatsAppEscalationWarRoom.tsx:158,168,178](../../Sebenza_Hub_Claude/Sebenza_Hub_Claude_V2/client/src/pages/admin/whatsapp/WhatsAppEscalationWarRoom.tsx#L158)).

---

# Cross-tab cheat sheet

## "I want to..." → "Open this tab"

| Goal | Tab |
|---|---|
| Send a one-off WhatsApp to a candidate | Command Center → Quick Send |
| Take over a conversation from the bot | Conversations → click row → Take Over |
| Schedule a re-engagement campaign | Campaigns |
| Send a one-off bulk broadcast now | Broadcast Studio |
| Build a multi-step automated journey | Broadcast Studio → New Drip Sequence |
| Add a new bot keyword response | Automation → Auto-Responders |
| Build a multi-turn conversation flow | Flow Builder |
| Add a new intent for the AI to recognise | Bot Training → Intents |
| Add a new FAQ pair | Bot Training → FAQ Knowledge Base |
| Test a candidate message without sending it | Bot Training → Conversation Playground |
| Find and fix unhandled candidate messages | Bot Training → Training Metrics → Unmatched Messages Queue |
| Personalise the bot's wording | Bot Templates |
| Submit a marketing template to Meta | Templates → New Template |
| Rotate the access token | Configuration |
| Match a phone number to an existing user profile | Conversations → click row → Match button |
| Tune candidate-to-job matching | AI Matcher → Configuration |
| See which skills are being extracted from chats | AI Matcher → Skill Extraction |
| Investigate why a conversation went wrong | Replay & Debug |
| Triage critical escalations | War Room |
| Run a POPIA audit | Compliance |
| Pull cost per placement | Deep Analytics → Financial / ROI |
| See which campaigns drive viral growth | Growth Engine |
| Spot quality dips | Quality & CSAT |
| Spot AI insight trends | AI Intelligence |
| Manage human agents | Team Inbox |
| Search/segment your candidate database | Contact CRM |

## Read vs edit

| Read-only tabs | Edit tabs |
|---|---|
| Command Center | Conversations |
| Compliance | Campaigns |
| Quality & CSAT | Broadcast Studio |
| AI Intelligence | Automation |
| Deep Analytics | Templates |
| Replay & Debug | Configuration |
| DNA Analyzer | Contact CRM |
| (parts of) Growth Engine | Team Inbox |
| | Flow Builder |
| | Bot Training |
| | Bot Templates |
| | AI Matcher |
| | War Room |

## Polling frequency

Verified from the actual `refetchInterval` values in the source files:

| Tab / query | Interval | Source |
|---|---|---|
| Command Center → Live Pulse | 10s | [AdminWhatsApp.tsx:481](../../Sebenza_Hub_Claude/Sebenza_Hub_Claude_V2/client/src/pages/admin/AdminWhatsApp.tsx#L481) |
| Command Center → Conversations list | 15s | AdminWhatsApp.tsx:533 |
| Command Center → Selected conversation | 10s (when open) | AdminWhatsApp.tsx:544 |
| Command Center → Other queries | 15-30s | AdminWhatsApp.tsx:443,471 |
| Team Inbox → Queue & Agents | 10s | WhatsAppTeamInbox.tsx |
| Team Inbox → Stats | 15s | WhatsAppTeamInbox.tsx |
| War Room → Active escalations | 10-15s | [WhatsAppEscalationWarRoom.tsx:158,168,178](../../Sebenza_Hub_Claude/Sebenza_Hub_Claude_V2/client/src/pages/admin/whatsapp/WhatsAppEscalationWarRoom.tsx#L158) |
| Everything else | On tab open + manual refresh | — |

There is **no 5-second poll** anywhere in the Command Center — the most aggressive interval is 10 seconds. Safe to leave any of the live tabs open all day.

---

## Related pages

- [[admin-whatsapp-command-center-setup]] — The setup runbook (this doc's parent). Read that first.
- [[01-entities/whatsapp-bot]] — Entity page for the WhatsApp bot feature
- [[02-concepts/whatsapp-integration]] — Concept overview of the WhatsApp integration
- [[03-workflows/admin-journey]] — Where this fits in the broader admin journey
