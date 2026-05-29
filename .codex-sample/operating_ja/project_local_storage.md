# プロジェクト固有情報の保存先

プロジェクト固有情報は、共通 `.codex` ディレクトリにも、その配下のサブディレクトリにも保存しません。

`.codex` 配下は、環境によってファイル生成・編集が制限される場合があります。そのため、Codex がプロジェクトフォルダ内の資料を確認して作成する案件固有メモは、`.codex` とは分離したプロジェクトルート直下の `project-local/` に保存します。

## 1. `.codex` ディレクトリに保存してはいけない情報

以下のようなプロジェクト固有情報は `.codex` ディレクトリおよびその配下に保存しません。

- 案件名
- 顧客名
- 関係者名
- 実メール本文
- 実ファイル索引
- 案件TODO
- 案件固有の判断
- 案件資料から抽出した事実
- URL、パスワード、認証情報
- プロジェクトフォルダ内ファイルの要約

## 2. 推奨保存先

プロジェクト固有情報は、各プロジェクトフォルダ内の `.codex` 外に保存します。

推奨:

```text
プロジェクトフォルダ/project-local/
プロジェクトフォルダ/codex_*.md
プロジェクトフォルダ/*_codex_*.md
```

標準は `プロジェクトフォルダ/project-local/` です。プロジェクト側のルールや権限によりフォルダ作成ができない場合は、ユーザーに報告し、`codex_*.md` または `*_codex_*.md` の新規ファイルとして保存してよいか確認します。

## 3. `project-local/`

プロジェクト固有のCodex作業メモは以下に隔離します。

```text
project-local/
```

標準ファイル:

| ファイル | 役割 |
|---|---|
| `project-context.md` | 案件目的、成果物、会議体、主要論点、重要タスク、リスク |
| `file-name-index.md` | ファイル名・フォルダ名から作るAIエージェント向け索引 |
| `source-map.md` | 資料と論点・根拠の対応 |
| `work-log.md` | Codex作業ログ |
| `known-people-and-orgs.md` | プロジェクト内で確認済みの人名・組織名 |
| `generated-outputs-index.md` | Codex生成物の一覧 |

`project-local/` は横展開対象外です。他プロジェクトへコピーしないでください。

## 4. project context

project context はプロジェクト固有情報です。共通 `.codex` ではなく、 `project-local/` に作成します。

推奨名:

```text
project-local/project-context.md
project-local/project-context-update_{YYYYMMDD}.md
```
