---
name: information-organization-project-index
description: Use when the user asks to create, update, or review a project file index, source inventory, access map, folder map, or project document catalog.
---

# Information Organization Project Index Workflow

## Purpose

Create a project-local source inventory that distinguishes primary sources, supporting documents, generated files, and low-confidence files.

## Source Material Handling

Use file metadata first. When content-aware classification is needed, use the markitdown-mcp server to convert supported non-text files to Markdown for minimal inspection. Treat converted Markdown as a derived aid, cite original files, and note files whose role remains uncertain after conversion.

## Workflow

1. List target files and folders.
2. Identify file type, likely role, source confidence, and project relevance.
3. Distinguish primary sources from generated, temporary, or low-confidence files.
4. Avoid project-specific factual claims that are not supported by inspected content.
5. Store the index only in the active project workspace.
6. Do not modify source files or folder structure.

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

## Quality Checks

- Preserve exact paths and distinguish directories from files.
- Separate primary sources, secondary sources, generated outputs, and low-confidence materials.
- Do not claim file contents were confirmed unless inspected.
- Note inaccessible, empty, corrupted, or unsupported files.

## Common Operating Rules

Follow the active project AGENTS.md and the common rules under `operating_ja/`, especially workflow, source confidence, naming rules, output location, and quality checks.

## Portability

This skill must remain project-agnostic. Do not store project-specific facts or working notes inside this skill directory.
