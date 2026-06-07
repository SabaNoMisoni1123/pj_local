# Codex変更リクエスト

## 管理情報

| 項目 | 内容 |
|---|---|
| リクエストID | CR-20260603-email-fact-reconciliation |
| 起票日 | 2026-06-03 |
| 件名 | 外部向けメール文案作成時の高影響項目照合フロー追加 |
| ステータス | 実装済み |
| 優先度 | 高 |
| 対象分類 | skill |
| 希望する反映先 | `.agents/skills/communication-email-draft/SKILL.md`、必要に応じて `.agents/skills/document-review-quality-check/SKILL.md` |

## 背景

外部機関への返信メール文案を作成する業務で、確認済み方針に含まれるブースサイズをメール本文へ反映する際、数値を誤って記載した。

外部向けメールでは、サイズ、金額、日付、期限、人数、組織名、担当者名、決定事項、コミットメントなどの高影響項目の誤記は、表現上の軽微な問題ではなく、対外説明や調整に直接影響する重大な品質問題となる。

今回の問題は、メール文案作成スキルに「根拠に基づく」旨の一般的な指示はあるものの、確認済み方針から本文へ数値・単位・決定事項を転記する際の項目単位の照合手順が明示されていないことに起因する。

## 現状の課題

- `communication-email-draft` では、根拠に基づく作成や不明点のプレースホルダー化は指示されているが、数値・単位・日付・サイズなどの高影響項目を作成前に抽出する手順がない。
- 外部向けメールの本文作成後に、根拠資料または確認済み方針と本文を項目単位で突合する手順がない。
- 高影響項目の誤記を「文言調整」ではなく「重大欠陥」として扱う品質基準が明示されていない。
- 文字化け、曖昧な記載、単位不明、資料内不一致がある場合に、推測で本文に入れず `要確認` とする判断基準が弱い。

## 要望内容

- `communication-email-draft/SKILL.md` のワークフローに、メール文案作成前の高影響項目抽出を追加する。
- `communication-email-draft/SKILL.md` のワークフローに、外部向けメール本文作成後の「根拠資料または確認済み方針」と「本文」の項目単位照合を追加する。
- `communication-email-draft/SKILL.md` の品質確認に、数値、日付、単位、サイズ、金額、期限、組織名、人名、決定事項、コミットメントの不一致を重大欠陥として扱う旨を追加する。
- 確認済み方針に数値や単位が含まれる場合、ユーザーが明示的に変換・言い換えを求めない限り、根拠の値を正確に保持する旨を追加する。
- 根拠資料が文字化け、曖昧、または内部不整合を含む場合は、推測で送信可能本文に入れず、`要確認` とする旨を追加する。
- 必要に応じて `document-review-quality-check/SKILL.md` にも、外部向けメール文案の高影響項目不一致を高重要度の欠陥として扱う指示を追加する。

## 期待される効果

- 確認済み方針に含まれる数値・単位・決定事項をメール本文へ誤転記するリスクを下げる。
- 外部送信前のレビューで、表現の自然さだけでなく、根拠との一致を必ず確認できるようになる。
- 生成AIが根拠不明の補完、推測、単位変換、数値の正規化をメール本文に混入させることを抑止できる。
- 高影響項目に関する誤りを早期に検出し、送信前にユーザー確認へ戻せる。

## 具体例

抽象化した問題例:

```text
入力:
- 回答方針には「ブースサイズは昨年度と同程度、横幅X m」と記載されている。
- ユーザーは、この方針に沿って外部機関への返信メール文案を作成するよう依頼した。

問題:
- メール本文では横幅を別の数値として記載した。
- 本文作成後に、回答方針の数値とメール本文の数値を突合していなかった。

期待される動作:
- 作成前に「横幅X m」を高影響項目として抽出する。
- 本文には根拠と一致する値だけを記載する。
- 作成後に「根拠: 横幅X m / 本文: 横幅X m」のように項目単位で照合する。
- 不明、文字化け、単位不明、資料内不一致があれば、送信可能本文に推測値を入れず `要確認` とする。
```

`communication-email-draft/SKILL.md` への追記案:

```markdown
Before drafting, extract high-impact facts from the source or confirmed policy, including numbers, dates, units, sizes, amounts, deadlines, organization names, person names, commitments, and decision status.

When drafting external-facing email text, copy high-impact facts only after checking the exact source wording. Do not infer, normalize, convert, or fill in numbers, units, dates, or sizes unless the source explicitly supports it or the user explicitly requests it.

After drafting external-facing email text, perform a source-to-draft reconciliation for all high-impact facts. Confirm that every number, date, unit, size, amount, deadline, organization name, person name, commitment, and decision status in the draft matches the confirmed source or is clearly marked as unknown.
```

`communication-email-draft/SKILL.md` の `Quality Checks` への追記案:

```markdown
- For external-facing emails, verify all high-impact facts against the source immediately before finalizing: numbers, dates, units, sizes, amounts, deadlines, names, organizations, commitments, and decision status.
- Treat unsupported or mismatched numbers, dates, units, sizes, amounts, deadlines, names, organizations, commitments, and decision status as critical defects, not wording issues.
- If a confirmed policy contains a number or unit, preserve it exactly unless the user explicitly requests conversion or rewording.
- If the source text is garbled, ambiguous, or internally inconsistent, do not guess the value; mark it as `要確認` or ask for confirmation before putting it in the sendable body.
```

必要に応じた `document-review-quality-check/SKILL.md` への追記案:

```markdown
- In email drafts for external recipients, classify incorrect or unsupported numbers, dates, units, sizes, amounts, deadlines, organization names, person names, commitments, or decision status as high-severity defects.
- When a draft is based on a confirmed policy or source memo, compare the draft against that source item by item before reporting it as ready to send.
```

## 既存ルール・既存部品との関係

- 既存の `communication-email-draft` は、根拠に基づく事実利用、不明点のプレースホルダー化、過剰なコミットメント回避を定めている。本リクエストはそれらを弱めず、外部向けメールでの高影響項目照合を具体化する。
- 既存の `document-review-quality-check` は、日付、数値、用語、所有者、期限、参照、形式の確認を定めている。本リクエストは、外部向けメールにおける重大度判定を明確化する。
- 重複・矛盾の可能性: 低い。既存ルールの抽象的な品質確認を、メール文案作成時の実行手順として具体化する追加である。
- 汎用雛形に入れるべき理由: 外部メールの数値・日付・単位誤記は案件を問わず重大な対外リスクであり、プロジェクト固有ではない。

## 影響範囲

- 影響を受ける利用者: 外部向けメール、依頼文、照会回答、ステークホルダー向け連絡文を作成するAIエージェント利用者。
- 影響を受けるファイル:
  - `.agents/skills/communication-email-draft/SKILL.md`
  - `.agents/skills/document-review-quality-check/SKILL.md`（必要に応じて）
  - `.agents/skills/document-review-consistency/SKILL.md`（必要に応じて確認のみ）
- 反映しない場合のリスク: 確認済み方針の数値・単位・決定事項が外部向け本文で誤記され、対外調整や信用に影響する。
- 反映した場合のリスク: メール文案作成時の確認手順がやや増える。ただし、外部向け文書では必要な品質確認であり、過大な負荷ではない。

## 受入条件

- `communication-email-draft/SKILL.md` に、高影響項目の作成前抽出、作成時の根拠確認、作成後の根拠本文突合が明記されている。
- `communication-email-draft/SKILL.md` に、外部向けメールで高影響項目の不一致を重大欠陥として扱う品質確認が明記されている。
- 文字化け、曖昧、内部不整合がある根拠値を推測で本文に入れない指示が明記されている。
- `SKILL.md` の frontmatter は `name` と `description` のみで、`description` はダブルクォートで囲まれている。
- `.agents` 配下に、具体案件名、個人名、実際のメール本文、具体的なブース幅などのプロジェクト固有情報が保存されていない。
- 変更後に、対象 `SKILL.md` の `name` とフォルダ名の一致が確認されている。

## 対応記録

| 日付 | ステータス | 対応内容 | 担当 |
|---|---|---|---|
| 2026-06-03 | 未確認 | 起票 | Codex |
| 2026-06-03 | 採用 | 外部向けメールの高影響項目照合は汎用的な対外品質リスク低減策として採用 | Codex |
| 2026-06-03 | 実装済み | `communication-email-draft` と `document-review-quality-check` に反映し、索引を更新 | Codex |

## 反映結果

- 判定: 実装済み
- 反映先:
  - `.codex-sample/.agents/skills/communication-email-draft/SKILL.md`
  - `.codex-sample/.agents/skills/document-review-quality-check/SKILL.md`
  - `docs/agent-template-maintenance/change-requests/request-index.md`
- 検証内容:
  - 対象 `SKILL.md` の frontmatter が `name` と `description` のみであることを確認。
  - 対象 `SKILL.md` の `name` と親ディレクトリ名の一致を確認。
  - 追加・更新ファイルが UTF-8 BOM なしであることを確認。
  - `git diff --check` で空白エラーがないことを確認。
- 残課題: 実運用で確認負荷が過大な場合は、外部向けメールに限定した発火条件や照合対象の表現を見直す。
