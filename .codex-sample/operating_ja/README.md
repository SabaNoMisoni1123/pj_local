# Codex運用ルール

このディレクトリは、業務カットや個別skillより上位にある、Codex運用の共通ルールを管理します。

## 役割

| ファイル | 役割 |
|---|---|
| `project_intake.md` | 新規プロジェクト開始時に確認する項目 |
| `workflow.md` | 初回確認、資料処理、成果物作成の共通手順 |
| `quality_check.md` | 根拠、数値、日付、用語、TODO漏れの品質基準 |
| `python_development.md` | Python開発の既存構成優先、依存、テスト、秘密情報、データ保全、納品基準 |
| `naming_rules.md` | 成果物命名、suffix、低信頼ファイル名の扱い |
| `work_log.md` | 作業ログに残す項目 |
| `excluded_sources.md` | `old/` / `_old/` 等の参照禁止ソース運用 |
| `low_confidence_sources.md` | `_gpt` / `_tmp` 等の低信頼ソース運用 |
| `project_local_storage.md` | プロジェクト固有情報の保存先 |
| `agents_update_policy.md` | `AGENTS.md` を更新・追記する際の方針 |

## 基本原則

- 既存ファイルを破壊しない。
- プロジェクト固有情報は共通 `.codex` に保存しない。
- 根拠のない断定をしない。
- 参照禁止ディレクトリ配下の情報を読まない、根拠にしない。
- 低信頼ファイルを単独根拠にしない。
- 不明な事項は `不明` または `要確認` として扱う。
- 成果物はプロジェクト側のルールに従って新規ファイルとして保存する。
