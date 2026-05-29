---
name: information-organization-file-index
description: Use when the user asks to create, update, or review a file index, source inventory, folder map, document register, or project material catalog.
---

# Information Organization File Index Workflow

## Purpose

Create a useful inventory of project files without changing source files or folder structure.

## Source Material Handling

Use file metadata first. When the user requests content-aware indexing or a file's role cannot be determined from metadata, use the markitdown-mcp server to convert supported non-text files to Markdown for minimal inspection. Treat converted Markdown as a derived aid and never overwrite, move, or rename source files.

## Workflow

1. List target files and folders.
2. Identify file type, date, likely role, and confidence.
3. Distinguish primary sources from generated, temporary, or low-confidence files.
4. Do not infer project-specific facts beyond what file names and content support.
5. Output a source inventory with evidence and notes.

## Output

Use Japanese unless the user requests another language.

Recommended columns:

- file_path
- file_type
- likely_role
- source_confidence
- date_or_version
- owner_or_origin
- project_relevance
- notes

## Quality Checks

- Do not infer substantive project facts from filenames alone.
- Flag generated, temporary, converted, duplicate, or low-confidence files.
- Preserve exact paths and filenames.
- Note files that could not be opened or interpreted.
- Do not move, rename, or edit indexed files unless separately requested.

## Common Operating Rules

Follow the active project AGENTS.md and the common rules under `operating_ja/`, especially workflow, source confidence, naming rules, output location, and quality checks.

## Portability

This skill must remain project-agnostic. Do not store project-specific facts or working notes inside this skill directory.
