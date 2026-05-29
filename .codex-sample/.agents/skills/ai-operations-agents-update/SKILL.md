---
name: ai-operations-agents-update
description: Use when the user asks to create, review, or propose updates to AGENTS.md, project agent instructions, Codex operating rules, or repository-specific agent guidance.
---

# AI Operations AGENTS Update Workflow

## Purpose

Create safe update proposals for agent instruction files without overwriting existing rules.

## Source Material Handling

When related operating documents are stored in PDFs, Office files, or other supported non-text formats, use the markitdown-mcp server to convert them to Markdown when direct reading is impractical. Treat converted Markdown as a derived aid and do not overwrite live instruction files based only on conversion-sensitive content.

## Workflow

1. Read the existing AGENTS.md and related operating documents.
2. Identify the requested behavioral change and its scope.
3. Check for conflicts with existing rules.
4. Draft an update proposal as a new file.
5. Include rationale, impact, and exact markdown to add.
6. Do not overwrite AGENTS.md unless the user explicitly approves and the active project rules allow it.

## Output

Produce an update proposal, not a direct overwrite, unless the user explicitly approved editing the instruction file.

Recommended sections:

- 変更目的
- 対象ファイル
- 追加・変更する指示案
- 既存ルールとの整合性
- 影響範囲
- ユーザー確認事項

## Quality Checks

- Confirm the proposal does not weaken higher-priority instructions.
- Separate proposed text from rationale and commentary.
- Preserve project-specific rules that are unrelated to the request.
- Flag conflicts, ambiguity, and required human approval before editing live instruction files.

## Common Operating Rules

Follow the active project AGENTS.md and the common rules under `operating_ja/`, especially workflow, source confidence, naming rules, output location, and quality checks.

## Portability

This skill must remain project-agnostic. Do not store project-specific facts or working notes inside this skill directory.
