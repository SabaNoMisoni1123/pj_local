---
name: information-organization-project-index
description: "Use when the primary deliverable is a project document register or source inventory based on inspecting file contents and roles. Use file-name-index when names and metadata only are allowed. Japanese triggers: 資料台帳, 内容確認付きファイル索引, source inventory."
---

# Information Organization Project Index

## Purpose

Create a project-local inventory that shows material roles and source confidence without changing source files or folder structure.

## Workflow

1. List target files and folders, excluding `old/`, `_old/`, and similar obsolete-information directories.
2. Record file type, date or version, likely role, owner or origin, source confidence, and relevance.
3. Record excluded directories only by directory path and exclusion reason; do not inspect child paths, filenames, metadata, or contents.
4. Separate primary sources, supporting documents, generated outputs, temporary files, duplicates, and low-confidence files.
5. Avoid substantive project claims not supported by filenames, metadata, or inspected content.
6. Store the index in active project workspace and preserve exact paths.
7. Do not move, rename, overwrite, or edit indexed files unless separately requested.

## Output

Use Japanese unless requested otherwise. Recommended sections:

- 対象範囲
- ファイル一覧
- 主要資料
- 補助資料
- 参照禁止ディレクトリ
- 生成物・低信頼資料
- 不足・確認不能資料
- 更新時の注意

Basic columns: `file_path`, `file_type`, `likely_role`, `source_confidence`, `date_or_version`, `owner_or_origin`, `project_relevance`, `evidence_or_check_method`, `notes`

## Quality Checks

- Preserve exact paths and distinguish files from directories.
- Do not claim contents were confirmed unless inspected.
- Do not use paths, filenames, metadata, or contents under `old/`, `_old/`, or similar excluded directories for classification.
- Record inaccessible, empty, corrupted, or unsupported files.
- Use markitdown-mcp only for minimal content-aware classification when needed; label converted evidence.
- Follow active `AGENTS.md` and `operating_ja/`; do not store project-specific facts in this skill.
