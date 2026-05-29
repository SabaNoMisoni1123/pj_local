---
name: document-production-report-draft
description: Use when the user asks to draft, structure, rewrite, or improve reports, summaries, explanatory documents, or business documents based on source materials.
---

# Document Production Report Draft Workflow

## Purpose

Create document drafts grounded in available evidence and clearly mark unknowns.

## Source Material Handling

When source materials are not already readable text or Markdown, use the markitdown-mcp server to convert supported files to Markdown before extracting claims. Treat the converted Markdown as a derived reading aid, cite the original source file, and note conversion limits for tables, figures, footnotes, or layout-sensitive content.

## Workflow

1. Confirm objective, audience, tone, and output format.
2. Identify source priority and required evidence.
3. Draft only evidence-supported project-specific content.
4. Use placeholders or `不明` for unconfirmed names, dates, amounts, owners, or deadlines.
5. Separate confirmed facts from assumptions and open questions.

## Output

Use Japanese unless the user requests another language.

Recommended sections:

- 目的・前提
- 要旨
- 本文構成
- 主要論点
- 根拠・出所
- 不明点・要確認
- 次に必要な作業

## Quality Checks

- Align the draft with the audience, decision context, and requested format.
- Support project-specific claims with cited or traceable evidence.
- Separate facts, interpretation, recommendations, assumptions, and unknowns.
- Keep headings parallel and specific enough to guide review.
- Avoid polishing unsupported content into apparently confirmed statements.

## Common Operating Rules

Follow the active project AGENTS.md and the common rules under `operating_ja/`, especially workflow, source confidence, naming rules, output location, and quality checks.

## Portability

This skill must remain project-agnostic. Do not store project-specific facts or working notes inside this skill directory.
