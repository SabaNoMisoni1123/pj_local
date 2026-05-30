---
name: document-review-consistency
description: Use when the user asks to review project documents, reports, meeting notes, specifications, slides, spreadsheets, or drafts for consistency, contradictions, missing evidence, terminology mismatch, dates, numbers, references, or quality issues.
---

# Document Review Consistency Workflow

## Purpose

Review existing documents for consistency, evidence quality, and business readability.

## Source Material Handling

When reviewing PDFs, Office files, email exports, or other non-text materials, use the markitdown-mcp server to obtain Markdown for inspection when direct reading is impractical. Treat converted Markdown as a derived aid, cite original files and locations, and flag issues that may depend on lost layout, formatting, tables, figures, or comments.

## Review Targets

Check dates, fiscal years, periods, organization names, people, roles, numbers, units, totals, figure/table references, terminology, abbreviations, decisions, TODO correspondence, and contradictions across body text, tables, footnotes, and attachments.

## Workflow

1. Identify the target document set and any authoritative sources, previous versions, or reference files.
2. Review headings, body text, tables, figures, footnotes, filenames, appendices, and cross-references.
3. Compare repeated facts such as dates, numbers, names, terms, decisions, owners, and TODOs across the materials.
4. Classify findings as confirmed defects, possible inconsistencies, or items requiring source confirmation.
5. Provide a fix recommendation and enough source location detail for each issue to be reproduced.

## Output Format

```markdown
| No | 区分 | 指摘内容 | 根拠ファイル | 該当箇所 | 判断 | 推奨対応 | 追加確認事項 |
|---:|---|---|---|---|---|---|---|
```

## Quality Checks

- Check body text, tables, figures, footnotes, filenames, appendices, and cross-references, not only headings.
- Prioritize contradictions that affect decisions, numbers, dates, owners, or external communication.
- Distinguish confirmed defects from possible inconsistencies that need source confirmation.
- Include enough location detail for the user to find and fix each issue.

## Common Operating Rules

Follow the active project AGENTS.md and the common rules under `operating_ja/`, especially workflow, source confidence, naming rules, output location, and quality checks.

## Portability

This skill must remain project-agnostic. Do not store project-specific facts or working notes inside this skill directory.
