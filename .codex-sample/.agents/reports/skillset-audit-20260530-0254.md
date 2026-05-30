# Skillset audit report

## Summary

- 対象: `.codex-sample/.agents`、`.codex-sample/AGENTS.md`、`.codex-sample/.agents/skills/**/SKILL.md`
- 実施日時: 2026-05-30 02:54 JST
- 主な変更: `.agents` 管理ハブ文書の追加、スキル README の保守方針補強、4 件の `SKILL.md` に明示的な `Workflow` を追加、ルート雛形 `AGENTS.md` から `.agents/AGENTS.md` への参照を追加、`information-organization-file-index` を `information-organization-project-index` に統合、既存 BOM を除去
- 未対応事項: 高影響だが `evals/` が未整備のスキルについて、代表プロンプトと期待品質を少数追加する余地がある

## Inventory

| Path | Type | Status | Notes |
|---|---|---|---|
| `.codex-sample/AGENTS.md` | Always-on instruction template | Updated | `.agents/AGENTS.md` への参照を追加 |
| `.codex-sample/.agents/AGENTS.md` | Internal design hub | Created | 目的、役割分担、スキル一覧、保守基準、検証手順を整理 |
| `.codex-sample/.agents/README.md` | Human-facing overview | Created | `.agents` の短い案内を追加 |
| `.codex-sample/.agents/skills/README.md` | Skill discovery guide | Updated | ハブ文書とレポート運用への誘導を追加 |
| `.codex-sample/.agents/skills/*/SKILL.md` | Skill definitions | Updated | 29 件を確認、1 件を統合削除、4 件を軽微修正 |
| `.codex-sample/.agents/skills/*/evals/evals.json` | Skill evals | Reviewed | 5 件を確認、構造変更なし |
| `.codex-sample/.agents/prompts/` | Maintenance prompts | Present | 今回は保守用プロンプトを追加しない |
| `.codex-sample/.agents/reports/` | Audit reports | Created | 本レポートを保存 |

## Issues found

| Severity | Path | Issue | Action |
|---|---|---|---|
| Medium | `.codex-sample/.agents/AGENTS.md` | `.agents` 全体の設計・索引・保守方針が未整備 | 新規作成 |
| Low | `.codex-sample/.agents/README.md` | 人間向けの `.agents` 案内が未整備 | 新規作成 |
| Low | `.codex-sample/AGENTS.md` | `.agents/AGENTS.md` を内部設計文書として参照する導線がない | 参照を追加 |
| Low | `ai-operations-prompt-drafting/SKILL.md` | 明示的な `Workflow` セクションがない | 5 ステップの手順を追加 |
| Low | `information-organization-evidence-trace/SKILL.md` | 明示的な `Workflow` セクションがない | 5 ステップの手順を追加 |
| Low | `project-management-todo/SKILL.md` | 明示的な `Workflow` セクションがない | 5 ステップの手順を追加 |
| Low | `document-review-consistency/SKILL.md` | 明示的な `Workflow` セクションがない | 5 ステップの手順を追加 |
| Low | `information-organization-file-index` / `information-organization-project-index` | 同じ局面で発火しやすく、機能の関係性が高い | `information-organization-project-index` に統合 |
| Low | `.codex-sample/domains_ja/document-production.md` ほか 3 件 | 既存 Markdown に UTF-8 BOM がある | BOM を除去 |

## Changes made

| Path | Change | Reason |
|---|---|---|
| `.codex-sample/AGENTS.md` | `.agents/AGENTS.md` を標準参照に追加 | 常時ルールから内部設計文書へ誘導するため |
| `.codex-sample/.agents/AGENTS.md` | 新規作成 | `.agents` の役割分担、索引、保守ルールを明文化するため |
| `.codex-sample/.agents/README.md` | 新規作成 | 人間向けにディレクトリの目的を短く示すため |
| `.codex-sample/.agents/skills/README.md` | ハブ文書とレポート運用への参照を追加 | スキル保守時の入口を明確にするため |
| `.codex-sample/.agents/skills/ai-operations-prompt-drafting/SKILL.md` | `Workflow` 追加 | 手順と検証可能性を明確にするため |
| `.codex-sample/.agents/skills/information-organization-evidence-trace/SKILL.md` | `Workflow` 追加 | 根拠分類の実行順序を明確にするため |
| `.codex-sample/.agents/skills/project-management-todo/SKILL.md` | `Workflow` 追加 | TODO 抽出時の推測禁止と再確認手順を明確にするため |
| `.codex-sample/.agents/skills/document-review-consistency/SKILL.md` | `Workflow` 追加 | 整合性レビューの対象範囲と分類手順を明確にするため |
| `.codex-sample/.agents/skills/information-organization-project-index/SKILL.md` | `information-organization-file-index` の役割を統合 | ファイル索引とプロジェクト索引が同じ局面で発火しやすいため |
| `.codex-sample/.agents/skills/information-organization-file-index/SKILL.md` | 削除 | `information-organization-project-index` へ統合したため |
| `.codex-sample/domains_ja/task_catalog.md` | ファイル索引の skill を `information-organization-project-index` に更新 | 削除した skill への参照をなくすため |
| `.codex-sample/domains_ja/information-organization.md` | 代表 skill と分類説明を更新 | 統合後の使い分けを明確にするため |
| `.codex-sample/domains_ja/document-production.md` ほか 3 件 | UTF-8 BOM を除去 | 文字コード方針に合わせるため |

## Skills

| Skill | Trigger quality | Scope quality | Validation | Notes |
|---|---:|---:|---:|---|
| `ai-operations-agents-update` | 4 | 4 | 4 | AGENTS 更新用途として明確 |
| `ai-operations-prompt-drafting` | 4 | 4 | 4 | Workflow を追加 |
| `ai-operations-skill-design` | 4 | 4 | 4 | Skill 設計用途として明確 |
| `communication-email-draft` | 4 | 4 | 4 | メール作成用途として明確 |
| `communication-meeting-agenda` | 4 | 4 | 4 | 会議前アウトプットとして明確 |
| `document-production-minutes` | 4 | 4 | 4 | 議事録作成用途として明確 |
| `document-production-report-draft` | 4 | 4 | 4 | 報告書ドラフト用途として明確 |
| `document-production-slide-outline` | 4 | 4 | 4 | スライド構成用途として明確 |
| `document-review-consistency` | 4 | 4 | 4 | Workflow を追加 |
| `document-review-logic-structure` | 4 | 4 | 4 | 論理構成レビュー用途として明確 |
| `document-review-quality-check` | 4 | 4 | 4 | 汎用品質確認として明確 |
| `engineering-support-script` | 4 | 4 | 4 | 小規模実装・検証用途として明確 |
| `information-organization-email-thread` | 4 | 4 | 4 | メールスレッド整理として明確 |
| `information-organization-evidence-trace` | 4 | 4 | 4 | Workflow を追加 |
| `information-organization-file-name-index` | 4 | 4 | 4 | ファイル名ベースの限定用途として明確 |
| `information-organization-glossary` | 4 | 4 | 4 | 用語・固有名詞整理として明確 |
| `information-organization-project-context` | 4 | 4 | 4 | プロジェクト文脈整理として明確 |
| `information-organization-project-index` | 4 | 4 | 4 | file-index を統合し、ファイル索引・資料台帳・アクセスマップ用途へ集約 |
| `project-management-decision-log` | 4 | 4 | 4 | 決定ログ用途として明確 |
| `project-management-meeting-followup` | 4 | 4 | 4 | 会議後フォローアップとして明確 |
| `project-management-risk-issue` | 4 | 4 | 4 | リスク・課題整理として明確 |
| `project-management-todo` | 4 | 4 | 4 | Workflow を追加 |
| `project-management-workplan` | 4 | 4 | 4 | 作業計画用途として明確 |
| `research-analysis-interview-design` | 4 | 4 | 4 | インタビュー設計として明確 |
| `research-analysis-issue-structuring` | 4 | 4 | 4 | 論点設計として明確 |
| `research-analysis-public-info` | 4 | 4 | 4 | 公開情報調査として明確 |
| `research-analysis-statistics-table` | 4 | 4 | 4 | 統計・数値整理として明確 |
| `visual-production-diagram` | 4 | 4 | 4 | 図解・視覚資料として明確 |

## Recommended next steps

1. 高影響だが `evals/` が未整備のスキルについて、代表プロンプトと期待品質を少数追加する。
