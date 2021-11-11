// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.0;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract Token is ERC721 {
    constructor(string memory _name, string memory _symbol)
        ERC721(_name, _symbol)
    {
        this;
    }

    function mint(address _to, uint256 _id) public {
        _mint(_to, _id);
    }
}
