---
name: python-cli-tool
description: "Use when the primary requested deliverable is a Python command-line interface or a change to its command contract, arguments, help, exit codes, or streams. Do not add separate Python testing or dependency skills unless separately requested. Japanese triggers: Python CLI, コマンドラインツール, CLI実装."
---

# Python CLI Tool

## Purpose

Build a predictable CLI. Use `engineering-support-script` instead for a small one-off script without a stable command contract.

## Workflow

1. Inspect existing command patterns and dependencies.
2. Define commands, options, defaults, required arguments, paths, encodings, and examples.
3. Define `--help`, exit codes, stdout for results, and stderr for diagnostics.
4. Add `--dry-run` or confirmation for operations with meaningful side effects.
5. Implement validation and actionable error messages without exposing secrets.
6. Test success, invalid input, missing files, path edge cases, and interruption where relevant.
7. Document invocation and expected outputs.

## Quality Checks

- Help text matches behavior.
- Exit codes and output streams are usable by automation.
- Source data is not overwritten by default.
- Paths work under the target operating systems.

## Common Operating Rules

Follow `operating_ja/python_development.md`. Use `templates/cli_usage_template.md` when useful.

## Portability

Keep examples generic and free of local absolute paths.
