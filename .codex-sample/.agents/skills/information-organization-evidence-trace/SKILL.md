---
name: information-organization-evidence-trace
description: Use when the user asks to organize evidence, distinguish facts from assumptions, cite source locations, create source maps, classify unknowns, or verify whether claims are supported by project materials.
---

# Information Organization Evidence Trace Workflow

## Purpose

Make outputs auditable by separating evidence-backed facts from assumptions, unknowns, and items requiring confirmation.

## Classification

For Japanese business outputs, use:

- `事実`: Confirmed by active project sources or cited public information
- `推測`: Reasonable inference from evidence, but not explicitly stated
- `不明`: Not confirmed by available evidence
- `要確認`: Requires stakeholder confirmation or additional materials

## Evidence Requirements

Include source file name, traceable location, extracted claim, classification, and notes about low-confidence sources if used.

If a location cannot be identified, write `該当箇所不明`.

## Source Material Handling

When evidence is stored in non-text files, use the markitdown-mcp server to convert supported files to Markdown before extracting claims when direct reading is impractical. Treat converted Markdown as a derived aid, cite original files, and mark any claim whose location or context is weakened by conversion.

## Output

Use Japanese unless the user requests another language.

Recommended sections:

- 対象主張
- 根拠一覧
- 根拠の強さ
- 不足根拠
- 矛盾・注意点
- 要確認事項

## Quality Checks

- Link each claim to a concrete source file, location, date, or URL when available.
- Distinguish primary evidence from summaries, drafts, generated files, and low-confidence conversions.
- Mark unsupported claims instead of smoothing them into the narrative.
- Capture contradictions between sources and identify which source should be prioritized.

## Common Operating Rules

Follow the active project AGENTS.md and the common rules under `operating_ja/`, especially workflow, source confidence, naming rules, output location, and quality checks.

## Portability

This skill must remain project-agnostic. Do not store project-specific facts or working notes inside this skill directory.
