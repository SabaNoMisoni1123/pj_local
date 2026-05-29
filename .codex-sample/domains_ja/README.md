# 業務カット一覧

このディレクトリは、人間が業務単位でタスクを把握・追加するための日本語ドキュメント置き場です。

skill の正式な発見単位は `../.agents/skills/*/SKILL.md` です。このREADMEや `task_catalog.md` は人間向けの代表例・分類メモであり、すべての skill を網羅する必要はありません。

| 業務カット | ファイル | 目的 |
|---|---|---|
| 業務推進・PMO | `project-management.md` | TODO、作業計画、課題、リスク、決定事項を管理する |
| 情報整理 | `information-organization.md` | メール、資料、根拠、ファイルを構造化する |
| 文書校閲 | `document-review.md` | 既存文書の整合性、表記、根拠、品質を確認する |
| 資料作成 | `document-production.md` | 報告書、議事録、説明資料などを作成する |
| コミュニケーション | `communication.md` | メール文、依頼文、共有文などの文面を作成する |
| 調査・分析 | `research-analysis.md` | 公開情報、文献、競合、論点を調査・整理する |
| AI運用 | `ai-operations.md` | 生成AI向け指示、プロンプト、品質基準を作る |
| 開発・ツール支援 | `engineering-support.md` | スクリプト、API、データ変換、自動化を支援する |
| ビジュアル制作 | `visual-production.md` | 図解、画像、画面、視覚資料を作る |

新しい業務カットを追加する場合も、通常は `../.agents/skills/{business-domain}-{task-name}/SKILL.md` の追加だけで skill として発見できます。人間向けの説明が必要な場合だけ、`README.md`、`task_catalog.md`、`domains_ja/{business-domain}.md` に追記してください。
