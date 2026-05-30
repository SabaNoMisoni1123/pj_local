---
name: information-organization-email-thread
description: "Use when inspecting, summarizing, organizing, or analyzing saved email threads, .eml files, mail.yml exports, Outlook messages, or email conversations. Prefer .eml. Japanese triggers: メール整理, メールスレッド, .eml."
---

# Information Organization Email Thread

## Purpose

Extract reliable information from saved email threads and organize timeline, participants, decisions, unresolved issues, and follow-up points.

## Source Priority

1. `.eml` files
2. Attachments referenced by `.eml`
3. Related active project primary documents
4. Converted exports such as `_mail.yml`, `.txt`, or `.md`
5. `_gpt` or `_tmp` files as low-confidence references

## Workflow

1. Confirm the target email file exists.
2. Read subject, sender, recipients, cc/bcc, sent date, and received date when available.
3. Extract body text directly from `.eml`; check mojibake or missing content.
4. Split quoted replies into chronological message blocks.
5. Identify participants, attachments, decisions, requests, unresolved questions, and timeline.
6. Cite important facts to a message block or source file.

## Output

Use Japanese unless requested otherwise. Recommended sections:

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

- If `.eml` and converted text differ, prefer `.eml` and mention the discrepancy.
- Preserve sender, recipient, timestamp, and quoted-reply chronology.
- Do not expose credentials, private links, or unnecessary personal data.
- Use markitdown-mcp only for non-text attachments or saved messages when direct reading is impractical.
- Follow active `AGENTS.md` and `operating_ja/`; do not store project-specific facts in this skill.
