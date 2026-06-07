# タスクカタログ

このカタログは、人間が主要タスクを把握するための代表例です。
skill の正式な発見単位は `../.agents/skills/*/SKILL.md` であり、この表に未掲載の skill も有効です。

| 業務カット | タスク | skill | 主な入力 | 主な出力 |
|---|---|---|---|---|
| 業務推進・PMO | TODO管理 | `project-management-todo` | 議事録、メール、資料 | TODO CSV |
| 業務推進・PMO | 課題・リスク管理 | `project-management-risk-issue` | 課題表、議事録、メール | リスク表、課題表 |
| 業務推進・PMO | 作業方針整理 | `project-management-workplan` | 状況メモ、制約、目標 | 作業計画 |
| 業務推進・PMO | 決定事項管理 | `project-management-decision-log` | 議事録、メール、資料 | 決定事項一覧 |
| 業務推進・PMO | 会議後フォロー | `project-management-meeting-followup` | 議事録、メモ、メール | TODO、未決事項、次アクション |
| 情報整理 | メールスレッド整理 | `information-organization-email-thread` | `.eml`, `_mail.yml` | 時系列、決定事項、未決事項 |
| 情報整理 | 根拠整理 | `information-organization-evidence-trace` | 任意資料 | 根拠表、確認事項 |
| 情報整理 | 用語集作成 | `information-organization-glossary` | プロジェクト資料、議事録、メール、公開情報 | 用語集、略語集、表記統一案 |
| 情報整理 | ファイル索引・プロジェクト索引 | `information-organization-project-index` | プロジェクト内ファイル | ファイル索引、資料索引、アクセスマップ |
| 情報整理 | ファイル名インデックス | `information-organization-file-name-index` | プロジェクト内ファイル名・フォルダ名 | AIエージェント向け日本語メモ |
| 情報整理 | project context作成 | `information-organization-project-context` | プロジェクト資料一式 | project context |
| 文書校閲 | 整合性チェック | `document-review-consistency` | 報告書、仕様書、資料 | 指摘表 |
| 文書校閲 | 品質チェック | `document-review-quality-check` | 成果物、レビュー対象 | 品質チェック結果 |
| 文書校閲 | ロジック・構成レビュー | `document-review-logic-structure` | 報告書、スライド、提案書、メモ | 論理構成レビュー、修正提案 |
| 資料作成 | 報告書案作成 | `document-production-report-draft` | 資料、論点、根拠 | 報告書案 |
| 資料作成 | 議事録作成 | `document-production-minutes` | メモ、録音文字起こし、会議資料 | 議事録案 |
| 資料作成 | スライド構成案作成 | `document-production-slide-outline` | 目的、論点、根拠、説明対象 | スライド別アウトライン、図表案 |
| コミュニケーション | メール文案作成 | `communication-email-draft` | 背景、宛先、目的 | メール案 |
| コミュニケーション | 会議アジェンダ作成 | `communication-meeting-agenda` | 会議目的、参加者、論点、資料 | アジェンダ、事前依頼、確認事項 |
| 調査・分析 | 論点構造化 | `research-analysis-issue-structuring` | 目的、背景、制約、既存資料 | 論点体系、仮説、分析設計 |
| 調査・分析 | ヒアリング設計 | `research-analysis-interview-design` | 調査目的、対象者、論点、仮説 | ヒアリング項目、質問票、記録観点 |
| 調査・分析 | 統計・数値表整理 | `research-analysis-statistics-table` | 統計表、Excel、CSV、公開データ | 指標定義、比較表、数値サマリー |
| 調査・分析 | 公開情報調査 | `research-analysis-public-info` | 公開情報、文献、統計、外部資料 | 調査メモ、比較表、論点整理 |
| AI運用 | プロンプト作成 | `ai-operations-prompt-drafting` | 目的、資料、制約 | AI向け指示文 |
| AI運用 | AGENTS更新提案 | `ai-operations-agents-update` | 既存AGENTS、変更方針 | 更新提案 |
| AI運用 | Codex改善リクエスト | `ai-operations-change-request` | 改善要望、業務利用時の課題、既存設定 | 改善リクエスト、反映管理メモ |
| AI運用 | skill設計 | `ai-operations-skill-design` | 業務要件、既存skill | skill設計案 |
| 開発・ツール支援 | 簡易スクリプト作成 | `engineering-support-script` | 入力データ、既存コード、処理要件 | スクリプト、変換結果、検証メモ |
| 開発・ツール支援 | Pythonツール要件整理 | `python-project-intake` | 目的、利用者、入出力、実行環境、制約 | ツール仕様、確認事項、完了条件 |
| 開発・ツール支援 | Python CLI開発 | `python-cli-tool` | コマンド要件、既存コード | CLI、help、終了コード、利用手順 |
| 開発・ツール支援 | Pythonデータ処理 | `python-data-processing` | CSV、Excel、JSON、データ定義 | 非破壊の変換処理、出力、検証結果 |
| 開発・ツール支援 | 外部API連携 | `python-api-integration` | API仕様、認証方式、入出力要件 | APIクライアント、エラー処理、運用手順 |
| 開発・ツール支援 | Webスクレイピング | `python-web-scraping` | 対象URL、利用条件、取得項目 | 収集コード、保存データ、負荷・規約確認 |
| 開発・ツール支援 | データ可視化 | `python-data-visualization` | データ、指標定義、表示要件 | 再現可能な図表、生成コード |
| 開発・ツール支援 | Python依存管理 | `python-dependency-management` | 既存構成、導入候補、互換性要件 | 依存判断、設定差分、再現手順 |
| 開発・ツール支援 | Pythonパッケージ化 | `python-packaging` | 既存ツール、配布対象、導入要件 | パッケージ設定、entry point、導入・削除手順 |
| 開発・ツール支援 | Pythonテスト | `python-testing` | 実装、仕様、リスク | テスト計画、テストコード、実行結果 |
| 開発・ツール支援 | Pythonコードレビュー | `python-code-review` | Pythonコード、差分、テスト | 重要度順の指摘、残存リスク |
| ビジュアル制作 | 図解作成 | `visual-production-diagram` | 論点、構成案、根拠資料 | 図解案、Mermaid図、画像生成プロンプト |
