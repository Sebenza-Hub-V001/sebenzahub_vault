---
title: "Chapter 1 — What Sebenza Hub is for corporates"
type: concept
created: 2026-04-20
updated: 2026-04-20
tags: [how-to, corporate, introduction, ats, hris, workforce-planning]
status: active
user-types: [business]
---

# Chapter 1 — What Sebenza Hub is for corporates

![[c-ch01-corporate-dashboard-hero.png]]

Sebenza Hub is a South African recruitment platform built for three audiences: job seekers, recruitment agencies, and **corporate hiring teams**. As a **Corporate** customer — typically an enterprise of around 500+ employees with an in-house Talent Acquisition or HR function — you use it as your applicant tracking system, your internal mobility board, your vendor management layer for the agencies you contract, and your workforce-planning tool. It's where requisitions, candidates, hires, and headcount strategy all live in one place.

## Who Corporate is for

You should be using the Corporate product if you're at an organisation that:

- Runs **enterprise hiring in-house** with a TA or HR team responsible for end-to-end requisition management.
- Has a **real HRIS** (SAP SuccessFactors, Workday, BambooHR, Sage HR) and needs the ATS to talk to it bidirectionally.
- Hires **at scale** — 50+ permanent hires a year, possibly mixed with a substantial contract workforce.
- Engages **multiple recruitment agencies** and needs a single place to manage POs, performance, compliance, and spend across them.
- Is subject to **SA compliance reality** — POPIA for candidate data, B-BBEE and Employment Equity for reporting.
- Needs **SSO, RBAC, and white-labelling** to satisfy IT, security, and brand teams before procurement will sign.

If you're a recruitment agency rather than an in-house team, you want the Recruiter product instead. If you're a small company without a dedicated TA team, the Recruiter product may also fit you better — Corporate is built around the assumption that you have multiple stakeholders (recruiters, hiring managers, HRBPs, interviewers) and a structured headcount-planning process.

## What problems Corporate solves

In one sentence: it replaces the four-tool stack most SA enterprises currently run — an ATS (Greenhouse / Lever / SmartRecruiters), a vendor-management spreadsheet, an HRIS sync nobody trusts, and a workforce-planning deck that gets rebuilt every quarter — with a single platform that does all four and was built for the SA regulatory context from the start.

Specifically:

- **Applicant tracking that scales.** Basic ATS for any team that needs structured pipelines; Full ATS with custom stages, automation rules, SLA tracking, and cross-requisition reporting when you outgrow the basics. See [[01 How-To Documents/corporate/04-your-first-requisition|Chapter 4]].
- **Internal mobility as a first-class workflow.** A private internal job board with role-visibility rules, succession planning, and performance integration — closing the loop between who you hire, how they perform, and where they go next. See [[01 How-To Documents/corporate/06-internal-mobility|Chapter 6]].
- **Vendor management that recovers spend.** Centralised PO, performance, compliance, and payment tracking across the 5–10 agencies most enterprises use. The transparency alone typically recovers 5–10% of agency spend. See [[01 How-To Documents/corporate/07-vendor-management|Chapter 7]].
- **HRIS integration that doesn't lose data.** Bidirectional sync with the major SA HRIS systems so hires don't get manually re-keyed and demographic data flows correctly into EE reports. See [[01 How-To Documents/corporate/08-integrations-and-reporting|Chapter 8]].
- **Workforce planning aligned to budget.** Headcount forecasting, capacity modelling, and budget alignment integrated with the requisition system — so the plan and the execution share one source of truth. See [[01 How-To Documents/corporate/09-workforce-planning|Chapter 9]].
- **SA compliance built in.** POPIA-compliant candidate data handling, B-BBEE and EE reporting, and an immutable audit trail. See [[02-concepts/compliance]].

![[c-ch01-three-user-types-diagram.png]]

## How Corporate differs from the Recruiter product

The Recruiter product is built for **agencies**: multiple corporate clients, fee structures, candidate marketing, trust-tier reputation, brand pages. The Corporate product is built for **a single organisation hiring for itself**: requisition workflow, internal mobility, employee performance integration, headcount planning, and vendor management of the agencies you buy *from*.

The two products share infrastructure (auth, communication, AI matching, compliance) but the dashboards, the data models, and the journeys are different. A Corporate account cannot post jobs to multiple "clients" — there is only one organisation. A Recruiter account cannot run an internal mobility board, because the candidates aren't its employees.

If your business model is genuinely both — for example, a large group with an in-house RPO function that also takes external clients — talk to Sebenza Hub directly rather than trying to force one product to do both jobs.

## Three things to know before you continue

1. **Sebenza Hub is built around South African compliance.** POPIA, B-BBEE, and Employment Equity are not optional add-ons — they shape how candidate data is stored, how demographic fields are captured, and what you can report. This is good news if you've been retrofitting US-built ATS software for SA reality.
2. **Your role is locked after onboarding.** When you sign up and choose **Business** (the role value Corporate accounts use), you can't later convert that login into a Recruiter or Individual account. Chapter 2 covers this before you click anything.
3. **The Corporate product is built around a multi-stakeholder team.** Almost every workflow assumes you have recruiters, hiring managers, HRBPs, and interviewers using the system — not a single admin. Set team members up properly in Chapter 3 before you try to run a requisition.

Every new Business account also gets a **30-day Premium trial** with the full feature set — Chapter 2 explains what that includes and what happens when it ends.

## What you'll be able to do by the end of this guide

By the time you finish:

- Set up your organisation, team, RBAC, SSO, and branding (Chapters 2–3).
- Run a requisition end-to-end with applicant tracking and onboarding (Chapter 4).
- Manage contract workers alongside permanent hires (Chapter 5).
- Run internal mobility, succession planning, and performance management (Chapter 6).
- Manage your external recruitment agencies in one place (Chapter 7).
- Wire Sebenza Hub to your HRIS, BI tools, and notification stack, and tier your support (Chapter 8).
- Build a forward-looking workforce plan that aligns to budget (Chapter 9).

## Checklist

- [ ] You understand Corporate is for in-house enterprise HR/TA teams, not agencies
- [ ] You know the role value to choose at signup is **Business**
- [ ] You're aware that role is locked after onboarding
- [ ] You've accepted that the platform is built around a multi-stakeholder team

## Next chapter

[[01 How-To Documents/corporate/02-creating-your-account|Chapter 2 — Creating your account]]

## References

- [[01 How-To Documents/corporate/02-creating-your-account|Chapter 2 — Creating your account]]
- [[01 How-To Documents/corporate/03-setting-up-your-org|Chapter 3 — Setting up your organisation]]
- [[03-workflows/business-journey]] — The full corporate hiring journey
- [[02-concepts/compliance]] — POPIA, B-BBEE, Employment Equity context
