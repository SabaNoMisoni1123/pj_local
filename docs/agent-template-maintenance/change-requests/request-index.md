# Codex設定改善リクエスト索引

## 管理表

| ID | 起票日 | 件名 | 対象 | 優先度 | ステータス | リクエストファイル | 反映先 | 対応メモ |
|---|---|---|---|---|---|---|---|---|
| CR-20260603-01 | 2026-06-03 | Codex改善リクエスト受付・反映仕組みの追加 | ドキュメント / skill / テンプレート | 高 | 実装済み | [CR-20260603-change-request-workflow.md](CR-20260603-change-request-workflow.md) | `AGENTS.md`, `docs/agent-template-maintenance/change-requests/`, `.codex-sample/templates/codex_change_request_template.md`, `.codex-sample/.agents/skills/ai-operations-change-request/SKILL.md` | 受付、索引、反映ワークフロー、移植用テンプレート、専用skillを追加。 |
| CR-20260603-email-fact-reconciliation | 2026-06-03 | 外部向けメール文案作成時の高影響項目照合フロー追加 | skill | 高 | 実装済み | [CR-20260603-email-fact-reconciliation.md](CR-20260603-email-fact-reconciliation.md) | `.codex-sample/.agents/skills/communication-email-draft/SKILL.md`, `.codex-sample/.agents/skills/document-review-quality-check/SKILL.md` | 外部向けメールの高影響項目抽出、根拠との項目単位照合、重大欠陥判定を追加。 |
| CR-20260605-config-update-preserve | 2026-06-05 | 更新時に既存 `.codex/config.toml` を保持する | スクリプト / ドキュメント | 高 | 実装済み | [CR-20260605-config-update-preserve.md](CR-20260605-config-update-preserve.md) | `scripts/update_codex_sample.ps1`, `scripts/update_codex_sample.sh`, `.codex-sample/README.md` | 更新スクリプトで既存 `.codex/config.toml` を上書きせず、未存在時のみ雛形をコピーするよう変更。 |
| CR-20260618-project-todo-task-planning-skill | 2026-06-18 | プロジェクト内TODOを生成AI実行可能タスクへ整理するSkill追加 | skill | 中 | 実装済み | [CR-20260618-project-todo-task-planning-skill.md](CR-20260618-project-todo-task-planning-skill.md) | `.codex-sample/.agents/skills/project-management-ai-task-planning/SKILL.md`, `.codex-sample/.agents/skills/project-management-todo/SKILL.md`, `.codex-sample/.agents/skills/project-management-workplan/SKILL.md`, `.codex-sample/.agents/skills/ai-operations-prompt-drafting/SKILL.md`, `.codex-sample/.agents/AGENTS.md`, `.codex-sample/domains_ja/project-management.md`, `.codex-sample/domains_ja/task_catalog.md`, `.codex-sample/README.md` | 新規Skillを追加し、既存Skillとの発火条件境界、代表一覧、タスクカタログを更新。 |

## 記入ルール

- `ID` は `CR-YYYYMMDD-XX` 形式を推奨する。
- `対象` は `AGENTS.md`、Codex設定、skill、運用ルール、テンプレート、ドキュメント、スクリプト、その他から選ぶ。
- `優先度` は `高`、`中`、`低`、`未設定` のいずれかを使う。
- `ステータス` は `README.md` の定義に合わせる。
- `反映先` には、採用時に編集したファイルまたは未反映理由を記録する。
