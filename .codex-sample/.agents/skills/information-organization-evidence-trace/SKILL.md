---
name: information-organization-evidence-trace
description: Use when organizing evidence, separating facts from assumptions, citing source locations, creating source maps, classifying unknowns, or checking claim support. Japanese triggers: 根拠整理, 事実確認, source map.
---

# Information Organization Evidence Trace

## Purpose

Make outputs auditable by separating evidence-backed facts, inferences, unknowns, and confirmation items.

## Classification

- `事実`: Confirmed by active project sources or cited public information
- `推測`: Reasonable inference from evidence, but not explicitly stated
- `不明`: Not confirmed by available evidence
- `要確認`: Requires stakeholder confirmation or additional materials

## Workflow

1. List claims, decisions, TODOs, or statements that require evidence.
2. Locate the strongest available source, prioritizing original project materials and primary public sources.
3. Classify each item as `事実`, `推測`, `不明`, or `要確認`.
4. Record source file, location, date, URL, and low-confidence notes when available.
5. Surface contradictions, missing evidence, and confirmation questions without resolving them silently.

## Output

Use Japanese unless requested otherwise. Recommended sections:

- 対象主張
- 根拠一覧
- 根拠の強さ
- 不足根拠
- 矛盾・注意点
- 要確認事項

Use `該当箇所不明` when source location cannot be identified.

## Quality Checks

- Link each claim to a concrete source file, location, date, or URL when available.
- Distinguish primary evidence from summaries, drafts, generated files, and conversions.
- Use markitdown-mcp only when non-text files must be inspected; cite originals and note conversion weakness.
- Follow active `AGENTS.md` and `operating_ja/`; do not store project-specific facts in this skill.
