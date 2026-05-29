# project-local

このディレクトリは、プロジェクト固有のCodex作業メモを保存する場所です。

## 重要

このREADMEは、移植先プロジェクトでの保存先を説明するための雛形です。

共通テンプレートとして管理する `.agents/`、`.codex/`、`domains_ja/`、`operating_ja/`、`templates/` には、実案件の情報を保存しません。実案件の情報は、移植先プロジェクトのルート直下 `project-local/` にだけ保存します。

この `.codex-sample/project-local/` は、新規プロジェクト導入時に使う空テンプレートです。実データを記入した後の `project-local/` は横展開対象外です。他プロジェクトへコピーする前に、削除またはコピー対象から除外してください。

空ディレクトリまたはこのREADMEだけを雛形として配布する場合でも、案件名、顧客名、人名、メール本文、ファイル索引、TODO、作業ログなどの実データが含まれていないことを確認してください。

## 保存するもの

推奨ファイル:

| ファイル | 役割 |
|---|---|
| `project-context.md` | 案件目的、成果物、会議体、主要論点、重要タスク、リスク |
| `file-name-index.md` | ファイル名・フォルダ名から作るAIエージェント向け索引 |
| `source-map.md` | 資料と論点・根拠の対応 |
| `work-log.md` | Codex作業ログ |
| `known-people-and-orgs.md` | 確認済みの人名・組織名 |
| `generated-outputs-index.md` | Codex生成物の一覧 |

## 保存しないもの

- 認証情報
- パスワード
- APIキー
- 秘密URL
- Codex内部DB
- セッション履歴
