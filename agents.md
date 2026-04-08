# Technical Scope Agents Guide

This repo stores reusable Markdown templates for Sky Forum technical scope posts.

## Goal

Use title-first discovery to find technical scope posts on `forum.skyeco.com`, map each post to a template family using `templates/catalog.yaml` and `templates/template-metadata.yaml`, and keep every new draft compliant with the evidence rules below.

## Discovery Precedence

1. Query the forum with the exact title search URL:
   `https://forum.skyeco.com/search.json?q=%22technical%20scope%22%20in%3Atitle`
2. Keep only topics whose title contains `technical scope` case-insensitively, including variants such as `Prime Technical Scope` and `Sky Prime Technical Scope`.
3. Fetch the tag feed as a backstop:
   `https://forum.skyeco.com/tag/technical-scope/1444.json`
4. Add only tag-only outliers whose headings or body clearly match technical-scope structure. Current outliers as of `2026-04-07` are:
   - `SkyLink bridge to Avalanche`
   - `Solana Bridge Migration`
   - `Launching StarGuard - an upgrade to the Sky Agents' governance payload execution`
5. Never exclude a topic only because it lacks the `technical-scope` tag. Mark the missing tag as a compliance issue instead.

## Required Outputs

- `templates/catalog.yaml` is the source of truth for discovery inputs and current topic mappings.
- `templates/template-metadata.yaml` is the source of truth for machine-readable template matching rules.
- Every new or updated template must be a human-facing Markdown file under `templates/` with no YAML frontmatter.
- The repo-local skill lives under `skills/technical-scope-forum/`.

## Evidence Rules

Every template and every generated draft must enforce all of the following:

- The forum post must include the `technical-scope` tag.
- Each template must link to a best-in-class example forum post near the top.
- Every deployed artifact must include an `Audit Evidence` row.
- Default expectation is two audit reports per deployed artifact.
- Audit links must be direct PDF URLs hosted by the auditing firm, not just landing pages or github repos not controlled by the auditing firm.
- Every audit report PDF must have a matching SHA-pinned GitHub `blob`, `tree`, or `commit` URL.
- EVM addresses must be EIP-55 checksummed.
- EVM addresses must link to an explorer code page, preferring Etherscan when available.
- Non-EVM deployments must still link to an appropriate chain explorer.

If only one valid audit report exists for an artifact, keep the row and fill the exception field with a short justification.

## Validation Checklist

Before accepting a new post or template update:

- Resolve auditor landing pages to direct PDF URLs.
- Reject GitHub links that point only to a repo root, branch tip, pull request, or unpinned path.
- Reject lowercase or otherwise non-checksummed EVM addresses.
- Reject explorer links that do not resolve to the deployed address or program.
- Confirm the topic maps to exactly one template family.

## Working Procedure

1. Run the discovery helper:
   `skills/technical-scope-forum/scripts/discover_topics.sh`
2. Review missing-tag topics and current tag-only outliers.
3. Compare the topic title and headings against `templates/template-metadata.yaml`.
4. If an existing family fits, update only the catalog mapping.
5. If the title pattern and heading pattern are both novel, create a new human-facing template in `templates/`, add its best-in-class example link near the top, and add the matching metadata entry in `templates/template-metadata.yaml`.
6. Keep machine-readable fields out of the Markdown templates. Store them in `templates/template-metadata.yaml`:
   - `template_id`
   - `path`
   - `best_example_title`
   - `best_example_url`
   - `match_title_regex`
   - `match_heading_keywords`
   - `required_forum_tags`
   - `required_sections`

## Notes

- Historical posts that are missing `technical-scope` remain in scope for discovery and mapping.
- New drafts should keep the style and section flow of the strongest forum examples while still enforcing the stricter rules in this repo.
- The untracked root `.codex` file must not be replaced. Keep the local skill under `skills/technical-scope-forum/`.
