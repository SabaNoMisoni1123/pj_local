---
name: visual-production-diagram
description: Use when the user asks to create, revise, structure, or propose diagrams, visual explanations, slide visuals, screen concepts, charts, Mermaid diagrams, or image-generation briefs for business materials.
---

# Visual Production Diagram Workflow

## Purpose

Create business visuals that communicate structure, relationships, processes, or key messages without inventing unsupported facts.

## Source Material Handling

When visual content must be grounded in PDFs, decks, documents, spreadsheets, or other supported non-text materials, use the markitdown-mcp server to convert them to Markdown when direct reading is impractical. Treat converted Markdown as a derived aid and verify visually important details against original files when layout, charts, images, labels, or relationships matter.

## Workflow

1. Confirm the visual objective, audience, medium, size, and required output format.
2. Identify the source facts that the visual must represent.
3. Separate confirmed content from assumptions, placeholders, and items requiring confirmation.
4. Choose an appropriate visual type such as process flow, issue tree, comparison table, timeline, system map, stakeholder map, or slide layout.
5. Keep labels concise and business-readable.
6. Do not use confidential details, logos, personal data, or client-specific facts unless supported and allowed by project rules.
7. If producing an image-generation prompt, include style, composition, text handling, prohibited elements, and factual constraints.

## Output

Use Japanese unless the user requests another language.

Recommended outputs include:

- 図解案
- Mermaid図
- スライド構成案
- 画像生成用プロンプト
- 視覚資料レビュー

## Quality Checks

- Match the visual type to the purpose: process, hierarchy, comparison, timeline, stakeholder map, system map, or issue tree.
- Keep one main message per visual.
- Ensure labels are concise, non-overlapping, and readable at the target output size.
- Do not add unsupported entities, numbers, logos, or causal relationships.
- For image-generation prompts, specify factual constraints and prohibit distorted text when exact labels matter.

## Common Operating Rules

Follow the active project AGENTS.md and the common rules under `operating_ja/`, especially evidence, low-confidence sources, naming rules, output location, and quality checks.

## Portability

This skill must remain project-agnostic. Do not store project-specific facts, generated images, confidential visual assets, or working notes inside this skill directory.
