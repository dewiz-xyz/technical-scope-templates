<!--
Instructions:
- Best-in-class example: https://forum.skyeco.com/t/technical-scope-of-the-eth-and-wsteth-oracles-migration/26128
- Forum tags: technical-scope, <additional-tags-if-needed>
- Remove any remaining placeholder text before posting.
-->

# Technical scope of the <oracle migration name>

[Write a short opening paragraph that explains which oracle paths are changing, why the migration is needed, and what safety properties the new setup is intended to preserve.]

## Technical scope

[Summarize the migration in a few paragraphs. Keep the focus on the precise oracle path being changed, the operational impact, and the expected end state.]

## Relevant audits

Use one row per audit report. For each deployed address, provide two auditor-hosted PDF links by default and include the matching SHA-pinned GitHub commit, tree, or blob for the audited code. If only one valid audit exists, explain why in `Notes`.

| Artifact | Network | Address | Auditor | Report PDF | Matching GitHub commit | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| `<oracle artifact>` | `<Ethereum mainnet>` | [`<checksummed 0x...>`](https://etherscan.io/address/<checksummed-0x...>#code) | `<auditor name>` | `<direct PDF URL from auditor site>` | `<SHA-pinned GitHub URL>` | `<optional>` |
| `<oracle artifact>` | `<Ethereum mainnet>` | [`<checksummed 0x...>`](https://etherscan.io/address/<checksummed-0x...>#code) | `<second auditor name>` | `<direct PDF URL from auditor site>` | `<SHA-pinned GitHub URL>` | `<optional>` |

## Relevant contracts

Use checksummed EVM addresses and link them to the code page on Etherscan when available.

| Contract | Network | Address | Role in migration |
| --- | --- | --- | --- |
| `<oracle contract>` | `<Ethereum mainnet>` | [`<checksummed 0x...>`](https://etherscan.io/address/<checksummed-0x...>#code) | `<what it does>` |
| `<oracle contract>` | `<Ethereum mainnet>` | [`<checksummed 0x...>`](https://etherscan.io/address/<checksummed-0x...>#code) | `<what it does>` |

## Checks that were performed to ensure correct migration

- `<manual bytecode, parameter, or permission check>`
- `<price path or read-path verification>`
- `<post-migration safety assertion>`

## Annex: emergency actions related to the migration

- `<rollback path>`
- `<emergency shutdown, pause, or governance fallback>`
- `<operators or teams responsible for emergency execution>`
