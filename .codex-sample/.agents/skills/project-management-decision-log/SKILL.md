---
name: project-management-decision-log
description: Use when the user asks to extract, organize, review, or maintain project decisions, decision history, pending decisions, approval status, or decision rationale from project materials.
---

# Project Management Decision Log Workflow

## Purpose

Create an auditable decision log from project materials without inventing decisions or approvals.

## Source Material Handling

When decisions are stored in PDFs, Office files, email exports, meeting notes, or other supported non-text materials, use the markitdown-mcp server to convert them to Markdown when direct reading is impractical. Treat converted Markdown as a derived aid, cite original files, and mark decision status as unclear when conversion weakens speaker, date, approval, or context evidence.

## Workflow

1. Identify explicit decisions, pending decisions, approval requests, and decision rationale.
2. Record decision date, decision maker, affected scope, and evidence when available.
3. Mark missing decision maker, date, or approval status as unknown.
4. Separate confirmed decisions from proposals and discussion points.
5. Cite source files and traceable locations.

## Output

Use a table with decision, status, owner, date, source, evidence type, and notes.

## Quality Checks

- Do not treat discussion, preference, proposal, or draft wording as a confirmed decision.
- Capture decision status: confirmed, proposed, pending, rejected, or unclear.
- Mark missing decision maker, date, scope, approval status, and evidence as unknown.
- Preserve rationale and conditions when they affect implementation.

## Common Operating Rules

Follow the active project AGENTS.md and the common rules under `operating_ja/`, especially workflow, source confidence, naming rules, output location, and quality checks.

## Portability

This skill must remain project-agnostic. Do not store project-specific facts or working notes inside this skill directory.
