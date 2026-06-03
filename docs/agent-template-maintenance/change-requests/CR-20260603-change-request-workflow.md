# Codex設定改善リクエスト

## 管理情報

| 項目 | 内容 |
|---|---|
| リクエストID | CR-20260603-01 |
| 起票日 | 2026-06-03 |
| 件名 | Codex改善リクエスト受付・反映仕組みの追加 |
| 起票者 | ユーザー |
| ステータス | 実装済み |
| 優先度 | 高 |
| 対象分類 | ドキュメント / skill / テンプレート |
| 想定反映先 | 本プロジェクトの保守資料、ルート `AGENTS.md`、`.codex-sample` の移植用部品 |

## 背景

本プロジェクトで作成した Codex 設定を実際の業務で利用する中で、修正、更新、機能追加が必要になる内容を Markdown 形式で受け付け、それを本プロジェクトの改善に反映する仕組みが必要になった。

## 現状の課題

- 改善要望の保存先が明確に定義されていなかった。
- 要望を反映する際の採用判断、ステータス、反映先、検証内容を追跡する台帳がなかった。
- 移植先プロジェクトで改善要望を起票するための汎用テンプレートと専用 skill がなかった。

## 要望内容

- 本プロジェクト内に改善リクエスト保存用ディレクトリを作成する。
- Markdown のリクエストテンプレートと索引を作成する。
- リクエストを踏まえて更新する運用を本プロジェクトのルールへ組み込む。
- 移植先プロジェクトでも改善要望を起票できるよう、汎用テンプレートと専用 `SKILL.md` を `.codex-sample` に追加する。

## 期待する効果

- 業務利用で見つかった改善点を散逸させずに管理できる。
- `.codex-sample` に反映すべき汎用改善と、本プロジェクトだけの保守メモを分けて扱える。
- 採用、保留、却下、実装済みの判断を後から追跡できる。
- 移植先プロジェクトからの改善要望を一定の形式で受け取れる。

## 具体例

```text
移植先プロジェクトで AGENTS.md の保存先ルールが曖昧に感じられたため、
実案件情報を含めずに改善要望として起票し、本テンプレート管理側で採用可否を判断する。
```

## 既存ルール・既存部品との関係

- ルート `AGENTS.md` の `.codex-sample` 配置判断と整合する。
- 未採用の要望は `.codex-sample` 外の `docs/` に保存する。
- 採用済みで移植先でも使える部品だけを `.codex-sample` に反映する。
- 既存の `agents_update_proposal_template.md` は `AGENTS.md` 更新提案向けであり、本リクエスト管理は Codex 設定・skill・テンプレートを含む改善受付全体を扱う。

## 影響範囲

- 影響を受ける利用者: 本テンプレート管理プロジェクトの保守作業者、移植先で Codex 設定を利用する作業者。
- 影響を受けるファイル: 反映結果のとおり。
- 反映しない場合のリスク: 改善要望が個別チャットや作業メモに散逸し、汎用雛形へ反映されにくくなる。
- 反映した場合のリスク: 要望管理が形骸化する可能性があるため、索引更新とステータス更新をルール化する。

## 受入条件

- `docs/agent-template-maintenance/change-requests/` に運用文書、索引、テンプレートがある。
- ルート `AGENTS.md` に改善リクエスト管理ルールが追加されている。
- `.codex-sample/templates/` に移植用の改善リクエストテンプレートがある。
- `.codex-sample/.agents/skills/` に専用 skill がある。
- AI運用のカタログと代表 skill に反映されている。

## 対応記録

| 日付 | ステータス | 対応内容 | 担当 |
|---|---|---|---|
| 2026-06-03 | 未確認 | 改善リクエスト受付・反映の仕組み化を依頼 | ユーザー |
| 2026-06-03 | 実装済み | 保存先、テンプレート、索引、専用 skill、プロジェクトルール、カタログを追加 | Codex |

## 反映結果

- 判定: 実装済み
- 反映先:
  - `AGENTS.md`
  - `docs/agent-template-maintenance/change-requests/README.md`
  - `docs/agent-template-maintenance/change-requests/request-index.md`
  - `docs/agent-template-maintenance/change-requests/change_request_template.md`
  - `docs/agent-template-maintenance/change-requests/archived/README.md`
  - `.codex-sample/templates/codex_change_request_template.md`
  - `.codex-sample/.agents/skills/ai-operations-change-request/SKILL.md`
  - `.codex-sample/.agents/AGENTS.md`
  - `.codex-sample/domains_ja/ai-operations.md`
  - `.codex-sample/domains_ja/task_catalog.md`
- 検証内容:
  - `SKILL.md` の frontmatter 名、description の引用符、親ディレクトリ名を確認。
  - 追加・更新ファイルが UTF-8 BOM なしであることを確認。
  - `git diff --check` で空白エラーがないことを確認。
- 残課題: 実運用後にステータス分類、優先度分類、索引項目の過不足を見直す。

