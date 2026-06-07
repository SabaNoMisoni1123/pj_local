# Python 開発向け Codex 環境整備手順書

作成日: 2026-06-07

最終更新日: 2026-06-07

対象: Python ツール開発を支援する Codex / Agent Skills 雛形

雛形配置先: `.codex-sample/`

保守資料配置先: `docs/agent-template-maintenance/`

## 1. 目的

本手順書は、既存の `.codex-sample` を、シンクタンク・コンサルティング業務支援に加えて Python ツール開発にも利用できる雛形へ拡張するための作業手順を定める。

初期検討時は独立した `.codex-python/` の新設を想定していたが、その後のテンプレート更新とブランチ統合により、再配布・移植する雛形は `.codex-sample/` に集約する方針となった。以後、Python 向けの共通ルール、domain、skill、テンプレートも `.codex-sample/` に追加し、別の `.codex-python/` は作成しない。

次の文書は初期要件を確認する参考資料として扱う。

- `codex-python-questionnaire.md`
- `codex-python-initial-scope-20260602.md`
- `codex-python-instruction-set-workplan.md`

これらにある `.codex-python/` の配置記述より、本手順書とルート `AGENTS.md` の現行配置ルールを優先する。

## 2. 現行構成を踏まえた更新方針

### 2.1 旧計画からの変更点

| 項目 | 旧計画 | 現行方針 |
|---|---|---|
| Python 向け雛形 | `.codex-python/` を新設 | `.codex-sample/` を拡張 |
| Codex 設定雛形 | `.codex-python/config.toml` | `.codex-sample/codex_config_template.toml` |
| 移植先の設定 | 必要に応じて配置 | `.codex/config.toml` として配置 |
| 設定更新 | 未確定 | 既存 `.codex/config.toml` は上書きしない |
| skill 配置 | `.agents/skills/` | 変更なし |
| 改善要望管理 | 未定義 | `change-requests/` のワークフローに従う |
| 既存資産との関係 | 構成だけ参考にする独立雛形 | 既存の共通ルールと skill を再利用・拡張 |

### 2.2 配置原則

- 移植先プロジェクトでそのまま使う汎用部品だけを `.codex-sample/` に置く。
- 調査結果、設計メモ、比較表、監査レポート、作業記録は `docs/agent-template-maintenance/` に置く。
- 実案件情報、認証情報、ローカル絶対パス、実データ、実行ログ、キャッシュは `.codex-sample/` に置かない。
- `project-local/` には、新規導入時に空で使う雛形だけを置く。
- Python 専用ルールを追加する前に、既存の `engineering-support-script` skill や共通運用ルールへの追記で対応できるか確認する。

### 2.3 言語・ファイル原則

- `SKILL.md` のエージェント向け手順は英語で作成する。
- `README.md`、`operating_ja/`、`domains_ja/`、`templates/`、`project-local/` は日本語で作成する。
- コード、コマンド、設定キー、API 名、ライブラリ名は原表記を使う。
- テキストファイルは UTF-8、BOM なしで保存する。
- `SKILL.md` の YAML frontmatter は原則として `name` と `description` のみにする。
- `description` はダブルクォートで囲み、親ディレクトリ名と `name` を一致させる。

### 2.4 技術判断原則

- Python 3.11 以上を対象にする。
- 既存プロジェクトの構成、依存管理、テスト、formatter、linter、型チェックを優先する。
- `pyproject.toml`、pytest、ruff、mypy、pyright、uv、Poetry などを無条件の標準にしない。
- ライブラリ、API、フレームワーク、設定項目は、可能な限り Context7 MCP で最新ドキュメントを確認する。
- Context7 MCP で確認できない場合は、公式ドキュメントまたは公式リポジトリを参照する。
- 公開 skill や公開リポジトリを利用する場合は、ライセンス、出典、改変範囲を保守資料へ記録する。

## 3. 目標構成

Python 対応後も、移植元の基本構成は次の形を維持する。

```text
.codex-sample/
├─ README.md
├─ AGENTS.md
├─ codex_config_template.toml
├─ .agents/
│  ├─ AGENTS.md
│  ├─ README.md
│  └─ skills/
│     ├─ README.md
│     ├─ engineering-support-script/
│     │  └─ SKILL.md
│     └─ python-{task-name}/
│        ├─ SKILL.md
│        └─ 必要に応じて references/、scripts/、assets/、evals/
├─ operating_ja/
├─ domains_ja/
├─ templates/
└─ project-local/
```

移植先では `codex_config_template.toml` をそのまま置かず、次のように配置する。

```text
<project-root>/.codex/config.toml
```

## 4. 全体工程

| 工程 | 内容 | 主な成果物 |
|---|---|---|
| 0 | 開始前確認 | 対象リクエスト、前提確認結果 |
| 1 | 現行資産の棚卸し | 再利用・変更・追加の判断表 |
| 2 | 公式情報・公開資産の調査 | 調査メモ |
| 3 | 情報設計 | ファイル責務表、skill 境界表 |
| 4 | 共通基盤の更新 | AGENTS、README、config 方針 |
| 5 | 共通運用・domain の更新 | `operating_ja/`、`domains_ja/` |
| 6 | Python skill の実装 | `SKILL.md` 群 |
| 7 | テンプレートの実装 | `templates/`、必要最小限の `project-local/` |
| 8 | 構造・内容監査 | 監査レポート、修正結果 |
| 9 | 移植スクリプト確認 | 導入・更新・削除の確認結果 |

## 5. 工程0: 開始前確認

### 作業

1. ルート `AGENTS.md` と本手順書を読む。
2. `git status --short` で未コミット変更を確認し、利用者の変更を上書きしない。
3. `git log --oneline --decorate -20` で直近の構成変更を確認する。
4. 初期要件は `codex-python-initial-scope-20260602.md` を参照し、配置は本手順書の現行方針へ読み替える。
5. 作業が既存の改善リクエストに基づく場合は、対象ファイルと `change-requests/request-index.md` を確認する。
6. 新規要望として管理すべき場合は、`change-requests/change_request_template.md` を使って起票する。
7. Windows 環境の `PIM` など未確定の用語は、実装に必要になるまで確定事項として扱わない。

### 完了条件

- 作業対象と非対象が明確である。
- `.codex-sample/` に置く移植用部品と、`docs/` に置く保守資料が分離されている。
- 既存変更との競合有無を確認している。

## 6. 工程1: 現行資産の棚卸し

### 主な確認対象

- `.codex-sample/AGENTS.md`
- `.codex-sample/README.md`
- `.codex-sample/codex_config_template.toml`
- `.codex-sample/.agents/AGENTS.md`
- `.codex-sample/.agents/skills/README.md`
- `.codex-sample/.agents/skills/engineering-support-script/SKILL.md`
- `.codex-sample/operating_ja/`
- `.codex-sample/domains_ja/engineering-support.md`
- `.codex-sample/domains_ja/task_catalog.md`
- `.codex-sample/templates/`
- `.codex-sample/project-local/`
- `scripts/install_codex_sample.*`
- `scripts/update_codex_sample.*`
- `scripts/uninstall_codex_sample.*`

### 作業

1. 各ファイルを「変更不要」「追記して再利用」「Python 向けに新規追加」「対象外」に分類する。
2. 既存の `engineering-support-script` で扱える範囲を確認する。
3. Python skill の新設が必要な場合は、既存 skill との発火条件の差を説明できるようにする。
4. 共通化できる安全性、品質、変更管理のルールは `operating_ja/` に置き、skill に重複記載しない。
5. `.codex-sample` の既存業務支援機能を削除・弱体化しない。

### 成果物

必要な場合は、次を作成する。

`docs/agent-template-maintenance/codex-python-existing-assets-inventory.md`

| 既存ファイル | 判断 | 変更先 | 変更内容 | 注意事項 |
|---|---|---|---|---|

### 完了条件

- 追加予定の全ファイルについて、新設理由または再利用元が明確である。
- 既存 skill と重複する Python skill がない。
- `.codex-python/` の新設を前提とする作業項目がない。

## 7. 工程2: 公式情報・公開資産の調査

### 調査対象

- Python 3.11 以降の公式ドキュメント
- Python Packaging User Guide
- OpenAI Codex の公式ドキュメント
- Agent Skills の公式仕様
- 実装対象となる CLI、API、スクレイピング、データ処理、可視化、テスト、依存管理、パッケージ化の公式情報
- 公開されている関連 skill、テンプレート、ガイド

### 作業

1. ライブラリや仕様は Context7 MCP で確認する。
2. Context7 MCP で確認できない対象は、公式 Web ドキュメントまたは公式リポジトリで確認する。
3. 確認対象、確認日、公式 URL、反映要点、バージョン依存事項を記録する。
4. 公開資産はライセンス、著作権表示、引用・改変条件を確認する。
5. 長文転載を避け、雛形へは運用に必要な要点だけを反映する。

### 成果物

- `docs/agent-template-maintenance/codex-python-official-docs-research.md`
- `docs/agent-template-maintenance/codex-python-public-assets-research.md`

必要な調査を実施した場合だけ作成する。調査記録を `.codex-sample/` に置かない。

## 8. 工程3: 情報設計

### 作業

1. Python 固有の常時指示、共通運用ルール、domain 説明、skill、テンプレートを分ける。
2. ルート `AGENTS.md` には全 Python 作業で常時必要な最小限の指示だけを追加する。
3. 複数 skill に共通する手順は `operating_ja/` へ置く。
4. 人間向けのタスク説明は `domains_ja/engineering-support.md` または必要な新規 domain 文書へ置く。
5. タスク固有の実行手順だけを `.agents/skills/python-{task-name}/SKILL.md` に置く。
6. 再利用する記入形式だけを `templates/` に置く。
7. `project-local/` へのファイル追加は、移植直後に空で使う必要がある場合に限定する。

### 初期 skill 候補

| Skill | 主対象 | 既存 skill との境界 |
|---|---|---|
| `python-project-intake` | Python ツールの要件・制約整理 | 一般案件の intake ではなく開発要件を扱う |
| `python-cli-tool` | CLI 設計・実装 | 単発スクリプト全般ではなく CLI 契約を扱う |
| `python-data-processing` | CSV、Excel、JSON 等の安全な処理 | 一般スクリプトよりデータ保全を重視する |
| `python-api-integration` | 外部 API 連携 | 調査 skill ではなく実装と運用を扱う |
| `python-web-scraping` | Web 収集実装 | 公開情報調査ではなく収集コードを扱う |
| `python-data-visualization` | 再現可能な図表生成 | 図解制作ではなくデータ可視化コードを扱う |
| `python-dependency-management` | 仮想環境、依存、lock | 個別ライブラリ実装ではなく依存方針を扱う |
| `python-packaging` | パッケージ・配布 | 単発実行ではなく配布可能性を扱う |
| `python-testing` | テスト設計・実装 | 一般品質確認ではなくコードテストを扱う |
| `python-code-review` | Python コードレビュー | 文書レビューではなくコードの欠陥を扱う |

初期要件の10件を候補とするが、棚卸し結果により統合・延期してよい。件数を満たすためだけに skill を分割しない。

### 成果物

必要な場合は、`docs/agent-template-maintenance/codex-python-information-architecture.md` にファイル責務表と skill 境界表を作成する。

## 9. 工程4: 共通基盤の更新

### 対象

- `.codex-sample/AGENTS.md`
- `.codex-sample/README.md`
- `.codex-sample/codex_config_template.toml`
- `.codex-sample/.agents/AGENTS.md`
- `.codex-sample/.agents/README.md`
- `.codex-sample/.agents/skills/README.md`

### 作業

1. `AGENTS.md` には、既存コード優先、Python 3.11 以上、データ保全、テスト、公式情報確認など、常時必要なルールだけを追加する。
2. `.agents/AGENTS.md` と skill README に、Python skill の命名・追加・監査方法を既存規則と整合させて追記する。
3. `.codex-sample/README.md` の構成図、task catalog、移植説明を更新する。
4. Codex 設定を変更する場合は `codex_config_template.toml` を編集する。`.codex-sample/.codex/config.toml` や `.codex-sample/config.toml` は作成しない。
5. `codex_config_template.toml` へ Python 固有 MCP を追加する場合は、利用頻度とトークン負荷を検討し、原則としてコメントアウトした候補にする。
6. このテンプレート管理プロジェクト自身の `.codex/config.toml` は実行環境用であり、再配布雛形として編集しない。

### 設定更新時の注意

- 移植先に既存 `.codex/config.toml` がある場合、更新スクリプトは上書きしない。
- `--force` または `-Force` を指定しても、既存 `.codex/config.toml` は保持する。
- 雛形側の設定変更を既存移植先へ反映する必要がある場合は、差分を提示して利用者が採否を判断する。
- `$HOME/.codex/config.toml` は標準コピー対象外であり、プロジェクトの `trust_level` だけを管理する。

## 10. 工程5: 共通運用ルールと domain の更新

### 運用ルール

既存文書への追記を優先し、責務が明確に分かれる場合だけ新規作成する。候補は次のとおり。

- 開発ワークフロー
- 依存追加・更新方針
- テスト方針
- secrets とセキュリティ
- 入出力データの保全
- ファイル I/O
- 開発文書と runbook

### domain

1. まず `.codex-sample/domains_ja/engineering-support.md` を更新する。
2. タスク数が多く読みにくくなる場合だけ、Python 開発専用の domain 文書を追加する。
3. `.codex-sample/domains_ja/task_catalog.md` に追加した skill を掲載する。
4. 正式な skill は `.agents/skills/*/SKILL.md` であり、task catalog は人間向け一覧であることを維持する。

### 完了条件

- 同じルールが AGENTS、運用文書、複数 skill に重複していない。
- 既存の業務支援ルールと矛盾しない。
- 存在しない skill への参照がない。

## 11. 工程6: Python skill の実装

### 標準構成

```markdown
---
name: python-example
description: "Use when ... Japanese triggers: ..."
---

# Python Example

## Purpose

## Inputs

## Workflow

## Output

## Quality Checks

## Common Operating Rules

## Portability
```

必要な節だけを使い、内容のない節は作らない。

### 作業

1. `.codex-sample/.agents/skills/python-{task-name}/SKILL.md` を作成する。
2. `description` に英語の用途説明と必要な日本語トリガーを含める。
3. 隣接 skill と発火条件が重なる場合は、本文で主対象と対象外を明確にする。
4. `Workflow` は実行手順に絞り、一般的な品質ルールを重複記載しない。
5. 共通ルールは `AGENTS.md` と `operating_ja/` を参照する。
6. 案件固有情報や作業メモを skill ディレクトリに保存しない。
7. 外部ライブラリに依存する補助スクリプトを追加する場合は、導入方法とライセンスを確認する。

### 必須観点

| Skill | 必須観点 |
|---|---|
| `python-project-intake` | 目的、利用者、入力、出力、実行環境、制約、完了条件 |
| `python-cli-tool` | help、終了コード、stdout/stderr、dry-run、パス、文字コード |
| `python-data-processing` | 入力保全、欠損、重複、型、日付、単位、出力検証 |
| `python-api-integration` | 認証、timeout、retry、rate limit、エラー応答、秘密情報 |
| `python-web-scraping` | 利用規約、robots.txt、負荷、著作権、構造変化 |
| `python-data-visualization` | データ定義、単位、軸、凡例、再現性、出力形式 |
| `python-dependency-management` | 導入理由、代替、互換性、ライセンス、固定方法 |
| `python-packaging` | 配布対象、entry point、バージョン、依存、導入・削除手順 |
| `python-testing` | リスク、代表ケース、異常系、境界値、再現方法 |
| `python-code-review` | バグ、保守性、セキュリティ、データ破壊、テスト不足 |

## 12. 工程7: テンプレートと `project-local` の更新

### テンプレート候補

- `templates/tool_spec_template.md`
- `templates/cli_usage_template.md`
- `templates/test_plan_template.md`
- `templates/dependency_decision_template.md`
- `templates/troubleshooting_note_template.md`

### 作業

1. 既存テンプレートで代替できないことを確認してから追加する。
2. 記入欄と確認項目を中心とし、特定案件のサンプル値を入れない。
3. Python 固有の project context が必要でも、まず既存 `project_context_template.md` の拡張を検討する。
4. `project-local/` への新規ファイル追加は、全移植先で新規導入直後から必要な空雛形に限る。
5. 記入済み `project-local/` は再配布対象外であることを維持する。

## 13. 工程8: 品質監査

### 基本確認

```bash
git status --short
find .codex-sample -type f | sort
rg -n "^name:|^description:" .codex-sample/.agents/skills
rg -n "\\.codex-python|\\.codex-sample/config\\.toml|\\.codex-sample/\\.codex/config\\.toml" \
  .codex-sample docs/agent-template-maintenance/codex-python-development-procedure.md
rg -n "/home/|C:\\\\|api[_-]?key|secret|password" .codex-sample
```

`.codex-python` は、旧計画の参考資料に残る記述と、本手順書で旧前提を説明する記述だけを許容する。

### frontmatter と文字コード

全 `SKILL.md` について次を確認する。

- YAML frontmatter が `name` と `description` を持つ。
- `description` がダブルクォートで囲まれている。
- `name` と親ディレクトリ名が一致する。
- 未クォートのコロンがない。
- UTF-8 BOM がない。

### 参照・一覧

- `.agents/AGENTS.md` の一覧と実在 skill が一致する。
- `domains_ja/task_catalog.md` の skill 名が実在する。
- README、AGENTS、domain、skill からの参照先が存在する。
- 廃止済みのファイル名 `config.toml` を移植元として参照していない。

### 移植性・安全性

- 実案件情報、認証情報、絶対パス、ログ、キャッシュ、DB、一時ファイルがない。
- `old/`、`_old/` など参照禁止ディレクトリを情報源として扱う指示がない。
- Python の入力データを上書きする手順が既定になっていない。
- 外部ライブラリを無条件に固定していない。

### 代表シナリオ

少なくとも次の依頼で主に発火すべき skill を確認する。

1. CSV を加工して別ファイルへ出力する CLI を作る。
2. Web API からデータを取得し、JSON を保存する。
3. Web ページから表を収集し、アクセス間隔を設定する。
4. Excel データを集計し、グラフ画像を出力する。
5. 既存 CLI をパッケージ化し、導入手順とテストを追加する。
6. 小規模な単発 Python スクリプトを作る。

6 は既存 `engineering-support-script` と Python 専用 skill のどちらを使うか確認する境界テストとする。

### 成果物

`docs/agent-template-maintenance/codex-python-quality-audit-YYYYMMDD.md`

監査レポートは `.codex-sample/` に置かない。

## 14. 工程9: 移植スクリプト確認

### 現行マッピング

| 移植元 | 移植先 |
|---|---|
| `.codex-sample/AGENTS.md` | `<project-root>/AGENTS.md` |
| `.codex-sample/.agents/` | `<project-root>/.agents/` |
| `.codex-sample/codex_config_template.toml` | `<project-root>/.codex/config.toml` |
| `.codex-sample/domains_ja/` | `<project-root>/domains_ja/` |
| `.codex-sample/operating_ja/` | `<project-root>/operating_ja/` |
| `.codex-sample/templates/` | `<project-root>/templates/` |
| `.codex-sample/project-local/` | `<project-root>/project-local/` |

### Linux / macOS

```bash
scripts/install_codex_sample.sh <project-root>
scripts/update_codex_sample.sh <project-root>
scripts/update_codex_sample.sh --force <project-root>
scripts/uninstall_codex_sample.sh <project-root>
```

### Windows PowerShell

```powershell
scripts/install_codex_sample.ps1 <project-root>
scripts/update_codex_sample.ps1 <project-root>
scripts/update_codex_sample.ps1 <project-root> -Force
scripts/uninstall_codex_sample.ps1 <project-root>
```

### 確認事項

1. install は既存ファイル・ディレクトリを上書きしない。
2. update は `AGENTS.md`、`.agents/`、`domains_ja/`、`operating_ja/`、`templates/` を雛形へ同期する。
3. update は雛形側で廃止された管理対象ファイルを移植先から削除する。
4. 既存 `.codex/config.toml` と既存 `project-local/` は update でも保持する。
5. `--force` / `-Force` は README を強制更新するが、`.codex/config.toml` と `project-local/` は保持する。
6. 既存 README が別内容の場合、通常更新では `codex_setup_README.md` を使う。
7. uninstall は変更済み `AGENTS.md`、`.codex/config.toml`、README、`project-local/` を誤削除しない。

スクリプト自体を変更した場合は、一時ディレクトリで install、update、force update、uninstall を実行し、保持対象と同期対象を確認する。

## 15. 変更管理

Python 対応の追加・変更は、次の順で行う。

1. 変更理由と対象タスクを確認する。
2. 既存 skill、運用ルール、domain、テンプレートへの追記で対応できないか確認する。
3. 管理対象の改善要望であれば、`change-requests/` に起票または既存リクエストを更新する。
4. 採用または一部採用と判断した内容だけを `.codex-sample/` へ反映する。
5. 新規 skill は既存 skill との発火境界を定義する。
6. `AGENTS.md` への常時指示追加は、毎回必要なルールに限定する。
7. domain、task catalog、README、skill 一覧の参照を更新する。
8. frontmatter、BOM、参照切れ、移植性、スクリプト挙動を検証する。
9. リクエスト本文の対応記録と `request-index.md` を更新する。

## 16. 作業開始チェックリスト

- [ ] ルート `AGENTS.md` と本手順書を確認した。
- [ ] `git status` と直近の `git log` を確認した。
- [ ] `.codex-python/` を新設しないことを確認した。
- [ ] 作業対象が移植用雛形か保守資料かを判定した。
- [ ] 既存 skill と共通運用ルールを棚卸しした。
- [ ] 改善リクエストとの関係を確認した。
- [ ] 外部仕様を扱う場合の調査方法を決めた。
- [ ] 実案件情報を使用しないことを確認した。

## 17. 完了チェックリスト

- [ ] Python 対応が `.codex-sample/` 内の適切な責務へ配置されている。
- [ ] `codex_config_template.toml` と移植先 `.codex/config.toml` の関係が正しい。
- [ ] 既存 `.codex/config.toml` と `project-local/` の保持方針を壊していない。
- [ ] 既存の業務支援機能を削除・弱体化していない。
- [ ] Python skill と既存 skill の発火境界を確認した。
- [ ] `SKILL.md` の frontmatter と UTF-8 BOM を検査した。
- [ ] skill 名、一覧、task catalog、参照先の整合を確認した。
- [ ] 案件固有情報、認証情報、絶対パスがないことを確認した。
- [ ] 代表シナリオで skill の選択を確認した。
- [ ] 必要な品質監査レポートを `docs/` に作成した。
- [ ] 移植スクリプトへの影響を確認した。
- [ ] 改善リクエストの対応記録と索引を必要に応じて更新した。
