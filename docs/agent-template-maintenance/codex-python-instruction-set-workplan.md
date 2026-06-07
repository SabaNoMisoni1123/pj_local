# `.codex-python` 指示文セット開発 作業計画

作成日: 2026-06-01  
回答反映日: 2026-06-02  
対象: Python によるツール開発向けの Codex / Agent Skills 指示文セット  
想定成果物: `.codex-python/` ディレクトリ配下に集約する移植可能な雛形

## 0. アンケート回答反映サマリー

2026-06-02 に追記されたアンケート回答を踏まえ、初期方針を次のように確定する。

- 想定利用者は、Python を日常利用する研究員本人。Python の基本構文、データサイエンス、分析作業には一定の経験があるが、業務レベルのシステム設計、アーキテクチャ、最新開発動向は Codex が補う。
- Codex に期待する役割は、Python を通じたアプリケーション、システム、CLI ツール開発の全工程支援である。
- 主な対象は、CLI ツール、CSV/Excel/JSON 処理、スクレイピング、データ分析、グラフ化・可視化、API 連携、依存管理、パッケージ化である。
- Python バージョンは 3.11 以上を前提にする。
- 依存管理、テスト、formatter、linter、型チェックは、固定の標準を押し付けずプロジェクトごとに判断する。ただし Linux Ubuntu では `pyenv` を想定し、Windows では回答にある `PIM` を前提候補として扱う。
- `pyproject.toml` は標準前提にしない。既存プロジェクトの構成を優先し、必要時に採用判断を行う。
- スクレイピング支援は初期対象に含める。
- AI 生成コードは保守性を重視し、人間が自力でメンテナンスできるよう、必要十分なコメント、明確な責務分割、実行手順、テスト方針を含める。
- ディレクトリ名は `.agents/skills/` に統一する。`.agent` は誤記として扱う。
- `.codex-python` には移植可能な雛形のみを含める。
- `project-local/` の空テンプレートを含める。
- `.codex-python/config.toml` は Codex 固有設定の最小雛形にする。
- 公開 skill や公開リポジトリは、ライセンスと出典を確認したうえで積極的に参考利用する。長文転載ではなく、必要な要点を独自の運用ルールへ反映する。
- Context7 MCP で確認できない場合は、公式 Web ドキュメントを参照してよい。
- 初期リリースの粒度は「標準」。つまり、AGENTS、主要運用ルール、主要 skill、テンプレート、主要 domain 説明を含める。包括的な evals は初期必須ではない。
- `SKILL.md` は簡潔な運用手順中心にする。
- エージェント向けの `SKILL.md` 本文は英語、それ以外の人間向け説明と出力データは日本語を基本にする。
- `.codex-python` は既存 `.codex-sample` と統合せず、目的の異なる独立雛形として管理する。

## 1. 背景と目的

既存の `.codex-sample` は、シンクタンク・コンサルティング業務で発生する調査、分析、資料作成、レビュー、PMO、情報整理などを支援する汎用的な Codex 向け指示文セットとして整備されている。

今回の `.codex-python` は、その設計経験を Python によるツール開発へ転用し、次のような業務支援を目的とする。

- Python スクリプト、CLI、簡易アプリ、データ処理ツール、検証ツールを短期間で作る。
- 業務データを壊さず、再現可能な処理手順と検証結果を残す。
- ライブラリ選定、依存関係管理、テスト、型、ログ、設定、配布、運用保守の判断を Codex が安定して支援できるようにする。
- 移植先プロジェクトに応じて、最小構成から実務的な Python 開発環境へ段階的に拡張できるようにする。
- 既存 `.codex-sample` と同様、プロジェクト固有情報、認証情報、作業ログ、生成キャッシュを雛形に混入させない。

## 2. 成果物の範囲

### 2.1 作成するもの

`.codex-python/` には、Python ツール開発向けの移植可能な雛形だけを置く。

想定構成:

```text
.codex-python/
├─ README.md
├─ AGENTS.md
├─ config.toml
├─ .agents/
│  ├─ AGENTS.md
│  ├─ README.md
│  └─ skills/
│     ├─ README.md
│     ├─ python-project-intake/
│     │  └─ SKILL.md
│     ├─ python-cli-tool/
│     │  └─ SKILL.md
│     ├─ python-data-processing/
│     │  └─ SKILL.md
│     ├─ python-api-integration/
│     │  └─ SKILL.md
│     ├─ python-web-scraping/
│     │  └─ SKILL.md
│     ├─ python-data-visualization/
│     │  └─ SKILL.md
│     ├─ python-testing/
│     │  └─ SKILL.md
│     ├─ python-typing/
│     │  └─ SKILL.md
│     ├─ python-packaging/
│     │  └─ SKILL.md
│     ├─ python-dependency-management/
│     │  └─ SKILL.md
│     ├─ python-logging-config/
│     │  └─ SKILL.md
│     ├─ python-refactoring/
│     │  └─ SKILL.md
│     ├─ python-code-review/
│     │  └─ SKILL.md
│     ├─ python-debugging/
│     │  └─ SKILL.md
│     ├─ python-documentation/
│     │  └─ SKILL.md
│     └─ python-release-ops/
│        └─ SKILL.md
├─ operating_ja/
│  ├─ README.md
│  ├─ project_intake.md
│  ├─ workflow.md
│  ├─ quality_check.md
│  ├─ dependency_policy.md
│  ├─ testing_policy.md
│  ├─ security_policy.md
│  ├─ data_safety.md
│  ├─ file_io_policy.md
│  ├─ documentation_policy.md
│  └─ agents_update_policy.md
├─ domains_ja/
│  ├─ README.md
│  ├─ task_catalog.md
│  ├─ cli-tools.md
│  ├─ data-processing.md
│  ├─ automation.md
│  ├─ api-integration.md
│  ├─ web-scraping.md
│  ├─ data-visualization.md
│  ├─ analysis-notebooks.md
│  ├─ package-development.md
│  └─ operations-maintenance.md
├─ templates/
│  ├─ project_intake_template.md
│  ├─ tool_spec_template.md
│  ├─ cli_usage_template.md
│  ├─ test_plan_template.md
│  ├─ dependency_decision_template.md
│  ├─ release_note_template.md
│  └─ troubleshooting_note_template.md
└─ project-local/
   ├─ README.md
   ├─ project-context.md
   ├─ dependency-notes.md
   ├─ data-inventory.md
   ├─ runbook.md
   └─ work-log.md
```

### 2.2 作成しないもの

- 特定案件のデータ、顧客名、個人名、メール、URL、認証情報、API キー。
- Codex のセッション、ログ、キャッシュ、DB、一時ファイル。
- 特定プロジェクトでしか使えないローカルパス、仮想環境、実行結果。
- 公開リポジトリや公式ドキュメントを長文で転載した資料。
- 依存ライブラリを固定しすぎる設定。標準候補は示すが、移植先の事情で差し替え可能にする。

## 3. 基本設計方針

### 3.1 既存 `.codex-sample` から引き継ぐ原則

- ルート `AGENTS.md` を常時指示の入口にする。
- Agent Skills は `.agents/skills/{skill-name}/SKILL.md` に置く。
- `SKILL.md` の frontmatter は原則として `name` と `description` のみにする。
- `description` はダブルクォートで囲み、コロンを含む説明でも YAML パースエラーを起こさないようにする。
- 人間向け説明は `domains_ja/`、共通運用ルールは `operating_ja/`、再利用形式は `templates/` に分ける。
- `project-local/` は新規導入直後に使う空テンプレートに限定し、記入後は非移植領域として扱う。
- 生成物は日本語を基本とし、コード、CLI オプション、API 仕様、引用文などは必要に応じて英語を許容する。

### 3.2 Python 開発向けに追加する原則

- 既存コードを読む前に実装方針を固定しない。
- データ破壊を避けるため、入力データの上書き、破壊的変換、削除を既定で禁止する。
- 標準ライブラリで十分な場合は、過剰な依存を追加しない。
- 外部ライブラリ、API、フレームワーク、設定項目に関する提案や実装では、可能な限り Context7 MCP などで最新公式ドキュメントを確認する。
- 依存追加時は、目的、代替案、ライセンス、保守状況、バージョン固定方針、セキュリティリスクを確認する。
- テストは変更リスクに応じて選び、最小でも代表ケース、異常系、入出力の破壊防止を確認する。
- 型ヒント、静的解析、フォーマット、lint はプロジェクト既存の方針を優先する。
- CLI ツールでは、終了コード、標準出力、標準エラー、ヘルプ、dry-run、エンコーディング、パス処理を明示的に扱う。
- 業務データ処理では、文字コード、日付、タイムゾーン、欠損値、重複、単位、丸め、監査可能性を確認する。
- 保守性を重視し、関数・モジュールの責務を明確にする。コメントは処理の意図、制約、注意点が後から分かる粒度で入れ、単にコードを読み上げるだけのコメントは避ける。
- Linux Ubuntu では `pyenv` を想定する。Windows では回答にある `PIM` を前提候補として扱い、具体化時に正式名称・運用方法を確認する。
- `pyproject.toml`、pytest、ruff、mypy、pyright、uv、Poetry などは固定前提にせず、既存プロジェクトと目的に応じて採否を判断する。

## 4. Skill 設計案

### 4.1 初期実装候補

| Skill | 目的 | 主な発火例 |
|---|---|---|
| `python-project-intake` | Python ツール開発の目的、入力、出力、制約、実行環境を整理する | Python ツールを作りたい、要件を整理したい |
| `python-cli-tool` | CLI スクリプト、サブコマンド、オプション、dry-run、ヘルプを設計・実装する | CLI 化、コマンド化、argparse、Typer |
| `python-data-processing` | CSV、Excel、JSON、テキスト、ログなどのデータ変換・集計を安全に実装する | データ変換、集計、整形、突合 |
| `python-api-integration` | 外部 API 連携、認証、リトライ、レート制限、レスポンス検証を扱う | API 連携、HTTP クライアント |
| `python-web-scraping` | 利用規約、robots.txt、負荷、著作権、構造変化に注意しながらスクレイピングを扱う | スクレイピング、Web 収集 |
| `python-data-visualization` | グラフ化、可視化、図表出力、可視化コードの再現性を扱う | グラフ作成、可視化、matplotlib |
| `python-testing` | pytest 等を用いたテスト方針、テスト追加、実行、失敗分析を支援する | テスト追加、pytest、回帰確認 |
| `python-typing` | 型ヒント、mypy/pyright、TypedDict、Protocol、pydantic 等の扱いを支援する | 型を付ける、型エラー修正 |
| `python-dependency-management` | 依存管理、lock、仮想環境、Python バージョン、導入判断を支援する | pyproject、uv、pip、poetry |
| `python-packaging` | パッケージ構成、entry points、配布、内部利用、バージョニングを支援する | パッケージ化、pip install 可能にする |
| `python-logging-config` | logging、設定ファイル、環境変数、実行ログ、エラー出力を整理する | ログを入れる、設定を分離する |
| `python-refactoring` | 既存 Python コードの責務分割、重複削減、可読性改善を行う | リファクタ、整理、関数分割 |
| `python-code-review` | バグ、境界条件、保守性、セキュリティ、テスト不足をレビューする | レビューして、危険箇所を見て |
| `python-debugging` | 例外、再現手順、ログ、最小再現、原因仮説を整理する | エラー修正、原因調査 |
| `python-documentation` | README、使い方、運用手順、関数説明、変更メモを作成する | README 作成、実行手順を書く |
| `python-release-ops` | リリース、配布、バージョン、変更履歴、移行手順を整理する | リリースノート、配布準備 |

### 4.2 後続候補

- `python-notebook-to-script`: notebook の分析手順を再実行可能なスクリプトへ整理する。
- `python-gui-tool`: Tkinter、Streamlit、Gradio などの簡易 UI ツールを扱う。
- `python-sqlite-tool`: SQLite を使ったローカル DB ツールを扱う。
- `python-excel-automation`: openpyxl、xlsxwriter、pandas 等による Excel 入出力を扱う。
- `python-performance-profiling`: 大量データ処理、プロファイル、メモリ使用量、並列化を扱う。
- `python-security-review`: secrets、パストラバーサル、任意コード実行、依存脆弱性などを確認する。

## 5. 公開情報・外部知見の扱い

公開情報を参照する場合は、直接転載ではなく、実務に必要な要点を短く要約して指示文へ落とし込む。

優先する参照元:

- Python 公式ドキュメント。
- Packaging Python 公式ガイド。
- pytest、mypy、pyright、ruff、black、uv、pydantic、requests/httpx、Typer、Click など、採用候補ライブラリの公式ドキュメント。
- OpenAI Codex / Agent Skills 関連の公式ドキュメント。
- セキュリティや秘密情報管理については、公式・準公式の一次情報。

調査時のルール:

- ライブラリ、API、フレームワーク、設定項目は、可能な限り Context7 MCP で最新ドキュメントを確認する。
- Context7 が使えない場合は、公式サイトまたは公式リポジトリを優先し、調査日時と参照先を本環境用の調査メモに残す。
- `.codex-python/` には長い調査レポートを置かない。常時参照すべき短い運用ルールだけを入れる。
- 公開情報を引用する場合は、短い引用に限定し、出典 URL、確認日、利用目的を記録する。

## 6. 作業フェーズ

### Phase 0: 前提確認

目的: `.codex-python` の想定利用範囲、移植先、優先タスクを確定する。

作業:

1. 利用者像を確認する。完了。
2. 主な開発対象を確認する。完了。
3. Python バージョン、OS、パッケージ管理、テスト方針の既定値を確認する。完了。
4. `.agent` と `.agents` のどちらを正式ディレクトリ名にするか確認する。完了。`.agents/skills/` を採用する。
5. 公開 skill の引用・翻案をどこまで許容するか確認する。完了。可能な範囲で積極的に参考利用する。
6. アンケート回答を受け、初期スコープを確定する。完了。

成果物:

- 回答済みアンケート。
- 初期スコープ決定メモ。

### Phase 1: 既存資産の棚卸し

目的: `.codex-sample` から再利用できる構造、ルール、テンプレートを抽出する。

作業:

1. `.codex-sample/AGENTS.md`、`.agents/AGENTS.md`、`.agents/skills/README.md` を確認する。
2. `engineering-support-script` skill を中心に、Python 開発向けへ分割・拡張できる内容を抽出する。
3. `operating_ja/` のうち、Python 開発でも使える運用ルールを分類する。
4. `templates/` のうち、ツール仕様、テスト計画、作業ログへ流用できるものを確認する。
5. 再利用、改変、新規作成、対象外に分類した棚卸し表を作る。

成果物:

- `.codex-sample` 再利用候補一覧。
- `.codex-python` 初期ファイル一覧案。

### Phase 2: 外部仕様・公式情報の確認

目的: Python 開発支援として誤った古い前提を埋め込まない。

作業:

1. Python 公式ドキュメントで、サポート対象バージョン、標準ライブラリ、venv、logging、argparse、tomllib などを確認する。
2. Packaging Python 公式ガイドで、`pyproject.toml`、build backend、entry points、配布の基本を確認する。
3. 採用候補ツールの公式情報を確認する。
4. OpenAI Codex / Agent Skills 関連の公式情報を確認し、`.agents/skills/` 構成の妥当性を再確認する。
5. 調査結果は `.codex-python/` ではなく `docs/agent-template-maintenance/` に保存する。

成果物:

- 公式情報確認メモ。
- 採用候補ツール比較メモ。
- `.codex-python` に反映すべき短いルール案。

### Phase 3: 情報設計

目的: `.codex-python` のディレクトリ構成と責務境界を確定する。

作業:

1. ルート `AGENTS.md` の役割を定義する。
2. `.agents/AGENTS.md` の役割を定義する。
3. `operating_ja/` のファイル構成を確定する。
4. `domains_ja/` の業務カットを確定する。
5. `templates/` の出力形式を確定する。
6. `project-local/` の空テンプレートを確定する。
7. `.codex-python/config.toml` の最小設定案を決める。

成果物:

- `.codex-python` 情報設計書。
- ファイル別責務表。

### Phase 4: 初期ファイル作成

目的: 最小利用可能な `.codex-python` 雛形を作成する。

作業:

1. `.codex-python/README.md` を作成する。
2. `.codex-python/AGENTS.md` を作成する。
3. `.codex-python/config.toml` を作成する。
4. `.codex-python/.agents/AGENTS.md`、`README.md`、`skills/README.md` を作成する。
5. `operating_ja/` の共通運用ルールを作成する。
6. `domains_ja/` の業務カット説明とタスクカタログを作成する。
7. `templates/` の初期テンプレートを作成する。
8. `project-local/` の空テンプレートを作成する。

成果物:

- `.codex-python` 初期雛形。

### Phase 5: 初期 Skill 実装

目的: Python ツール開発の主要タスクを `SKILL.md` として整備する。

作業:

1. 初期実装候補の skill 優先順位を決める。
2. 各 `SKILL.md` に `Purpose`、`When to use`、`Workflow`、`Output`、`Quality Checks`、`Portability` を書く。
3. frontmatter の `name`、`description`、親ディレクトリ名の整合を確認する。
4. `description` に日本語の発火例を含める場合、コロンを含む値は必ずダブルクォートする。
5. コード生成・編集を伴う skill では、既存コード優先、非破壊、検証、依存追加判断を明記する。
6. データ処理系 skill では、入力保全、エンコーディング、欠損値、監査可能性を明記する。

成果物:

- 初期 `SKILL.md` 群。

### Phase 6: テンプレートとサンプル整備

目的: Codex が実務で使いやすい出力形式を持てるようにする。

作業:

1. ツール仕様テンプレートを作成する。
2. CLI 使用説明テンプレートを作成する。
3. テスト計画テンプレートを作成する。
4. 依存追加判断テンプレートを作成する。
5. トラブルシュートメモテンプレートを作成する。
6. リリースノートテンプレートを作成する。
7. 各テンプレートに、プロジェクト固有情報を雛形へ残さない注意を含める。

成果物:

- `templates/*_template.md` 群。

### Phase 7: 品質監査

目的: `.codex-python` が移植可能で、構造的に破綻しておらず、Codex が誤発火しにくい状態にする。

作業:

1. 全 `SKILL.md` の frontmatter を検査する。
2. UTF-8 BOM が混入していないか確認する。
3. `.codex-python` 内に案件固有情報、認証情報、絶対パス、生成ログがないか確認する。
4. `domains_ja/task_catalog.md` と実際の `SKILL.md` の不整合を確認する。
5. skill の粒度が細かすぎる、または重複して発火しやすい箇所を統合する。
6. 初期利用シナリオを 5 件程度用意し、どの skill が使われるべきか確認する。

成果物:

- 品質監査レポート。
- 修正一覧。

### Phase 8: 評価シナリオ整備

目的: 後続の改善時に品質劣化を検出しやすくする。

作業:

1. 高頻度タスクごとに代表プロンプトを作る。
2. 期待する出力品質、確認観点、禁止事項を定義する。
3. 必要に応じて `evals/evals.json` を skill 配下へ追加する。
4. evals を `.codex-python` の移植対象に含めるか、保守資料に留めるかを判断する。

成果物:

- 代表評価シナリオ。
- 必要な `evals/`。

### Phase 9: 導入手順と保守手順の整備

目的: `.codex-python` を別プロジェクトに移植しやすくする。

作業:

1. 標準コピー対象を明記する。
2. 既存 `AGENTS.md` や `.agents/` があるプロジェクトへのマージ手順を作る。
3. 導入直後の初期確認手順を作る。
4. skill 追加・更新時の監査手順を作る。
5. 公開情報やライブラリ情報の更新タイミングを決める。

成果物:

- `.codex-python/README.md` の移植手順。
- 保守手順。

## 7. 初期実装スコープ

初期リリースは「標準」粒度とする。主要な AGENTS、運用ルール、skill、テンプレート、domain 説明を含めるが、evals は初期必須にしない。

### 7.1 初期リリースに含めるもの

- `AGENTS.md`
- `.agents/AGENTS.md`
- `.agents/skills/README.md`
- `README.md`
- `config.toml`
- `operating_ja/workflow.md`
- `operating_ja/quality_check.md`
- `operating_ja/dependency_policy.md`
- `operating_ja/testing_policy.md`
- `operating_ja/data_safety.md`
- `operating_ja/security_policy.md`
- `operating_ja/file_io_policy.md`
- `operating_ja/documentation_policy.md`
- `python-project-intake`
- `python-cli-tool`
- `python-data-processing`
- `python-api-integration`
- `python-web-scraping`
- `python-data-visualization`
- `python-dependency-management`
- `python-packaging`
- `python-testing`
- `python-code-review`
- `domains_ja/README.md`
- `domains_ja/task_catalog.md`
- `domains_ja/cli-tools.md`
- `domains_ja/data-processing.md`
- `domains_ja/api-integration.md`
- `domains_ja/web-scraping.md`
- `domains_ja/data-visualization.md`
- `templates/project_intake_template.md`
- `templates/tool_spec_template.md`
- `templates/cli_usage_template.md`
- `templates/test_plan_template.md`
- `templates/dependency_decision_template.md`
- `project-local/README.md`
- `project-local/project-context.md`
- `project-local/dependency-notes.md`
- `project-local/data-inventory.md`
- `project-local/runbook.md`
- `project-local/work-log.md`

### 7.2 初期リリースでは必要に応じて追加するもの

- `python-typing`
- `python-debugging`
- `python-refactoring`
- `python-logging-config`
- `python-documentation`
- `python-release-ops`
- `python-notebook-to-script`
- `python-gui-tool`
- `python-sqlite-tool`
- `python-excel-automation`
- `python-performance-profiling`
- `python-security-review`
- `templates/release_note_template.md`
- `templates/troubleshooting_note_template.md`
- evals 整備

## 8. 想定リスクと対策

| リスク | 内容 | 対策 |
|---|---|---|
| 過剰設計 | 小規模ツールに不要な構成や依存を押し付ける | 最小構成を既定にし、拡張は条件付きにする |
| 古いライブラリ前提 | 依存管理や設定項目が現行とずれる | Context7 MCP または公式ドキュメント確認を運用ルール化する |
| skill の重複発火 | CLI、データ処理、テストなどが同時に発火しやすい | `When to use` と `When not to use` を明確化する |
| 案件情報の混入 | 雛形に実案件メモや実データ名が残る | 監査で固有名詞、絶対パス、URL、認証情報を確認する |
| 依存追加の乱発 | 目的に対して重いライブラリを追加する | 依存追加判断テンプレートを使う |
| 破壊的データ処理 | 入力ファイル上書きや削除が発生する | dry-run、新規出力、バックアップ、明示承認を運用ルール化する |
| テスト不足 | 生成コードが業務データで失敗する | 代表ケース、異常系、入出力保全を最低確認にする |
| セキュリティ不備 | API キー、任意コード実行、パストラバーサル等 | security policy と code review skill に確認項目を入れる |

## 9. 作業順序案

1. アンケートへの回答を受ける。完了。
2. `.agents/skills/` を正式方針として確定する。完了。
3. Python 3.11 以上、依存管理・テスト・lint・型チェックはプロジェクト判断、`pyproject.toml` 非前提として確定する。完了。
4. 既存 `.codex-sample` の再利用候補を棚卸しする。
5. 公式情報確認メモを作る。
6. `.codex-python` の情報設計書を作る。
7. `.codex-python` の初期ディレクトリと基本ファイルを作る。
8. 初期リリース対象の skill とテンプレートを作る。
9. 品質監査を実施し、frontmatter、BOM、固有情報混入を確認する。
10. 必要に応じて追加 skill、evals、保守手順を整備する。

## 10. 完了条件

初期リリースの完了条件:

- `.codex-python/README.md` に導入手順、標準コピー対象、非移植対象が書かれている。
- `.codex-python/AGENTS.md` が Python ツール開発向けの常時指示として機能する。
- `.codex-python/.agents/skills/` に初期リリース対象の `SKILL.md` が揃っている。
- `operating_ja/` に、依存管理、テスト、データ安全、品質確認の最低限のルールがある。
- `templates/` に、プロジェクト整理、ツール仕様、CLI 使用説明、テスト計画、依存追加判断のテンプレートがある。
- `project-local/` は空テンプレートのみで、実案件情報が入っていない。
- 全 `SKILL.md` の frontmatter が `name` と `description` を持ち、親ディレクトリ名と整合している。
- UTF-8 BOM がない。
- 案件固有情報、認証情報、絶対パス、生成ログが混入していない。
- 代表シナリオで、どの skill が使われるべきか説明できる。

## 11. 次アクション

次に行うべきことは、`.codex-python` 情報設計書を作成し、初期リリース対象ファイルを確定することである。

以下の順で実作業に入る。

1. `.codex-python` 情報設計書を作成する。
2. 初期リリース対象のファイル一覧を確定する。
3. `.codex-python` の初期ディレクトリを作成する。
4. 初期対象の `AGENTS.md`、運用ルール、skill、テンプレートを実装する。
5. 品質監査レポートを作成する。
