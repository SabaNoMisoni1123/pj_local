# `.codex-python` 初期スコープ決定メモ

作成日: 2026-06-02  
根拠: `docs/agent-template-maintenance/codex-python-questionnaire.md` への回答

## 1. 決定事項

`.codex-python` は、Python によるツール開発を支援する独立した Codex / Agent Skills 向け雛形として作成する。既存 `.codex-sample` とは統合せず、構成思想のみを参考にする。

初期リリースの粒度は「標準」とする。AGENTS、主要運用ルール、主要 skill、テンプレート、主要 domain 説明を含めるが、evals は初期必須にしない。

## 2. 利用者像

- 利用者は研究員本人。
- Python は日常利用しており、中級から上級程度を想定する。
- 基本構文、データサイエンス、分析作業には知識がある。
- 業務レベルのシステム設計、アーキテクチャ、最新開発動向は Codex が補助する。
- Codex には、Python を通じたアプリケーション、システム、CLI ツール開発の全工程支援を期待する。

## 3. 主な対象タスク

初期リリースで重視する対象は次のとおり。

- CLI ツール作成
- CSV/Excel/JSON データ処理
- API 連携
- 依存管理
- パッケージ化
- スクレイピング
- データ分析
- グラフ化・可視化

## 4. 技術方針

- Python は 3.11 以上を前提にする。
- `pyproject.toml` は標準前提にしない。
- 依存管理、テスト、formatter、linter、型チェックはプロジェクトごとに判断する。
- Linux Ubuntu 環境では `pyenv` を想定する。
- Windows 環境では回答にある `PIM` を前提候補として扱う。具体化時には正式名称と運用方法を確認する。
- 外部ライブラリ、API、フレームワーク、設定項目は、可能な限り Context7 MCP で最新ドキュメントを確認する。
- Context7 MCP で確認できない場合は、公式 Web ドキュメントを参照する。

## 5. 安全性・保守性

- 入力データの上書き、破壊的変換、削除を既定で避ける。
- CLI では、ヘルプ、終了コード、標準出力、標準エラー、dry-run、エンコーディング、パス処理を明示的に扱う。
- スクレイピングでは、利用規約、robots.txt、アクセス負荷、著作権、取得元の構造変化を確認する。
- AI 生成コードは保守性を重視する。
- コメントは、後から人間が保守できるように、処理の意図、制約、注意点を説明する粒度で入れる。
- コードをそのまま読み上げるだけのコメントは避ける。

## 6. ディレクトリ方針

- `.agents/skills/` を正式採用する。
- `.agent` は誤記として扱う。
- `.codex-python` には移植可能な雛形のみを置く。
- `project-local/` の空テンプレートを含める。
- `.codex-python/config.toml` は Codex 固有設定の最小雛形にする。
- 実案件情報、認証情報、実データ名、作業ログ、生成キャッシュは `.codex-python` に入れない。

## 7. 言語方針

- `SKILL.md` などエージェント向けの指示は英語を基本にする。
- `README.md`、`operating_ja/`、`domains_ja/`、`templates/`、出力データは日本語を基本にする。
- コード、CLI オプション、API 名、設定キー、引用文は必要に応じて英語を使う。

## 8. 初期リリース対象ファイル

### 8.1 ルート

- `.codex-python/README.md`
- `.codex-python/AGENTS.md`
- `.codex-python/config.toml`

### 8.2 `.agents`

- `.codex-python/.agents/AGENTS.md`
- `.codex-python/.agents/README.md`
- `.codex-python/.agents/skills/README.md`

### 8.3 初期 skill

- `.codex-python/.agents/skills/python-project-intake/SKILL.md`
- `.codex-python/.agents/skills/python-cli-tool/SKILL.md`
- `.codex-python/.agents/skills/python-data-processing/SKILL.md`
- `.codex-python/.agents/skills/python-api-integration/SKILL.md`
- `.codex-python/.agents/skills/python-web-scraping/SKILL.md`
- `.codex-python/.agents/skills/python-data-visualization/SKILL.md`
- `.codex-python/.agents/skills/python-dependency-management/SKILL.md`
- `.codex-python/.agents/skills/python-packaging/SKILL.md`
- `.codex-python/.agents/skills/python-testing/SKILL.md`
- `.codex-python/.agents/skills/python-code-review/SKILL.md`

### 8.4 運用ルール

- `.codex-python/operating_ja/README.md`
- `.codex-python/operating_ja/workflow.md`
- `.codex-python/operating_ja/quality_check.md`
- `.codex-python/operating_ja/dependency_policy.md`
- `.codex-python/operating_ja/testing_policy.md`
- `.codex-python/operating_ja/security_policy.md`
- `.codex-python/operating_ja/data_safety.md`
- `.codex-python/operating_ja/file_io_policy.md`
- `.codex-python/operating_ja/documentation_policy.md`
- `.codex-python/operating_ja/agents_update_policy.md`

### 8.5 domain 説明

- `.codex-python/domains_ja/README.md`
- `.codex-python/domains_ja/task_catalog.md`
- `.codex-python/domains_ja/cli-tools.md`
- `.codex-python/domains_ja/data-processing.md`
- `.codex-python/domains_ja/api-integration.md`
- `.codex-python/domains_ja/web-scraping.md`
- `.codex-python/domains_ja/data-visualization.md`
- `.codex-python/domains_ja/package-development.md`
- `.codex-python/domains_ja/operations-maintenance.md`

### 8.6 テンプレート

- `.codex-python/templates/project_intake_template.md`
- `.codex-python/templates/tool_spec_template.md`
- `.codex-python/templates/cli_usage_template.md`
- `.codex-python/templates/test_plan_template.md`
- `.codex-python/templates/dependency_decision_template.md`

### 8.7 `project-local` 空テンプレート

- `.codex-python/project-local/README.md`
- `.codex-python/project-local/project-context.md`
- `.codex-python/project-local/dependency-notes.md`
- `.codex-python/project-local/data-inventory.md`
- `.codex-python/project-local/runbook.md`
- `.codex-python/project-local/work-log.md`

## 9. 初期対象外

次は初期リリースでは必須にせず、必要なタイミングで追加する。

- evals
- notebook から script への整理
- GUI ツール
- SQLite ツール
- Excel 専用自動化
- パフォーマンスプロファイリング
- セキュリティレビュー専用 skill
- リリース運用専用 skill
- 詳細なトラブルシュートテンプレート

## 10. 次アクション

1. `.codex-python` 情報設計書を作成する。
2. 初期リリース対象ファイルの責務表を作る。
3. 公式情報確認メモを作る。
4. `.codex-python` の初期ディレクトリとファイルを作成する。
5. 品質監査を実施する。
