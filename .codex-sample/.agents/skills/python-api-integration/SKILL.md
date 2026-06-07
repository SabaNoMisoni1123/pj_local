---
name: python-api-integration
description: "Use when the primary requested deliverable is Python code that calls or exposes an external API, including authentication, pagination, limits, and error handling. Do not use for API documentation research alone. Japanese triggers: Python API連携, Python APIクライアント, PythonでAPI取得."
---

# Python API Integration

## Purpose

Implement reliable external API communication. This is for code and operations, not general public-information research.

## Workflow

1. Confirm the current official API documentation, version, authentication, endpoints, and data contract.
2. Keep credentials outside code and logs using the project's established secret mechanism.
3. Set connection and read timeouts.
4. Validate requests and handle status codes, malformed responses, pagination, and rate limits.
5. Retry only transient, safe, and idempotent operations with bounded backoff.
6. Preserve useful failure context while redacting secrets and sensitive payloads.
7. Test with mocks or fixtures where live calls would be unstable, costly, or unsafe.
8. Document configuration, limits, and recovery behavior.

## Quality Checks

- Authentication, timeout, retry, rate limit, and error responses are addressed.
- No secret appears in source, examples, logs, or exceptions.
- API version assumptions are explicit.

## Common Operating Rules

Follow `operating_ja/python_development.md`.

## Portability

Use placeholder endpoints and credential names in portable examples.
