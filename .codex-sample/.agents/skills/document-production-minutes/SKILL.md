---
name: document-production-minutes
description: Use when the user asks to draft, clean up, structure, or convert meeting notes, transcripts, recordings, or rough memos into meeting minutes or action summaries.
---

# Document Production Minutes Workflow

## Purpose

Turn rough meeting material into usable minutes, decisions, TODOs, and open questions.

## Source Material Handling

When meeting notes, transcripts, recording exports, or attachments are in non-text formats supported by markitdown-mcp, convert them to Markdown before extraction when direct reading is impractical. Treat converted Markdown as a derived aid, cite original files, and mark unclear audio/transcript passages, speaker attribution, timestamps, or attachments as requiring confirmation.

## Workflow

1. Identify meeting date, participants, agenda, and source confidence.
2. Extract discussion points, decisions, TODOs, and unresolved questions.
3. Do not invent missing participants, dates, owners, or deadlines.
4. Mark unclear items as `要確認`.
5. Use project-specific output rules when available.

## Output

Use Japanese unless the user requests another language.

Recommended sections:

- 会議概要
- 議題別メモ
- 決定事項
- TODO
- 未決事項・要確認
- 次回までの確認事項

For action items, include owner, due date, source, and status when available.

## Quality Checks

- Do not invent participants, dates, decisions, owners, or deadlines.
- Separate decisions from discussion, proposals, and open questions.
- Preserve important dissent, conditions, and dependencies.
- Mark unclear transcript passages or missing source context as `要確認`.
- Cite source files or traceable locations when working from saved materials.

## Common Operating Rules

Follow the active project AGENTS.md and the common rules under `operating_ja/`, especially workflow, source confidence, naming rules, output location, and quality checks.

## Portability

This skill must remain project-agnostic. Do not store project-specific facts or working notes inside this skill directory.
