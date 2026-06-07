---
name: project-management-risk-issue
description: "Use when the primary deliverable is a risk and issue register with impact, response, owner, or escalation status. Do not use for a general TODO list or workplan. Japanese triggers: リスク課題台帳, 課題管理表, エスカレーション一覧."
---

# Project Management Risk and Issue

## Purpose

Organize risks and issues so stakeholders can decide what to monitor, mitigate, or escalate.

## Workflow

1. Extract explicit risks, issues, blockers, dependencies, and assumptions.
2. Separate current issues from future risks.
3. Record impact, likelihood, owner, due date, mitigation, and evidence when available.
4. Mark missing owner, due date, impact, or likelihood as unknown rather than guessing.
5. Cite source files and traceable locations.

## Output Columns

`id`, `type`, `description`, `impact`, `likelihood`, `owner`, `due_date`, `mitigation`, `escalation_needed`, `source`, `status`

## Quality Checks

- Prioritize items affecting scope, schedule, quality, cost, stakeholder agreement, or compliance.
- Do not invent probability, impact, owner, or due date.
- Make escalation triggers and monitoring actions concrete.
- Use markitdown-mcp only when non-text materials must be inspected; do not infer impact or likelihood from ambiguous conversions.
- Follow active `AGENTS.md` and `operating_ja/`; do not store project-specific facts in this skill.
