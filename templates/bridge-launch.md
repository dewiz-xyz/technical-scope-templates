<!--
Instructions:
- Best-in-class example: https://forum.skyeco.com/t/skylink-bridge-to-avalanche/27825
- Forum tags: technical-scope, <additional-tags-if-needed>
- Keep the forum-post structure close to the best-in-class example linked above.
- Keep the Relevant audits section exactly as written below unless the canonical audit set changes.
- Placeholder conventions:
  - <Destination Chain> = target chain name
  - <Destination Chain Mainnet> = target chain full network name
  - <Destination Explorer Address URL> = chain explorer code page for the deployed address
  - <Destination EID> = LayerZero endpoint id for the destination chain
  - <Destination Endpoint V2 checksummed address> = Endpoint V2 address on the destination chain
  - <Destination Endpoint V2 LayerZero Scan URL> = LayerZero scan address page for the destination Endpoint V2
  - <Destination Endpoint V2 setSendLibrary method URL> / <Destination Endpoint V2 setReceiveLibrary method URL> / <Destination Endpoint V2 setConfig method URL> = destination Endpoint V2 method pages on LayerZero scan or the chain explorer
  - <Destination Endpoint V2 grace period reference URL> = destination Endpoint V2 method docs or explorer line link for `_gracePeriod`
  - <Destination LayerZero Chain Docs URL> = LayerZero deployment docs page for the destination chain
  - <Destination-to-Ethereum defaults URL> = LayerZero defaults page for the destination chain to Ethereum route
  - <Ethereum-to-Destination defaults URL> = LayerZero defaults page for the Ethereum to destination chain route
  - <Ethereum Endpoint V2 checksummed address> = Endpoint V2 address on Ethereum Mainnet
  - <Ethereum Endpoint V2 LayerZero Scan URL> = LayerZero scan address page for the Ethereum Endpoint V2
  - <Destination SendUln302> / <Destination ReceiveUln302> = LayerZero library addresses for the destination chain
  - <Destination SendUln302 checksummed address> / <Destination ReceiveUln302 checksummed address> = checksummed LayerZero library addresses for the destination chain
  - <Destination Executor checksummed address> = LayerZero Executor address for the destination chain
  - <Destination DVNs> = the DVN set for the destination chain
  - <Inbound rate limit window> / <Outbound rate limit window> = per-direction rate-limit windows for the route
  - <Inbound rate limit amount> / <Outbound rate limit amount> = per-direction rate-limit caps for the route
- Remove any remaining placeholder text before posting.
-->

# Technical scope of the new SkyLink bridge to `<Destination Chain>`

Sidestream EA has been asked to assess the technical scope for launching the new SkyLink bridge to `<Destination Chain>`. The document was prepared based on the [initial process description](<process description URL>), LayerZero's internal "playbook" documentation, [LayerZero docs](https://docs.layerzero.network/v2/home/intro), and the relevant audits listed below.

The document focuses on launching the Governance, USDS and sUSDS token bridge to `<Destination Chain>`; PSM, Oracle, and Grove's ALM governance migration is out of the scope of this document. Wiring the new OFT to `<other explicitly excluded chain or system>` is also explicitly out of scope due to the additional external complexity it introduces.

## Relevant audits

- `sky-ecosystem/sky-oapp-oft`: LayerZero governance app and oft
  - Governance OApp
    - ChainSecurity ([audit report](https://www.chainsecurity.com/security-audit/sky-governance-oapp), [`5ad5cb6`](https://github.com/sky-ecosystem/sky-oapp-oft/tree/5ad5cb6bbe624e2b1cb99acfe3e4140fa1c233b9))
    - Cantina ([audit report](https://cantina.xyz/portfolio/1b56236e-82c4-494d-af93-750e7d949c04), [`03fa6e8`](https://github.com/sky-ecosystem/sky-oapp-oft/tree/03fa6e8609227440f04bf6f4bbbef61dc87218e7))
    - The [diff](https://github.com/sky-ecosystem/sky-oapp-oft/compare/03fa6e8609227440f04bf6f4bbbef61dc87218e7..5ad5cb6bbe624e2b1cb99acfe3e4140fa1c233b9) only includes comment changes in EVM Governance OApp scope
  - OApp OFT
    - ChainSecurity ([audit report](https://www.chainsecurity.com/security-audit/sky-oapp-oft), [`5ad5cb6`](https://github.com/sky-ecosystem/sky-oapp-oft/tree/5ad5cb6bbe624e2b1cb99acfe3e4140fa1c233b9))
    - Cantina ([audit report](https://cantina.xyz/portfolio/36b85725-583c-4696-ae0d-6a8dded09757), [`b044009`](https://github.com/sky-ecosystem/sky-oapp-oft/tree/b044009dbf7630d6a98efceffc03eb38376ac61d))
    - The [diff](https://github.com/sky-ecosystem/sky-oapp-oft/compare/b044009dbf7630d6a98efceffc03eb38376ac61d..5ad5cb6bbe624e2b1cb99acfe3e4140fa1c233b9) doesn't include changes in EVM OFT scope
- `sky-ecosystem/usds`: USDS token
  - ChainSecurity ([audit report](https://www.chainsecurity.com/security-audit/nst-smart-contracts), [`45bf759`](https://github.com/sky-ecosystem/usds/tree/45bf759ba046b66dd115842ee8b9205a64e7bab6))
  - Cantina ([audit report](https://cantina.xyz/portfolio/b887d247-8eed-4c25-ae90-98838275a30d), [`45bf759`](https://github.com/sky-ecosystem/usds/tree/45bf759ba046b66dd115842ee8b9205a64e7bab6))
- `sky-ecosystem/lz-governance-relay`: LayerZero governance relay
  - ChainSecurity ([audit report](https://www.chainsecurity.com/security-audit/sky-lz-governance-relay), [`d3e3df4`](https://github.com/sky-ecosystem/lz-governance-relay/tree/d3e3df4db417f196fdd56123e7dbb462d04f32ef))
  - Cantina ([audit report](https://cantina.xyz/portfolio/e95407bc-52ce-4af7-a837-60c82d37018a), [`d3e3df4`](https://github.com/sky-ecosystem/lz-governance-relay/tree/d3e3df4db417f196fdd56123e7dbb462d04f32ef))
- `sky-ecosystem/sdai`: l2/sUSDS token
  - ChainSecurity ([audit report](https://www.chainsecurity.com/security-audit/makerdao-savings-nst), [`e1d160a`](https://github.com/sky-ecosystem/sdai/tree/e1d160aba17e95e8cec3d6bf50f310fbed9f28d6))
  - Cantina ([audit report](https://cantina.xyz/portfolio/97f6afde-9776-4fd1-b8a2-57478d18e295), [`e1d160a`](https://github.com/sky-ecosystem/sdai/blob/e1d160aba17e95e8cec3d6bf50f310fbed9f28d6/src/l2/SUsds.sol))

## Pre-deployed contracts

> Note that, compared to the standard deployment process, some of the contracts had to be additionally configured before the deployer transferred ownership to the relevant Sky authority. This is in line with how LayerZero configures the contracts and is required by design. To make those changes transparent, we listed them in the “additional parameters” section inside each contract. We also had to gather all required parameters (rate limits, pauser msig, DVNs, etc) in advance of the deployments in order to deploy them correctly.

### **New `GovernanceOAppReceiver` is deployed to the `<Destination Chain Mainnet>`**

- Deployed address: [`<GovernanceOAppReceiver checksummed address>`](<GovernanceOAppReceiver Explorer URL>)
- Performed checks:
    - ✅ Verified code exactly matches audited source code at the [5ad5cb6](https://github.com/sky-ecosystem/sky-oapp-oft/blob/5ad5cb6bbe624e2b1cb99acfe3e4140fa1c233b9/contracts/GovernanceOAppReceiver.sol)
    - ✅ Deployed bytecode is verifiable using `forge verify-bytecode`
    - ✅ Compilation optimizations match [those defined in the repo](https://github.com/sky-ecosystem/sky-oapp-oft/blob/5ad5cb6bbe624e2b1cb99acfe3e4140fa1c233b9/foundry.toml#L7-L8) (`Yes with 20000 runs`)
    - [Constructor arguments](https://github.com/sky-ecosystem/sky-oapp-oft/blob/5ad5cb6bbe624e2b1cb99acfe3e4140fa1c233b9/contracts/GovernanceOAppReceiver.sol#L28-L33):
        - ✅ `uint32 _governanceOAppSenderEid`: `30101` (Ethereum Mainnet Eid [from the docs](https://docs.layerzero.network/v2/deployments/chains/ethereum))
        - ✅ `bytes32 _governanceOAppSenderAddress`: `<LZ_GOV_SENDER padded with zeros>` (`LZ_GOV_SENDER` from the chainlog, padded with zeros)
        - ✅ `address _endpoint`: [`<Destination Endpoint V2>`](<Destination Endpoint V2 Explorer URL>) (Endpoint V2 on `<Destination Chain Mainnet>` from [the docs](<Destination LayerZero Chain Docs URL>))
        - ✅ `address _owner`: deployer (ℹ️ Required for contract configuration; after it's configured, the ownership is transferred to `L2GovernanceRelay`, checked below)
    - Additional parameters are configured before the owner is switched:
        - ✅ The peer is set via the constructor or `oapp.setPeer(to.eid, to.address)` ([source](https://github.com/LayerZero-Labs/devtools/blob/128b697838f4b0fd53ae748093fd66cc409ae5c4/packages/ua-devtools/src/oapp/config.ts#L75))
            - The last `PeerSet(uint32 eid, bytes32 peer)` event is [emitted](<GovernanceOAppReceiver PeerSet Event URL>) with:
                - `uint32 eid` being `30101` (Ethereum Mainnet Eid [from the docs](https://docs.layerzero.network/v2/deployments/chains/ethereum))
                - `bytes32 peer` being `LZ_GOV_SENDER` from the chainlog, padded with zeros
        - ✅ The delegate is set via `oapp.setDelegate(delegate)` ([source](https://github.com/LayerZero-Labs/devtools/blob/128b697838f4b0fd53ae748093fd66cc409ae5c4/packages/ua-devtools/src/oapp/config.ts#L41))
            - Single `DelegateSet(address sender, address delegate)` event is [emitted from Endpoint V2](<GovernanceOAppReceiver DelegateSet Event URL>) with:
                - `address sender` being `GovernanceOAppReceiver` address
                - `address delegate` being `L2GovernanceRelay` (deployed below)
        - ✅ The last `OwnershipTransferred(address previousOwner, address newOwner)` ([source](https://github.com/OpenZeppelin/openzeppelin-contracts/blob/45f032d1bcf1a88b7bc90154d7eef76c87bf9d45/contracts/access/Ownable.sol#L95-L99)) is [emitted](<GovernanceOAppReceiver OwnershipTransferred Event URL>) with:
            - `previousOwner` being the deployer
            - `newOwner` being the `L2GovernanceRelay` (from below)
        - ✅ No other parameters were configured
    - ✅ Ownership: Single `owner` is set to `L2GovernanceRelay` (from below)

### **New `L2GovernanceRelay` is deployed to the `<Destination Chain Mainnet>`**

- Deployed address: [`<L2GovernanceRelay checksummed address>`](<L2GovernanceRelay Explorer URL>)
- Performed checks:
    - ✅ Verified code exactly matches audited source code at the [d3e3df4](https://github.com/sky-ecosystem/lz-governance-relay/blob/d3e3df4db417f196fdd56123e7dbb462d04f32ef/src/L2GovernanceRelay.sol)
    - ✅ Deployed bytecode is verifiable using `forge verify-bytecode`
    - ✅ Compilation optimizations match [those defined in the repo](https://github.com/sky-ecosystem/lz-governance-relay/blob/d3e3df4db417f196fdd56123e7dbb462d04f32ef/foundry.toml#L7-L8) (`Yes with 200 runs`)
    - [Constructor arguments](https://github.com/sky-ecosystem/lz-governance-relay/blob/d3e3df4db417f196fdd56123e7dbb462d04f32ef/src/L2GovernanceRelay.sol#L52):
        - ✅ `uint32 l1Eid` being `30101` (Ethereum Mainnet Eid [from the docs](https://docs.layerzero.network/v2/deployments/chains/ethereum))
        - ✅ `address l2Oapp` being `GovernanceOAppReceiver` on `<Destination Chain>`
        - ✅ `address l1GovernanceRelay` being `LZ_GOV_RELAY` from the chainlog
    - ✅ Ownership: No ownership

### **New `USDS` proxy is deployed to the `<Destination Chain Mainnet>`**

- `USDS` implementation contract
    - Deployed address: [`<USDS implementation checksummed address>`](<USDS Implementation Explorer URL>)
    - Performed checks:
        - ✅ Verified code exactly matches audited source code at the [45bf759](https://github.com/sky-ecosystem/usds/blob/45bf759ba046b66dd115842ee8b9205a64e7bab6/src/Usds.sol)
        - ✅ Deployed bytecode is verifiable using `forge verify-bytecode`
        - ✅ Compilation optimizations match [those defined in the repo](https://github.com/sky-ecosystem/usds/blob/45bf759ba046b66dd115842ee8b9205a64e7bab6/foundry.toml#L6-L7) (`Yes with 200 runs`)
        - ✅ No constructor arguments
            ℹ️ Although the contract does not accept constructor arguments, the explorer shows a dedicated section with constructor arguments. However, the state of the contract is unaffected, and the arguments shown match proxy contract constructor arguments  (implementation and _data). With that, it seems to be the explorer bug rather than the actual constructor arguments.
- `ERC1967Proxy` contract
    - Deployed address: [`<USDS proxy checksummed address>`](<USDS Proxy Explorer URL>)
    - Performed checks:
        - ✅ Verified code exactly matches audited source code at the [dbb6104](https://github.com/OpenZeppelin/openzeppelin-contracts/blob/dbb6104ce834628e473d2173bbc9d47f81a9eec3/contracts/proxy/ERC1967/ERC1967Proxy.sol)
        - ✅ Deployed bytecode is verifiable using `forge verify-bytecode`
        - ✅ Compilation optimizations match [those defined in the repo](https://github.com/sky-ecosystem/usds/blob/45bf759ba046b66dd115842ee8b9205a64e7bab6/foundry.toml#L6-L7) (`Yes with 200 runs`)
        - Constructor arguments:
            - ✅ `address implementation` matches the implementation contract specified above
            - ✅ `bytes _data` matches `0x8129fc1c` (i.e., [`initialize()`](https://www.4byte.directory/signatures/?bytes4_signature=0x8129fc1c) method)
        - Additional parameters are configured before the owner is switched
            - ✅ `SkyOFTAdapterMintBurn(USDS)` (from below) is relied
            - ✅ No other parameters were configured
        - Ownership:
            - ✅ `L2GovernanceRelay` (from above) is relied
            - ✅ `SkyOFTAdapterMintBurn(USDS)` (from below) is relied
            - ✅ No other addresses were relied
            - ✅ The deployer is denied

### **New `SkyOFTAdapterMintBurn(USDS)` is deployed to the `<Destination Chain Mainnet>`**

- Deployed address: [`<SkyOFTAdapterMintBurn(USDS) checksummed address>`](<SkyOFTAdapterMintBurn USDS Explorer URL>)
- Performed checks:
    - ✅ Verified code exactly matches audited source code at the [5ad5cb6](https://github.com/sky-ecosystem/sky-oapp-oft/blob/5ad5cb6bbe624e2b1cb99acfe3e4140fa1c233b9/contracts/SkyOFTAdapterMintBurn.sol)
    - ✅ Deployed bytecode is verifiable using `forge verify-bytecode`
    - ✅ Compilation optimizations match [those defined in the repo](https://github.com/sky-ecosystem/sky-oapp-oft/blob/5ad5cb6bbe624e2b1cb99acfe3e4140fa1c233b9/foundry.toml#L7-L8) (`Yes with 20000 runs`)
    - [Constructor arguments](https://github.com/sky-ecosystem/sky-oapp-oft/blob/5ad5cb6bbe624e2b1cb99acfe3e4140fa1c233b9/contracts/SkyOFTAdapterMintBurn.sol#L30-L34):
        - ✅ `address _token`: `USDS` proxy on `<Destination Chain>` (deployed above)
        - ✅ `address _lzEndpoint`: [`<Destination Endpoint V2>`](<Destination Endpoint V2 Explorer URL>) (Endpoint V2 on `<Destination Chain Mainnet>` from [the docs](<Destination LayerZero Chain Docs URL>))
        - ✅ `address _delegate`: deployer (ℹ️ Required for contract configuration; after it's configured, the ownership is transferred to `L2GovernanceRelay`, checked below)
    - Additional parameters are configured before the owner is passed to `L2GovernanceRelay`
        - ✅ The peer is set via `oft.setPeer(to.eid, to.address)` ([source](https://github.com/LayerZero-Labs/devtools/blob/128b697838f4b0fd53ae748093fd66cc409ae5c4/packages/ua-devtools/src/oapp/config.ts#L75))
            - Single `PeerSet(uint32 eid, bytes32 peer)` event [is emitted](<SkyOFTAdapterMintBurn USDS PeerSet Event URL>) with:
                - `uint32 eid` being `30101` (Ethereum Mainnet Eid [from the docs](https://docs.layerzero.network/v2/deployments/chains/ethereum))
                - `bytes32 peer` being `USDS_OFT` from the chainlog, padded with zeros
        - ✅ Enforced options are set via `oft.setEnforcedOptions(enforcedOptionsConfig)` ([source](https://github.com/LayerZero-Labs/devtools/blob/128b697838f4b0fd53ae748093fd66cc409ae5c4/packages/ua-devtools/src/oapp/config.ts#L640))
            - Single `EnforcedOptionSet(EnforcedOptionParam[] _enforcedOptions)` event [is emitted](<SkyOFTAdapterMintBurn USDS EnforcedOptionSet Event URL>) with: (**Confirmed by LayerZero**)
                - `_enforcedOptions` being an array of encoded structs with two items:
                    - First element
                        - `uint32 eid` being `30101` (Ethereum, [source](https://docs.layerzero.network/v2/deployments/chains/ethereum))
                        - `uint16 msgType` being `1` (Meaning SEND, [source](<USDS_OFT msgType 1 reference URL>))
                        - `bytes options` being [encoded](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/oapp/contracts/oapp/libs/OptionsBuilder.sol#L55-L56):
                            - `uint128 _gas` being `130_000` ([source](https://github.com/sky-ecosystem/sky-oapp-oft/blob/0baba10c77a5cdfcef8fe9611e38d4306ab827a7/oft.layerzero.mainnet.config.ts#L20))
                            - `uint128 _value` being `0` ([source](https://github.com/sky-ecosystem/sky-oapp-oft/blob/0baba10c77a5cdfcef8fe9611e38d4306ab827a7/oft.layerzero.mainnet.config.ts#L21))
                    - Second element
                        - `uint32 eid` being `30101` (Ethereum, [source](https://docs.layerzero.network/v2/deployments/chains/ethereum))
                        - `uint16 msgType` being `2` (Meaning SEND_AND_CALL, [source](<USDS_OFT msgType 2 reference URL>))
                        - `bytes options` being [encoded](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/oapp/contracts/oapp/libs/OptionsBuilder.sol#L55-L56):
                            - `uint128 _gas` being `130_000` ([source](https://github.com/sky-ecosystem/sky-oapp-oft/blob/0baba10c77a5cdfcef8fe9611e38d4306ab827a7/oft.layerzero.mainnet.config.ts#L26))
                            - `uint128 _value` being `0` ([source](https://github.com/sky-ecosystem/sky-oapp-oft/blob/0baba10c77a5cdfcef8fe9611e38d4306ab827a7/oft.layerzero.mainnet.config.ts#L27))
        - ✅ Single `PauserSet(address indexed pauser, bool canPause)` event ([source](https://github.com/sky-ecosystem/sky-oapp-oft/blob/5ad5cb6bbe624e2b1cb99acfe3e4140fa1c233b9/contracts/SkyOFTCore.sol#L162)) [is emitted](<SkyOFTAdapterMintBurn USDS PauserSet Event URL>) with:
            - `address pauser` being [`<Pauser checksummed address>`](<Pauser Explorer URL>) **(Provided by the Executor Agent)**
            - `bool canPause` being `true` (required to actually enable the pauser)
        - ✅ If rate limits are set to non-zero values:
            - At least two `RateLimitsChanged(RateLimitConfig[] rateLimitConfigs, RateLimitDirection direction)` events ([source](https://github.com/sky-ecosystem/sky-oapp-oft/blob/5ad5cb6bbe624e2b1cb99acfe3e4140fa1c233b9/contracts/SkyRateLimiter.sol#L79)) are emitted:
                - The first [emitted](<SkyOFTAdapterMintBurn USDS Inbound RateLimitsChanged Event URL>) event
                    - `rateLimitConfigs` being an array with a single item of:
                        - `uint32 eid` being `30101` (Ethereum Mainnet Eid [from the docs](https://docs.layerzero.network/v2/deployments/chains/ethereum))
                        - `uint48 window` being `<Inbound rate limit window>` **(Provided by BA labs)**
                        - `uint256 limit` being `<Inbound rate limit amount>` **(Provided by BA labs)**
                    - `direction` being `0` (inbound, [source](https://github.com/sky-ecosystem/sky-oapp-oft/blob/5ad5cb6bbe624e2b1cb99acfe3e4140fa1c233b9/contracts/interfaces/ISkyRateLimiter.sol#L32))
                - The second [emitted](<SkyOFTAdapterMintBurn USDS Outbound RateLimitsChanged Event URL>) event
                    - `rateLimitConfigs` being an array with a single item of:
                        - `uint32 eid` being `30101` (Ethereum Mainnet Eid [from the docs](https://docs.layerzero.network/v2/deployments/chains/ethereum))
                        - `uint48 window` being `<Outbound rate limit window>` **(Provided by BA labs)**
                        - `uint256 limit` being `<Outbound rate limit amount>` **(Provided by BA labs)**
                    - `direction` being `1` (outbound, [source](https://github.com/sky-ecosystem/sky-oapp-oft/blob/5ad5cb6bbe624e2b1cb99acfe3e4140fa1c233b9/contracts/interfaces/ISkyRateLimiter.sol#L33))
        - ✅ The delegate is set via `oapp.setDelegate(delegate)` ([source](https://github.com/LayerZero-Labs/devtools/blob/128b697838f4b0fd53ae748093fd66cc409ae5c4/packages/ua-devtools/src/oapp/config.ts#L41))
            - Single `DelegateSet(address sender, address delegate)` event is [emitted](<SkyOFTAdapterMintBurn USDS DelegateSet Event URL>) from the Endpoint V2 with:
                - `address sender` being `SkyOFTAdapterMintBurn(USDS)` address
                - `address delegate` being `L2GovernanceRelay` (deployed above)
        - ✅ Skip `feeBps` setting as it's set to `0` **(Provided by BA labs)**
        - ✅ The last `OwnershipTransferred(address previousOwner, address newOwner)` ([source](https://github.com/OpenZeppelin/openzeppelin-contracts/blob/45f032d1bcf1a88b7bc90154d7eef76c87bf9d45/contracts/access/Ownable.sol#L95-L99)) is [emitted](<SkyOFTAdapterMintBurn USDS OwnershipTransferred Event URL>) with:
            - `previousOwner` being the deployer
            - `newOwner` being the `L2GovernanceRelay` (from above)
        - ✅ No other parameters were configured
    - ✅ Ownership: The `owner` is set to `L2GovernanceRelay` (from above)


### New `SkyOFTAdapter(sUSDS)` is deployed to the Ethereum Mainnet

- Deployed address: [`<SkyOFTAdapter(sUSDS) checksummed address>`](<SkyOFTAdapter sUSDS Explorer URL>)
- Performed checks:
    - ✅ Verified code exactly matches audited source code at the [5ad5cb6](https://github.com/sky-ecosystem/sky-oapp-oft/blob/5ad5cb6bbe624e2b1cb99acfe3e4140fa1c233b9/contracts/SkyOFTAdapter.sol)
    - ✅ Deployed bytecode is verifiable using `forge verify-bytecode`
        ℹ️ The check pass with `evm_version = 'paris'` (as was set for the [`USDS_OFT`](<USDS_OFT Explorer URL>))
    - ✅ Compilation optimizations match [those defined in the repo](https://github.com/sky-ecosystem/sky-oapp-oft/blob/5ad5cb6bbe624e2b1cb99acfe3e4140fa1c233b9/foundry.toml#L7-L8) (`Yes with 20000 runs`)
    - [Constructor arguments](https://github.com/sky-ecosystem/sky-oapp-oft/blob/5ad5cb6bbe624e2b1cb99acfe3e4140fa1c233b9/contracts/SkyOFTAdapter.sol#L32-L36):
        - ✅ `address _token`: `SUSDS` address from chainlog
        - ✅ `address _lzEndpoint`: [`<Ethereum Endpoint V2>`](<Ethereum Endpoint V2 Explorer URL>) (Endpoint V2 on Ethereum Mainnet from [the docs](https://docs.layerzero.network/v2/deployments/chains/ethereum))
        - ✅ `address _delegate`: `MCD_PAUSE_PROXY` (ℹ️ All configuration will be done in the spell)
    - ✅ No additional parameters were configured
    - ✅ Ownership: The `owner` is set to `MCD_PAUSE_PROXY`


### **New `sUSDS` proxy is deployed to the `<Destination Chain Mainnet>`**

- `L2SUSDS` implementation contract
    - Deployed address: [`<sUSDS implementation checksummed address>`](<sUSDS Implementation Explorer URL>)
    - Performed checks:
        - ✅ Verified code exactly matches audited source code at the [e1d160a](https://github.com/sky-ecosystem/sdai/blob/e1d160aba17e95e8cec3d6bf50f310fbed9f28d6/src/l2/SUsds.sol)
        - ✅ Deployed bytecode is verifiable using `forge verify-bytecode`
            ℹ️ The bytecode checking might fail due to a repo structure: `src/SUsds.sol` is overwriting build artifacts of `src/l2/SUsds.sol`. This can be mitigated by only rebuilding the correct contract `forge build --force src/l2/SUsds.sol`
        - ✅ Compilation optimizations match [those defined in the repo](https://github.com/sky-ecosystem/sdai/blob/e1d160aba17e95e8cec3d6bf50f310fbed9f28d6/foundry.toml#L6-L7) (`Yes with 200 runs`)
        - ✅ No constructor arguments
            ℹ️ Although the contract does not accept constructor arguments, the explorer shows a dedicated section with constructor arguments. However, the state of the contract is unaffected, and the arguments shown match proxy contract constructor arguments  (implementation and _data). With that, it seems to be the explorer bug rather than the actual constructor arguments.
- `ERC1967Proxy` contract
    - Deployed address: [`<sUSDS proxy checksummed address>`](<sUSDS Proxy Explorer URL>)
    - Performed checks:
        - ✅ Verified code exactly matches audited source code at the [dbb6104](https://github.com/OpenZeppelin/openzeppelin-contracts/blob/dbb6104ce834628e473d2173bbc9d47f81a9eec3/contracts/proxy/ERC1967/ERC1967Proxy.sol)
        - ✅ Deployed bytecode is verifiable using `forge verify-bytecode`
        - ✅ Compilation optimizations match [those defined in the repo](https://github.com/sky-ecosystem/sdai/blob/e1d160aba17e95e8cec3d6bf50f310fbed9f28d6/foundry.toml#L6-L7) (`Yes with 200 runs`)
        - Constructor arguments:
            - ✅ `address implementation` matches the implementation contract specified above
            - ✅ `bytes _data` matches `0x8129fc1c` (i.e., [`initialize()`](https://www.4byte.directory/signatures/?bytes4_signature=0x8129fc1c) method)
        - Additional parameters are configured before the owner is switched
            - ✅ `SkyOFTAdapterMintBurn(sUSDS)` (from below) is relied
            - ✅ No other parameters were configured
        - Ownership:
            - ✅ `L2GovernanceRelay` (from above) is relied
            - ✅ `SkyOFTAdapterMintBurn(sUSDS)` (from below) is relied
            - ✅ No other addresses were relied
            - ✅ The deployer is denied

### **New `SkyOFTAdapterMintBurn(sUSDS)` is deployed to the `<Destination Chain Mainnet>`**

- Deployed address: [`<SkyOFTAdapterMintBurn(sUSDS) checksummed address>`](<SkyOFTAdapterMintBurn sUSDS Explorer URL>)
- Performed checks:
    - ✅ Verified code exactly matches audited source code at the [5ad5cb6](https://github.com/sky-ecosystem/sky-oapp-oft/blob/5ad5cb6bbe624e2b1cb99acfe3e4140fa1c233b9/contracts/SkyOFTAdapterMintBurn.sol)
    - ✅ Deployed bytecode is verifiable using `forge verify-bytecode`
    - ✅ Compilation optimizations match [those defined in the repo](https://github.com/sky-ecosystem/sky-oapp-oft/blob/5ad5cb6bbe624e2b1cb99acfe3e4140fa1c233b9/foundry.toml#L7-L8) (`Yes with 20000 runs`)
    - [Constructor arguments](https://github.com/sky-ecosystem/sky-oapp-oft/blob/5ad5cb6bbe624e2b1cb99acfe3e4140fa1c233b9/contracts/SkyOFTAdapterMintBurn.sol#L30-L34):
        - ✅ `address _token`: `sUSDS` proxy on `<Destination Chain>` (deployed above)
            ℹ️ Due to the "Similar Match Source Code", the constructor arguments weren't parsed. However, the state is checked via [the `token` getter](<SkyOFTAdapterMintBurn sUSDS token getter URL>)
        - ✅ `address _lzEndpoint`: [`<Destination Endpoint V2>`](<Destination Endpoint V2 Explorer URL>) (Endpoint V2 on `<Destination Chain Mainnet>` from [the docs](<Destination LayerZero Chain Docs URL>))
            ℹ️ Due to the "Similar Match Source Code", the constructor arguments weren't parsed. However, the state is checked via [the `endpoint` getter](<SkyOFTAdapterMintBurn sUSDS endpoint getter URL>)
        - ✅ `address _delegate`: deployer (ℹ️ Required for contract configuration; after it's configured, the ownership is transferred to `L2GovernanceRelay`, checked below)
            ℹ️ Due to the "Similar Match Source Code", the constructor arguments weren't parsed. However, the state is checked via [the `owner` getter](<SkyOFTAdapterMintBurn sUSDS owner getter URL>) and [the relevant event](<SkyOFTAdapterMintBurn sUSDS ownership transfer event URL>)
    - Additional parameters are configured before the owner is passed to `L2GovernanceRelay`
        - ✅ The peer is set via `oapp.setPeer(to.eid, to.address)` ([source](https://github.com/LayerZero-Labs/devtools/blob/128b697838f4b0fd53ae748093fd66cc409ae5c4/packages/ua-devtools/src/oapp/config.ts#L75))
            - Single `PeerSet(uint32 eid, bytes32 peer)` event is [emitted](<SkyOFTAdapterMintBurn sUSDS PeerSet Event URL>) with:
                - `uint32 eid` being `30101` (Ethereum Mainnet Eid [from the docs](https://docs.layerzero.network/v2/deployments/chains/ethereum))
                - `bytes32 peer` being `SkyOFTAdapter(sUSDS)` on Ethereum Mainnet (deployed above), padded with zeros
        - ✅ Enforced options are set via `oapp.setEnforcedOptions(enforcedOptionsConfig)` ([source](https://github.com/LayerZero-Labs/devtools/blob/128b697838f4b0fd53ae748093fd66cc409ae5c4/packages/ua-devtools/src/oapp/config.ts#L640))
            - Single `EnforcedOptionSet(EnforcedOptionParam[] _enforcedOptions)` event is [emitted](<SkyOFTAdapterMintBurn sUSDS EnforcedOptionSet Event URL>) with: (**Confirmed by LayerZero**)
                - `_enforcedOptions` being an array of encoded structs with two items:
                    - First element
                        - `uint32 eid` being `30101` (Ethereum, [source](https://docs.layerzero.network/v2/deployments/chains/ethereum))
                        - `uint16 msgType` being `1` (Meaning SEND, [source](<USDS_OFT msgType 1 reference URL>))
                        - `bytes options` being [encoded](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/oapp/contracts/oapp/libs/OptionsBuilder.sol#L55-L56):
                            - `uint128 _gas` being `130_000` ([source](https://github.com/sky-ecosystem/sky-oapp-oft/blob/0baba10c77a5cdfcef8fe9611e38d4306ab827a7/oft.layerzero.mainnet.config.ts#L20))
                            - `uint128 _value` being `0` ([source](https://github.com/sky-ecosystem/sky-oapp-oft/blob/0baba10c77a5cdfcef8fe9611e38d4306ab827a7/oft.layerzero.mainnet.config.ts#L21))
                    - Second element
                        - `uint32 eid` being `30101` (Ethereum, [source](https://docs.layerzero.network/v2/deployments/chains/ethereum))
                        - `uint16 msgType` being `2` (Meaning SEND_AND_CALL, [source](<USDS_OFT msgType 2 reference URL>))
                        - `bytes options` being [encoded](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/oapp/contracts/oapp/libs/OptionsBuilder.sol#L55-L56):
                            - `uint128 _gas` being `130_000` ([source](https://github.com/sky-ecosystem/sky-oapp-oft/blob/0baba10c77a5cdfcef8fe9611e38d4306ab827a7/oft.layerzero.mainnet.config.ts#L26))
                            - `uint128 _value` being `0` ([source](https://github.com/sky-ecosystem/sky-oapp-oft/blob/0baba10c77a5cdfcef8fe9611e38d4306ab827a7/oft.layerzero.mainnet.config.ts#L27))
        - ✅ Single `PauserSet(address indexed pauser, bool canPause)` event ([source](https://github.com/sky-ecosystem/sky-oapp-oft/blob/5ad5cb6bbe624e2b1cb99acfe3e4140fa1c233b9/contracts/SkyOFTCore.sol#L162)) is [emitted](<SkyOFTAdapterMintBurn sUSDS PauserSet Event URL>) with:
            - `address pauser` being [`<Pauser checksummed address>`](<Pauser Explorer URL>) **(Provided by the Executor Agent)**
            - `bool canPause` being `true` (required to actually enable the pauser)
        - ✅ Rate limit setting is skipped since it's `0` by default
            - ~~At least two `RateLimitsChanged(RateLimitConfig[] rateLimitConfigs, RateLimitDirection direction)` events ([source](https://github.com/sky-ecosystem/sky-oapp-oft/blob/5ad5cb6bbe624e2b1cb99acfe3e4140fa1c233b9/contracts/SkyRateLimiter.sol#L79)) are emitted:~~
                - ~~The first event~~
                    - ~~`rateLimitConfigs` being an array with a single item of:~~
                        - ~~`uint32 eid` being `30101` (Ethereum Mainnet Eid [from the docs](https://docs.layerzero.network/v2/deployments/chains/ethereum))~~
                        - ~~`uint48 window` being `0` **(Provided by BA labs)**~~
                        - ~~`uint256 limit` being `0` **(Provided by BA labs)**~~
                    - ~~`direction` being `0` (inbound)~~
                - ~~The second event~~
                    - ~~`rateLimitConfigs` being an array with a single item of:~~
                        - ~~`uint32 eid` being `30101` (Ethereum Mainnet Eid [from the docs](https://docs.layerzero.network/v2/deployments/chains/ethereum))~~
                        - ~~`uint48 window` being `0` **(Provided by BA labs)**~~
                        - ~~`uint256 limit` being `0` **(Provided by BA labs)**~~
                    - ~~`direction` being `1` (outbound)~~
        - ✅ The delegate is set via `oapp.setDelegate(delegate)` ([source](https://github.com/LayerZero-Labs/devtools/blob/128b697838f4b0fd53ae748093fd66cc409ae5c4/packages/ua-devtools/src/oapp/config.ts#L41))
            - Single `DelegateSet(address sender, address delegate)` event is [emitted](<SkyOFTAdapterMintBurn sUSDS DelegateSet Event URL>) with:
                - `address sender` being `SkyOFTAdapterMintBurn(sUSDS)` address
                - `address delegate` being `L2GovernanceRelay` (deployed above)
        - ✅ Skip `feeBps` setting as it's set to `0` **(Provided by BA labs)**
        - ✅ No other parameters were configured
    - ✅ Ownership: The `owner` is set to `L2GovernanceRelay` (deployed above)

## Spell pre-requirements

> It is unusual for Sky setups, but the LayerZero bridge configuration also requires submitting transactions from the deployer wallet to the existing ”Endpoint V2” contract ( [`<Destination Endpoint V2 checksummed address>`](<Destination Endpoint V2 LayerZero Scan URL>) from [the docs](<Destination LayerZero Chain Docs URL>)) to pre-configure certain parameters there.

### **New `GovernanceOAppReceiver` is configured inside Endpoint V2 on `<Destination Chain Mainnet>`**

1. SendLibrary is set via `endpoint.setSendLibrary(from.address, to.eid, sendLibrary)` ([source](https://github.com/LayerZero-Labs/devtools/blob/128b697838f4b0fd53ae748093fd66cc409ae5c4/packages/ua-devtools/src/oapp/config.ts#L148)) (Note: the `GovernanceOAppReceiver` doesn't send messages to Ethereum Mainnet; therefore, setting SendLibrary is optional, but this transaction is automatically submitted by the script inside `sky-ecosystem/sky-oapp-oft` : **Confirmed by LayerZero**)
    - ✅ [EndpointV2.setSendLibrary method](<Destination Endpoint V2 setSendLibrary method URL>) was called with:
        - `address _oapp` being `GovernanceOAppReceiver` address (from above)
        - `uint32 _eid` being `30101` (Ethereum Mainnet Eid [from the docs](https://docs.layerzero.network/v2/deployments/chains/ethereum))
        - `address _newLib` being `<Destination SendUln302 checksummed address>` (SendUln302 from [the docs](<Destination LayerZero Chain Docs URL>))
2. ReceiveLibrary is set via `endpoint.setReceiveLibrary(from.address, to.eid, receiveLibararyConfig.receiveLibarary, receiveLibararyConfig.gracePeriod)` ([source](https://github.com/LayerZero-Labs/devtools/blob/128b697838f4b0fd53ae748093fd66cc409ae5c4/packages/ua-devtools/src/oapp/config.ts#L227-L232))
    - ✅ [EndpointV2.setReceiveLibrary method](<Destination Endpoint V2 setReceiveLibrary method URL>) was called with:
        - `address _oapp` being `GovernanceOAppReceiver` address (from above)
        - `uint32 _eid` being `30101` (Ethereum Mainnet Eid [from the docs](https://docs.layerzero.network/v2/deployments/chains/ethereum))
        - `address _newLib` being `<Destination ReceiveUln302 checksummed address>` (ReceiveUln302 from [the docs](<Destination LayerZero Chain Docs URL>))
        - `uint256 _gracePeriod` being `<value>` ([the number of blocks from now until oldLib expires](<Destination Endpoint V2 grace period reference URL>))
3. ReceiveLibrary is configured
    - ✅ [EndpointV2.setConfig method](<Destination Endpoint V2 setConfig method URL>) was called with:
        - `address _oapp` being `GovernanceOAppReceiver` address (from above)
        - `address _lib` being `<Destination ReceiveUln302 checksummed address>` (ReceiveUln302 from [the docs](<Destination LayerZero Chain Docs URL>))
        - `SetConfigParam[] calldata _params` being an array with:
            - `uint32 eid` being `30101` (Ethereum Mainnet Eid [from the docs](https://docs.layerzero.network/v2/deployments/chains/ethereum))
            - `uint32 configType` being `2` (meaning `ULN`, [docs](https://docs.layerzero.network/v2/developers/evm/configuration/dvn-executor-config))
            - `bytes config` being [UlnConfig struct](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/messagelib/contracts/uln/UlnBase.sol#L8-L16) with: (**Confirmed by LayerZero**)
                - `uint64 confirmations` being `<value>` (default configuration from [the docs](<Destination-to-Ethereum defaults URL>))
                - `uint8 requiredDVNCount` being `<value>`
                - `uint8 optionalDVNCount` being `<value>`
                - `uint8 optionalDVNThreshold` being `<value>`
                - `address[] requiredDVNs` being an array with `<count>` addresses
                - `address[] optionalDVNs` being an array with `<count>` addresses (from [the docs](<Destination LayerZero Chain Docs URL>)):
                    - `<optional DVN 1 checksummed address>` (`<optional DVN 1 name>`)
                    - `<optional DVN 2 checksummed address>` (`<optional DVN 2 name>`)
4. ✅ SendLibrary is not configured for the Oapp, since it is only supposed to receive messages from the Ethereum Mainnet

### **New `SkyOFTAdapterMintBurn(USDS)` is configured inside Endpoint V2 on `<Destination Chain Mainnet>`**

1. SendLibrary is set via `endpoint.setSendLibrary(from.address, to.eid, sendLibrary)` ([source](https://github.com/LayerZero-Labs/devtools/blob/128b697838f4b0fd53ae748093fd66cc409ae5c4/packages/ua-devtools/src/oapp/config.ts#L148))
    - ✅ [EndpointV2.setSendLibrary method](<Destination Endpoint V2 setSendLibrary method URL>) was called with:
        - `address _oapp` being `SkyOFTAdapterMintBurn(USDS)` address (from above)
        - `uint32 _eid` being `30101` (Ethereum Mainnet Eid [from the docs](https://docs.layerzero.network/v2/deployments/chains/ethereum))
        - `address _newLib` being `<Destination SendUln302 checksummed address>` (SendUln302 from [the docs](<Destination LayerZero Chain Docs URL>))
2. ReceiveLibrary is set via `endpoint.setReceiveLibrary(from.address, to.eid, receiveLibararyConfig.receiveLibarary, receiveLibararyConfig.gracePeriod)` ([source](https://github.com/LayerZero-Labs/devtools/blob/128b697838f4b0fd53ae748093fd66cc409ae5c4/packages/ua-devtools/src/oapp/config.ts#L227-L232))
    - ✅ [EndpointV2.setReceiveLibrary method](<Destination Endpoint V2 setReceiveLibrary method URL>) was called with:
        - `address _oapp` being `SkyOFTAdapterMintBurn(USDS)` address (from above)
        - `uint32 _eid` being `30101` (Ethereum Mainnet Eid [from the docs](https://docs.layerzero.network/v2/deployments/chains/ethereum))
        - `address _newLib` being `<Destination ReceiveUln302 checksummed address>` (ReceiveUln302 from [the docs](<Destination LayerZero Chain Docs URL>))
        - `uint256 _gracePeriod` being `0` ([the number of blocks from now until oldLib expires](<Destination Endpoint V2 grace period reference URL>))
3. SendLibrary is configured
    - ✅ [EndpointV2.setConfig method](<Destination Endpoint V2 setConfig method URL>) was called with:
        - `address _oapp` being `SkyOFTAdapterMintBurn(USDS)` address (from above)
        - `address _lib` being `<Destination SendUln302 checksummed address>` (SendUln302 from [the docs](<Destination LayerZero Chain Docs URL>))
        - `SetConfigParam[] calldata _params` being an array with `2` items:
            - Item one
                - `uint32 eid` being `30101` (Ethereum Mainnet Eid [from the docs](https://docs.layerzero.network/v2/deployments/chains/ethereum))
                - `uint32 configType` being `1` (meaning `Executor`, [docs](https://docs.layerzero.network/v2/developers/evm/configuration/dvn-executor-config))
                - `bytes config` being encoded [ExecutorConfig](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/messagelib/contracts/SendLibBase.sol#L23-L26):
                    - `uint32 maxMessageSize` being `10_000` (from the [docs](https://docs.layerzero.network/v2/developers/evm/protocol-contracts-overview#max-message-bytes-size))
                    - `address executor` being `<Destination Executor checksummed address>` (LayerZero Executor on `<Destination Chain Mainnet>` from [the docs](<Destination LayerZero Chain Docs URL>))
            - Item two
                - `uint32 eid` being `30101` (Ethereum Mainnet Eid [from the docs](https://docs.layerzero.network/v2/deployments/chains/ethereum))
                - `uint32 configType` being `2` (meaning `ULN`, [docs](https://docs.layerzero.network/v2/developers/evm/configuration/dvn-executor-config))
                - `bytes config` being encoded [UlnConfig struct](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/messagelib/contracts/uln/UlnBase.sol#L8-L16): (**Confirmed by LayerZero**)
                    - `uint64 confirmations` being `<value>` (default configuration from [the docs](<Destination-to-Ethereum defaults URL>))
                    - `uint8 requiredDVNCount` being `<value>`
                    - `uint8 optionalDVNCount` being `<value>`
                    - `uint8 optionalDVNThreshold` being `<value>`
                    - `address[] requiredDVNs` being an array with `<count>` addresses:
                        - `<required DVN 1 checksummed address>` (`<required DVN 1 name>`)
                        - `<required DVN 2 checksummed address>` (`<required DVN 2 name>`)
                    - `address[] optionalDVNs` being an array with `<count>` addresses
4. ReceiveLibrary is configured
    - ✅ [EndpointV2.setConfig method](<Destination Endpoint V2 setConfig method URL>) was called with:
        - `address _oapp` being `SkyOFTAdapterMintBurn(USDS)` address (from above)
        - `address _lib` being `<Destination ReceiveUln302 checksummed address>` (ReceiveUln302 from [the docs](<Destination LayerZero Chain Docs URL>))
        - `SetConfigParam[] calldata _params` being an array with `1` item:
            - `uint32 eid` being `30101` (Ethereum Mainnet Eid [from the docs](https://docs.layerzero.network/v2/deployments/chains/ethereum))
            - `uint32 configType` being `2` (meaning `ULN`, [docs](https://docs.layerzero.network/v2/developers/evm/configuration/dvn-executor-config))
            - `bytes config` being [UlnConfig struct](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/messagelib/contracts/uln/UlnBase.sol#L8-L16): (**Confirmed by LayerZero**)
                - `uint64 confirmations` being `<value>` (default configuration from [the docs](<Destination-to-Ethereum defaults URL>))
                - `uint8 requiredDVNCount` being `<value>`
                - `uint8 optionalDVNCount` being `<value>`
                - `uint8 optionalDVNThreshold` being `<value>`
                - `address[] requiredDVNs` being an array with `<count>` addresses:
                    - `<required DVN 1 checksummed address>` (`<required DVN 1 name>`)
                    - `<required DVN 2 checksummed address>` (`<required DVN 2 name>`)
                - `address[] optionalDVNs` being an array with `<count>` addresses

### **New `SkyOFTAdapterMintBurn(sUSDS)` is configured inside Endpoint V2 on `<Destination Chain Mainnet>`**

1. SendLibrary is set via `endpoint.setSendLibrary(from.address, to.eid, sendLibrary)` ([source](https://github.com/LayerZero-Labs/devtools/blob/128b697838f4b0fd53ae748093fd66cc409ae5c4/packages/ua-devtools/src/oapp/config.ts#L148))
    - ✅ [EndpointV2.setSendLibrary](<Destination Endpoint V2 setSendLibrary method URL>) was called with:
        - `address _oapp` being `SkyOFTAdapterMintBurn(sUSDS)` address (from above)
        - `uint32 _eid` being `30101` (Ethereum Mainnet Eid [from the docs](https://docs.layerzero.network/v2/deployments/chains/ethereum))
        - `address _newLib` being `<Destination SendUln302 checksummed address>` (SendUln302 from [the docs](<Destination LayerZero Chain Docs URL>))
2. ReceiveLibrary is set via `endpoint.setReceiveLibrary(from.address, to.eid, receiveLibararyConfig.receiveLibarary, receiveLibararyConfig.gracePeriod)` ([source](https://github.com/LayerZero-Labs/devtools/blob/128b697838f4b0fd53ae748093fd66cc409ae5c4/packages/ua-devtools/src/oapp/config.ts#L227-L232))
    - ✅ [EndpointV2.setReceiveLibrary method](<Destination Endpoint V2 setReceiveLibrary method URL>) was called with:
        - `address _oapp` being `SkyOFTAdapterMintBurn(sUSDS)` address (from above)
        - `uint32 _eid` being `30101` (Ethereum Mainnet Eid [from the docs](https://docs.layerzero.network/v2/deployments/chains/ethereum))
        - `address _newLib` being `<Destination ReceiveUln302 checksummed address>` (ReceiveUln302 from [the docs](<Destination LayerZero Chain Docs URL>))
        - `uint256 _gracePeriod` being `0` ([the number of blocks from now until oldLib expires](<Destination Endpoint V2 grace period reference URL>))
3. SendLibrary is configured
    - ✅ [EndpointV2.setConfig method](<Destination Endpoint V2 setConfig method URL>) was called with:
        - `address _oapp` being `SkyOFTAdapterMintBurn(sUSDS)` address (from above)
        - `address _lib` being `<Destination SendUln302 checksummed address>` (SendUln302 from [the docs](<Destination LayerZero Chain Docs URL>))
        - `SetConfigParam[] calldata _params` being an array with `2` items:
            - Item one
                - `uint32 eid` being `30101` (Ethereum Mainnet Eid [from the docs](https://docs.layerzero.network/v2/deployments/chains/ethereum))
                - `uint32 configType` being `1` (meaning `Executor`, [docs](https://docs.layerzero.network/v2/developers/evm/configuration/dvn-executor-config))
                - `bytes config` being encoded [ExecutorConfig](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/messagelib/contracts/SendLibBase.sol#L23-L26):
                    - `uint32 maxMessageSize` being `10_000` (from the [docs](https://docs.layerzero.network/v2/developers/evm/protocol-contracts-overview#max-message-bytes-size))
                    - `address executor` being `<Destination Executor checksummed address>` (LayerZero Executor on `<Destination Chain Mainnet>` from [the docs](<Destination LayerZero Chain Docs URL>))
            - Item two
                - `uint32 eid` being `30101` (Ethereum Mainnet Eid [from the docs](https://docs.layerzero.network/v2/deployments/chains/ethereum))
                - `uint32 configType` being `2` (meaning `ULN`, [docs](https://docs.layerzero.network/v2/developers/evm/configuration/dvn-executor-config))
                - `bytes config` being encoded [UlnConfig struct](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/messagelib/contracts/uln/UlnBase.sol#L8-L16): (**Confirmed by LayerZero**)
                    - `uint64 confirmations` being `<value>` (default configuration from [the docs](<Destination-to-Ethereum defaults URL>))
                    - `uint8 requiredDVNCount` being `<value>`
                    - `uint8 optionalDVNCount` being `<value>`
                    - `uint8 optionalDVNThreshold` being `<value>`
                    - `address[] requiredDVNs` being an array with `<count>` addresses:
                        - `<required DVN 1 checksummed address>` (`<required DVN 1 name>`)
                        - `<required DVN 2 checksummed address>` (`<required DVN 2 name>`)
                    - `address[] optionalDVNs` being an array with `<count>` addresses
4. ReceiveLibrary is configured
    - ✅ [EndpointV2.setConfig method](<Destination Endpoint V2 setConfig method URL>) was called with:
        - `address _oapp` being `SkyOFTAdapterMintBurn(sUSDS)` address (from above)
        - `address _lib` being `<Destination ReceiveUln302 checksummed address>` (ReceiveUln302 from [the docs](<Destination LayerZero Chain Docs URL>))
        - `SetConfigParam[] calldata _params` being an array with `1` item:
            - `uint32 eid` being `30101` (Ethereum Mainnet Eid [from the docs](https://docs.layerzero.network/v2/deployments/chains/ethereum))
            - `uint32 configType` being `2` (meaning `ULN`, [docs](https://docs.layerzero.network/v2/developers/evm/configuration/dvn-executor-config))
            - `bytes config` being [UlnConfig struct](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/messagelib/contracts/uln/UlnBase.sol#L8-L16): (**Confirmed by LayerZero**)
                - `uint64 confirmations` being `<value>` (default configuration from [the docs](<Destination-to-Ethereum defaults URL>))
                - `uint8 requiredDVNCount` being `<value>`
                - `uint8 optionalDVNCount` being `<value>`
                - `uint8 optionalDVNThreshold` being `<value>`
                - `address[] requiredDVNs` being an array with `<count>` addresses:
                    - `<required DVN 1 checksummed address>` (`<required DVN 1 name>`)
                    - `<required DVN 2 checksummed address>` (`<required DVN 2 name>`)
                - `address[] optionalDVNs` being an array with `<count>` addresses

## Recommended spell instructions

### **1. Wire `LZ_GOV_SENDER` on Ethereum Mainnet with `<Destination Chain Mainnet>`**

#### Set `GovernanceOAppReceiver` as a peer on `<Destination Chain>` by calling [`LZ_GOV_SENDER.setPeer`](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/oapp/contracts/oapp/OAppCore.sol#L43) with:

- `LZ_GOV_SENDER` being the address from chainlog
- `uint32 _eid` being `<Destination EID>` (`<Destination Chain Mainnet>` Eid [from the docs](<Destination LayerZero Chain Docs URL>))
- `bytes32 _peer` being `GovernanceOAppReceiver` address from above padded with zeros

#### Set Oapp SendLibrary for `<Destination Chain>` by calling [`EndpointV2.setSendLibrary`](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/protocol/contracts/MessageLibManager.sol#L227) with:

- `EndpointV2` being [`0x1a44076050125825900e736c501f859c50fE728c`](https://etherscan.io/address/0x1a44076050125825900e736c501f859c50fE728c) (Endpoint V2 on Ethereum Mainnet from [the docs](https://docs.layerzero.network/v2/deployments/chains/ethereum))
- `address _oapp` being `LZ_GOV_SENDER` from chainlog
- `uint32 _eid` being `<Destination EID>` (`<Destination Chain Mainnet>` Eid [from the docs](<Destination LayerZero Chain Docs URL>))
- `address _newLib` being [`0xbB2Ea70C9E858123480642Cf96acbcCE1372dCe1`](https://etherscan.io/address/0xbB2Ea70C9E858123480642Cf96acbcCE1372dCe1) (SendUln302 on Ethereum Mainnet from [the docs](https://docs.layerzero.network/v2/deployments/chains/ethereum))

#### Configure Oapp SendLibrary for `<Destination Chain>` by calling [`EndpointV2.setConfig`](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/protocol/contracts/MessageLibManager.sol#L307) with:

- `EndpointV2` being [`0x1a44076050125825900e736c501f859c50fE728c`](https://etherscan.io/address/0x1a44076050125825900e736c501f859c50fE728c) (Endpoint V2 on Ethereum Mainnet from [the docs](https://docs.layerzero.network/v2/deployments/chains/ethereum))
- `address _oapp` being `LZ_GOV_SENDER` from chainlog
- `address _lib` being [`0xbB2Ea70C9E858123480642Cf96acbcCE1372dCe1`](https://etherscan.io/address/0xbB2Ea70C9E858123480642Cf96acbcCE1372dCe1) (SendUln302 on Ethereum Mainnet from [the docs](https://docs.layerzero.network/v2/deployments/chains/ethereum))
- `SetConfigParam[] _params` being an array with two items:
    - First item: Executor parameters
        - `uint32 eid` being `<Destination EID>` (`<Destination Chain Mainnet>` Eid [from the docs](<Destination LayerZero Chain Docs URL>))
        - `uint32 configType` being `1` (Executor type from [the source](https://etherscan.io/address/0xbB2Ea70C9E858123480642Cf96acbcCE1372dCe1#code#F1#L16))
        - `bytes config` being encoded [ExecutorConfig](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/messagelib/contracts/SendLibBase.sol#L23-L26) with:
            - `maxMessageSize` being `10_000` (from the [docs](https://docs.layerzero.network/v2/developers/evm/protocol-contracts-overview#max-message-bytes-size))
            - `executor` being [`0x173272739Bd7Aa6e4e214714048a9fE699453059`](https://etherscan.io/address/0x173272739Bd7Aa6e4e214714048a9fE699453059) (Executor on Ethereum Mainnet from [the docs](https://docs.layerzero.network/v2/deployments/chains/ethereum))
    - Second item: ULN parameters
        - `uint32 eid` being `<Destination EID>` (`<Destination Chain Mainnet>` Eid [from the docs](<Destination LayerZero Chain Docs URL>))
        - `uint32 configType` being `2` (ULN type from [the source](https://etherscan.io/address/0xbB2Ea70C9E858123480642Cf96acbcCE1372dCe1#code#F1#L17))
        - `bytes config` being encoded [UlnConfig](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/messagelib/contracts/uln/UlnBase.sol#L8-L16) with: (**Confirmed by LayerZero**)
            - `uint64 confirmations` being `15` (default configuration from [the docs](<Ethereum-to-Destination defaults URL>))
            - `uint8 requiredDVNCount` being `255` (meaning NONE, [source](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/messagelib/contracts/uln/UlnBase.sol#L11))
            - `uint8 optionalDVNCount` being `7`
            - `uint8 optionalDVNThreshold` being `4`
            - `address[] requiredDVNs` being an array with `0` addresses
            - `address[] optionalDVNs` being an array with `7` addresses (from [the docs](https://docs.layerzero.network/v2/deployments/chains/ethereum))([same as for Solana](https://github.com/sky-ecosystem/sky-oapp-oft/blob/0baba10c77a5cdfcef8fe9611e38d4306ab827a7/oapp.layerzero.mainnet.config.ts#L22))
                - `0x589dEDbD617e0CBcB916A9223F4d1300c294236b` (LayerZero Labs)
                - `0xa59BA433ac34D2927232918Ef5B2eaAfcF130BA5` (Nethermind)
                - `0xa4fE5A5B9A846458a70Cd0748228aED3bF65c2cd` (Canary)
                - `0x373a6E5c0C4E89E24819f00AA37ea370917AAfF4` (Deutsche Telekom)
                - `0x06559EE34D85a88317Bf0bfE307444116c631b67` (P2P)
                - `0x380275805876Ff19055EA900CDb2B46a94ecF20D` (Horizen)
                - `0x58249a2Ec05c1978bF21DF1f5eC1847e42455CF4` (Luganodes)

### **2. Allow `LZ_GOV_SENDER` to send messages to `<Destination Chain>`**

#### Call `LZ_GOV_SENDER.setCanCallTarget` with:

- `LZ_GOV_SENDER` being the address from chainlog
- `address _srcSender` being `LZ_GOV_RELAY` from chainlog
- `uint32 _dstEid` being `<Destination EID>` (`<Destination Chain Mainnet>` Eid [from the docs](<Destination LayerZero Chain Docs URL>))
- `bytes32 _dstTarget` being `L2GovernanceRelay` address from above padded with zeros
- `bool _canCall` being `true`

### **3. Wire `USDS_OFT` on Ethereum Mainnet with `<Destination Chain Mainnet>`**

#### Set `SkyOFTAdapterMintBurn(USDS)` as a peer on `<Destination Chain>` by calling [`USDS_OFT.setPeer`](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/oapp/contracts/oapp/OAppCore.sol#L43) with:

- `USDS_OFT` being the address from chainlog
- `uint32 eid` being `<Destination EID>` (`<Destination Chain Mainnet>` Eid [from the docs](<Destination LayerZero Chain Docs URL>))
- `bytes32 _peer` being `SkyOFTAdapterMintBurn(USDS)` (address on `<Destination Chain>` from above padded with zeros)

#### Set OFT SendLibrary for `<Destination Chain>` by calling [`EndpointV2.setSendLibrary`](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/protocol/contracts/MessageLibManager.sol#L227) with:

- `EndpointV2` being [`0x1a44076050125825900e736c501f859c50fE728c`](https://etherscan.io/address/0x1a44076050125825900e736c501f859c50fE728c) (Endpoint V2 on Ethereum Mainnet from [the docs](https://docs.layerzero.network/v2/deployments/chains/ethereum))
- `address _oapp` being `USDS_OFT` from chainlog
- `uint32 _eid` being `<Destination EID>` (`<Destination Chain Mainnet>` Eid [from the docs](<Destination LayerZero Chain Docs URL>))
- `address _newLib` being [`0xbB2Ea70C9E858123480642Cf96acbcCE1372dCe1`](https://etherscan.io/address/0xbB2Ea70C9E858123480642Cf96acbcCE1372dCe1) (SendUln302 on Ethereum Mainnet from [the docs](https://docs.layerzero.network/v2/deployments/chains/ethereum))

#### Set OFT ReceiveLibrary for `<Destination Chain>` by calling [`EndpointV2.setReceiveLibrary`](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/protocol/contracts/MessageLibManager.sol#L245) with:

- `EndpointV2` being [`0x1a44076050125825900e736c501f859c50fE728c`](https://etherscan.io/address/0x1a44076050125825900e736c501f859c50fE728c) (Endpoint V2 on Ethereum Mainnet from [the docs](https://docs.layerzero.network/v2/deployments/chains/ethereum))
- `address _oapp` being `USDS_OFT` from chainlog
- `uint32 _eid` being `<Destination EID>` (`<Destination Chain Mainnet>` Eid [from the docs](<Destination LayerZero Chain Docs URL>))
- `address _newLib` being [`0xc02Ab410f0734EFa3F14628780e6e695156024C2`](https://etherscan.io/address/0xc02Ab410f0734EFa3F14628780e6e695156024C2) (ReceiveUln302 on Ethereum Mainnet from [the docs](https://docs.layerzero.network/v2/deployments/chains/ethereum))
- `_gracePeriod` being `0` (No grace period is needed as this is the first time we set the receive library for `<Destination Chain>`)

#### Configure OFT SendLibrary for `<Destination Chain>` by calling [`EndpointV2.setConfig`](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/protocol/contracts/MessageLibManager.sol#L307) with:

- `EndpointV2` being [`0x1a44076050125825900e736c501f859c50fE728c`](https://etherscan.io/address/0x1a44076050125825900e736c501f859c50fE728c) (Endpoint V2 on Ethereum Mainnet from [the docs](https://docs.layerzero.network/v2/deployments/chains/ethereum))
- `address _oapp` being `USDS_OFT` from chainlog
- `address _lib` being [`0xbB2Ea70C9E858123480642Cf96acbcCE1372dCe1`](https://etherscan.io/address/0xbB2Ea70C9E858123480642Cf96acbcCE1372dCe1) (SendUln302 on Ethereum Mainnet from [the docs](https://docs.layerzero.network/v2/deployments/chains/ethereum))
- `SetConfigParam[] _params` being an array with two items:
    - First item: Executor parameters
        - `uint32 eid` being `<Destination EID>` (`<Destination Chain Mainnet>` Eid [from the docs](<Destination LayerZero Chain Docs URL>))
        - `uint32 configType` being `1` (Executor type from [the source](https://etherscan.io/address/0xbB2Ea70C9E858123480642Cf96acbcCE1372dCe1#code#F1#L16))
        - `bytes config` being encoded [ExecutorConfig](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/messagelib/contracts/SendLibBase.sol#L23-L26) with:
            - `maxMessageSize` being `10_000` (from the [docs](https://docs.layerzero.network/v2/developers/evm/protocol-contracts-overview#max-message-bytes-size))
            - `executor` being [`0x173272739Bd7Aa6e4e214714048a9fE699453059`](https://etherscan.io/address/0x173272739Bd7Aa6e4e214714048a9fE699453059)  (Executor on Ethereum Mainnet from [the docs](https://docs.layerzero.network/v2/deployments/chains/ethereum))
    - Second item: ULN parameters
        - `uint32 eid` being `<Destination EID>` (`<Destination Chain Mainnet>` Eid [from the docs](<Destination LayerZero Chain Docs URL>))
        - `uint32 configType` being `2` (ULN type from [the source](https://etherscan.io/address/0xbB2Ea70C9E858123480642Cf96acbcCE1372dCe1#code#F1#L17))
        - `bytes config` being encoded [UlnConfig](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/messagelib/contracts/uln/UlnBase.sol#L8-L16) with: (**Confirmed by LayerZero**)
            - `uint64 confirmations` being `15` (default configuration from [the docs](<Ethereum-to-Destination defaults URL>))
            - `uint8 requiredDVNCount` being `2`
            - `uint8 optionalDVNCount` being `0`
            - `uint8 optionalDVNThreshold` being `0`
            - `address[] requiredDVNs` being an array with `2` addresses:
                - `0x589dEDbD617e0CBcB916A9223F4d1300c294236b` (LayerZero Labs)
                - `0xa59BA433ac34D2927232918Ef5B2eaAfcF130BA5` (Nethermind)
            - `address[] optionalDVNs` being an array with `0` addresses

#### Configure OFT ReceiveLibrary for `<Destination Chain>` by calling [`EndpointV2.setConfig`](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/protocol/contracts/MessageLibManager.sol#L307) with:

- `EndpointV2` being [`0x1a44076050125825900e736c501f859c50fE728c`](https://etherscan.io/address/0x1a44076050125825900e736c501f859c50fE728c) (Endpoint V2 on Ethereum Mainnet from [the docs](https://docs.layerzero.network/v2/deployments/chains/ethereum))
- `address _oapp` being `USDS_OFT` from chainlog
- `address _lib` being [`0xc02Ab410f0734EFa3F14628780e6e695156024C2`](https://etherscan.io/address/0xc02Ab410f0734EFa3F14628780e6e695156024C2) (ReceiveUln302 on Ethereum Mainnet from [the docs](https://docs.layerzero.network/v2/deployments/chains/ethereum))
- `SetConfigParam[] _params` being an array with one item:
    - `uint32 eid` being `<Destination EID>` (`<Destination Chain Mainnet>` Eid [from the docs](<Destination LayerZero Chain Docs URL>))
    - `uint32 configType` being `2` (ULN type from [the source](https://etherscan.io/address/0xbB2Ea70C9E858123480642Cf96acbcCE1372dCe1#code#F1#L17))
    - `bytes config` being encoded [UlnConfig](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/messagelib/contracts/uln/UlnBase.sol#L8-L16) with: (**Confirmed by LayerZero**)
        - `uint64 confirmations` being `12` (default configuration from [source](<Ethereum-to-Destination defaults URL>))
        - `uint8 requiredDVNCount` being `2`
        - `uint8 optionalDVNCount` being `0`
        - `uint8 optionalDVNThreshold` being `0`
        - `address[] requiredDVNs` being an array with `2` addresses:
            - `0x589dEDbD617e0CBcB916A9223F4d1300c294236b` (LayerZero Labs)
            - `0xa59BA433ac34D2927232918Ef5B2eaAfcF130BA5` (Nethermind)
        - `address[] optionalDVNs` being an array with `0` addresses

#### Set OFT enforced options for `<Destination Chain>` by calling [`USDS_OFT.setEnforcedOptions`](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/oapp/contracts/oapp/libs/OAppOptionsType3.sol#L28) with:

- `USDS_OFT` being the address from chainlog
- [`EnforcedOptionParam`](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/oapp/contracts/oapp/interfaces/IOAppOptionsType3.sol#L5-L12)`[] _enforcedOptions` being an array with `2` items: (**Confirmed by LayerZero**)
    - SendOption (generated with [OptionsBuilder.addExecutorLzReceiveOption](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/oapp/contracts/oapp/libs/OptionsBuilder.sol#L53), [source](https://docs.layerzero.network/v2/tools/sdks/options#generating-options))
        - `uint32 eid` being `<Destination EID>` (`<Destination Chain Mainnet>` Eid [from the docs](<Destination LayerZero Chain Docs URL>))
        - `uint16 msgType` being `1` (Meaning SEND, [source](https://etherscan.io/address/0x1e1d42781fc170ef9da004fb735f56f0276d01b8#readContract#F2))
        - `bytes options` being [encoded](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/oapp/contracts/oapp/libs/OptionsBuilder.sol#L55-L56):
            - `uint128 _gas` being `130_000` ([source](https://github.com/sky-ecosystem/sky-oapp-oft/blob/0baba10c77a5cdfcef8fe9611e38d4306ab827a7/oft.layerzero.mainnet.config.ts#L20))
            - `uint128 _value` being `0` ([source](https://github.com/sky-ecosystem/sky-oapp-oft/blob/0baba10c77a5cdfcef8fe9611e38d4306ab827a7/oft.layerzero.mainnet.config.ts#L21))
    - SendAndCallOption (generated with [OptionsBuilder.addExecutorLzReceiveOption](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/oapp/contracts/oapp/libs/OptionsBuilder.sol#L53), [source](https://docs.layerzero.network/v2/tools/sdks/options#generating-options))
        - `uint32 eid` being `<Destination EID>` (`<Destination Chain Mainnet>` Eid [from the docs](<Destination LayerZero Chain Docs URL>))
        - `uint16 msgType` being `2` (Meaning SEND_AND_CALL, [source](https://etherscan.io/address/0x1e1d42781fc170ef9da004fb735f56f0276d01b8#readContract#F3))
        - `bytes options` being [encoded](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/oapp/contracts/oapp/libs/OptionsBuilder.sol#L55-L56):
            - `uint128 _gas` being `130_000` ([source](https://github.com/sky-ecosystem/sky-oapp-oft/blob/0baba10c77a5cdfcef8fe9611e38d4306ab827a7/oft.layerzero.mainnet.config.ts#L20))
            - `uint128 _value` being `0` ([source](https://github.com/sky-ecosystem/sky-oapp-oft/blob/0baba10c77a5cdfcef8fe9611e38d4306ab827a7/oft.layerzero.mainnet.config.ts#L21))

### **4. Set USDS rate limits for `<Destination Chain>`**

#### Call [`USDS_OFT.setRateLimits`](https://github.com/sky-ecosystem/sky-oapp-oft/blob/5ad5cb6bbe624e2b1cb99acfe3e4140fa1c233b9/contracts/SkyOFTCore.sol#L124) to set inbound and outbound rate limits with:

- `USDS_OFT` being the address from chainlog
- `RateLimitConfig[] _rateLimitConfigsInbound` being an array with one item:
    - `uint32 eid` being `<Destination EID>` (`<Destination Chain Mainnet>` Eid [from the docs](<Destination LayerZero Chain Docs URL>))
    - `uint48 window` being `<Inbound rate limit window>` **(To be confirmed by BA labs)**
    - `uint256 limit` being `<Inbound rate limit amount>` **(To be confirmed by BA labs)**
- `RateLimitConfig[] _rateLimitConfigsOutbound` being an array with one item:
    - `uint32 eid` being `<Destination EID>` (`<Destination Chain Mainnet>` Eid [from the docs](<Destination LayerZero Chain Docs URL>))
    - `uint48 window` being `<Outbound rate limit window>` **(To be confirmed by BA labs)**
    - `uint256 limit` being `<Outbound rate limit amount>` **(To be confirmed by BA labs)**

### **5. Add `<SUSDS_OFT checksummed address>` to chainlog as `SUSDS_OFT`**

### **6. Wire `SUSDS_OFT` on Ethereum Mainnet with `<Destination Chain Mainnet>`**

#### Set `pauser` for `<Destination Chain>` by calling `SUSDS_OFT`.[`setPauser`](https://github.com/sky-ecosystem/sky-oapp-oft/blob/5ad5cb6bbe624e2b1cb99acfe3e4140fa1c233b9/contracts/SkyOFTCore.sol#L156) with:

- `address _pauser` being [`0x38d1114b4cE3e079CC0f627df6aC2776B5887776`](https://etherscan.io/address/0x38d1114b4cE3e079CC0f627df6aC2776B5887776) (”LayerZero Freezer Multisig Address” from the [Atlas edit](https://forum.skyeco.com/t/atlas-edit-weekly-cycle-proposal-week-of-2025-11-03/27381))
- `bool _canPause` being `true` (required to actually enable the pauser)

#### Set `SkyOFTAdapterMintBurn(sUSDS)` as a peer on `<Destination Chain>` by calling `SUSDS_OFT`[`.setPeer`](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/oapp/contracts/oapp/OAppCore.sol#L43) with:

- `SUSDS_OFT` being the address from chainlog
- `uint32 eid` being `<Destination EID>` (`<Destination Chain Mainnet>` Eid [from the docs](<Destination LayerZero Chain Docs URL>))
- `bytes32 _peer` being `SkyOFTAdapterMintBurn(sUSDS)` (address on `<Destination Chain>` from above padded with zeros)

#### Set OFT SendLibrary for `<Destination Chain>` by calling [`EndpointV2.setSendLibrary`](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/protocol/contracts/MessageLibManager.sol#L227) with:

- `EndpointV2` being [`0x1a44076050125825900e736c501f859c50fE728c`](https://etherscan.io/address/0x1a44076050125825900e736c501f859c50fE728c) (Endpoint V2 on Ethereum Mainnet from [the docs](https://docs.layerzero.network/v2/deployments/chains/ethereum))
- `address _oapp` being `SUSDS_OFT` from chainlog
- `uint32 _eid` being `<Destination EID>` (`<Destination Chain Mainnet>` Eid [from the docs](<Destination LayerZero Chain Docs URL>))
- `address _newLib` being [`0xbB2Ea70C9E858123480642Cf96acbcCE1372dCe1`](https://etherscan.io/address/0xbB2Ea70C9E858123480642Cf96acbcCE1372dCe1) (SendUln302 on Ethereum Mainnet from [the docs](https://docs.layerzero.network/v2/deployments/chains/ethereum))

#### Set OFT ReceiveLibrary for `<Destination Chain>` by calling [`EndpointV2.setReceiveLibrary`](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/protocol/contracts/MessageLibManager.sol#L245) with:

- `EndpointV2` being [`0x1a44076050125825900e736c501f859c50fE728c`](https://etherscan.io/address/0x1a44076050125825900e736c501f859c50fE728c) (Endpoint V2 on Ethereum Mainnet from [the docs](https://docs.layerzero.network/v2/deployments/chains/ethereum))
- `address _oapp` being `SUSDS_OFT` from chainlog
- `uint32 _eid` being `<Destination EID>` (`<Destination Chain Mainnet>` Eid [from the docs](<Destination LayerZero Chain Docs URL>))
- `address _newLib` being [`0xc02Ab410f0734EFa3F14628780e6e695156024C2`](https://etherscan.io/address/0xc02Ab410f0734EFa3F14628780e6e695156024C2) (ReceiveUln302 on Ethereum Mainnet from [the docs](https://docs.layerzero.network/v2/deployments/chains/ethereum))
- `_gracePeriod` being `0` (No grace period is needed as this is the first time we set the receive library for `<Destination Chain>`)

#### Configure OFT SendLibrary for `<Destination Chain>` by calling [`EndpointV2.setConfig`](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/protocol/contracts/MessageLibManager.sol#L307) with:

- `EndpointV2` being [`0x1a44076050125825900e736c501f859c50fE728c`](https://etherscan.io/address/0x1a44076050125825900e736c501f859c50fE728c) (Endpoint V2 on Ethereum Mainnet from [the docs](https://docs.layerzero.network/v2/deployments/chains/ethereum))
- `address _oapp` being `SUSDS_OFT` from chainlog
- `address _lib` being [`0xbB2Ea70C9E858123480642Cf96acbcCE1372dCe1`](https://etherscan.io/address/0xbB2Ea70C9E858123480642Cf96acbcCE1372dCe1) (SendUln302 on Ethereum Mainnet from [the docs](https://docs.layerzero.network/v2/deployments/chains/ethereum))
- `SetConfigParam[] _params` being an array with two items:
    - First item: Executor parameters
        - `uint32 eid` being `<Destination EID>` (`<Destination Chain Mainnet>` Eid [from the docs](<Destination LayerZero Chain Docs URL>))
        - `uint32 configType` being `1` (Executor type from [the source](https://etherscan.io/address/0xbB2Ea70C9E858123480642Cf96acbcCE1372dCe1#code#F1#L16))
        - `bytes config` being encoded [ExecutorConfig](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/messagelib/contracts/SendLibBase.sol#L23-L26) with:
            - `maxMessageSize` being `10_000` (from the [docs](https://docs.layerzero.network/v2/developers/evm/protocol-contracts-overview#max-message-bytes-size))
            - `executor` being [`0x173272739Bd7Aa6e4e214714048a9fE699453059`](https://etherscan.io/address/0x173272739Bd7Aa6e4e214714048a9fE699453059)  (Executor on Ethereum Mainnet from [the docs](https://docs.layerzero.network/v2/deployments/chains/ethereum))
    - Second item: ULN parameters
        - `uint32 eid` being `<Destination EID>` (`<Destination Chain Mainnet>` Eid [from the docs](<Destination LayerZero Chain Docs URL>))
        - `uint32 configType` being `2` (ULN type from [the source](https://etherscan.io/address/0xbB2Ea70C9E858123480642Cf96acbcCE1372dCe1#code#F1#L17))
        - `bytes config` being encoded [UlnConfig](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/messagelib/contracts/uln/UlnBase.sol#L8-L16) with: (**Confirmed by LayerZero**)
            - `uint64 confirmations` being `15` (default configuration from [the docs](<Ethereum-to-Destination defaults URL>))
            - `uint8 requiredDVNCount` being `2`
            - `uint8 optionalDVNCount` being `0`
            - `uint8 optionalDVNThreshold` being `0`
            - `address[] requiredDVNs` being an array with `2` addresses:
                - `0x589dEDbD617e0CBcB916A9223F4d1300c294236b` (LayerZero Labs)
                - `0xa59BA433ac34D2927232918Ef5B2eaAfcF130BA5` (Nethermind)
            - `address[] optionalDVNs` being an array with `0` addresses

#### Configure OFT ReceiveLibrary for `<Destination Chain>` by calling [`EndpointV2.setConfig`](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/protocol/contracts/MessageLibManager.sol#L307) with:

- `EndpointV2` being [`0x1a44076050125825900e736c501f859c50fE728c`](https://etherscan.io/address/0x1a44076050125825900e736c501f859c50fE728c) (Endpoint V2 on Ethereum Mainnet from [the docs](https://docs.layerzero.network/v2/deployments/chains/ethereum))
- `address _oapp` being `SUSDS_OFT` from chainlog
- `address _lib` being [`0xc02Ab410f0734EFa3F14628780e6e695156024C2`](https://etherscan.io/address/0xc02Ab410f0734EFa3F14628780e6e695156024C2) (ReceiveUln302 on Ethereum Mainnet from [the docs](https://docs.layerzero.network/v2/deployments/chains/ethereum))
- `SetConfigParam[] _params` being an array with one item:
    - `uint32 eid` being `<Destination EID>` (`<Destination Chain Mainnet>` Eid [from the docs](<Destination LayerZero Chain Docs URL>))
    - `uint32 configType` being `2` (ULN type from [the source](https://etherscan.io/address/0xbB2Ea70C9E858123480642Cf96acbcCE1372dCe1#code#F1#L17))
    - `bytes config` being encoded [UlnConfig](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/messagelib/contracts/uln/UlnBase.sol#L8-L16) with: (**Confirmed by LayerZero**)
        - `uint64 confirmations` being `12` (default configuration from [the docs](<Ethereum-to-Destination defaults URL>))
        - `uint8 requiredDVNCount` being `2`
        - `uint8 optionalDVNCount` being `0`
        - `uint8 optionalDVNThreshold` being `0`
        - `address[] requiredDVNs` being an array with `2` addresses:
            - `0x589dEDbD617e0CBcB916A9223F4d1300c294236b` (LayerZero Labs)
            - `0xa59BA433ac34D2927232918Ef5B2eaAfcF130BA5` (Nethermind)
        - `address[] optionalDVNs` being an array with `0` addresses

#### Set OFT enforced options for `<Destination Chain>` by calling [`SUSDS_OFT.setEnforcedOptions`](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/oapp/contracts/oapp/libs/OAppOptionsType3.sol#L28) with:

- `SUSDS_OFT` being the address from chainlog
- [`EnforcedOptionParam`](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/oapp/contracts/oapp/interfaces/IOAppOptionsType3.sol#L5-L12)`[] _enforcedOptions` being an array with `2` items: (**Confirmed by LayerZero**)
    - SendOption (generated with [OptionsBuilder.addExecutorLzReceiveOption](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/oapp/contracts/oapp/libs/OptionsBuilder.sol#L53), [source](https://docs.layerzero.network/v2/tools/sdks/options#generating-options))
        - `uint32 eid` being `<Destination EID>` (`<Destination Chain Mainnet>` Eid [from the docs](<Destination LayerZero Chain Docs URL>))
        - `uint16 msgType` being `1` (Meaning SEND, [source](https://etherscan.io/address/0x1e1d42781fc170ef9da004fb735f56f0276d01b8#readContract#F2))
        - `bytes options` being [encoded](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/oapp/contracts/oapp/libs/OptionsBuilder.sol#L55-L56):
            - `uint128 _gas` being `130_000` ([source](https://github.com/sky-ecosystem/sky-oapp-oft/blob/0baba10c77a5cdfcef8fe9611e38d4306ab827a7/oft.layerzero.mainnet.config.ts#L20))
            - `uint128 _value` being `0` ([source](https://github.com/sky-ecosystem/sky-oapp-oft/blob/0baba10c77a5cdfcef8fe9611e38d4306ab827a7/oft.layerzero.mainnet.config.ts#L21))
    - SendAndCallOption (generated with [OptionsBuilder.addExecutorLzReceiveOption](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/oapp/contracts/oapp/libs/OptionsBuilder.sol#L53), [source](https://docs.layerzero.network/v2/tools/sdks/options#generating-options))
        - `uint32 eid` being `<Destination EID>` (`<Destination Chain Mainnet>` Eid [from the docs](<Destination LayerZero Chain Docs URL>))
        - `uint16 msgType` being `2` (Meaning SEND_AND_CALL, [source](https://etherscan.io/address/0x1e1d42781fc170ef9da004fb735f56f0276d01b8#readContract#F3))
        - `bytes options` being [encoded](https://github.com/LayerZero-Labs/LayerZero-v2/blob/9c741e7f9790639537b1710a203bcdfd73b0b9ac/packages/layerzero-v2/evm/oapp/contracts/oapp/libs/OptionsBuilder.sol#L55-L56):
            - `uint128 _gas` being `130_000` ([source](https://github.com/sky-ecosystem/sky-oapp-oft/blob/0baba10c77a5cdfcef8fe9611e38d4306ab827a7/oft.layerzero.mainnet.config.ts#L20))
            - `uint128 _value` being `0` ([source](https://github.com/sky-ecosystem/sky-oapp-oft/blob/0baba10c77a5cdfcef8fe9611e38d4306ab827a7/oft.layerzero.mainnet.config.ts#L21))

### **7. Bump chainlog `PATCH` version for `<Destination Chain>` launch**
