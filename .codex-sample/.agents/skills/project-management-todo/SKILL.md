---
name: project-management-todo
description: Use when the user asks to extract, consolidate, review, update, or format project-management TODOs, action items, owners, deadlines, pending decisions, unresolved issues, or task ledgers from project materials.
---

# Project Management TODO Workflow

## Purpose

Extract project-management-ready TODOs without inventing owners, deadlines, statuses, or priorities.

## Source Material Handling

When action items are stored in PDFs, Office files, email exports, comments, or other supported non-text materials, use the markitdown-mcp server to convert them to Markdown when direct reading is impractical. Treat converted Markdown as a derived aid, cite original files, and mark owners, deadlines, priorities, and statuses as unknown when conversion makes them uncertain.

## Extraction Criteria

Extract TODOs from explicit requests, assigned actions, deadlines, pending decisions, unresolved questions, document correction requests, follow-up items, and review comments that require action.

Do not convert vague background information into TODOs unless the action is clear. Mark ambiguous items as `要確認` for Japanese outputs.

## Required Columns

```csv
id,status,priority,task,owner,due_date,source_file,source_location,evidence_type,notes
```

Use `不明` for unknown owner or due date. Do not infer people, dates, or priorities without evidence.

## Output

Use CSV when the user asks for a task ledger, otherwise use a Japanese table.

Required columns:

```csv
id,status,priority,task,owner,due_date,source_file,source_location,evidence_type,notes
```

## Quality Checks

- Extract only actionable items or explicit unresolved confirmations.
- Do not infer owners, deadlines, status, or priority without evidence.
- Preserve source traceability for every TODO.
- Merge duplicates only when they clearly refer to the same action.
- Mark ambiguous actions as `要確認` rather than silently deciding.

## Common Operating Rules

Follow the active project AGENTS.md and the common rules under `operating_ja/`, especially workflow, source confidence, naming rules, output location, and quality checks.

## Portability

This skill must remain project-agnostic. Do not store project-specific facts or working notes inside this skill directory.
