---
name: technical-scope-forum
description: Use when you need to discover Sky Forum technical scope posts from forum.skyeco.com, map them to the title-first template catalog, or update templates while enforcing technical-scope tags, auditor PDF links, SHA-pinned GitHub provenance, checksummed addresses, and explorer links.
---

# Technical Scope Forum

Use this skill to maintain the technical scope template library in this repo.

## Quick Start

1. Run `skills/technical-scope-forum/scripts/discover_topics.sh`.
2. Read `templates/catalog.yaml`, `templates/template-metadata.yaml`, and `agents.md`.
3. Match each discovered topic to one template family.
4. If an existing family fits, update only the catalog mapping.
5. If both title and heading patterns are new, add a new human-facing template under `templates/` and a new metadata entry in `templates/template-metadata.yaml`.

## Discovery Rules

- Primary source: `https://forum.skyeco.com/search.json?q=%22technical%20scope%22%20in%3Atitle`
- Keep only titles that contain `technical scope` case-insensitively.
- Secondary source: `https://forum.skyeco.com/tag/technical-scope/1444.json`
- Add only tag-only outliers whose headings clearly match technical-scope structure.
- Missing `technical-scope` is a compliance issue, not a reason to drop the topic.

## Validation Rules

- Every draft must require the `technical-scope` forum tag.
- Every template should read like a forum post draft and link to a best-in-class example near the top.
- Audit links must resolve directly to PDF files hosted by the auditor.
- Every audit PDF must have a matching SHA-pinned GitHub `blob`, `tree`, or `commit` link.
- EVM addresses must be EIP-55 checksummed.
- EVM deployments should link to Etherscan when available.
- Non-EVM identifiers still need an appropriate explorer link.

## Read Next

- `templates/catalog.yaml` for the current topic-to-template mapping.
- `templates/template-metadata.yaml` for the machine-readable family rules.
- `agents.md` for repo operating rules.
- `references/discovery-and-validation.md` for the endpoint details, outlier heuristics, and compliance checklist.
