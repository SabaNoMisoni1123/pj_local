---
name: document-review-logic-structure
description: "Use when the primary review question is argument, storyline, issue structure, conclusion-evidence fit, or recommendation logic. Do not use for factual consistency checks or general pre-release quality gates. Japanese triggers: 論理構成レビュー, ストーリー評価, 結論と根拠のレビュー."
---

# Document Review Logic Structure

## Purpose

Check whether conclusions, storyline, issues, evidence, and recommendations form a coherent argument.

## Workflow

1. Confirm document purpose, audience, expected decision, and review depth.
2. Extract the main conclusion and major supporting claims.
3. Map chapters, sections, slide order, issue flow, and recommendation flow.
4. Check whether each conclusion is supported by evidence or clearly marked as an assumption.
5. Identify logical gaps, unsupported jumps, circular reasoning, duplication, misplaced details, and missing counterpoints.
6. Check whether the issue structure is useful for the decision context.
7. Separate critical flaws from optional improvements; recommend concrete changes to order, headings, messages, and evidence placement.

## Output

Use Japanese unless requested otherwise. Recommended sections:

- レビュー対象・前提
- 総評
- 重大な論理上の懸念
- 構成上の改善点
- 結論と根拠の対応
- 不足している論点・反証
- 修正提案
- 残存リスク

Issue tables should use `箇所`, `指摘種別`, `重要度`, `問題`, `影響`, `修正案`, `根拠または確認方法`.

## Quality Checks

- Prioritize by severity and decision impact.
- Do not rewrite the whole document unless explicitly asked.
- Do not treat style preference as a logical defect.
- Use markitdown-mcp only when non-text materials must be inspected; flag layout-dependent limits.
- Follow active `AGENTS.md` and `operating_ja/`; do not store project-specific facts in this skill.
