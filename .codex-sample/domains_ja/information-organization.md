# 情報整理

散在する情報を、後から参照しやすい構造に変換するタスクです。

## 含めるタスク

- メールスレッド整理
- ファイル索引・プロジェクト索引作成
- ファイル名インデックス作成
- 根拠整理
- 用語集作成
- ナレッジ化
- 未確認事項整理
- project context作成

## 代表skill

以下は代表例です。正式な skill 発見は `../.agents/skills/*/SKILL.md` に従います。

- `information-organization-email-thread`
- `information-organization-evidence-trace`
- `information-organization-glossary`
- `information-organization-file-name-index`
- `information-organization-project-context`
- `information-organization-project-index`

## 分類基準

成果物が時系列、索引、根拠表、確認事項、用語集、構造化メモの場合は、この業務カットに分類します。

## ファイル名インデックス

ファイル名インデックスは、ファイルを開く前の探索コストを下げるためのAIエージェント向け日本語メモです。

原則としてファイル名・フォルダ名・拡張子・更新日時などのメタ情報から作成し、内容を読んでいない場合は内容を断定しません。

## ファイル索引・プロジェクト索引

ファイルを開く、または内容の役割まで確認して資料台帳やアクセスマップを作る場合は `information-organization-project-index` を使います。

ファイル名やフォルダ名だけで探索用メモを作る場合は `information-organization-file-name-index` を使います。
