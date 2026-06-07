---
name: information-organization-glossary
description: "Use when the primary deliverable is a glossary, acronym table, controlled vocabulary, or confirmed proper-name list. Do not use for a general document terminology consistency review. Japanese triggers: 用語集作成, 略語表, 固有名詞一覧."
---

# Information Organization Glossary

## Purpose

Create a reusable terminology reference for consistent names, definitions, acronyms, and stakeholder labels.

## Workflow

1. Confirm intended use, readers, sources, and whether people or organization names are included.
2. Extract terms, acronyms, official names, aliases, people, organizations, systems, policies, programs, and project phrases.
3. Record preferred term, reading or English form, definition, evidence, related terms, and notes.
4. Distinguish official definitions, inferred meanings, and convenience labels.
5. Mark unresolved spelling, translation, abbreviation, affiliation, role, or naming conflicts as `要確認`.
6. Avoid exposing personal information beyond what is necessary for the active project output.

## Output

Use Japanese unless requested otherwise. Recommended sections:

- 作成目的
- 用語集
- 略語一覧
- 固有名詞・組織名
- 表記ゆれ・統一案
- 要確認事項
- 根拠・参照元

Glossary tables should use `用語`, `読み・英語表記`, `種別`, `定義・説明`, `推奨表記`, `関連語`, `根拠・出所`, `要確認`.

## Quality Checks

- Do not invent definitions without source support.
- Preserve official names when confirmed.
- Do not use paths, filenames, metadata, or contents under `old/`, `_old/`, or similar excluded directories as terminology evidence.
- Flag low-confidence, generated, draft, or converted sources.
- Use markitdown-mcp only when non-text materials must be inspected.
- Follow active `AGENTS.md` and `operating_ja/`; do not store project-specific facts in this skill.
