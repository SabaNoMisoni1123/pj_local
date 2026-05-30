---
name: project-management-todo
description: Use when extracting, consolidating, reviewing, updating, or formatting project TODOs, action items, owners, deadlines, pending decisions, unresolved issues, or task ledgers. Japanese triggers: TODO台帳, action item, タスク抽出.
---

# Project Management TODO

## Purpose

Extract project-management-ready TODOs without inventing owners, deadlines, status, or priority.

## Extraction Targets

Explicit requests, assigned actions, deadlines, pending decisions, unresolved questions, document correction requests, follow-up items, and review comments requiring action. Do not turn vague background information into TODOs.

## Workflow

1. Identify explicit actions, pending decisions, unresolved questions, and review comments requiring follow-up.
2. Normalize each item into required columns without inventing owner, due date, status, or priority.
3. Merge duplicates only when evidence clearly points to the same action.
4. Mark ambiguous actions, missing owners, and uncertain due dates as `要確認` or `不明`.
5. Recheck every row against its source and remove non-action background statements.

## Output

Use CSV for task ledgers; otherwise use a Japanese table. Required columns:

```csv
id,status,priority,task,owner,due_date,source_file,source_location,evidence_type,notes
```

## Quality Checks

- Extract only actionable items or explicit unresolved confirmations.
- Preserve source traceability for every TODO.
- Use markitdown-mcp only when non-text materials must be inspected; flag uncertain owner, deadline, priority, or status.
- Follow active `AGENTS.md` and `operating_ja/`; do not store project-specific facts in this skill.
