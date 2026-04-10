---
title: "Daily Digest Workflow — Reusable Prompt Template"
type: concept
created: 2026-04-10
updated: 2026-04-10
tags: [template, claude-code, github-actions, automation, prompt]
status: active
---

# Daily Digest Workflow — Reusable Prompt Template

A copy-paste brief for spinning up the same daily email digest system in a new project. Hand the block below to a fresh Claude Code session as the first message, fill in the four `{{PLACEHOLDERS}}` at the top, and Claude should be able to build the workflow end-to-end without you re-explaining anything.

The structure stays the same per-project; only the four customisation fields change.

## How to use

1. Open the new project in Claude Code (or whichever Claude environment has filesystem + bash tools).
2. Copy everything inside the fenced block below.
3. Replace the four placeholders at the top with your project's specifics.
4. Paste as the first message and let Claude build it.
5. Follow the post-build checklist Claude returns.

## The template

````markdown
I want to set up a daily email digest of git activity in this repo, written by Claude as casual prose. Same pattern as a system I built before — please build it from this brief.

## Customise these four things first
- **PROJECT_NAME**: {{e.g. "Sebenza Hub Vault" or "MyStartup Codebase"}}
- **RECIPIENT_NAME**: {{e.g. "Wes" — used in the subject line and the prose}}
- **WHAT_THIS_REPO_IS**: {{one sentence Claude can paste into the system prompt to ground its summaries — e.g. "an Obsidian knowledge base for the Sebenza Hub recruitment SaaS"}}
- **TIMEZONE**: {{e.g. "Africa/Johannesburg" — and the local hour you want the email, e.g. 04:00}}

## What to build

Create `.github/workflows/daily-vault-digest.yml` — a GitHub Actions workflow that:

1. **Runs on a schedule.** Convert the local time above to UTC for the cron expression. Also include `workflow_dispatch:` so I can trigger it manually for testing.
2. **Checks out the repo with full history** (`fetch-depth: 0`).
3. **Installs `jq` and `pandoc`** in one apt step.
4. **Collects raw activity** for the last 24 hours into three files:
   - `commits.txt` — `git log --since="24 hours ago" --pretty=format:'commit %h by %an%n%s%n%b%n---' --reverse`
   - `diffstat.txt` — per-file added/deleted line counts via `git log ... --numstat | awk`
   - `diffcontent.txt` — `git log -p` output capped at 60KB so Claude has substance without blowing up context
   - **CRITICAL:** add pathspec exclusions to every git query for editor cache directories. Use `:(exclude)` syntax. Skip at minimum: `.smart-env/`, `.makemd/`, `.obsidian/workspace.json`, `.trash/`, plus anything else you find that obviously regenerates on every save (check `.gitignore` for hints, then add a few more if needed).
5. **Calls the Anthropic API** to write the prose briefing. Use:
   - Model: `claude-sonnet-4-6` (Sonnet 4.6 is the right balance of cost and quality for this)
   - `max_tokens: 1500`
   - The system prompt below (verbatim, with PLACEHOLDERS substituted)
   - Build the JSON payload with `jq -n --rawfile system ... --rawfile user ...` to avoid shell escaping hell
   - On non-200 response, log the response body via `::group::` and write a loud fallback `prose.md` that tells me the HTTP code, the API's actual error message (extract via `jq -r '.error.message'`), and a specific diagnostic for 401 / 429 / 404. Don't fail the workflow — ship the email anyway with the fallback content.
6. **Converts markdown → HTML with pandoc.** Do NOT rely on `dawidd6/action-send-mail`'s `convert_markdown` flag — it silently fails. Run `pandoc digest.md -f gfm -t html5 -o digest_inner.html`, then wrap it in an inline-CSS HTML template (system fonts, light hairline `border-bottom` under `h2`, `#222` body text, max-width 680px, generous line-height).
7. **Sends the email** via `dawidd6/action-send-mail@v3` with `html_body: file://digest.html` and `body: file://digest.md` as the plain-text fallback. The body should be ONLY the prose — no commit list, no files-changed table, no "at a glance" footer.

## Subject line format
`{{RECIPIENT_NAME}}, Your Daily {{PROJECT_NAME}} Update - Friday, 10 April 2026`

Generate the date in the workflow with `TZ='{{TIMEZONE}}' date +'%A, %-d %B %Y'`. Same subject for both the normal and "quiet day" branches.

## System prompt for the prose (paste verbatim, substitute placeholders)

> You are {{RECIPIENT_NAME}}'s personal assistant — think a friend who knows their work intimately and writes them a quick scannable morning rundown. Each day you read what changed in {{WHAT_THIS_REPO_IS}} over the past 24 hours and write a casual, structured update.
>
> **Format:**
> - Open with a single short line like "Morning. Here's what went down yesterday:" — never anything fancier.
> - Then 3 to 6 H2 sections (`## Heading`), each with a few bullet points underneath.
> - Section headings must be **descriptive of what happened**, not generic. Name them based on the actual work. Examples: "## The big win", "## The oh-no moment", "## Quiet cleanup", "## Showed up overnight", "## Loose ends". Never use "## Commits" or "## Summary" or "## Changes".
> - Always end with a "## Today" section that gives one short recommendation about the day ahead, based on what the activity suggests. Don't invent plans — if nothing's obvious, just say "nothing on fire, pick something light".
> - Bullets should be short and punchy. Use **bold** for the numbers, names, and findings that matter.
> - No emoji. No horizontal rules. No code blocks unless quoting an actual filename or command.
>
> **Voice:**
> - Casual, like a mate texting over coffee. Contractions everywhere. Refer to {{RECIPIENT_NAME}} as "you".
> - Opinionated asides are encouraged: "actually shippable now", "this one's interesting", "worth a proper read".
> - If something is embarrassing or surprising in the diffs, say so plainly — that's the whole point of a friend reading the work for you.
> - Group related commits as one piece of work, not as a commit list. The user can read git log themselves; your job is the synthesis.
> - Mention concrete specifics: which file, which feature, which bug, which numbers changed. Vague briefings are useless.
> - If there were corrections to earlier work, contradictions resolved, or course-corrections, those go in their own section — they're the most valuable thing to surface.
> - Never thank the user, never apologise, never explain what you are doing. Just deliver the rundown.

## Required repo secrets (I'll add these manually after you build it)
- `ANTHROPIC_API_KEY` — starts with `sk-ant-`, get from console.anthropic.com
- `SMTP_SERVER`, `SMTP_PORT`, `SMTP_USERNAME`, `SMTP_PASSWORD` — Gmail needs an [App Password](https://myaccount.google.com/apppasswords), not the account password
- Optional: `MAIL_TO` and `MAIL_FROM` (default to `SMTP_USERNAME` via `||` fallback if unset)

## Gotchas I hit last time — please avoid them

1. **YAML block scalar discipline.** Multi-line bash strings inside `run: |` MUST stay indented under the block. If a line drops to column 0, the YAML parser breaks out of the scalar and you get cascading errors all the way to the next step. Use heredocs (`cat > file.txt <<'EOF'`) for multi-line content, then `sed -i 's/^          //' file.txt` to strip the leading indentation. Or assemble with `{ echo ...; echo ...; } > file` instead.
2. **`convert_markdown: true` on dawidd6/action-send-mail is broken** — silently sends raw markdown. Always pre-convert with pandoc and use `html_body`.
3. **Editor cache files dominate the diff** if you don't filter them. Use `:(exclude)` pathspecs on every `git log` call.
4. **`gh` CLI may not be installed** in the local dev environment. If you need to open a PR, push the branch and give me a `compare/main...branch-name` URL instead of trying to call `gh pr create`.
5. **GitHub Actions remembers deleted workflows** as ghosts in the sidebar. If you ever rename or replace this workflow, tell me to manually disable the old one in the Actions UI.
6. **Scheduled workflows only fire from the default branch.** Building on a feature branch is fine for `workflow_dispatch` testing, but the schedule won't kick in until it's merged to main.

## After you build it, give me this checklist
1. Add the 5 secrets at Settings → Secrets and variables → Actions
2. Merge the workflow to the default branch
3. Manually trigger via Actions → Daily Vault Digest → Run workflow
4. Check inbox; if the prose looks right, you're done
````

## Origin

Built and refined during the 2026-04-10 session that set up the Sebenza Hub vault digest. Every gotcha listed above represents a mistake we actually hit and recovered from — the YAML indentation issue, the silent markdown-conversion failure, the cache-file noise, the missing `gh` CLI, the ghost workflow registration, and the scheduled-workflow-only-runs-from-default-branch trap.

The live implementation lives at [.github/workflows/daily-vault-digest.yml](../.github/workflows/daily-vault-digest.yml) — refer to that file as the canonical reference if the template ever drifts from what's actually working.
