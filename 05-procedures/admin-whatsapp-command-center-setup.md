---
title: "Admin WhatsApp Command Center — Setup & Operations Runbook"
type: procedure
created: 2026-04-09
updated: 2026-04-09
tags: [admin, whatsapp, setup, runbook, bot, automation, popia, configuration]
sources: [whatsapp-bot-training-manual]
status: active
confidence: high
user-types: [admin]
dashboard-path: /admin/whatsapp
---

# Admin WhatsApp Command Center — Setup & Operations Runbook

> **Audience:** You (Admin / platform operator).
> **URL:** `https://www.sebenzahub.co.za/admin/whatsapp`
> **Sidebar path:** Admin → Parallel Tracks → Platform Config → WhatsApp → Configuration tab.
> **Required role:** `admin` (the entire `/admin/*` path is gated by `ProtectedRoute allowedRoles={["admin"]}`).

This runbook walks you from a freshly-deployed instance to a fully-running WhatsApp bot, then explains how to operate every tab in the Command Center day-to-day. Where it says **📸 Screenshot**, capture one before publishing this manual to the team.

---

## At-a-glance status check

Before starting, confirm what you already have. Based on the current production state:

| Item | Status | Value |
|---|---|---|
| Meta App created | ✅ Done | App ID `1295366105776721` (Sebenza Hub) |
| WhatsApp Business Account (WABA) | ✅ Done | WABA ID `914872117983837` |
| Phone number registered | ✅ Done | Phone Number ID `1006592152543941` |
| Webhook callback URL | ✅ Set in Meta | `https://www.sebenzahub.co.za/api/webhooks/whatsapp` |
| Verify token | ✅ Set | (stored in DB, masked in UI) |
| Sebenza Hub credentials saved | ✅ "WhatsApp Connected" badge showing | Active |
| **WhatsApp Bot toggle** | ⚠️ **Currently OFF** | Incoming messages will NOT get auto-replies until you flip this on |

> ⚠️ **Action item before going live:** the **WhatsApp Bot** toggle on the Configuration page is currently OFF (see [Part 5](#part-5--turn-the-bot-on)). Until it's flipped on, candidates can message your number but will receive nothing back.

> 📸 **Screenshot:** the green "WhatsApp Connected" banner with Phone and WABA chips, plus the red "Bot is OFF" strip directly below it.

---

## Prerequisites

1. **Admin role on the Sebenza Hub instance.** Confirm by visiting [/admin](https://www.sebenzahub.co.za/admin) — if you see the Admin sidebar with the orange Sebenza logo top-left, you're in.
2. **Access to the Meta Business Suite account that owns the Sebenza Hub WhatsApp number** (`wes.dutoit@sebenzahub.co.za` is the contact email on the App).
3. **A test SA mobile number** (08x or 27x) saved in your phone — you'll send a verification message to it in [Part 4](#part-4--test-the-connection). It must be a real, active WhatsApp number.
4. **A copy of your four credentials handy** (Phone Number ID, Access Token, WABA ID, Verify Token). You don't paste these every time — only when rotating.

---

# PART 1 — Meta-side prerequisites (reference only)

These are already complete on the production account. Document them so you can re-do them on staging or after a token rotation.

## 1.1 The Meta App

1. Sign in to [developers.facebook.com](https://developers.facebook.com) as the Business admin.
2. Open **My Apps → Sebenza Hub**.

> 📸 **Screenshot:** the Meta App dashboard showing App ID `1295366105776721`, Display name "Sebenza Hub", Contact email `wes.dutoit@sebenzahub.co.za`, Privacy policy URL `https://www.sebenzahub.co.za/privacy`.

3. Confirm the App is in **Live / Published** mode (top-left status pill). If it's in Development mode, only test numbers can receive messages.
4. Under **App Settings → Basic**, the **App secret** must remain private — it's not pasted into Sebenza Hub, only used by Meta to sign webhook payloads.

## 1.2 The WhatsApp Business Account (WABA)

1. From the Meta App, open **Use cases → Connect on WhatsApp → API Setup**.
2. Note the three IDs at the top:
   - **Phone Number ID** → `1006592152543941`
   - **WhatsApp Business Account ID** → `914872117983837`
   - **Display phone number** (the +27 number candidates message)
3. Click **Generate access token** (or use a permanent System User token from Meta Business Suite → System Users → Generate Token with `whatsapp_business_messaging` and `whatsapp_business_management` scopes). System User tokens are strongly preferred — they don't expire after 60 days.

> 🔐 **Token rotation:** if you ever rotate the access token in Meta, you must immediately re-paste it in [Part 2](#part-2--paste-credentials-into-sebenza-hub) or every outbound message will fail with `401 Unauthorized`.

## 1.3 Phone number verification & display name

The number must be **fully verified** in Meta Business Manager and have a Meta-approved **display name** before it can send template messages. Check **WhatsApp Manager → Phone numbers → Settings → Profile** — the display name should not say "pending review".

---

# PART 2 — Paste credentials into Sebenza Hub

Even though the credentials are already saved, this is the procedure to repeat after a token rotation, environment migration, or fresh deploy.

1. Sign in at [/admin](https://www.sebenzahub.co.za/admin) with your Admin account.
2. In the left sidebar, expand **Parallel Tracks → Platform Config** and click **WhatsApp**. (You can also click any direct admin WhatsApp tab from the top — they all share the same page.)
3. Click the **Configuration** tab in the top tab strip.

> 📸 **Screenshot:** the full Configuration tab — top tab strip highlighted on "Configuration", left sidebar showing "WhatsApp" highlighted under Platform Config.

4. In the **API Credentials** card on the left:

   | Field | What to paste | Where it comes from |
   |---|---|---|
   | **Phone Number ID** | `1006592152543941` | Meta App → API Setup |
   | **Access Token** | `EAAxxxxxxx…` (System User or Temporary) | Meta App → API Setup → Generate Token |
   | **WhatsApp Business Account ID (WABA ID)** | `914872117983837` | Meta Business Manager → WhatsApp Accounts |
   | **Verify Token** | A secret string of your choosing — e.g. `sebenza_verify_2026_q2` | You invent this. Must match what you paste into Meta in [Part 3](#part-3--register-the-webhook-in-meta). |

   > 💡 **Leave fields blank to keep existing credentials.** The form is non-destructive — empty fields are ignored, so you can rotate just the access token without re-typing the other three.

5. Click **Save Credentials**. The credentials are encrypted (AES-GCM) and stored in the `api_integrations` table via `PUT /api/admin/whatsapp/config`. The UI re-renders with masked values (e.g. `EAA…xxxx`) — you cannot retrieve the plaintext token through the UI again.

6. Confirm the green **WhatsApp Connected** banner appears at the top of the page with the Phone and WABA chips. If it's still red ("Not Connected"), see [Troubleshooting](#troubleshooting).

> 📸 **Screenshot:** API Credentials card with placeholder values, "Save Credentials" button highlighted.

---

# PART 3 — Register the webhook in Meta

Sebenza Hub receives inbound WhatsApp messages and delivery receipts via a single webhook. This step tells Meta where to deliver them.

1. In the Sebenza Hub Configuration tab, locate the **Webhook URL** card on the right side.
2. Click the copy icon next to `https://www.sebenzahub.co.za/api/webhooks/whatsapp`.
3. In a new browser tab, open Meta App → **Use cases → Customize → Configuration**.

> 📸 **Screenshot:** the Meta "Customize use case" page with the left rail showing Permissions, Quickstart, API Setup, **Configuration** (highlighted), Tech Provider onboarding, Resources.

4. In the **Webhook** section:
   - **Callback URL:** paste the copied URL → `https://www.sebenzahub.co.za/api/webhooks/whatsapp`
   - **Verify token:** paste the *exact* same string you put in the Sebenza Hub Verify Token field (case-sensitive).
5. Click **Verify and save**. Meta will immediately call `GET /api/webhooks/whatsapp` with the verify token; Sebenza Hub responds with the challenge string and Meta marks the webhook as verified.

> ⚠️ **If verification fails:** the most common cause is a verify-token mismatch. Re-check both ends — they must be byte-identical, no leading/trailing spaces. The next most common cause is that the production deploy isn't reachable yet (check `https://www.sebenzahub.co.za/api/webhooks/whatsapp?hub.mode=subscribe&hub.verify_token=YOUR_TOKEN&hub.challenge=test` returns `test`).

6. In the **Webhook fields** table below, click **Manage** and **Subscribe** to:
   - `messages` (inbound text/media/interactive)
   - `message_status_updates` (sent/delivered/read/failed receipts)
   - Optionally: `message_template_status_update` (template approval state changes)
7. Click **Save**. The Webhook fields table should now show a green **Subscribed** chip next to each event.

> 📸 **Screenshot:** Meta Webhook card showing Callback URL, Verify token (masked), and the Webhook fields table with `messages` and `message_status_updates` subscribed.

---

# PART 4 — Test the connection

You can verify everything is wired up before turning the bot on. The test sends a one-off WhatsApp message from your number to a target number using the live access token — it does *not* require the bot to be enabled.

1. Stay on the **Configuration** tab.
2. In the **Test Connection** card on the right, paste your own SA mobile number into **Test Phone Number**. Format: `0821234567` or `27821234567` (the form validates this — must be an 08x or 27x active WhatsApp number).
3. Click **Send Test Message**.
4. Within 5 seconds you should receive a WhatsApp message on that number from the Sebenza Hub display number. The message body is a fixed test template ("Test message from Sebenza Hub admin — connection verified.").
5. Back in the Sebenza Hub UI, a green toast confirms `Test message sent successfully`. The page also calls `GET /api/admin/whatsapp/health` and updates the connection diagnostic.

> 📸 **Screenshot:** Test Connection card with phone number filled in and the green success toast.

**If the test fails**, jump to [Troubleshooting → Test message failures](#test-message-failures).

---

# PART 5 — Turn the bot on

Until this step, your number is connected but silent. Flipping the toggle activates the inbound message handler that runs every incoming candidate message through the bot pipeline (state machine → intent classifier → flow → response).

1. On the **Configuration** tab, locate the orange **WhatsApp Bot** strip directly under the green Connected banner. It currently reads:
   > 🤖 Bot is OFF — incoming messages will not get automatic responses
2. Click the toggle on the right of that strip. It should slide to ON and the strip turns green: `🤖 Bot is ON — incoming messages will be auto-handled`.
3. The toggle persists to the `whatsappBotConfig` table (`PUT /api/admin/whatsapp/bot-config` with `{ enabled: true }`).
4. **Smoke test:** from your personal WhatsApp, send the word `Hi` to the Sebenza Hub display number. Within 2-3 seconds you should receive the language selector greeting (English / Afrikaans / isiZulu / isiXhosa / Sesotho / Setswana). If you get nothing, see [Troubleshooting → Bot is on but not replying](#bot-is-on-but-not-replying).

> 📸 **Screenshot:** the bot strip in BOTH states — OFF (red/grey) and ON (green) — for the manual.

---

# PART 6 — Bot Settings (the heart of the automation)

This is what most admins miss. Connecting credentials only gets you a relay; the **Bot Settings** define personality, business hours, escalation rules, and which features the bot exposes. All values write to the singleton `whatsappBotConfig` row via `PUT /api/admin/whatsapp/bot-config`.

Open the **Configuration** tab (or the dedicated **Bot Training** tab — both expose the same settings panel).

## 6.1 Identity & greeting

| Setting | Recommended for Sebenza Hub | Notes |
|---|---|---|
| **Greeting Message** | `Welcome to Sebenza Hub — your AI-powered recruitment assistant! I can help you find jobs, check application status, upload your CV, and more.` | Sent on first contact, before the language picker. Keep under 1024 chars (WhatsApp text limit). |
| **Default Language** | `en` (English) | Used until the candidate picks one. Options: `en`, `af`, `zu`, `xh`, `st`, `tn`. |
| **Bot Persona** | Professional, friendly, concise | Free-text — feeds into the LLM system prompt for fallback responses. |
| **Auto-Reply Enabled** | ON | Master switch on top of the toggle in Part 5. |

## 6.2 Business hours

| Setting | Value | Notes |
|---|---|---|
| **Business Hours Start** | `08:00` | SAST. Outside these hours the after-hours auto-responder fires (see [Part 8](#part-8--automation--auto-responders--bot-flows)). |
| **Business Hours End** | `17:00` | |
| **Timezone** | `Africa/Johannesburg` | Should match your server timezone. |
| **Working Days** | Mon-Fri | Weekend messages get the after-hours flow. |

## 6.3 Escalation thresholds

| Setting | Recommended | What it does |
|---|---|---|
| **Max Retries** | `3` | After 3 unmatched messages in a row the bot falls back to the escalation flow. |
| **Escalation Threshold** | `3` negative messages | Triggers human handover when sentiment is negative for 3 consecutive turns. |
| **Idle Timeout** | `30` minutes | Conversation state resets to idle if the candidate goes silent. |
| **Fallback Message** | `I didn't quite understand that. Type MENU to see your options, or type AGENT to speak with a recruiter.` | Shown when intent confidence is below threshold. |

## 6.4 Enabled features

The bot exposes a curated menu to candidates. Toggle each feature individually:

- ✅ **`job_browse`** — Browse active jobs by location/category
- ✅ **`screening_chat`** — Run the screening bot Q&A inside WhatsApp
- ✅ **`assessment`** — Deliver competency tests
- ✅ **`coaching`** — AI career coaching
- ✅ **`cv_upload`** — Accept CV files (PDF/DOC/DOCX), parse via the media handler
- ✅ **`status_check`** — Candidates query their application status
- ✅ **`faq`** — Match against the FAQ database (see Part 7)

Disable any you're not ready to support — disabled options won't appear in the main menu.

## 6.5 Supported languages

Tick the languages you've translated templates and FAQs for. **Don't enable a language you haven't trained the bot in** — candidates picking that language will get fallback messages every time. Recommended starting set: `en`, `af`, `zu`. Add the rest as you grow your training data.

Click **Save Bot Settings** at the bottom of the panel. The toast confirms `Bot configuration updated`.

> 📸 **Screenshot:** Bot Settings panel with all five subsections visible.

---

# PART 7 — Templates & Bot Templates

There are two distinct kinds of templates in the Command Center. Don't confuse them.

## 7.1 Meta-approved Templates (the **Templates** tab)

These are message templates that have been **submitted to and approved by Meta**. They're the only thing you can send to a candidate *outside* the 24-hour customer service window. Used for: re-engagement campaigns, application status updates, interview reminders, marketing broadcasts.

**To create a new template:**

1. Click the **Templates** tab in the top tab strip.
2. Click **+ New Template**.
3. Fill in:
   - **Name** (snake_case, e.g. `interview_reminder_v1`)
   - **Category:** Utility | Marketing | Authentication
   - **Language:** pick from your enabled list
   - **Header** (optional — text, image, video, document)
   - **Body** (the main text — use `{{1}}`, `{{2}}` for variables)
   - **Footer** (optional, 60 chars)
   - **Buttons** (optional — Quick Reply or Call-to-Action)
4. Click **Send Test** to render the template against a sample variable set in the preview pane.
5. Click **Submit to Meta**. Approval typically takes 15 minutes to a few hours; status appears in the Templates tab as `Pending → Approved | Rejected`.

> ⚠️ **Marketing templates have stricter rules.** Meta rejects anything pushy, misleading, or referencing competitors. Keep marketing templates value-led ("New jobs matching your profile") not promotional ("Don't miss out!!!").

## 7.2 In-app Bot Templates (the **Bot Templates** tab)

These are **internal** message templates used *by the bot* during a live conversation — they don't go through Meta approval because they're sent inside the 24-hour window in response to a candidate action. They're stored in the `whatsappBotTemplates` table.

Examples: the main menu, the language picker, the consent prompt, the "no jobs found" message, the "your CV was uploaded" confirmation.

**To edit a bot template:**

1. Click the **Bot Templates** tab.
2. Filter by **Category** (greeting, menu, consent, jobs, cv, fallback, etc.) and **Language**.
3. Click any template row to edit the body. Variables use `{{candidate_name}}`, `{{job_count}}`, etc. — see the variable reference in the right rail.
4. Click **Preview** to render with sample data, then **Save**.
5. Use the **Reset to Default** button if you want to revert your edits — the system ships with sensible defaults.

> 💡 **Always edit Bot Templates before turning the bot on for real candidates.** Default templates work but reference "Sebenza Hub" generically — personalise them to your tone of voice.

> 📸 **Screenshot:** Bot Templates tab with the category filter expanded and one template open in the editor.

---

# PART 8 — Automation — Auto-responders & Bot Flows

The **Automation** tab is where the bot learns to react. Two sub-sections: **Auto-Responders** (simple keyword/regex rules) and **Bot Flows** (multi-step conversation graphs).

## 8.1 Auto-Responders

Use these for the long tail of one-off questions that don't deserve a full flow.

1. Open **Automation → Auto-Responders**.
2. Click **+ New Rule**.
3. Configure:
   - **Trigger Type:** `keyword` | `regex` | `new conversation` | `after hours`
   - **Match Mode:** `exact` | `contains` | `starts with` | `regex`
   - **Trigger Value:** e.g. `salary` (lowercase — matching is case-insensitive)
   - **Response Type:** `message` (send a text reply) | `escalate` (route to human) | `tag` (add a tag, no reply)
   - **Response Body:** the reply text
   - **Priority:** integer; higher numbers match first. Use `100` for catch-all, `500` for specific rules.
4. **Save**. Test it from your personal WhatsApp.

**Recommended starter rules:**

| Trigger | Mode | Response | Priority |
|---|---|---|---|
| `salary` | contains | "Salary information is shown on each individual job listing. Type MENU to browse jobs." | 500 |
| `office hours` / `hours` | contains | "Our recruitment team is available Mon–Fri, 08:00–17:00 SAST. Outside these hours I can still help you browse jobs and upload your CV." | 500 |
| `contact` / `email` | contains | "You can reach the team at info@sebenzahub.co.za, or type AGENT to be connected to a recruiter." | 500 |
| `agent` / `human` / `recruiter` | contains | (Response Type: `escalate`) | 900 |
| `stop` / `unsubscribe` / `opt out` | contains | (Response Type: `escalate` + tag `opted_out`) | 1000 |
| (after hours) | after hours | "Thanks for messaging Sebenza Hub! Our team replies between 08:00 and 17:00 SAST. In the meantime I can help you browse jobs — type MENU to start." | 50 |

## 8.2 Bot Flows

Bot Flows are graphs of nodes that handle multi-turn conversations. Use these for: the screening Q&A, the CV upload journey, the application status check, the apply-to-job journey.

1. Open **Automation → Bot Flows** (or the dedicated **Flow Builder** tab — same engine).
2. Click **+ New Flow** and give it a name (e.g. `screening_v2`) and a trigger keyword (e.g. `apply`).
3. Drag node types from the left palette onto the canvas:

   | Node | Purpose |
   |---|---|
   | **Message** | Send plain text |
   | **Question** | Send text and wait for a reply, store it in a variable |
   | **Condition** | Branch based on a variable value (regex, equals, contains) |
   | **Action** | Call a server action (e.g. parse CV, score answer) |
   | **API Call** | Hit an internal Sebenza Hub endpoint (e.g. `POST /api/applications`) |
   | **Delay** | Wait N seconds before next node (humanises the bot) |
   | **Assign Agent** | Hand off to a Team Inbox agent |
   | **Tag** | Add a tag to the conversation/contact |
   | **End** | Terminate the flow and return to idle |

4. Connect nodes with arrows. Each Question/Condition can branch.
5. Click **Activate** in the top-right. Flows are versioned — you can keep `screening_v1` live while building `v2`, then atomically swap.
6. Test in the **Flow Playground** before activating in production.

> 💡 **Per-node analytics.** Once a flow is live, click any node to see entries / exits / drop-off rate. Drop-offs above 30% on a single question usually mean the question is unclear or asks for too much.

> 📸 **Screenshot:** Flow Builder canvas with a 5-node flow visible, plus the node-analytics popover.

## 8.3 Bot Training (intents, FAQs, playground)

Open the **Bot Training** tab. This is the third leg of the automation tripod, alongside Auto-Responders and Flows.

### Intents

Intents are *what the candidate means*, regardless of phrasing. Click **+ New Intent**:

1. **Name:** snake_case (e.g. `apply_to_job`, `salary_question`, `application_status`).
2. **Training Phrases:** add 8-15 example utterances. The more variation the better:
   - "I want to apply"
   - "how do I apply"
   - "submit my application"
   - "ek wil aansoek doen" (Afrikaans variants)
   - "ngifuna ukufaka isicelo" (isiZulu variants)
3. **Linked Action:** which Bot Flow to trigger when this intent matches.
4. **Save**. The classifier retrains in the background (~30 sec).

### FAQs

Direct question → answer pairs. Use these for stable, factual answers.

| Question | Answer |
|---|---|
| What is Sebenza Hub? | Sebenza Hub is South Africa's AI-powered recruitment platform... |
| Is Sebenza Hub free for job seekers? | Yes — browsing jobs and uploading your CV is completely free. |
| How do I get verified? | Tap MENU → Verify My Profile and follow the steps. |

Aim for ~50 FAQs in the first month. Pull questions from the **Unmatched Log** weekly.

### Playground

Type any candidate message into the Playground input. The bot responds in real-time and shows the **debug rail**:

- Detected intent + confidence score
- Active state (e.g. `menu`, `job_browse`, `applying`)
- Sentiment score (-1.0 to +1.0)
- Which template/flow handled the response

**Use the Playground every time you change a flow or add an intent.** It's faster than testing through real WhatsApp.

### Unmatched Log

The bot logs every message it couldn't confidently classify. Open this view at least once a week:

1. Sort by frequency (descending).
2. For high-frequency unmatched messages, either:
   - Add them as training phrases to an existing intent
   - Create a new intent
   - Add an Auto-Responder rule
3. Mark each row as **Resolved** to keep the queue clean.

> 📸 **Screenshot:** Bot Training tab with Intents, FAQs, Playground, and Unmatched panels visible.

---

# PART 9 — Day-to-day operations

Once setup is done, you'll spend most of your time in seven tabs. Here's what each one does and how to use it.

## 9.1 Command Center tab (your home page)

The real-time operations dashboard. Open this first thing every morning.

- **Live Pulse** — active conversations, messages in last 5 min / hour, bot vs human handled, average response time, escalation count.
- **Quick Send** — paste any SA phone number, type a message, hit send. Bypasses the bot entirely. Use for one-off manual outreach.
- **Sentiment Breakdown** — pie chart of positive / neutral / negative across the last 24h. **If negative >15%, investigate immediately** in Quality & CSAT.
- **Conversion Funnel** — Browsed → Responded → Applied → Hired counts and rates. Tracks the candidate lifecycle through WhatsApp.
- **Bot Health** — connection status, message delivery rate, processing speed (p50/p95). If delivery rate drops below 95%, jump to Troubleshooting.

> 💡 **Daily check (5 min):** Live Pulse → Sentiment → Funnel. If all three are green, move on. If any is red, drill into the relevant tab.

## 9.2 Conversations tab

The full conversation manager.

- **Search** by phone number or message content.
- **Filter** by state: All / Active / Escalated / Completed / Opted Out.
- **Click any row** to see the full message history with timestamps and delivery receipts.
- **Send manual message** — types directly into the conversation as the bot identity.
- **Takeover** — switches the conversation from `bot` mode to `human` mode (via `POST /api/whatsapp/conversations/:id/takeover`). The bot stops auto-responding; you (or an assigned agent) handle replies.
- **Release** — returns control to the bot (`POST /api/whatsapp/conversations/:id/release`).
- **Link to user** — associate the conversation with an existing Individual user profile.
- **Tag** and **Notes** — internal-only metadata for filtering and reporting.
- **Delete** — POPIA-compliant erasure when a candidate exercises right-to-be-forgotten.

## 9.3 Team Inbox tab

The agent workbench (you'll likely delegate this to recruitment ops staff once you scale).

- See which agents are **online / away / busy** with their active conversation count.
- Conversation queue with priority levels (Urgent / High / Normal / Low) and SLA timers.
- **Routing rules** — auto-assign incoming conversations based on language, topic, agent skill.
- **Canned responses library** — pre-written replies for common scenarios. Press `/` in the reply box to insert.
- **Wait time tracking** — alerts if any conversation breaches SLA.

## 9.4 Campaigns tab & Broadcast Studio tab

Two flavours of outbound messaging.

**Campaigns** = scheduled, multi-step, A/B testable.

1. Click **New Campaign**.
2. Name it, pick a Meta-approved template, select target audience.
3. Optionally create an A/B variant.
4. Schedule a send time or click **Send Now**.
5. Monitor: Sent / Delivered / Read / Failed counts, click-through rate, conversion rate.

**Broadcast Studio** = ad-hoc segment blasts.

- **All Opted-In** — everyone with consent (the safe default)
- **Active** — recent activity in last 7 days
- **Inactive 30+ days** — dormant candidates, good for re-engagement
- **New (7 days)** — recently signed up

> ⚠️ **POPIA discipline:** Broadcast Studio respects opt-out flags automatically — opted-out contacts are *always* excluded, regardless of which segment you pick. Don't try to override this.

## 9.5 Compliance tab (POPIA dashboard)

Your audit trail.

- **Total opted-in vs opted-out** counts and ratio.
- **Consent rate %** — should be >85%. If lower, the consent prompt is probably too aggressive.
- **Recent opt-outs** — chronological log with timestamps, candidate phone (masked), and the message that triggered the opt-out.
- **Data retention settings** — how long conversation history is kept before automatic purge (default: 24 months).
- **Audit trail export** — CSV download for compliance reviews.

**Open this tab at least monthly.** Spike in opt-outs usually means a campaign was too pushy.

## 9.6 Quality & CSAT tab

Conversation quality metrics.

- **Overall sentiment score** and 7-day trend line.
- **Top topics driving negative sentiment** — drill into these to find broken flows.
- **Intent distribution** — what candidates actually ask about, helps you prioritise training.
- **Fallback rate** — % of messages the bot couldn't handle. Target: <10%. Above 15% means the intent training needs work.
- **CSAT scores** — if you've enabled the post-conversation survey.

## 9.7 AI Intelligence tab

Advanced AI insights.

- **Bot state distribution** — how many conversations are stuck in each state. A spike in `escalated` is a problem.
- **Language breakdown** across conversations — confirms which languages you really need to support.
- **Intent confidence scoring** — average confidence per intent. Below 0.6 means the training phrases are too few or too similar.
- **Conversation outcome predictions** — ML-driven forecasts of which conversations will convert.
- **Topic clustering** — emergent topics the bot has never been trained on (early warning for content gaps).

## 9.8 Contact CRM tab

Your candidate database.

- **Search/filter** by lifecycle stage, engagement score, risk score.
- **Lifecycle stages:** New → Engaged → Applied → Interviewing → Placed → Inactive → Churned.
- **Engagement score** (0-100) — based on message frequency and recency.
- **Risk score** — churn prediction model.
- **Enrichment** — view CV data, extracted skills, application history.
- **Audience segments** — save filters for use in Broadcast Studio.
- **Import / export** — CSV bulk operations.

## 9.9 Deep Analytics tab

Heavyweight reporting.

- **ROI Dashboard** — cost per conversation / per application / per placement, by channel.
- **Cohort Analysis** — retention by signup week.
- **Predictive** — volume forecasts, churn risk per contact, best send times.
- **Reports** — generate PDF reports, schedule automated weekly/monthly delivery to your email.

## 9.10 Replay & Debug tab

When something goes wrong, this is where you find out why.

1. Pick any conversation (search by phone or ID).
2. **Replay** plays the conversation back step-by-step.
3. For each message, the right rail shows:
   - Detected intent + confidence
   - State transition (e.g. `menu → job_browse`)
   - Sentiment delta
   - Which template/flow handled the response
4. **Highlight critical moments** — the timeline marks fallbacks, escalations, and sentiment drops in red.

> 💡 **Use Replay for every escalated conversation in your first week.** It's the fastest way to learn where the bot is weak.

## 9.11 AI Matcher tab

Automatic candidate-to-job matching.

- **Skills extracted** — from conversations and uploaded CVs.
- **Matching weights** — sliders for skills / experience / location / salary. Tune to your hiring priorities.
- **Match score threshold** — minimum score to auto-send a job card (default 0.75).
- **Funnel** — Conversations → Skills extracted → Matched → Cards sent → Applied.

## 9.12 Growth Engine tab

Viral growth tracking.

- **K-factor** (viral coefficient) — how many new contacts each existing contact brings in.
- **Referral chain tracking.**
- **QR code campaigns** — generate per-campaign QR codes that open WhatsApp pre-filled with a tracking message. Print them on flyers, billboards, business cards.
- **Deep link management** with UTM tracking.
- **Monthly growth breakdown by source.**

## 9.13 DNA Analyzer tab

Pattern analysis on conversation shapes.

- Identifies "DNA types": Quick Converter / High Engager / Bot Champion / Drop-off Risk / Human Seeker / Silent Browser.
- Pattern success rates per type.
- Sentiment shapes: Rising / Falling / V-shaped / Flat.
- **Winning vs losing patterns** — what successful conversations look like, what failing ones do differently.

## 9.14 War Room tab

Escalation command centre.

- **Active escalation queue** with wait times.
- **Predicted escalations** — conversations the model thinks are about to escalate.
- **Risk signals per conversation** — which features triggered the prediction.
- **Escalation heatmap** by time and topic.
- **Resolution tracking** — who handled each escalation and how it ended.

> 💡 **Set a personal SLA:** no escalation should sit in the War Room queue more than 15 minutes during business hours.

---

# PART 10 — Operational rhythms

Once everything is live, settle into a cadence. Below is a recommended starter rhythm — adjust as you learn what your inbox actually needs.

| Frequency | Task | Tab |
|---|---|---|
| **Every morning (5 min)** | Glance at Live Pulse, Sentiment, Funnel | Command Center |
| **Every morning (5 min)** | Clear the escalation queue | War Room → Team Inbox |
| **Weekly (30 min)** | Triage Unmatched Log, add intents/FAQs | Bot Training |
| **Weekly (15 min)** | Review Quality & CSAT trends | Quality & CSAT |
| **Weekly (15 min)** | Replay 5 random escalated conversations | Replay & Debug |
| **Monthly (1 hour)** | POPIA review — opt-out spikes, consent rate, audit export | Compliance |
| **Monthly (1 hour)** | Broadcast / re-engagement campaign to dormant segment | Campaigns / Broadcast |
| **Monthly (30 min)** | Tune AI Matcher weights based on hire outcomes | AI Matcher |
| **Quarterly (2 hours)** | Submit new Meta templates for upcoming campaigns | Templates |
| **Quarterly (1 hour)** | Rotate the Access Token in Meta + re-paste in Sebenza Hub | Configuration |

---

# Troubleshooting

## "WhatsApp Connected" banner is red after saving credentials

- The most common cause is a typo in the Phone Number ID or WABA ID. Re-copy from Meta API Setup.
- Second most common: the Access Token has expired (temporary tokens last 24 hours). Generate a System User token instead.
- Check `GET /api/admin/whatsapp/health` from the browser devtools Network tab — the response body has the exact error from Meta.

## Test message failures

| Symptom | Likely cause | Fix |
|---|---|---|
| `401 Unauthorized` | Access token invalid or expired | Re-generate token in Meta, paste in Configuration |
| `400 Bad Request: phone number invalid` | Format issue | Use `27821234567` (no `+`, no spaces) |
| `131030 — Recipient not in allowed list` | App is in Development mode | Add the test number under Meta App → API Setup → Phone numbers, OR publish the App to Live |
| `131047 — Re-engagement message` | Outside 24h window AND no template provided | Use a Meta-approved template instead of plain text |
| Test sends but no message arrives | Recipient blocked the business number | Try a different test number |

## Webhook verification fails in Meta

- Verify token mismatch — re-paste both ends, byte-identical, no whitespace.
- Production deploy isn't live — visit `https://www.sebenzahub.co.za/api/webhooks/whatsapp` directly; you should get a 400 response (not a 502 / 504).
- Server logs — `server/routes.ts` around line 29170 logs webhook GET attempts; check for the exact challenge string Meta sent.

## Bot is on but not replying

1. Check the **Bot Health** widget on the Command Center — is processing speed normal?
2. Open **Replay & Debug** for the silent conversation — did the message even arrive (i.e. did Meta deliver the webhook)?
3. If the message arrived but the bot didn't process it: check **AI Intelligence → Bot state distribution** for stuck states.
4. If the message *didn't* arrive: webhook subscription is broken. Re-verify in Meta App → Configuration → Webhooks → Subscribed fields.
5. Last resort: toggle the bot OFF and ON again to reset the in-memory handler.

## Templates rejected by Meta

- **Marketing template rejected** — usually too promotional. Rewrite as a value statement.
- **Variable mismatch** — the template body has `{{1}}` but you submitted no example values. Always provide example values for every variable.
- **Translation mismatch** — multi-language templates must have the same number of variables in every language.

## Sentiment plummets after a campaign

- Open **Quality & CSAT → Top topics driving negative sentiment** — the topics will tell you what candidates are angry about.
- Cross-reference with **Compliance → Recent opt-outs** — a spike in opt-outs immediately after a campaign means the campaign was too aggressive or too frequent.
- Pause the campaign in **Campaigns** tab.

## POPIA data subject access request (DSAR)

1. Search for the candidate's phone number in **Conversations**.
2. Click **Export conversation** to download the full message history as CSV.
3. Cross-reference in **Contact CRM** for any enriched data (CV, skills, applications).
4. To erase: click **Delete** in the conversation header AND in the Contact CRM record. Both writes are permanent.

---

# Reference appendix

## Environment variables

These are the variables the server reads on boot if no `api_integrations` row exists. In production they're stored in the encrypted DB row instead — UI edits override env vars.

| Variable | Purpose |
|---|---|
| `WHATSAPP_PHONE_NUMBER_ID` | Meta phone number ID |
| `WHATSAPP_ACCESS_TOKEN` | Meta access token (System User preferred) |
| `WHATSAPP_WABA_ID` | WhatsApp Business Account ID |
| `WHATSAPP_VERIFY_TOKEN` | Webhook verification secret |

## Key API endpoints

All admin endpoints require `requireRole("admin")` middleware.

| Method & path | Purpose |
|---|---|
| `GET /api/admin/whatsapp/config` | Read masked credentials |
| `PUT /api/admin/whatsapp/config` | Save credentials (encrypted) |
| `POST /api/admin/whatsapp/test` | Send test message |
| `GET /api/admin/whatsapp/health` | Connection diagnostics |
| `GET /api/admin/whatsapp/live-pulse` | Real-time operations data |
| `GET /api/admin/whatsapp/bot-states` | State distribution |
| `GET /api/admin/whatsapp/sentiment-summary` | Sentiment analytics |
| `GET /api/admin/whatsapp/bot-config` | Read bot config |
| `PUT /api/admin/whatsapp/bot-config` | Save bot config |
| `GET /api/admin/whatsapp/bot-templates` | List templates |
| `PUT /api/admin/whatsapp/bot-templates` | Upsert templates |
| `POST /api/admin/whatsapp/bot-templates/preview` | Render with variables |
| `GET /api/admin/whatsapp/compliance` | POPIA dashboard |
| `GET /api/admin/whatsapp/usage` | Cost & limits |
| `POST /api/admin/whatsapp/quick-send` | Manual outbound message |
| `GET /api/whatsapp/conversations` | List conversations |
| `POST /api/whatsapp/conversations/:id/send` | Manual reply |
| `POST /api/whatsapp/conversations/:id/send-template` | Send Meta template |
| `POST /api/whatsapp/conversations/:id/takeover` | Bot → human |
| `POST /api/whatsapp/conversations/:id/release` | Human → bot |
| `GET /api/webhooks/whatsapp` | Meta verification challenge |
| `POST /api/webhooks/whatsapp` | Inbound message + delivery receipts |

## Database tables

In `shared/schema.ts` (Drizzle ORM):

| Table | Stores |
|---|---|
| `whatsappConversations` | Conversation state, language, escalation, POPIA consent flags |
| `whatsappMessages` | Message bodies, direction, delivery status, sentiment, AI metadata |
| `whatsappMediaUploads` | CV/document attachments + parse results |
| `whatsappAssessmentSessions` | Competency tests delivered via WhatsApp |
| `whatsappAnalytics` | Aggregated metrics by period |
| `whatsappReengagementCampaigns` | Campaigns with A/B variants and delivery tracking |
| `whatsappBotConfig` | Singleton bot configuration row |
| `whatsappBotTemplates` | Configurable in-app templates |
| `whatsappApplyLinks` | QR codes / short links / UTM tracking |
| `api_integrations` | Encrypted credential storage (Phone Number ID, Access Token, WABA ID, Verify Token) |

## Related pages

- [[01-entities/whatsapp-bot]] — Entity page for the WhatsApp bot feature
- [[02-concepts/whatsapp-integration]] — Concept overview of the WhatsApp integration
- [[03-workflows/admin-journey]] — Where the WhatsApp Command Center sits in the broader admin journey
- Source: [[09-sources/whatsapp-bot-training-manual]] (if filed) — original Sebenza Hub bot manual at `Sebenza_Hub_Claude_V2/docs/WhatsApp-Bot-Training-Manual.md`
