---
title: "Chapter 2 — Creating your account"
type: concept
created: 2026-04-20
updated: 2026-04-20
tags: [how-to, corporate, signup, authentication]
status: active
user-types: [business]
---

# Chapter 2 — Creating your account

This chapter walks you through creating a Corporate (Business) account. Signup itself is short — under five minutes. The decisions you make here matter for longer than that, so read the warnings before you click.

## Before you start

You need:

- A **work email address you control**. Use a real corporate domain (you@company.co.za), not a personal Gmail. Your organisation identity will be tied to this email, and team members, candidates, and integrated systems will see communications coming from this domain.
- About five minutes for signup itself, plus another fifteen for organisation setup covered in Chapter 3.
- The full legal name of your company, the trading name (if different), and your primary contact details ready. You don't strictly need them to sign up, but they're needed before the dashboard will be useful.
- Confirmation from IT that **SSO can be configured later** if your security policy requires it. SSO is set up after the initial admin account exists — see [[01 How-To Documents/corporate/03-setting-up-your-org|Chapter 3]].

## Step 1 — Go to the signup page

Open the Sebenza Hub homepage and click **Sign up** (or **Get started**). You'll land on an email entry page.

Enter your work email address and click **Send magic link**. There's no password — Sebenza Hub uses magic-link login, where you click a link in your email instead of typing one. This is more secure than a password (no password to leak, no password to forget) and faster after the first time. SSO can replace this entirely once configured. See [[02-concepts/authentication]] for how the auth model works.

![[13-raw/screenshots/ch02-magic-link-email.png]]

(Shared auth screenshot — same magic-link email screen is used across Individual, Recruiter, and Corporate signups.)

## Step 2 — Click the magic link

Check your inbox. You should see an email from Sebenza Hub within a minute or two. If you don't, check spam and any quarantine — corporate mail systems frequently filter automated mail.

Click the link in the email. It opens in your browser and logs you in.

> **Note:** The magic link expires after a short window. If you take too long to click it, request a new one.

## Step 3 — Choose your role

The first time you log in, Sebenza Hub doesn't know whether you're a job seeker, a recruitment agency, or an in-house corporate hiring team. You'll be redirected to the onboarding role picker.

Choose **Business**.

![[13-raw/screenshots/c-ch02-role-selection-business.png]]

> Warning. **This is the most important click in the guide.** Once you select Business and complete onboarding, your role is **locked** to this account. You cannot later switch this same login to a Recruiter account or an Individual account. If you accidentally pick the wrong role, the cleanest fix is to use a different email address and start over.

If you also need to:

- **Test the candidate experience** as a job seeker, create a separate Individual account on a different email.
- **Engage external recruitment agencies**, they sign up themselves on the Recruiter product. You manage them from inside your Corporate account in Chapter 7 — you don't create their accounts.

These are not the same account, and they cannot share a login.

## Step 4 — On to organisation setup

After you select Business, you'll be taken to a longer form for setting up your organisation: company name, primary contact, sectors, employee count band, and verification. That's covered in [[01 How-To Documents/corporate/03-setting-up-your-org|Chapter 3]].

The first user to complete onboarding becomes the **organisation owner** with full permissions. Choose carefully who runs through Chapters 2 and 3 — typically the Head of Talent Acquisition or the HRIS owner. Other team members are invited from inside the dashboard once setup is done.

## What to do if signup fails

- **No magic link arrived after five minutes** — check spam and quarantine, then request a new link. If still nothing, your corporate mail server is likely blocking it. Talk to IT to whitelist the Sebenza Hub sender domain. As a workaround, use a personal address just to get in, then transfer ownership to a corporate email later.
- **The link says "expired"** — request a new one. Old links die quickly by design.
- **The link works but takes you to the wrong place** — clear your browser cookies for the Sebenza Hub domain and try again. You may have a stale session from a previous visit.
- **You picked the wrong role** — see the warning above. The fix is a fresh email address; there's no in-app role switch.
- **You need SSO before the first login** — not possible. SSO is configured from inside the dashboard, which requires at least one admin account. Create the first admin with magic-link, then enforce SSO for everyone else.

## Checklist

- [ ] You used a real corporate work email (not a personal one)
- [ ] You clicked the magic link and logged in
- [ ] You selected **Business** as your role
- [ ] You understand role is locked to this account
- [ ] The person who completed signup is the right long-term owner of the organisation record

## Next chapter

[[01 How-To Documents/corporate/03-setting-up-your-org|Chapter 3 — Setting up your organisation]]

## References

- [[02-concepts/authentication]] — How magic-link and SSO authentication work
- [[01 How-To Documents/corporate/03-setting-up-your-org|Chapter 3 — Setting up your organisation]]
