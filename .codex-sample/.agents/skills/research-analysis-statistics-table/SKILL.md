---
name: research-analysis-statistics-table
description: "Use when summarizing, comparing, validating, or creating tables from statistics, numeric datasets, Excel, CSV, public data tables, indicators, survey results, market data, time series, or quantitative evidence. Japanese triggers: 統計表, 数値データ, CSV集計."
---

# Research Analysis Statistics Table

## Purpose

Create reliable statistical summaries and comparison tables with definitions, units, periods, sources, and limitations.

## Workflow

1. Confirm analysis objective, indicators, geography, period, population, and output format.
2. Record source, publication date, access date, table name, URL or path, and usage notes.
3. Check indicator definition, unit, denominator, base year, aggregation method, sample size, and missing-value treatment.
4. Inspect data structure before calculating.
5. Preserve original values unless transformations are requested; document formula and assumptions when transforming.
6. Check unit mismatch, period mismatch, duplicates, suppressed values, estimated values, revisions, excluded directories, and low-confidence sources.
7. Separate numeric facts from interpretation and recommendations.

## Output

Use Japanese unless requested otherwise. Recommended sections:

- 目的
- 使用データ
- 指標定義
- 集計・比較結果
- 読み取り
- 注意点・制約
- 要確認事項
- 出所

Definition tables should use `指標名`, `定義`, `単位`, `対象範囲`, `時点・期間`, `出所`, `備考`. Summary tables should use `対象`, `指標`, `値`, `単位`, `年月・期間`, `出所`, `注記`.

## Quality Checks

- Do not mix units or periods without normalization or warning.
- Explain rounding, ranking, and percentage calculations.
- Mark missing, suppressed, estimated, provisional, or revised values.
- Do not use datasets under `old/`, `_old/`, or similar excluded directories for calculations or evidence.
- Prefer structured data tools for CSV, Excel, or databases; do not rely on Markdown conversion for calculations.
- Follow active `AGENTS.md` and `operating_ja/`; do not store project-specific facts in this skill.
