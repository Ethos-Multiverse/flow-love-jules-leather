# LoveJulesLeather.cdc

## Introduction

Contract on the Flow blockchain that allows Admins to batch mint native NFTs(`LoveJulesLeather`).
Admins are granted power through the `Admin` resource.
Admins can withdraw NFTs that reside in the `LoveJulesLeatherCollection` resource to recipients

## Mainnet Contract

[Flowscan: LoveJulesLeather.cdc](https://flowscan.org/contract/A.6a8a6bd12143eaa5.LoveJulesLeather/overview)

## Live Project

https://lovejules.ethosnft.com/

## Video demo

N/A

## Roadmap

* ### V1:

	Restricted functions, resources, and capabilities.

	- [Admin] Mint native NFTs
	- [Admin] Batch mint native NFTs
	- [Admin] Send native NFT to recipients
	- [Admin] Destroy native NFT resource

## Metadata schema

```javascript
		{
			"description":"12 years from our inception, we find ourselves at a crossroads. To mark and celebrate this next chapter, we're releasing our very first limited run NFT (Non Fungible Token). The 50 folks who choose to support us through this foundational project will forever have first dibs on each and every limited run release, as well as a lifetime discount on all future purchases. Family. First. Forever.",
			"external_url":"https://ethos.customlink",
			"image":"https://ipfs.io/ipfs/QmSNpzoJsYaqGybdVKtRpynRaGGKJYkLYVXcBKyyApvbeN",
			"name":"Love Jules Leather: 2010 NON FUNGIBLE TIGER HEAD",
			"serial_number":"2010.NFTH.50.##"
		}
```

## IPFS Asset Directory

 [Love Jules Leather Tiger Heads](https://ipfs.io/ipfs/Qmbg1bK97TtVEFCWQxwS1wS6RufCWdNjSi2T84uCV4dgZB)

## Contract Description

```javascript
/*
		      Description: Central Smart Contract for Love Jules Leather
		      
		      This smart contract contains the core functionality for 
		      Love Jules Leather, created by Ethos Multiverse Inc.
		      
		      The contract manages the data associated with each NFT and 
		      the distribution of each NFT to recipients.
		      
		      Admins throught their admin resource object have the power 
		      to do all of the important actions in the smart contract such 
		      as minting and batch minting.
		      
		      When NFTs are minted, they are initialized with metadata and stored in the
		      admins Collection.
		      
		      The contract also defines a Collection resource. This is an object that 
		      every Love Jules Leather NFT owner will store in their account
		      to manage their NFT collection.
		      
		      The main Love Jules Leather account operated by Ethos Multiverse Inc. 
		      will also have its own Love Jules Leather collection it can use to hold its 
		      own NFT's that have not yet been sent to a user.
		      
		      Note: All state changing functions will panic if an invalid argument is
		      provided or one of its pre-conditions or post conditions aren't met.
		      Functions that don't modify state will simply return 0 or nil 
		      and those cases need to be handled by the caller.
		  */
```

## Sequence Diagram

### Transactions

**Admin**

* Admin sends tx to batch mint native NFT(`LoveJulesLeather`)

```mermaid
					  sequenceDiagram
					  participant L as LoveJulesLeather.cdc
					  actor A as AuthEthos
					  A->>L: batchMint tx args(arrayOfMetadataObjects)
					  L->>A: Receives batch of LoveJulesLeather NFTs into LoveJulesLeatherCollection
```

* Admin sends tx to withdraw NFT from storage and deposit it to claimer

```mermaid
					  sequenceDiagram
					  participant L as LoveJulesLeather.cdc
					  actor A as AuthEthos
					  actor U as User
					  A->>L: withdraw tx args(claimerWallet, nftId)
					  L->>U: Receives LoveJulesLeather NFT
```

* Admin sends tx to create a new Admin Resource

```mermaid
					  sequenceDiagram
					  participant L as LoveJulesLeather.cdc
					  actor A as AuthEthos
					  actor A2 as AuthEthos2
					  A->>L: createNewAdmin tx
					  L->>A2: Receives Admin resource
```

* [ ] Admin sends tx to destroy Admin resource

**User**

* User sends a tx requesting a `LoveJulesLeatherCollection` object

```mermaid
					  sequenceDiagram
					        participant L as LoveJulesLeather.cdc
					       actor A as AuthEthos
					       actor U as User
					       L->A: owner
					       U->>L: setupUser tx
					       L->>U: Receives LoveJulesLeatherCollection
```

~~User sends a tx requesting to claim their `LoveJulesLeather` NFT~~

```mermaid
					  sequenceDiagram
					        participant L as LoveJulesLeather.cdc
					       actor A as AuthEthos
					       actor U as User
					       L->A: owner
					       U->>L: claimNFT tx args(claimerWallet, nftId)
					       L->>U: Receives LoveJulesLeather NFT
```

	The Admin will take care of this sequence. User abstracted away from the process.

### Scripts

**Admin**

* Admin sends tx to borrow NFT by id
* Admin sends tx to borrow entire NFT

**User**

## Class Diagram

* `NFT` resource

	```mermaid
					classDiagram
					class NFT{
					+UInt64 id
					+Dictionary metadata
					~init(metadata: string)
					}
	```

* `CollectionPublic` resource interface

	```mermaid
					classDiagram
					class CollectionPublic{
					+Dictionary ownedNFTs
					+deposit(token: NFT)
					+getIDs()  Array UInt64
					+borrowNFT(id: UInt64): NonFungibleTokenNFT
					+borrowEntireNFT(id: UInt64) LoveJulesLeatherNFT
					}
	```

* `Collection` resource

	```mermaid
					classDiagram
					class Collection{
					+Dictionary ownedNFTs
					+withdraw(withdrwaID: UInt64) NFT
					+deposit(token: NFT)
					+getIDs() Array UInt64
					+borrowNFT(id: UInt64) NFT
					+borrowEntireNFT(id: UInt64) NFT
					-destroy()
					-init()
					}
	```

* `Admin` resource

	```mermaid
					classDiagram
					class Admin{
					+mintNFT(metadata: Array String)
					+batchMint(metadataArray: Objects Array)
					+createNewAdmin() Admin
					}
	```

## Technical

- Frontend
- Storage
- Smart Contract
