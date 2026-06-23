---
name: project-management-todo
description: "Use when the primary deliverable is a TODO or action-item ledger with tasks, owners, deadlines, and status. Do not use for decisions, risks, a workplan, complete minutes, a combined meeting follow-up package, or converting project TODOs into Codex and ChatGPT execution tasks. Japanese triggers: TODO台帳, action item一覧, タスク抽出表."
---

# Project Management TODO

## Purpose

Extract project-management-ready TODOs without inventing owners, deadlines, status, or priority.

If the user wants scattered project TODOs converted into routed Codex tasks, ChatGPT tasks, standalone prompts, and execution logs, use `project-management-ai-task-planning` instead.

## Extraction Targets

Explicit requests, assigned actions, deadlines, pending decisions, unresolved questions, document correction requests, follow-up items, and review comments requiring action. Do not turn vague background information into TODOs.

## Workflow

1. Identify explicit actions, pending decisions, unresolved questions, and review comments requiring follow-up.
2. Normalize each item into required columns without inventing owner, due date, status, or priority.
3. Merge duplicates only when evidence clearly points to the same action.
4. Mark ambiguous actions, missing owners, and uncertain due dates as `要確認` or `不明`.
5. Recheck every row against its source and remove non-action background statements.

## Output

For action item or TODO整理 replies, use the standard Japanese table format in `templates/action_items_template.md`.

Required columns: `No`, `実行主体`, `実行内容`, `期日`, `重要度`, `確認状態/補足`.

Use CSV only when the user requests a CSV or a machine-readable task ledger. Preserve the same concepts as the standard table.

## Quality Checks

- Extract only actionable items or explicit unresolved confirmations.
- Preserve source traceability for every TODO.
- Use markitdown-mcp only when non-text materials must be inspected; flag uncertain owner, deadline, priority, or status.
- Follow active `AGENTS.md` and `operating_ja/`; do not store project-specific facts in this skill.
