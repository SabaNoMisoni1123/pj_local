---
name: information-organization-file-name-index
description: "Use only when the primary deliverable is an index inferred from file and folder names or metadata without reading file contents. Use project-index when content inspection and document roles are required. Japanese triggers: ファイル名だけで索引, フォルダ名マップ, ファイル名探索メモ."
---

# Information Organization File Name Index

## Purpose

Reduce future search effort by organizing file names, folder names, extensions, and metadata. This is not a full content review.

## Source Priority

1. Paths, folders, file names, extensions, sizes, and timestamps
2. Active project rules such as `AGENTS.md`
3. Minimal content inspection only when the user requests it or project rules require it

Exclude obsolete-information directories such as `old/` and `_old/` before applying this priority. Their child file names, metadata, and contents are not source material for the index.

## Workflow

1. Confirm the target folder.
2. List files and folders without changing structure, excluding `old/`, `_old/`, and similar obsolete-information directories.
3. Record excluded directories only by directory path and exclusion reason.
4. Infer likely roles from names, extensions, date prefixes, suffixes, and locations.
5. Mark content inferred from names only as `推定` or `要確認`.
6. Flag low-confidence files such as `_gpt`, `_tmp`, converted exports, and generated files.
7. Store the index in active project workspace, such as `project-local`.
8. Never move, delete, rename, overwrite, or edit source files.

## Output

Use Japanese. Recommended sections:

- 目的
- フォルダ概要
- ファイル索引
- 探索メモ
- 参照禁止ディレクトリ
- 低信頼ファイル
- 要確認

```markdown
| No | ファイル | フォルダ | 種別 | 推定内容 | 信頼度 | 探すときのキーワード | 備考 |
|---:|---|---|---|---|---|---|---|
```

## Quality Checks

- Preserve original filenames exactly.
- Do not normalize away date, version, sender, or source clues.
- Do not inspect or infer from child paths under `old/`, `_old/`, or similar excluded directories.
- Do not use markitdown-mcp for routine filename indexing; if content was inspected, label it as converted or inspected evidence.
- Follow active `AGENTS.md` and `operating_ja/`; do not store project-specific indexes in this skill.
