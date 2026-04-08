# Technical Scope Discovery and Validation

## Discovery Endpoints

- Title-first search:
  `https://forum.skyeco.com/search.json?q=%22technical%20scope%22%20in%3Atitle`
- Tag backstop:
  `https://forum.skyeco.com/tag/technical-scope/1444.json`
- Topic details:
  `https://forum.skyeco.com/t/{slug}/{id}.json`

## Current State As Of 2026-04-07

- Title search returns 33 topics.
- The `technical-scope` tag feed returns 23 topics.
- Tag-only outliers currently retained by this repo:
  - `SkyLink bridge to Avalanche`
  - `Solana Bridge Migration`
  - `Launching StarGuard - an upgrade to the Sky Agents' governance payload execution`

## Title-First Selection

Keep topics whose title contains `technical scope` case-insensitively, including:

- `Technical Scope`
- `technical scope`
- `Prime Technical Scope`
- `Sky Prime Technical Scope`

## Tag-Only Outlier Heuristics

A title that does not contain `technical scope` can still be included if it is tagged `technical-scope` and its headings or body strongly match technical-scope structure.

Useful heading signals:

- `Relevant audits`
- `Audits`
- `Pre-deployed contracts`
- `Spell dependencies`
- `Recommended spell instructions`
- `Proposed spell content`
- `Launch plan`
- `Technical scope of the launch`

## Compliance Rules

- `technical-scope` is required on all new forum drafts.
- Human-facing templates should keep forum-post style and include a best-in-class example link near the top.
- Historical topics that do not have the tag stay in scope and should be flagged as `missing-technical-scope-tag`.
- Audit links must be direct PDFs from the auditor's site.
- Auditor landing pages are not sufficient evidence until resolved to the PDF URL.
- GitHub provenance must be SHA-pinned. Reject:
  - repo roots
  - branch tips
  - pull requests
  - non-pinned `blob/main/...` style links
- EVM addresses must be EIP-55 checksummed.
- Explorer links must point to the correct address or program. Prefer Etherscan on EVM chains.

## Template Family Hints

Use `templates/catalog.yaml` for the current topic mapping and `templates/template-metadata.yaml` for the exact family rules. These heuristics are only for first-pass matching:

- `allocator-instance-launch`: new allocator instance, allocator launch, allocator adjustment, or executor-agent launch that follows the same PATTERN-style structure
- `starguard-rollout`: StarGuard module or StarGuardJob rollout
- `bridge-launch`: new bridge, gateway, SkyLink launch, or a rare one-off bridge migration that does not justify its own reusable family
- `farm-launch`: farms, rewards, vesting, or emissions setup
- `module-deployment`: module launch, deployment, wrapper launch, or Kicker launch
- `token-launch`: token deployment and initialization
- `oracle-migration`: oracle replacement or migration
- `spell-initialization`: prime technical scope, initialization spell, or parameter-change spell
- `system-migration-offboarding`: offboarding, protocol migration, or settlement cycle implementation
- `policy-adoption`: policy or agreement adoption with code or process validation
