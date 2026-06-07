---
name: ai-operations-change-request
description: "Use when creating, triaging, or applying Markdown change requests for Codex settings, AGENTS.md, .codex-sample, skills, operating rules, templates, or agent workflow improvements. Japanese triggers: Codex改善要望, 設定更新リクエスト, 変更要求, 機能追加要望."
---

# AI Operations Change Request

## Purpose

Create and process Markdown change requests for Codex operating improvements without mixing unapproved requests into portable templates.

## Inputs

- User request, observed issue, or desired improvement.
- Existing `AGENTS.md`, Codex settings, skills, operating rules, templates, and maintenance docs.
- Optional template: `templates/codex_change_request_template.md`.

## Workflow

1. Determine whether the user wants to create a new request, triage an existing request, or apply an accepted request.
2. Read the active `AGENTS.md` and relevant operating documents before writing or editing.
3. Choose the storage location:
   - In the template maintenance project, use `docs/agent-template-maintenance/change-requests/` when it exists.
   - In a migrated business project, prefer `project-local/codex-change-requests/` or another user-approved project-local location.
   - Do not save request drafts in `.codex/`, `.agents/`, or portable common template directories unless the request has already been accepted as a generic artifact.
4. For a new request, use the available template and create `CR-YYYYMMDD-short-topic.md`.
5. Record background, problem, requested change, expected effect, target files, impact, risks, and acceptance criteria.
6. Remove or generalize client names, personal names, confidential file names, email bodies, credentials, and other project-specific facts.
7. If an index exists, add or update the request row with status, priority, target area, and file path.
8. For triage, classify the request as `AGENTS.md`, Codex settings, skill, operating rule, template, documentation, script, or other.
9. For applying a request, edit only accepted changes. Keep unresolved ideas in the request file or index.
10. After applying changes, update the request status, response log, edited files, validation performed, and remaining issues.

## Output

Use Japanese for user-facing deliverables. A complete request should include:

- 管理情報
- 背景
- 現状の課題
- 要望内容
- 期待する効果
- 具体例
- 既存ルール・既存部品との関係
- 影響範囲
- 受入条件
- 対応記録
- 反映結果, when processing an existing request

## Quality Checks

- Keep pending requests outside `.codex-sample` unless they are portable templates or accepted generic workflows.
- Do not weaken higher-priority instructions or overwrite live `AGENTS.md` without explicit approval.
- Confirm `SKILL.md` frontmatter has only `name` and `description`, with a quoted `description`.
- Verify that accepted changes do not introduce project-specific facts into portable files.
- Update both the request file and index when changing status.
- Note validation limits when tests, links, scripts, or frontmatter checks could not be run.

## Common Operating Rules

Follow the active project `AGENTS.md` and the common rules under `operating_ja/`, especially workflow, naming rules, project-local storage, AGENTS update policy, and quality checks.

## Portability

This skill must remain project-agnostic.
Do not store project-specific facts or working notes inside this skill directory.

