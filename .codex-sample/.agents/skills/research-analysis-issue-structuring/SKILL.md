---
name: research-analysis-issue-structuring
description: Use when the user asks to structure issues, define research questions, create hypotheses, build issue trees, design analysis approaches, clarify what must be proven, or organize consulting-style problem statements before research or document production.
---

# Research Analysis Issue Structuring Workflow

## Purpose

Turn an ambiguous business or policy question into a structured set of issues, hypotheses, required evidence, and analysis tasks.

## Source Material Handling

When existing project materials are needed to ground issues or hypotheses and they are in non-text formats, use the markitdown-mcp server to convert supported files to Markdown before extracting facts. Treat converted Markdown as a derived aid and keep hypotheses, assumptions, and unknowns distinct from source-backed facts.

## Workflow

1. Confirm the objective, decision context, audience, scope, constraints, and expected output.
2. Identify the central question and separate it from background, symptoms, requests, and possible solutions.
3. Break the central question into major issues and sub-issues using a mutually exclusive and collectively useful structure.
4. For each issue, state the working hypothesis, required evidence, likely data sources, and analysis method.
5. Distinguish confirmed facts, assumptions, unknowns, and items requiring stakeholder confirmation.
6. Identify dependencies between issues, including which questions must be answered first.
7. Flag weak issue definitions, unsupported hypotheses, missing decision criteria, and scope creep.
8. Propose a practical next-step analysis plan.

## Output

Use Japanese unless the user requests another language.

Recommended sections:

- 目的・意思決定文脈
- 中心論点
- 論点体系
- 仮説
- 必要な根拠・データ
- 分析方法
- 不明点・要確認
- 次に行う作業

## Quality Criteria

- Do not present a hypothesis as a fact.
- Keep issue labels action-oriented and specific enough to guide research.
- Make the relationship between conclusion, issue, hypothesis, and evidence explicit.
- Avoid over-fragmenting issues that do not change the analysis or decision.
- Mark unsupported assumptions as `推測` or `要確認`.

## Common Operating Rules

Follow the active project AGENTS.md and the common rules under `operating_ja/`, especially workflow, source confidence, naming rules, output location, and quality checks.

## Portability

This skill must remain project-agnostic. Do not store project-specific facts or working notes inside this skill directory.
