---
title: "Chapter 19 — Advanced and AI orchestration"
type: concept
created: 2026-04-28
updated: 2026-04-28
tags: [how-to, corporate, advanced, predictive, hiring-manager-portal, workflow-automation, ai-orchestration, premium]
status: active
user-types: [business]
---

# Chapter 19 — Advanced and AI orchestration

You've made it through 18 chapters. You know how to set up the org, post requisitions, receive applications, screen, interview, offer, manage vendors and the Talent CRM, automate communication, stay compliant, run workforce reporting, and analyse the funnel. This final chapter is about the surface that separates a TA function running well from a TA function running at the top of what the platform makes possible: deep use of **Predictive Hiring** for forecasting, the **Hiring Manager Portal** for stakeholder engagement, **Workflow Automation** as the operational fabric, and the orchestration layer (**Linda**) that connects them.

These are not features you need on day one. They're features you grow into once your basic hiring engine is humming. Most corporate TA teams reach for them in months 3–6 of paid usage, not in week 1.

## 1. Predictive Hiring as a forecasting layer

Predictive Hiring was introduced in [[01 How-To Documents/corporate/09-making-offers|Chapter 9]] as a per-candidate offer-acceptance prior. At scale, it's also a forecasting layer that tells you what your hiring needs are going to look like before the requisitions are formally raised.

### Where it lives

[https://www.sebenzahub.co.za/dashboard/business/predictive-hiring](https://www.sebenzahub.co.za/dashboard/business/predictive-hiring), in the **Make Offer** sidebar group (the daily-use entry point) — but at the function level, the same model surfaces forecasts on Predictive Analytics ([[01 How-To Documents/corporate/14-analytics-and-reporting|Chapter 14]]).

### What the forecasting view shows

The Predictive layer analyses:

- **Historical hiring patterns** at your organisation (frequency, role types, seasonality)
- **Department-level signals** (project announcements, headcount changes, internal mobility patterns)
- **Performance and retention data** flowing back from HRIS Integration ([[01 How-To Documents/corporate/13-workforce-and-hr|Chapter 13]])
- **Macro indicators** for SA hiring (sector trends, salary movement)

The output: a probability-weighted forecast of what each department is likely to need to hire for in the next 30 / 60 / 90 days.

### Why this matters

The TA functions that win don't wait for hiring managers to send a brief. They walk into the workforce-planning conversation with: "Based on what we're seeing, Engineering will likely need 2 senior developers and a DevOps lead in the next 60 days. We're already pre-sourcing the senior dev profiles." That's not magic — that's Predictive Hiring plus disciplined relationship management with the function leaders.

When the hiring manager confirms the need, you're already 4 weeks ahead of where reactive TA functions would be.

### How to use it

1. Open the per-department forecast view weekly as part of TA leadership reporting.

![[c-ch19-predictive-hiring-department-forecast.png]]

2. Pick the highest-confidence forecasts and start pre-sourcing — build a CRM tag of candidates worth keeping warm against the predicted brief.
3. Send the function leader a "thinking ahead" note: "We've been watching engineering growth signals and started lining up some senior dev profiles in case the team grows over the next quarter — happy to share the shortlist whenever you're ready."

This message is the killer move. Even if the prediction is wrong, you've signalled that TA is proactive and embedded enough to anticipate. Even when wrong, the gesture earns trust.

### The honest limits

Predictive Hiring is a forecasting tool, not a crystal ball. The forecasts are probabilistic — sometimes they're wrong. Use them as a planning aid, not a guarantee. Don't over-invest in pre-sourcing for a forecast that hasn't been confirmed; do invest enough that you're not starting cold when the brief lands.

## 2. Hiring Manager Portal — getting stakeholders in the loop

### Hiring Manager Portal — _Tier: Premium · provisioned by Sebenza account manager_

**Where it lives.** Provisioned per-hiring-manager by your Sebenza account manager during paid-usage onboarding. Accessed by the hiring manager directly via a dedicated portal URL — they don't see the full TA dashboard, just their own requisitions and shortlists.

**What this feature is.** The Hiring Manager Portal is a stripped-down, no-training-needed interface where hiring managers review candidates, leave feedback, and approve or reject — without touching the full ATS or needing a TA seat.

**Why it matters.** Hiring managers won't learn a full ATS — they ghost the process and your requisitions stall waiting for feedback that never arrives. A simplified portal means they actually engage, which compresses time-to-fill by days per role and shows up directly on the Bottleneck View in Recruitment Analytics. For corporate hiring at scale (50+ concurrent reqs), this is one of the highest-leverage features the platform offers.

**How to use it.**

1. From a hiring manager's user record, your Sebenza account manager enables the portal access.
2. The hiring manager receives an invite email with a portal link. They set a password (or sign in via SSO if your tenant has SSO configured — see [[01 How-To Documents/corporate/03-setting-up-your-org|Chapter 3]]).
3. They land directly on the candidate-review surface for their open requisitions. They see only their own requisitions — never other departments' candidates, never the full TA pipeline.

![[c-ch19-hiring-manager-portal-landing.png]]

4. They review candidates with AI Candidate Summary embedded (Ch.7), leave structured scorecard feedback (Ch.7), and advance / reject from the same surface.

![[c-ch19-hiring-manager-candidate-review.png]]

5. Track engagement in the portal usage analytics — managers who never log in are a stalled-requisition risk to flag at the next workforce-planning check-in.

**Pro tip.** Don't roll the portal out to every hiring manager at once. Start with the 3–5 managers who are your highest-volume hirers and your hardest-to-engage ones. Get their buy-in, demonstrate the time savings, then expand. A failed portal rollout (low adoption, lots of TA chasing) damages trust in the platform — better to have 5 highly-engaged HMs than 50 ghosting ones.

## 3. Workflow Automation as operational fabric

Workflow Automation was introduced in [[01 How-To Documents/corporate/11-communication-and-automation|Chapter 11]] as the rule engine that connects templates, sequences, and approvals. At the advanced level, it becomes the operational fabric that runs the function with consistency at scale.

### Workflow Automation — _Tier: Premium · provisioned by Sebenza account manager_

**What this feature is.** Workflow Automation is the rules engine for repetitive hiring tasks — automatic stage transitions, notifications, bulk actions, scheduled follow-ups — driven by custom triggers you define against pipeline events.

**Why it matters.** Every TA team has 10 admin patterns they repeat daily. Automating those reclaims 5–8 hours per week per recruiter — pure margin you can redeploy onto sourcing or relationship-building — and removes the consistency drift that creeps in when humans do the same task at different times of day.

### Common advanced rule sets

Beyond the basic rules in Ch.11, the rules that pay off most for corporate functions:

| When | Do |
|---|---|
| A candidate is **hired** | Trigger HRIS sync (Ch.13) + onboarding checklist + welcome message + add to "recently hired" CRM segment |
| A requisition is **30 days open with no progress** | Notify TA leader and HRBP; auto-run Requirement Restriction Analyzer; flag for reset conversation |
| A vendor's **MSA expires in 30 days** | Notify TA leader and procurement; block new POs (Ch.10) |
| A hiring manager **hasn't logged into the Portal in 7 days with active reqs** | Notify HRBP for the function; flag in next 1:1 |
| An **EE plan target slips** by >5% on the live demographic funnel | Alert TA leader and HRBP; trigger Diversity Analytics deep-dive |
| A scorecard is **submitted with a major disagreement flag** | Notify TA leader; add to next quarterly Panel Analysis review |
| **Background check returns flagged** | Notify TA leader (not the recruiter directly); auto-pause the offer flow until reviewed |

### The right amount of automation

There's a temptation to automate everything. Resist. Over-automation creates a feeling of impersonality that candidates and hiring managers can sense. The right balance:

- **Automate the predictable** — confirmations, reminders, status changes, routine touches
- **Don't automate the personal** — first outreach to a senior candidate, offer negotiations, sensitive conversations, anything that needs judgment
- **Audit your automation monthly** — disable rules that aren't earning their keep
- **Templates first, then sequences, then automation.** Each layer builds on the previous. Don't try to set up automation rules before you have good templates — the result is automated bad messages, which is worse than no automation.

### Setup path

Workflow Automation is configured by your Sebenza account manager during the first 60 days of paid usage. The right approach:

1. **Document the manual patterns** your TA team is currently doing — what triggers what, who notifies whom.
2. **Pick the 3 highest-frequency patterns** and ask your account manager to wire those up first.
3. **Run them for 2 weeks**, audit for unexpected behaviour, refine.
4. **Add 2–3 more rules** at a time. Don't try to automate everything in one go.
5. **Quarterly review** of all active rules — disable anything that hasn't fired in 90 days or that's producing weird results.

![[c-ch19-workflow-automation-rule-builder.png]]

## 4. Linda — the AI agent layer

Linda was introduced briefly in [[01 How-To Documents/corporate/11-communication-and-automation|Chapter 11]]. At the advanced level, she's the orchestration layer that connects the AI features into something that behaves more like a junior team member than a set of disconnected models.

### What Linda does

Linda is the platform's agent layer. Think of her as the operating system that the AI features run on top of. When Linda is engaged for a task, the AI moves from canned single-step responses to adaptive multi-step handling. She can:

- **Hold context across turns** in a chatbot conversation
- **Reach for the right tool** when the input requires looking at a candidate record, comparing two requisitions, or running a search
- **Chain actions** — read a JD, generate variants for distribution, push them to the integrated channels, notify the requisition owner
- **Hand off to a human cleanly** when the task is outside her remit

### Where Linda shows up

You don't configure Linda directly — she's wired into the platform's AI features by the platform team. You'll see her at work in:

- The **Screening Bot** ([[01 How-To Documents/corporate/07-screening-and-evaluating|Chapter 7]]) — multi-turn screening conversations that adapt to the candidate's answers rather than just walking a static tree
- **AI Candidate Summary** (Ch.7) — pulling from CV, application, screening transcript, and interview history into a single coherent view
- **Email Sequences** (Ch.11) — adapting tone per candidate based on the engagement signal
- **Content Repurpose** (Ch.11) — chaining JD analysis, variant generation, and Brand Voice tuning
- The **Career-Site Chatbot** (Ch.11) — adaptive multi-turn handling for visitors

### Why this matters for governance

Every tool Linda invokes is logged. Each tool call — the function name, the inputs, the outputs — lands in your Audit Trail ([[01 How-To Documents/corporate/12-compliance-and-audit-trail|Chapter 12]]). When you review an AI-assisted decision later (which you will, when an EE audit or a candidate complaint or a regulator asks), you can see not just what was said but exactly what Linda did on the backend to produce the answer. That's how you defend AI-assisted decisions in a regulated SA hiring context.

This is increasingly material as AI features take on more of the operational load. The TA functions that get this right — that have AI doing the volume work, with humans making the consequential calls, and a defensible audit trail showing who did what — are the ones that scale without compounding regulatory risk.

![[c-ch19-linda-tool-call-audit-detail.png]]

## A final word on running the function

Twenty years in TA leadership will teach you a few things. The most important ones aren't features:

1. **The candidates and hiring managers you treat best in the worst moments are the ones who become your moat.** Great TA service when things are smooth is table stakes; great service when things are hard is what builds lasting credibility with the business.

2. **Track everything, but act on the few things that matter.** The platform gives you 30 dashboards. The four reports in Ch.14 are the ones you actually need weekly. The rest is for specific moments.

3. **Compounding beats heroics.** A TA team that hires 4 strong people a quarter for 5 years has hired 80 strong people. A TA team that hires 8 a quarter for 6 months and burns out has hired 16. Sustainable rhythms win.

4. **Honesty is the cheapest competitive advantage.** Telling a candidate the truth about a role, telling a hiring manager the truth about their unrealistic brief, telling yourself the truth about your numbers — none of these cost anything, and they all compound into trust.

5. **The platform is a tool, not a strategy.** Sebenza Hub is the most capable corporate hiring platform built for South Africa. But the TA functions that win on it are the ones whose strategy was right *before* they used the platform. The platform amplifies what you bring; it doesn't substitute.

You now have everything you need to use the platform properly. The rest is execution. Good luck.

## Features covered in this chapter

| # | Feature | Tier |
|---|---------|------|
| 1 | Predictive Hiring (forecasting layer) | Premium |
| 2 | Hiring Manager Portal | Premium · provisioned by Sebenza |
| 3 | Workflow Automation (advanced) | Premium · provisioned by Sebenza |
| 4 | Linda (AI orchestration layer) | _embedded across AI features_ |

## Checklist

- [ ] You understand what Predictive Hiring forecasts and how to use it as a workforce-planning input
- [ ] The Hiring Manager Portal is enabled for your highest-volume / highest-friction hiring managers
- [ ] Workflow Automation has at least 5 active rules (across templates, approvals, vendor management, EE alerts) and a quarterly review cadence
- [ ] You know that every Linda tool call is logged in the Audit Trail and can defend AI-assisted decisions on that basis
- [ ] You've internalised the principle that the platform amplifies discipline, doesn't replace it

## End of guide

You've reached the end. Use [[01 How-To Documents/corporate/index|the manual index]] to jump back to any chapter.

## References

- [[01 How-To Documents/corporate/index|Manual index]]
- [[01 How-To Documents/corporate/09-making-offers|Chapter 9 — Predictive Hiring (per-candidate)]]
- [[01 How-To Documents/corporate/11-communication-and-automation|Chapter 11 — Workflow Automation, Linda intro]]
- [[01 How-To Documents/corporate/12-compliance-and-audit-trail|Chapter 12 — Compliance and audit trail]]
- [[01 How-To Documents/corporate/13-workforce-and-hr|Chapter 13 — Workforce and HR]]
- [[01 How-To Documents/corporate/14-analytics-and-reporting|Chapter 14 — Analytics and reporting]]
- [[03-workflows/business-journey]] — The full journey doc this guide is built on
