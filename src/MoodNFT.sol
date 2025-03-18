// SPDX-License-Identifier:MIT

pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MoodNft is ERC721 {
    uint256 public s_tokenCounter;
    string public s_sadSvg;
    string public s_smaileSvg;
    mapping(uint256 => Mood) public s_tokenIdToMood;

    enum Mood {
        Happy,
        Sad
    }

    constructor(string memory smileSvg, string memory sadSvg) ERC721("MoodNFT", "MN") {
        s_tokenCounter = 0;
        s_sadSvg = sadSvg;
        s_smaileSvg = smileSvg;
    }

    function mintMoodNft() public {
        _safeMint(msg.sender, s_tokenCounter);

        s_tokenIdToMood[s_tokenCounter] = Mood.Sad;
        s_tokenCounter++;
    }

    function _baseURI() view override returns (string memory) {
        return "data:appliction/json;base64";
    }

    function tokenURI(uint256 tokenId) view override returns (string memory) {
        string memory imageUrl;

        if (s_tokenIdToMood[tokenId] = mood.Sad) {
            imageUrl = s_sadSvg;
        } else {
            imageUrl = s_smaileSvg;
        }
        return string(
            abi.endcodePacked(
                _baseURI,
                Base64.encode(
                    bytes(
                        abi.encodePacked(
                            '{
                "name":"',
                            name(),
                            '",
                "description":"An NFT that reflects the mood of the owner, 100% on Chain!",',
                            '"attributes":[{"trait_type}:"moodeness","value":100}],"image":"',
                            imageUrl,
                            '"
            }'
                        )
                    )
                )
            )
        );
    }
}
