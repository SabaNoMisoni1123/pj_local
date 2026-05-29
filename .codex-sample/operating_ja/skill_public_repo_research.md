# GitHub公開SKILL.mdレポジトリ調査

調査日: 2026-05-28

## 目的

本資料は、本環境で整備している `.agents/skills/*/SKILL.md` を改善するため、GitHub上で公開されている人気・有用な `SKILL.md` 関連レポジトリの傾向を整理する。

ここでいう「人気」は、主にGitHub Star数、公開範囲、対応エージェントの広さ、実運用に転用できる設計要素で判断した。Star数は調査時点のGitHub表示に基づく。

## 要約

公開SKILL.mdレポジトリは、大きく次の5類型に分かれる。

| 類型 | 代表例 | 特徴 | 本環境への示唆 |
|---|---|---|---|
| 公式カタログ | `anthropics/skills`, `openai/skills` | 標準仕様、基本構造、公式の配布単位を確認できる | `name` / `description` / 本文 / `references` / `scripts` の基本形を厳格化する |
| 大規模カタログ | `sickn33/antigravity-awesome-skills`, `theneoai/awesome-skills` | 多数のskillを収録し、検索・分類・インストール導線を重視 | skill数が増えた場合、一覧・分類・検索用メタデータが必要 |
| クロスエージェント配布ツール | `vercel-labs/skills`, `FrancyJGLisboa/agent-skill-creator`, `803/skills-supply` | Claude Code、Codex、Cursor、Gemini等への配布互換性を重視 | `.agents/skills/` を標準配置にし、将来の配布・移植を前提にする |
| ドメイン特化カタログ | `bergside/awesome-design-skills`, `WenyuChiou/ai-research-skills`, `arpitg1304/robotics-agent-skills` | 特定業務・専門領域の品質基準や評価観点をskillに埋め込む | 研究・PMO・資料作成など業務カットごとに品質ゲートを明示する |
| skill作成・検証支援 | `FrancyJGLisboa/agent-skill-creator`, `anthropics/skills`内のskill creator | skill作成、検証、セキュリティチェック、評価をワークフロー化 | 本環境にも作成ガイド、レビュー観点、評価プロンプトを追加する |

## 標準仕様・実装上の前提

Agent Skillsの公開仕様では、skillは `SKILL.md` を含むフォルダとして扱われる。基本的な探索先として `.agents/skills/` が広く使われ、`name` と `description` はエージェントがskillを発見・選択するための主要メタデータになる。

重要な設計原則は「段階的開示」である。セッション開始時には `name` と `description` だけを小さく読み、必要になったときに `SKILL.md` 本文を読み、さらに必要なときだけ `references/`、`scripts/`、`assets/` を参照する。この考え方は、skill数が増えてもコンテキストを圧迫しにくい。

本環境の `.codex-sample/.agents/skills/*/SKILL.md` も、すでにこの方向と整合している。今後の改善では、特に `description` の起動条件、本文の出力契約、参照ファイルの切り出し、評価観点の追加が有効である。

## 人気・有用レポジトリ一覧

| レポジトリ | Star | 位置づけ | 注目点 | 本環境で参考にする点 |
|---|---:|---|---|---|
| [anthropics/skills](https://github.com/anthropics/skills) | 142k | Claude向けAgent Skills公式実装・事例集 | `skills/`, `spec/`, `template/` を含み、Creative、Development、Enterprise、Document系の例がある | 公式サンプルとして、skillの分割粒度、`references/`・`scripts/`・`assets/` の使い方を参照する |
| [sickn33/antigravity-awesome-skills](https://github.com/sickn33/antigravity-awesome-skills) | 38.9k | 1,400件超の大規模agentic skillsカタログ | Claude Code、Cursor、Codex CLI、Gemini CLI等を横断し、カタログ、バンドル、ワークフロー、プラグイン配布を持つ | skillが増えた場合の分類、検索、バンドル化、ワークフロー化の参考にする |
| [openai/skills](https://github.com/openai/skills) | 20.6k | Codex向けSkills Catalog | `.system`、`.curated`、`.experimental` のように成熟度別に整理し、`$skill-installer` による導入を想定 | 本環境でも「標準搭載候補」「任意導入候補」「実験候補」のような成熟度管理を検討する |
| [vercel-labs/skills](https://github.com/vercel-labs/skills) | 20.3k | open agent skills ecosystem向けCLI | `npx skills add` でGitHub・GitLab・任意Git・個別skillパスから導入でき、多数のエージェントに対応 | 将来、`.codex-sample` を外部配布する場合のインストールUXと互換性確認に使う |
| [FrancyJGLisboa/agent-skill-creator](https://github.com/FrancyJGLisboa/agent-skill-creator) | 1.2k | ワークフローからskillを生成する支援ツール | 既存ドキュメント、リンク、コード、PDF、議事録等からskillを生成し、検証・セキュリティスキャンも重視 | 本環境に「skill作成プロセス」「受入チェック」「セキュリティ確認」を追加する際の参考にする |
| [bergside/awesome-design-skills](https://github.com/bergside/awesome-design-skills) | 993 | デザイン系SKILL.mdカタログ | `SKILL.md` と人間向け `DESIGN.md` を併置し、アクセシビリティ、品質ゲート、Do/Don'tを明示 | 資料作成・図解作成skillにも、人間向け意図説明とエージェント向け実行規約を分ける設計を検討する |
| [mxyhi/ok-skills](https://github.com/mxyhi/ok-skills) | 379前後 | Codex/Claude/Cursor等向け実用skill集 | 40件程度の実用skillと `AGENTS.md` playbookを組み合わせる | 本環境の `AGENTS.md` とskill群の連動設計の参考にする |
| [arpitg1304/robotics-agent-skills](https://github.com/arpitg1304/robotics-agent-skills) | 241 | ロボティクス特化skill集 | skillあり・なしの比較評価を `evals/` で示し、専門領域の品質差分を可視化 | 研究・分析・資料レビューskillでも、Before/After評価プロンプトや期待品質を用意する |
| [WenyuChiou/ai-research-skills](https://github.com/WenyuChiou/ai-research-skills) | 80 | 研究ワークフロー特化skill集 | 文献調査、研究設計、プロジェクトメモリ、論文執筆、クロスエージェント委任を扱う | シンクタンク・研究員向けの本環境と業務領域が近く、調査・分析skillの粒度設計に有用 |
| [803/skills-supply](https://github.com/803/skills-supply) | 32 | 複数エージェントへのskill同期ツール | `agents.toml` を単一の管理元にし、Claude Code、Codex、OpenCode等へ同期する | 将来、利用者ごとの導入先が分かれる場合に、配布先管理の考え方を参照する |

## レポジトリ別の観察

### 1. `anthropics/skills`

公式の参考実装として最重要である。基本構造は、skillフォルダ、必須の `SKILL.md`、必要に応じた `scripts/`、`references/`、`assets/` という構成である。

参考にすべき点:

- `description` を単なる説明ではなく、発動条件として書く。
- 複雑なskillは、本文に全て詰め込まず、追加資料を `references/` に切り出す。
- ドキュメント生成、表計算、PDF、PPTXなど、実務に近いDocument Skillsを含む。
- 公式例でも「必ず自分の環境でテストする」前提が明記されているため、本環境でもskillをテンプレートとして盲信せず、導入先プロジェクトで確認する運用が必要。

### 2. `openai/skills`

Codex向けの公式カタログであり、本環境との親和性が高い。`.system`、`.curated`、`.experimental` のように配置が分かれており、成熟度や配布対象を管理する発想がある。

参考にすべき点:

- 本環境のskillも、将来的には「標準」「任意」「実験」の状態管理があると運用しやすい。
- `skill-installer` のように、導入をskill自体で支援する考え方がある。
- 個別skillにはライセンスや依存関係の確認が必要である。

### 3. `sickn33/antigravity-awesome-skills`

大規模カタログとして、skill数が増えた後の管理方法の参考になる。単に多数の `SKILL.md` を置くだけではなく、カタログ、索引、バンドル、ワークフロー、ツール別導入ガイドを整備している。

参考にすべき点:

- skillを単体で並べるだけでなく、役割別・用途別のバンドルにする。
- 一連の作業を「ワークフロー」として順序づける。
- カタログ生成物とsource skillを分け、生成物の更新責任を明確にする。
- 大規模化すると品質のばらつきが出るため、受入基準と検証が必要になる。

### 4. `vercel-labs/skills` / `803/skills-supply`

これらはskillそのものより、配布・同期・互換性の考え方が参考になる。複数のAI coding agentが `SKILL.md` を扱う流れが強まり、`.agents/skills/` はクロスエージェント互換の置き場所として重要になっている。

参考にすべき点:

- `.agents/skills/` を本環境の標準配置にしている判断は妥当。
- 将来、Claude Code、Codex、Cursor、Geminiなど複数ツールで使うなら、ツール固有仕様への依存を減らす。
- `SKILL.md` のfrontmatter YAMLは厳格に保つ。無効なYAMLはインストーラや他エージェントで読み込めない可能性がある。

### 5. `bergside/awesome-design-skills`

デザイン領域のskill集だが、実務資料・図解・スライド作成にも応用しやすい。特徴は、エージェント向けの `SKILL.md` と、人間向けの `DESIGN.md` を分けている点である。

参考にすべき点:

- `SKILL.md` には実行規約、制約、品質ゲートを置く。
- 人間が読む設計意図や背景は、別ファイルに分離する。
- Do/Don't、アクセシビリティ、品質ゲートのような判定しやすい基準を入れる。
- 本環境の `visual-production-diagram` や `document-production-slide-outline` でも、出力品質の判定軸を明文化できる。

### 6. `WenyuChiou/ai-research-skills`

研究ワークフローに特化しており、本環境の想定利用者に近い。文献調査、研究設計、プロジェクトメモリ、原稿作成、クロスエージェント委任など、研究支援の一連の流れを扱う。

参考にすべき点:

- 調査・分析系skillは、単発タスクではなく「研究ワークフロー全体」の中の位置づけを示すと使いやすい。
- プロジェクトメモリや研究設計のような長期文脈は、skillそのものに案件情報を埋めず、参照・更新先を分けるべき。
- 本環境の `research-analysis-*`、`information-organization-*`、`project-management-*` の接続関係を明確にする余地がある。

### 7. `arpitg1304/robotics-agent-skills`

専門領域の品質差分を評価で示している点が有用である。skillあり・なしの比較により、汎用エージェントが見落としやすい専門要件を可視化している。

参考にすべき点:

- 各skillに「汎用エージェントが失敗しやすい点」を明記する。
- `evals/` のような評価プロンプト集を持つ。
- 期待される改善を、抽象的な品質ではなく、観点別に示す。
- 本環境でも、議事録、資料レビュー、公開情報調査、統計表作成などに評価ケースを用意できる。

## 良いSKILL.mdに共通する設計パターン

### 1. `description` は発動条件として書く

良いskillは、`description` に「何ができるか」だけでなく、「どのようなユーザー依頼で使うべきか」を含めている。

改善方針:

```yaml
description: Use when the user asks to draft, review, restructure, or quality-check a consulting report, including slide outlines, memo drafts, and executive summaries.
```

本環境のskillでも、`description` に日本語依頼の典型表現を含めると、実際の利用場面で起動しやすくなる。

### 2. 本文は「手順」だけでなく「出力契約」を持つ

良いskillは、単に作業手順を並べるだけでなく、最終出力の形式、含める項目、除外する項目、品質確認の観点を明示している。

改善方針:

- `Purpose`
- `When to use`
- `Inputs`
- `Workflow`
- `Output format`
- `Quality checks`
- `Portability`

本環境の既存テンプレートに `Quality checks` を標準追加すると、業務品質に直結しやすい。

### 3. 大きな知識は `references/` に分ける

長い規程、業務手順、文体ルール、チェックリストを `SKILL.md` に詰め込むと、読みづらく、メンテナンスもしづらい。公開例では、`SKILL.md` には判断・導線・最小手順を置き、詳細は `references/` に逃がす構成が多い。

改善方針:

```text
.agents/skills/document-review-quality-check/
  SKILL.md
  references/
    report_quality_criteria.md
    common_consulting_document_issues.md
  evals/
    evals.json
```

### 4. 再現的な処理は `scripts/` に寄せる

表の検算、ファイル一覧生成、Frontmatter検証、Markdown lint、資料内キーワード抽出などは、プロンプトだけで処理するよりスクリプト化した方が安定する。

改善方針:

- 人間の判断が必要な分析は `SKILL.md` に残す。
- 反復的で機械的な処理は `scripts/` に置く。
- スクリプト実行が任意か必須かを本文に明記する。

### 5. 評価ケースを持つ

公開例の一部では `evals/` やテストプロンプトを用意している。skillは自然言語指示であるため、単に「良さそう」ではなく、代表タスクで期待どおり動くか確認する仕組みが重要になる。

改善方針:

```text
.agents/skills/research-analysis-public-info/
  SKILL.md
  evals/
    evals.json
```

`evals.json` には、実在案件情報を含めず、汎用的なテストプロンプトと期待観点だけを書く。

### 6. 人間向け説明とエージェント向け実行規約を分ける

本環境ではすでに `domains_ja/` と `.agents/skills/` を分けている。この構成は公開事例の方向性とも整合している。

改善方針:

- `.agents/skills/*/SKILL.md`: エージェントが実行するための最小・厳密な指示
- `domains_ja/*.md`: 人間が業務カットを理解するための説明
- `operating_ja/*.md`: 運用ルール、品質管理、更新手順
- `templates/*`: 成果物形式

### 7. セキュリティ・移植性を明記する

公開skillには、外部配布、複数エージェント対応、セキュリティスキャン、信頼できないリポジトリへの注意などを扱うものが多い。本環境でも、skillが案件固有情報を持たないこと、秘密情報を保存しないこと、外部情報の扱いを明記する必要がある。

改善方針:

- `Portability` に「案件固有情報をskill内に保存しない」と明記する。
- 外部URLや公開情報を扱うskillには、出典確認・取得日・不確実性の扱いを入れる。
- shellやスクリプトを使うskillには、破壊的操作を避けるルールを入れる。

## 本環境への改善提案

### 短期対応

1. 既存skillのfrontmatterを点検し、`description` を「発動条件」として強化する。
2. 各 `SKILL.md` に `Quality checks` を追加する。
3. 代表的なskillから `evals/evals.json` を追加する。
4. 長くなっているskillがあれば `references/` へ分離する。
5. `.agents/skills/README.md` に、`references/`、`scripts/`、`assets/`、`evals/` の任意構成を追記する。

### 中期対応

1. `domains_ja/task_catalog.md` とskill一覧の整合確認スクリプトを作る。
2. `SKILL.md` frontmatter検証スクリプトを作る。
3. skill成熟度を `stable`、`candidate`、`experimental` のように管理する。
4. 研究・資料作成・PMOの代表ワークフローを、複数skillを組み合わせた「業務ワークフロー」として定義する。
5. 導入先プロジェクトでの移植手順を、チェックリスト化する。

### 優先して強化すべき既存skill

| 優先 | skill | 強化ポイント |
|---:|---|---|
| 1 | `research-analysis-public-info` | 出典確認、取得日、信頼度、不確実性、引用形式の品質ゲートを追加 |
| 2 | `document-review-quality-check` | レビュー観点を `references/` に分離し、評価ケースを追加 |
| 3 | `document-production-report-draft` | 出力契約、構成パターン、論点の粒度、Executive Summary基準を追加 |
| 4 | `project-management-workplan` | 成果物、期限、依存関係、リスク、会議体への接続を明示 |
| 5 | `visual-production-diagram` | 図解の用途別パターン、Do/Don't、レビュー基準を追加 |

## 参考ソース

- [anthropics/skills](https://github.com/anthropics/skills): Claude向けAgent Skills公式実装・事例集。調査時点で142k stars。
- [openai/skills](https://github.com/openai/skills): Codex向けSkills Catalog。調査時点で20.6k stars。
- [Agent Skills Quickstart](https://agentskills.io/skill-creation/quickstart): `.agents/skills/<skill>/SKILL.md`、`name`、`description`、段階的開示の基本説明。
- [Agent Skills: Adding skills support](https://agentskills.io/client-implementation/adding-skills-support): skill探索、frontmatter解析、カタログ化、activation、context管理の実装ガイド。
- [sickn33/antigravity-awesome-skills](https://github.com/sickn33/antigravity-awesome-skills): 大規模SKILL.mdカタログ。調査時点で38.9k stars。
- [vercel-labs/skills](https://github.com/vercel-labs/skills): open agent skills ecosystem向けCLI。調査時点で20.3k stars。
- [FrancyJGLisboa/agent-skill-creator](https://github.com/FrancyJGLisboa/agent-skill-creator): skill作成支援ツール。調査時点で1.2k stars。
- [bergside/awesome-design-skills](https://github.com/bergside/awesome-design-skills): デザイン系SKILL.mdカタログ。調査時点で993 stars。
- [mxyhi/ok-skills](https://github.com/mxyhi/ok-skills): Codex/Claude/Cursor等向け実用skill集。調査時点で379 stars前後。
- [WenyuChiou/ai-research-skills](https://github.com/WenyuChiou/ai-research-skills): 研究ワークフロー特化skill集。調査時点で80 stars。
- [arpitg1304/robotics-agent-skills](https://github.com/arpitg1304/robotics-agent-skills): ロボティクス特化skill集。調査時点で241 stars。
- [803/skills-supply](https://github.com/803/skills-supply): 複数エージェントへのskill同期ツール。調査時点で32 stars。
