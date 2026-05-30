---
name: information-organization-file-name-index
description: "Use when creating a Japanese file-name index, folder map, or AI-agent retrieval memo from file and folder names only. Do not use for full content review. Japanese triggers: ファイル名索引, フォルダマップ, 探索メモ."
---

# Information Organization File Name Index

## Purpose

Reduce future search effort by organizing file names, folder names, extensions, and metadata. This is not a full content review.

## Source Priority

1. Paths, folders, file names, extensions, sizes, and timestamps
2. Active project rules such as `AGENTS.md`
3. Minimal content inspection only when the user requests it or project rules require it

## Workflow

1. Confirm the target folder.
2. List files and folders without changing structure.
3. Infer likely roles from names, extensions, date prefixes, suffixes, and locations.
4. Mark content inferred from names only as `推定` or `要確認`.
5. Flag low-confidence files such as `_gpt`, `_tmp`, converted exports, and generated files.
6. Store the index in active project workspace, such as `project-local`.
7. Never move, delete, rename, overwrite, or edit source files.

## Output

Use Japanese. Recommended sections:

- 目的
- フォルダ概要
- ファイル索引
- 探索メモ
- 低信頼ファイル
- 要確認

```markdown
| No | ファイル | フォルダ | 種別 | 推定内容 | 信頼度 | 探すときのキーワード | 備考 |
|---:|---|---|---|---|---|---|---|
```

## Quality Checks

- Preserve original filenames exactly.
- Do not normalize away date, version, sender, or source clues.
- Do not use markitdown-mcp for routine filename indexing; if content was inspected, label it as converted or inspected evidence.
- Follow active `AGENTS.md` and `operating_ja/`; do not store project-specific indexes in this skill.
