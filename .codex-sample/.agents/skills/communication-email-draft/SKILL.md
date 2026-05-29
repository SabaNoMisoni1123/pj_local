---
name: communication-email-draft
description: Use when the user asks to draft, revise, polish, or prepare email messages, request letters, stakeholder updates, inquiry responses, or business communication text.
---

# Communication Email Draft Workflow

## Purpose

Draft clear business communication that separates confirmed facts from open questions.

## Source Material Handling

When email drafts depend on project materials, attachments, or prior correspondence in non-text formats, use the markitdown-mcp server to convert supported files to Markdown when direct reading is impractical. Treat converted Markdown as a derived aid and do not imply confirmed facts, attachments, approvals, dates, or commitments unless supported by original sources.

## Workflow

1. Confirm recipient, purpose, tone, and required action.
2. Use project-specific facts only when supported by evidence.
3. Use placeholders for unknown names, dates, amounts, deadlines, or owners.
4. Avoid overclaiming; separate confirmed items from items under confirmation.
5. Produce concise subject and body options when useful.

## Output

Use Japanese unless the user requests another language.

Recommended sections:

- 件名案
- 本文案
- 送付前の確認事項
- 代替表現または短縮版, when useful

## Quality Checks

- Match the recipient relationship, requested tone, and business purpose.
- Keep requests, deadlines, and expected actions unambiguous.
- Do not invent names, dates, commitments, approvals, or attachments.
- Mark placeholders clearly for unknown facts.
- Avoid language that overcommits the user or implies unconfirmed agreement.

## Common Operating Rules

Follow the active project AGENTS.md and the common rules under `operating_ja/`, especially workflow, source confidence, naming rules, output location, and quality checks.

## Portability

This skill must remain project-agnostic. Do not store project-specific facts or working notes inside this skill directory.
