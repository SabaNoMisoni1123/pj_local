---
name: information-organization-project-context
description: "Use when the primary deliverable is a durable project-context or project-profile document for future agent work. Do not use for a temporary status report, workplan, file index, or issue ledger. Japanese triggers: project context作成, プロジェクト文脈整理, 案件概要台帳."
---

# Information Organization Project Context

## Purpose

Create or update durable project context in project-local storage so future work starts from reliable facts.

## Workflow

1. Read active project rules before creating or updating context.
2. Extract purpose, scope, deliverables, deadlines, stakeholders, meetings, key issues, TODOs, and risks.
3. Use only active project sources for project-specific facts; exclude `old/`, `_old/`, and similar obsolete-information directories.
4. Mark unsupported or unclear information as `不明` or `要確認`.
5. Store context in active project workspace, never in the common `.codex` area.
6. When updating existing context, propose changes instead of overwriting unless explicitly approved.

## Output

Use Japanese unless requested otherwise. Recommended sections:

- プロジェクト概要
- 目的・背景
- スコープ
- 成果物
- 主要関係者
- 重要日程
- 現在の論点
- TODO・リスク
- 参照資料
- 不明点・要確認

## Quality Checks

- Separate durable context from temporary work notes.
- Do not turn stale or unsupported information into confirmed context.
- Do not use paths, filenames, metadata, or contents under `old/`, `_old/`, or similar excluded directories as project context.
- Use markitdown-mcp only when non-text source materials must be inspected; cite originals.
- Follow active `AGENTS.md` and `operating_ja/`; do not store project-specific facts in this skill.
