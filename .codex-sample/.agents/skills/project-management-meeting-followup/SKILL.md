---
name: project-management-meeting-followup
description: "Use when the primary deliverable is a combined post-meeting follow-up package containing decisions, actions, open questions, and next steps. Use a dedicated TODO, decision, or risk skill when only that ledger is requested. Japanese triggers: 会議後フォロー一式, 会議後次アクション, post-meeting follow-up."
---

# Project Management Meeting Follow-up

## Purpose

Turn meeting materials into project-management-ready decisions, TODOs, open questions, and next confirmations.

## Workflow

1. Confirm meeting date, participants, agenda, and source confidence.
2. Extract decisions, action items, risks, unresolved questions, and owner/date information.
3. Do not infer missing owners, deadlines, or approval status.
4. Mark ambiguous items as `要確認`.
5. Cite source files and traceable locations.

## Output

Use Japanese unless requested otherwise. Recommended sections:

- 会議概要
- 決定事項
- TODO: use the action item table format in `templates/action_items_template.md`
- 未解決事項
- リスク・依存関係
- 次回確認事項
- 根拠

## Quality Checks

- Separate action items, decisions, discussion notes, and open questions.
- Make follow-up wording concrete enough for project management.
- Use markitdown-mcp only when non-text materials must be inspected; flag unclear speaker, timestamp, owner, or deadline evidence.
- Follow active `AGENTS.md` and `operating_ja/`; do not store project-specific facts in this skill.
