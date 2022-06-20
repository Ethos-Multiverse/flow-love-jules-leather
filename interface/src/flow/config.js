import { config } from "@onflow/fcl";

// Use environment variables for easy deployment across environments
config({
  "accessNode.api": "https://rest-testnet.onflow.org",
  "discovery.wallet": "https://fcl-discovery.onflow.org/testnet/authn",
  "0xLoveJulesLeatherV1": "0xd8144e7c81e68eb9", 
  "0xLoveJulesLeather": "0x3593499e2fbd34e3"
})
