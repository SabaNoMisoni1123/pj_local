---
name: ai-operations-agents-update
description: "Use when the primary deliverable is an AGENTS.md or repository agent-instruction update proposal. Do not use for a change-request record, a standalone prompt, or a SKILL.md. Japanese triggers: AGENTS更新, AGENTS追記案, エージェント運用指示."
---

# AI Operations AGENTS Update

## Purpose

Create safe update proposals for agent instruction files without weakening or overwriting existing rules.

## Workflow

1. Read the existing `AGENTS.md`, related operating documents, and higher-priority instructions.
2. Identify the requested behavior change, scope, and prohibited changes.
3. Check conflicts, duplication, ambiguity, and possible weakening of existing rules.
4. Draft an update proposal by default; do not overwrite live instruction files without explicit approval.
5. Separate exact Markdown to add or change from rationale, impact, and confirmation items.

## Output

Use Japanese for user-facing deliverables unless requested otherwise. Recommended sections:

- 変更目的
- 対象ファイル
- 追加・変更案
- 既存ルールとの整合性
- 影響範囲
- ユーザー確認事項

## Quality Checks

- Do not weaken higher-priority instructions or safety rules.
- Keep proposed text separate from commentary.
- Preserve unrelated project-specific rules.
- Use markitdown-mcp only when non-text operating documents must be inspected; note conversion limits.
- Follow active `AGENTS.md` and `operating_ja/`; do not store project-specific facts in this skill.
