# Skills

This directory contains agent-executable task definitions.

For the design policy, skill inventory, maintenance criteria, and audit procedure of the whole `.agents` directory, read `.agents/AGENTS.md`.

## Discovery Rule

Every immediate subdirectory that contains `SKILL.md` is a valid skill.

Agents should discover skills by scanning:

```text
.agents/skills/*/SKILL.md
```

The skill `name` and `description` in the YAML front matter are the primary metadata for routing.

Choose exactly one primary skill from the main requested deliverable. A skill must not activate only because it covers an input type, intermediate step, quality concern, or supporting technique. Add another skill only for an explicitly requested separate deliverable or an explicit handoff after the primary result is complete. When a generic and a technology-specific skill match the same deliverable, use the technology-specific skill.

Human-facing files such as `README.md`, `domains_ja/task_catalog.md`, and domain pages may contain examples or summaries, but they are not the authoritative skill registry.

## Adding a Skill

To add a normal task, create only:

```text
.agents/skills/{business-domain}-{task-name}/SKILL.md
```

Update Japanese domain documentation or templates only when the new skill changes the conceptual business cut, introduces a new output format, or needs human-facing explanation.

Do not require README or catalog updates just to make the skill discoverable.

## Recommended Structure

Each `SKILL.md` should stay concise, executable, and portable. Use this structure unless the task is too small to need every section:

```markdown
---
name: business-domain-task-name
description: "Use when the user asks to ..."
---

# Task Name

## Purpose

...

## Inputs

...

## Workflow

1. ...
2. ...

## Output

...

## Quality Checks

- ...

## Common Operating Rules

Follow the active project AGENTS.md and the common rules under `operating_ja/`, especially workflow, source confidence, naming rules, output location, and quality checks.

## Portability

This skill must remain project-agnostic.
Do not store project-specific facts or working notes inside this skill directory.
```

## Design Rules

- Write `description` as the trigger condition. Include the user requests, contexts, and artifact types that should activate the skill.
- Quote `description` with double quotes. This is required when the value contains a colon, such as `Japanese triggers:`, and is recommended for all descriptions to avoid YAML front matter parse errors.
- Avoid literal double quotes inside `description`; reword them or escape them as valid YAML.
- Keep `SKILL.md` focused on executable procedure, output contract, and quality checks.
- Move long examples, detailed criteria, schemas, or style guides into `references/` and link to them from `SKILL.md`.
- Put deterministic, repeated processing in `scripts/` when a script would be more reliable than natural-language instructions.
- Put reusable templates or visual assets in `assets/` only when the skill needs them to produce outputs.
- Use `evals/` for representative test prompts and expected quality criteria when the skill is high-impact or easy to misuse.
- Do not store project-specific facts, client names, private source extracts, credentials, or working notes in a portable skill directory.
- Record large reorganizations, unresolved duplicate boundaries, or audit findings outside `.agents/`, using the active project's designated work-output location.

## Naming

Use a flat directory name:

```text
{business-domain}-{task-name}
```

The directory name should match the front matter `name`.

Python development skills use `python-{task-name}`. For Python implementation or modification, select the one Python skill matching the primary behavior. Testing, dependency checks, packaging considerations, and code review are normal implementation concerns and do not trigger their dedicated skills unless the user requests those as separate deliverables. Use `engineering-support-script` only when no Python-specific skill matches the requested behavior.

## Minimal SKILL.md

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
