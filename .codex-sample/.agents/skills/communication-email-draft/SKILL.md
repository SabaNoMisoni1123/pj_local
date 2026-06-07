---
name: communication-email-draft
description: "Use when drafting, revising, polishing, or preparing emails, request letters, stakeholder updates, inquiry replies, or business communication text. Japanese triggers: メール文案, 依頼文, 連絡文."
---

# Communication Email Draft

## Purpose

Draft clear business communication that separates confirmed facts from open questions.

## Workflow

1. Confirm recipient, purpose, tone, and required action.
2. For external-facing emails, extract high-impact facts before drafting: numbers, dates, units, sizes, amounts, deadlines, organization names, person names, commitments, and decision status.
3. Use project-specific facts only when supported by evidence.
4. When drafting external-facing text, preserve high-impact facts exactly unless the source explicitly supports a change or the user explicitly requests conversion or rewording.
5. Use placeholders for unknown names, dates, amounts, deadlines, owners, or high-impact facts.
6. Keep confirmed facts, requests, and confirmation items distinct.
7. After drafting external-facing text, reconcile every high-impact fact in the draft against the source or confirmed policy item by item.
8. Provide subject, body, shorter version, or alternative wording when useful.

## Output

Use Japanese unless the user requests another language. Recommended sections:

- 件名案
- 本文案
- 送付前の確認事項
- 代替表現または短縮版

When the user requests a send-mail data file or an application-convertible draft, use `templates/email_draft_datafile.yml` as the fixed output contract. Preserve the keys `subject`, `body`, `attachments`, `to`, `cc`, and `bcc` unless the user explicitly changes the application contract.

## Quality Checks

- Match the relationship, business purpose, requested action, and deadline.
- Do not imply unconfirmed agreement, approval, attachments, dates, or commitments.
- For external-facing emails, verify all high-impact facts against the source immediately before finalizing.
- Treat unsupported or mismatched numbers, dates, units, sizes, amounts, deadlines, names, organizations, commitments, and decision status as critical defects, not wording issues.
- If a confirmed policy contains a number or unit, preserve it exactly unless the user explicitly requests conversion or rewording.
- If the source text is garbled, ambiguous, or internally inconsistent, do not guess the value; mark it as `要確認` or ask for confirmation before putting it in the sendable body.
- Avoid language that overcommits the user.
- Use markitdown-mcp only when non-text materials must be inspected; prefer original sources.
- Follow active `AGENTS.md` and `operating_ja/`; do not store project-specific facts in this skill.
