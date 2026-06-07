---
name: document-production-minutes
description: "Use when the primary deliverable is a complete meeting record or minutes covering discussion, decisions, and actions. Do not use when the requested output is only a TODO, decision, risk, or follow-up ledger. Japanese triggers: 議事録作成, 会議記録, 文字起こしから議事録."
---

# Document Production Minutes

## Purpose

Convert meeting materials into discussion notes, decisions, TODOs, and open questions with traceable evidence.

## Workflow

1. Identify meeting date, participants, agenda, and source confidence.
2. Extract agenda-level points, decisions, TODOs, and unresolved questions.
3. Do not invent participants, dates, decisions, owners, or deadlines.
4. Mark unclear speakers, timestamps, passages, or attachments as `要確認`.
5. Preserve source file names and traceable locations.

## Output

Use Japanese unless requested otherwise. Recommended sections:

- 会議概要
- 議題別メモ
- 決定事項
- TODO
- 未決事項・要確認
- 次回までの確認事項

For TODOs, include owner, due date, evidence, and status when available.

## Quality Checks

- Separate decisions from discussion, proposals, and open questions.
- Preserve important dissent, conditions, and dependencies.
- Do not smooth over unclear transcript passages.
- Use markitdown-mcp only when non-text materials must be inspected; cite original files.
- Follow active `AGENTS.md` and `operating_ja/`; do not store project-specific facts in this skill.
