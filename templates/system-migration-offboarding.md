<!--
Instructions:
- Best-in-class example: https://forum.skyeco.com/t/technical-scope-of-rwa001-a-offboarding/27706
- Forum tags: technical-scope, <additional-tags-if-needed>
- Remove any remaining placeholder text before posting.
-->

# Technical scope of the <system migration or offboarding name>

[Write a short opening paragraph that explains what is being offboarded or migrated, why the change is necessary, and whether execution happens in one spell or over a longer operational cycle.]

## Introduction

[Describe the current system state, the issue being addressed, and the intended end state once the migration or offboarding is complete.]

### Contracts in scope

Use checksummed EVM addresses and link them to the code page on Etherscan when available.

| Contract | Network | Address | Notes |
| --- | --- | --- | --- |
| `<contract>` | `<Ethereum mainnet>` | [`<checksummed 0x...>`](https://etherscan.io/address/<checksummed-0x...>#code) | `<role in the migration>` |
| `<contract>` | `<Ethereum mainnet>` | [`<checksummed 0x...>`](https://etherscan.io/address/<checksummed-0x...>#code) | `<role in the migration>` |

## Audits

Use one row per audit report. For each deployed address touched by the change, provide two auditor-hosted PDF links by default and include the matching SHA-pinned GitHub commit, tree, or blob for the audited code. If only one valid audit exists, explain why in `Notes`.

| Artifact | Network | Address | Auditor | Report PDF | Matching GitHub commit | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| `<migration-related artifact>` | `<Ethereum mainnet>` | [`<checksummed 0x...>`](https://etherscan.io/address/<checksummed-0x...>#code) | `<auditor name>` | `<direct PDF URL from auditor site>` | `<SHA-pinned GitHub URL>` | `<optional>` |
| `<migration-related artifact>` | `<Ethereum mainnet>` | [`<checksummed 0x...>`](https://etherscan.io/address/<checksummed-0x...>#code) | `<second auditor name>` | `<direct PDF URL from auditor site>` | `<SHA-pinned GitHub URL>` | `<optional>` |

## Evaluation

- `<summary of current exposure, debt, risk, or technical limitation>`
- `<constraints that shape the migration or offboarding>`
- `<alternatives considered, if relevant>`

## Proposed approach

[Explain the chosen implementation path in prose. Keep the rationale clear and forum-ready.]

## Pseudocode

```solidity
// Replace this with spell-relevant pseudocode or a short structured outline.
// Keep the logic close to the final implementation and cite the matching SHA-pinned source link below.
```

Matching GitHub commit: `<SHA-pinned GitHub URL>`

## Appendix: manual bytecode verification

| Contract | Explorer link | What was checked | Result |
| --- | --- | --- | --- |
| `<contract>` | [`<checksummed 0x...>`](https://etherscan.io/address/<checksummed-0x...>#code) | `<runtime bytecode, init code, params, owner, other>` | `<result>` |
| `<contract>` | [`<checksummed 0x...>`](https://etherscan.io/address/<checksummed-0x...>#code) | `<runtime bytecode, init code, params, owner, other>` | `<result>` |
