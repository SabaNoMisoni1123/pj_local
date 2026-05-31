# Prompt: `.codex-sample/.agents` 命令セット精査・改善

あなたは、このプロジェクトのリポジトリルートで Codex として実行されています。  
目的は、移植用アウトプットである `.codex-sample/.agents` ディレクトリ、`.codex-sample/.agents/skills/**/SKILL.md`、および移植先で Codex が読み込む雛形としての `.codex-sample/AGENTS.md` を精査し、必要に応じて安全に修正することです。

## 0. 最重要方針

この作業では、単にファイルを増やすのではなく、次の状態を目指してください。

1. `.codex-sample/AGENTS.md` は、移植先で常時適用される最小限の全体ルールとして機能する。
2. `.codex-sample/.agents/skills/<skill-name>/SKILL.md` は、特定タスクで必要なときだけ発火する再利用可能なワークフローとして機能する。
3. `.codex-sample/.agents/AGENTS.md` または `.codex-sample/.agents/README.md` は、`.codex-sample/.agents` ディレクトリ全体の設計思想・索引・保守方針を説明する内部ドキュメントとして機能する。
4. 個別スキルは、巨大な万能プロンプトではなく、明確な発火条件・手順・検証方法を持つ小さな能力単位として整理する。
5. 長い説明、参考資料、仕様、テンプレート、スクリプトは `references/`、`assets/`、`scripts/` に逃がし、`SKILL.md` は軽量に保つ。

既存の内容に価値がある場合は、安易に全面置換せず、差分が小さく、可逆的で、意図が追いやすい修正を優先してください。

## 1. 前提と読み込み対象

まず、次のファイル・ディレクトリを探索してください。

```text
.
├── AGENTS.md
├── AGENTS.override.md
├── .codex-sample/
│   ├── AGENTS.md
│   ├── .agents/
│   │   ├── AGENTS.md
│   │   ├── AGENT.md
│   │   ├── ATENTS.md
│   │   ├── README.md
│   │   ├── skills/
│   │   │   └── <skill-name>/
│   │   │       ├── SKILL.md
│   │   │       ├── references/
│   │   │       ├── scripts/
│   │   │       └── assets/
│   │   ├── prompts/
│   │   └── reports/
└── その他、移植用アウトプットまたはエージェント向け命令ファイル
```

### ファイル名の扱い

- 移植先で Codex の常時命令となる雛形は、原則として `.codex-sample/AGENTS.md` として整備する。
- `.codex-sample/.agents/AGENTS.md` は、通常の Codex 実行では自動読み込み対象とは限らないため、常時適用したい内容をそこだけに閉じ込めない。
- `.codex-sample/.agents/AGENT.md` や `.codex-sample/.agents/ATENTS.md` が存在する場合は、命名ミスまたは旧案の可能性として扱う。
- 既存ファイルを削除・リネームする前に、同等内容を正しい場所へ統合し、変更理由をレポートに残す。
- `ATENTS.md` が存在する場合は、明らかな誤記として扱ってよいが、競合がある場合は勝手に削除しない。

## 2. 参考にする設計原則

次の原則に基づいて精査してください。

### 2.1 `.codex-sample/AGENTS.md` と Skill の役割分担

`.codex-sample/AGENTS.md` に置くべきもの：

- すべての作業に常時適用するプロジェクトルール
- プロジェクト構造
- 禁止事項
- テスト・検証・ビルドの基本コマンド
- 変更時の安全確認
- `.agents/skills` の使い方への短い誘導

Skill に置くべきもの：

- 特定タスクでのみ必要な専門手順
- ファイル形式別の処理手順
- 調査、レビュー、ドキュメント作成、MCP、Office文書、Python自動化などの再利用可能なワークフロー
- 実行コマンド、検証ループ、失敗時のリカバリ
- そのタスク固有の gotchas

`.codex-sample/AGENTS.md` に大量の業務手順を詰め込まないでください。  
一方で、全タスクに影響する安全ルールやプロジェクト固有の制約は、個別Skillだけに閉じ込めないでください。

### 2.2 Progressive disclosure

`SKILL.md` は、エージェントが最初に読むべき最小限の指示に留めてください。

- 詳細仕様は `references/` に分離する。
- テンプレートは `assets/` に分離する。
- 再現性が必要な処理は `scripts/` に分離する。
- `SKILL.md` には、「どの条件でどの補助ファイルを読むか」を明示する。
- 「参考資料は references を参照」のような曖昧な書き方を避ける。
- 例：`APIエラーが発生した場合のみ references/api-errors.md を読む。`

### 2.3 description の品質

各 `SKILL.md` の YAML frontmatter にある `description` は、スキル発火の主要な判断材料です。  
次を満たすように修正してください。

- `Use this skill when ...` 形式を基本とする。
- ユーザーの意図に基づいて書く。実装手段の説明に偏らない。
- 発火すべき場面と、発火すべきでない場面の境界を簡潔に示す。
- 重要なトリガーワードを前方に置く。
- 長すぎる description は圧縮する。
- 目安として 1024 文字以内に収める。
- フォルダ名と `name` が一致しているか確認する。
- `name` は lowercase-kebab-case を原則とする。

### 2.4 Skill 本文の品質

各 `SKILL.md` 本文は、次の観点で改善してください。

- 一般論ではなく、プロジェクト固有・業務固有・ツール固有の注意点を優先する。
- 「ベストプラクティスに従う」「適切に処理する」のような曖昧な表現を減らす。
- 実行順序が重要な作業は、手順番号またはチェックリストで示す。
- 失敗しやすい作業には gotchas を置く。
- 破壊的操作、外部送信、依存関係追加、生成物上書きには安全確認を入れる。
- 検証方法を明記する。
- 可能なら「作業 → 検証 → 修正 → 再検証」のループを入れる。
- 複数の方法を並列に列挙するのではなく、デフォルト手段を1つ選ぶ。
- 代替手段は、必要な場合に限り短く示す。
- 既存プロジェクトの実ファイル・実コマンド・実フォルダ構成に合わせる。
- 使われていない抽象的な説明は削る。

## 3. 作業手順

以下の順に作業してください。

### Step 1: 現状把握

次を確認してください。

1. Gitリポジトリかどうか。
2. 現在の作業ディレクトリ。
3. リポジトリルートの `AGENTS.md` / `AGENTS.override.md` と、移植用雛形である `.codex-sample/AGENTS.md` の有無。
4. `.codex-sample/.agents` ディレクトリの有無。
5. `.codex-sample/.agents/skills/**/SKILL.md` の一覧。
6. `.codex-sample/.agents` 配下の `references/`、`scripts/`、`assets/`、`prompts/`、`reports/` の有無。
7. 既存の `README.md`、プロジェクト構成、主要言語、テストコマンド、ビルドコマンド。
8. 秘密情報や個人情報が命令セットに混入していないか。

必要に応じて、次のようなコマンドで確認してください。

```bash
pwd
git rev-parse --show-toplevel 2>/dev/null || true
find . -maxdepth 6 \( -name 'AGENTS.md' -o -name 'AGENTS.override.md' -o -name 'SKILL.md' -o -name 'AGENT.md' -o -name 'ATENTS.md' \) -print
find .codex-sample/.agents -maxdepth 4 -type f 2>/dev/null | sort
```

### Step 2: 構造の妥当性チェック

`.codex-sample/.agents` が存在しない場合は、必要最小限で次の構造を作成してください。

```text
.codex-sample/.agents/
├── AGENTS.md
├── README.md
├── skills/
├── prompts/
└── reports/
```

`.codex-sample/.agents/skills` が存在しない場合は作成してください。  
ただし、具体的な必要性が確認できないスキルを大量生成しないでください。

推奨構造は次の通りです。

```text
.codex-sample/.agents/
├── AGENTS.md              # .agents全体の設計・索引・保守ルール
├── README.md              # 人間向け説明
├── prompts/               # Codexに渡す保守用プロンプト
├── reports/               # 監査・改善レポート
└── skills/
    └── <skill-name>/
        ├── SKILL.md       # 必須
        ├── references/    # 任意
        ├── scripts/       # 任意
        └── assets/        # 任意
```

### Step 3: `.codex-sample/AGENTS.md` の整備

`.codex-sample/AGENTS.md` が存在しない場合は、必要最小限のものを作成してください。  
既に存在する場合は、冗長な説明を増やさず、次の内容が欠けているときのみ追加・修正してください。

含めるべき内容：

- 移植先での作業方針
- `.agents/skills` の存在と使い分け
- 作業前に関連Skillを確認すること
- 変更後に実施すべき検証
- 破壊的操作・外部送信・依存関係追加の確認ルール
- `.agents/AGENTS.md` を内部設計文書として参照すること

`.codex-sample/AGENTS.md` の例：

```markdown
# AGENTS.md

## Repository instructions

- Before modifying agent instructions, inspect `.agents/AGENTS.md` and relevant files under `.agents/skills/`.
- Use `.agents/skills/<skill-name>/SKILL.md` for task-specific workflows. Keep this file focused on always-on repository rules.
- Prefer small, reversible changes. Do not rewrite instruction files wholesale when targeted edits are enough.
- Do not add production dependencies, run destructive commands, or send project data to external services without explicit approval.
- After changing instructions or scripts, run the lightest available validation and summarize the diff.
```

この例をそのまま使う必要はありません。既存のプロジェクト実態に合わせてください。

### Step 4: `.codex-sample/.agents/AGENTS.md` の整備

`.codex-sample/.agents/AGENTS.md` は、移植後の `.agents` 配下を管理するためのハブ文書として整備してください。  
存在しない場合は作成してください。

含めるべき内容：

1. 移植後の `.agents` ディレクトリの目的
2. 移植後の `AGENTS.md` と `SKILL.md` の役割分担
3. スキル一覧
4. 各スキルの用途
5. 新しいスキルを追加する基準
6. 既存スキルを分割・統合・削除する基準
7. `references/`、`scripts/`、`assets/` の使い分け
8. 命令セット更新時の検証手順
9. 禁止事項

### Step 5: 各 `SKILL.md` の監査

すべての `.codex-sample/.agents/skills/**/SKILL.md` を確認し、次のチェックを行ってください。

#### 必須チェック

- YAML frontmatter がある。
- `name` がある。
- `description` がある。
- 親ディレクトリ名と `name` が一致する。
- `name` は lowercase-kebab-case。
- `description` は発火条件として十分に具体的。
- `description` は過度に広すぎない。
- 本文に具体的な手順がある。
- 検証方法がある。
- 必要な補助ファイルへの参照がある。
- 存在しない補助ファイルを参照していない。
- 危険なコマンドや外部送信が無条件に実行される指示になっていない。

#### 推奨チェック

- `Gotchas` セクションが必要に応じてある。
- 入力・出力の期待形式が明示されている。
- 失敗時のリカバリがある。
- 具体的なコマンド例がある。
- 長すぎる説明は `references/` に分離されている。
- テンプレートは `assets/` に分離されている。
- 繰り返し処理は `scripts/` に分離されている。
- `SKILL.md` は概ね 500 行以下、または 5000 tokens 以下を目安に保たれている。

### Step 6: スキルの分類・重複整理

既存スキルを、少なくとも次の観点で分類してください。

- core / governance
- research / source-grounding
- coding / implementation
- testing / validation
- documentation / markdown
- office-documents / spreadsheet / slide / pdf / docx
- data-analysis
- mcp / external-tools
- project-management
- review / quality-assurance

次を検出した場合は、必要に応じて修正してください。

- 同じ役割のスキルが重複している。
- 1つのスキルが広すぎる。
- 複数スキルに同じ常時ルールが重複している。
- `description` が似すぎていて発火競合しそう。
- 汎用ルールが個別スキルに閉じ込められている。
- 個別ワークフローが `.codex-sample/AGENTS.md` に入りすぎている。

統合・分割・削除が必要な場合は、いきなり大規模変更せず、最小変更で改善してください。  
大きな再編が必要な場合は、ファイル修正ではなく、まず `.codex-sample/.agents/reports/` に提案として記録してください。

### Step 7: 足りないスキルの追加判断

「万能エージェント化」を目指す場合でも、使う見込みが薄いスキルを大量に作らないでください。  
ただし、プロジェクトの実態から必要性が明確な場合は、最小限のスキルを追加してください。

追加候補の例：

- `instruction-governance`
  - `.codex-sample/.agents` 自体を点検・更新するためのスキル
- `source-grounded-research`
  - 公開情報や根拠付き調査を行うためのスキル
- `markdown-authoring`
  - Markdown文書を厳密に作成・整形するためのスキル
- `project-context-maintenance`
  - プロジェクト文脈、決定事項、TODOを更新するためのスキル
- `python-automation`
  - 小規模Python自動化・検証スクリプト作成のためのスキル
- `office-document-workflow`
  - Word、PowerPoint、Excel、PDFなどの成果物処理が多い場合のスキル
- `mcp-integration`
  - MCPサーバーの設定・検証・トラブルシュート用スキル
- `quality-review`
  - 作業後の自己レビュー、差分確認、検証実行のスキル

追加する場合は、必ず次を満たしてください。

- 実際のプロジェクト用途に紐づいている。
- `description` が明確。
- 本文は短く、検証可能。
- 既存スキルと重複しない。
- 必要な補助資料がなければ、仮の巨大資料を作らない。
- 「今後必要になりそう」という理由だけで大量追加しない。

### Step 8: 安全性チェック

命令セット内に次の問題がないか確認し、必要に応じて修正またはレポート化してください。

- APIキー、トークン、パスワード、個人情報が書かれている。
- 外部サービスへの送信を無条件に許可している。
- `rm -rf`、強制push、履歴改変、権限変更などを軽率に実行する指示がある。
- 依存関係追加を無条件に許可している。
- 生成物や既存資料の上書きルールが曖昧。
- ユーザー確認が必要な作業が明示されていない。
- ライセンス不明の外部スキルをそのまま取り込んでいる。

外部リポジトリのスキルを参考にする場合でも、丸ごとコピーせず、このプロジェクトに必要な考え方だけを取り込んでください。  
第三者のコードやスクリプトを追加する場合は、ライセンスと出典を明記してください。

### Step 9: 検証

修正後、可能な範囲で次を実施してください。

#### 構文・構造検証

```bash
find .codex-sample/.agents/skills -name SKILL.md -print | sort
```

YAML frontmatter の簡易検証が必要な場合は、Pythonで実行してください。

```bash
python - <<'PY'
from pathlib import Path
import re

ok = True
for path in sorted(Path(".codex-sample/.agents/skills").glob("*/SKILL.md")):
    text = path.read_text(encoding="utf-8")
    if not text.startswith("---"):
        print(f"[NG] no frontmatter: {path}")
        ok = False
        continue
    m = re.match(r"---\n(.*?)\n---\n", text, re.S)
    if not m:
        print(f"[NG] malformed frontmatter: {path}")
        ok = False
        continue
    fm = m.group(1)
    name = None
    desc = None
    for line in fm.splitlines():
        if line.startswith("name:"):
            name = line.split(":", 1)[1].strip().strip('"').strip("'")
        if line.startswith("description:"):
            desc = line.split(":", 1)[1].strip().strip('"').strip("'")
    if not name:
        print(f"[NG] missing name: {path}")
        ok = False
    if not desc:
        print(f"[NG] missing description: {path}")
        ok = False
    if name and name != path.parent.name:
        print(f"[NG] name/folder mismatch: {path} name={name} folder={path.parent.name}")
        ok = False
    if name and not re.fullmatch(r"[a-z0-9]+(-[a-z0-9]+)*", name):
        print(f"[NG] invalid lowercase-kebab-case name: {path} name={name}")
        ok = False
    if desc and len(desc) > 1024:
        print(f"[NG] description too long: {path} chars={len(desc)}")
        ok = False

if ok:
    print("[OK] SKILL.md frontmatter validation passed")
else:
    raise SystemExit(1)
PY
```

#### 参照切れチェック

`SKILL.md` から参照されている `references/`、`scripts/`、`assets/` のファイルが存在するか確認してください。  
簡易確認でよいですが、明らかな参照切れは修正してください。

#### Git差分確認

```bash
git diff -- . ':!*.lock' 2>/dev/null || true
```

## 4. 修正時の優先順位

衝突や迷いがある場合は、次の優先順位で判断してください。

1. ユーザーの明示方針
2. 既存プロジェクトの実態
3. Codex が自動読み込みできる構造
4. Agent Skills の一般仕様
5. 人気リポジトリで見られる設計パターン
6. 一般的なAIエージェント運用のベストプラクティス

「万能化」のためにファイルを増やしすぎるより、発火条件が明確で、検証可能で、保守しやすいスキルセットを優先してください。

## 5. 成果物

作業後、必ず次を出力または作成してください。

### 5.1 監査レポート

`.codex-sample/.agents/reports/skillset-audit-YYYYMMDD-HHMM.md` を作成してください。  
日時は実行環境の現在時刻を使ってください。

レポートには次を含めてください。

```markdown
# Skillset audit report

## Summary

- 対象:
- 実施日時:
- 主な変更:
- 未対応事項:

## Inventory

| Path | Type | Status | Notes |
|---|---|---|---|

## Issues found

| Severity | Path | Issue | Action |
|---|---|---|---|

## Changes made

| Path | Change | Reason |
|---|---|---|

## Skills

| Skill | Trigger quality | Scope quality | Validation | Notes |
|---|---:|---:|---:|---|

## Recommended next steps

1.
2.
3.
```

### 5.2 修正済みファイル

必要に応じて、次を作成・更新してください。

- `.codex-sample/AGENTS.md`
- `.codex-sample/.agents/AGENTS.md`
- `.codex-sample/.agents/README.md`
- `.codex-sample/.agents/skills/<skill-name>/SKILL.md`
- `.codex-sample/.agents/skills/<skill-name>/references/*`
- `.codex-sample/.agents/skills/<skill-name>/scripts/*`
- `.codex-sample/.agents/skills/<skill-name>/assets/*`

### 5.3 最終応答

最終応答では、次だけを簡潔に報告してください。

1. 変更したファイル
2. 変更理由
3. 実行した検証
4. 残課題
5. 次に人間が確認すべき点

## 6. 禁止事項

次は禁止します。

- 既存の命令セットを無断で全面置換する。
- 意図が読み取れる既存ルールを削除する。
- 外部リポジトリのスキルをライセンス確認なしでコピーする。
- 大量の空スキルや中身の薄いスキルを生成する。
- `.codex-sample/.agents/AGENTS.md` だけに常時適用ルールを置き、`.codex-sample/AGENTS.md` を空にする。
- 検証せずに「完了」と報告する。
- 秘密情報をレポートに平文で残す。
- ユーザー確認なしに破壊的コマンドを実行する。
- ユーザー確認なしに外部ネットワークへプロジェクトファイルを送信する。

## 7. 判断に迷う場合

判断に迷う場合は、次のように扱ってください。

- 小さな表記修正・参照切れ修正・frontmatter不備修正は実施してよい。
- スキルの大規模統合・削除・命名体系変更は、まずレポートで提案する。
- セキュリティ上危険な記述は、可能な範囲で無効化または警告化し、レポートに残す。
- プロジェクト固有情報が不足している場合は、汎用スキルを大量生成せず、最小限の雛形と TODO を残す。
- Codex が自動読み込みできない位置に重要ルールがある場合は、`.codex-sample/AGENTS.md` から参照させるか、適切な位置への移動を提案する。

## 8. 実行開始

上記方針に従い、まず現状把握を行ってください。  
その後、必要最小限の修正を実施し、検証し、監査レポートを作成してください。
