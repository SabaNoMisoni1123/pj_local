---
name: python-data-visualization
description: "Use when the primary requested deliverable is Python code that generates reproducible charts or statistical figures from data. Do not use for conceptual diagrams, Mermaid, slide exhibits, or image-generation briefs. Japanese triggers: Python可視化, Pythonでグラフ作成, Python図表生成."
---

# Python Data Visualization

## Purpose

Generate accurate and reproducible data visualizations, not conceptual diagrams.

## Workflow

1. Confirm the question, audience, data definition, units, and comparison basis.
2. Validate source data and transformation logic before plotting.
3. Choose a chart type that matches the analytical task and existing project libraries.
4. Label title, axes, units, legend, period, source, and important caveats.
5. Avoid misleading scales, inconsistent categories, hidden missing values, and unnecessary decoration.
6. Make ordering, aggregation, color mapping, and output size deterministic.
7. Export in the required format and verify readability at the intended use size.

## Quality Checks

- Plotted values reconcile with the source and transformation.
- Units, axes, legends, and time periods are unambiguous.
- The figure can be regenerated from code and documented inputs.

## Common Operating Rules

Follow `operating_ja/python_development.md`.

## Portability

Do not bundle confidential data, logos, or project-specific style assets.
