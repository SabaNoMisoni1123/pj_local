# Codex変更リクエスト

## 管理情報

| 項目 | 内容 |
|---|---|
| リクエストID | CR-20260618-project-todo-task-planning-skill |
| 起票日 | 2026-06-18 |
| 件名 | プロジェクト内TODOを生成AI実行可能タスクへ整理するSkill追加 |
| ステータス | 実装済み |
| 優先度 | 中 |
| 対象分類 | skill |
| 希望する反映先 | `.agents/skills/` 配下の新規Skill |

## 背景

`tools/plan_codex_task.ps1` を使い、プロジェクトフォルダ内のTODO、メモ、issue、計画資料、議事録、README、AGENTS.md、既存のtask/plan/log類を確認して、生成AIまたはAIエージェントで支援可能な作業を洗い出す試行を行った。

その結果、`project-local/planed_task/` 配下に、タスク一覧、Codex向け個別指示書、ChatGPT向けタスク一覧、実行履歴管理表、Codexバックグラウンド実行用PowerShell、個別プロンプトが生成された。特に `project-local/planed_task/prompts/CX-P1-001_prompt.md` では、別セッションのCodexまたはChatGPTに渡せる粒度の実行プロンプトが作成されている。

この作業は今後も複数プロジェクトで再利用可能な運用パターンであるため、個別スクリプトや一回限りのプロンプトではなく、Codexが必要時に発火できるSkillとして整備したい。

## 現状の課題

- プロジェクト内TODOを「生成AIが実行可能なタスク」として棚卸しする専用Skillがない。
- Codex向けタスク、ChatGPT向けタスク、人間確認が必要なタスクの分類基準が、現状では個別プロンプト内に閉じている。
- タスクID、優先度、参照ファイル、実行手順、完了条件、ログ保存先、成果物パスなどの標準出力形式がSkillとして定義されていない。
- `.agents/skills` の適切なSkillを推奨する観点は試行プロンプトに含まれているが、再利用可能なルーティング手順として固定化されていない。
- 生成物の保存先、既存ファイル上書き回避、参照禁止ディレクトリ、低信頼ソースの扱いなどを毎回プロンプトに書く必要がある。

## 要望内容

プロジェクトフォルダ内のTODO・メモ・issue・計画資料・議事録・README・AGENTS.md・既存task/plan/log類を確認し、生成AIが実行可能なタスクへ整理する新規Skillを追加する。

想定Skill名の候補:

```text
project-management-ai-task-planning
```

このSkillでは、少なくとも以下を扱えるようにする。

- プロジェクト内のTODO、未決事項、次アクション、既存タスク管理資料を確認する。
- `old/`、`_old/` などの参照禁止ディレクトリを除外する。
- `_gpt`、`_tmp`、`_draft`、`_codex_`、`codex_` などの生成物・低信頼ソースを単独根拠にしない。
- 各タスクを、Codexが実行すべきタスク、ChatGPTでも対応可能なタスク、人間確認が必要なタスクに分類する。
- Codexタスクは、ファイル操作、複数ファイル横断確認、コード・設定修正、成果物保存、ログ保存、既存ファイル更新の必要性を基準に判定する。
- ChatGPTタスクは、プロジェクトフォルダへの直接アクセスやファイル編集が不要で、相談、整理、方針検討、文章案作成のみで完結するものとして判定する。
- P1、P2、P3などの優先度を付け、優先度理由を短く記録する。
- 各タスクに推奨Skillを1つ提示する。複数Skillが候補になる場合も、主成果物に基づく主要Skillを優先する。
- 別セッションのCodexまたはChatGPTにそのまま渡せる、単独実行可能なプロンプトを作成する。
- 実行履歴管理表とログ保存方針を作成する。

## 期待される効果

- プロジェクト内に散在するTODOを、実行可能なAIタスクとして再利用しやすくなる。
- Codexで実行すべき作業とChatGPTで十分な作業の切り分けが安定する。
- 別セッションへの引き継ぎプロンプトの品質が均一化される。
- `.agents/skills` の既存Skillを使ったタスクルーティングがしやすくなる。
- プロジェクト固有情報を共通Skillへ混入させず、汎用ワークフローとして展開できる。

## 具体例

今回の試行では、以下のような成果物が生成された。

```text
project-local/planed_task/task_inventory.md
project-local/planed_task/codex_task_instructions.md
project-local/planed_task/chatgpt_task_list.md
project-local/planed_task/task_execution_log.md
project-local/planed_task/run_codex_tasks.ps1
project-local/planed_task/chatgpt_task_prompts.md
project-local/planed_task/prompts/CX-P1-001_prompt.md
```

生成された個別プロンプトには、タスクID、タスク名、目的、前提情報、推奨Skill、実行指示、期待する出力形式が含まれていた。新規Skillでは、この構造を汎用テンプレートとして扱えるようにしたい。

## 既存ルール・既存部品との関係

- `project-management-todo` はTODOやアクションアイテムの台帳化に適しているが、Codex/ChatGPTの実行可否分類、個別プロンプト生成、バックグラウンド実行設計までは主目的ではない。
- `project-management-workplan` は前向きな作業計画に適しているが、プロジェクト内TODOをAI実行タスクへ変換する専用ルーティングとは異なる。
- `ai-operations-prompt-drafting` は再利用プロンプト作成に適しているが、プロジェクト内資料のTODO棚卸しとAI担当分類を主目的にはしていない。
- 新規Skillは、上記Skillの代替ではなく、プロジェクト内TODOをAI実行単位に変換する入口として位置づける。
- 成果物保存先は、案件固有情報を含むため `.agents/` や `.codex/` ではなく、原則として `project-local/` 配下とする。

## 影響範囲

影響を受ける可能性があるファイル:

- `.agents/skills/` 配下の新規Skillディレクトリ
- `.agents/skills/README.md` のSkill一覧または発火条件説明
- 必要に応じて `domains_ja/` のタスクカタログまたは関連説明
- 必要に応じて `templates/` 配下のタスク棚卸し用テンプレート

反映しない場合のリスク:

- 同種のTODO整理を毎回個別プロンプトで再作成する必要がある。
- Codex向けタスクとChatGPT向けタスクの分類が作業者やセッションごとにぶれる。
- 参照禁止ソース、低信頼ソース、上書き回避、ログ保存などの運用ルールが漏れる可能性がある。

反映した場合のリスク:

- 既存の `project-management-todo` や `project-management-workplan` との境界が曖昧になる可能性がある。
- タスク棚卸しの対象範囲が広すぎると、不要なファイル読み取りや低信頼ソース依存が増える可能性がある。
- プロジェクト固有の出力例をSkill本体へ入れすぎると、ポータビリティが下がる。

## 受入条件

- 新規 `SKILL.md` のfrontmatterは `name` と `description` のみで、`description` はダブルクォートで囲まれている。
- Skillの発火条件に「プロジェクト内TODOを生成AIまたはAIエージェントが実行可能なタスクへ整理する」趣旨が明記されている。
- 出力形式として、タスク一覧、Codex向け個別指示、ChatGPT向けタスク一覧、実行履歴管理表、個別プロンプトの少なくとも5種類が定義されている。
- Codex向けタスク、ChatGPT向けタスク、人間確認が必要なタスクの分類基準が明記されている。
- 参照禁止ディレクトリ、低信頼ソース、既存ファイル上書き回避、プロジェクト固有情報の保存先に関する注意が含まれている。
- 既存Skillとの境界が説明され、重複する場合は主成果物に基づいて単一Skillを選ぶ方針が示されている。
- Skill本体に、このプロジェクト固有の人名、組織名、固有ファイル内容、案件固有TODOが保存されていない。

## 対応記録

| 日付 | ステータス | 対応内容 | 担当 |
|---|---|---|---|
| 2026-06-18 | 未確認 | 起票 | Codex |
| 2026-06-18 | 実装済み | `.codex-sample/.agents/skills/project-management-ai-task-planning/SKILL.md` を追加し、既存の `project-management-todo`、`project-management-workplan`、`ai-operations-prompt-drafting` との発火条件の境界を調整。代表一覧とタスクカタログにも追記。 | Codex |

## 検証・残課題

- `project-local/planed_task/prompts` の内容と `tools/plan_codex_task.ps1` の生成方針を確認した。
- `.codex-sample/.agents/skills/` へのSkill追加を実施済み。
- 既存のSkill一覧への追記、Skill名の確定、既存Skillとの境界調整を実施済み。
- 現時点では、個別テンプレートファイルの分離は行わず、Skill本体の出力契約として定義した。
