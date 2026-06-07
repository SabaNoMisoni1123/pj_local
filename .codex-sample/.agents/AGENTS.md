# .agents 管理方針

このディレクトリは、移植先プロジェクトで AI エージェントが業務支援タスクを再現可能に実行するための命令セットを格納します。常時適用されるルールはルート `AGENTS.md` に置き、特定タスクだけで使う手順は `.agents/skills/<skill-name>/SKILL.md` に分離します。

## 役割分担

- ルート `AGENTS.md`: 全作業に常時適用する言語、保存先、禁止事項、検証、スキル探索ルール。
- `.agents/AGENTS.md`: `.agents` 全体の設計思想、索引、保守方針、監査手順。
- `.agents/README.md`: 人間向けの短い案内。
- `.agents/skills/*/SKILL.md`: 発火条件、入力、手順、出力、品質確認を持つ小さな再利用ワークフロー。

## スキル一覧

| Skill | 用途 |
|---|---|
| `ai-operations-agents-update` | `AGENTS.md` やプロジェクト向けエージェント運用ルールの作成・更新提案。 |
| `ai-operations-change-request` | Codex 設定、skill、運用ルール、テンプレート等の改善リクエスト作成・整理・反映管理。 |
| `ai-operations-prompt-drafting` | AI 向けプロンプト、作業指示、品質条件の作成。 |
| `ai-operations-skill-design` | Skill の設計、レビュー、再編、追加。 |
| `communication-email-draft` | メール、依頼文、ステークホルダー向け連絡文の作成・修正。 |
| `communication-meeting-agenda` | 会議アジェンダ、論点、事前確認事項、進行案の作成。 |
| `document-production-minutes` | 議事メモ、文字起こし、粗いメモから議事録を作成。 |
| `document-production-report-draft` | 報告書、要約、説明文書、業務文書のドラフト作成。 |
| `document-production-slide-outline` | スライド構成、ページ別メッセージ、展示物案の作成。 |
| `document-review-consistency` | 文書内外の矛盾、日付、数値、用語、参照の整合性レビュー。 |
| `document-review-logic-structure` | ストーリー、論理構成、論点整合、提言のレビュー。 |
| `document-review-quality-check` | 成果物全般の根拠、完全性、残リスクの品質確認。 |
| `engineering-support-script` | 小規模スクリプト、検証コード、自動化補助、テストの作成・修正。 |
| `python-project-intake` | Pythonツールの目的、入出力、実行環境、制約、完了条件の整理。 |
| `python-cli-tool` | Python CLIのコマンド契約、実装、検証。 |
| `python-data-processing` | CSV、Excel、JSON等の非破壊な読込、変換、検証。 |
| `python-api-integration` | 外部APIの認証、通信、再試行、制限、エラー処理を含む実装。 |
| `python-web-scraping` | 規約、robots.txt、負荷、構造変化に配慮したWeb収集。 |
| `python-data-visualization` | 定義、単位、軸、凡例、再現性を備えた図表生成。 |
| `python-dependency-management` | 仮想環境、依存追加、互換性、lock、ライセンスの判断。 |
| `python-packaging` | Pythonパッケージ、entry point、バージョン、導入・削除手順の整備。 |
| `python-testing` | リスクに応じた正常系、異常系、境界値テストの設計・実装。 |
| `python-code-review` | Pythonコードのバグ、保守性、セキュリティ、データ破壊、テスト不足のレビュー。 |
| `information-organization-email-thread` | `.eml` 等のメールスレッド整理・要約・論点抽出。 |
| `information-organization-evidence-trace` | 事実、推測、不明、要確認を分けた根拠整理。 |
| `information-organization-file-name-index` | ファイル名・フォルダ名だけから探索用インデックスを作成。 |
| `information-organization-glossary` | 用語集、略語集、固有名詞、人名・組織名メモの作成。 |
| `information-organization-project-context` | プロジェクト概要、現状、関係者、成果物、論点の整理。 |
| `information-organization-project-index` | プロジェクト内ファイルの索引、資料台帳、アクセスマップ、文書カタログの作成。 |
| `project-management-decision-log` | 決定事項、保留判断、承認状況、判断根拠の整理。 |
| `project-management-meeting-followup` | 会議後のアクション、決定事項、未解決論点の抽出。 |
| `project-management-risk-issue` | リスク、課題、ブロッカー、依存関係、エスカレーションの整理。 |
| `project-management-todo` | TODO、担当、期限、未解決事項、アクション台帳の整理。 |
| `project-management-workplan` | 作業計画、進め方、タスク順序、役割分担の設計。 |
| `research-analysis-interview-design` | インタビュー設計、質問票、ヒアリング項目、調査計画。 |
| `research-analysis-issue-structuring` | 論点設計、仮説、イシューツリー、分析アプローチの整理。 |
| `research-analysis-public-info` | 公開情報、文献、市場、政策、制度、外部ソースの調査。 |
| `research-analysis-statistics-table` | 統計表、CSV、Excel、数値データ、時系列の整理・検証。 |
| `visual-production-diagram` | 図解、Mermaid、スライド図表、画像生成ブリーフの作成。 |

## 新規スキル追加の基準

- 既存スキルでは発火条件や手順が明確に合わない。
- 同じ種類の依頼が繰り返し発生する見込みがある。
- 入力、手順、出力、検証方法を短く定義できる。
- プロジェクト固有情報ではなく、移植可能な業務ワークフローである。

## 発火競合を防ぐルーティング規則

1. ユーザーが求める主成果物を1つ特定し、原則として主skillを1件だけ選ぶ。
2. 入力形式、途中工程、品質確認、補助的な観点に一致するだけのskillは追加発火させない。
3. 同じ成果物に汎用skillと専門skillが一致する場合は、専門skillを優先する。
4. 別の成果物が明示的に依頼されている場合だけ、追加skillを順番に使う。
5. 主skill内で通常必要となる調査、テスト、依存確認、品質確認のために、別skillを自動発火させない。
6. Pythonコードの実装・修正では、主たる動作に対応する `python-*` を1件選ぶ。`python-testing`、`python-dependency-management`、`python-packaging`、`python-code-review` は、それ自体が主成果物として依頼された場合だけ主skillにする。
7. 対応するPython専門skillがある場合、`engineering-support-script` は選ばない。

## 分割・統合・削除の基準

- 1 つの `SKILL.md` が複数の独立した成果物や判断基準を抱えたら分割を検討する。
- description が似て発火競合するスキルは、境界を明確にする。大規模統合は先に更新提案を作成し、人間が確認できる状態にする。
- 使われていないスキルでも、削除前に代替スキル、影響範囲、移行先を整理する。
- 同じ常時ルールが複数スキルに重複している場合は、ルート `AGENTS.md` または `skills/README.md` へ寄せる。
- Python skill は `python-{task-name}` とし、対応するPython専門skillが存在しない小規模処理だけを `engineering-support-script` で扱う。

## 補助ディレクトリの使い分け

- `references/`: 長い判断基準、仕様、詳細例。`SKILL.md` には読む条件を明記する。
- `scripts/`: 繰り返し使う変換、検証、集計など、自然言語より再現性が必要な処理。
- `assets/`: 出力に再利用するテンプレート、図版、サンプルファイル。
- `evals/`: 誤用しやすい高影響スキルの代表プロンプトと期待品質。

## 命令セット更新時の検証

1. 変更対象の `SKILL.md` と関連する `AGENTS.md`、`README.md` を読む。
2. frontmatter の `name`、`description`、親ディレクトリ名の一致を確認する。
3. `description` がダブルクォートで囲まれているか確認する。`Japanese triggers:` など値の中にコロンを含む場合、未クォートだと YAML パースエラーになる。
4. description が発火条件として広すぎないか、境界が読めるかを確認する。
5. 本文に手順、出力、品質確認、移植性ルールがあるかを確認する。
6. `references/`、`scripts/`、`assets/` への参照切れを確認する。
7. 秘密情報、個人情報、外部送信、破壊的操作、依存関係追加が無条件に許可されていないか確認する。
8. 監査や大きな再編は、移植先のプロジェクト固有保存先または通常の成果物保存先に記録し、`.agents/` には保存しない。

## 禁止事項

- プロジェクト固有の人物、組織、URL、ファイル名、作業ログ、資格情報を `.agents/` に保存しない。
- 外部リポジトリの Skill やスクリプトをライセンス確認なしにコピーしない。
- 空スキル、万能スキル、発火条件が曖昧なスキルを大量追加しない。
- ユーザー確認なしに既存資料の上書き、破壊的コマンド、外部送信、依存関係追加を許可する指示を書かない。
