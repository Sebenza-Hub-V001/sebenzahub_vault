---
title: "Chapter 24 — Using the mobile app"
type: concept
created: 2026-04-26
updated: 2026-04-26
tags: [how-to, individual, mobile, biometric, offline]
status: active
user-types: [individual]
---

# Chapter 24 — Using the mobile app

Sebenza Hub has a native mobile app that pairs with the web dashboard. The web dashboard is the primary experience — it has every feature in this manual — but the mobile app exists for the moments when sitting at a laptop isn't an option: scrolling new matches in a queue, replying to a recruiter on the train, recording a video answer from your phone, or running a quick interview rehearsal between meetings.

This chapter is short by design. The mobile app intentionally exposes a smaller, focused surface; if you need a feature that isn't there, fall back to the web dashboard.

## Installing the app

The mobile app installs through the standard channels:

- **iPhone / iPad** — search for *Sebenza Hub* in the App Store and install.
- **Android** — search for *Sebenza Hub* in the Google Play Store and install.

The first time you open the app it takes you straight to login. If you've already created an account on the web (Chapter 2), you sign in with the same email and the same magic link — the platform identifies you across devices.

The app uses Capacitor under the hood, which means the web dashboard and the mobile shell share a lot of code but the mobile shell is its own native binary. You don't have to think about that — it's relevant only if a future support article tells you to "reinstall the app" rather than "refresh the page."

## Signing in with biometrics

After you've signed in once on the device, the app can use **biometric authentication** for subsequent logins — Face ID, Touch ID, or fingerprint, depending on the phone. This means you don't have to wait for a fresh magic link every time you open the app.

To enable biometric login:

1. Sign in once with the magic link, the normal way.
2. The app asks if you'd like to enable biometric login on this device. Tap **Enable**.
3. Confirm with your phone's biometric (the OS prompt — Face ID, Touch ID, or fingerprint).
4. From that point on, opening the app authenticates you with the biometric in a fraction of a second.

If biometric isn't available (older device, biometrics not set up at the OS level, or you've declined it), the app falls back to the magic-link flow you'd use on the web. You can disable biometric login at any time from the app's profile settings.

## What's available in the mobile app

The mobile app exposes five tabs along the bottom navigation:

| Tab | What's there |
|-----|--------------|
| **Home** | Daily summary — applications that need attention, new matches, recent activity, next-best-action prompts. |
| **Jobs** | Browse, filter, and apply to listings on the go. The same Auto Match / Manual Search engines run; just simpler controls. |
| **Features** | Mobile-friendly entry points to the AI tools — coaching tabs, CV review, mock interview, salary insights. Heavier features may redirect you back to the web dashboard. |
| **Inbox** | Recruiter messages and platform notifications. Replies sent here log to the same application records as the web Inbox. |
| **Profile** | Your profile, biometric login toggle, app settings, and the sign-out option. |

The Job Seeker dashboard you use on the web (Chapter 4) has more sections than this. The mobile app deliberately curates down to the five things you'll do most often from a phone — the rest is one tap away on the web dashboard if you need it.

## What you can do offline

Mobile networks in South Africa are uneven. The app handles that gracefully for read-mostly tasks. The general rule:

- **Reading is mostly offline-friendly.** Job listings, application statuses, recent inbox messages, your profile — all cached locally so you can scroll them without a connection.
- **Writing requires a connection.** Submitting an application, replying to a recruiter, generating an AI cover letter, running an interview simulator session — these all need the platform to be reachable.

When the connection drops, the app shows a small banner. Anything you typed before the drop is preserved; tap **Send** when you reconnect and it goes through.

## What's *not* in the mobile app (yet)

A few features are web-only by design or because they're hard to fit on a small screen:

- **CV Builder** — designing a CV with templates, signatures, and live preview is a desktop task. The mobile app shows your saved CVs and lets you pick one for an application, but the editing happens on the web.
- **Application Portal** kanban view — works on web, simplified on mobile.
- **Interview Simulator video sessions** — voice and video recording works on the phone, but the full multi-tab simulator is a web experience.
- **Salary Negotiator** structured workflow — covered in Chapter 16; use the web for this one.
- **Settings** for Career DNA, Autopilot, Market Radar — these are configuration-heavy and live on the web.

If you tap a feature that isn't fully supported on mobile, the app surfaces a "Open on web" button rather than half-rendering it.

## Notifications

The mobile app receives push notifications for:

- Recruiter messages
- Interview invitations
- Application status changes
- Reminders you've set up (Chapter 12)
- Market Radar alerts if you've configured them (Chapter 22)

Tune notification frequency and channels in **Profile → Notifications** in the app, or on the web in **Settings → Notifications**. The two share the same underlying preferences.

## When to use the mobile app vs the web dashboard

| Use the mobile app for… | Use the web for… |
|-------------------------|-------------------|
| Quick check-ins between meetings | Building or editing CVs |
| Replying to a recruiter from the train | Running CV Review |
| Browsing new matches over coffee | Configuring Career DNA, Autopilot, Market Radar |
| Recording a quick video answer | Full Interview Simulator sessions |
| Reading the next-best-action prompt in the morning | Salary Negotiator structured workflow |
| Quick search and apply when something looks right | Application Portal and Candidate Hub deep-dives |

If you mostly use the platform from your phone, that's fine — just keep one weekly session on the web for the configuration tasks the app can't do.

## Checklist

- [ ] Installed the app from the App Store or Play Store
- [ ] Signed in once with the magic link
- [ ] Enabled biometric login if your phone supports it
- [ ] Tried the five tabs — Home, Jobs, Features, Inbox, Profile
- [ ] Tuned notification preferences so the app isn't louder than you want it to be
- [ ] You know which tasks belong on web (CV Builder, Settings, deep workflows) and which belong on mobile

## References

- [[01 How-To Documents/individual/02-creating-your-account|Chapter 2]] — Magic-link login (same flow on web and mobile)
- [[01 How-To Documents/individual/04-first-10-minutes|Chapter 4]] — The full web dashboard
- [[01 How-To Documents/individual/12-tracking-applications|Chapter 12]] — The Inbox lives here on the web
