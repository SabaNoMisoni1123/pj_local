---
name: ai-operations-prompt-drafting
description: Use when the user asks to create prompts, instructions, task briefs, work orders, AI-agent instructions, quality criteria, or generation prompts for business work based on project materials.
---

# AI Operations Prompt Drafting Workflow

## Purpose

Create clear prompts and task instructions for AI agents or human collaborators while preserving evidence discipline.

## Source Material Handling

When prompts or task briefs depend on project materials in non-text formats, use the markitdown-mcp server to convert supported files to Markdown before extracting requirements when direct reading is impractical. Include source priority, original file references, and conversion limitations in the drafted prompt when they affect evidence handling.

## Prompt Requirements

Include objective, input materials, source priority, prohibited actions, output format, evidence citation rules, treatment of unknowns, treatment of low-confidence files, quality criteria, and constraints on editing or overwriting files.

## Output Language

Use the language requested by the user. If no language is specified, prefer English for executable task instructions and Japanese for human-facing explanations when the active user works in Japanese.

## Quality Checks

- Make the task objective, inputs, constraints, and output format explicit.
- Include source priority and rules for unknowns, assumptions, and low-confidence materials.
- Avoid prompts that encourage invented facts, hidden chain-of-thought disclosure, or unauthorized overwrites.
- Add acceptance criteria that a reviewer can actually verify.

## Common Operating Rules

Follow the active project AGENTS.md and the common rules under `operating_ja/`, especially workflow, source confidence, naming rules, output location, and quality checks.

## Portability

This skill must remain project-agnostic. Do not store project-specific facts or working notes inside this skill directory.
