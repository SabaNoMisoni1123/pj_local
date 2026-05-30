---
name: ai-operations-prompt-drafting
description: "Use when drafting or improving prompts, task briefs, AI-agent instructions, work orders, generation prompts, or quality criteria for business work. Japanese triggers: プロンプト, AI指示, 作業依頼."
---

# AI Operations Prompt Drafting

## Purpose

Create reusable prompts with clear objectives, inputs, constraints, outputs, and acceptance criteria.

## Required Elements

Objective, target user or agent, input materials, source priority, allowed and prohibited actions, output format, evidence rules, unknown handling, low-confidence source handling, overwrite limits, and review criteria.

## Workflow

1. Clarify the target user, execution context, expected artifact, and use case.
2. Extract constraints from active `AGENTS.md`, relevant operating rules, and project materials.
3. Draft concise instructions covering objective, inputs, procedure, output format, and acceptance criteria.
4. Add rules for unknowns, assumptions, low-confidence materials, citations, and file edits.
5. Remove broad, unverifiable, unsafe, or overwrite-prone instructions.

## Output

Use the user's requested language. If unspecified, use English for executable prompt instructions and Japanese for human-facing explanations.

## Quality Checks

- Make the objective, inputs, constraints, and output format immediately clear.
- Do not encourage fabricated facts, hidden chain-of-thought disclosure, or unauthorized overwrites.
- Make acceptance criteria externally verifiable.
- Use markitdown-mcp only when non-text source materials must be inspected; cite originals and note conversion limits.
- Follow active `AGENTS.md` and `operating_ja/`; do not store project-specific facts in this skill.
