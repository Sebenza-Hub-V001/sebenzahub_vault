---
title: "Admin WhatsApp — Morning Routine Cheat Sheet"
type: procedure
created: 2026-04-09
updated: 2026-04-09
tags: [admin, whatsapp, runbook, daily, cheat-sheet]
status: active
confidence: high
user-types: [admin]
dashboard-path: /admin/whatsapp
---

# Admin WhatsApp — Morning Routine

> **Time budget:** 10 minutes. **Frequency:** every weekday before 09:00. **URL:** [/admin/whatsapp](https://www.sebenzahub.co.za/admin/whatsapp)

## The 5 checks

### ① Command Center → Live Pulse *(60 sec)*
Glance at the **Live Pulse** strip and **Bot Health** card.

| Metric | 🟢 Green | 🟡 Watch | 🔴 Act |
|---|---|---|---|
| Bot toggle | ON | — | OFF → flip it back on |
| Webhook Latency | <500ms | 500-1000ms | >1s → check Configuration |
| Error Rate | <2% | 2-5% | >5% → check `/health` endpoint |
| Queue Size | <50 | 50-100 | >100 → War Room |
| Delivery Rate | >97% | 95-97% | <95% → Configuration |

**If anything is red →** jump to the relevant tab below before continuing.

---

### ② War Room → Escalation Queue *(3-4 min)*
Open **War Room**. Filter by **Critical** then **High**.

- **`predictedNext30Min` >5?** → get ahead of it now, don't wait.
- **Any conversation waiting >15 min?** → assign to an agent or take over yourself.
- **Sentiment <-0.5 anywhere?** → take over personally, don't delegate.
- **Queue empty?** → ✅ move on.

**Personal SLA:** no escalation older than **15 minutes** by 09:30.

---

### ③ Command Center → Sentiment + Funnel *(60 sec)*
Back on Command Center, check the two charts.

| Chart | 🟢 Green | 🔴 Act |
|---|---|---|
| Sentiment — Negative % | <15% | >15% → Quality & CSAT to find which topic |
| Funnel — Browsed → Responded | >60% | <50% → Bot Training (greeting/menu broken?) |
| Funnel — Applied → Hired | >5% | <2% → AI Matcher (matching weights wrong?) |

---

### ④ Compliance → Recent Opt-Outs *(60 sec)*
Open **Compliance**. Look at **Recent Opt-Outs** list.

- **More than 5 opt-outs overnight?** → check if a campaign sent late yesterday. If yes, pause it in **Campaigns**.
- **POPIA Compliance Score dropped below 85%?** → investigate before launching anything new today.
- **All quiet?** → ✅ move on.

---

### ⑤ Bot Training → Unmatched Log *(60 sec spot-check, 30 min weekly)*
Open **Bot Training → Unmatched Messages**.

- **Glance at the count.** If it grew by >20 overnight, something new is breaking the bot.
- **Don't triage now** — that's the weekly job. Just note if it spiked.

---

## Daily go/no-go

By 09:00 you should be able to answer **yes** to all of these:

- [ ] Bot toggle is ON
- [ ] Bot Health is green
- [ ] War Room queue is clear or being worked
- [ ] No sentiment crisis
- [ ] No opt-out spike from last night's sends
- [ ] Unmatched count is normal

**If any is no → fix or delegate before doing anything else today.**

---

## Red-flag escalation

| What you see | Where it lives | Who to call |
|---|---|---|
| `WhatsApp Not Configured` banner | Configuration tab | DevOps — credentials lost or token expired |
| Webhook Latency >2s for >5 min | Bot Health | DevOps — server or Meta API issue |
| Active escalations >10 OR predictedNext30Min >10 | War Room header stats | All hands — open Replay & Debug on the worst |
| Delivery Rate <90% | Bot Health | DevOps + Meta status page |
| Opt-Out Rate spike >10% in 1 hour | Compliance | Pause all active campaigns immediately |

---

## Quick links

- **Command Center:** [/admin/whatsapp](https://www.sebenzahub.co.za/admin/whatsapp) (default tab)
- **War Room:** [/admin/whatsapp](https://www.sebenzahub.co.za/admin/whatsapp) → War Room tab
- **Setup runbook:** [[admin-whatsapp-command-center-setup]]
- **Tab reference:** [[admin-whatsapp-tab-reference]]
- **Meta status page:** [metastatus.com](https://metastatus.com)

---

> **Print this page.** Stick it next to your monitor. Tick the 5 checks every morning until they're muscle memory, then keep the page for the red-flag table.
