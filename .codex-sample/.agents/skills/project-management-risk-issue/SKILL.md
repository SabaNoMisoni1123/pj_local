---
name: project-management-risk-issue
description: Use when the user asks to identify, organize, assess, or update project risks, issues, blockers, dependencies, mitigation actions, or escalation points from project materials.
---

# Project Management Risk and Issue Workflow

## Purpose

Organize risks and issues so stakeholders can decide what to monitor, mitigate, or escalate.

## Source Material Handling

When risks, issues, blockers, or dependencies are documented in non-text materials, use the markitdown-mcp server to convert supported files to Markdown when direct reading is impractical. Treat converted Markdown as a derived aid, cite original files, and avoid inferring impact, likelihood, owner, or deadline from ambiguous converted text.

## Workflow

1. Identify explicit risks, issues, blockers, dependencies, and assumptions.
2. Separate confirmed issues from potential risks.
3. Capture impact, likelihood, owner, due date, mitigation, and evidence when available.
4. Mark missing owner, due date, impact, or likelihood as unknown rather than guessing.
5. Cite source files and traceable locations.

## Output

Use Japanese unless the user requests another language.

Recommended columns:

- id
- type
- description
- impact
- likelihood
- owner
- due_date
- mitigation
- escalation_needed
- source
- status

## Quality Checks

- Separate current issues from future risks and dependencies.
- Do not invent probability, impact, owner, or due date.
- Prioritize items that affect scope, schedule, quality, cost, stakeholder agreement, or compliance.
- Make escalation triggers and monitoring actions concrete.

## Common Operating Rules

Follow the active project AGENTS.md and the common rules under `operating_ja/`, especially workflow, source confidence, naming rules, output location, and quality checks.

## Portability

This skill must remain project-agnostic. Do not store project-specific facts or working notes inside this skill directory.
