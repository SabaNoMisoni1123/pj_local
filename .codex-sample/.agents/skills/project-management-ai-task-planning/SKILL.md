---
name: project-management-ai-task-planning
description: "Use when the primary deliverable is converting project TODOs, notes, issues, plans, minutes, README, AGENTS.md, or existing task logs into executable AI-agent task plans with Codex tasks, ChatGPT tasks, human-confirmation tasks, priorities, recommended skills, prompts, and execution logs. Do not use for a simple TODO ledger, a forward-looking workplan, or a standalone AI prompt. Japanese triggers: プロジェクトTODOのAIタスク化, Codex実行タスク整理, ChatGPTタスク切り分け, AIエージェント作業計画."
---

# Project Management AI Task Planning

## Purpose

Turn scattered project TODOs and work notes into executable tasks for Codex, ChatGPT, or human confirmation without mixing project-specific facts into this portable skill.

Use this skill as the entry point when the user wants project materials reviewed and converted into AI-executable work units. Do not use it when the requested deliverable is only a normal TODO ledger, a general workplan, or one reusable prompt.

## Inputs

Inspect only sources needed for task discovery, such as:

- TODOs, memos, issue lists, action logs, workplans, meeting minutes, README files, AGENTS.md, and existing task or execution logs.
- Project-local operating notes that are allowed by the active project rules.
- Existing `.agents/skills/*/SKILL.md` metadata when recommending a primary skill for each task.

Exclude or down-rank these sources:

- Do not inspect `old/`, `_old/`, archive, backup, cache, dependency, build, or generated-output directories unless the user explicitly asks.
- Do not use `_gpt`, `_tmp`, `_draft`, `_codex_`, `codex_`, generated prompts, or low-confidence AI outputs as the sole basis for a task.
- Do not read credentials, private caches, session logs, or irrelevant large binaries.

## Classification

Classify every candidate task into exactly one execution lane:

- `Codex`: Needs local project access, file edits, cross-file inspection, code or configuration changes, generated artifacts saved to disk, log updates, or repeatable command execution.
- `ChatGPT`: Can be completed from a provided prompt without direct project-folder access or file editing, such as consultation, summarization, policy comparison, wording drafts, or idea generation.
- `Human confirmation`: Needs authority, business judgment, missing source materials, stakeholder approval, confidential access, or a decision that an AI should not make.

Assign priority as `P1`, `P2`, or `P3`, and record a short reason tied to urgency, dependency, impact, or risk reduction.

## Skill Routing

Recommend one primary skill for each task by scanning `.agents/skills/*/SKILL.md` when available.

Choose the skill from the main deliverable, not from inputs, intermediate steps, or quality checks. If several skills seem relevant, pick the one that owns the final artifact. If no specific skill fits, state `該当なし` and explain briefly.

Boundary rules:

- Use `project-management-todo` when the main deliverable is a TODO or action-item ledger.
- Use `project-management-workplan` when the main deliverable is a forward-looking workplan.
- Use `ai-operations-prompt-drafting` when the main deliverable is one reusable AI prompt or task brief.
- Use this skill when the main deliverable is the conversion of project TODOs into a routed set of AI-executable tasks, prompts, and execution tracking artifacts.

## Workflow

1. Read the active project rules first, especially source restrictions and output locations.
2. Identify relevant task-bearing sources and explicitly exclude prohibited or low-confidence-only sources.
3. Extract candidate tasks with source references and remove duplicates.
4. Classify each task as `Codex`, `ChatGPT`, or `Human confirmation`.
5. Assign priority, completion conditions, expected artifact paths, and recommended primary skill.
6. Draft standalone prompts for tasks that can be delegated to another Codex or ChatGPT session.
7. Create an execution log template and a log-saving policy.
8. Save project-specific outputs only under the active project's approved project-local area.

## Output

When writing files, prefer a project-local directory such as:

```text
project-local/planned_task/
```

If the active project already uses another approved path, including a legacy path such as `project-local/planed_task/`, follow that path. Do not save project-specific task inventories, prompts, or logs under `.agents/` or `.codex/`.

Produce at least these artifacts when the user requests a full task-planning package:

- `task_inventory.md`: all candidate tasks with source, lane, priority, reason, recommended skill, and status.
- `codex_task_instructions.md`: Codex tasks with execution steps, allowed edits, expected outputs, completion conditions, and log path.
- `chatgpt_task_list.md`: ChatGPT-suitable tasks with concise standalone instructions.
- `task_execution_log.md`: execution history table with task ID, executor, status, output path, log path, and notes.
- `prompts/`: one standalone prompt per delegated task, named with a stable task ID.

Optional artifacts include a background execution script only when the user explicitly wants command orchestration and the project rules allow it.

## Prompt Contract

Each standalone prompt should include:

- Task ID and task name.
- Objective and expected final artifact.
- Required input files or source excerpts.
- Active rules, prohibited actions, and low-confidence source handling.
- Recommended primary skill, if any.
- Step-by-step execution instructions.
- Completion criteria and output format.
- Where to save results and logs, if the receiving agent has project access.

## Quality Checks

- Every task has a source reference or is marked as an assumption needing confirmation.
- Low-confidence generated materials are never the sole evidence for a task.
- Existing files are not overwritten unless explicitly allowed by the active project rules.
- Project-specific facts, names, source excerpts, TODOs, and output examples are kept out of this skill directory.
- The output separates AI-executable tasks from human decisions.
- Task IDs are stable, unique, and suitable for filenames.

## Common Operating Rules

Follow the active project AGENTS.md and the common rules under `operating_ja/`, especially workflow, source confidence, naming rules, output location, and quality checks.

## Portability

This skill must remain project-agnostic.
Do not store project-specific facts, working notes, generated task inventories, prompts, or execution logs inside this skill directory.
