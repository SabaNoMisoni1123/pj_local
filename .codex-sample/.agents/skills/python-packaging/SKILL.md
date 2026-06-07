---
name: python-packaging
description: "Use only when the primary requested deliverable is an installable or distributable Python package, build artifact, entry point, or installation and removal procedure. Do not activate for ordinary source-code organization. Japanese triggers: Pythonパッケージ化, Pythonを配布可能にする, Python entry point."
---

# Python Packaging

## Purpose

Turn an existing Python tool into a defined installable or distributable artifact.

## Workflow

1. Confirm the distribution audience, supported environments, artifact type, and release channel.
2. Inspect existing package layout and build configuration before changing it.
3. Define package contents, import boundaries, entry points, version source, runtime dependencies, and excluded files.
4. Ensure metadata and build backend follow the current project approach and official packaging guidance.
5. Build in a clean environment and inspect the resulting artifact contents.
6. Test installation, command entry points or imports, upgrade behavior where relevant, and uninstallation.
7. Document build, install, verify, and remove procedures.

## Quality Checks

- Source-only, test, secret, local, and cache files are excluded as intended.
- Version and dependency metadata are consistent.
- Installation is tested from the built artifact, not only from the source checkout.

## Common Operating Rules

Follow `operating_ja/python_development.md`.

## Portability

Do not assume publication to a public registry unless explicitly requested.
