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

You've created the owner account in Chapter 2 and landed on the Corporate dashboard. Before you post a single requisition, spend an hour wiring up the organisation properly: invite the team, set permissions, lock down access with SSO, brand your candidate experience, and turn on collaboration. Skip this and you'll spend the next six months apologising to hiring managers, security, and brand.

This chapter covers six features in the order you should set them up.

## Why this order matters

Each feature in this chapter assumes the previous one is done:

1. **Team Members** — there's nothing to permission until people exist in the system.
2. **RBAC** — there's nothing to brand against until permissions are clear.
3. **SSO** — you can only enforce SSO once permissions exist for the SSO-provisioned users to land into.
4. **Company Branding** — branding lifts apply rates immediately and applies to everything downstream.
5. **White-Label Branding** — only relevant for Premium customers who need to remove Sebenza branding from the candidate journey entirely.
6. **Team Collaboration** — turn it on once people are in and permissioned, so the activity feed has signal from day one.

## Add your team

### Team Members — _Tier: Metered — Standard: 5 · Premium: unlimited_

**What this feature is.** Team Members lets you add other users to your organisation with their own logins, profiles, and permissions. Recruiters, hiring managers, HR business partners, interviewers — anyone who needs to see candidates, run pipelines, or score interviews has their own seat.

**Why it matters.** Corporate hiring is a multi-stakeholder activity. Sharing a single login is how candidate data gets leaked, how audit trails become useless, and how POPIA accountability evaporates. Metered seats align cost with the actual size of your hiring team in a predictable way: Standard fits a small TA function (5 seats), Premium goes unlimited for larger teams.

**How to use it.**

1. Go to **Team Members** in Settings.
2. Click **Invite member**.
3. Enter their work email, select a default role (you'll refine this in the next section), and add them to the relevant requisition groups.
4. They receive a magic-link invite. Once they click it, they appear in your Team Members list.
5. Repeat for every recruiter, hiring manager, and HRBP who needs access. Don't invite occasional interviewers as full team members — use the interviewer scorecard flow instead (covered in Chapter 4) to keep your seat count clean.

![[13-raw/screenshots/c-ch03-team-members-invite-dialog.png]]

If you're on Standard and 5 seats isn't enough, upgrade to Premium before you add the sixth person — the system will block the invite otherwise. If you're close to the limit, decide whether each new person is a recurring user (give them a seat) or a one-off contributor (use the lighter interviewer flow instead).

## Lock down who can do what

### Role-Based Access Control — _Tier: Premium_

**What this feature is.** RBAC gives you granular control over what each team member can see and do — who can view salaries, who can edit requisitions, who can make offers, who can export candidate data. You define roles once and apply them across the team. See [[02-concepts/rbac]] for the underlying model.

**Why it matters.** Enterprise hiring touches sensitive data: candidate demographics, salary bands, references, and disciplinary history of internal applicants. RBAC is a non-negotiable requirement for any listed or regulated company — your Risk and Audit committees will ask about it. Without RBAC, every team member sees everything, which fails most internal control frameworks.

**How to use it.**

1. Go to **Settings → Roles & Permissions**.
2. Start with the default roles: Owner, Admin, Recruiter, Hiring Manager, Interviewer, HRBP. Each comes with a sensible default permission set.
3. For each role, review what they can see (candidates, salaries, demographics), what they can edit (requisitions, offers, scorecards), and what they can export (candidate lists, reports).
4. Adjust the defaults to match your control framework. Common changes: hide salary fields from interviewers, restrict offer creation to Recruiters and above, restrict candidate exports to Admins only.
5. Assign each team member their role from the Team Members list. A team member can only have one role — to give someone temporary elevated access, change their role for the duration and change it back after.

![[13-raw/screenshots/c-ch03-rbac-permissions-matrix.png]]

Document the resulting permission model in your internal wiki and share it with Risk/Audit before go-live. RBAC is only as good as the discipline you bring to assigning roles.

## Enforce single sign-on

### SSO Configuration — _Tier: Premium_

**What this feature is.** SSO Configuration lets you connect Sebenza Hub to your corporate identity provider (Azure AD, Okta, Google Workspace) using SAML or OAuth. Once enabled, team members log in with their corporate identity instead of a magic link, and offboarding through your IdP automatically revokes Sebenza access.

**Why it matters.** Any serious enterprise above ~500 employees mandates SSO for security and offboarding. Without SSO, every Sebenza user is a separate offboarding task that someone has to remember; with SSO, the day someone leaves the company, their Sebenza access dies with their corporate identity. For most enterprise procurement processes, no SSO means no deal.

**How to use it.**

1. Talk to IT first. You'll need an admin in your IdP (Azure AD / Okta / Google Workspace) to create a new application for Sebenza Hub.
2. Go to **Settings → SSO Configuration** and choose your protocol (SAML 2.0 for most enterprises, OAuth for Google Workspace).

![[13-raw/screenshots/c-ch03-sso-configuration-form.png]]

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

![[13-raw/screenshots/c-ch03-company-branding-upload-preview.png]]

Re-do this if your brand refreshes. Outdated branding on a job listing is more damaging than no branding at all.

## Remove Sebenza branding entirely

### White-Label Branding — _Tier: Premium_

**What this feature is.** White-Label Branding takes Company Branding further: a fully custom domain (jobs.yourcompany.co.za), Sebenza branding removed from the candidate experience, and branded candidate emails sent from your domain instead of Sebenza's.

**Why it matters.** Large corporates and brand-sensitive employers refuse to let third-party branding appear in their candidate journey. White-labelling is the threshold requirement for many enterprise deals — without it, the brand team blocks procurement. If you don't have the issue, you don't need this feature.

**How to use it.**

1. Talk to IT. White-labelling requires DNS changes (CNAME for the custom domain, SPF / DKIM / DMARC for the branded email sender) and a TLS certificate.
2. Go to **Settings → White-Label**.
3. Enter the custom domain you want to use (e.g. `jobs.yourcompany.co.za`).

![[13-raw/screenshots/c-ch03-white-label-custom-domain.png]]

4. Sebenza Hub displays the DNS records IT needs to add. Send them across.
5. Once DNS propagates, Sebenza provisions the TLS certificate automatically. This usually takes under an hour.
6. Configure the branded email sender (e.g. `careers@yourcompany.co.za`). IT needs to add SPF and DKIM records for the Sebenza mail relay.
7. Test by applying to a draft job from outside the network — verify the domain in the URL bar, the lack of Sebenza branding, and the sender address on the confirmation email.

Keep the original Sebenza-domain URLs working as fallbacks during the transition. Once everyone is on the white-label domain, the originals can be deprecated quietly.

## Turn on team collaboration

### Team Collaboration — _Tier: Standard_

**What this feature is.** Team Collaboration lets your team share candidates, leave notes, drop comments, @-mention each other, and follow an activity feed of decisions across requisitions. The hiring conversation moves out of Slack and email and into the platform where the candidate record lives.

**Why it matters.** Hiring decisions today happen in Slack DMs and email threads, with the rationale lost the moment the channel scrolls. In-platform collaboration captures the decision context against the candidate record — so six months later, when someone asks "why did we pass on this person?", the answer is right there.

**How to use it.**

1. Go to **Settings → Collaboration** and turn on @-mentions, comments, and the activity feed.
2. Configure notification routing: which events trigger a notification, to which channels (email, in-app). Most teams start with @-mentions only and add more events as they tune.
3. In your team kickoff for a new requisition, agree to leave hiring decisions as comments on the candidate record — not in Slack. The first week is the hardest; after that the habit forms.
4. For interviewers who are not full team members, use the scorecard-only flow (covered in Chapter 4). They can leave structured feedback without consuming a Team Member seat.

![[13-raw/screenshots/c-ch03-team-collaboration-feed.png]]

The activity feed becomes useful once there's a few weeks of decisions in it. Don't expect it to be useful on day one.

## Checklist

- [ ] You've invited every recurring team member as a Team Member
- [ ] You've configured RBAC roles and assigned each team member appropriately
- [ ] SSO is configured, tested, and enforced (with a break-glass owner account preserved)
- [ ] Company Branding is set with current logo, colours, and hero imagery
- [ ] If on Premium and brand-sensitive: White-Label is configured with custom domain and email
- [ ] Team Collaboration is on, with notification routing tuned to @-mentions only initially

## Features covered in this chapter

| # | Feature | Tier |
|---|---------|------|
| 1 | Team Members | Metered — Standard: 5 · Premium: unlimited |
| 2 | Role-Based Access Control | Premium |
| 3 | SSO Configuration | Premium |
| 4 | Company Branding | Standard |
| 5 | White-Label Branding | Premium |
| 6 | Team Collaboration | Standard |

## Next chapter

[[01 How-To Documents/corporate/04-your-first-requisition|Chapter 4 — Your first requisition]]

## References

- [[02-concepts/rbac]] — How role-based access control is modelled
- [[02-concepts/authentication]] — Magic-link and SSO authentication
- [[02-concepts/multi-tenancy]] — How organisation isolation works
- [[01 How-To Documents/corporate/04-your-first-requisition|Chapter 4 — Your first requisition]]
