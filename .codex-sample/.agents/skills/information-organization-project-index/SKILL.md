---
name: information-organization-project-index
description: "Use when creating, updating, or reviewing a project file index, file inventory, source inventory, document register, access map, folder map, or material catalog. For filename-only indexes use information-organization-file-name-index. Japanese triggers: 資料索引, ファイル一覧, source inventory."
---

# Information Organization Project Index

## Purpose

Create a project-local inventory that shows material roles and source confidence without changing source files or folder structure.

## Workflow

1. List target files and folders.
2. Record file type, date or version, likely role, owner or origin, source confidence, and relevance.
3. Separate primary sources, supporting documents, generated outputs, temporary files, duplicates, and low-confidence files.
4. Avoid substantive project claims not supported by filenames, metadata, or inspected content.
5. Store the index in active project workspace and preserve exact paths.
6. Do not move, rename, overwrite, or edit indexed files unless separately requested.

## Output

Use Japanese unless requested otherwise. Recommended sections:

- 対象範囲
- ファイル一覧
- 主要資料
- 補助資料
- 生成物・低信頼資料
- 不足・確認不能資料
- 更新時の注意

Basic columns: `file_path`, `file_type`, `likely_role`, `source_confidence`, `date_or_version`, `owner_or_origin`, `project_relevance`, `evidence_or_check_method`, `notes`

## Quality Checks

- Preserve exact paths and distinguish files from directories.
- Do not claim contents were confirmed unless inspected.
- Record inaccessible, empty, corrupted, or unsupported files.
- Use markitdown-mcp only for minimal content-aware classification when needed; label converted evidence.
- Follow active `AGENTS.md` and `operating_ja/`; do not store project-specific facts in this skill.
