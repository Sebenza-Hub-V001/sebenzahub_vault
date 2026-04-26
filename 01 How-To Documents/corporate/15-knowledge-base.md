---
title: "Chapter 13 — Knowledge base"
type: concept
created: 2026-04-26
updated: 2026-04-26
tags: [how-to, corporate, knowledge-base, wiki, documentation]
status: active
user-types: [business]
---

# Chapter 13 — Knowledge base

Most corporate hiring teams have a quiet documentation problem: hiring managers ask the same five questions every quarter, the answer lives in a half-remembered email or a Confluence page nobody can find, and the recruiter retypes the answer one more time. The Knowledge Base inside Sebenza Hub is where you write those answers down once, link them together, and keep them in the same platform as the candidates the questions are about.

This chapter covers the three Knowledge Base pages — the Dashboard (where you list and create wikis), the Viewer (where you browse one wiki's pages), and the Page editor (where you write and edit individual pages).

### Knowledge Base — _Tier: Standard_

**Where it lives.** `/dashboard/business/wiki`, in the **Knowledge Base** sidebar group.

## What it's for

The Knowledge Base is a per-organisation set of wikis you can use for whatever internal documentation belongs near the hiring system rather than in a separate intranet:

- **Departments** — what each team does, how they hire, the seniority bands they use.
- **Policies** — the EE plan, the leave policy, the disciplinary process, the WFH stance.
- **Workforce plans** — the long-form context around the numbers in Workforce Planning (Chapter 9).
- **Vendors** — who each agency is, what they're good at, who their primary contact is, what to watch out for.
- **Onboarding processes** — the role-by-role version of the onboarding checklists in Chapter 4.
- **Compliance frameworks** — the long-form context around POPIA, B-BBEE, and EE that doesn't fit on the dedicated compliance pages.

The system supports a set of page types out of the box: summary, entity, concept, comparison, synthesis, department, policy, process, vendor, and custom. Pick the closest one when you create a page; the type drives a colour-coded tag in the viewer and helps the AI features behave appropriately.

Pages support markdown, headings, bold, italic, inline code, lists, and **wiki-links** in `[[Page Title]]` format. A link to a page that doesn't exist yet creates a placeholder — the same pattern most internal wikis use.

## Create a wiki

1. Open the Knowledge Base page from the sidebar.
2. Click **Create Wiki**, give it a name (e.g. "Vendor Intel", "Company Policies", "Workforce Plan FY25"), and an optional description.
3. The wiki is created with sensible defaults for a Business operations wiki and you're taken straight into it.

You can have multiple wikis per organisation. Splitting by topic (one for vendors, one for policies, one for the workforce plan) keeps each wiki small enough to actually browse. Lumping everything into one wiki makes search worse over time.

## Add pages

From inside a wiki:

1. Click the **+** action to create a new page.
2. Give it a title. The slug is generated from the title automatically.
3. Pick a page type from the dropdown — `policy`, `vendor`, `department`, `process`, etc. Use `custom` if nothing fits.
4. Write the content in markdown. Use `[[Other Page Title]]` to link to other pages in the same wiki.
5. Save. The page is immediately visible to anyone in your organisation with access to the Knowledge Base.

Edit later by opening the page and clicking **Edit**. Changes are saved on confirm; there is no draft mode.

## Browse and link

The Viewer shows the wiki's pages with their type tags and the link graph between them — which page links to which. Use the link graph to find orphaned pages (no inbound links, probably forgotten) and central pages (lots of inbound links, worth keeping current).

Wiki-links resolve by slug match within the same wiki. A link to a page that doesn't exist is shown but inert until the target page is created — the wiki itself does not auto-create stub pages.

## How to organise it

A few patterns that work in practice for corporate operations:

- **One wiki per durable topic.** Vendors, policies, workforce plan, onboarding by role family. Resist the temptation to make a single "Company Wiki" that contains everything — it becomes unfindable within a quarter.
- **Use page types deliberately.** A consistent page type per topic (every vendor entry as a `vendor` page, every policy as a `policy` page) makes the colour-coded view useful at a glance.
- **Link aggressively.** A vendor page that mentions a department should link to that department's page. The wiki becomes more useful as the link graph thickens.
- **Set a quarterly review cadence.** Pages that haven't been touched in six months are probably stale. Pages that disagree with each other are worse than no pages. Schedule a 30-minute quarterly walkthrough with the operations owner.

## Honest scope

The Knowledge Base is **internal**. There is no public-facing publishing surface — these are pages your team can read, not pages your candidates will see. If you want a candidate-facing FAQ, that lives on your career page (covered in branding setup, Chapter 3) and is separate.

It also is not the place for documents that need to be filed, signed, or have a legal lifecycle of their own — contracts, signed offer letters, EE submissions. Those live where they belong (Offer Letters in Chapter 4, EE submissions in Chapter 11). The Knowledge Base is for the running prose around them.

## Checklist

- [ ] You've created at least one wiki for a durable topic — vendors, policies, or onboarding playbooks
- [ ] Pages use a sensible page type (`policy`, `vendor`, `department`, `process`, `custom`) rather than every page being `custom`
- [ ] Wiki-links are used between related pages so the graph is navigable
- [ ] A quarterly review is scheduled to retire stale pages and reconcile contradictions
- [ ] The team knows the Knowledge Base is internal — sensitive content is fine, but candidate-facing content goes on the career page instead

## Features covered in this chapter

| # | Feature | Tier | Route |
|---|---------|------|-------|
| 1 | Knowledge Base Dashboard | Standard | `/dashboard/business/wiki` |
| 2 | Wiki Viewer | Standard | `/dashboard/business/wiki/:id` |
| 3 | Wiki Page editor | Standard | `/dashboard/business/wiki/:id/page/:slug` |

## References

- [[01 How-To Documents/corporate/03-setting-up-your-org|Chapter 3 — Setting up your organisation]]
- [[01 How-To Documents/corporate/04-your-first-requisition|Chapter 4 — Your first requisition]]
- [[01 How-To Documents/corporate/07-vendor-management|Chapter 7 — Vendor management]]
- [[01 How-To Documents/corporate/09-workforce-planning|Chapter 9 — Workforce planning]]
- [[01 How-To Documents/corporate/11-compliance-and-audit-trail|Chapter 11 — Compliance and audit trail]]
