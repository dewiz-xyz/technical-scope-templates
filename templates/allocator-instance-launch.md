<!--
Instructions:
- Best-in-class example: https://forum.skyeco.com/t/technical-scope-of-the-new-pattern-allocator-instance/27641
- Forum tags: technical-scope, <additional-tags-if-needed>
- Keep the forum-post structure close to the PATTERN example.
- Placeholder conventions:
  - <allocator name> = human-readable name, for example PATTERN
  - <ALLOCATOR_PREFIX> = chainlog-style prefix, for example PATTERN
  - <ALLOCATOR_ILK> = allocator ilk, for example ALLOCATOR-PATTERN-A
  - <PIP_ALLOCATOR_KEY> = chainlog key created during init, for example PIP_ALLOCATOR_PATTERN_A
- Keep the Relevant audits section exactly as written below unless the canonical audit set changes.
- Remove any remaining placeholder text before posting.
-->

# Technical scope of the new <allocator name> allocator instance

The technical scope was prepared by <author or team> to assess the required parameters and provide recommendations for the spell instructions regarding the launch of the new <allocator name> allocator instance. The doc is prepared based on the audits listed below and previous allocator onboardings.

## Relevant audits

- [`sky-ecosystem/dss-allocator`](https://github.com/makerdao/dss-allocator/tree/226584d3b179d98025497815adb4ea585ea0102d)
  - [Audit report from ChainSecurity](https://www.chainsecurity.com/security-audit/makerdao-dss-allocator) at the [`226584d`](https://github.com/sky-ecosystem/dss-allocator/tree/226584d3b179d98025497815adb4ea585ea0102d) commit
  - [Audit report from Cantina](https://cantina.xyz/portfolio/ccf91a4a-d29b-40e7-b48e-2669edc06b7e) at the [`dc19248`](https://github.com/sky-ecosystem/dss-allocator/tree/dc192486bd12efa5045af509c9570214e57997bd) commit
    - The [diff](https://github.com/sky-ecosystem/dss-allocator/compare/dc192486bd12efa5045af509c9570214e57997bd..226584d3b179d98025497815adb4ea585ea0102d) only adjust naming of the variables and remove unused interfaces
- [`sky-ecosystem/endgame-toolkit`](https://github.com/sky-ecosystem/endgame-toolkit/)
  - [Audit report from ChainSecurity](https://www.chainsecurity.com/security-audit/maker-endgame-toolkit) at the [`5bf4b17`](https://github.com/sky-ecosystem/endgame-toolkit/tree/5bf4b1771b99f5f8758fd40a4ac567f797b5405b) commit
  - [Audit report from Cantina](https://cantina.xyz/portfolio/24a166ef-0910-4d89-b4f9-8932632f6b98) at the [`1426851`](https://github.com/sky-ecosystem/endgame-toolkit/tree/14268515aa729a588096f0d579ea38bde3e9ba2f) commit
    - The [diff](https://github.com/sky-ecosystem/endgame-toolkit/compare/14268515aa729a588096f0d579ea38bde3e9ba2f..5bf4b1771b99f5f8758fd40a4ac567f797b5405b) does not affect `SubProxy` contract
- [`sky-ecosystem/star-guard`](https://github.com/sky-ecosystem/star-guard/)
  - [Audit report from ChainSecurity](https://www.chainsecurity.com/security-audit/sky-star-guard) at the [`52239d7`](https://github.com/sky-ecosystem/star-guard/tree/52239d716a89188b303f137fc43fb9288735ba2e) commit
  - [Audit report from Cantina](https://cantina.xyz/portfolio/af6da668-1831-43da-8bcd-0ae987238e12) at the [`52239d7`](https://github.com/sky-ecosystem/star-guard/tree/52239d716a89188b303f137fc43fb9288735ba2e) commit

## Pre-deployed contracts

#### **AllocatorBuffer** deployed to the Ethereum Mainnet

- Deployed address: [`<AllocatorBuffer checksummed address>`](https://etherscan.io/address/<AllocatorBuffer-checksummed-address>#code)
- Performed checks
  - :white_check_mark: Verified code exactly matches audited source code at [`src/AllocatorBuffer.sol`](<SHA-pinned GitHub blob URL>)
  - :white_check_mark: Deployed bytecode is verifiable using `forge verify-bytecode`
  - :white_check_mark: Compilation optimizations match [defined in the repo](<SHA-pinned foundry.toml URL>): `<Yes/No with 200 runs>`
  - :white_check_mark: Only `MCD_PAUSE_PROXY` is relied
  - :white_check_mark: Deployer is denied
  - :white_check_mark: No other addresses are relied
  - :white_check_mark: No constructor arguments

#### **AllocatorVault** deployed to the Ethereum Mainnet

- Deployed address: [`<AllocatorVault checksummed address>`](https://etherscan.io/address/<AllocatorVault-checksummed-address>#code)
- Performed checks
  - :white_check_mark: Verified code exactly matches audited source code at [`src/AllocatorVault.sol`](<SHA-pinned GitHub blob URL>)
  - :white_check_mark: Deployed bytecode is verifiable using `forge verify-bytecode`
  - :white_check_mark: Compilation optimizations match [defined in the repo](<SHA-pinned foundry.toml URL>): `<Yes/No with 200 runs>`
  - :white_check_mark: Only `MCD_PAUSE_PROXY` is relied
  - :white_check_mark: Deployer is denied
  - :white_check_mark: No other addresses are relied
  - :white_check_mark: [Constructor arguments](<SHA-pinned constructor definition URL>) match expected ones:
    - :white_check_mark: `address roles_` being `ALLOCATOR_ROLES` from chainlog
    - :white_check_mark: `address buffer_` being `<AllocatorBuffer checksummed address>` (`AllocatorBuffer` address from above)
    - :white_check_mark: `bytes32 ilk_` being `<ALLOCATOR_ILK>`
    - :white_check_mark: `address usdsJoin_` being `USDS_JOIN` from chainlog

#### **SubProxy** deployed to the Ethereum Mainnet

- Deployed address: [`<SubProxy checksummed address>`](https://etherscan.io/address/<SubProxy-checksummed-address>#code)
- Performed checks
  - :white_check_mark: Verified code exactly matches audited source code at [`src/SubProxy.sol`](<SHA-pinned GitHub blob URL>)
  - :white_check_mark: Deployed bytecode is verifiable using `forge verify-bytecode`
  - :white_check_mark: Compilation optimizations match [defined in the repo](<SHA-pinned foundry.toml URL>): `<Yes/No with 200 runs>`
  - :white_check_mark: Only `MCD_PAUSE_PROXY` is relied
  - :white_check_mark: Deployer is denied
  - :white_check_mark: No other addresses are relied
  - :white_check_mark: No constructor arguments

#### **StarGuard** deployed to the Ethereum Mainnet

- Deployed address: [`<StarGuard checksummed address>`](https://etherscan.io/address/<StarGuard-checksummed-address>#code)
- Performed checks:
  - :white_check_mark: Verified code exactly matches audited source code at [`src/StarGuard.sol`](<SHA-pinned GitHub blob URL>)
  - :white_check_mark: Deployed bytecode is verifiable using `forge verify-bytecode`
  - :white_check_mark: Compilation optimizations match [defined in the repo](<SHA-pinned foundry.toml URL>): `<Yes/No with 200 runs>`
  - :white_check_mark: Only `MCD_PAUSE_PROXY` is relied
  - :white_check_mark: Deployer is denied
  - :white_check_mark: No other addresses are relied
  - :white_check_mark: [Constructor arguments](<SHA-pinned constructor definition URL>) match expected ones:
    - :white_check_mark: `address subProxy_` matches new `<SubProxy checksummed address>` (`SubProxy` address from above)

## Proposed spell content

#### 1. Init new Allocator instance by calling [AllocatorInit.initIlk](<SHA-pinned GitHub URL>) with:

- `sharedInstance.oracle` being `PIP_ALLOCATOR` from chainlog
- `sharedInstance.roles` being `ALLOCATOR_ROLES` from chainlog
- `sharedInstance.registry` being `ALLOCATOR_REGISTRY` from chainlog
- `ilkInstance.owner` being `MCD_PAUSE_PROXY` from chainlog
- `ilkInstance.vault` being `<AllocatorVault checksummed address>` (`AllocatorVault` contract)
- `ilkInstance.buffer` being `<AllocatorBuffer checksummed address>` (`AllocatorBuffer` contract)
- `cfg.ilk` being `<ALLOCATOR_ILK>`
- `cfg.duty` being `<value>` (`Note`: value provided by BA Labs)
- `cfg.gap` being `<value>` (`Note`: value provided by BA Labs)
- `cfg.maxLine` being `<value>` (`Note`: value provided by BA Labs)
- `cfg.ttl` being `<value>` (`Note`: value provided by BA Labs)
- `cfg.allocatorProxy` being `<SubProxy checksummed address>` (new `SubProxy` contract from above)
- `cfg.ilkRegistry` being `ILK_REGISTRY` from chainlog

#### 2. Remove newly created `<PIP_ALLOCATOR_KEY>` from chainlog

Use the chainlog key that will be created during initialization, for example `PIP_ALLOCATOR_PATTERN_A`.

#### 3. Add `<ALLOCATOR_ILK>` ilk to the `LINE_MOM`

#### 4. Add `<ALLOCATOR_ILK>` ilk to the `SP-BEAM` with the following parameters:

- `max` being `<value>` basis points (`Note`: value provided by BA Labs)
- `min` being `<value>` basis points (`Note`: value provided by BA Labs)
- `step` being `<value>` basis points (`Note`: value provided by BA Labs)

#### 5. Init new StarGuard module by calling [StarGuardInit.init](<SHA-pinned GitHub URL>) with:

- `chainlog` being `DssExecLib.LOG` (the [chainlog](https://chainlog.sky.money/) address)
- `cfg.subProxy` being `<SubProxy checksummed address>` (new `SubProxy` address from above)
- `cfg.subProxyKey` being `"<ALLOCATOR_PREFIX>_SUBPROXY"` (chainlog key for the new `SubProxy`)
- `cfg.starGuard` being `<StarGuard checksummed address>` (new `StarGuard` contract address from above)
- `cfg.starGuardKey` being `"<ALLOCATOR_PREFIX>_STARGUARD"` (chainlog key for the new `StarGuard`)
- `cfg.maxDelay` being `<value>` (maximum delay in seconds after which the spell will no longer be executable; usually derived from the Atlas or the applicable governance standard)

#### 6. Add new StarGuard module to the `StarGuardJob`

- `StarGuardJobLike(CRON_STARGUARD_JOB).add(<ALLOCATOR_PREFIX>_STARGUARD)`

#### 7. Bump chainlog `PATCH` version
