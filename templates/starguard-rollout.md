<!--
Instructions:
- Best-in-class example: https://forum.skyeco.com/t/technical-scope-of-the-starguard-launches-for-grove-keel-and-obex/27441
- Forum tags: technical-scope, <additional-tags-if-needed>
- Remove any remaining placeholder text before posting.
-->

# Technical scope of the <StarGuard rollout name>

[Write a short opening paragraph that explains which domains are getting a new StarGuard rollout, why the rollout is happening now, and how the new modules fit into the governance execution path.]

## Technical scope of the launch

- Domains in scope: `<Grove, Keel, Obex, other>`
- New modules or jobs in scope: `<StarGuard, StarGuardJob, helper modules>`
- Summary of what changes after the spell: `<one or two sentences>`

## Relevant audits

Use one row per audit report. For each deployed address, provide two auditor-hosted PDF links by default and include the matching SHA-pinned GitHub commit, tree, or blob for the audited code. If only one valid audit exists, explain why in `Notes`.

| Artifact | Network | Address | Auditor | Report PDF | Matching GitHub commit | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| `<StarGuard artifact>` | `<Ethereum mainnet>` | [`<checksummed 0x...>`](https://etherscan.io/address/<checksummed-0x...>#code) | `<auditor name>` | `<direct PDF URL from auditor site>` | `<SHA-pinned GitHub URL>` | `<optional>` |
| `<StarGuard artifact>` | `<Ethereum mainnet>` | [`<checksummed 0x...>`](https://etherscan.io/address/<checksummed-0x...>#code) | `<second auditor name>` | `<direct PDF URL from auditor site>` | `<SHA-pinned GitHub URL>` | `<optional>` |

## Pre-deployed contracts

Use checksummed EVM addresses and link them to the code page on Etherscan when available.

| Contract | Network | Address | Notes |
| --- | --- | --- | --- |
| `<dependency>` | `<Ethereum mainnet>` | [`<checksummed 0x...>`](https://etherscan.io/address/<checksummed-0x...>#code) | `<role in the rollout>` |
| `<dependency>` | `<Ethereum mainnet>` | [`<checksummed 0x...>`](https://etherscan.io/address/<checksummed-0x...>#code) | `<role in the rollout>` |

## New deployments

| Artifact | Network | Address | Deployment commit | Notes |
| --- | --- | --- | --- | --- |
| `<new StarGuard module>` | `<Ethereum mainnet>` | [`<checksummed 0x...>`](https://etherscan.io/address/<checksummed-0x...>#code) | `<SHA-pinned GitHub URL>` | `<constructor args or ownership notes>` |
| `<new helper>` | `<Ethereum mainnet>` | [`<checksummed 0x...>`](https://etherscan.io/address/<checksummed-0x...>#code) | `<SHA-pinned GitHub URL>` | `<constructor args or ownership notes>` |

## Recommended spell instructions

Use one subsection per rollout action so the post reads like a clean execution plan.

### Add new StarGuard module `<module name>`

| Item | Value |
| --- | --- |
| Target contract or script | `<target>` |
| Function / action | `<functionName()>` |
| Parameters | `<args>` |
| Matching GitHub commit | `<SHA-pinned GitHub URL>` |
| Expected result | `<state change>` |

### Register new module in `<job or registry>`

| Item | Value |
| --- | --- |
| Target contract or script | `<target>` |
| Function / action | `<functionName()>` |
| Parameters | `<args>` |
| Matching GitHub commit | `<SHA-pinned GitHub URL>` |
| Expected result | `<state change>` |
