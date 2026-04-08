<!--
Instructions:
- Best-in-class example: https://forum.skyeco.com/t/technical-scope-of-grove/27632
- Forum tags: technical-scope, <additional-tags-if-needed>
- Remove any remaining placeholder text before posting.
-->

# Technical scope of <token or launch name>

[Write a short opening paragraph that explains the token launch, what the token is for, and what the spell or deployment sequence will accomplish.]

## Context & objectives

- Token name and symbol: `<name / symbol>`
- Primary objective: `<what this launch enables>`
- Scope of this post: `<deployment, initialization, documentation, distribution, other>`

## Audits

Use one row per audit report. For each deployed address, provide two auditor-hosted PDF links by default and include the matching SHA-pinned GitHub commit, tree, or blob for the audited code. If only one valid audit exists, explain why in `Notes`.

| Artifact | Network | Address | Auditor | Report PDF | Matching GitHub commit | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| `<token or helper artifact>` | `<Ethereum mainnet>` | [`<checksummed 0x...>`](https://etherscan.io/address/<checksummed-0x...>#code) | `<auditor name>` | `<direct PDF URL from auditor site>` | `<SHA-pinned GitHub URL>` | `<optional>` |
| `<token or helper artifact>` | `<Ethereum mainnet>` | [`<checksummed 0x...>`](https://etherscan.io/address/<checksummed-0x...>#code) | `<second auditor name>` | `<direct PDF URL from auditor site>` | `<SHA-pinned GitHub URL>` | `<optional>` |

## Deployment

Use checksummed EVM addresses and link them to the code page on Etherscan when available.

| Artifact | Network | Address | Deployment commit | Notes |
| --- | --- | --- | --- | --- |
| `<token contract>` | `<Ethereum mainnet>` | [`<checksummed 0x...>`](https://etherscan.io/address/<checksummed-0x...>#code) | `<SHA-pinned GitHub URL>` | `<constructor args or ownership notes>` |
| `<vesting, distributor, or helper>` | `<Ethereum mainnet>` | [`<checksummed 0x...>`](https://etherscan.io/address/<checksummed-0x...>#code) | `<SHA-pinned GitHub URL>` | `<constructor args or ownership notes>` |

## Initialization

List the initialization actions in execution order and include the exact target, function name, parameters, and the SHA-pinned GitHub link to the source being used.

| Step | Target contract or script | Function / action | Parameters | Matching GitHub commit | Expected result |
| --- | --- | --- | --- | --- | --- |
| `1` | `<target>` | `<functionName()>` | `<args>` | `<SHA-pinned GitHub URL>` | `<state change>` |
| `2` | `<target>` | `<functionName()>` | `<args>` | `<SHA-pinned GitHub URL>` | `<state change>` |

## Documentation

- Token docs or specification: `<URL>`
- Related forum topics or governance posts: `<URL>`
- Release notes or public announcement: `<URL>`
