---
name: visual-production-diagram
description: Use when creating, revising, structuring, or proposing business diagrams, visual explanations, slide visuals, screen concepts, charts, Mermaid diagrams, or image-generation briefs. Japanese triggers: 図解, Mermaid, 画像生成プロンプト.
---

# Visual Production Diagram

## Purpose

Visualize structures, relationships, processes, or key messages without adding unsupported facts.

## Workflow

1. Confirm visual objective, audience, medium, size, and output format.
2. Identify source-backed facts that the visual must represent.
3. Separate confirmed content, assumptions, placeholders, and confirmation items.
4. Choose a suitable type: process flow, issue tree, comparison table, timeline, system map, stakeholder map, or slide layout.
5. Keep labels concise and business-readable.
6. Do not use confidential details, logos, personal data, or client-specific facts unless supported and allowed.
7. For image-generation prompts, include style, composition, text handling, prohibited elements, and factual constraints.

## Output Options

Use Japanese unless requested otherwise. Possible outputs:

- 図解案
- Mermaid図
- スライド構成案
- 画像生成用プロンプト
- 視覚資料レビュー

## Quality Checks

- Keep one main message per visual.
- Ensure labels are readable and non-overlapping at the target size.
- Do not add unsupported entities, numbers, logos, or causal relationships.
- For image-generation prompts with exact labels, specify constraints to avoid distorted text.
- Use markitdown-mcp only when non-text source materials must be inspected; note layout, chart, image, or relationship conversion limits.
- Follow active `AGENTS.md` and `operating_ja/`; do not store project-specific facts or generated images in this skill.
