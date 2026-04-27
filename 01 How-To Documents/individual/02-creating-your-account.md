---
title: "Chapter 2 — Creating your account"
type: concept
created: 2026-04-09
updated: 2026-04-20
tags: [how-to, individual, signup, authentication]
status: active
user-types: [individual]
---

# Chapter 2 — Creating your account

Sebenza Hub does not use passwords. Instead, it sends you a one-time login link by email — a "magic link." This is the same way you sign up *and* the same way you log in afterward. There is nothing to memorise.

This chapter walks you through your first sign-up. It takes about two minutes, and you'll need:

- A working email address you can check right now
- A phone capable of receiving the link if you're checking email there

## Step 1 — Open the sign-up page

Open the sign-up page directly: [https://www.sebenzahub.co.za/get-started](https://www.sebenzahub.co.za/get-started)

(Or visit [https://www.sebenzahub.co.za](https://www.sebenzahub.co.za) and click **Get Started** — both routes lead to the same magic-link form for new users. **Log In** at [https://www.sebenzahub.co.za/login](https://www.sebenzahub.co.za/login) also works the same way for new users.)

The page asks for one thing: your email address.

Use an email you'll keep checking. You'll get application updates, interview invitations, and reminders here, so a working personal email is much better than a temporary or shared one.

![[ch02-signup-landing-page.png]]

## Step 2 — Request the magic link

Type your email and submit. Behind the scenes, Sebenza Hub generates a one-time link and emails it to you through Resend (their email provider). You'll see a confirmation message telling you to check your inbox.

A few practical notes:

- **The email usually arrives within a few seconds.** If it doesn't show up after a minute, check your spam folder before requesting another one.
- **You can request a new link up to five times per minute** for the same email. If you hit that limit, wait 60 seconds before trying again.
- **The link is only valid for 15 minutes.** If you get distracted and come back later, just request a new one.

![[ch02-magic-link-login.png]]

## Step 3 — Click the link in your email

Open the email and click the magic link. This will:

1. Verify the link in your browser
2. Mark the link as used (one-time only — clicking it again won't work)
3. Create your account if you're new
4. Sign you in

![[ch02-magic-link-email.png]]

The first time you do this, you'll be redirected to **/onboarding** because Sebenza Hub doesn't know who you are yet. That's covered in [[01 How-To Documents/individual/03-onboarding|Chapter 3]].

> **If you click the link and get an "expired token" error**, it means either the 15 minutes ran out or the link has already been used. Go back to [https://www.sebenzahub.co.za/login](https://www.sebenzahub.co.za/login) and request a fresh one — there's nothing wrong with your account.

## Step 4 — Stay signed in

After you log in, Sebenza Hub keeps you signed in for 24 hours of activity. As long as you use the platform within that window, you stay logged in. After 24 hours of inactivity, you'll need to sign in again — same way: enter your email, request a magic link, click it.

There's no "remember me" checkbox because there's no password to remember in the first place.

## Your 30-day Premium trial

Every new Individual account starts on a **30-day Premium trial**. You don't need to enter card details, you don't need a coupon code, and you don't need to do anything to opt in — the trial is set up automatically the moment you finish onboarding.

What that means in practice:

- For 30 days you have access to almost every feature on the platform — the AI tools (CV Review, mock interviews, salary coaching, career coaching), unlimited cover letters, advanced search, salary insights, learning paths, and so on. Use the time to find out what's worth paying for after the trial ends.
- A small banner inside the dashboard shows how many days remain. You don't have to track it yourself.
- Sebenza Hub will email you a reminder **7 days** before the trial ends and again **1 day** before, so you have time to decide whether to subscribe or fall back to Free.
- A few real-money items have hard caps during the trial to keep it sustainable: **2 background checks**, **5 bulk exports**, and **50 WhatsApp campaign messages**. Hit one of those caps and that single feature stops working until the trial converts to a paid plan — everything else keeps running.
- When the 30 days end, your account drops cleanly to the Free tier. Nothing is deleted; you just lose access to the paid-only features. You can subscribe at any time to restore them.

## A note on security

Passwordless login is genuinely safer than a password for most people. There's nothing for you to forget, nothing to reuse across other sites, and nothing for an attacker to guess. The trade-off is that **your email account is now your master key.** If someone else has access to your email, they can sign in to Sebenza Hub as you. So:

- Use an email account that *you* control and *you* can secure (with two-factor authentication ideally)
- Don't share your email password
- If you suspect your email has been compromised, secure your email first, then come back to Sebenza Hub

## Checklist

- [ ] Entered your email at sebenzahub.co.za
- [ ] Received the magic link in your inbox
- [ ] Clicked the link and were redirected to /onboarding
- [ ] You understand that future logins use the same magic-link flow

## Next chapter

[[01 How-To Documents/individual/03-onboarding|Chapter 3 — Onboarding: the 6 things you need to fill in]]

## References

- [[02-concepts/authentication]] — How magic-link authentication works under the hood
