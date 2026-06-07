---
name: project-management-decision-log
description: "Use when the primary deliverable is a decision ledger covering decisions, pending decisions, approvals, and rationale. Do not use for complete minutes, TODO ledgers, or general meeting follow-up. Japanese triggers: 意思決定ログ, 決定事項台帳, 承認状況一覧."
---

# Project Management Decision Log

## Purpose

Create an auditable decision log without inventing decisions or approvals.

## Workflow

1. Extract explicit decisions, pending decisions, approval requests, and decision rationale.
2. Record decision date, decision maker, affected scope, and evidence when available.
3. Mark missing decision maker, date, or approval status as unknown.
4. Separate confirmed decisions from proposals, discussion points, rejected options, and pending items.
5. Cite source files and traceable locations.

## Output

Use a table with `decision`, `status`, `owner`, `date`, `source`, `evidence_type`, and `notes`.

## Quality Checks

- Do not treat discussion, preference, proposal, or draft wording as a confirmed decision.
- Preserve rationale, conditions, and constraints that affect implementation.
- Use markitdown-mcp only when non-text materials must be inspected; flag unclear speaker, date, or approval evidence.
- Follow active `AGENTS.md` and `operating_ja/`; do not store project-specific facts in this skill.
