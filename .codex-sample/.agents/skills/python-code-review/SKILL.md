---
name: python-code-review
description: "Use only when the user asks for a review of Python code or a Python diff, with findings as the primary deliverable. Do not use for implementation, debugging, explanation, or document review. Japanese triggers: Pythonコードレビュー, Python差分レビュー, Pythonバグレビュー."
---

# Python Code Review

## Purpose

Find actionable defects and risks in Python code. This is not a general document review.

## Workflow

1. Identify the intended behavior, changed surface, callers, data flow, and execution environment.
2. Inspect the diff and surrounding code, not only isolated changed lines.
3. Prioritize correctness, regressions, data loss, security, error handling, concurrency, resource use, and compatibility.
4. Check whether tests exercise the changed behavior, failure paths, and boundaries.
5. Verify each finding against code and avoid speculative style commentary.
6. Present findings first, ordered by severity, with file and line references.
7. State open questions, tests not run, and residual risk; say clearly when no findings are present.

## Quality Checks

- Each finding explains impact and a concrete failure scenario.
- Suggestions are proportionate and consistent with existing project patterns.
- Missing tests are linked to a specific behavioral risk.

## Common Operating Rules

Follow `operating_ja/python_development.md`.

## Portability

Do not copy reviewed proprietary code into this skill directory.
