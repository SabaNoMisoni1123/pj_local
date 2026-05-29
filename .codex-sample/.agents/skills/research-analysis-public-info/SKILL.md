---
name: research-analysis-public-info
description: Use when the user asks to research, compare, summarize, or organize public information, literature, market information, competitors, policies, statistics, laws, standards, current facts, or external sources for business analysis.
---

# Research Analysis Public Information Workflow

## Purpose

Create research outputs that separate sourced facts, interpretation, unknowns, and items requiring confirmation.

## Source Material Handling

When public source documents or saved project materials are PDFs, Office files, tables, or other supported non-text files, use the markitdown-mcp server to convert them to Markdown when direct reading is impractical. Treat converted Markdown as a derived aid, cite the original publication or file, and flag limitations caused by conversion loss.

## Workflow

1. Confirm the research objective, scope, target geography, time period, and output format.
2. Identify source priority and whether web research is allowed or required.
3. Browse or verify when the user asks for latest/current information or when facts may have changed.
4. Prefer primary sources, official publications, original statistics, laws, standards, and source documents over summaries.
5. Record source name, publication date or access date, URL or file path when available, and the specific claim supported.
6. Separate facts, interpretation, assumptions, unknowns, and items requiring confirmation.
7. Do not treat old, generated, draft, converted, or low-confidence sources as sole evidence.
8. Report limitations, source gaps, conflicting evidence, and recommended next checks.

## Output

Use Japanese unless the user requests another language.

Recommended sections:

- 調査目的
- 要約
- 調査結果
- 比較表または論点整理
- 根拠
- 不明点・要確認
- 調査上の制約

## Quality Checks

- Prefer primary, official, original, and current sources for factual claims.
- Record publication date, access date, source owner, URL or file path, and supported claim.
- Separate sourced facts, interpretation, assumptions, and unknowns.
- Flag source gaps, outdated sources, paywalled or inaccessible sources, and conflicting evidence.
- Avoid treating search snippets, generated summaries, or secondary commentary as primary evidence.

## Common Operating Rules

Follow the active project AGENTS.md and the common rules under `operating_ja/`, especially source confidence, evidence citation, naming rules, output location, and quality checks.

## Portability

This skill must remain project-agnostic. Do not store project-specific facts or working notes inside this skill directory.
