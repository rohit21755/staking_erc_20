// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract OrcaCoin is ERC20 {
    address public stakingContract;
    constructor(address _stackingContract) ERC20("ORCA", "ORC") {
        stakingContract = _stackingContract;
    }
    function mint(address to, uint256 amount) public {
        require(msg.sender == stakingContract, "Only staking contract can mint");
        _mint(to, amount);
    }
    function updateStakingContract(address _stackingContract) public {
        require(msg.sender == stakingContract, "Only staking contract can update");
        stakingContract = _stackingContract;
    }

}