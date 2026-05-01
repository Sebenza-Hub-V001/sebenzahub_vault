---
title: "Tweet Inbox"
type: task
created: 2026-05-01
updated: 2026-05-01
tags: [inbox, tweets, mobile-capture]
status: active
---

# Tweet Inbox

Phone-to-vault queue for tweet URLs. Wes pastes URLs from his phone (Obsidian Mobile syncs the vault); on the next desktop session, Claude drains the queue and runs the full Tweet workflow on each URL.

## How to use

- **From phone:** open this file in Obsidian Mobile, paste the tweet URL at the bottom of the `## URLs` section (one per line), save. Sync handles the rest.
- **From desktop:** skip this file — just drop URLs directly into chat.
- **Trigger phrase (desktop):** say *"process tweet inbox"* — also accepted: *"ingest the inbox"*, *"process pending tweets"*, *"drain the tweet inbox"*.
- **What Claude does:** runs the full Tweet workflow (see [[../CLAUDE]] → Operations → Tweet) on each URL in order, then clears the URL lines from this file (preserves this header and the `## URLs` heading).

## URLs

<!-- Paste tweet URLs below this comment, one per line. Claude clears these lines after processing. -->
