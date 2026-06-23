---
name: project-management-workplan
description: "Use when the primary deliverable is a forward-looking workplan that sequences tasks, milestones, dependencies, and responsibilities. Do not use for extracting existing TODOs, recording current risks, or converting project TODOs into Codex and ChatGPT execution tasks. Japanese triggers: 作業計画作成, 進め方設計, タスク分解計画."
---

# Project Management Workplan

## Purpose

Turn goals, constraints, evidence, and unknowns into a practical workplan.

If the user wants existing project TODOs, notes, and logs converted into AI-executable tasks with prompts and execution tracking, use `project-management-ai-task-planning` instead.

## Workflow

1. Confirm objective, scope, constraints, deadline, and available inputs.
2. Identify inputs, dependencies, stakeholders, milestones, and unknowns.
3. Design task sequence, deliverables, and decision points.
4. Separate confirmed facts, assumptions, and open questions.
5. Separate immediate next actions from later options.

## Output

Use Japanese unless requested otherwise. Recommended sections:

- 目的
- 前提・制約
- 作業方針
- タスク分解
- マイルストーン
- 役割分担
- 依存関係
- リスク・論点
- 直近アクション

## Quality Checks

- Tie each task to a deliverable, decision, or risk reduction purpose.
- Make dependencies, owners, due dates, and unresolved assumptions explicit.
- Avoid plans that exceed confirmed scope, schedule, or available inputs.
- Use markitdown-mcp only when non-text plans or constraints must be inspected; separate constraints from assumptions.
- Follow active `AGENTS.md` and `operating_ja/`; do not store project-specific facts in this skill.
