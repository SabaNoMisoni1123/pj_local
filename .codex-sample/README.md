# 生成AIエージェント業務支援テンプレート

この `.codex-sample` は、Codex や Agent Skills 互換エージェント向けの移植可能な雛形です。

`.codex-sample` は移植元の雛形として扱います。移植時は、この中身のうち「標準コピー対象」を対象プロジェクトのルートへ配置します。

このテンプレート管理プロジェクトで Codex 設定が誤適用されることを防ぐため、移植元には `.codex/config.toml` や `config.toml` という実設定名のファイルを置きません。Codex 設定の雛形は `codex_config_template.toml` として保持し、インストーラーが移植先でだけ `.codex/config.toml` にリネームして配置します。

`README.md` はこの雛形の導入説明書です。移植先に既存 `README.md` がある場合は上書きせず、必要なら `codex_setup_README.md` など別名で保存します。

## 1. 公式寄せの基本方針

このテンプレートでは、役割を次のように分けます。

| 役割 | 置き場所 | 説明 |
|---|---|---|
| プロジェクト指示 | `AGENTS.md` | Codex などのエージェントが読むプロジェクト共通指示 |
| エージェント横断 skill | `.agents/skills/` | Agent Skills 標準に沿う `SKILL.md` 群 |
| Codex 固有設定 | `.codex/` | Codex の設定、権限、ルール、MCP など |
| 業務カット | `domains_ja/` | 人間が読む業務領域の説明、タスク一覧、追加ルール |
| 共通運用ルール | `operating_ja/` | 品質確認、命名、作業ログ、案件固有情報の扱い |
| 出力テンプレート | `templates/` | 成果物の再利用可能な形式 |
| プロジェクト固有メモ雛形 | `project-local/` | 新規導入時に使う空の作業メモテンプレート |
| 導入説明 | `README.md` | この雛形の考え方、移植手順、コピー対象の説明 |

OpenAI Codex の公式ドキュメントでは、skill は Agent Skills open standard に基づくものとして説明されています。Agent Skills 側のクライアント実装ガイドでは、プロジェクト単位の横断的な skill 置き場として `<project>/.agents/skills/` が示されています。

参考:

- OpenAI Codex: `https://developers.openai.com/codex/skills`
- OpenAI skills catalog: `https://github.com/openai/skills`
- Agent Skills implementation guide: `https://agentskills.io/client-implementation/adding-skills-support`
- Agent Skills quickstart: `https://agentskills.io/skill-creation/quickstart`

## 2. ディレクトリ構成

以下は移植後のプロジェクトルート構成です。移植元の `.codex-sample` では、`.codex/config.toml` の代わりに `codex_config_template.toml` を保持します。

```text
プロジェクトルート/
├─ README.md
├─ AGENTS.md
├─ .agents/
│  ├─ AGENTS.md
│  ├─ README.md
│  └─ skills/
│     ├─ README.md
│     └─ {business-domain}-{task-name}/
│        └─ SKILL.md
├─ .codex/
│  └─ config.toml
├─ domains_ja/
│  ├─ README.md
│  ├─ task_catalog.md
│  └─ *.md
├─ operating_ja/
│  ├─ README.md
│  ├─ project_intake.md
│  ├─ workflow.md
│  ├─ quality_check.md
│  ├─ naming_rules.md
│  ├─ work_log.md
│  ├─ excluded_sources.md
│  ├─ low_confidence_sources.md
│  ├─ project_local_storage.md
│  └─ agents_update_policy.md
├─ project-local/
│  ├─ README.md
│  ├─ project-context.md
│  ├─ file-name-index.md
│  ├─ source-map.md
│  ├─ work-log.md
│  ├─ known-people-and-orgs.md
│  └─ generated-outputs-index.md
└─ templates/
   └─ *_template.*
```

`README.md` は導入説明書です。移植先プロジェクトの既存 `README.md` を置き換える必要はありません。

`AGENTS.md` はプロジェクトルートに置きます。`.codex/AGENTS.md` をプロジェクト指示の本体として扱う前提にはしません。

`skills` は `.agents/skills/` に置きます。`.codex/skills/` は Codex 固有実装に依存しやすいため、このテンプレートでは標準の相互運用性を優先して採用しません。

`.codex/` は Codex 固有設定の置き場です。業務知識、案件メモ、成果物、ファイル索引は保存しません。

`project-local/` は、新規プロジェクト導入時に使う空テンプレートです。案件情報を記入した後はプロジェクト固有領域となり、他プロジェクトへの横展開対象から外します。

## 3. skill の考え方

skill は、エージェントが必要時に読み込む作業手順です。

正式な skill は、次の条件を満たすディレクトリです。

```text
.agents/skills/{skill-name}/SKILL.md
```

`SKILL.md` は、YAML front matter に `name` と `description` を持ちます。

最小構成:

```markdown
---
name: business-domain-task-name
description: "Use when the user asks to ..."
---

# Task Name

## Purpose

...

## Workflow

1. ...
2. ...

## Output

...

## Portability

This skill must remain project-agnostic.
Do not store project-specific facts or working notes inside this skill directory.
```

`description` には、ユーザーが依頼しそうな表現を含めます。エージェントは `name` と `description` を主な探索手がかりにします。

## 4. 業務カットと skill

業務カットは、入力ファイル形式ではなく「成果物の目的」で分類します。

代表例:

| 業務カット | タスク | skill |
|---|---|---|
| 業務推進・PMO | TODO管理 | `project-management-todo` |
| 情報整理 | メールスレッド整理 | `information-organization-email-thread` |
| 文書校閲 | 資料整合性チェック | `document-review-consistency` |
| 資料作成 | 議事録作成 | `document-production-minutes` |
| コミュニケーション | メール文案作成 | `communication-email-draft` |
| 調査・分析 | 公開情報調査 | `research-analysis-public-info` |
| AI運用 | 生成AI向け指示文作成 | `ai-operations-prompt-drafting` |
| 開発・ツール支援 | 簡易スクリプト作成 | `engineering-support-script` |
| ビジュアル制作 | 図解作成 | `visual-production-diagram` |

正式な skill 一覧は `.agents/skills/*/SKILL.md` をスキャンして確認します。`domains_ja/task_catalog.md` や README は人間向けの説明であり、skill の登録簿ではありません。

## 5. 新しい skill の追加

新しいタスクを追加するときの必須作業は、原則として `.agents/skills/{business-domain}-{task-name}/SKILL.md` の追加だけです。

必要に応じて、次を追加・更新します。

- 人間向けの分類説明: `domains_ja/`
- 共通運用ルール: `operating_ja/`
- 出力形式: `templates/`

skill 名は次の形式にします。

```text
{business-domain}-{task-name}
```

例:

```text
information-organization-glossary
document-review-terminology
project-management-decision-log
```

## 6. Codex 固有設定

Codex 固有の設定は、原則として移植先プロジェクトフォルダ内の `.codex/config.toml` で完結させます。

`$HOME/.codex/config.toml` は、プロジェクトの `trust_level` だけを扱う個人環境側の台帳とします。モデル、承認ポリシー、サンドボックス、TUI、MCP サーバー、実験的機能などの運用設定は、プロジェクト側の `.codex/config.toml` に置きます。

このテンプレート管理プロジェクトでは、誤適用を防ぐため Codex 設定雛形を `codex_config_template.toml` として保持します。インストーラーを使うと、移植先では `.codex/config.toml` として配置されます。導入先プロジェクトの運用ルールとセキュリティ要件に合わせて必要な項目だけを有効化します。

PowerShell 環境での起動時エラーを避けるため、`$HOME/.codex/config.toml` とプロジェクト側の `.codex/config.toml` のいずれにも、shell へ環境変数を明示的に渡す `[shell_environment_policy]` は置かない方針とします。

`.codex/rules/` などの追加機能は、必要になった場合だけ追加します。初期状態では、実験的機能やプロジェクトごとの差が大きい設定を過剰に固定しません。

## 7. プロジェクト固有情報の保存先

プロジェクト固有情報は、`.agents/`、`.codex/`、`domains_ja/`、`operating_ja/`、`templates/` に保存しません。

このテンプレートには、新規導入直後に使える空の `project-local/` 雛形を含めています。実案件の情報を記入した後の `project-local/` は非移植領域です。

推奨保存先:

```text
プロジェクトルート/project-local/
プロジェクトルート/codex_*.md
プロジェクトルート/*_codex_*.md
```

例:

```text
project-local/project-context.md
project-local/file-name-index.md
project-local/source-map.md
project-local/work-log.md
project-local/known-people-and-orgs.md
project-local/generated-outputs-index.md
```

実案件の情報を記入した後の `project-local/` は横展開対象外です。他プロジェクトへコピーしないでください。

## 8. 新規プロジェクトへ導入した直後に行うこと

1. プロジェクトルートの `AGENTS.md` を確認する。
2. 必要に応じて `$HOME/.codex/config.toml` に対象プロジェクトの `trust_level` だけを追加する。
3. `operating_ja/project_intake.md` に沿って、案件目的、成果物、期限、会議体、主要論点、リスクを確認する。
4. `operating_ja/project_local_storage.md` に従い、プロジェクト固有情報の保存先を決める。
5. `operating_ja/low_confidence_sources.md` に従い、`_gpt` / `_tmp` / 変換済みファイルを低信頼として扱う。
6. 必要に応じて `templates/project_context_template.md` を使い、プロジェクト側に project context を新規作成する。
7. 共通領域には、案件名、人名、メール本文、ファイル索引、TODO実体を保存しない。

## 9. 他プロジェクトへの移植

標準コピー対象は以下です。

```text
AGENTS.md
.agents/
codex_config_template.toml -> .codex/config.toml
domains_ja/
operating_ja/
templates/
project-local/
```

`README.md` は導入説明として必要な場合だけコピーします。移植先に既存 `README.md` がある場合は上書きせず、別名保存または参照のみとします。

`codex_config_template.toml` は、新規プロジェクトにまだ `.codex/config.toml` がない場合だけコピーします。既存 `.codex/config.toml` がある場合は上書きせず、必要な設定だけ差分提案にしてください。

`project-local/` は、新規プロジェクトにまだ同名フォルダがない場合だけ、空テンプレートとしてコピーします。既存 `project-local/` がある場合は上書きせず、必要なテンプレートだけ差分提案にしてください。

更新用スクリプトは、通常は共通テンプレート領域だけを `.codex-sample` の内容へ同期します。ただし、既存 `.codex/config.toml` と既存 `project-local/` は更新しません。`scripts/update_codex_sample.ps1 <project-root> -Force` または `scripts/update_codex_sample.sh --force <project-root>` を使うと、既存 `README.md` だけを強制的に置き換えます。

`.agents/`、`domains_ja/`、`operating_ja/`、`templates/` はディレクトリ単位で同期するため、雛形側で廃止された配下ファイルは移植先からも削除されます。`.codex/config.toml` と `project-local/` は、ローカル調整や案件固有情報を含み得るため、`--force` / `-Force` 指定時も既存ファイル・ディレクトリは削除・置換しません。存在しない場合だけ雛形からコピーします。

既存 `AGENTS.md` がある場合は上書きせず、`templates/agents_update_proposal_template.md` を使って追記案を作成し、人間が必要な範囲だけ反映してください。

`codex_config_template.toml` は、移植先ではインストーラーや更新スクリプトにより `.codex/config.toml` として扱います。既存 `.codex/config.toml` がある場合は上書きせず、必要な設定だけ差分提案にしてください。`$HOME/.codex/config.toml` は標準コピー対象外とし、各利用者がプロジェクトの `trust_level` だけを追加します。

コピーしないことを推奨するもの:

```text
.codex/sessions/
.codex/archived_sessions/
.codex/log/
.codex/cache/
.codex/.tmp/
.codex/tmp/
.codex/vendor_imports/
.codex/*.sqlite
.codex/auth.json
.codex/history.jsonl
.codex/models_cache.json
project-local/ に記入済みの案件固有情報
codex_*.md
*_codex_*.md
```

## 10. 運用上の注意

- 人間が管理するのは `AGENTS.md`, `.agents/`, `codex_config_template.toml`, `domains_ja/`, `operating_ja/`, `templates/` の追加・更新に限定する。移植先では `codex_config_template.toml` を `.codex/config.toml` として扱う。
- 既存の Codex 内部ファイル、ログ、DB、セッション、キャッシュ、一時ファイルは直接編集しない。
- skill は汎用手順に徹し、案件固有の例を入れない。
- 出力成果物は、各プロジェクトの `AGENTS.md` に従う。
