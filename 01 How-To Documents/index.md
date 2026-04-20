---
title: "Training Manuals"
type: overview
created: 2026-04-09
updated: 2026-04-20
tags: [how-tos, training, documentation]
status: active
---

# Training Manuals

End-user how-to guides for each Sebenza Hub user type. These are written **for users**, not for the engineering team — they teach people how to use the platform to achieve a real outcome (get hired, source candidates, fill a vacancy).

## Available Manuals

| Manual | Audience | Chapters | Features covered | Status |
|--------|----------|----------|------------------|--------|
| [[01 How-To Documents/individual/index\|Individual Manual]] | Job seekers | 23 | 85 (all Individual features #1–85) | Complete draft |
| [[01 How-To Documents/recruiter/index\|Recruiter Manual]] | Recruitment agencies | 35 (incl. 4.5) | 131 (all Recruiter features #86–216) | Complete draft |
| [[01 How-To Documents/corporate/index\|Corporate Manual]] | Employers / corporate HR | 9 | 17 Corporate + 9 cross-product (#217–246 where applicable) | Complete draft |
| Admin Manual | Platform operators | — | 7 admin-only features (#247–253) | Not started — admin-only features are out of public-manual scope; belong in an internal runbook |

Every chapter that covers a feature tags it with a **Tier** badge (`_Tier: Free_`, `_Tier: Standard_`, `_Tier: Premium_`, or `_Tier: Metered — ..._`) on the heading, so users always know what plan a feature is on. Each feature-heavy chapter ends with a "Features covered in this chapter" table listing the features, their tier, and source catalogue number.

## Conventions

- **One chapter per file.** Numbered `NN-slug.md`. Numbers are stable once published.
- **Each chapter ends with a checklist.** Users self-verify before moving on.
- **Feature format (from 2026-04-20 rollout).** Every catalogue feature gets a `### Feature Name — _Tier: X_` heading followed by **What this feature is.** → **Why it matters.** → **How to use it.** in that order.
- **Cross-references between chapters use `[[01 How-To Documents/<book>/<slug>]]`.** Links out to concept/workflow pages use `[[02-concepts/...]]` or `[[03-workflows/...]]`. Nothing in a how-to page links to any other wiki folder — that would leak internal state into the public manual site.
- **Screenshots** are embedded from `13-raw/screenshots/` and ship as image assets with the published page. They are not navigation.

## References

- [[03-workflows/individual-journey]]
- [[03-workflows/recruiter-journey]]
- [[03-workflows/business-journey]]
