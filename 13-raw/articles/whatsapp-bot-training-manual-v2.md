# Linda — Sebenza Hub WhatsApp Bot Training Manual

---

## Table of Contents

1. [Overview](#1-overview)
2. [Getting Started — Initial Setup](#2-getting-started--initial-setup)
3. [The Candidate Experience](#3-the-candidate-experience)
4. [Admin Dashboard — WhatsApp Command Center](#4-admin-dashboard--whatsapp-command-center)
5. [Recruiter Dashboard — WhatsApp Bot](#5-recruiter-dashboard--whatsapp-bot)
6. [Screening Bot Integration](#6-screening-bot-integration)
7. [WhatsApp Apply — Application Management](#7-whatsapp-apply--application-management)
8. [Advanced Features](#8-advanced-features)
9. [Troubleshooting & FAQ](#9-troubleshooting--faq)

---

## 1. Overview

Linda is Sebenza Hub's AI-powered WhatsApp recruitment assistant. She connects with candidates through WhatsApp and handles the full recruitment lifecycle: job browsing, applications, CV parsing, candidate screening, assessments, career coaching, and human escalation.

### What Linda does:

- Greets candidates in 6 South African languages
- Collects POPIA consent before processing personal data
- Helps candidates search and apply for jobs
- Parses CVs automatically from uploaded documents
- Conducts AI-powered screening interviews
- Provides career coaching and advice
- Tracks application status
- Detects frustration and escalates to human recruiters
- Runs broadcast campaigns and re-engagement flows

### Who uses it:

| Role | What they do |
|------|-------------|
| **Candidates** | Chat with Linda on WhatsApp to find jobs, apply, upload CVs, and get career advice |
| **Recruiters** | Monitor conversations, manage screening, handle escalations, run campaigns |
| **Admins** | Configure Linda, train intents, build flows, monitor analytics, ensure compliance |

---

## 2. Getting Started — Initial Setup

### 2.1 Connect WhatsApp Business API

Navigate to **Admin > WhatsApp > Configuration** tab.

You need four credentials from the Meta Business Suite:

| Field | Where to find it |
|-------|-----------------|
| **Phone Number ID** | Meta Business Suite > WhatsApp > Phone Numbers |
| **Access Token** | Meta Business Suite > System Users > Generate Token |
| **WABA ID** | Meta Business Suite > WhatsApp > Business Account Settings |
| **Verify Token** | You create this — any random string (e.g., `sebenza_verify_2024`) |

**Steps:**
1. Enter all four credentials in the Configuration tab
2. Click **Save Credentials**
3. Copy the **Webhook URL** shown on the page
4. In Meta Business Suite, go to WhatsApp > Configuration > Webhooks
5. Paste the webhook URL and your verify token
6. Subscribe to: `messages`, `message_deliveries`, `message_reads`
7. Click **Test Connection** back in Sebenza Hub to verify

### 2.2 Configure Bot Settings

Still in the **Configuration** tab, scroll to Bot Settings:

| Setting | Recommended Value |
|---------|------------------|
| Greeting Message | "Welcome to [Company Name]! I'm your AI recruitment assistant." |
| Default Language | English (en) |
| Auto-Reply | Enabled |
| Business Hours Start | 08:00 |
| Business Hours End | 17:00 |
| Fallback Message | "I didn't quite understand that. Type MENU to see your options." |
| Max Retries | 3 |

### 2.3 Set Up Auto-Responders

Navigate to **Automation** tab > Auto-Responders.

Create rules for common queries:

| Trigger | Match Mode | Response |
|---------|-----------|----------|
| "salary" | Contains | "Salary information is available in each job listing. Browse jobs by typing MENU." |
| "office hours" | Contains | "Our team is available Mon-Fri 8am-5pm SAST." |
| "contact" | Contains | "Email us at info@company.com or type MENU to chat with a recruiter." |

### 2.4 Train the Bot

Navigate to **Bot Training** tab:

1. Review the FAQ database — add Q&A pairs for common candidate questions
2. Create intents with training phrases (e.g., intent "apply" with phrases "I want to apply", "how do I apply", "submit application")
3. Use the **Playground** to test: type a message and see what Linda would respond
4. Check the **Unmatched** section regularly — these are messages Linda couldn't handle

---

## 3. The Candidate Experience

This is what a candidate sees when they message your WhatsApp Business number.

### 3.1 First Contact — Language & Consent

```
Candidate: Hi

Linda: Hi there! I'm Linda, your AI-powered recruitment assistant from Sebenza Hub!
       I can help you find jobs, check your application status,
       upload your CV, and more.

     Please select your preferred language:
     [English] [Afrikaans] [isiZulu] [isiXhosa] [Sesotho] [Setswana]
```

After selecting a language:

```
Linda: Hello! I'm Linda, welcome to Sebenza Hub!

     Before we chat, I need your consent to process your personal
     information in line with POPIA (Protection of Personal Information Act).

     We'll use your info to help match you with jobs and communicate
     about opportunities. You can opt out anytime by typing STOP.

     [I Agree] [No Thanks]
```

- **"I Agree"** — proceeds to main menu
- **"No Thanks"** — bot goes idle, candidate can re-engage anytime

### 3.2 Main Menu

```
Linda: How can I help you today? Choose an option below:

     1. Browse Jobs — Find jobs matching your skills
     2. Application Status — Check your application progress
     3. Upload CV — Send your CV for instant parsing
     4. Career Coaching — Get AI career advice
     5. Talk to Recruiter — Connect with a human recruiter

     Type MENU anytime to return here
```

### 3.3 Browse Jobs

```
Candidate: developer

Linda: Found 5 jobs matching "developer":
     [Senior Frontend Developer - FinTech Corp - Cape Town]
     [Backend Developer - TechStart - Johannesburg]
     [Full Stack Developer - DataCo - Remote]
     ...
```

Selecting a job shows full details:

```
Linda: *Senior Frontend Developer*
     Company: FinTech Corp
     Location: Cape Town
     Salary: R45k - R65k
     Type: Full-time

     Build modern React applications for our banking platform...

     [Apply Now] [Back to Results] [Main Menu]
```

### 3.4 Apply for a Job

If the candidate has no profile yet:

```
Linda: Great! Let's get your application started.
     What's your full name?

Candidate: John Doe

Linda: Thanks John! What's your email address?

Candidate: john@example.com

Linda: Perfect. Now send me your CV as a PDF or image.
```

If the candidate has an existing profile:

```
Linda: Would you like to apply with your existing profile
     or upload a new CV?

     [Use My Profile] [Upload New CV]
```

### 3.5 CV Upload & Parsing

```
Candidate: [sends PDF document]

Linda: CV parsed successfully!

     *Name:* John Doe
     *Email:* john@example.com
     *Phone:* 082 123 4567
     *Skills:* JavaScript, React, Node.js, TypeScript, SQL
     *Match Score:* 85/100 — Great match!

     [Looks Good] [Try Again] [Main Menu]
```

### 3.6 Application Status Check

```
Linda: What email address did you use to apply?

Candidate: john@example.com

Linda: Hi John! Here are your recent applications:

     1. Senior Frontend Developer at FinTech Corp
        Status: Interview Scheduled
        Updated: 2 days ago

     2. Backend Developer at TechStart
        Status: Under Review
        Updated: 5 days ago
```

### 3.7 Career Coaching

```
Linda: I'm Linda, your career coach! Ask me anything about job searching,
     interview prep, salary negotiation, or career growth in South Africa.

Candidate: How should I prepare for a technical interview?

Linda: Here are my top tips for technical interviews in SA:

     1. Review the job spec — focus on listed technologies
     2. Practice coding challenges on platforms like LeetCode
     3. Prepare to explain your past projects clearly
     4. Research the company's tech stack and products
     5. Have questions ready about team culture and growth

     Would you like more detail on any of these?
```

### 3.8 Global Commands

These work from any state:

| Command | What it does |
|---------|-------------|
| **MENU** / **START** | Returns to the main menu |
| **HI** / **HELLO** / **HEY** | Returns to the main menu |
| **STOP** / **UNSUBSCRIBE** / **OPT-OUT** / **CANCEL** | Opts out of all messages |

### 3.9 Human Escalation

Escalation happens in three ways:

1. **Candidate requests it** — selects "Talk to Recruiter" from menu
2. **Frustration detected** — 3+ consecutive negative sentiment messages
3. **Auto-responder rule** — specific keywords trigger escalation

When escalated, Linda stops auto-responding and a human recruiter takes over in the Team Inbox.

---

## 4. Admin Dashboard — WhatsApp Command Center

Access: **Admin sidebar > WhatsApp**

### 4.1 Command Center Tab

Your real-time operations dashboard. At a glance you see:

- **Live Pulse** — Active conversations, messages in last 5 min/hour, bot vs human handled, avg response time, escalation count
- **Quick Send** — Send a manual WhatsApp message to any SA phone number
- **Sentiment Breakdown** — Positive / Neutral / Negative percentages
- **Conversion Funnel** — Browsed > Responded > Applied > Hired
- **Bot Health** — Connection status, delivery rate, processing speed

### 4.2 Conversations Tab

The full conversation manager:

- **Search** by phone number or content
- **Filter** by state: All, Active, Escalated, Completed, Opted Out
- **View** any conversation's full message history
- **Send** a manual message to any conversation
- **Takeover** — switch from bot to manual control
- **Release** — return conversation to bot control
- **Link** conversations to existing user profiles
- **Tag** and add **Notes** for internal tracking
- **Delete** conversation records when needed

### 4.3 Campaigns Tab

Create and manage broadcast campaigns:

1. Click **New Campaign**
2. Set campaign name, message content, and target audience
3. Optionally create an A/B variant
4. Schedule send time or send immediately
5. Monitor delivery stats: Sent, Delivered, Read, Failed
6. Track response rates and conversions

### 4.4 Broadcast Studio Tab

Send messages to audience segments:

- **All Opted-In** — everyone who consented
- **Active** — conversations with recent activity
- **Inactive 30+ days** — dormant candidates
- **New (7 days)** — recently joined

### 4.5 Automation Tab

Two sections:

**Auto-Responders:**
- Create rules with trigger type (keyword, regex, new conversation, after hours)
- Set match mode (exact, contains, starts with, regex)
- Choose response type (message, escalate, tag)
- Assign priority (higher priority rules match first)

**Bot Flows:**
- Build multi-step conversation flows
- Available node types: Message, Question, Condition, Action, Delay, API Call, Assign Agent, Tag, End
- Set trigger keywords to activate flows
- Track completion rates per flow

### 4.6 Compliance Tab

POPIA compliance monitoring:

- Total opted-in vs opted-out counts
- Consent rate percentage
- Recent opt-out log with timestamps
- Data retention settings
- Audit trail for compliance reviews

### 4.7 Quality & CSAT Tab

Conversation quality metrics:

- Overall sentiment score and trend
- Positive / Neutral / Negative breakdown
- Top topics driving positive and negative sentiment
- Intent distribution (what candidates are asking about)
- Fallback rate (% of messages bot couldn't handle)
- CSAT survey scores if surveys are enabled

### 4.8 AI Intelligence Tab

Advanced AI-powered insights:

- Bot state distribution (how many conversations in each state)
- Language breakdown across conversations
- Intent confidence scoring
- Conversation outcome predictions
- Topic clustering analysis

### 4.9 Templates Tab

Manage WhatsApp message templates:

- Create templates by category (Utility, Marketing, Authentication)
- Multi-language support
- Character count validation
- Send test messages to verify rendering

### 4.10 Configuration Tab

Core bot setup (see [Section 2](#2-getting-started--initial-setup)).

### 4.11 Contact CRM Tab

Contact Intelligence — your candidate database:

- Search and filter contacts by lifecycle stage, engagement, risk
- Lifecycle stages: New, Engaged, Applied, Interviewing, Placed, Inactive, Churned
- Engagement scoring (0-100 based on message frequency)
- Risk scoring (churn prediction)
- Contact enrichment with CV data, skills, applications
- Create audience segments for targeted campaigns
- Import/export contacts

### 4.12 Team Inbox Tab

Real-time agent management:

- See which agents are online/away/busy
- View agent capacity and active conversation count
- Conversation queue with priority levels (Urgent, High, Normal, Low)
- Wait time tracking and SLA monitoring
- Canned responses library for quick replies
- Routing rules to auto-assign conversations to agents

### 4.13 Flow Builder Tab

Visual conversation flow designer:

- Drag-and-drop node editor
- Pre-built flow templates
- Per-node analytics (entries, exits, drop-offs)
- Flow versioning and activation controls

### 4.14 Bot Training Tab

Train and improve Linda:

- **Intents** — Define what candidates mean (e.g., "apply", "salary_question", "location_query")
- **Training Phrases** — Add example sentences per intent
- **FAQs** — Direct question-to-answer pairs
- **Playground** — Type messages and see Linda's real-time responses
- **Unmatched Log** — Messages Linda couldn't handle (use these to create new intents)

### 4.15 Deep Analytics Tab

Deep-dive metrics:

- **ROI Dashboard** — Cost per conversation/application/placement, channel comparison
- **Cohort Analysis** — Retention rates by signup week
- **Predictive** — Volume forecasts, churn risk, best send times
- **Reports** — Generate PDF reports, schedule automated delivery

### 4.16 Replay & Debug Tab

Conversation debugging:

- Select any conversation to replay step-by-step
- See what Linda detected at each message: intent, confidence, state transition, sentiment
- Identify where conversations went wrong
- Highlight critical moments (fallbacks, escalations, sentiment drops)

### 4.17 AI Matcher Tab

Automatic candidate-to-job matching:

- Skills extracted from conversations and CVs
- Configurable matching weights (skills, experience, location, salary)
- Match score threshold for auto-sending job cards
- Conversion funnel: conversations > skills extracted > matched > cards sent > applied

### 4.18 Growth Engine Tab

Growth and viral tracking:

- K-factor (viral coefficient) monitoring
- Referral chain tracking
- QR code campaign generation
- Deep link management with UTM tracking
- Monthly growth breakdown by source

### 4.19 DNA Analyzer Tab

Conversation pattern analysis:

- Identifies conversation "DNA types": Quick Converter, High Engager, Bot Champion, Drop-off Risk, Human Seeker, Silent Browser
- Pattern success rates
- Sentiment shape analysis (Rising, Falling, V-shaped, Flat)
- Winning vs losing patterns

### 4.20 War Room Tab

Escalation monitoring center:

- Active escalation queue with wait times
- Predicted escalations (conversations at risk)
- Risk signals per conversation
- Escalation heatmap by time and topic
- Resolution tracking

---

## 5. Recruiter Dashboard — WhatsApp Bot

Access: **Recruiter Dashboard sidebar > WhatsApp Bot**

The recruiter has a streamlined 16-tab interface focused on day-to-day operations:

### Key Tabs for Recruiters:

**Conversations** — View and manage candidate chats. Send manual messages. Handle escalations.

**Quick Replies** — Create pre-written responses for fast replies. Organize by category with shortcuts.

**Auto-Responders** — Set up keyword-triggered automatic responses. View hit counts. Enable/disable rules.

**Broadcasts** — Send targeted messages to candidate segments. Schedule delivery. Track performance.

**Bot Training** — Add FAQs, manage intents, test in playground.

**A/B Lab** — Create message variants. Compare performance. Declare winners.

**Link & QR** — Generate WhatsApp click-to-chat links and QR codes for job posts, events, and marketing materials.

**CSAT & NPS** — Monitor candidate satisfaction scores.

**Alert Wall** — See critical alerts: SLA breaches, high-risk conversations, failed messages.

**ROI** — Track return on investment per campaign and channel.

---

## 6. Screening Bot Integration

Access: **Recruiter Dashboard > Screening Chatbot**

### 6.1 What is the Screening Bot?

The screening bot conducts automated candidate interviews through structured question flows. It evaluates responses and generates scores and recommendations.

### 6.2 Creating a Screening Template

1. Go to **Templates** tab
2. Click **New Template**
3. Set:
   - Template name (e.g., "Senior Developer Screening")
   - Job title and qualifying criteria
   - Welcome message and completion message
   - Questions with scoring weights
4. Question categories: Technical, Behavioral, Situational
5. Mark knockout questions (must-pass to continue)

### 6.3 Running a Screening Session

**Quick Screen:**
1. Go to **New Session** tab
2. Enter candidate name and phone number
3. Select a template
4. Click **Start Session**
5. Linda sends questions via WhatsApp automatically

**Template Screen:**
1. Select a saved template
2. Assign to specific candidates
3. Bot conducts the full interview

**Live Assist:**
1. Start a live session with AI co-pilot
2. Bot suggests questions and evaluates answers in real-time
3. Recruiter can override or add follow-up questions

### 6.4 Screening Results

After completion, view:

- Overall score (0-100)
- Score breakdown by category
- Recommendation: Shortlist / Maybe / Reject
- Sentiment analysis (enthusiasm, clarity)
- Red flags and green flags detected
- Full conversation transcript

### 6.5 Campaigns

Send screening invitations to multiple candidates:

1. Create a campaign with target candidates
2. Select screening template
3. Set schedule and follow-up rules
4. Track completion rates and scores

### 6.6 Self-Service Links

Generate public links that candidates can use to self-screen:

1. Create a self-service link tied to a template
2. Set expiration and max uses
3. Share the link on job posts or social media
4. Candidates click and complete screening on their own

---

## 7. WhatsApp Apply — Application Management

Access: **Recruiter Dashboard > WhatsApp Apply**

### 7.1 AI Message Generator

Create optimized WhatsApp messages for job postings:

1. Enter job details (title, company, requirements, location)
2. Select language and tone (Professional, Friendly, Casual, Urgent Hiring)
3. Click **Generate**
4. Get an optimized 160-character message with CTA
5. Generate A/B variants for testing

### 7.2 Apply Links & QR Codes

Generate click-to-apply links:

1. Select a job posting
2. Choose link type (standard, short URL, QR code)
3. Add UTM tracking parameters
4. Copy link or download QR image
5. Track clicks and conversion rates

### 7.3 Application Inbox

Manage incoming applications:

- View all WhatsApp applications with candidate info
- AI-scored applications (match percentage)
- Sentiment analysis per application
- Filter by status, score, date
- Bulk actions: assign to recruiter, shortlist, reject
- Add notes and tags

### 7.4 Templates

Create reusable message templates:

- Categories: Job Alert, Follow Up, Interview Invite, Offer, Rejection, General
- Language variants for multilingual outreach
- Tone selection
- Usage analytics (which templates perform best)

### 7.5 Campaigns

Run application campaigns:

1. Select target audience
2. Choose message template
3. Schedule delivery
4. Monitor: Recipients, Delivered, Read, Responses, Applications, Opt-outs
5. Track POPIA compliance status

### 7.6 Auto-Reply

Set up automatic responses for applications:

- **New Application** — "Thanks for applying! We'll review your profile within 48 hours."
- **After Hours** — "We received your application. Our team will respond during business hours."
- **Status Change** — Automatically notify candidates when their status updates
- **Keywords** — Respond to specific questions about the role

---

## 8. Advanced Features

### 8.1 Sentiment Analysis

Linda analyzes every text message for sentiment:

- **Positive** (score > 30) — Candidate is engaged and enthusiastic
- **Neutral** (score -30 to 30) — Normal conversation
- **Negative** (score < -30) — Candidate may be frustrated

**Auto-escalation** triggers when 3+ consecutive messages are negative (score < -50). Linda stops responding and alerts a recruiter.

### 8.2 Multi-Language Support

Six South African languages are supported:

| Language | Code | Greeting |
|----------|------|----------|
| English | en | Hello! Welcome to Sebenza Hub |
| Afrikaans | af | Hallo! Welkom by Sebenza Hub |
| isiZulu | zu | Sawubona! Siyakwamukela ku-Sebenza Hub |
| isiXhosa | xh | Molo! Wamkelekile ku-Sebenza Hub |
| Sesotho | st | Dumela! O amohelehile ho Sebenza Hub |
| Setswana | tn | Dumelang! O amogelesega mo Sebenza Hub |

The candidate selects their language on first contact. Linda remembers the preference for all future interactions.

### 8.3 POPIA Compliance

Linda enforces South African data protection law:

- Consent is collected before any data processing
- Opt-in timestamp is recorded
- Candidates can opt out anytime by typing STOP
- Opt-out is immediate and irreversible (until re-engagement)
- Compliance dashboard tracks consent rates
- Audit trail maintained for regulatory review

### 8.4 Conversation Takeover

Recruiters can take over any conversation from Linda:

1. Go to Conversations tab
2. Find the conversation
3. Click **Takeover**
4. Send messages manually
5. When done, click **Release** to return control to Linda

While taken over, Linda does not auto-respond.

### 8.5 A/B Testing

Test different message variants to optimize performance:

1. Create an A/B test with two message variants
2. Set traffic split (e.g., 50/50)
3. Set minimum sample size
4. Run the test
5. Compare metrics: response rate, conversion, sentiment
6. Declare a winner and apply to all future messages

### 8.6 Re-Engagement Campaigns

Automatically re-engage dormant candidates:

1. Candidates inactive for 30+ days are flagged
2. Create re-engagement campaigns with personalized messages
3. Schedule delivery
4. Track reactivation rates
5. Dormant candidates who respond are automatically reactivated

---

## 9. Troubleshooting & FAQ

### Connection Issues

**Bot not responding to messages?**
1. Check **Configuration** tab — verify credentials are entered correctly
2. Click **Test Connection** to verify webhook is working
3. Check that your webhook URL is publicly accessible (HTTPS required)
4. Verify you've subscribed to the correct webhook events in Meta Business Suite

**Messages showing as "No credentials configured"?**
- WhatsApp API credentials are missing or invalid
- Re-enter credentials in Configuration tab and test again

### Bot Behavior Issues

**Bot sends auto-responder instead of navigating menu?**
- Check your auto-responder rules — a broad keyword might be matching on menu selection text
- Auto-responders only match on free-text messages, not button/list selections
- Review and narrow your auto-responder trigger keywords

**Bot stuck in a state?**
- The candidate can type **MENU** to reset to main menu from any state
- As admin, you can view the conversation state in the Conversations tab
- Use Conversation Replay to debug the issue

**Sentiment incorrectly triggers escalation?**
- Escalation requires 3+ consecutive negative messages (score < -50)
- Check the conversation replay to see sentiment scores per message
- Adjust auto-responder rules to handle common frustration triggers

### Common Questions

**Can candidates apply without a CV?**
Yes — Linda collects name and email. CV upload is optional but recommended for better matching.

**How do candidates check their application status?**
Select "Application Status" from the main menu, then enter their email address.

**Can I send messages to candidates who opted out?**
No. Once a candidate types STOP, they are opted out and Linda will not send messages. They must re-engage by sending a new message themselves.

**How many languages does Linda support?**
Six: English, Afrikaans, isiZulu, isiXhosa, Sesotho, and Setswana. The candidate selects their preference on first contact.

**Can multiple recruiters handle escalations simultaneously?**
Yes. The Team Inbox supports multiple agents with routing rules, capacity management, and queue prioritization.

**How do I add new FAQ responses?**
Go to Bot Training > FAQs, click "Add FAQ", enter the question and answer. Linda will start using it immediately.

**What happens when Linda can't understand a message?**
She sends the fallback message (configurable in Settings). The unmatched message is logged for review in the Bot Training > Unmatched section.

---

*Last updated: March 2026*
*Linda — Sebenza Hub WhatsApp Bot v2*
