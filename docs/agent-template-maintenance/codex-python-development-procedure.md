# `.codex-python` 開発手順書

作成日: 2026-06-07  
対象: Python ツール開発向け Codex / Agent Skills 指示文セット  
成果物配置先: `.codex-python/`  
保守資料配置先: `docs/agent-template-maintenance/`

## 1. 目的

本手順書は、`.codex-python` を移植可能な雛形として設計、実装、監査するための実行手順を定める。

作業計画は `codex-python-instruction-set-workplan.md`、確定済みの初期スコープは `codex-python-initial-scope-20260602.md` を正本として参照する。本手順書は、それらを実際の開発作業へ落とし込むための順序、成果物、確認方法を示す。

## 2. 基本ルール

### 2.1 配置ルール

- 移植先プロジェクトでそのまま使う雛形だけを `.codex-python/` に置く。
- 調査結果、比較表、設計検討、監査レポート、作業記録は `docs/agent-template-maintenance/` に置く。
- 実案件の情報、認証情報、ローカル絶対パス、実データ、実行ログ、キャッシュは `.codex-python/` に置かない。
- `project-local/` には、新規導入時に空で使うテンプレートだけを置く。

### 2.2 言語ルール

- `SKILL.md` などエージェント向け指示は英語で作成する。
- `README.md`、`operating_ja/`、`domains_ja/`、`templates/`、`project-local/` は日本語で作成する。
- コード、コマンド、設定キー、API 名、ライブラリ名は原表記を使う。

### 2.3 ファイルルール

- テキストファイルは UTF-8、BOM なしで保存する。
- `SKILL.md` の YAML frontmatter は原則として `name` と `description` のみにする。
- `description` はダブルクォートで囲む。
- `name`、親ディレクトリ名、一覧上の skill 名を一致させる。
- 既存ファイルを変更する場合は、利用者の変更を消さず、必要な箇所だけを編集する。

### 2.4 技術判断ルール

- Python 3.11 以上を対象にする。
- `pyproject.toml`、依存管理、テスト、formatter、linter、型チェックの方式は固定しない。
- 既存プロジェクトの構成と目的を確認してから採用方式を決める。
- ライブラリ、API、フレームワーク、設定項目は、可能な限り Context7 MCP で最新公式情報を確認する。
- Context7 MCP で確認できない場合は、公式ドキュメントまたは公式リポジトリを参照する。
- 公開 skill や公開リポジトリを利用する場合は、ライセンス、出典、改変範囲を記録する。

## 3. 全体工程

| 工程 | 内容 | 主な成果物 |
|---|---|---|
| 0 | 開始前確認 | 前提確認結果 |
| 1 | 既存資産の棚卸し | 再利用候補一覧 |
| 2 | 公式情報・公開資産の調査 | 公式情報確認メモ、公開資産調査メモ |
| 3 | 情報設計 | 情報設計書、ファイル責務表 |
| 4 | 基盤ファイル実装 | README、AGENTS、config、管理文書 |
| 5 | 共通運用ルール実装 | `operating_ja/` |
| 6 | domain 説明実装 | `domains_ja/` |
| 7 | skill 実装 | 初期 `SKILL.md` 群 |
| 8 | テンプレート実装 | `templates/`、`project-local/` |
| 9 | 構造・内容監査 | 監査レポート、修正結果 |
| 10 | 移植確認 | 導入手順、最終確認結果 |

各工程は、直前の工程の完了条件を満たしてから開始する。

## 4. 工程0: 開始前確認

### 入力

- `codex-python-questionnaire.md`
- `codex-python-initial-scope-20260602.md`
- `codex-python-instruction-set-workplan.md`
- ルート `AGENTS.md`

### 作業

1. 初期対象の利用者、タスク、言語、技術方針を再確認する。
2. `.agents/skills/` を正式配置先として扱う。
3. `.codex-python` と `.codex-sample` を統合しないことを確認する。
4. 初期対象ファイルの追加・削除が必要になっていないか確認する。
5. Windows 環境の `PIM` が何を指すか、実装に影響する時点で確認事項として記録する。

### 成果物

- 必要に応じて更新した初期スコープ決定メモ。
- 未決事項一覧。

### 完了条件

- 初期リリース対象ファイルが列挙されている。
- 未決事項が実装を妨げるか判定されている。
- 実装を妨げない未決事項は、仮定と確認時期が記録されている。

## 5. 工程1: 既存資産の棚卸し

### 入力

- `.codex-sample/AGENTS.md`
- `.codex-sample/.agents/AGENTS.md`
- `.codex-sample/.agents/skills/README.md`
- `.codex-sample/.agents/skills/engineering-support-script/SKILL.md`
- `.codex-sample/operating_ja/`
- `.codex-sample/templates/`
- 過去の監査レポート

### 作業

1. `.codex-sample` の対象ファイルを一覧化する。
2. 各ファイルを次の区分に分類する。
   - 構造のみ再利用
   - 内容を改変して再利用
   - Python 向けに新規作成
   - 対象外
3. 共通化できるルールと、Python 固有に書き直すルールを分ける。
4. `engineering-support-script` の内容を、各 Python skill へ分割できる要素に整理する。
5. `.codex-sample` 固有の業務支援表現が `.codex-python` に流入しないよう確認する。

### 成果物

`docs/agent-template-maintenance/codex-python-existing-assets-inventory.md`

最低限、次の列を持つ表を作る。

| 既存ファイル | 区分 | 再利用先 | 再利用内容 | 注意事項 |
|---|---|---|---|---|

### 完了条件

- 初期リリース対象ファイルごとに、再利用元または新規作成の判断がある。
- `.codex-sample` との統合を前提とする記述がない。
- 案件固有情報を再利用対象に含めていない。

## 6. 工程2: 公式情報・公開資産の調査

### 入力

- 初期 skill 一覧
- 既存資産棚卸し結果

### 調査対象

- Python 3.11 以降の公式ドキュメント
- Python Packaging User Guide
- OpenAI Codex の公式ドキュメント
- Agent Skills の公式仕様
- CLI、API、スクレイピング、データ処理、可視化、テスト、依存管理、パッケージ化に関する公式情報
- 公開されている関連 skill、テンプレート、ガイド

### 作業

1. Context7 MCP で対象ライブラリや仕様の最新情報を確認する。
2. Context7 MCP で確認できない対象は、公式 Web ドキュメントまたは公式リポジトリで確認する。
3. 調査項目ごとに次を記録する。
   - 確認対象
   - 確認日
   - 公式 URL
   - `.codex-python` に反映する要点
   - バージョン依存事項
4. 公開 skill や公開リポジトリについて次を確認する。
   - ライセンス
   - 著作権表示
   - 引用・改変条件
   - 直接利用するか、考え方のみ参考にするか
5. 長文転載を避け、運用ルールに必要な内容だけを要約する。

### 成果物

- `docs/agent-template-maintenance/codex-python-official-docs-research.md`
- `docs/agent-template-maintenance/codex-python-public-assets-research.md`

### 完了条件

- 初期 skill の主要技術領域について一次情報を確認している。
- 採用候補を固定標準として扱うべきでない箇所が明記されている。
- 公開資産のライセンス確認結果が記録されている。
- `.codex-python` に転載すべきでない調査情報が分離されている。

## 7. 工程3: 情報設計

### 入力

- 初期スコープ決定メモ
- 既存資産棚卸し
- 公式情報・公開資産の調査結果

### 作業

1. ディレクトリごとの責務を確定する。
2. ルート `AGENTS.md` と各補助文書の指示優先順位を定義する。
3. 各初期 skill の対象範囲と対象外を定義する。
4. skill が重複して発火しそうな組み合わせを整理する。
5. 人間向け文書とエージェント向け文書の言語を確定する。
6. `.codex-python` の移植対象と非移植対象を明記する。
7. 各ファイルが参照する文書を定義し、循環参照や参照切れを防ぐ。

### skill 境界の確認例

| 主タスク | 主に使う skill | 補助的に使う skill |
|---|---|---|
| CSV を変換する CLI | `python-data-processing` | `python-cli-tool`、`python-testing` |
| API データ取得 CLI | `python-api-integration` | `python-cli-tool`、`python-dependency-management` |
| Web ページ収集 | `python-web-scraping` | `python-data-processing`、`python-testing` |
| グラフ作成ツール | `python-data-visualization` | `python-data-processing`、`python-cli-tool` |
| 配布可能な CLI | `python-packaging` | `python-cli-tool`、`python-dependency-management` |

### 成果物

- `docs/agent-template-maintenance/codex-python-information-architecture.md`
- 同文書内のファイル責務表、参照関係表、skill 境界表

### 完了条件

- 初期リリース対象の全ファイルに責務が割り当てられている。
- 同じルールを複数箇所へ重複記載する必要がない構造になっている。
- skill の主対象、対象外、補助関係が説明できる。
- 実装順序が確定している。

## 8. 工程4: 基盤ファイル実装

### 実装順序

1. `.codex-python/README.md`
2. `.codex-python/AGENTS.md`
3. `.codex-python/config.toml`
4. `.codex-python/.agents/AGENTS.md`
5. `.codex-python/.agents/README.md`
6. `.codex-python/.agents/skills/README.md`

### 作業

1. 必要なディレクトリを作成する。
2. `README.md` に目的、構成、移植手順、コピー対象、非移植対象を書く。
3. `AGENTS.md` に常時適用する Python 開発ルールを書く。
4. `config.toml` は最小雛形とし、環境依存の値を固定しない。
5. `.agents/AGENTS.md` に skill の設計、追加、更新、監査ルールを書く。
6. `.agents/skills/README.md` に skill の探索方法と追加方法を書く。

### `AGENTS.md` に含める主要事項

- 日本語出力の原則と例外
- 既存コード・設定の優先
- Python 3.11 以上
- プロジェクトごとのツール選定
- 最新公式ドキュメントの確認
- 非破壊的なファイル操作
- 保守性、コメント、テスト、検証
- secrets と個人情報の禁止
- `.agents/skills/` の利用方法
- `operating_ja/` の参照方法

### 完了条件

- 6 ファイルが作成されている。
- ルート文書から主要運用ルールと skill 管理文書へ到達できる。
- 実案件情報や環境固有の絶対パスが含まれていない。
- `config.toml` が特定環境の設定を強制していない。

## 9. 工程5: 共通運用ルール実装

### 実装対象

- `operating_ja/README.md`
- `workflow.md`
- `quality_check.md`
- `dependency_policy.md`
- `testing_policy.md`
- `security_policy.md`
- `data_safety.md`
- `file_io_policy.md`
- `documentation_policy.md`
- `agents_update_policy.md`

### 作業

1. 各文書の責務を情報設計書と照合する。
2. 共通ルールは `operating_ja/` に一度だけ記載する。
3. skill 側には、該当する共通ルールへの短い参照を書く。
4. 特定ツールの採用を強制せず、選定条件を書く。
5. コメント方針は「量」ではなく「意図、制約、非自明な判断を残す」ことを基準にする。

### 完了条件

- すべての対象文書が作成されている。
- ルール間に矛盾がない。
- `pyproject.toml`、pytest、ruff、mypy、uv などを無条件に必須としていない。
- データ保全、認証情報、依存追加、テスト、文書化の最低基準がある。

## 10. 工程6: domain 説明実装

### 実装対象

- `domains_ja/README.md`
- `task_catalog.md`
- `cli-tools.md`
- `data-processing.md`
- `api-integration.md`
- `web-scraping.md`
- `data-visualization.md`
- `package-development.md`
- `operations-maintenance.md`

### 作業

1. 各 domain の目的、代表タスク、利用する skill、注意事項を書く。
2. `task_catalog.md` に人間向けのタスク一覧を作る。
3. 正式な skill 登録簿は `.agents/skills/*/SKILL.md` であり、`task_catalog.md` は説明用であることを明記する。
4. domain と skill の名称・参照先を一致させる。

### 完了条件

- 初期 skill が少なくとも1つの domain から参照されている。
- 存在しない skill への参照がない。
- domain 文書に実装手順を重複記載していない。

## 11. 工程7: skill 実装

### 実装順序

1. `python-project-intake`
2. `python-cli-tool`
3. `python-data-processing`
4. `python-api-integration`
5. `python-web-scraping`
6. `python-data-visualization`
7. `python-dependency-management`
8. `python-packaging`
9. `python-testing`
10. `python-code-review`

### 標準構成

```markdown
---
name: python-example
description: "Use when ..."
---

# Python Example

## Purpose

## When to Use

## Workflow

## Output

## Quality Checks

## Portability
```

### 作業

1. `description` に英語の用途説明と必要な日本語トリガーを含める。
2. `When to Use` で対象タスクを明確にする。
3. 必要な場合は `When Not to Use` で隣接 skill との境界を示す。
4. `Workflow` は簡潔な実行手順にする。
5. `Quality Checks` に、その skill 固有の確認事項だけを書く。
6. 共通ルールは `operating_ja/` を参照し、重複を避ける。
7. `Portability` に案件固有情報を保存しないことを書く。

### skill 固有の必須観点

| Skill | 必須観点 |
|---|---|
| `python-project-intake` | 目的、利用者、入力、出力、実行環境、制約、完了条件 |
| `python-cli-tool` | help、終了コード、stdout/stderr、dry-run、パス、エンコーディング |
| `python-data-processing` | 入力保全、欠損、重複、型、日付、単位、出力検証 |
| `python-api-integration` | 認証、timeout、retry、rate limit、エラー応答、秘密情報 |
| `python-web-scraping` | 利用規約、robots.txt、負荷、著作権、構造変化 |
| `python-data-visualization` | データ定義、単位、軸、凡例、再現性、出力形式 |
| `python-dependency-management` | 導入理由、代替、互換性、ライセンス、固定方法 |
| `python-packaging` | 配布対象、entry point、バージョン、依存、導入・削除手順 |
| `python-testing` | リスク、代表ケース、異常系、境界値、再現方法 |
| `python-code-review` | バグ、保守性、セキュリティ、データ破壊、テスト不足 |

### 完了条件

- 10 個の `SKILL.md` が作成されている。
- frontmatter が正しく、ディレクトリ名と `name` が一致している。
- 各 skill の発火条件が区別できる。
- 本文が英語で、簡潔な運用手順になっている。

## 12. 工程8: テンプレートと `project-local` 実装

### テンプレート

- `templates/project_intake_template.md`
- `templates/tool_spec_template.md`
- `templates/cli_usage_template.md`
- `templates/test_plan_template.md`
- `templates/dependency_decision_template.md`

### `project-local`

- `project-local/README.md`
- `project-context.md`
- `dependency-notes.md`
- `data-inventory.md`
- `runbook.md`
- `work-log.md`

### 作業

1. テンプレートは記入欄と確認項目を中心にする。
2. 特定案件のサンプル値を入れない。
3. `project-local/README.md` に、記入後は非移植領域になることを書く。
4. `data-inventory.md` に、入力元、形式、文字コード、機密性、更新頻度、出力先を記録できる欄を設ける。
5. `runbook.md` に、前提、実行方法、確認方法、復旧方法を記録できる欄を設ける。

### 完了条件

- 対象テンプレートがすべて作成されている。
- 実案件情報が含まれていない。
- 各テンプレートの用途と保存先が説明されている。

## 13. 工程9: 品質監査

### 監査項目

1. ファイル構成
2. frontmatter
3. 文字コード
4. skill 名の整合
5. 参照先の存在
6. 言語方針
7. 移植性
8. 機密情報
9. 重複・矛盾
10. skill の発火境界

### 確認方法

```bash
find .codex-python -type f | sort
rg -n "^name:|^description:" .codex-python/.agents/skills
rg -n "/home/|C:\\\\|api[_-]?key|secret|token|password" .codex-python
```

必要に応じて、次も確認する。

- 全 `SKILL.md` の先頭3バイトに UTF-8 BOM がないこと。
- YAML frontmatter がパース可能であること。
- `domains_ja/task_catalog.md` の skill 名が実在すること。
- README や AGENTS の参照先が実在すること。
- `.codex-python` にログ、キャッシュ、DB、一時ファイルがないこと。

### 代表シナリオ

少なくとも次の依頼を用意し、主に発火すべき skill を確認する。

1. CSV を読み込み、列を加工して別ファイルへ出力する CLI を作る。
2. Web API からデータを取得し、JSON を保存する CLI を作る。
3. Web ページから表を収集し、アクセス間隔を設定する。
4. Excel データを集計し、グラフ画像を出力する。
5. 既存 CLI をパッケージ化し、導入手順とテストを追加する。

### 成果物

`docs/agent-template-maintenance/codex-python-quality-audit-YYYYMMDD.md`

### 完了条件

- 重大または中程度の問題が残っていない。
- 軽微な未対応事項は、理由と後続対応を記録している。
- UTF-8 BOM、frontmatter、参照切れ、案件固有情報の検査が完了している。

## 14. 工程10: 移植確認

### 作業

1. `.codex-python` を仮の空プロジェクトへ移植する想定でコピー対象を確認する。
2. 移植後の配置を確認する。
   - `.codex-python/AGENTS.md` → プロジェクトルートの `AGENTS.md`
   - `.codex-python/.agents/` → プロジェクトルートの `.agents/`
   - `.codex-python/config.toml` → 必要に応じて `.codex/config.toml`
   - その他の共通ディレクトリ → プロジェクトルート
3. 既存 `AGENTS.md`、`.agents/`、README がある場合のマージ手順を確認する。
4. `project-local/` が新規導入時に空であることを確認する。
5. 導入後に最初に実施する project intake の手順を確認する。

### 完了条件

- `README.md` だけで移植対象と配置先を判断できる。
- 既存ファイルを無条件に上書きする手順になっていない。
- 移植後に skill を探索できる。
- `.codex-python` 固有の保守資料を移植対象に含めていない。

## 15. 変更管理

初期リリース後にファイルを追加・変更する場合は、次の順で行う。

1. 変更理由と対象タスクを確認する。
2. 既存 skill や運用ルールへの追加で対応できないか確認する。
3. 新規 skill が必要な場合は、既存 skill との発火境界を定義する。
4. `AGENTS.md` に常時指示を追加する必要性を慎重に判断する。
5. domain、task catalog、README の参照を更新する。
6. frontmatter、BOM、参照切れ、移植性を再監査する。
7. 変更内容を本環境用の監査レポートへ記録する。

## 16. 実行開始時のチェックリスト

- [ ] ルート `AGENTS.md` を確認した。
- [ ] 初期スコープ決定メモを確認した。
- [ ] 作業対象が雛形か保守資料かを判定した。
- [ ] 作業成果物の保存先を決めた。
- [ ] 既存ファイルと未コミット変更を確認した。
- [ ] 外部仕様を扱う場合の調査方法を決めた。
- [ ] 実案件情報を使用しないことを確認した。

## 17. 初期リリース完了チェックリスト

- [ ] 基盤ファイルが揃っている。
- [ ] 共通運用ルールが揃っている。
- [ ] domain 説明が揃っている。
- [ ] 初期 skill 10件が揃っている。
- [ ] テンプレートと `project-local` の空雛形が揃っている。
- [ ] 全 `SKILL.md` の frontmatter を検査した。
- [ ] UTF-8 BOM がないことを確認した。
- [ ] skill 名とディレクトリ名の整合を確認した。
- [ ] 参照切れがないことを確認した。
- [ ] 案件固有情報や認証情報がないことを確認した。
- [ ] 代表シナリオで skill の発火境界を確認した。
- [ ] 品質監査レポートを作成した。
- [ ] 移植手順を確認した。
