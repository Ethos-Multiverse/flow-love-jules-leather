import LoveJulesLeather from 0x6a8a6bd12143eaa5
import NonFungibleToken from 0x1d7e57aa55817448

transaction {

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
    self.adminCheck.batchMintLoveJulesLeatherNFT(recipient: self.receiver, metadataArray: [{
      "description": "12 years later... we found ourselves at a crossroads. To mark and celebrate the next chapter, we released our very first limited run NFT.  The 50 folks who chose to support us through this foundational project shall forever have first dibs on each and every limited run release, as well as a lifetime 10% discunt on all future purchases. Family. First. Forever.",
      "external_url": "https://ipfs.ethosnft.com/lovejules/2010-nfth-50-00.png",
      "image": "https://ipfs.io/ipfs/Qmbg1bK97TtVEFCWQxwS1wS6RufCWdNjSi2T84uCV4dgZB/2010-nfth-50-00.png",
      "name": "Love Jules Leather: 2010 NON FUNGIBLE TIGER HEAD",
      "serial_number": "2010.NFTH.50.00"
    }, {
      "description": "12 years later... we found ourselves at a crossroads. To mark and celebrate the next chapter, we released our very first limited run NFT.  The 50 folks who chose to support us through this foundational project shall forever have first dibs on each and every limited run release, as well as a lifetime 10% discunt on all future purchases. Family. First. Forever.",
      "name": "Love Jules Leather: 2010 NON FUNGIBLE TIGER HEAD",
      "external_url": "https://ipfs.ethosnft.com/lovejules/2010-nfth-50-01.png",
      "image": "https://ipfs.io/ipfs/Qmbg1bK97TtVEFCWQxwS1wS6RufCWdNjSi2T84uCV4dgZB/2010-nfth-50-01.png",
      "serial_number": "2010.NFTH.50.01"
    }, {
      "description": "12 years later... we found ourselves at a crossroads. To mark and celebrate the next chapter, we released our very first limited run NFT.  The 50 folks who chose to support us through this foundational project shall forever have first dibs on each and every limited run release, as well as a lifetime 10% discunt on all future purchases. Family. First. Forever.",
      "name": "Love Jules Leather: 2010 NON FUNGIBLE TIGER HEAD",
      "external_url": "https://ipfs.ethosnft.com/lovejules/2010-nfth-50-02.png",
      "image": "https://ipfs.io/ipfs/Qmbg1bK97TtVEFCWQxwS1wS6RufCWdNjSi2T84uCV4dgZB/2010-nfth-50-02.png",
      "serial_number": "2010.NFTH.50.02"
    }, {
      "description": "12 years later... we found ourselves at a crossroads. To mark and celebrate the next chapter, we released our very first limited run NFT.  The 50 folks who chose to support us through this foundational project shall forever have first dibs on each and every limited run release, as well as a lifetime 10% discunt on all future purchases. Family. First. Forever.",
      "name": "Love Jules Leather: 2010 NON FUNGIBLE TIGER HEAD",
      "external_url": "https://ipfs.ethosnft.com/lovejules/2010-nfth-50-03.png",
      "image": "https://ipfs.io/ipfs/Qmbg1bK97TtVEFCWQxwS1wS6RufCWdNjSi2T84uCV4dgZB/2010-nfth-50-03.png",
      "serial_number": "2010.NFTH.50.03"
    }, {
      "description": "12 years later... we found ourselves at a crossroads. To mark and celebrate the next chapter, we released our very first limited run NFT.  The 50 folks who chose to support us through this foundational project shall forever have first dibs on each and every limited run release, as well as a lifetime 10% discunt on all future purchases. Family. First. Forever.",
      "name": "Love Jules Leather: 2010 NON FUNGIBLE TIGER HEAD",
      "external_url": "https://ipfs.ethosnft.com/lovejules/2010-nfth-50-04.png",
      "image": "https://ipfs.io/ipfs/Qmbg1bK97TtVEFCWQxwS1wS6RufCWdNjSi2T84uCV4dgZB/2010-nfth-50-04.png",
      "serial_number": "2010.NFTH.50.04"
    }, {
      "description": "12 years later... we found ourselves at a crossroads. To mark and celebrate the next chapter, we released our very first limited run NFT.  The 50 folks who chose to support us through this foundational project shall forever have first dibs on each and every limited run release, as well as a lifetime 10% discunt on all future purchases. Family. First. Forever.",
      "name": "Love Jules Leather: 2010 NON FUNGIBLE TIGER HEAD",
      "external_url": "https://ipfs.ethosnft.com/lovejules/2010-nfth-50-05.png",
      "image": "https://ipfs.io/ipfs/Qmbg1bK97TtVEFCWQxwS1wS6RufCWdNjSi2T84uCV4dgZB/2010-nfth-50-05.png",
      "serial_number": "2010.NFTH.50.05"
    }, {
      "description": "12 years later... we found ourselves at a crossroads. To mark and celebrate the next chapter, we released our very first limited run NFT.  The 50 folks who chose to support us through this foundational project shall forever have first dibs on each and every limited run release, as well as a lifetime 10% discunt on all future purchases. Family. First. Forever.",
      "name": "Love Jules Leather: 2010 NON FUNGIBLE TIGER HEAD",
      "external_url": "https://ipfs.ethosnft.com/lovejules/2010-nfth-50-06.png",
      "image": "https://ipfs.io/ipfs/Qmbg1bK97TtVEFCWQxwS1wS6RufCWdNjSi2T84uCV4dgZB/2010-nfth-50-06.png",
      "serial_number": "2010.NFTH.50.06"
    }, {
      "description": "12 years later... we found ourselves at a crossroads. To mark and celebrate the next chapter, we released our very first limited run NFT.  The 50 folks who chose to support us through this foundational project shall forever have first dibs on each and every limited run release, as well as a lifetime 10% discunt on all future purchases. Family. First. Forever.",
      "name": "Love Jules Leather: 2010 NON FUNGIBLE TIGER HEAD",
      "external_url": "https://ipfs.ethosnft.com/lovejules/2010-nfth-50-07.png",
      "image": "https://ipfs.io/ipfs/Qmbg1bK97TtVEFCWQxwS1wS6RufCWdNjSi2T84uCV4dgZB/2010-nfth-50-07.png",
      "serial_number": "2010.NFTH.50.07"
    }, {
      "description": "12 years later... we found ourselves at a crossroads. To mark and celebrate the next chapter, we released our very first limited run NFT.  The 50 folks who chose to support us through this foundational project shall forever have first dibs on each and every limited run release, as well as a lifetime 10% discunt on all future purchases. Family. First. Forever.",
      "name": "Love Jules Leather: 2010 NON FUNGIBLE TIGER HEAD",
      "external_url": "https://ipfs.ethosnft.com/lovejules/2010-nfth-50-08.png",
      "image": "https://ipfs.io/ipfs/Qmbg1bK97TtVEFCWQxwS1wS6RufCWdNjSi2T84uCV4dgZB/2010-nfth-50-08.png",
      "serial_number": "2010.NFTH.50.08"
    }, {
      "description": "12 years later... we found ourselves at a crossroads. To mark and celebrate the next chapter, we released our very first limited run NFT.  The 50 folks who chose to support us through this foundational project shall forever have first dibs on each and every limited run release, as well as a lifetime 10% discunt on all future purchases. Family. First. Forever.",
      "name": "Love Jules Leather: 2010 NON FUNGIBLE TIGER HEAD",
      "external_url": "https://ipfs.ethosnft.com/lovejules/2010-nfth-50-09.png",
      "image": "https://ipfs.io/ipfs/Qmbg1bK97TtVEFCWQxwS1wS6RufCWdNjSi2T84uCV4dgZB/2010-nfth-50-09.png",
      "serial_number": "2010.NFTH.50.09"
    }, {
      "description": "12 years later... we found ourselves at a crossroads. To mark and celebrate the next chapter, we released our very first limited run NFT.  The 50 folks who chose to support us through this foundational project shall forever have first dibs on each and every limited run release, as well as a lifetime 10% discunt on all future purchases. Family. First. Forever.",
      "name": "Love Jules Leather: 2010 NON FUNGIBLE TIGER HEAD",
      "external_url": "https://ipfs.ethosnft.com/lovejules/2010-nfth-50-10.png",
      "image": "https://ipfs.io/ipfs/Qmbg1bK97TtVEFCWQxwS1wS6RufCWdNjSi2T84uCV4dgZB/2010-nfth-50-10.png",
      "serial_number": "2010.NFTH.50.10"
    }, {
      "description": "12 years later... we found ourselves at a crossroads. To mark and celebrate the next chapter, we released our very first limited run NFT.  The 50 folks who chose to support us through this foundational project shall forever have first dibs on each and every limited run release, as well as a lifetime 10% discunt on all future purchases. Family. First. Forever.",
      "name": "Love Jules Leather: 2010 NON FUNGIBLE TIGER HEAD",
      "external_url": "https://ipfs.ethosnft.com/lovejules/2010-nfth-50-11.png",
      "image": "https://ipfs.io/ipfs/Qmbg1bK97TtVEFCWQxwS1wS6RufCWdNjSi2T84uCV4dgZB/2010-nfth-50-11.png",
      "serial_number": "2010.NFTH.50.11"
    }, {
      "description": "12 years later... we found ourselves at a crossroads. To mark and celebrate the next chapter, we released our very first limited run NFT.  The 50 folks who chose to support us through this foundational project shall forever have first dibs on each and every limited run release, as well as a lifetime 10% discunt on all future purchases. Family. First. Forever.",
      "name": "Love Jules Leather: 2010 NON FUNGIBLE TIGER HEAD",
      "external_url": "https://ipfs.ethosnft.com/lovejules/2010-nfth-50-12.png",
      "image": "https://ipfs.io/ipfs/Qmbg1bK97TtVEFCWQxwS1wS6RufCWdNjSi2T84uCV4dgZB/2010-nfth-50-12.png",
      "serial_number": "2010.NFTH.50.12"
    }, {
      "description": "12 years later... we found ourselves at a crossroads. To mark and celebrate the next chapter, we released our very first limited run NFT.  The 50 folks who chose to support us through this foundational project shall forever have first dibs on each and every limited run release, as well as a lifetime 10% discunt on all future purchases. Family. First. Forever.",
      "name": "Love Jules Leather: 2010 NON FUNGIBLE TIGER HEAD",
      "external_url": "https://ipfs.ethosnft.com/lovejules/2010-nfth-50-13.png",
      "image": "https://ipfs.io/ipfs/Qmbg1bK97TtVEFCWQxwS1wS6RufCWdNjSi2T84uCV4dgZB/2010-nfth-50-13.png",
      "serial_number": "2010.NFTH.50.13"
    }, {
      "description": "12 years later... we found ourselves at a crossroads. To mark and celebrate the next chapter, we released our very first limited run NFT.  The 50 folks who chose to support us through this foundational project shall forever have first dibs on each and every limited run release, as well as a lifetime 10% discunt on all future purchases. Family. First. Forever.",
      "name": "Love Jules Leather: 2010 NON FUNGIBLE TIGER HEAD",
      "external_url": "https://ipfs.ethosnft.com/lovejules/2010-nfth-50-14.png",
      "image": "https://ipfs.io/ipfs/Qmbg1bK97TtVEFCWQxwS1wS6RufCWdNjSi2T84uCV4dgZB/2010-nfth-50-14.png",
      "serial_number": "2010.NFTH.50.14"
    }, {
      "description": "12 years later... we found ourselves at a crossroads. To mark and celebrate the next chapter, we released our very first limited run NFT.  The 50 folks who chose to support us through this foundational project shall forever have first dibs on each and every limited run release, as well as a lifetime 10% discunt on all future purchases. Family. First. Forever.",
      "name": "Love Jules Leather: 2010 NON FUNGIBLE TIGER HEAD",
      "external_url": "https://ipfs.ethosnft.com/lovejules/2010-nfth-50-15.png",
      "image": "https://ipfs.io/ipfs/Qmbg1bK97TtVEFCWQxwS1wS6RufCWdNjSi2T84uCV4dgZB/2010-nfth-50-15.png",
      "serial_number": "2010.NFTH.50.15"
    }, {
      "description": "12 years later... we found ourselves at a crossroads. To mark and celebrate the next chapter, we released our very first limited run NFT.  The 50 folks who chose to support us through this foundational project shall forever have first dibs on each and every limited run release, as well as a lifetime 10% discunt on all future purchases. Family. First. Forever.",
      "name": "Love Jules Leather: 2010 NON FUNGIBLE TIGER HEAD",
      "external_url": "https://ipfs.ethosnft.com/lovejules/2010-nfth-50-16.png",
      "image": "https://ipfs.io/ipfs/Qmbg1bK97TtVEFCWQxwS1wS6RufCWdNjSi2T84uCV4dgZB/2010-nfth-50-16.png",
      "serial_number": "2010.NFTH.50.16"
    }, {
      "description": "12 years later... we found ourselves at a crossroads. To mark and celebrate the next chapter, we released our very first limited run NFT.  The 50 folks who chose to support us through this foundational project shall forever have first dibs on each and every limited run release, as well as a lifetime 10% discunt on all future purchases. Family. First. Forever.",
      "name": "Love Jules Leather: 2010 NON FUNGIBLE TIGER HEAD",
      "external_url": "https://ipfs.ethosnft.com/lovejules/2010-nfth-50-17.png",
      "image": "https://ipfs.io/ipfs/Qmbg1bK97TtVEFCWQxwS1wS6RufCWdNjSi2T84uCV4dgZB/2010-nfth-50-17.png",
      "serial_number": "2010.NFTH.50.17"
    }, {
      "description": "12 years later... we found ourselves at a crossroads. To mark and celebrate the next chapter, we released our very first limited run NFT.  The 50 folks who chose to support us through this foundational project shall forever have first dibs on each and every limited run release, as well as a lifetime 10% discunt on all future purchases. Family. First. Forever.",
      "name": "Love Jules Leather: 2010 NON FUNGIBLE TIGER HEAD",
      "external_url": "https://ipfs.ethosnft.com/lovejules/2010-nfth-50-18.png",
      "image": "https://ipfs.io/ipfs/Qmbg1bK97TtVEFCWQxwS1wS6RufCWdNjSi2T84uCV4dgZB/2010-nfth-50-18.png",
      "serial_number": "2010.NFTH.50.18"
    }, {
      "description": "12 years later... we found ourselves at a crossroads. To mark and celebrate the next chapter, we released our very first limited run NFT.  The 50 folks who chose to support us through this foundational project shall forever have first dibs on each and every limited run release, as well as a lifetime 10% discunt on all future purchases. Family. First. Forever.",
      "name": "Love Jules Leather: 2010 NON FUNGIBLE TIGER HEAD",
      "external_url": "https://ipfs.ethosnft.com/lovejules/2010-nfth-50-19.png",
      "image": "https://ipfs.io/ipfs/Qmbg1bK97TtVEFCWQxwS1wS6RufCWdNjSi2T84uCV4dgZB/2010-nfth-50-19.png",
      "serial_number": "2010.NFTH.50.19"
    }, {
      "description": "12 years later... we found ourselves at a crossroads. To mark and celebrate the next chapter, we released our very first limited run NFT.  The 50 folks who chose to support us through this foundational project shall forever have first dibs on each and every limited run release, as well as a lifetime 10% discunt on all future purchases. Family. First. Forever.",
      "name": "Love Jules Leather: 2010 NON FUNGIBLE TIGER HEAD",
      "external_url": "https://ipfs.ethosnft.com/lovejules/2010-nfth-50-20.png",
      "image": "https://ipfs.io/ipfs/Qmbg1bK97TtVEFCWQxwS1wS6RufCWdNjSi2T84uCV4dgZB/2010-nfth-50-20.png",
      "serial_number": "2010.NFTH.50.20"
    }, {
      "description": "12 years later... we found ourselves at a crossroads. To mark and celebrate the next chapter, we released our very first limited run NFT.  The 50 folks who chose to support us through this foundational project shall forever have first dibs on each and every limited run release, as well as a lifetime 10% discunt on all future purchases. Family. First. Forever.",
      "name": "Love Jules Leather: 2010 NON FUNGIBLE TIGER HEAD",
      "external_url": "https://ipfs.ethosnft.com/lovejules/2010-nfth-50-21.png",
      "image": "https://ipfs.io/ipfs/Qmbg1bK97TtVEFCWQxwS1wS6RufCWdNjSi2T84uCV4dgZB/2010-nfth-50-21.png",
      "serial_number": "2010.NFTH.50.21"
    }, {
      "description": "12 years later... we found ourselves at a crossroads. To mark and celebrate the next chapter, we released our very first limited run NFT.  The 50 folks who chose to support us through this foundational project shall forever have first dibs on each and every limited run release, as well as a lifetime 10% discunt on all future purchases. Family. First. Forever.",
      "name": "Love Jules Leather: 2010 NON FUNGIBLE TIGER HEAD",
      "external_url": "https://ipfs.ethosnft.com/lovejules/2010-nfth-50-22.png",
      "image": "https://ipfs.io/ipfs/Qmbg1bK97TtVEFCWQxwS1wS6RufCWdNjSi2T84uCV4dgZB/2010-nfth-50-22.png",
      "serial_number": "2010.NFTH.50.22"
    }, {
      "description": "12 years later... we found ourselves at a crossroads. To mark and celebrate the next chapter, we released our very first limited run NFT.  The 50 folks who chose to support us through this foundational project shall forever have first dibs on each and every limited run release, as well as a lifetime 10% discunt on all future purchases. Family. First. Forever.",
      "name": "Love Jules Leather: 2010 NON FUNGIBLE TIGER HEAD",
      "external_url": "https://ipfs.ethosnft.com/lovejules/2010-nfth-50-23.png",
      "image": "https://ipfs.io/ipfs/Qmbg1bK97TtVEFCWQxwS1wS6RufCWdNjSi2T84uCV4dgZB/2010-nfth-50-23.png",
      "serial_number": "2010.NFTH.50.23"
    }, {
      "description": "12 years later... we found ourselves at a crossroads. To mark and celebrate the next chapter, we released our very first limited run NFT.  The 50 folks who chose to support us through this foundational project shall forever have first dibs on each and every limited run release, as well as a lifetime 10% discunt on all future purchases. Family. First. Forever.",
      "name": "Love Jules Leather: 2010 NON FUNGIBLE TIGER HEAD",
      "external_url": "https://ipfs.ethosnft.com/lovejules/2010-nfth-50-24.png",
      "image": "https://ipfs.io/ipfs/Qmbg1bK97TtVEFCWQxwS1wS6RufCWdNjSi2T84uCV4dgZB/2010-nfth-50-24.png",
      "serial_number": "2010.NFTH.50.24"
    }, {
      "description": "12 years later... we found ourselves at a crossroads. To mark and celebrate the next chapter, we released our very first limited run NFT.  The 50 folks who chose to support us through this foundational project shall forever have first dibs on each and every limited run release, as well as a lifetime 10% discunt on all future purchases. Family. First. Forever.",
      "name": "Love Jules Leather: 2010 NON FUNGIBLE TIGER HEAD",
      "external_url": "https://ipfs.ethosnft.com/lovejules/2010-nfth-50-25.png",
      "image": "https://ipfs.io/ipfs/Qmbg1bK97TtVEFCWQxwS1wS6RufCWdNjSi2T84uCV4dgZB/2010-nfth-50-25.png",
      "serial_number": "2010.NFTH.50.25"
    }, {
      "description": "12 years later... we found ourselves at a crossroads. To mark and celebrate the next chapter, we released our very first limited run NFT.  The 50 folks who chose to support us through this foundational project shall forever have first dibs on each and every limited run release, as well as a lifetime 10% discunt on all future purchases. Family. First. Forever.",
      "name": "Love Jules Leather: 2010 NON FUNGIBLE TIGER HEAD",
      "external_url": "https://ipfs.ethosnft.com/lovejules/2010-nfth-50-26.png",
      "image": "https://ipfs.io/ipfs/Qmbg1bK97TtVEFCWQxwS1wS6RufCWdNjSi2T84uCV4dgZB/2010-nfth-50-26.png",
      "serial_number": "2010.NFTH.50.26"
    }, {
      "description": "12 years later... we found ourselves at a crossroads. To mark and celebrate the next chapter, we released our very first limited run NFT.  The 50 folks who chose to support us through this foundational project shall forever have first dibs on each and every limited run release, as well as a lifetime 10% discunt on all future purchases. Family. First. Forever.",
      "name": "Love Jules Leather: 2010 NON FUNGIBLE TIGER HEAD",
      "external_url": "https://ipfs.ethosnft.com/lovejules/2010-nfth-50-27.png",
      "image": "https://ipfs.io/ipfs/Qmbg1bK97TtVEFCWQxwS1wS6RufCWdNjSi2T84uCV4dgZB/2010-nfth-50-27.png",
      "serial_number": "2010.NFTH.50.27"
    }, {
      "description": "12 years later... we found ourselves at a crossroads. To mark and celebrate the next chapter, we released our very first limited run NFT.  The 50 folks who chose to support us through this foundational project shall forever have first dibs on each and every limited run release, as well as a lifetime 10% discunt on all future purchases. Family. First. Forever.",
      "name": "Love Jules Leather: 2010 NON FUNGIBLE TIGER HEAD",
      "external_url": "https://ipfs.ethosnft.com/lovejules/2010-nfth-50-28.png",
      "image": "https://ipfs.io/ipfs/Qmbg1bK97TtVEFCWQxwS1wS6RufCWdNjSi2T84uCV4dgZB/2010-nfth-50-28.png",
      "serial_number": "2010.NFTH.50.28"
    }, {
      "description": "12 years later... we found ourselves at a crossroads. To mark and celebrate the next chapter, we released our very first limited run NFT.  The 50 folks who chose to support us through this foundational project shall forever have first dibs on each and every limited run release, as well as a lifetime 10% discunt on all future purchases. Family. First. Forever.",
      "name": "Love Jules Leather: 2010 NON FUNGIBLE TIGER HEAD",
      "external_url": "https://ipfs.ethosnft.com/lovejules/2010-nfth-50-29.png",
      "image": "https://ipfs.io/ipfs/Qmbg1bK97TtVEFCWQxwS1wS6RufCWdNjSi2T84uCV4dgZB/2010-nfth-50-29.png",
      "serial_number": "2010.NFTH.50.29"
    }, {
      "description": "12 years later... we found ourselves at a crossroads. To mark and celebrate the next chapter, we released our very first limited run NFT.  The 50 folks who chose to support us through this foundational project shall forever have first dibs on each and every limited run release, as well as a lifetime 10% discunt on all future purchases. Family. First. Forever.",
      "name": "Love Jules Leather: 2010 NON FUNGIBLE TIGER HEAD",
      "external_url": "https://ipfs.ethosnft.com/lovejules/2010-nfth-50-30.png",
      "image": "https://ipfs.io/ipfs/Qmbg1bK97TtVEFCWQxwS1wS6RufCWdNjSi2T84uCV4dgZB/2010-nfth-50-30.png",
      "serial_number": "2010.NFTH.50.30"
    }, {
      "description": "12 years later... we found ourselves at a crossroads. To mark and celebrate the next chapter, we released our very first limited run NFT.  The 50 folks who chose to support us through this foundational project shall forever have first dibs on each and every limited run release, as well as a lifetime 10% discunt on all future purchases. Family. First. Forever.",
      "name": "Love Jules Leather: 2010 NON FUNGIBLE TIGER HEAD",
      "external_url": "https://ipfs.ethosnft.com/lovejules/2010-nfth-50-31.png",
      "image": "https://ipfs.io/ipfs/Qmbg1bK97TtVEFCWQxwS1wS6RufCWdNjSi2T84uCV4dgZB/2010-nfth-50-31.png",
      "serial_number": "2010.NFTH.50.31"
    }, {
      "description": "12 years later... we found ourselves at a crossroads. To mark and celebrate the next chapter, we released our very first limited run NFT.  The 50 folks who chose to support us through this foundational project shall forever have first dibs on each and every limited run release, as well as a lifetime 10% discunt on all future purchases. Family. First. Forever.",
      "name": "Love Jules Leather: 2010 NON FUNGIBLE TIGER HEAD",
      "external_url": "https://ipfs.ethosnft.com/lovejules/2010-nfth-50-32.png",
      "image": "https://ipfs.io/ipfs/Qmbg1bK97TtVEFCWQxwS1wS6RufCWdNjSi2T84uCV4dgZB/2010-nfth-50-32.png",
      "serial_number": "2010.NFTH.50.32"
    }, {
      "description": "12 years later... we found ourselves at a crossroads. To mark and celebrate the next chapter, we released our very first limited run NFT.  The 50 folks who chose to support us through this foundational project shall forever have first dibs on each and every limited run release, as well as a lifetime 10% discunt on all future purchases. Family. First. Forever.",
      "name": "Love Jules Leather: 2010 NON FUNGIBLE TIGER HEAD",
      "external_url": "https://ipfs.ethosnft.com/lovejules/2010-nfth-50-33.png",
      "image": "https://ipfs.io/ipfs/Qmbg1bK97TtVEFCWQxwS1wS6RufCWdNjSi2T84uCV4dgZB/2010-nfth-50-33.png",
      "serial_number": "2010.NFTH.50.33"
    }, {
      "description": "12 years later... we found ourselves at a crossroads. To mark and celebrate the next chapter, we released our very first limited run NFT.  The 50 folks who chose to support us through this foundational project shall forever have first dibs on each and every limited run release, as well as a lifetime 10% discunt on all future purchases. Family. First. Forever.",
      "name": "Love Jules Leather: 2010 NON FUNGIBLE TIGER HEAD",
      "external_url": "https://ipfs.ethosnft.com/lovejules/2010-nfth-50-34.png",
      "image": "https://ipfs.io/ipfs/Qmbg1bK97TtVEFCWQxwS1wS6RufCWdNjSi2T84uCV4dgZB/2010-nfth-50-34.png",
      "serial_number": "2010.NFTH.50.34"
    }, {
      "description": "12 years later... we found ourselves at a crossroads. To mark and celebrate the next chapter, we released our very first limited run NFT.  The 50 folks who chose to support us through this foundational project shall forever have first dibs on each and every limited run release, as well as a lifetime 10% discunt on all future purchases. Family. First. Forever.",
      "name": "Love Jules Leather: 2010 NON FUNGIBLE TIGER HEAD",
      "external_url": "https://ipfs.ethosnft.com/lovejules/2010-nfth-50-35.png",
      "image": "https://ipfs.io/ipfs/Qmbg1bK97TtVEFCWQxwS1wS6RufCWdNjSi2T84uCV4dgZB/2010-nfth-50-35.png",
      "serial_number": "2010.NFTH.50.35"
    }, {
      "description": "12 years later... we found ourselves at a crossroads. To mark and celebrate the next chapter, we released our very first limited run NFT.  The 50 folks who chose to support us through this foundational project shall forever have first dibs on each and every limited run release, as well as a lifetime 10% discunt on all future purchases. Family. First. Forever.",
      "name": "Love Jules Leather: 2010 NON FUNGIBLE TIGER HEAD",
      "external_url": "https://ipfs.ethosnft.com/lovejules/2010-nfth-50-36.png",
      "image": "https://ipfs.io/ipfs/Qmbg1bK97TtVEFCWQxwS1wS6RufCWdNjSi2T84uCV4dgZB/2010-nfth-50-36.png",
      "serial_number": "2010.NFTH.50.36"
    }, {
      "description": "12 years later... we found ourselves at a crossroads. To mark and celebrate the next chapter, we released our very first limited run NFT.  The 50 folks who chose to support us through this foundational project shall forever have first dibs on each and every limited run release, as well as a lifetime 10% discunt on all future purchases. Family. First. Forever.",
      "name": "Love Jules Leather: 2010 NON FUNGIBLE TIGER HEAD",
      "external_url": "https://ipfs.ethosnft.com/lovejules/2010-nfth-50-37.png",
      "image": "https://ipfs.io/ipfs/Qmbg1bK97TtVEFCWQxwS1wS6RufCWdNjSi2T84uCV4dgZB/2010-nfth-50-37.png",
      "serial_number": "2010.NFTH.50.37"
    }, {
      "description": "12 years later... we found ourselves at a crossroads. To mark and celebrate the next chapter, we released our very first limited run NFT.  The 50 folks who chose to support us through this foundational project shall forever have first dibs on each and every limited run release, as well as a lifetime 10% discunt on all future purchases. Family. First. Forever.",
      "name": "Love Jules Leather: 2010 NON FUNGIBLE TIGER HEAD",
      "external_url": "https://ipfs.ethosnft.com/lovejules/2010-nfth-50-38.png",
      "image": "https://ipfs.io/ipfs/Qmbg1bK97TtVEFCWQxwS1wS6RufCWdNjSi2T84uCV4dgZB/2010-nfth-50-38.png",
      "serial_number": "2010.NFTH.50.38"
    }, {
      "description": "12 years later... we found ourselves at a crossroads. To mark and celebrate the next chapter, we released our very first limited run NFT.  The 50 folks who chose to support us through this foundational project shall forever have first dibs on each and every limited run release, as well as a lifetime 10% discunt on all future purchases. Family. First. Forever.",
      "name": "Love Jules Leather: 2010 NON FUNGIBLE TIGER HEAD",
      "external_url": "https://ipfs.ethosnft.com/lovejules/2010-nfth-50-39.png",
      "image": "https://ipfs.io/ipfs/Qmbg1bK97TtVEFCWQxwS1wS6RufCWdNjSi2T84uCV4dgZB/2010-nfth-50-39.png",
      "serial_number": "2010.NFTH.50.39"
    }, {
      "description": "12 years later... we found ourselves at a crossroads. To mark and celebrate the next chapter, we released our very first limited run NFT.  The 50 folks who chose to support us through this foundational project shall forever have first dibs on each and every limited run release, as well as a lifetime 10% discunt on all future purchases. Family. First. Forever.",
      "name": "Love Jules Leather: 2010 NON FUNGIBLE TIGER HEAD",
      "external_url": "https://ipfs.ethosnft.com/lovejules/2010-nfth-50-40.png",
      "image": "https://ipfs.io/ipfs/Qmbg1bK97TtVEFCWQxwS1wS6RufCWdNjSi2T84uCV4dgZB/2010-nfth-50-40.png",
      "serial_number": "2010.NFTH.50.40"
    }, {
      "description": "12 years later... we found ourselves at a crossroads. To mark and celebrate the next chapter, we released our very first limited run NFT.  The 50 folks who chose to support us through this foundational project shall forever have first dibs on each and every limited run release, as well as a lifetime 10% discunt on all future purchases. Family. First. Forever.",
      "name": "Love Jules Leather: 2010 NON FUNGIBLE TIGER HEAD",
      "external_url": "https://ipfs.ethosnft.com/lovejules/2010-nfth-50-41.png",
      "image": "https://ipfs.io/ipfs/Qmbg1bK97TtVEFCWQxwS1wS6RufCWdNjSi2T84uCV4dgZB/2010-nfth-50-41.png",
      "serial_number": "2010.NFTH.50.41"
    }, {
      "description": "12 years later... we found ourselves at a crossroads. To mark and celebrate the next chapter, we released our very first limited run NFT.  The 50 folks who chose to support us through this foundational project shall forever have first dibs on each and every limited run release, as well as a lifetime 10% discunt on all future purchases. Family. First. Forever.",
      "name": "Love Jules Leather: 2010 NON FUNGIBLE TIGER HEAD",
      "external_url": "https://ipfs.ethosnft.com/lovejules/2010-nfth-50-42.png",
      "image": "https://ipfs.io/ipfs/Qmbg1bK97TtVEFCWQxwS1wS6RufCWdNjSi2T84uCV4dgZB/2010-nfth-50-42.png",
      "serial_number": "2010.NFTH.50.42"
    }, {
      "description": "12 years later... we found ourselves at a crossroads. To mark and celebrate the next chapter, we released our very first limited run NFT.  The 50 folks who chose to support us through this foundational project shall forever have first dibs on each and every limited run release, as well as a lifetime 10% discunt on all future purchases. Family. First. Forever.",
      "name": "Love Jules Leather: 2010 NON FUNGIBLE TIGER HEAD",
      "external_url": "https://ipfs.ethosnft.com/lovejules/2010-nfth-50-43.png",
      "image": "https://ipfs.io/ipfs/Qmbg1bK97TtVEFCWQxwS1wS6RufCWdNjSi2T84uCV4dgZB/2010-nfth-50-43.png",
      "serial_number": "2010.NFTH.50.43"
    }, {
      "description": "12 years later... we found ourselves at a crossroads. To mark and celebrate the next chapter, we released our very first limited run NFT.  The 50 folks who chose to support us through this foundational project shall forever have first dibs on each and every limited run release, as well as a lifetime 10% discunt on all future purchases. Family. First. Forever.",
      "name": "Love Jules Leather: 2010 NON FUNGIBLE TIGER HEAD",
      "external_url": "https://ipfs.ethosnft.com/lovejules/2010-nfth-50-44.png",
      "image": "https://ipfs.io/ipfs/Qmbg1bK97TtVEFCWQxwS1wS6RufCWdNjSi2T84uCV4dgZB/2010-nfth-50-44.png",
      "serial_number": "2010.NFTH.50.44"
    }, {
      "description": "12 years later... we found ourselves at a crossroads. To mark and celebrate the next chapter, we released our very first limited run NFT.  The 50 folks who chose to support us through this foundational project shall forever have first dibs on each and every limited run release, as well as a lifetime 10% discunt on all future purchases. Family. First. Forever.",
      "name": "Love Jules Leather: 2010 NON FUNGIBLE TIGER HEAD",
      "external_url": "https://ipfs.ethosnft.com/lovejules/2010-nfth-50-45.png",
      "image": "https://ipfs.io/ipfs/Qmbg1bK97TtVEFCWQxwS1wS6RufCWdNjSi2T84uCV4dgZB/2010-nfth-50-45.png",
      "serial_number": "2010.NFTH.50.45"
    }, {
      "description": "12 years later... we found ourselves at a crossroads. To mark and celebrate the next chapter, we released our very first limited run NFT.  The 50 folks who chose to support us through this foundational project shall forever have first dibs on each and every limited run release, as well as a lifetime 10% discunt on all future purchases. Family. First. Forever.",
      "name": "Love Jules Leather: 2010 NON FUNGIBLE TIGER HEAD",
      "external_url": "https://ipfs.ethosnft.com/lovejules/2010-nfth-50-46.png",
      "image": "https://ipfs.io/ipfs/Qmbg1bK97TtVEFCWQxwS1wS6RufCWdNjSi2T84uCV4dgZB/2010-nfth-50-46.png",
      "serial_number": "2010.NFTH.50.46"
    }, {
      "description": "12 years later... we found ourselves at a crossroads. To mark and celebrate the next chapter, we released our very first limited run NFT.  The 50 folks who chose to support us through this foundational project shall forever have first dibs on each and every limited run release, as well as a lifetime 10% discunt on all future purchases. Family. First. Forever.",
      "name": "Love Jules Leather: 2010 NON FUNGIBLE TIGER HEAD",
      "external_url": "https://ipfs.ethosnft.com/lovejules/2010-nfth-50-47.png",
      "image": "https://ipfs.io/ipfs/Qmbg1bK97TtVEFCWQxwS1wS6RufCWdNjSi2T84uCV4dgZB/2010-nfth-50-47.png",
      "serial_number": "2010.NFTH.50.47"
    }, {
      "description": "12 years later... we found ourselves at a crossroads. To mark and celebrate the next chapter, we released our very first limited run NFT.  The 50 folks who chose to support us through this foundational project shall forever have first dibs on each and every limited run release, as well as a lifetime 10% discunt on all future purchases. Family. First. Forever.",
      "name": "Love Jules Leather: 2010 NON FUNGIBLE TIGER HEAD",
      "external_url": "https://ipfs.ethosnft.com/lovejules/2010-nfth-50-48.png",
      "image": "https://ipfs.io/ipfs/Qmbg1bK97TtVEFCWQxwS1wS6RufCWdNjSi2T84uCV4dgZB/2010-nfth-50-48.png",
      "serial_number": "2010.NFTH.50.48"
    }, {
      "description": "12 years later... we found ourselves at a crossroads. To mark and celebrate the next chapter, we released our very first limited run NFT.  The 50 folks who chose to support us through this foundational project shall forever have first dibs on each and every limited run release, as well as a lifetime 10% discunt on all future purchases. Family. First. Forever.",
      "name": "Love Jules Leather: 2010 NON FUNGIBLE TIGER HEAD",
      "external_url": "https://ipfs.ethosnft.com/lovejules/2010-nfth-50-49.png",
      "image": "https://ipfs.io/ipfs/Qmbg1bK97TtVEFCWQxwS1wS6RufCWdNjSi2T84uCV4dgZB/2010-nfth-50-49.png",
      "serial_number": "2010.NFTH.50.49"
    }, {
      "description": "12 years later... we found ourselves at a crossroads. To mark and celebrate the next chapter, we released our very first limited run NFT.  The 50 folks who chose to support us through this foundational project shall forever have first dibs on each and every limited run release, as well as a lifetime 10% discunt on all future purchases. Family. First. Forever.",
      "name": "Love Jules Leather: 2010 NON FUNGIBLE TIGER HEAD",
      "external_url": "https://ipfs.ethosnft.com/lovejules/2010-nfth-50-50.png",
      "image": "https://ipfs.io/ipfs/Qmbg1bK97TtVEFCWQxwS1wS6RufCWdNjSi2T84uCV4dgZB/2010-nfth-50-50.png",
      "serial_number": "2010.NFTH.50.50"
}])
    log("batch mint complete")
  }
}