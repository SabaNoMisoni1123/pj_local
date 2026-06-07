---
name: engineering-support-script
description: "Use only for a small one-off script or automation helper when no language-specific or task-specific skill matches. Do not use for Python CLI, structured-data processing, API integration, web scraping, visualization, dependency management, packaging, dedicated testing, or code review. Japanese triggers: 汎用スクリプト作成, 小規模自動化."
---

# Engineering Support Script

## Purpose

Support business work with a small, understandable, reproducible, and non-destructive script when no specialized skill applies.

## Workflow

1. Confirm objective, inputs, outputs, environment, and constraints.
2. Inspect project rules and relevant existing scripts before editing or creating code.
3. Prefer simple local scripts over new frameworks unless the project already uses them.
4. Do not overwrite source data or existing scripts without explicit approval.
5. Write derived data to clearly named new files.
6. Handle encodings, paths, missing values, and errors explicitly.
7. Run minimal verification when feasible and report what was or was not tested.

## Output

Use Japanese for explanations unless requested otherwise. Recommended sections:

- 目的
- 入力
- 出力
- 実行手順
- 実装内容
- 検証結果
- 制約・注意点

## Quality Checks

- Keep changes scoped to the user's stated task.
- Prefer non-destructive reads and new output files over in-place mutation.
- Do not embed credentials, personal data, or secrets.
- Prefer structured parsers/APIs for structured data; do not rely on Markdown conversion for calculations.
- Follow active `AGENTS.md` and `operating_ja/`; do not store outputs or work notes in this skill.
