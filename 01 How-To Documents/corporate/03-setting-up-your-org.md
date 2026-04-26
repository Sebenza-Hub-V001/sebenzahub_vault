---
title: "Chapter 3 — Setting up your organisation"
type: concept
created: 2026-04-20
updated: 2026-04-20
tags: [how-to, corporate, team, rbac, sso, branding, collaboration]
status: active
user-types: [business]
---

# Chapter 3 — Setting up your organisation

You've created the owner account in Chapter 2 and landed on the Corporate dashboard. Before you post a single requisition, spend an hour wiring up the organisation properly: invite the team, set permissions, lock down access with SSO, brand your candidate experience, and tune notifications. Skip this and you'll spend the next six months apologising to hiring managers, security, and brand.

This chapter covers six features in the order you should set them up.

## Why this order matters

Each feature in this chapter assumes the previous one is done:

1. **Team Members** — there's nothing to permission until people exist in the system.
2. **RBAC** — there's nothing to brand against until permissions are clear.
3. **SSO** — you can only enforce SSO once permissions exist for the SSO-provisioned users to land into.
4. **Company Branding** — branding lifts apply rates immediately and applies to everything downstream.
5. **White-Label Branding** — only relevant for Premium customers who need to remove Sebenza branding from the candidate journey entirely.
6. **Notifications and @-mentions** — turn the right channels on once people are in, so the team gets useful signal from day one.

## Add your team

### Team Members — _Tier: Metered — Standard: 5 · Premium: unlimited_

**What this feature is.** Team Members lets you add other users to your organisation with their own logins, profiles, and permissions. Recruiters, hiring managers, HR business partners, interviewers — anyone who needs to see candidates, run pipelines, or score interviews has their own seat.

**Why it matters.** Corporate hiring is a multi-stakeholder activity. Sharing a single login is how candidate data gets leaked, how audit trails become useless, and how POPIA accountability evaporates. Metered seats align cost with the actual size of your hiring team in a predictable way: Standard fits a small TA function (5 seats), Premium goes unlimited for larger teams.

**How to use it.**

1. Go to **Team Members** in Settings.
2. Click **Invite member**.
3. Enter their work email and pick a role from the dropdown (the default is **Member**; the other choices are **Admin** and **Viewer**).
4. They receive a magic-link invite. Once they click it, they appear in your Team Members list.
5. Repeat for every recruiter, hiring manager, and HRBP who needs access. Don't invite occasional interviewers as full team members — use the interviewer scorecard flow instead (covered in Chapter 4) to keep your seat count clean.

![[c-ch03-team-members-invite-dialog.png]]

If you're on Standard and 5 seats isn't enough, upgrade to Premium before you add the sixth person — the system will block the invite otherwise and surface an upgrade prompt. If you're close to the limit, decide whether each new person is a recurring user (give them a seat) or a one-off contributor (use the lighter interviewer flow instead).

## Lock down who can do what

### Role-Based Access Control — _Tier: Standard role-on-invite · Premium granular RBAC_

**What this feature is.** Sebenza Hub gives you two levels of access control. Every Business plan supports **role-on-invite**: when you invite a team member, you pick **Admin**, **Member**, or **Viewer**, and that role determines what they can see and do across the platform. **Premium** unlocks **granular RBAC** — per-permission control over individual capabilities like viewing salaries, managing offers, exporting reports, and configuring integrations. See [[02-concepts/rbac]] for the underlying model.

**Why it matters.** Enterprise hiring touches sensitive data: candidate demographics, salary bands, references, and disciplinary history of internal applicants. Even the basic three-role model gives you a workable control posture; granular RBAC is the non-negotiable upgrade for listed or regulated companies whose Risk and Audit committees expect to see per-permission separation of duties.

**How to use it on Standard (role-on-invite).**

1. From the Team page, click **Invite member**.
2. Pick the role from the dropdown:
   - **Admin** — full access including team, billing, settings, and integrations.
   - **Member** — day-to-day access to jobs, candidates, pipelines, and applications. The default for most invitees.
   - **Viewer** — read-only across the dashboard.
3. The invitee receives a magic-link invite and lands into the role you selected.
4. To change a team member's role later, revoke the existing invite (or remove the seat) and re-invite with the new role.

If you need to restrict salary visibility, lock down exports, or split offer-management from offer-approval — that's the trigger to upgrade to Premium and switch on granular RBAC.

**How to use it on Premium (granular RBAC).**

Granular RBAC is configured by your Sebenza account manager once your organisation is on Premium. To switch it on:

1. Talk to your account manager and supply your target permission model — typically a matrix of roles (Recruiter, Hiring Manager, HRBP, Interviewer, Finance) against capabilities (view candidates, view salaries, manage offers, manage billing, manage integrations, export reports, contact candidates, use AI features).
2. Sebenza enables granular RBAC for your organisation and seeds the permission set you've defined.
3. From that point on, each team member's permissions can be tuned per capability rather than picked from the three-role list. Changes flow back to your account manager during onboarding and via the support channel after.

![[c-ch03-rbac-permissions-matrix.png]]

Document the resulting permission model and share it with Risk/Audit before go-live. RBAC is only as good as the discipline you bring to assigning permissions.

## Enforce single sign-on

### SSO Configuration — _Tier: Premium_

**What this feature is.** SSO Configuration lets you connect Sebenza Hub to your corporate identity provider (Azure AD, Okta, Google Workspace) using SAML or OAuth. Once enabled, team members log in with their corporate identity instead of a magic link, and offboarding through your IdP automatically revokes Sebenza access.

**Why it matters.** Any serious enterprise above ~500 employees mandates SSO for security and offboarding. Without SSO, every Sebenza user is a separate offboarding task that someone has to remember; with SSO, the day someone leaves the company, their Sebenza access dies with their corporate identity. For most enterprise procurement processes, no SSO means no deal.

**How to use it.**

1. Talk to IT first. You'll need an admin in your IdP (Azure AD / Okta / Google Workspace) to create a new application for Sebenza Hub.
2. Go to **Settings → SSO Configuration** and choose your protocol (SAML 2.0 for most enterprises, OAuth for Google Workspace).

![[c-ch03-sso-configuration-form.png]]

3. Sebenza Hub will display the SP metadata — Entity ID, ACS URL, and a downloadable certificate. Send these to IT to configure the IdP side.
4. IT sends back the IdP metadata (URL or XML). Paste it into the SSO Configuration screen.
5. Map IdP groups to Sebenza roles. The standard mapping: `sebenza-admins → Admin`, `sebenza-recruiters → Recruiter`, `sebenza-hiring-managers → Hiring Manager`, etc. This is how new joiners get auto-provisioned with the right role.
6. Test with a single user before enforcing organisation-wide. The cleanest test is to log out, then log in via the SSO URL and verify the role lands correctly.
7. Once tested, enable **Require SSO** to force every team member onto SSO. Magic-link login is disabled for non-owners at this point.

Keep one **break-glass owner account** on magic-link login outside the SSO domain. If your IdP goes down, you'll need a way back in.

## Brand the candidate experience

### Company Branding — _Tier: Standard_

**What this feature is.** Company Branding lets you customise the candidate-facing surface of Sebenza Hub — your logo, brand colours, fonts, and hero imagery on job listings and your career page.

**Why it matters.** Candidates are roughly twice as likely to apply to a branded page than an unbranded one. Branding is low effort and high yield — a baseline expectation for any corporate that takes its employer brand seriously. Skipping it sends candidates a signal that you're not really invested in the role.

**How to use it.**

1. Go to **Settings → Branding**.
2. Upload your logo (SVG preferred, PNG with transparent background acceptable).
3. Set your brand colours: primary, secondary, and accent. Use the same hex codes as your corporate brand guidelines.
4. Upload a hero image for your career page — typically a real workplace photo, not a stock image. Real photos lift apply rates measurably.
5. Pick a font family from the supported list. If your corporate font isn't available, pick the closest match.
6. Preview the result on a sample job listing and your career page before publishing.

![[c-ch03-company-branding-upload-preview.png]]

Re-do this if your brand refreshes. Outdated branding on a job listing is more damaging than no branding at all.

## Remove Sebenza branding entirely

### White-Label Branding — _Tier: Premium · provisioned by Sebenza_

**What this feature is.** White-labelling takes Company Branding further: a fully custom domain (`jobs.yourcompany.co.za`), Sebenza branding removed from the candidate experience, and branded candidate emails sent from your domain instead of Sebenza's. The provisioning happens on the Sebenza side — there is no in-app **White-Label** page in the Business dashboard. You supply the inputs; your account manager configures the rest.

**Why it matters.** Large corporates and brand-sensitive employers refuse to let third-party branding appear in their candidate journey. White-labelling is the threshold requirement for many enterprise deals — without it, the brand team blocks procurement. If you don't have the issue, you don't need this feature.

**How to use it.**

1. Talk to your Sebenza account manager and tell them you want white-labelling enabled.
2. Coordinate with IT to prepare the DNS inputs Sebenza will need:
   - **CNAME** for the custom domain (e.g. `jobs.yourcompany.co.za`).
   - **SPF**, **DKIM**, and **DMARC** records for the branded email sender (e.g. `careers@yourcompany.co.za`) so candidate emails authenticate cleanly from your domain.
3. Send the DNS records and the desired email sender details to your account manager.
4. Sebenza configures the white-label entry, provisions the TLS certificate (typically within an hour of DNS propagating), and confirms when it's live.
5. Test by applying to a draft job from outside the network — verify the domain in the URL bar, the lack of Sebenza branding, and the sender address on the confirmation email.

![[c-ch03-white-label-custom-domain.png]]

Keep the original Sebenza-domain URLs working as fallbacks during the transition. Once everyone is on the white-label domain, the originals can be deprecated quietly.

## Turn on team notifications and @-mentions

### Notifications and @-mentions — _Tier: Standard_

**What this feature is.** Sebenza Hub already captures the hiring conversation against each candidate record — comments, status changes, scorecard feedback, offer decisions. The piece you control here is **how the team gets notified**: which events ping which channel, and who can be @-mentioned to pull them into a thread on a candidate. Mentions, comments, and the per-candidate activity timeline are all in the platform out of the box; the work in this chapter is tuning the routing.

**Why it matters.** Hiring decisions today happen in Slack DMs and email threads, with the rationale lost the moment the channel scrolls. Keeping the conversation against the candidate record means that six months later, when someone asks "why did we pass on this person?", the answer is right there. Tuned notifications make sure the right person sees the @-mention without drowning the rest of the team in noise.

**How to use it.**

1. Open **Settings → Notifications** and review the per-event email defaults. Most organisations turn off "candidate viewed your job posting" and similar low-signal events, and keep on @-mentions, scheduled interviews, offer status changes, and approval requests.
2. Each team member can override their personal preferences from the same screen on their own login. Train the team to do this rather than mute everything.
3. The **Unified Inbox** (`/dashboard/business/unified-inbox`, covered in Chapter 8) is where multi-channel conversations land — email, WhatsApp, and the platform-internal thread. Train recruiters to leave hiring rationale as comments on the candidate record rather than in side-channel chat.
4. For interviewers who are not full team members, use the scorecard-only flow (covered in Chapter 4). They can leave structured feedback without consuming a Team Member seat.

![[c-ch03-team-collaboration-feed.png]]

Notifications and @-mentions become useful once there's a few weeks of decisions in the system. Don't expect day-one signal — the discipline takes a sprint to form, then it compounds.

## Checklist

- [ ] You've invited every recurring team member as a Team Member
- [ ] On Standard: every invitee has the right role (Admin / Member / Viewer); on Premium: granular RBAC has been provisioned by your account manager and matches your control framework
- [ ] SSO is configured, tested, and enforced (with a break-glass owner account preserved)
- [ ] Company Branding is set with current logo, colours, and hero imagery
- [ ] If on Premium and brand-sensitive: white-labelling has been requested and your DNS records are in flight with your account manager
- [ ] Notifications are tuned, @-mentions are on, and the team has agreed to leave hiring rationale on the candidate record rather than side channels

## Features covered in this chapter

| # | Feature | Tier |
|---|---------|------|
| 1 | Team Members | Metered — Standard: 5 · Premium: unlimited |
| 2 | Role-Based Access Control | Standard role-on-invite · Premium granular RBAC (provisioned by Sebenza) |
| 3 | SSO Configuration | Premium |
| 4 | Company Branding | Standard |
| 5 | White-Label Branding | Premium (provisioned by Sebenza) |
| 6 | Notifications and @-mentions | Standard |

## Next chapter

[[01 How-To Documents/corporate/04-your-first-requisition|Chapter 4 — Your first requisition]]

## References

- [[02-concepts/rbac]] — How role-based access control is modelled
- [[02-concepts/authentication]] — Magic-link and SSO authentication
- [[02-concepts/multi-tenancy]] — How organisation isolation works
- [[01 How-To Documents/corporate/04-your-first-requisition|Chapter 4 — Your first requisition]]
