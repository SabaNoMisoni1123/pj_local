# Codex設定改善リクエスト

## 管理情報

| 項目 | 内容 |
|---|---|
| リクエストID | CR-20260605-config-update-preserve |
| 起票日 | 2026-06-05 |
| 件名 | 更新時に既存 `.codex/config.toml` を保持する |
| 起票者 | ユーザー |
| ステータス | 実装済み |
| 優先度 | 高 |
| 対象分類 | スクリプト / ドキュメント |
| 想定反映先 | `scripts/update_codex_sample.ps1`, `scripts/update_codex_sample.sh`, `.codex-sample/README.md` |

## 背景

移植先プロジェクトでは `.codex/config.toml` にローカルの Codex 設定を調整することがある。更新スクリプト実行時に毎回テンプレートで上書きされると、利用者側で再調整が必要になる。

## 現状の課題

- `scripts/update_codex_sample.ps1` と `scripts/update_codex_sample.sh` が、更新時に `.codex/config.toml` を `codex_config_template.toml` で上書きする。
- `project-local/` と同様、ローカルで変更され得る領域として保持する必要がある。

## 要望内容

- 更新スクリプトでは、既存 `.codex/config.toml` がある場合は上書きしない。
- `.codex/config.toml` が存在しない場合だけ、`codex_config_template.toml` からコピーする。
- `-Force` / `--force` 指定時も `.codex/config.toml` は保持する。
- README の移植・更新方針を同じ内容に更新する。

## 期待する効果

- 移植先プロジェクトのローカル Codex 設定が更新作業で失われない。
- 更新作業後の手戻りを減らせる。

## 具体例

```text
scripts/update_codex_sample.ps1 <project-root>
```

既存 `<project-root>/.codex/config.toml` がある場合はスキップし、未存在時だけ雛形をコピーする。

## 既存ルール・既存部品との関係

- 既存の `AGENTS.md`、`.codex-sample`、skill、テンプレートとの関係: `project-local/` の保持方針と整合する。
- 重複または矛盾の可能性: なし。新規導入時の初回コピーは維持する。
- `.codex-sample` に入れるべき汎用性: 移植先プロジェクト全般で有効な更新方針。

## 影響範囲

- 影響を受ける利用者: 更新スクリプトでテンプレートを移植先に反映する利用者。
- 影響を受けるファイル: `scripts/update_codex_sample.ps1`, `scripts/update_codex_sample.sh`, `.codex-sample/README.md`
- 反映しない場合のリスク: 更新のたびに `.codex/config.toml` のローカル調整が失われる。
- 反映した場合のリスク: テンプレート側の Codex 設定変更は、既存プロジェクトへ自動反映されない。必要な変更は差分提案で反映する。

## 受入条件

- 既存 `.codex/config.toml` がある場合、更新スクリプトが上書きしない。
- `.codex/config.toml` がない場合、更新スクリプトが `codex_config_template.toml` からコピーする。
- `-Force` / `--force` 指定時も既存 `.codex/config.toml` が保持される。
- README の説明が更新後の挙動と一致する。

## 対応記録

| 日付 | ステータス | 対応内容 | 担当 |
|---|---|---|---|
| 2026-06-05 | 実装済み | PowerShell / shell 更新スクリプトと README を修正し、既存 `.codex/config.toml` を保持する方針に変更。 | Codex |

## 反映結果

- 判定: 実装済み
- 反映先: `scripts/update_codex_sample.ps1`, `scripts/update_codex_sample.sh`, `.codex-sample/README.md`, `docs/agent-template-maintenance/change-requests/request-index.md`
- 検証内容: PowerShell 版更新スクリプトの実行テストで、既存 `.codex/config.toml` の保持、未存在時のコピー、`-Force` 時の保持を確認。shell 版はこの Windows 環境に `sh` / `shellcheck` がないため実行検証未実施。
- 残課題: shell 版は Unix 系環境での実行確認が望ましい。
