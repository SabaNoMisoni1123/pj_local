---
name: information-organization-project-index
description: Use when the user asks to create, update, or review a project file index, file inventory, source inventory, document register, access map, folder map, or project material catalog. Use this for project files whether the request says file index or project index; use information-organization-file-name-index only when indexing from filenames and folder names without opening files.
---

# Information Organization Project Index Workflow

## Purpose

Create a project-local file and source inventory that helps agents and humans find project materials without changing source files or folder structure.

## Source Material Handling

Use file metadata first. When content-aware classification is needed or a file's role cannot be determined from metadata, use the markitdown-mcp server to convert supported non-text files to Markdown for minimal inspection. Treat converted Markdown as a derived aid, cite original files, and note files whose role remains uncertain after conversion.

Do not use this skill for a filename-only memo. If the user asks for an AI-agent memo based only on file names, folder names, extensions, or timestamps, use `information-organization-file-name-index` instead.

## Workflow

1. List target files and folders.
2. Identify file type, date or version, likely role, owner or origin if evident, source confidence, and project relevance.
3. Distinguish primary sources, supporting documents, generated outputs, temporary files, duplicates, and low-confidence files.
4. Avoid project-specific factual claims that are not supported by filenames, metadata, or inspected content.
5. Store the index only in the active project workspace and preserve exact paths.
6. Do not move, rename, overwrite, or edit indexed files unless separately requested.

## Output

Use Japanese unless the user requests another language.

Recommended sections:

- 対象範囲
- ファイル一覧
- 主要資料
- 補助資料
- 生成物・低信頼資料
- 不足・確認不能資料
- 更新時の注意

Recommended columns for the file list:

- file_path
- file_type
- likely_role
- source_confidence
- date_or_version
- owner_or_origin
- project_relevance
- evidence_or_check_method
- notes

## Quality Checks

- Preserve exact paths and distinguish directories from files.
- Separate primary sources, secondary sources, generated outputs, and low-confidence materials.
- Do not claim file contents were confirmed unless inspected.
- Note inaccessible, empty, corrupted, or unsupported files.
- Do not infer substantive project facts from filenames alone.
- Do not move, rename, or edit indexed files unless separately requested.

## Common Operating Rules

Follow the active project AGENTS.md and the common rules under `operating_ja/`, especially workflow, source confidence, naming rules, output location, and quality checks.

## Portability

This skill must remain project-agnostic. Do not store project-specific facts or working notes inside this skill directory.
