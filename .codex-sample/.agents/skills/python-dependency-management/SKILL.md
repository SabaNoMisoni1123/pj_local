---
name: python-dependency-management
description: "Use only when the primary requested deliverable is a Python dependency or environment decision, dependency update, lock update, migration, or removal. Do not activate merely because another Python implementation needs an existing dependency. Japanese triggers: Python依存管理, Pythonライブラリ追加判断, Python仮想環境, lock更新."
---

# Python Dependency Management

## Purpose

Make dependency changes that fit the existing project and remain reproducible.

## Workflow

1. Inspect the existing Python version, environment manager, metadata, lock files, and CI commands.
2. Confirm that the requirement cannot be met reasonably with the standard library or an existing dependency.
3. Check current official documentation, supported Python versions, compatibility, maintenance status, and license.
4. Select the narrowest compatible constraint according to the project's policy.
5. Update metadata and lock artifacts with the existing toolchain.
6. Run relevant import, test, lint, type, build, and vulnerability checks that the project supports.
7. Record the reason, alternatives, operational impact, and removal path.

## Output

Use `templates/dependency_decision_template.md` for decisions that need review.

## Quality Checks

- Do not introduce a second dependency manager without an explicit migration decision.
- Generated lock changes correspond to the intended metadata change.
- License and platform compatibility are known.

## Common Operating Rules

Follow `operating_ja/python_development.md`.

## Portability

Do not prescribe one dependency manager for every project.
