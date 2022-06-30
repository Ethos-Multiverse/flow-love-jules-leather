import LoveJulesLeather from "../../contracts/LoveJulesLeather.cdc";
import NonFungibleToken from "../../standard/NonFungibleToken.cdc";

transaction {
  prepare(acct: AuthAccount) {
   
        let collection <- LoveJulesLeather.createEmptyCollection()

        // store the empty NFT Collection in account storage
        acct.save<@NonFungibleToken.Collection>(<-collection, to: LoveJulesLeather.CollectionStoragePath)

        log("Collection created.")

        // create a public capability for the Collection
        acct.link<&LoveJulesLeather.Collection{NonFungibleToken.CollectionPublic, LoveJulesLeather.CollectionPublic}>(
            LoveJulesLeather.CollectionPublicPath,
            target: LoveJulesLeather.CollectionStoragePath
        )
        log("Capability created")
  }

  execute {
  }
}