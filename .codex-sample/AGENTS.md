# AGENTS.md

日本語で回答してください。生成物もすべて日本語で作成します。
Answer in Japanese. All output will also be in Japanese.

Exception: If the user explicitly requests another language, or if the artifact is normally better written in another language such as code, API specifications, prompts for non-Japanese agents, or quoted source text, use the appropriate language and explain briefly when useful.

## Business Task Routing

This project layout is a portable business-support base for Codex and other Agent Skills-compatible AI agents.

Human-facing documentation is maintained in Japanese under `domains_ja/`.
Agent-executable task definitions are maintained in English under `.agents/skills/`.
Reusable output formats are maintained under `templates/`.
Codex-specific configuration, if needed, is maintained under `.codex/`.

For business-support work, use the relevant skill in `.agents/skills/` when available.
Discover skills by scanning immediate subdirectories that contain `.agents/skills/*/SKILL.md`; do not rely on `README.md`, `domains_ja/task_catalog.md`, or domain pages as the authoritative skill registry.
Use each skill's YAML front matter `name` and `description` as the primary routing metadata.
If no suitable skill exists, follow the closest domain guidance in `domains_ja/README.md` and explain the gap.

## Operating Rules

Before producing or editing business-support outputs, check the active project `AGENTS.md` first, then use the common rules under `operating_ja/`.

Use these files as the standard references:

- `operating_ja/workflow.md` for the overall work sequence.
- `operating_ja/project_intake.md` for new-project intake.
- `operating_ja/quality_check.md` for evidence, numbers, dates, terminology, TODOs, and residual risks.
- `operating_ja/naming_rules.md` for output file naming and overwrite prevention.
- `operating_ja/low_confidence_sources.md` for generated, temporary, converted, draft, sample, or otherwise low-confidence sources.
- `operating_ja/project_local_storage.md` for project-specific Codex working context.
- `operating_ja/agents_update_policy.md` for AGENTS.md update proposals.
- `.agents/AGENTS.md` for the design, maintenance policy, and audit procedure of the `.agents` directory.
- `.agents/skills/README.md` for skill discovery and skill addition rules.

When a relevant `SKILL.md` exists, follow both the skill and the common operating rules. If they conflict, follow the active project `AGENTS.md` first, then this file, then the common operating rules, then the skill.

For derivative business outputs, create a new file by default. Edit, delete, rename, move, or overwrite existing files only when the user explicitly requests it and the active project rules allow it.

Do not treat low-confidence sources as sole evidence. If such sources are used, label them as low-confidence and prefer primary sources for confirmation.

## Portability

Keep this common agent-support area project-agnostic.

Do not store project-specific facts, people, organizations, file indexes, TODOs, email summaries, URLs, credentials, or working notes in `.agents/`, `.codex/`, `domains_ja/`, `operating_ja/`, or `templates/`.

Store project-specific information only in the active project workspace according to that project's rules.

If the active project uses this layout, store project-specific Codex working context outside `.agents/` and `.codex/`, preferably under `project-local/` at the project root. Examples include project context, file indexes, source maps, project-specific work logs, known stakeholder notes, and generated-output indexes.

Treat `project-local/` as non-portable. Do not copy it to another project.

Do not treat generated Codex state, logs, sessions, cache, `.tmp`, or database files as human-managed task definitions.
