<!--
Instructions:
- Best-in-class example: https://forum.skyeco.com/t/technical-scope-of-spk-farms/26703
- Forum tags: technical-scope, <additional-tags-if-needed>
- Remove any remaining placeholder text before posting.
-->

# Technical scope of <farm or rewards program name>

[Write a short opening paragraph that explains what farm or rewards program is being launched, which assets are involved, and what the spell enables.]

## Audits

Use one row per audit report. For each deployed address, provide two auditor-hosted PDF links by default and include the matching SHA-pinned GitHub commit, tree, or blob for the audited code. If only one valid audit exists, explain why in `Notes`.

| Artifact | Network | Address | Auditor | Report PDF | Matching GitHub commit | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| `<farm or vesting artifact>` | `<Ethereum mainnet>` | [`<checksummed 0x...>`](https://etherscan.io/address/<checksummed-0x...>#code) | `<auditor name>` | `<direct PDF URL from auditor site>` | `<SHA-pinned GitHub URL>` | `<optional>` |
| `<farm or vesting artifact>` | `<Ethereum mainnet>` | [`<checksummed 0x...>`](https://etherscan.io/address/<checksummed-0x...>#code) | `<second auditor name>` | `<direct PDF URL from auditor site>` | `<SHA-pinned GitHub URL>` | `<optional>` |

## Deployments

Use checksummed EVM addresses and link them to the code page on Etherscan when available.

| Artifact | Network | Address | Deployment commit | Notes |
| --- | --- | --- | --- | --- |
| `<farm contract>` | `<Ethereum mainnet>` | [`<checksummed 0x...>`](https://etherscan.io/address/<checksummed-0x...>#code) | `<SHA-pinned GitHub URL>` | `<constructor args or setup notes>` |
| `<vesting contract>` | `<Ethereum mainnet>` | [`<checksummed 0x...>`](https://etherscan.io/address/<checksummed-0x...>#code) | `<SHA-pinned GitHub URL>` | `<constructor args or setup notes>` |

## Initialization

[Describe the initialization sequence in the same order the deployer or spell will execute it.]

| Step | Target contract or script | Function / action | Parameters | Matching GitHub commit | Expected result |
| --- | --- | --- | --- | --- | --- |
| `1` | `<target>` | `<functionName()>` | `<args>` | `<SHA-pinned GitHub URL>` | `<state change>` |
| `2` | `<target>` | `<functionName()>` | `<args>` | `<SHA-pinned GitHub URL>` | `<state change>` |

## Spell contents

[Summarize the spell actions that finalize the farm launch, such as rate configuration, permissions, chainlog updates, or parameter registration.]

- `<spell action>`: `<why it is needed>`
- `<spell action>`: `<why it is needed>`

## Testing instructions

- `<test command or script>`
- `<explorer check or manual verification step>`
- `<post-launch operational check>`
