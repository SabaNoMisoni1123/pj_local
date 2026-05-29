---
name: information-organization-email-thread
description: Use when the user asks to inspect, summarize, organize, or analyze saved email threads, especially .eml files, mail.yml exports, Outlook-saved messages, or email conversations. Prefer .eml as the primary source.
---

# Information Organization Email Thread Workflow

## Purpose

Extract reliable information from saved email threads and organize it into timeline, participants, decisions, unresolved issues, and follow-up points.

## Source Priority

1. `.eml` files
2. Attachments referenced by the `.eml`, if available in the active project workspace
3. Active project primary documents related to the email
4. Converted exports such as `_mail.yml`, `.txt`, or `.md`
5. `_gpt` or `_tmp` files as low-confidence references

If `.eml` and converted text differ, prefer `.eml` and mention the discrepancy.

## Source Material Handling

Use direct `.eml` parsing when available. Use the markitdown-mcp server for Outlook-saved messages, attachments, or other supported non-text email materials when direct reading is impractical. Treat converted Markdown as a derived aid and do not let it override original `.eml` headers, timestamps, recipients, or message chronology.

## Workflow

1. Confirm the target email file exists.
2. Read headers: subject, from, to, cc, bcc, sent date, and received date if available.
3. Extract body text directly from `.eml`.
4. Detect mojibake or missing content.
5. Split quoted replies into chronological message blocks.
6. Identify participants, attachments, decisions, requests, unresolved questions, and timeline.
7. Classify claims as `事実`, `推測`, `不明`, or `要確認` when producing Japanese business outputs.
8. Cite evidence by source file and traceable location.

## Privacy

Do not expose download URLs, passwords, tokens, private attachment links, or credentials unnecessarily.

## Output

Use Japanese unless the user requests another language.

Recommended sections:

- 対象メール
- 時系列
- 関係者
- 依頼・回答
- 決定事項
- TODO
- 未解決事項
- 添付・関連資料
- 注意点

## Quality Checks

- Prefer original `.eml` content over converted text when available.
- Preserve sender, recipient, timestamp, and quoted-reply chronology.
- Mark mojibake, missing attachments, truncated messages, and duplicated quoted text.
- Do not expose credentials, private links, or unnecessary personal data.
- Cite each important fact to a message block or source file.

## Common Operating Rules

Follow the active project AGENTS.md and the common rules under `operating_ja/`, especially workflow, source confidence, naming rules, output location, and quality checks.

## Portability

This skill must remain project-agnostic. Do not store project-specific facts or working notes inside this skill directory.
