<!--
Instructions:
- Best-in-class example: https://forum.skyeco.com/t/technical-scope-safe-harbor-adoption/27753
- Forum tags: technical-scope, <additional-tags-if-needed>
- Remove any remaining placeholder text before posting.
-->

# Technical scope: <policy or agreement adoption name>

[Write a short opening paragraph that explains what policy or agreement is being adopted, why it matters operationally, and whether any onchain changes are part of the rollout.]

## References

- Policy or agreement text: `<URL>`
- Related governance post: `<URL>`
- Supporting technical context: `<URL>`

## Rationale

[Explain why the policy or agreement is being adopted and what operational or governance problem it solves.]

## Adoption details

- Scope of adoption: `<what changes in practice>`
- Teams or contracts in scope: `<who or what is affected>`
- Rollout timing: `<spell date, governance cycle, or operational date>`

## Source code & audits

If code is in scope, use one row per audit report. For each deployed address, provide two auditor-hosted PDF links by default and include the matching SHA-pinned GitHub commit, tree, or blob for the audited code. If there is no code change, keep one row and explain that clearly in `Notes`.

| Artifact | Network | Address / Program | Auditor | Report PDF | Matching GitHub commit | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| `<artifact or N/A - no deployment change>` | `<network or N/A>` | [`<checksummed 0x... or program id>`](<explorer-url>) | `<auditor name or N/A>` | `<direct PDF URL from auditor site or N/A>` | `<SHA-pinned GitHub URL or N/A>` | `<explain the scope>` |
| `<artifact>` | `<network>` | [`<checksummed 0x... or program id>`](<explorer-url>) | `<second auditor name>` | `<direct PDF URL from auditor site>` | `<SHA-pinned GitHub URL>` | `<optional>` |

## Spell instructions

If the adoption requires onchain actions, list them in execution order. Use checksummed EVM addresses and link them to Etherscan when available. For non-EVM systems, use the chain-native explorer.

| Step | Target contract or script | Function / action | Parameters | Matching GitHub commit | Expected result |
| --- | --- | --- | --- | --- | --- |
| `1` | `<target or N/A>` | `<functionName() or N/A>` | `<args or N/A>` | `<SHA-pinned GitHub URL or N/A>` | `<state change or no onchain action>` |
| `2` | `<target>` | `<functionName()>` | `<args>` | `<SHA-pinned GitHub URL>` | `<state change>` |
