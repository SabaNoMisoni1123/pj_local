---
name: document-review-logic-structure
description: Use when the user asks to review a report, slide deck, proposal, memo, or draft for storyline, logical structure, issue alignment, argument flow, MECE quality, conclusion-evidence fit, recommendations, or consulting-style narrative strength.
---

# Document Review Logic Structure Workflow

## Purpose

Review whether a document's conclusion, storyline, issues, evidence, and recommendations form a coherent argument.

## Source Material Handling

When the document or supporting material is a PDF, PowerPoint, Word file, spreadsheet, or other non-text artifact, use the markitdown-mcp server to convert supported files to Markdown for structure and claim inspection. Treat converted Markdown as a derived aid and flag any logic or storyline findings that may depend on visual layout, slide order, speaker notes, tables, or figures.

## Workflow

1. Confirm the document purpose, audience, expected decision, and review depth.
2. Identify the stated or implied main conclusion and each major supporting claim.
3. Map the document structure: chapters, sections, slide sequence, issue flow, and recommendation flow.
4. Check whether each conclusion is supported by sufficient evidence or clearly marked assumptions.
5. Identify logical gaps, unsupported jumps, circular reasoning, duplicated points, misplaced details, and missing counterpoints.
6. Check whether the structure is mutually exclusive and collectively useful for the decision context.
7. Distinguish critical flaws from optional improvements.
8. Recommend concrete revisions to headings, order, messages, evidence placement, and missing pages or sections.

## Output

Use Japanese unless the user requests another language.

Recommended sections:

- レビュー対象・前提
- 総評
- 重大な論理上の懸念
- 構成上の改善点
- 結論と根拠の対応
- 不足している論点・反証
- 修正提案
- 残存リスク

For issue lists, include:

- 箇所
- 指摘種別
- 重要度
- 問題
- 影響
- 修正案
- 根拠または確認方法

## Quality Criteria

- Prioritize findings by severity and decision impact.
- Do not rewrite the whole document unless explicitly asked.
- Do not treat stylistic preference as a logical defect.
- Separate evidence-backed critique from reviewer inference.
- Preserve the user's intended audience and constraints when proposing revisions.

## Common Operating Rules

Follow the active project AGENTS.md and the common rules under `operating_ja/`, especially workflow, source confidence, naming rules, output location, and quality checks.

## Portability

This skill must remain project-agnostic. Do not store project-specific facts or working notes inside this skill directory.
