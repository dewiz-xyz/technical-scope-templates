# Technical Scope Templates

This repo stores reusable Markdown templates for Sky Forum technical scope posts, plus the catalog and workflow used to discover, classify, and maintain them.

## Repo Scope

The repo is designed to do three things:

- discover technical scope topics on `https://forum.skyeco.com/`
- map each discovered topic to a reusable template family
- provide human-facing templates that read like actual forum posts while still enforcing stricter drafting rules than many historical posts currently follow

Those drafting rules include:

- the forum topic must use the `technical-scope` tag
- deployed artifacts should have two auditor-hosted PDF reports by default
- each audit PDF must have a matching SHA-pinned GitHub provenance link
- EVM addresses must be checksummed
- addresses and program identifiers must link to an appropriate block explorer

Historical posts that do not meet those rules are still in scope for discovery and mapping, but they should be flagged as compliance exceptions rather than treated as examples to copy blindly.

The Markdown templates in `templates/` are meant to be used directly by humans. They intentionally avoid YAML frontmatter and other LLM-oriented metadata. All machine-readable matching rules live in [templates/template-metadata.yaml](/home/ephy/dev/technical-scope-templates/templates/template-metadata.yaml).

## Repo Layout

- [agents.md](/home/ephy/dev/technical-scope-templates/agents.md): repo operating rules for discovery, validation, and template maintenance
- [templates/catalog.yaml](/home/ephy/dev/technical-scope-templates/templates/catalog.yaml): source of truth for discovery inputs and current topic mappings
- [templates/template-metadata.yaml](/home/ephy/dev/technical-scope-templates/templates/template-metadata.yaml): machine-readable template matching rules, required sections, and best-example metadata
- [templates](/home/ephy/dev/technical-scope-templates/templates): human-facing reusable template family files that mirror forum post style
- [skills/technical-scope-forum/SKILL.md](/home/ephy/dev/technical-scope-templates/skills/technical-scope-forum/SKILL.md): repo-local skill entrypoint for future template maintenance
- [skills/technical-scope-forum/references/discovery-and-validation.md](/home/ephy/dev/technical-scope-templates/skills/technical-scope-forum/references/discovery-and-validation.md): discovery endpoints, outlier heuristics, and compliance rules
- [skills/technical-scope-forum/scripts/discover_topics.sh](/home/ephy/dev/technical-scope-templates/skills/technical-scope-forum/scripts/discover_topics.sh): live forum discovery helper

## How Discovery Works

Discovery is title-first, not tag-first.

1. Query the forum title search:
   `https://forum.skyeco.com/search.json?q=%22technical%20scope%22%20in%3Atitle`
2. Keep topics whose title contains `technical scope`, including variants like `Prime Technical Scope` and `Sky Prime Technical Scope`.
3. Use the `technical-scope` tag feed as a backstop:
   `https://forum.skyeco.com/tag/technical-scope/1444.json`
4. Add only tag-only outliers whose headings or body clearly match technical-scope structure.
5. Flag topics missing the `technical-scope` tag instead of excluding them.

As of `2026-04-07`, the repo catalog tracks:

- `33` title-search topics
- `23` tag-feed topics
- `3` retained tag-only outliers
- `36` total mapped topics

## Template Families

The current template families are:

- `allocator-instance-launch`
- `starguard-rollout`
- `bridge-launch`
- `farm-launch`
- `module-deployment`
- `token-launch`
- `oracle-migration`
- `spell-initialization`
- `system-migration-offboarding`
- `policy-adoption`

The exact matching rules for each family live in [templates/template-metadata.yaml](/home/ephy/dev/technical-scope-templates/templates/template-metadata.yaml).

## How To Use

### Update the discovery set

Run:

```bash
skills/technical-scope-forum/scripts/discover_topics.sh
```

This prints the current title-search count, tag-feed count, retained tag-only outliers, and any topics missing the `technical-scope` tag.

### Map a forum topic to a template

1. Find the topic in [templates/catalog.yaml](/home/ephy/dev/technical-scope-templates/templates/catalog.yaml).
2. Check its `template_id`.
3. Open the corresponding file in [templates](/home/ephy/dev/technical-scope-templates/templates).
4. Use the best-in-class example linked at the top of the template to mirror tone, structure, and level of detail.
5. Fill in the placeholders with the topic-specific data.

### Add support for a new use case

1. Run the discovery helper.
2. Compare the new topic title and headings against [templates/template-metadata.yaml](/home/ephy/dev/technical-scope-templates/templates/template-metadata.yaml).
3. If one family clearly fits, add a new mapping in the catalog.
4. If both the title pattern and heading pattern are genuinely new, create a new template file in `templates/`.
5. Add the new family definition to [templates/template-metadata.yaml](/home/ephy/dev/technical-scope-templates/templates/template-metadata.yaml) and the new topic mapping to [templates/catalog.yaml](/home/ephy/dev/technical-scope-templates/templates/catalog.yaml).

## Validation Rules

Before accepting a new template or draft, check all of the following:

- the topic includes the `technical-scope` tag, or the missing tag is explicitly recorded
- the template still reads like a forum post draft and keeps the best-in-class example link near the top
- audit links resolve directly to PDFs from the auditing firm
- GitHub links are SHA-pinned `blob`, `tree`, or `commit` URLs
- EVM addresses are EIP-55 checksummed
- explorer links resolve to the correct deployment or program
- the topic maps to exactly one template family

## Where To Start

If you are editing this repo manually, start with:

- [agents.md](/home/ephy/dev/technical-scope-templates/agents.md) for the operating rules
- [templates/catalog.yaml](/home/ephy/dev/technical-scope-templates/templates/catalog.yaml) for the current inventory
- [templates/template-metadata.yaml](/home/ephy/dev/technical-scope-templates/templates/template-metadata.yaml) for template matching rules
- [skills/technical-scope-forum/SKILL.md](/home/ephy/dev/technical-scope-templates/skills/technical-scope-forum/SKILL.md) if you want to use the repo-local skill workflow
