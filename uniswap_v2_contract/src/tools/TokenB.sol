// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "../../lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import "../../lib/openzeppelin-contracts/contracts//access/Ownable.sol";

contract TokenB is ERC20("TokenB","B"), Ownable(msg.sender) {
    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }
}