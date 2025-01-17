// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "forge-std/Test.sol";
import "src/OrcaCoin.sol";

contract OrcaCoinTeat is Test {
    OrcaCoin orcaCoin;

    function setUp() public {
        orcaCoin = new OrcaCoin(address(this));
    }
    function testInitialSupply() public view {
        assertEq(orcaCoin.totalSupply(), 0);
    }
    function testMint() public {
        orcaCoin.mint(address(this), 100);
        assertEq(orcaCoin.balanceOf(address(this)), 100);
    }
    function testUpdateStakingContract() public {
        orcaCoin.updateStakingContract(0xf449dEe07546d70367FbB923Cc1e58fFDB753cF2);
        assertEq(orcaCoin.stakingContract(), 0xf449dEe07546d70367FbB923Cc1e58fFDB753cF2);
    }
}