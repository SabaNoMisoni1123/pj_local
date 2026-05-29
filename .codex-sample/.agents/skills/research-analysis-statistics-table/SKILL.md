---
name: research-analysis-statistics-table
description: Use when the user asks to summarize, compare, validate, or create tables from statistics, numeric datasets, Excel files, CSV files, public data tables, indicators, survey results, market data, time series, or quantitative evidence for research or business analysis.
---

# Research Analysis Statistics Table Workflow

## Purpose

Create reliable statistical summaries and comparison tables that make definitions, units, time periods, sources, and limitations explicit.

## Source Material Handling

Use structured data tools for CSV, Excel, databases, and machine-readable datasets when calculation accuracy matters. Use the markitdown-mcp server to convert supported statistical reports, PDFs, or tables to Markdown for reading definitions, notes, and table structure when helpful. Treat converted Markdown as a derived aid and verify numeric calculations against structured data whenever possible.

## Workflow

1. Confirm the analysis objective, target indicators, geography, period, population, and required output format.
2. Identify the source, publication date, access date, table name, file path or URL, and any usage notes.
3. Record indicator definitions, units, denominator, base year, aggregation method, sample size, and missing-value treatment when available.
4. Inspect the data structure before calculating or summarizing.
5. Preserve original values unless the user asks for transformations; when transforming, document the formula and assumptions.
6. Check for unit mismatch, period mismatch, duplicate rows, suppressed values, estimated values, revisions, and low-confidence sources.
7. Separate numeric facts from interpretation and recommendations.
8. Report limitations, caveats, and items requiring confirmation.

## Output

Use Japanese unless the user requests another language.

Recommended sections:

- 目的
- 使用データ
- 指標定義
- 集計・比較結果
- 読み取り
- 注意点・制約
- 要確認事項
- 出所

For data definition tables, use columns such as:

- 指標名
- 定義
- 単位
- 対象範囲
- 時点・期間
- 出所
- 備考

For summary tables, use columns that clearly show:

- 対象
- 指標
- 値
- 単位
- 年月・期間
- 出所
- 注記

## Quality Criteria

- Never mix units or periods without explicitly normalizing or warning the user.
- Do not round, rank, or calculate percentages without explaining the method.
- Treat generated, converted, copied, or manually edited data as low confidence unless confirmed against reliable sources.
- Mark missing, suppressed, estimated, provisional, or revised values.
- Do not overinterpret small differences, incomplete coverage, or non-comparable indicators.

## Common Operating Rules

Follow the active project AGENTS.md and the common rules under `operating_ja/`, especially workflow, source confidence, evidence handling, naming rules, output location, and quality checks.

## Portability

This skill must remain project-agnostic. Do not store project-specific facts or working notes inside this skill directory.
