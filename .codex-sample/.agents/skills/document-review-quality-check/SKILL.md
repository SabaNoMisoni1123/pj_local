---
name: document-review-quality-check
description: "Use when the primary deliverable is a broad final quality gate covering completeness, evidence, usability, and residual risks across an output. Do not use when the request specifically targets only consistency or logic structure. Japanese triggers: 最終品質チェック, 成果物品質確認, 残存リスク確認."
---

# Document Review Quality Check

## Purpose

Check business outputs before use and surface major defects, unverified items, and residual risks.

## Workflow

1. Check whether claims have evidence.
2. Check dates, numbers, terminology, owners, deadlines, references, and format.
3. Check for missing or unsupported TODOs, decisions, and unresolved issues.
4. Check that evidence does not come from `old/`, `_old/`, or similar excluded directories.
5. Check whether unknowns, assumptions, and low-confidence sources are marked.
6. For public or third-party-facing artifacts, check for private context leakage, unexplained internal assumptions, and TODO/open-question text mixed into the publishable body.
7. For external-facing email drafts, compare numbers, dates, units, sizes, amounts, deadlines, organization names, person names, commitments, and decision status against the confirmed source item by item.
8. Report checks that could not be performed and remaining risks.

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
- Treat incorrect, unsupported, or source-mismatched high-impact facts in external-facing email drafts as high-severity defects.
- Do not rewrite the whole artifact unless explicitly requested.
- Use markitdown-mcp only when non-text sources must be inspected; report unverifiable checks.
- Follow active `AGENTS.md` and `operating_ja/`; do not store project-specific facts in this skill.
