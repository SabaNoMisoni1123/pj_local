---
name: information-organization-project-context
description: Use when the user asks to create, review, update, or propose a project context, project profile, project overview, current status, key issues, deliverables, stakeholders, or project memory from active project materials.
---

# Information Organization Project Context Workflow

## Purpose

Create or update a project-local context file that helps future work start from reliable project facts.

## Source Material Handling

When project facts are stored in non-text materials, use the markitdown-mcp server to convert supported files to Markdown before extracting durable context when direct reading is impractical. Treat converted Markdown as a derived aid, cite original files, and keep uncertain or conversion-sensitive facts marked as requiring confirmation.

## Workflow

1. Read active project rules before creating any project context.
2. Identify project purpose, scope, deliverables, deadlines, stakeholders, meetings, key issues, tasks, and risks.
3. Use only active project sources as evidence for project-specific facts.
4. Mark unconfirmed items as unknown or requiring confirmation.
5. Store project context only in the active project workspace, never in the common `.codex` area.
6. If updating an existing context, create an update proposal rather than overwriting unless explicitly approved.

## Output

Use Japanese unless the user requests another language.

Recommended sections:

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

- Use only active project materials for project-specific facts.
- Mark unsupported or stale information as `要確認`.
- Separate durable project context from temporary work notes.
- Do not store private project facts inside the common skill directory.
- Prefer update proposals over overwriting an existing context file.

## Common Operating Rules

Follow the active project AGENTS.md and the common rules under `operating_ja/`, especially workflow, source confidence, naming rules, output location, and quality checks.

## Portability

This skill must remain project-agnostic. Do not store project-specific facts or working notes inside this skill directory.
