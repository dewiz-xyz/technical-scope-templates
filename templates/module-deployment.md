<!--
Instructions:
- Best-in-class example: https://forum.skyeco.com/t/technical-scope-of-the-stusds-module-launch/27129
- Forum tags: technical-scope, <additional-tags-if-needed>
- Remove any remaining placeholder text before posting.
-->

# Technical scope of the <module deployment name>

[Write a short opening paragraph that explains what module is being launched, what it enables, and how the spell will activate it.]

## Audits

Use one row per audit report. For each deployed address, provide two auditor-hosted PDF links by default and include the matching SHA-pinned GitHub commit, tree, or blob for the audited code. If only one valid audit exists, explain why in `Notes`.

| Artifact | Network | Address | Auditor | Report PDF | Matching GitHub commit | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| `<module artifact>` | `<Ethereum mainnet>` | [`<checksummed 0x...>`](https://etherscan.io/address/<checksummed-0x...>#code) | `<auditor name>` | `<direct PDF URL from auditor site>` | `<SHA-pinned GitHub URL>` | `<optional>` |
| `<module artifact>` | `<Ethereum mainnet>` | [`<checksummed 0x...>`](https://etherscan.io/address/<checksummed-0x...>#code) | `<second auditor name>` | `<direct PDF URL from auditor site>` | `<SHA-pinned GitHub URL>` | `<optional>` |

## Pre-deployed contracts

Use checksummed EVM addresses and link them to the code page on Etherscan when available.

| Contract | Network | Address | Notes |
| --- | --- | --- | --- |
| `<dependency>` | `<Ethereum mainnet>` | [`<checksummed 0x...>`](https://etherscan.io/address/<checksummed-0x...>#code) | `<role in the rollout>` |
| `<dependency>` | `<Ethereum mainnet>` | [`<checksummed 0x...>`](https://etherscan.io/address/<checksummed-0x...>#code) | `<role in the rollout>` |

## New deployments

| Artifact | Network | Address | Deployment commit | Notes |
| --- | --- | --- | --- | --- |
| `<new module>` | `<Ethereum mainnet>` | [`<checksummed 0x...>`](https://etherscan.io/address/<checksummed-0x...>#code) | `<SHA-pinned GitHub URL>` | `<constructor args or ownership notes>` |
| `<new helper>` | `<Ethereum mainnet>` | [`<checksummed 0x...>`](https://etherscan.io/address/<checksummed-0x...>#code) | `<SHA-pinned GitHub URL>` | `<constructor args or ownership notes>` |

## Additional pre-requirements

- `<manual configuration, funding, registry setup, or governance prerequisite>`
- `<anything that must happen before the spell executes>`

## Proposed spell content

List the spell actions in execution order and include the exact target, function name, parameters, and the SHA-pinned GitHub link to the source being used.

| Step | Target contract or script | Function / action | Parameters | Matching GitHub commit | Expected result |
| --- | --- | --- | --- | --- | --- |
| `1` | `<target>` | `<functionName()>` | `<args>` | `<SHA-pinned GitHub URL>` | `<state change>` |
| `2` | `<target>` | `<functionName()>` | `<args>` | `<SHA-pinned GitHub URL>` | `<state change>` |
