# Python開発向けCodex雛形 品質監査

監査日: 2026-06-07

## 1. 対象

- `.codex-sample/AGENTS.md`
- `.codex-sample/README.md`
- `.codex-sample/.agents/`
- `.codex-sample/operating_ja/`
- `.codex-sample/domains_ja/`
- `.codex-sample/templates/`
- `scripts/*codex_sample*`

## 2. 配置判断

依頼文では `.codex-python` への作成が指定されていたが、現行の
`codex-python-development-procedure.md` は、独立した `.codex-python` を作成せず、
再配布雛形を `.codex-sample` に集約することを明示している。

このため、Python開発向け共通ルール、skill、テンプレート、人間向け一覧は
`.codex-sample` に統合した。`.codex-python` は作成していない。

## 3. 実装内容

- Python 3.11以上、既存構成優先、入力非破壊、秘密情報、依存、テスト、
  完了報告を扱う `operating_ja/python_development.md` を追加した。
- Python開発向けskillを10件追加した。
- `engineering-support-script` とPython専用skillの発火境界を明記した。
- `.agents/AGENTS.md`、README、domain、task catalogを更新した。
- ツール仕様、CLI利用手順、テスト計画、依存判断、障害記録のテンプレートを追加した。
- `project-local/` と `codex_config_template.toml` は変更していない。

## 4. 検証結果

| 確認項目 | 結果 |
|---|---|
| 新規10件のskill validation | 全件成功 |
| frontmatterの`name`と親ディレクトリ名 | 全件一致 |
| `description`のダブルクォート | 全件適合 |
| UTF-8 BOM | 検出なし |
| 管理方針、domain、task catalogのskill参照 | 不足なし |
| `.codex-sample`内の`.codex-python`誤参照 | 検出なし |
| ローカル絶対パス | 検出なし |
| 秘密情報 | 実値なし。禁止・注意事項としての語句のみ |
| `git diff --check` | 問題なし |
| 移植スクリプト | `.agents/`、`operating_ja/`、`domains_ja/`、`templates/`が既存同期対象。変更不要 |

## 5. 代表シナリオの主skill

| シナリオ | 主skill | 補助skill |
|---|---|---|
| CSVを加工して別ファイルへ出力するCLI | `python-data-processing` | `python-cli-tool`, `python-testing` |
| APIからJSONを取得・保存 | `python-api-integration` | `python-data-processing`, `python-testing` |
| Webページから表を収集 | `python-web-scraping` | `python-data-processing`, `python-testing` |
| Excel集計からグラフ画像を生成 | `python-data-visualization` | `python-data-processing` |
| 既存CLIを配布可能にする | `python-packaging` | `python-dependency-management`, `python-testing` |
| 小規模な単発スクリプト | `engineering-support-script` | 必要時のみ対応する`python-*` |

## 6. 残存事項

- 特定ライブラリやフレームワークを採用していないため、外部仕様調査は実施していない。
- Linux、macOS、Windows向け移植スクリプト本体は変更していないため、
  install、update、force update、uninstallの再実行試験は省略した。
- 手順書自体の未コミット変更は利用者変更として保持し、本作業では編集していない。

## 7. Skill発火競合の追加監査

全39件のskillについて、frontmatterの `description` と本文の主目的を確認した。
発火条件は「関連する作業を含むか」ではなく「ユーザーが求める主成果物は何か」で判定するように変更した。

### 共通ルーティング

- 原則として主skillを1件だけ選ぶ。
- 入力形式、途中工程、品質観点に一致するだけのskillは発火させない。
- 汎用skillと専門skillが同じ成果物に一致する場合は専門skillを優先する。
- 別成果物が明示的に依頼された場合だけ追加skillを順番に使う。

### 主な競合群の境界

| 競合群 | 選択基準 |
|---|---|
| AGENTS、変更要求、プロンプト、skill設計 | 最終成果物のファイル・管理単位で選ぶ |
| メール文案、メールスレッド整理 | 送信用文案か、既存会話の整理かで選ぶ |
| アジェンダ、議事録、会議後フォロー | 会議前、完全な会議記録、会議後の複合フォローで分ける |
| TODO、決定、リスク、作業計画 | 台帳の対象と、既存事項の抽出か将来計画かで分ける |
| 整合性、論理構成、最終品質 | 主たるレビュー観点で選ぶ |
| ファイル名索引、プロジェクト索引 | 内容を読まない索引か、内容と役割を確認する台帳かで分ける |
| 公開情報、根拠対応表、統計表 | 外部調査、既存根拠の追跡、人間向け数値表で分ける |
| 図解、Python可視化 | 概念図か、データからコードで生成する図表かで分ける |

### Python skill

- Pythonコードの実装・修正では、主たる動作に対応する `python-*` を1件だけ選ぶ。
- 実装に通常伴うテスト、依存確認、レビューのために、
  `python-testing`、`python-dependency-management`、`python-code-review` を追加発火させない。
- これらはテスト、依存変更、レビュー自体が主成果物として依頼された場合だけ選ぶ。
- 対応するPython専門skillがある場合、`engineering-support-script` は選ばない。
- 将来Python skillを追加する場合も、技術名ではなく主動作・主成果物で既存skillとの排他的な境界を定義する。

### 再検証

| 確認項目 | 結果 |
|---|---|
| 全39件のskill validation | 全件成功 |
| frontmatterの名称整合 | 問題なし |
| UTF-8 BOM | 検出なし |
| 広すぎる旧形式のdescription | 対象なし |
| `git diff --check` | 問題なし |
