---
name: document-review-consistency
description: "Use when the primary review question is factual consistency across text, tables, dates, numbers, terms, and references. Do not use for overall release quality or argument structure as the main concern. Japanese triggers: 文書整合性確認, 数値矛盾チェック, 用語不一致."
---

# Document Review Consistency

## Purpose

Review existing documents for consistency, evidence quality, and business readability.

## Review Targets

Dates, fiscal years, periods, organization names, people, roles, numbers, units, totals, figure/table references, terminology, abbreviations, decisions, TODO correspondence, and contradictions across body text, tables, footnotes, filenames, appendices, and attachments.

## Workflow

1. Identify target documents, authoritative sources, previous versions, and reference files.
2. Review headings, body text, tables, figures, footnotes, filenames, appendices, and cross-references.
3. Compare repeated facts such as dates, numbers, names, terms, decisions, owners, and TODOs.
4. Classify findings as confirmed defects, possible inconsistencies, or source-confirmation items.
5. Provide location detail, evidence, and recommended fix for each finding.

## Output Format

```markdown
| No | 区分 | 指摘内容 | 根拠ファイル | 該当箇所 | 判断 | 推奨対応 | 追加確認事項 |
|---:|---|---|---|---|---|---|---|
```

## Quality Checks

- Prioritize contradictions affecting decisions, numbers, dates, owners, or external communication.
- Distinguish confirmed defects from possible inconsistencies.
- Include enough location detail for the user to reproduce the issue.
- Use markitdown-mcp only when non-text materials must be inspected; cite originals and note conversion limits.
- Follow active `AGENTS.md` and `operating_ja/`; do not store project-specific facts in this skill.
