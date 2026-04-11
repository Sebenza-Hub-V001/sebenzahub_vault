---
title: "Chapter 2 — Creating your account"
type: concept
created: 2026-04-09
updated: 2026-04-09
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

Go to **sebenzahub.co.za** and click **Get Started** (or **Log In** — both routes lead to the same magic-link form for new users). The page asks for one thing: your email address.

Use an email you'll keep checking. You'll get application updates, interview invitations, and reminders here, so a working personal email is much better than a temporary or shared one.
![[13-raw/screenshots/ch02-signup-landing-page.png]]

## Step 2 — Request the magic link

Type your email and submit. Behind the scenes, Sebenza Hub generates a one-time link and emails it to you through Resend (their email provider). You'll see a confirmation message telling you to check your inbox.

A few practical notes:

- **The email usually arrives within a few seconds.** If it doesn't show up after a minute, check your spam folder before requesting another one.
- **You can request a new link up to five times per minute** for the same email. If you hit that limit, wait 60 seconds before trying again.
- **The link is only valid for 15 minutes.** If you get distracted and come back later, just request a new one.
- ![[13-raw/screenshots/ch02-magic-link-login.png]]
## Step 3 — Click the link in your email

Open the email and click the magic link. This will:

1. Verify the link in your browser
2. Mark the link as used (one-time only — clicking it again won't work)
3. Create your account if you're new
4. Sign you in
5. ![[13-raw/screenshots/ch02-magic-link-email.png]]

The first time you do this, you'll be redirected to **/onboarding** because Sebenza Hub doesn't know who you are yet. That's covered in [[16-how-tos/individual/03-onboarding|Chapter 3]].

> **If you click the link and get an "expired token" error**, it means either the 15 minutes ran out or the link has already been used. Go back to /login and request a fresh one — there's nothing wrong with your account.

## Step 4 — Stay signed in

After you log in, Sebenza Hub keeps you signed in for 24 hours of activity. As long as you use the platform within that window, you stay logged in. After 24 hours of inactivity, you'll need to sign in again — same way: enter your email, request a magic link, click it.

There's no "remember me" checkbox because there's no password to remember in the first place.

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

[[16-how-tos/individual/03-onboarding|Chapter 3 — Onboarding: the 6 things you need to fill in]]

## References

- [[02-concepts/authentication]] — How magic-link authentication works under the hood
