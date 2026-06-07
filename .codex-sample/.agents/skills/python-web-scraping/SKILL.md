---
name: python-web-scraping
description: "Use when the primary requested deliverable is Python code that collects or parses web pages. Do not use for manual public-information research or when an official API integration is the requested implementation. Japanese triggers: Python Webスクレイピング, Python Web収集, PythonでHTMLから表取得."
---

# Python Web Scraping

## Purpose

Collect permitted web content reproducibly while controlling load and handling structural change.

## Workflow

1. Confirm the target, intended use, terms, robots.txt, copyright constraints, and whether an official API or download exists.
2. Define fields, pages, update frequency, and stop conditions.
3. Set an identifiable user agent when appropriate, request timeouts, bounded concurrency, and a respectful interval.
4. Prefer stable semantic selectors and validate required elements.
5. Handle pagination, encoding, redirects, blocked responses, and partial failures.
6. Save source URL, retrieval time, and parse status with the output where appropriate.
7. Test against saved fixtures and detect layout changes before silently producing incorrect data.

## Quality Checks

- Access is permitted and load is proportionate.
- The collector does not bypass authentication, access controls, or technical restrictions.
- Structural changes fail visibly or are recorded.

## Common Operating Rules

Follow `operating_ja/python_development.md`.

## Portability

Do not embed project-specific target lists, cookies, or credentials.
