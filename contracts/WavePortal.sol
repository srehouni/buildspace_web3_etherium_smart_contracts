// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.4;

import "hardhat/console.sol";

contract WavePortal {
    uint256 totalWaves;
    mapping(address => uint256) wavers;
    address maxWaver;
    uint256 maxWaverWavesCount;

    event NewWave(address indexed from, uint256 timestamp, string message);

    struct Wave {
        address waver;
        string message;
        uint256 timestamp;
    }

    Wave[] waves;

    constructor() {
        console.log("Yo yo, gm y'all");
    }

    function wave(string memory _message) public {
        totalWaves += 1;
        console.log("%s has waved!", msg.sender);
        wavers[msg.sender] += 1;

        if (wavers[msg.sender] > maxWaverWavesCount) {
            maxWaver = msg.sender;
            maxWaverWavesCount = wavers[msg.sender];
        }

        waves.push(Wave(msg.sender, _message, block.timestamp));
        emit NewWave(msg.sender, block.timestamp, _message);
    }

    function getTotalWaves() public view returns (uint256) {
        console.log("We have %d total waves!", totalWaves);
        return totalWaves;
    }

    function getAllWaves() public view returns (Wave[] memory) {
        return waves;
    }

    function getMaxWaverAddress() public view returns (address) {
        console.log("%s waved the most, a total of %d!", maxWaver, maxWaverWavesCount);
        return maxWaver;
    }
}