---
name: information-organization-file-name-index
description: Use when the user asks to create a Japanese file-name index, folder map, or AI-agent memo from project file names and folder names so future agents can find likely files without repeatedly searching the directory.
---

# Information Organization File Name Index Workflow

## Purpose

Create a Japanese memo for AI agents that reduces future file-search effort by organizing project file names, folder names, extensions, and metadata.

This skill is for a lightweight index based mainly on file and folder names. It is not a full content review.

## Source Material Handling

Do not use markitdown-mcp for routine file-name indexing because this skill is based on names and metadata. Use markitdown-mcp only when the user explicitly requests content inspection or project rules require minimal confirmation, and then record that the content note came from converted Markdown rather than filename evidence.

## Source Priority

1. File paths, folder names, file names, extensions, sizes, and timestamps
2. Existing project rules such as AGENTS.md
3. File contents only when the user explicitly requests content inspection or when project rules require minimal confirmation

## Workflow

1. Confirm the target project folder.
2. List files and folders without changing the directory structure.
3. Classify folders by likely role based on names and project rules.
4. Classify files by extension, naming pattern, date prefix, suffix, and folder location.
5. Write likely content as a hypothesis, not as a fact, unless the file content was actually inspected.
6. Mark low-confidence files such as `_gpt`, `_tmp`, converted exports, and generated files.
7. Create a Japanese index optimized for future AI-agent retrieval.
8. Store project-specific output only in the active project workspace, preferably `project-local/file-name-index.md` outside `.codex` when allowed by project rules.
9. Never modify, delete, rename, move, or overwrite source files.

## Output Requirements

Use Japanese for the index.

Recommended sections:

- 目的
- フォルダ概要
- ファイル索引
- 探索メモ
- 低信頼ファイル
- 要確認

Recommended table:

```markdown
| No | ファイル | フォルダ | 種別 | 推定内容 | 信頼度 | 探すときのキーワード | 備考 |
|---:|---|---|---|---|---|---|---|
```

Use `推定` or `要確認` for content inferred only from file names.

## Quality Checks

- Preserve original filenames exactly.
- Do not normalize names in a way that loses date, version, sender, or source clues.
- Flag unclear, duplicate, temporary, generated, or low-confidence filenames.
- Distinguish observed metadata from inferred role or suggested rename.

## Common Operating Rules

Follow the active project AGENTS.md and the common rules under `operating_ja/`, especially workflow, source confidence, naming rules, output location, and quality checks.

## Portability

This skill must remain project-agnostic.

Do not store project-specific facts, file indexes, file names, people, organizations, URLs, credentials, or working notes inside this skill directory.

Project-specific indexes belong in the active project workspace, not in the common `.codex` template.
