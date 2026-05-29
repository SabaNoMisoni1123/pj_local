---
name: ai-operations-skill-design
description: Use when the user asks to design, review, reorganize, or create Codex skills, business task definitions, skill catalogs, or reusable agent workflows.
---

# AI Operations Skill Design Workflow

## Purpose

Design reusable, project-agnostic skills and task catalogs that remain easy for humans to extend.

## Source Material Handling

When designing or updating skills based on existing manuals, catalogs, or examples in non-text formats, use the markitdown-mcp server to convert supported files to Markdown when direct reading is impractical. Keep reusable skill instructions independent from project-specific facts extracted from converted materials.

## Workflow

1. Identify whether the request is a new business domain, a new task, or an update to an existing task.
2. Keep human-facing domain documentation in Japanese when the user works in Japanese.
3. Keep executable SKILL.md instructions in English unless there is a strong reason not to.
4. Avoid project-specific facts in common skill definitions.
5. Prefer small, focused skills with clear trigger descriptions.
6. Make `.agents/skills/{business-domain}-{task-name}/SKILL.md` the only required artifact for a normal new task.
7. Update task catalogs, domain pages, README files, and templates only when the new skill changes human-facing taxonomy, output formats, or reusable documentation.
8. Do not require catalog or README updates just to make a skill discoverable.

## Output

Produce either a skill design proposal, a revised `SKILL.md`, or a skill catalog update depending on the request.

Recommended sections:

- 対象タスク
- 起動条件
- 入力
- ワークフロー
- 出力契約
- 品質確認
- 移植性・禁止事項
- 必要な `references/`, `scripts/`, `assets/`, `evals/`

## Quality Checks

- Confirm the frontmatter has only `name` and `description` unless the active platform requires more.
- Write `description` as a trigger condition, not just a label.
- Keep project-specific facts out of portable skills.
- Move long criteria or examples into references instead of bloating `SKILL.md`.
- Ensure the folder name matches the `name` value.

## Common Operating Rules

Follow the active project AGENTS.md and the common rules under `operating_ja/`, especially workflow, source confidence, naming rules, output location, and quality checks.

## Portability

This skill must remain project-agnostic. Do not store project-specific facts or working notes inside this skill directory.
