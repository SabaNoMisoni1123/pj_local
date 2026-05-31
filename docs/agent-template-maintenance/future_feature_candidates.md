# `.codex-sample` 今後の機能追加候補

## 目的

`.codex-sample` に今後追加してもよい機能、または実装が望ましい機能を記録する。ここには本環境そのものの検討メモを置き、移植用雛形である `.codex-sample` には確定した汎用ルール・skill・テンプレートのみを反映する。

## 実装済み

### 2026-05-26 追加

- `research-analysis-issue-structuring`: 論点構造化、仮説、分析設計
- `research-analysis-interview-design`: ヒアリング設計、質問票、記録観点
- `document-production-slide-outline`: スライド構成案、ページ別メッセージ、図表案
- `document-review-logic-structure`: ロジック・構成レビュー
- `information-organization-glossary`: 用語集、略語集、固有名詞、関係者・組織名メモ
- `research-analysis-statistics-table`: 統計・数値データの定義確認、比較表、サマリー
- `communication-meeting-agenda`: 会議アジェンダ、事前確認事項、参加者依頼

## 今後の追加候補

### 優先度 中

#### `project-management-deliverable-plan`

- 用途: 成果物一覧、章別担当、レビュー日程、提出予定、版管理、提出前チェックリストを管理する。
- 追加理由: TODOや作業計画とは別に、報告書・スライド・別添・データ納品などの成果物単位で管理したい案件がある。
- 想定テンプレート: `deliverable_register_template.md`

#### `document-production-executive-summary`

- 用途: 長い報告書、議事録、調査メモ、スライド案から、要旨、エグゼクティブサマリー、1枚要約を作る。
- 追加理由: 最終報告、幹部説明、庁内共有では、結論先出しの要約需要が高い。
- 想定テンプレート: `executive_summary_template.md`

#### `document-review-redaction`

- 用途: 外部共有前に、個人名、社名、顧客名、未公開情報、機微情報、認証情報、内部メモの混入を確認する。
- 追加理由: `.codex-sample` の可搬性・プロジェクト固有情報隔離の考え方と相性がよい。
- 想定テンプレート: `redaction_check_template.md`

#### `ai-operations-output-reuse`

- 用途: 過去の生成物、作業ログ、source map、project-local 情報を棚卸しし、再利用可能な知見・成果物・注意点を整理する。
- 追加理由: 案件中盤以降に生成物が増えた際、再利用可能な成果や注意点を整理できる。
- 想定テンプレート: `generated_outputs_index_template.md`

## 追加検討時の観点

- 既存 skill で十分対応できるか。
- 成果物の目的が明確に異なるか。
- 利用頻度が高いか、または事故防止効果が高いか。
- 汎用雛形に入れても案件固有情報を含まないか。
- `domains_ja/`、`task_catalog.md`、`README.md`、必要な `templates/` も同時に更新できるか。
