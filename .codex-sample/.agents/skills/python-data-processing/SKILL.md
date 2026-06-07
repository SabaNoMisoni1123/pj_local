---
name: python-data-processing
description: "Use when the primary requested deliverable is Python code that reads, validates, transforms, aggregates, or writes CSV, Excel, JSON, or other structured data. Do not use for a human-readable statistical table without code. Japanese triggers: Pythonデータ処理, PythonでCSV加工, PythonでExcel集計, PythonでJSON変換."
---

# Python Data Processing

## Purpose

Implement reproducible, non-destructive structured-data transformations.

## Workflow

1. Inspect data definitions and representative inputs without modifying them.
2. Confirm schema, encoding, delimiters, types, dates, units, missing values, duplicates, and volume.
3. Use a structured parser appropriate to the format and the project's existing dependencies.
4. Make validation and transformation stages explicit.
5. Write to a new output by default and avoid partial output on failure.
6. Verify row counts, keys, totals, types, missing-value behavior, and representative records.
7. Record assumptions and rejected or unparseable data.

## Quality Checks

- Input files remain unchanged unless replacement was explicitly requested.
- Type conversion and date/unit handling are testable.
- Output validation covers both structure and business-relevant totals.
- Large inputs do not require avoidable full-memory loading.

## Common Operating Rules

Follow `operating_ja/python_development.md`.

## Portability

Do not bundle real project data or schemas containing sensitive values.
