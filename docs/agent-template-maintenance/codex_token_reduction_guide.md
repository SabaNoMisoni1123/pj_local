# Codex の利用トークン数を下げる方法

## 前提

Codex の利用量は、単純なメッセージ数ではなく、以下の要素で増えやすい。

- タスクの規模
- タスクの複雑さ
- コードベースの大きさ
- 長時間セッション
- 保持するコンテキスト量
- 読み込むファイル・ログ・検索結果の量

そのため、削減方針は次の3点に集約される。

1. 毎回読み込まれる指示を短くする
2. Codex に読ませるファイル・ログ・検索範囲を狭める
3. モデル設定・推論強度・サブエージェント利用を抑える

---

## 1. `AGENTS.md` を短くする

### 置き場所

- グローバル設定：`~/.codex/AGENTS.md`
- リポジトリ設定：`<repo>/AGENTS.md`
- サブディレクトリ別設定：`<repo>/src/AGENTS.md` など

### 適用順序

Codex は起動時に `AGENTS.md` を読み込む。  
基本的には、以下の順で読み込まれる。

1. グローバル設定
2. プロジェクトルート
3. カレントディレクトリに近いサブディレクトリ設定

### 優先順位

- より深いディレクトリの `AGENTS.md` が優先される
- `AGENTS.override.md` がある場合は通常の `AGENTS.md` より優先される
- プロジェクト指示は既定で最大 32KiB まで読み込まれる

### 方針

`AGENTS.md` は「長い設計思想」ではなく、Codex が実行判断に使う最低限のルールだけにする。

#### 良い例

```md
# AGENTS.md

## Project
- Vue 3 + TypeScript + Vite
- Main source: src/
- Do not edit generated files in dist/

## Commands
- Type check: npm run typecheck
- Test: npm test
- Build: npm run build

## Rules
- Inspect only relevant files before editing.
- Do not run broad recursive searches unless necessary.
- Keep explanations concise.
```

#### 避けるべき内容

- プロジェクトの歴史
- 詳細すぎる設計思想
- 毎回不要なコーディング規約の全文
- 長い README の重複
- 使う可能性が低い手順書

---

## 2. `.codex/config.toml` で軽量設定にする

### 置き場所

- プロジェクト固有：`<repo>/.codex/config.toml`
- 個人環境側：`~/.codex/config.toml`

### 適用順序

このテンプレートでは、モデル、承認ポリシー、サンドボックス、MCP などの運用設定はプロジェクト固有の `.codex/config.toml` に集約する。

`~/.codex/config.toml` は、プロジェクトの `trust_level` だけを扱う個人環境側の台帳とし、プロジェクト共通運用設定は置かない。

ただし、このテンプレート管理リポジトリ自身では Codex 設定の誤適用を避けるため、雛形ファイル名を `codex_config_template.toml` とする。インストーラーが移植先でだけ `.codex/config.toml` として配置する。

### 優先順位

- プロジェクト側の `.codex/config.toml` は、信頼済みプロジェクトでのみ読み込まれる
- 一部のプロバイダ・認証・テレメトリ系設定は、プロジェクト設定からは上書きできない

### 最小構成例

```toml
# <repo>/.codex/config.toml

model_reasoning_effort = "low"
model_verbosity = "low"
model_reasoning_summary = "concise"
project_doc_max_bytes = 12000
```

```toml
# ~/.codex/config.toml

[projects.'c:\path\to\project']
trust_level = "trusted"
```

### 各設定の意味

```toml
model_reasoning_effort = "low"
```

推論努力量を下げる。  
軽微な修正・調査ではまず `low` で十分な場合が多い。  
ただし、重い設計判断や大規模リファクタでは精度が落ちる可能性がある。

```toml
model_verbosity = "low"
```

回答の冗長さを下げる。  
出力トークンを減らす目的で有効。

```toml
model_reasoning_summary = "concise"
```

推論サマリを短くする。  
不要な場合は `none` も候補になる。

```toml
project_doc_max_bytes = 12000
```

`AGENTS.md` 等のプロジェクト指示読み込み上限を下げる。  
下げすぎると重要ルールが読まれないため、まずは 12KB〜16KB 程度が無難。

---

## 3. コマンド実行時に一時的に軽量化する

毎回ではなく、軽い作業だけ軽量設定にしたい場合は `-c` で上書きする。

```bash
codex \
  -c model_reasoning_effort=low \
  -c model_verbosity=low \
  "src/components/Button.vue の型エラーだけ修正してください。関係ないファイルは読まないでください。"
```

モデル自体を変える場合は `--model` / `-m` を使う。

```bash
codex -m gpt-5.5 "この関数だけレビューしてください"
```

ただし、どのモデルが最も低コストかは、プラン・時点・利用面により変わるため、固定で断定しない方が安全。

---

## 4. プロンプトで探索範囲を制限する

Codex はコードを読むほど、実行結果を保持するほど、コンテキストが増える。  
依頼時に範囲を明示する。

### 良い例

```text
src/components/UserCard.vue だけを対象にしてください。
まず該当ファイルだけ読んで、必要がある場合のみ関連ファイルを1〜2個確認してください。
修正後は npm run typecheck のみ実行してください。
説明は変更点と確認結果だけでよいです。
```

### 悪い例

```text
このプロジェクトを見て直してください。
```

### 特に避けるべき依頼

```text
全体を確認して
全部読んで
関係しそうなところを探して
ログを全部見て
```

これらは探索・読み込み・出力が膨らみやすい。

---

## 5. 長いセッションを続けすぎない

長いセッションでは、過去の会話・修正履歴・ログが残り、使用量が増えやすい。  
実務上は、以下の切り分けが有効。

```text
1セッション = 1タスク
```

### 分割例

- セッション1：原因調査だけ
- セッション2：修正だけ
- セッション3：テスト失敗の修正だけ

大きい作業を続ける場合は、Codex に次セッション用の要約を作らせる。

```text
次のCodexセッションに渡すため、現在の状況を1000字以内で要約してください。
変更済みファイル、未解決課題、次に見るべきファイルだけを含めてください。
```

---

## 6. サブエージェントを使いすぎない

サブエージェントは並列化には有効だが、各サブエージェントが独自にモデル・ツール作業を行うため、単一エージェント実行よりトークンを消費しやすい。

トークン削減優先なら、次のように指示する。

```text
サブエージェントは使わず、単一エージェントで順番に確認してください。
```

使うべき場面は、大規模レビューや複数領域の並列調査など、時間短縮の価値がトークン増加を上回る場合に限る。

---

## 7. Skills は「説明を短く・数を増やしすぎない」

Codex Skills は、最初から `SKILL.md` 全文を読むわけではなく、まずスキル名・説明・パスをコンテキストに入れ、必要と判断した場合に全文を読む。

ただし、スキルが多すぎると初期コンテキストが圧迫される。

### 方針

- 汎用すぎる skill は作らない
- `description` は短く、発火条件を明確にする
- `SKILL.md` 本体は必要な手順だけにする
- 使わない skill は無効化または削除する

---

## 8. コマンド出力を絞る

Codex に大量ログを読ませると、そのままコンテキストが増える。

### 避ける例

```bash
npm test
cat huge.log
grep -R "error" .
ls -R
```

### 推奨例

```bash
npm test -- --runInBand
tail -n 80 error.log
rg "targetFunction" src/
rg "error message" src/ tests/
```

Codex への指示例：

```text
コマンド出力は必要最小限にしてください。
長いログは tail / rg / head で絞ってください。
```

---

## 9. 実用上のおすすめ設定

### `<repo>/.codex/config.toml`

```toml
model_reasoning_effort = "low"
model_verbosity = "low"
model_reasoning_summary = "concise"
project_doc_max_bytes = 12000
```

### `~/.codex/config.toml`

```toml
[projects.'c:\path\to\project']
trust_level = "trusted"
```

### `AGENTS.md`

```md
# AGENTS.md

## Project
- Main source: src/
- Tests: tests/
- Do not edit dist/ or generated files.

## Commands
- Type check: npm run typecheck
- Test changed area only when possible.

## Token discipline
- Read only files relevant to the requested task.
- Prefer rg/head/tail over broad recursive output.
- Keep final responses concise.
- Do not use subagents unless explicitly requested.
```

---

## 効果が大きい順

| 優先度 | 対策 | 効果 |
|---:|---|---|
| 1 | `AGENTS.md` を短くする | 毎回の固定トークンを削減 |
| 2 | 作業対象ファイルを明示する | 探索トークンを削減 |
| 3 | 長いセッションを分割する | 履歴肥大化を防止 |
| 4 | `model_reasoning_effort = "low"` | 推論側の消費を抑制 |
| 5 | `model_verbosity = "low"` | 出力トークンを削減 |
| 6 | サブエージェントを避ける | 並列実行による消費増を回避 |
| 7 | ログ・検索結果を絞る | ツール出力の肥大化を防止 |

---

## 最初に実施するべきこと

まずは以下の2つを優先する。

1. `AGENTS.md` を短くする
2. 依頼時に「対象ファイルだけ見て」と明示する

設定変更よりも、この2つの方が安定して効く。

---

## 参考文献

- OpenAI Help Center, Using Codex with your ChatGPT plan  
  https://help.openai.com/ja-jp/articles/11369540-using-codex-with-your-chatgpt-plan

- OpenAI Developers, AGENTS.md  
  https://developers.openai.com/codex/guides/agents-md

- OpenAI Developers, Codex best practices  
  https://developers.openai.com/codex/learn/best-practices

- OpenAI Developers, Codex config reference  
  https://developers.openai.com/codex/config-reference

- OpenAI Developers, Codex CLI reference  
  https://developers.openai.com/codex/cli/reference

- OpenAI Developers, Codex CLI features  
  https://developers.openai.com/codex/cli/features

- OpenAI Developers, Codex Skills  
  https://developers.openai.com/codex/skills
