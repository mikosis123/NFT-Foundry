//SPDX-License-Identifier :MIT
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {console} from "forge-std/console.sol";
import {BasicNFT} from "../src/BasicNFT.sol";

import {DeployBasicNft} from "../script/DeployBasicNft.s.sol";

contract BasicNftTest is Test {
    BasicNFT public basicNft;
    DeployBasicNft public deploy;
    string public constant Waga =
        "https://ipfs.io/ipfs/QmcTkpY3YZnWiaq9XABHnuapSDAXuY8wgkEkv1aZvNq3S8?filename=photo_2025-02-12_11-53-27.jpg";
    address public USER = makeAddr("user");

    function setUp() public {
        deploy = new DeployBasicNft();
        basicNft = deploy.run();
    }

    function testName() public {
        string memory ecpectedName = basicNft.name();
        string memory deployedname = "Wagan NFT";
        assertEq(keccak256(abi.encodePacked(ecpectedName)), keccak256(abi.encodePacked(deployedname)));
    }

    function testmintNFT() public {
        vm.prank(USER);
        basicNft.mintNFT(Waga);
        assert(basicNft.balanceOf(USER) == 1);
        console.log(basicNft.tokenURI(0));

        assert(keccak256(abi.encodePacked(basicNft.tokenURI(0))) == keccak256(abi.encodePacked(Waga)));
    }
}
