---
name: document-review-quality-check
description: Use when the user asks to run a general quality check over outputs, reports, TODO ledgers, meeting minutes, email drafts, prompts, or generated documents for evidence, consistency, completeness, and residual risks.
---

# Document Review Quality Check Workflow

## Purpose

Apply common quality checks to business outputs before they are used.

## Source Material Handling

When checking outputs against non-text source materials, use the markitdown-mcp server to convert supported files to Markdown when needed. Treat converted Markdown as a derived aid, keep citations tied to the original source files, and report checks that could not be verified because conversion lost layout, comments, formulas, figures, or attachments.

## Workflow

1. Check whether claims have evidence.
2. Check dates, numbers, terminology, owners, deadlines, and references.
3. Check whether TODOs are missing or unsupported.
4. Check whether unknowns are marked clearly.
5. Check whether low-confidence files are used appropriately.
6. Report residual risks and tests that could not be performed.

## Output

Use Japanese unless the user requests another language.

Recommended sections:

- 総評
- 重大な懸念
- 指摘一覧
- 修正提案
- 未確認事項
- 残存リスク

For issue tables, use columns such as:

- No
- 重要度
- 区分
- 指摘内容
- 根拠
- 影響
- 推奨対応
- 要確認

## Quality Checks

- Lead with the highest-severity findings.
- Separate evidence-backed findings from reviewer inference.
- Check completeness, consistency, traceability, dates, numbers, terminology, owners, deadlines, and output format.
- Identify tests or checks that could not be performed.
- Avoid rewriting the whole artifact unless explicitly requested.

## Common Operating Rules

Follow the active project AGENTS.md and the common rules under `operating_ja/`, especially workflow, source confidence, naming rules, output location, and quality checks.

## Portability

This skill must remain project-agnostic. Do not store project-specific facts or working notes inside this skill directory.
