---
name: project-management-meeting-followup
description: Use when the user asks to summarize meeting follow-ups, extract post-meeting actions, identify decisions, open questions, risks, and next steps from meeting notes, transcripts, or email recaps.
---

# Project Management Meeting Follow-up Workflow

## Purpose

Turn meeting materials into decisions, TODOs, open questions, and next-step follow-up items.

## Source Material Handling

When meeting materials are in non-text formats supported by markitdown-mcp, convert them to Markdown before extraction when direct reading is impractical. Treat converted Markdown as a derived aid, cite original files, and mark speaker attribution, timestamps, owners, and deadlines as requiring confirmation when the conversion is ambiguous.

## Workflow

1. Confirm meeting date, participants, agenda, and source confidence.
2. Extract decisions, action items, risks, unresolved questions, and owner/date information.
3. Do not infer missing owners or deadlines.
4. Mark ambiguous items as requiring confirmation.
5. Cite evidence by source file and traceable location.

## Output

Use Japanese unless the user requests another language.

Recommended sections:

- 会議概要
- 決定事項
- TODO
- 未解決事項
- リスク・依存関係
- 次回確認事項
- 根拠

## Quality Checks

- Separate action items from decisions, discussion notes, and open questions.
- Do not infer missing owners, deadlines, or approval status.
- Keep follow-up wording concrete enough for project management.
- Cite source material for each important decision or action.

## Common Operating Rules

Follow the active project AGENTS.md and the common rules under `operating_ja/`, especially workflow, source confidence, naming rules, output location, and quality checks.

## Portability

This skill must remain project-agnostic. Do not store project-specific facts or working notes inside this skill directory.
