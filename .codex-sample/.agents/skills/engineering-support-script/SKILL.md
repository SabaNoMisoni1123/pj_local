---
name: engineering-support-script
description: Use when the user asks to create, review, fix, or explain scripts, data transformations, automation helpers, API usage examples, tests, validation checks, or small tools for project work.
---

# Engineering Support Script Workflow

## Purpose

Support business work with small, understandable, and project-safe scripts or technical procedures.

## Source Material Handling

Use markitdown-mcp as an inspection aid for supported non-text input specifications, reports, or sample files when direct reading is impractical. For deterministic transformations, prefer structured parsers and APIs over Markdown converted text, and never treat markitdown output as a substitute for validating schemas, formulas, encodings, or binary file behavior.

## Workflow

1. Confirm the objective, input files, output files, environment, and constraints.
2. Inspect existing project rules and relevant existing scripts before editing or creating code.
3. Prefer simple, local, reproducible scripts over complex frameworks unless the project already uses them.
4. Do not overwrite source data or existing scripts unless the user explicitly requests it and project rules allow it.
5. Write outputs to clearly named new files when producing derived data.
6. Handle encodings, paths, missing values, and errors explicitly.
7. Run a minimal verification when feasible and report what was or was not tested.

## Output

Use Japanese for explanations. Code, command names, API fields, and error messages may remain in their natural language.

Recommended sections:

- 目的
- 入力
- 出力
- 実行手順
- 実装内容
- 検証結果
- 制約・注意点

## Quality Checks

- Keep scripts small, readable, and scoped to the user's stated task.
- Prefer non-destructive reads and new output files over in-place mutation.
- Handle Windows paths, encodings, missing files, blank values, and errors explicitly.
- Avoid embedding credentials, personal data, or project-specific secrets.
- Run a representative command or test when feasible and report limitations.

## Common Operating Rules

Follow the active project AGENTS.md and the common rules under `operating_ja/`, especially file editing permissions, naming rules, source confidence, and quality checks.

## Portability

This skill must remain project-agnostic. Do not store project-specific facts, code outputs, credentials, paths, or working notes inside this skill directory.
