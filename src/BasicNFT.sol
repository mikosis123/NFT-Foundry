// SPDX-License-Identifier:MIT

pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNFT is ERC721 {
    uint256 private s_NFTCount;
    mapping(uint256 => string) private s_tokenIdtoURI;

    constructor() ERC721("Wagan NFT", "WAGA") {
        s_NFTCount = 0;
    }

    function mintNFT(string memory tokenURI) public {
        s_tokenIdtoURI[s_NFTCount] = tokenURI;
        _safeMint(msg.sender, s_NFTCount);
        s_NFTCount++;
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        return s_tokenIdtoURI[tokenId]; // ✅ Correct: Uses tokenId
    }
}
