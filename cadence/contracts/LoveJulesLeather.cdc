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

import NonFungibleToken from "../standard/NonFungibleToken.cdc"
import MetadataViews from 0xf8d6e0586b0a20c7
 
pub contract LoveJulesLeather {
  
  // -----------------------------------------------------------------------
  // LoveJulesLeather contract Events
  // -----------------------------------------------------------------------

  // Emited when the LoveJulesLeather contract is created
  pub event ContractInitialized()

  // Emmited when a user transfers a LoveJulesLeather NFT out of their collection
  pub event Withdraw(id: UInt64, from: Address?)

  // Emmited when a user recieves a LoveJuleLeather NFT into their collection
  pub event Deposit(id: UInt64, to: Address?)

  // Emmited when a LoveJulesLeather NFT is minted
  pub event Minted(id: UInt64)

  // Emmited when a LoveJulesLeather NFT is destroyed
  pub event NFTDestroyed(id: UInt64)

  // -----------------------------------------------------------------------
  // LoveJulesLeather Named Paths
  // -----------------------------------------------------------------------

  pub let CollectionStoragePath: StoragePath
  pub let CollectionPublicPath: PublicPath
  pub let AdminStoragePath: StoragePath
  pub let AdminPrivatePath: PrivatePath

  // -----------------------------------------------------------------------
  // LoveJulesLeather contract-level fields.
  // These contain actual values that are stored in the smart contract.
  // -----------------------------------------------------------------------

  // The total number of LoveJulesLeather NFTs that have been created
  // Because NFTs can be destroyed, it doesn't necessarily mean that this
  // reflects the total number of NFTs in existence, just the number that
  // have been minted to date. Also used as NFT IDs for minting.
  pub var totalSupply: UInt64

  // -----------------------------------------------------------------------
  // LoveJulesLeather contract-level Composite Type definitions
  // -----------------------------------------------------------------------
  // These are just *definitions* for Types that this contract
  // and other accounts can use. These definitions do not contain
  // actual stored values, but an instance (or object) of one of these Types
  // can be created by this contract that contains stored values.
  // -----------------------------------------------------------------------

  // The resource that represents the LoveJulesLeather NFTs
  //
  pub resource NFT: NonFungibleToken.INFT, MetadataViews.Resolver {
    pub let id: UInt64

    pub let name: String
    pub let description: String
    pub let image: String
    pub let external_url: String
    pub let serial_number: String

    pub var metadata: {String: String}

    pub fun getViews(): [Type] {
      return [
        Type<MetadataViews.Display>()
      ]
    }

    pub fun resolveView(_ view: Type): AnyStruct? {
      switch view {
        case Type<MetadataViews.Display>():
          return MetadataViews.Display(
            name: self.name,
            description: self.description,
            thumbnail: MetadataViews.HTTPFile(url: self.external_url)
          )
      }
      return nil 
    }

    init(_metadata: {String: String}) {
      self.id = LoveJulesLeather.totalSupply
      self.name = _metadata["name"]!
      self.description = _metadata["description"]!
      self.image = _metadata["image"]!
      self.external_url = _metadata["external_url"]!
      self.serial_number = _metadata["serial_number"]!
      self.metadata = _metadata

      LoveJulesLeather.totalSupply = LoveJulesLeather.totalSupply + 1

      emit Minted(id: self.id)

    }
  }

}