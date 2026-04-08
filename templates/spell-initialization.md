<!--
Instructions:
- Best-in-class example: https://forum.skyeco.com/t/technical-scope-sp-beam-initialization-spell/26266
- Forum tags: technical-scope, <additional-tags-if-needed>
- Remove any remaining placeholder text before posting.
-->

# Technical scope: <spell or parameter change name>

[Write a short opening paragraph that explains what the spell changes, why it is needed, and how it fits into the upcoming governance cycle.]

## Context & objective

[Explain the operational or governance context, what the spell is expected to initialize or change, and what is out of scope.]

## Relevant audits

Use one row per audit report. For each deployed address, provide two auditor-hosted PDF links by default and include the matching SHA-pinned GitHub commit, tree, or blob for the audited code. If only one valid audit exists, explain why in `Notes`.

| Artifact | Network | Address | Auditor | Report PDF | Matching GitHub commit | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| `<spell-related artifact>` | `<Ethereum mainnet>` | [`<checksummed 0x...>`](https://etherscan.io/address/<checksummed-0x...>#code) | `<auditor name>` | `<direct PDF URL from auditor site>` | `<SHA-pinned GitHub URL>` | `<optional>` |
| `<spell-related artifact>` | `<Ethereum mainnet>` | [`<checksummed 0x...>`](https://etherscan.io/address/<checksummed-0x...>#code) | `<second auditor name>` | `<direct PDF URL from auditor site>` | `<SHA-pinned GitHub URL>` | `<optional>` |

## Technical details

### Pre-deployed contracts

Use checksummed EVM addresses and link them to the code page on Etherscan when available.

| Contract | Network | Address | Notes |
| --- | --- | --- | --- |
| `<dependency>` | `<Ethereum mainnet>` | [`<checksummed 0x...>`](https://etherscan.io/address/<checksummed-0x...>#code) | `<role in the spell>` |
| `<dependency>` | `<Ethereum mainnet>` | [`<checksummed 0x...>`](https://etherscan.io/address/<checksummed-0x...>#code) | `<role in the spell>` |

### Parameter proposals

| Parameter | Value | Source | Notes |
| --- | --- | --- | --- |
| `<parameter>` | `<value>` | `<BA Labs, forum reference, code, or other>` | `<optional>` |
| `<parameter>` | `<value>` | `<BA Labs, forum reference, code, or other>` | `<optional>` |

### Content to include in the spell

| Step | Target contract or script | Function / action | Parameters | Matching GitHub commit | Expected result |
| --- | --- | --- | --- | --- | --- |
| `1` | `<target>` | `<functionName()>` | `<args>` | `<SHA-pinned GitHub URL>` | `<state change>` |
| `2` | `<target>` | `<functionName()>` | `<args>` | `<SHA-pinned GitHub URL>` | `<state change>` |
