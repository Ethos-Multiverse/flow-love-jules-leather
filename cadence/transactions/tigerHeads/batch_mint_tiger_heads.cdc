import LoveJulesLeather from "../../contracts/LoveJulesLeather.cdc";
import NonFungibleToken from "../../standard/NonFungibleToken.cdc";

transaction(metadata: [{String: String}]) {

let adminCheck: &LoveJulesLeather.Admin

let receiver: &{NonFungibleToken.CollectionPublic}

  prepare(acct: AuthAccount) {

    // if Admin account doesn't have a LJL collection
    if acct.borrow<&LoveJulesLeather.Collection>(from: LoveJulesLeather.CollectionStoragePath) == nil {

      log("Admin does not hold LJL collection")

      // create an empty collection 
      let collection <- LoveJulesLeather.createEmptyCollection()

      // store the empty NFt Collection in account storage
      acct.save<@NonFungibleToken.Collection>(<-collection, to: LoveJulesLeather.CollectionStoragePath)

      log("Collection created")

      // create a public capability for that Collection
      acct.link<&LoveJulesLeather.Collection{NonFungibleToken.CollectionPublic, LoveJulesLeather.CollectionPublic}>(
        LoveJulesLeather.CollectionPublicPath,
        target: LoveJulesLeather.CollectionStoragePath
      )
      log("Admin capability created")

    }

    self.adminCheck = acct.borrow<&LoveJulesLeather.Admin>(from: LoveJulesLeather.AdminStoragePath)
    ?? panic("could not borrow admin reference")

    self.receiver = acct.getCapability<&LoveJulesLeather.Collection{NonFungibleToken.CollectionPublic}>(LoveJulesLeather.CollectionPublicPath).borrow()
    ?? panic("could not borrow capability")

  }

  execute {
    self.adminCheck.batchMintLoveJulesLeatherNFT(recipient: self.receiver, metadataArray: metadata)
    log("Batch Mint Complete:")
    log(metadata.length)
  }
}