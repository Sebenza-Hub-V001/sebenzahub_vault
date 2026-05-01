---
title: "Chapter 8 — Privacy and POPIA"
type: concept
created: 2026-04-09
updated: 2026-04-20
tags: [how-to, individual, privacy, popia, compliance]
status: active
user-types: [individual]
---

# Chapter 8 — Privacy and POPIA: what recruiters can see

You now have a complete profile, a CV, verified skills, and possibly a video. The next decision is about who can see all of it. This chapter walks through the privacy controls Sebenza Hub gives you, what your POPIA rights are, and how to set up notifications without drowning yourself in alerts.

It's the last chapter of Part 2. After this you're ready to start applying.

## The two questions privacy answers

1. **Can recruiters find me?** (Profile visibility)
2. **What can they see if they do?** (Field-level visibility and the public profile preview)

Both are under your control. The defaults are sensible but worth reviewing rather than accepting blind.

## Profile visibility: public vs private

You set this during onboarding. To change it now, open **Settings**: [https://www.sebenzahub.co.za/dashboard/individual/settings](https://www.sebenzahub.co.za/dashboard/individual/settings) — and find Profile Visibility.

![[i-ch08-popia-consent-toggles.png]]

| Setting | What happens |
|---------|--------------|
| **Public** | Recruiters can find your profile in search, contact you via Inbox, and view your public profile preview. You're discoverable. |
| **Private** | Recruiters cannot find you in search. You can still apply to jobs yourself, but nobody comes to you. |

### Which one to use

- **Actively job hunting and not employed?** Public. Being findable is half the platform's value.
- **Actively job hunting but currently employed?** Public — but read the next subsection on hiding from your current employer.
- **Casually open to opportunities, not really looking?** Public. The volume will be lower because you're not applying, but the inbound matters.
- **Not looking right now, want to keep an account warm?** Private until you flip it back.

### Hiding from your current employer

If your employer uses Sebenza Hub as a Recruiter or Business and you're worried about them seeing your profile, the safest options are:

1. Set your profile to **private** while you're early in your search and applying to specific roles you've identified yourself.
2. Use **anonymous-friendly fields** in your headline and summary — describe your role without giving away employer-identifying details.
3. Be aware that the moment you *apply* to a job, the employer of that job sees you. There is no anonymous application route.

If a per-organisation block exists in Settings, use it on top of the above. Check your current Settings page for the option, since the feature set evolves.

## What recruiters actually see

The fields a recruiter sees on your public profile include:

- **Always visible**: name, headline, location, role you're seeking, top skills, photo, video intro (if uploaded), portfolio link (if added), verified badges
- **Visible by default but configurable**: full work history, education, credentials, summary, languages
- **Visible only after you apply to them**: contact details, full CV file, screening question answers, demographics (if you provided them for EE reporting)

### Preview your public profile

Go to **Profile** → **Public Profile** tab. This is exactly what a recruiter sees when they look at you. Click through it.

Things to check:

- Is the photo professional and reasonably current?
- Does the headline say what you actually want, in plain language?
- Are any of your work history dates wrong (a common parsing artefact from Chapter 5)?
- Are any old roles still showing employer details you'd rather not advertise?

If anything is off, fix it now. Unlike your CV file, this is the first impression — and you cannot ask the recruiter for a second one.

## POPIA: your rights and what you consented to

POPIA is South Africa's data protection law. You consented to it during onboarding (Chapter 3). Here's what that consent actually means and what rights you have.

### What you consented to

By ticking the POPIA consent box, you allowed Sebenza Hub to:

- **Collect** the personal information you provided (name, contact details, location, work history, skills, demographics if any)
- **Store** it on Sebenza Hub's systems (including, where applicable, with infrastructure providers)
- **Process** it to deliver the services the platform provides — matching you to jobs, surfacing your profile to recruiters, generating AI feedback
- **Share** relevant parts with recruiters and employers when you apply to a job, or when you make your profile public and they search for candidates

Sebenza Hub is required to protect that data and to use it only for the purposes you consented to. If they want to use it for something materially different, they have to ask for fresh consent.

### Your POPIA rights

You have the right to:

| Right | What it means | How to exercise it |
|-------|---------------|---------------------|
| **Access** | See what data Sebenza Hub holds about you | Settings → Privacy → POPIA & Data Rights → **Export My Data** (downloads your profile, applications, and history). A second JSON export lives at Settings → Account → **Data & Export → Export Profile**. |
| **Correction** | Fix data that's wrong | Edit your profile fields directly, or email **privacy@sebenzahub.co.za** for fields you can't edit |
| **Object to processing** | Limit specific uses of your data | Settings → Privacy → **Recruiter Interactions** toggles (Searchable by Recruiters, Allow Messages, Allow Recommendations); plus Settings → **Notifications** for email / WhatsApp / SMS channels |
| **Withdraw consent (demographic data)** | Revoke your Employment Equity / demographic consent only — your account stays open | Settings → Privacy → **Demographics** card → **Withdraw consent & delete** (deletes only the demographic record) |
| **Deletion** | Permanently delete your account and all data | Settings → **Account → Danger Zone → Delete My Account** — confirmation prompt, then a 30-day POPIA retention window before final wipe |

![[i-ch08-popia-data-rights-card.png]]

> ℹ️ **There is no single "DSAR request form" in the product.** Each right has its own button, and they live in different tabs:
>
> - **Export** lives on the Privacy tab (and Account tab) — non-destructive, fires immediately.
> - **Withdraw demographic consent** lives on the Privacy tab inside the Demographics card — destructive but narrow (deletes only your gender / race / age / disability record; account stays open).
> - **Delete My Account** lives on the Account tab under Danger Zone — destructive and final, with a 30-day cooling-off window mandated by POPIA.
>
> If you need a right that doesn't have a dedicated button (e.g. a partial export, or objecting to a specific processing purpose that none of the toggles cover), email **privacy@sebenzahub.co.za** with "DSAR" in the subject line and the platform's privacy team will action it manually.

### If the platform updates its terms

If Sebenza Hub materially changes its privacy policy or POPIA consent text, you may be asked to re-consent the next time you sign in. When that prompt appears, read the new text before you accept — the changes are usually small, but it's the moment when you have the most leverage to opt out of anything you don't agree with.

## Notification settings

Notifications are technically separate from privacy, but they live in the same orbit and are usually configured at the same time. Set them now so you don't have to think about them later.

Sebenza Hub can notify you through three channels:

- **Email** — application updates, recruiter messages, job alerts
- **WhatsApp** — high-signal alerts and replies (if you opt in)
- **SMS** — interview reminders and time-sensitive things

Go to **Settings** → **Notifications** and review each category. Recommendations:

| Notification type | Recommended channel |
|-------------------|---------------------|
| Recruiter messages | Email + WhatsApp |
| Application status changes | Email |
| Interview invitations and reminders | Email + SMS |
| New job matches (Auto Match) | Email, weekly digest |
| Saved search alerts | Email, daily digest |
| Marketing / platform updates | Email only, low frequency |

Avoid turning *everything* on across all channels — you'll be exhausted within a week and start ignoring the channel that actually matters. Pick one channel as your primary and use the others sparingly.

## When to revisit this chapter

- Whenever you change your job search status (active → passive, or vice versa)
- Before any major life event that affects what you want to share
- If you start getting too many or too few notifications
- If you ever want to exercise a POPIA right

## Checklist

- [ ] You know whether your profile is currently public or private (and that's the right setting)
- [ ] You've previewed your public profile and corrected anything wrong
- [ ] You understand what you consented to under POPIA
- [ ] You know where to find the export, withdraw-demographic-consent, and delete-account buttons (three different tabs)
- [ ] You've set notification preferences across email, WhatsApp, and SMS
- [ ] Your chosen notification volume is sustainable, not overwhelming

## Part 2 complete — what's next

You now have a complete profile, a strong CV, verified skills, credentials, sensible privacy settings, and notification preferences that won't drown you. You are ready to actually apply to jobs.

Part 3 is where things start moving outward instead of inward. Take a breath, then carry on.

## Next chapter

[[01 How-To Documents/individual/09-search-modes|Chapter 9 — Browse vs Auto Match vs Manual Search]]

## References

- [[02-concepts/compliance]] — POPIA, B-BBEE, Employment Equity overview
- [[01 How-To Documents/individual/03-onboarding|Chapter 3]] — Where you originally gave POPIA consent
