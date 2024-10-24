// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract Donation {
    address public owner;
    uint public totalDonations;

    event DonationReceived(address indexed donor, uint amount);

    constructor() {
        owner = msg.sender;
        totalDonations = 0;
    }

    function donate() public payable {
        require(msg.value > 0, "Donation must be greater than 0");
        totalDonations += msg.value;
        emit DonationReceived(msg.sender, msg.value);
    }

    function getTotalDonations() public view returns (uint) {
        return totalDonations;
    }
}
