---
name: ai-operations-skill-design
description: "Use when the primary deliverable is a SKILL.md, skill boundary design, skill reorganization, or skill-specific review. Do not use for general AGENTS.md rules, prompts, or tracked change requests. Japanese triggers: skill設計, SKILL.md作成, skill発火条件."
---

# AI Operations Skill Design

## Purpose

Design small, focused, project-agnostic skills that trigger clearly and use progressive disclosure.

## Workflow

1. Determine whether the request is for a new domain, new task, or update to an existing task.
2. Keep executable `SKILL.md` instructions in English unless there is a strong reason not to.
3. Put only core workflow and selection guidance in `SKILL.md`; move long examples, schemas, and criteria to referenced files.
4. Write `description` as a trigger condition, not a label, and quote it with double quotes.
5. For normal new tasks, make `.agents/skills/{domain}-{task}/SKILL.md` the only required artifact.
6. Update catalogs, README files, templates, or domain docs only when taxonomy or output contracts change.
7. Keep project-specific facts, work notes, and generated outputs out of common skills.

## Output

Use Japanese for human-facing proposals unless requested otherwise. Recommended sections:

- 対象タスク
- 起動条件
- 入力
- ワークフロー
- 出力契約
- 品質確認
- 移植性・禁止事項
- 必要な `references/`, `scripts/`, `assets/`, `evals/`

## Quality Checks

- Frontmatter should normally contain only `name` and `description`.
- `description` should be double-quoted. This is required when the value contains a colon, such as `Japanese triggers:`, and prevents YAML parse errors.
- Ensure folder name matches `name`.
- Prefer concise, directive instructions over long advisory prose.
- Use markitdown-mcp only when non-text manuals or examples must be inspected.
- Follow active `AGENTS.md` and `operating_ja/`.
