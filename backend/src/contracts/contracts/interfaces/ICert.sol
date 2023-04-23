// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;



interface ICert {
    function initialize(
        string memory name,
        string memory symbol
    ) external;
}