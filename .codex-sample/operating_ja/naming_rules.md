# 命名ルール

## 1. 基本原則

- 派生成果物は新規ファイルとして作成する。
- 既存ファイルを上書きしない。
- 既存ファイルの編集、削除、改名、移動は、ユーザーの明示指示があり、かつプロジェクト固有の `AGENTS.md` や運用ルールで許可される場合だけ行う。
- ユーザーの明示指示がない場合、既存ファイルは直接変更せず、修正案または新規成果物として作成する。
- プロジェクト固有の `AGENTS.md` に命名規則がある場合はそちらを優先する。

## 2. 派生成果物

既存ファイルから派生物を作る場合:

```text
{source_basename}_{purpose_suffix}.{ext}
```

推奨suffix:

| suffix | 用途 |
|---|---|
| `_codex_check` | 整合性チェック結果 |
| `_codex_todo` | TODO抽出結果 |
| `_codex_prompt` | 生成AI向け作業指示 |
| `_codex_draft` | 文案、資料案 |
| `_codex_review` | レビュー結果 |
| `_codex_log` | 作業ログ |
| `_codex_index` | ファイル索引 |
| `_codex_questions` | 追加確認事項 |

## 3. 案件横断ファイル

```text
codex_{purpose}_{YYYYMMDD}.{ext}
```

## 4. 同名ファイルが存在する場合

上書きせず、追加suffixを付けます。

```text
{source_basename}_{purpose_suffix}_002.{ext}
```

## 5. 低信頼ファイル名

低信頼ファイルの定義は `low_confidence_sources.md` を正とします。

低信頼ファイルは単独根拠にしません。
