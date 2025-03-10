// SPDX-License-Identifier : MIT
pragma solidity ^0.8.20;

import { DevOpsTools } from "lib/foundry-devops/src/DevOpsTools.sol";
import {Script} from "forge-std/Script.sol";
import {BasicNFT} from "../src/BasicNFT.sol";

contract NftInteraction is Script {
string public constant Waga =
        "https://ipfs.io/ipfs/QmcTkpY3YZnWiaq9XABHnuapSDAXuY8wgkEkv1aZvNq3S8?filename=photo_2025-02-12_11-53-27.jpg";
    function run() public {
       address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("BasicNFT",block.chainid);
        mintNFtContract(mostRecentlyDeployed);
    }

    function mintNFtContract(address contractAddress) public {
      vm.startBroadcast();
      BasicNFT(contractAddress).mintNFT(Waga);
      vm.stopBroadcast();
    }

}