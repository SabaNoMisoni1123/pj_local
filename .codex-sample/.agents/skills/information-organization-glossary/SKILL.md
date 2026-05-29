---
name: information-organization-glossary
description: Use when the user asks to create, update, review, or organize a glossary, acronym list, terminology table, proper noun list, known people and organizations memo, stakeholder name list, or project-specific vocabulary reference from project materials.
---

# Information Organization Glossary Workflow

## Purpose

Create a reusable terminology reference that helps future work use consistent names, definitions, acronyms, and stakeholder labels.

## Source Material Handling

When terminology must be extracted from PDFs, Office files, email exports, or other supported non-text materials, use the markitdown-mcp server to convert them to Markdown when direct reading is impractical. Treat converted Markdown as a derived aid, cite original files, and flag definitions that may depend on tables, figures, comments, or layout.

## Workflow

1. Confirm the intended use, target readers, source materials, and whether people or organization names should be included.
2. Extract terms, acronyms, official names, alternative names, people, organizations, systems, policies, programs, and project-specific phrases.
3. For each entry, record the preferred term, reading or English form when useful, definition, source, related terms, and notes.
4. Distinguish official definitions from inferred meanings and project shorthand.
5. Mark unresolved spelling, translation, abbreviation, affiliation, role, or naming conflicts as `要確認`.
6. Do not expose sensitive personal information beyond what is necessary for the active project output.
7. Recommend naming rules or wording choices when inconsistent terms appear.

## Output

Use Japanese unless the user requests another language.

Recommended sections:

- 作成目的
- 用語集
- 略語一覧
- 固有名詞・組織名
- 表記ゆれ・統一案
- 要確認事項
- 根拠・参照元

For glossary tables, use columns such as:

- 用語
- 読み・英語表記
- 種別
- 定義・説明
- 推奨表記
- 関連語
- 根拠・出所
- 要確認

## Quality Criteria

- Do not invent definitions that are not supported by the available materials.
- Preserve official names when confirmed by source materials.
- Separate confirmed facts, likely interpretations, and user/Codex convenience labels.
- Flag low-confidence sources if generated, draft, converted, or temporary files are used.
- Keep project-specific facts outside the portable skill directory.

## Common Operating Rules

Follow the active project AGENTS.md and the common rules under `operating_ja/`, especially workflow, source confidence, naming rules, output location, project-local storage, and quality checks.

## Portability

This skill must remain project-agnostic. Do not store project-specific facts or working notes inside this skill directory.
