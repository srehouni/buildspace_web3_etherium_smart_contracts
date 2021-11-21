// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.4;

import "hardhat/console.sol";

contract WavePortal {
    uint256 totalWaves;
    mapping(address => uint256) wavers;
    address maxWaver;
    uint256 maxWaverWavesCount;

    constructor() {
        console.log("Yo yo, gm y'all");
    }

    function wave() public {
        totalWaves += 1;
        console.log("%s has waved!", msg.sender);
        wavers[msg.sender] += 1;

        if (wavers[msg.sender] > maxWaverWavesCount) {
            maxWaver = msg.sender;
            maxWaverWavesCount = wavers[msg.sender];
        }
    }

    function getTotalWaves() public view returns (uint256) {
        console.log("We have %d total waves!", totalWaves);
        return totalWaves;
    }

    function getMaxWaverAddress() public view returns (address) {
        console.log("%s waved the most, a total of %d!", maxWaver, maxWaverWavesCount);
        return maxWaver;
    }
}