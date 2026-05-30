# MCPサーバ調査レポート: トークン削減とシンクタンク・コンサルティング業務効率化

## 調査概要

- 調査日: 2026-05-31 JST
- 対象: `npx` または `pip`、一部 `uvx` / `uv tool` で導入可能な公開MCPサーバ
- 観点:
  - トークン削減: 必要箇所だけの検索、ページング、Markdown化、構造化抽出、永続メモリ、セマンティック検索に寄与するか
  - 業務効率化: 公開情報調査、文献調査、資料読解、論点整理、コード・ツール開発、ナレッジ管理に寄与するか
  - 運用負荷: APIキー、外部送信、ツール数増加、権限、保守状況、セキュリティリスク

## 結論

このテンプレートで初期導入候補にするなら、まずは次の5系統に絞るのが妥当です。

| 優先 | MCPサーバ | 導入例 | 主目的 | 判断 |
|---:|---|---|---|---|
| 1 | Context7 | `npx -y @upstash/context7-mcp@latest` | ライブラリ/API/フレームワークの最新ドキュメント確認 | 常時候補 |
| 2 | MarkItDown MCP | `pip install markitdown-mcp` | PDF、Office、HTML等をMarkdown化 | 資料読解案件で常時候補 |
| 3 | Firecrawl または Tavily | `npx -y firecrawl-mcp` / `npx -y tavily-mcp` | Web検索、抽出、クロール | 公開情報調査案件で有効 |
| 4 | academic-search / arxiv-mcp-server | `pip install academic-search` / `uv tool install arxiv-mcp-server` | 学術文献・引用探索 | 文献レビュー案件で有効 |
| 5 | Basic Memory または Qdrant MCP | `pip install basic-memory` / `pip install mcp-server-qdrant` | 案件ナレッジの永続化・再検索 | 長期案件で有効 |

ただし、MCPサーバは増やすほどツール定義・説明・引数スキーマが文脈に入り、入力トークンとツール選択コストが増える場合があります。常時有効化は3から5個程度に抑え、案件別にコメントアウトを外す運用を推奨します。

## 推奨構成

### 最小構成

| MCPサーバ | 目的 | 理由 |
|---|---|---|
| Context7 | 技術ドキュメント確認 | 古いAPI知識による実装ミスを減らす。既存 `AGENTS.md` の方針とも一致する |
| MarkItDown MCP | 配布資料・PDF・OfficeのMarkdown化 | 大量の資料をLLMに直接読ませる前処理として有効 |
| Filesystem | ローカルファイルの限定参照 | MCPクライアントが標準ファイル操作を持たない場合のみ。Codexのようにローカル読取ツールがある環境では必須ではない |

### 公開情報調査案件

| MCPサーバ | 目的 | 使い分け |
|---|---|---|
| Tavily | 検索と抽出 | ニュース、企業情報、Web調査の検索起点 |
| Exa | Web検索、企業調査、コード・文書コンテキスト検索 | 会社調査、技術調査、深掘り調査 |
| Firecrawl | Webページ抽出、サイトマップ、クロール、構造化抽出 | 特定サイトを広めに読む、複数ページを収集する |
| Playwright MCP | ブラウザ操作、フォーム、ログイン後画面確認 | 操作が必要なWeb画面。抽出だけならFirecrawl等を優先 |

### 文献調査案件

| MCPサーバ | 目的 | 使い分け |
|---|---|---|
| academic-search | Semantic Scholar、Crossref、OpenAlex、PubMed横断検索 | 幅広い文献探索、統計的な絞り込み |
| arxiv-mcp-server | arXiv検索、引用グラフ、研究アラート | 技術・AI・計量系の先行研究探索 |
| citecheck系 | 参考文献の検証 | 報告書・論文調の資料で、架空引用や誤引用を避けたい場合 |

### 長期案件・ナレッジ管理

| MCPサーバ | 目的 | 使い分け |
|---|---|---|
| Basic Memory | Markdownベースのローカル知識管理 | Obsidian的に人間も編集できる案件メモ |
| Qdrant MCP | セマンティックメモリ、ベクトル検索 | 過去メモ・コード断片・調査断片を意味検索したい場合 |
| Neo4j MCP | グラフDBの探索・Cypher実行 | 組織、政策、産業、人物、論点の関係分析をグラフ化する案件 |

### 開発・ツール作成案件

| MCPサーバ | 目的 | 使い分け |
|---|---|---|
| Serena | LSPベースのシンボル検索・編集 | 大規模コードの関数・クラス単位探索。公式導入は `uv` 系が中心 |
| mcp-codebase-searcher | セマンティックなコード探索 | `pip install` 可能。コード全体を読ませる前の候補抽出に有効 |
| ripgrep系MCP | 高速テキスト検索 | 正規表現・文字列探索。セマンティック検索より単純で軽い |
| Git MCP | Git履歴・差分探索 | 履歴やコミット単位の確認。CodexではCLIで足りる場合も多い |

## 個別評価

### Context7

- 導入例: `npx -y @upstash/context7-mcp@latest`
- 用途: ライブラリ、API、フレームワーク、設定項目の最新・バージョン別ドキュメントを取得する。
- トークン削減効果: 中。Web検索や長大な公式ドキュメント全文貼り付けを避け、関連箇所だけを取得できる。
- 業務効果: 開発・ツール作成、データ分析環境、クラウド設定、フロントエンド実装で有効。
- 注意: ライブラリIDが分かる場合は `/org/project` 形式を指定すると探索ステップを減らせる。
- 根拠: Context7は「最新・バージョン別ドキュメントとコード例をプロンプトに直接入れる」と説明されている。導入は `npx ctx7 setup` または `@upstash/context7-mcp` が案内されている。
- 参照: <https://context7.com/docs>, <https://github.com/mcp/upstash/context7>

### MarkItDown MCP

- 導入例: `pip install markitdown-mcp`
- 用途: PDF、PowerPoint、Word、Excel、HTML、CSV、JSON、XML、ZIP、YouTube等をMarkdownへ変換する。
- トークン削減効果: 高。Office/PDFの構造をMarkdownへ寄せることで、LLMが扱いやすく、余計なレイアウト情報を減らせる。
- 業務効果: クライアント資料、公開PDF、審議会資料、統計資料、報告書の下読みで有効。
- 注意: ファイルやURIへ現在プロセスの権限でアクセスするため、未信頼ファイル・未信頼URLに注意する。URI変換はSSRF等のリスクを考慮し、ローカル限定や許可リスト運用が望ましい。
- 根拠: MicrosoftのMarkItDownは多様なファイル形式をMarkdownへ変換し、MarkdownはLLM向けにトークン効率がよいと説明している。
- 参照: <https://github.com/mcp/microsoft/markitdown>, <https://github.com/microsoft/markitdown/tree/main/packages/markitdown-mcp>

### Firecrawl MCP

- 導入例: `FIRECRAWL_API_KEY=... npx -y firecrawl-mcp`
- 用途: Webスクレイピング、検索、サイトマップ、クロール、バッチ抽出、構造化抽出。
- トークン削減効果: 高。必要ページだけをMarkdownや構造化JSONで取得し、サイト全体を無駄に読まない運用ができる。
- 業務効果: 企業サイト、政策資料サイト、自治体サイト、製品ページ、ニュースページの収集に有効。
- 注意: APIキーと外部サービス利用が前提。クロールは対象サイトの規約、robots、負荷、機密情報を確認する。
- 根拠: Firecrawl MCPは検索、スクレイプ、クロール、抽出、バッチ処理を提供し、検索から関連ページの抽出へ進む使い方が案内されている。
- 参照: <https://www.npmjs.com/package/firecrawl-mcp>, <https://github.com/firecrawl/firecrawl-mcp-server>

### Tavily MCP

- 導入例: `npx -y tavily-mcp@0.1.3`
- 用途: Web検索、ニュース検索、ドメイン指定検索、記事本文抽出。
- トークン削減効果: 中から高。検索結果を絞り込み、必要な本文だけ抽出する用途に向く。
- 業務効果: 最新ニュース、企業動向、産業トレンド、公開情報調査の初動に有効。
- 注意: APIキーが必要。検索結果の網羅性・順位はTavily APIに依存するため、重要調査では複数ソースで裏取りする。
- 根拠: Tavily公式ドキュメントはMCPサーバ、NPMパッケージ、検索・抽出例を案内している。
- 参照: <https://docs.tavily.com/documentation/mcp>

### Exa MCP

- 導入例: `EXA_API_KEY=... npx -y exa-mcp-server`
- 用途: Web検索、会社調査、クローリング、LinkedIn検索、Deep Research、コード文脈検索。
- トークン削減効果: 中から高。検索ツールを限定して有効化でき、必要な検索結果だけを得やすい。
- 業務効果: 企業・市場・技術調査、競合調査、公開コード例の探索に有効。
- 注意: APIキーが必要。全ツールを常時有効化するとツール定義が増えるため、案件に必要なツールだけに絞る。
- 根拠: Exa公式ドキュメントは `npx -y exa-mcp-server`、リモートMCP、ツール限定指定を案内している。
- 参照: <https://docs.exa.ai/reference/exa-mcp>, <https://www.npmjs.com/package/exa-mcp-server>

### Playwright MCP

- 導入例: `npx @playwright/mcp@latest`
- 用途: ブラウザ操作、Web画面のアクセシビリティスナップショット取得、フォーム操作、テスト。
- トークン削減効果: 条件付き。スクリーンショットではなくアクセシビリティツリーで操作できる点は効率的だが、大きなページではスナップショットが重くなる場合がある。
- 業務効果: ログイン後画面、検索フォーム、行政・企業サイトの画面操作、フロントエンド確認に有効。
- 注意: 任意JavaScript実行に相当する機能は信頼できるクライアントに限定する。単純なページ抽出はFirecrawlやFetch系を優先する。
- 根拠: Playwright公式はMCPサーバが構造化アクセシビリティスナップショットでブラウザ操作を可能にし、`@playwright/mcp@latest` で導入できると説明している。
- 参照: <https://playwright.dev/docs/getting-started-mcp>, <https://www.npmjs.com/package/@playwright/mcp>

### academic-search

- 導入例: `pip install academic-search`
- 用途: Semantic Scholar、Crossref、OpenAlex、PubMedを横断した論文検索、フィルタリング、分析。
- トークン削減効果: 中。検索結果・メタデータ中心に絞ってから必要論文を読むことで、PDF全文投入を避けられる。
- 業務効果: 先行研究レビュー、政策・医療・技術調査、引用候補探索に有効。
- 注意: コミュニティ色が強いパッケージ。業務成果物ではDOI、出版社、原文PDFで最終確認する。
- 根拠: PyPI由来の紹介では複数学術DB横断、正規表現フィルタ、統計分析を特徴としている。
- 参照: <https://mcpservers.org/servers/pypi-org-project-academic-search>

### arxiv-mcp-server

- 導入例: `uv tool install arxiv-mcp-server`
- 用途: arXiv検索、Citation Graph、研究アラート、文献レビュー支援。
- トークン削減効果: 中。論文の候補抽出、要約、比較、引用関係把握を段階的に行える。
- 業務効果: AI、経済学、計量、数理、技術調査の先行研究探索に有効。
- 注意: 公式導入は `uv tool install` 推奨であり、厳密には `pip install` だけでは実行ファイルがPATHに出ない場合がある。
- 根拠: PyPI説明ではCitation Graph、Research Alerts、literature_review等の機能が案内されている。
- 参照: <https://pypi.org/project/arxiv-mcp-server/>

### Basic Memory

- 導入例: `pip install basic-memory`
- 用途: ローカルMarkdownベースの知識管理、会話・調査メモの永続化、セマンティックグラフ化。
- トークン削減効果: 中から高。過去経緯や案件前提を毎回貼り付けず、必要なメモだけ検索できる。
- 業務効果: 長期案件、複数資料・複数会議がある案件、論点・用語・関係者メモ管理に有効。
- 注意: 案件固有情報や機密情報を保存する場合、保存先・暗号化・バックアップ・共有範囲を明確にする。
- 根拠: Basic MemoryはローカルMarkdownに知識を保存し、Obsidian等と連携できる知識管理MCPとして説明されている。
- 参照: <https://www.mcp.pizza/mcp-server/lkjA/basic-memory>, <https://mcplane.com/mcp_servers/basic-memory>

### Qdrant MCP Server

- 導入例: `pip install mcp-server-qdrant` または `uvx mcp-server-qdrant`
- 用途: Qdrantを使ったセマンティックメモリ、ベクトル検索、長期記憶。
- トークン削減効果: 高。大量メモや断片情報から関連項目だけを意味検索で取り出せる。
- 業務効果: 過去案件知見、調査断片、コード断片、ヒアリングメモの再利用に有効。
- 注意: Qdrantの保存先、APIキー、埋め込みモデル、外部送信の有無を案件規定に合わせる。
- 根拠: Qdrant MCPは `qdrant-store` と `qdrant-find` を持つセマンティックメモリ層として説明されている。
- 参照: <https://context7.com/qdrant/mcp-server-qdrant>, <https://pypi.org/project/mcp-server-qdrant/>

### Neo4j MCP

- 導入例: 公式配布形態は環境により異なる。MCP経由でNeo4jへ接続してCypherを実行する。
- 用途: グラフスキーマ探索、Cypher読取・書込、Graph Data Science機能。
- トークン削減効果: 中から高。関係性を構造化DBで表現し、質問に必要なサブグラフだけを取得できる。
- 業務効果: ステークホルダー関係、企業系列、政策体系、技術・特許・論文ネットワーク分析に有効。
- 注意: DB構築コストがあるため、短期案件では過剰。書込ツールは本番DBで無効化または厳格に制限する。
- 根拠: Neo4j公式はグラフスキーマ探索、Cypher実行、GDSプロシージャ一覧等をMCPで提供すると説明している。
- 参照: <https://neo4j.com/docs/mcp>, <https://neo4j.com/developer/genai-ecosystem/model-context-protocol-mcp/>

### mcp-codebase-searcher

- 導入例: `pip install mcp-codebase-searcher`
- 用途: コードベースのセマンティック検索と説明取得。
- トークン削減効果: 高。PyPI説明ではプロンプト計算量の削減例が示されている。
- 業務効果: Pythonツール、フロントエンド、業務自動化コードの改修時に有効。
- 注意: コミュニティパッケージのため、保守状況と対象言語を確認して採用する。
- 根拠: PyPI説明では「context-optimized」「token-efficient codebase semantic search」とされ、トークン削減例が示されている。
- 参照: <https://pypi.org/project/mcp-codebase-searcher/>

### Serena

- 導入例: `uv tool install -p 3.13 serena-agent`、または `uvx --from git+https://github.com/oraios/serena serena start-mcp-server`
- 用途: LSPベースのシンボル検索、コード理解、編集。
- トークン削減効果: 高。ファイル全文ではなくシンボル単位で探索・編集できる。
- 業務効果: 開発案件や社内ツール保守で有効。
- 注意: 公式導入は `pip` ではなく `uv` 系が中心なので、本レポートの「npx/pip」条件からは準候補扱いにする。
- 根拠: Serena公式READMEは、シンボリック編集が通常手段よりトークン効率的で、LSPにより40以上の言語を支援すると説明している。
- 参照: <https://github.com/oraios/serena>

### Filesystem MCP

- 導入例: `npx -y @modelcontextprotocol/server-filesystem /path/to/project`
- 用途: 許可ディレクトリ内のファイル読取・検索・編集。
- トークン削減効果: 中。範囲指定・検索で必要ファイルだけ取得できる。
- 業務効果: MCPクライアントにローカルファイル操作がない場合に有効。
- 注意: Codexのように既にファイル読取・検索ツールがある環境では重複しやすい。許可ディレクトリは案件フォルダに限定する。
- 根拠: 公式リファレンスは安全なファイル操作、検索、設定可能なアクセス制御を特徴としている。
- 参照: <https://modelcontextprotocol.io/examples>, <https://www.npmjs.com/package/@modelcontextprotocol/server-filesystem>

### Memory MCP

- 導入例: `npx -y @modelcontextprotocol/server-memory`
- 用途: ローカル知識グラフによる永続メモリ。
- トークン削減効果: 中。繰り返し使う前提・関係者・意思決定を都度貼らずに参照できる。
- 業務効果: 案件の前提、関係者、会議決定、用語の蓄積に有効。
- 注意: `read_graph` で全体を出す運用は逆にトークンを増やす。検索・ノード指定を原則にする。
- 根拠: 公式リファレンスは知識グラフ型の永続メモリとして案内している。
- 参照: <https://modelcontextprotocol.io/examples>, <https://www.npmjs.com/package/@modelcontextprotocol/server-memory>

### Sequential Thinking

- 導入例: `npx -y @modelcontextprotocol/server-sequential-thinking`
- 用途: 動的・反省的な思考ステップ管理。
- トークン削減効果: 低から中。思考の構造化には効くが、出力が増える場合もある。
- 業務効果: 論点整理、仮説検証、複雑な調査設計で有効。
- 注意: 通常のCodex推論で足りる場合は不要。常時有効化より、複雑な問題解決時だけ有効化する。
- 根拠: 公式リファレンスは「thought sequences」による動的・反省的な問題解決として案内している。
- 参照: <https://modelcontextprotocol.io/examples>

### Git / GitHub MCP

- 導入例:
  - Git: `pip install mcp-server-git` または `uvx mcp-server-git`
  - GitHub旧npm: `@modelcontextprotocol/server-github` は非推奨
- 用途: Gitリポジトリの読取、検索、履歴確認、GitHub API操作。
- トークン削減効果: 中。差分・履歴だけを取得できる。
- 業務効果: 開発案件、調査コード、分析スクリプトの履歴把握。
- 注意: GitHubの旧npmパッケージは2025年4月時点で非推奨と案内されている。GitHub連携は公式の現行方式を別途確認する。
- 根拠: MCP公式例はGitサーバを案内し、GitHub npmパッケージは非推奨表示がある。
- 参照: <https://modelcontextprotocol.io/examples>, <https://www.npmjs.com/package/@modelcontextprotocol/server-github>, <https://github.com/github/github-mcp-server/blob/main/docs/installation-guides/install-claude.md>

### Brave Search MCP

- 導入例:
  - 旧: `npx -y @modelcontextprotocol/server-brave-search`
  - 現行候補: `npx -y @brave/brave-search-mcp-server`
- 用途: Brave Search APIによるWeb、ローカル、画像、動画、ニュース等の検索。
- トークン削減効果: 中。検索結果を絞って取得できる。
- 業務効果: 公開情報調査の検索起点。
- 注意: `@modelcontextprotocol/server-brave-search` はnpmで非推奨表示があるため、Brave公式側の `@brave/brave-search-mcp-server` を優先検討する。
- 根拠: npmでは旧パッケージが非推奨、Brave公式パッケージは更新が続いている。
- 参照: <https://www.npmjs.com/package/@modelcontextprotocol/server-brave-search>, <https://www.npmjs.com/package/@brave/brave-search-mcp-server>, <https://github.com/brave/brave-search-mcp-server>

## 導入時の設定例

`.codex-sample/config.toml` に追記する場合の例です。実際には案件ごとに必要なものだけコメント解除します。

```toml
# 最新ドキュメント確認
#[mcp_servers.context7]
#command = "npx"
#args = ["-y", "@upstash/context7-mcp@latest"]
#startup_timeout_sec = 30
#tool_timeout_sec = 60

# 資料のMarkdown変換
#[mcp_servers.markitdown]
#command = "markitdown-mcp"
#startup_timeout_sec = 30
#tool_timeout_sec = 120

# Web調査: Firecrawl
#[mcp_servers.firecrawl]
#command = "npx"
#args = ["-y", "firecrawl-mcp"]
#env = { FIRECRAWL_API_KEY = "fc-..." }
#startup_timeout_sec = 30
#tool_timeout_sec = 120

# Web調査: Tavily
#[mcp_servers.tavily]
#command = "npx"
#args = ["-y", "tavily-mcp@0.1.3"]
#env = { TAVILY_API_KEY = "tvly-..." }
#startup_timeout_sec = 30
#tool_timeout_sec = 120

# 学術文献調査
#[mcp_servers.academic_search]
#command = "academic-search"
#startup_timeout_sec = 30
#tool_timeout_sec = 120

# セマンティックメモリ
#[mcp_servers.qdrant]
#command = "uvx"
#args = ["mcp-server-qdrant"]
#env = {
#  QDRANT_LOCAL_PATH = "/path/to/project-local/qdrant",
#  COLLECTION_NAME = "project-memory",
#  EMBEDDING_MODEL = "sentence-transformers/all-MiniLM-L6-v2"
#}
#startup_timeout_sec = 60
#tool_timeout_sec = 120
```

## 運用ルール案

1. 常時有効は、Context7、MarkItDown、案件固有の検索またはメモリ系1つまでを基本にする。
2. Web検索系は、Tavily、Exa、Firecrawl、Braveを同時に全部有効化しない。調査目的に合わせて1から2個に絞る。
3. ブラウザ操作が不要なWeb抽出ではPlaywrightを使わず、Fetch、Firecrawl、Tavily、Exa等のテキスト抽出系を優先する。
4. メモリ系は、Memory、Basic Memory、Qdrant、Neo4jを併用しすぎない。短期案件はMarkdownテンプレート、長期案件はBasic MemoryまたはQdrantを選ぶ。
5. `@latest` は初期検証には便利だが、業務テンプレートに固定する場合はバージョンピンを検討する。
6. APIキーを `config.toml` に直書きしない。環境変数、シークレット管理、案件別ローカル設定を使う。
7. 外部送信を伴うMCPは、機密資料、未公開資料、個人情報、クライアント固有情報を送らない前提で運用する。
8. 調査成果物では、MCPの検索・抽出結果を一次情報として扱わず、最終的に公式ページ、原文PDF、DOI、統計表、公開資料で確認する。

## 見送り・慎重導入候補

| MCPサーバ | 理由 |
|---|---|
| GitHub旧npm `@modelcontextprotocol/server-github` | npm上で非推奨表示。GitHub公式の現行MCP導入方式を確認してから採用する |
| Brave旧npm `@modelcontextprotocol/server-brave-search` | npm上で非推奨表示。Brave公式 `@brave/brave-search-mcp-server` を優先 |
| Playwright MCPの全capability常時有効化 | ツール数・スナップショットが重くなりやすい。必要時だけ有効化 |
| 大量ツールを持つ統合MCP | ツール定義だけでトークンを消費し、選択ミスが増える可能性がある |
| 出所不明の検索・スクレイピングMCP | APIキー・Cookie・ローカルファイルへのアクセスリスクが高い |

## 参考情報

- MCP公式 Example Servers: <https://modelcontextprotocol.io/examples>
- MCP Registry概要: <https://modelcontextprotocol.io/registry/about>
- Context7: <https://context7.com/docs>
- MarkItDown: <https://github.com/microsoft/markitdown>
- Firecrawl MCP: <https://github.com/firecrawl/firecrawl-mcp-server>
- Tavily MCP: <https://docs.tavily.com/documentation/mcp>
- Exa MCP: <https://docs.exa.ai/reference/exa-mcp>
- Playwright MCP: <https://playwright.dev/docs/getting-started-mcp>
- Qdrant MCP: <https://pypi.org/project/mcp-server-qdrant/>
- Neo4j MCP: <https://neo4j.com/docs/mcp>
- Serena: <https://github.com/oraios/serena>
- mcp-codebase-searcher: <https://pypi.org/project/mcp-codebase-searcher/>
- academic-search: <https://mcpservers.org/servers/pypi-org-project-academic-search>
- arxiv-mcp-server: <https://pypi.org/project/arxiv-mcp-server/>
