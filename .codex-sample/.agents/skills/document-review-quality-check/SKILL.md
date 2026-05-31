---
name: document-review-quality-check
description: "Use when running a general quality check on reports, outputs, TODO ledgers, minutes, email drafts, prompts, or generated documents for evidence, consistency, completeness, and residual risks. Japanese triggers: 品質チェック, 根拠確認, 残存リスク."
---

# Document Review Quality Check

## Purpose

Check business outputs before use and surface major defects, unverified items, and residual risks.

## Workflow

1. Check whether claims have evidence.
2. Check dates, numbers, terminology, owners, deadlines, references, and format.
3. Check for missing or unsupported TODOs, decisions, and unresolved issues.
4. Check whether unknowns, assumptions, and low-confidence sources are marked.
5. For public or third-party-facing artifacts, check for private context leakage, unexplained internal assumptions, and TODO/open-question text mixed into the publishable body.
6. Report checks that could not be performed and remaining risks.

## Output

Use Japanese unless requested otherwise. Recommended sections:

- 総評
- 重大な懸念
- 指摘一覧
- 修正提案
- 未確認事項
- 残存リスク

Issue tables should use `No`, `重要度`, `区分`, `指摘内容`, `根拠`, `影響`, `推奨対応`, `要確認`.

## Quality Checks

- Lead with the highest-severity findings.
- Separate evidence-backed findings from reviewer inference.
- Treat private context leakage or author-note/body mixing in public artifacts as high severity.
- Do not rewrite the whole artifact unless explicitly requested.
- Use markitdown-mcp only when non-text sources must be inspected; report unverifiable checks.
- Follow active `AGENTS.md` and `operating_ja/`; do not store project-specific facts in this skill.
