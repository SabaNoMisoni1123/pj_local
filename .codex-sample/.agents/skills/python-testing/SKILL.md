---
name: python-testing
description: "Use only when the primary requested deliverable is a Python test plan, test suite, test repair, or test-focused review. Do not activate merely because implementation work requires normal verification. Japanese triggers: Pythonテスト設計, Pythonテスト追加, pytest修正, Python回帰テスト."
---

# Python Testing

## Purpose

Design and implement tests around behavioral risk. For a tiny script change, testing may remain part of `engineering-support-script`.

## Workflow

1. Read the behavior contract, implementation, existing tests, and test configuration.
2. Rank risks and select representative normal, error, boundary, and regression cases.
3. Reuse the project's test framework and fixture conventions.
4. Keep tests deterministic; isolate network, time, randomness, filesystem, and environment dependencies where appropriate.
5. Assert observable behavior rather than unnecessary implementation details.
6. Run the narrow test first, then the broader relevant suite.
7. Report failures, skipped checks, coverage gaps, and reproduction commands.

## Output

Use `templates/test_plan_template.md` when a reviewable test plan is needed.

## Quality Checks

- Tests fail for the intended defect and pass after the fix when that can be demonstrated.
- Error and boundary behavior is covered in proportion to risk.
- Tests do not depend on live secrets or destructive external state.

## Common Operating Rules

Follow `operating_ja/python_development.md`.

## Portability

Do not store real credentials or sensitive production fixtures.
