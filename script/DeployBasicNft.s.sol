//SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {BasicNFT} from "../src/BasicNFT.sol";

contract DeployBasicNft is Script {
    function run() public returns (BasicNFT) {
        vm.startBroadcast();
        BasicNFT basicnft = new BasicNFT();
        vm.stopBroadcast();
        return basicnft;
    }
}
