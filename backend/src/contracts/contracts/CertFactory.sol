// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/proxy/Clones.sol";

import "./interfaces/ICert.sol";

contract CertFactory {

    address public implementation;

    event TokenCreated(address indexed token);

    constructor(address _implementation) {
        implementation = _implementation;
    }

    function createToken(
        string memory name,
        string memory symbol
    ) public returns (address) {
        address token = Clones.clone(implementation);
        ICert(token).initialize(name, symbol);
        emit TokenCreated(token);
        return token;
    }
}