---
name: python-project-intake
description: "Use only when the requested deliverable is a Python tool specification, requirements definition, or implementation-ready intake before coding. Do not use automatically before an implementation request. Japanese triggers: Pythonツール要件整理, Python開発要件, Python仕様整理."
---

# Python Project Intake

## Purpose

Turn an initial Python tool request into implementable requirements without selecting tools prematurely.

## Workflow

1. Identify the objective, users, current workflow, and success criteria.
2. Define inputs, outputs, volume, formats, encodings, and data sensitivity.
3. Confirm the execution environment, supported Python version, operating systems, network constraints, and existing project toolchain.
4. Record operational constraints: frequency, performance, failure recovery, logging, distribution, and maintenance owner.
5. Separate confirmed requirements, assumptions, open questions, and out-of-scope items.
6. Define observable completion conditions and the minimum verification plan.

## Output

Produce a concise specification using `templates/tool_spec_template.md` when suitable.

## Quality Checks

- Cover objective, users, inputs, outputs, environment, constraints, and completion conditions.
- Do not force a framework or dependency manager before inspecting the project.
- Route implementation to a more specific Python skill after intake.

## Common Operating Rules

Follow the active `AGENTS.md` and `operating_ja/python_development.md`.

## Portability

Do not store completed project requirements inside this skill directory.
