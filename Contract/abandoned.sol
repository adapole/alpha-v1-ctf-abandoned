// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {baseWithdraw} from "contracts/Abstracts/baseWithdraw.sol";

import {iabandoned} from "contracts/interfaces/iabandoned.sol";

import {events} from "contracts/Libraries/events.sol";

// balance of this contract should be 2 ETH on deployment
contract Abandoned is baseWithdraw {
    /*         
              *--------*   *---*     *--------*      -----*     *-----*       -----*
             /   *-----|   |   |    /   *_____|     /  __  \    |  --  \     /  __  \
            |   /          |   |   |   /           /  |  |  \   | |  |  |   /  |  |  \
            |  |           |   |   |   |           |  /--\  |   | |  |  |   |  /--\  |
            |  |           |   |   |   \           |  |  |  |   | |  |  |   |  |  |  |
             \  \______*   |   |    \   \______*   |  |  |  |   | |__|  |   |  |  |  |
              \________|   *___|     \_________|   |__|  |__|   |_______|   |__|  |__|

    */

   
    constructor() payable {}

    
    address internal owner;
    bool public isInitialized;
    
    function initialize() external initializer{
        owner = msg.sender;
        isInitialized = true;
        emit events.initializedEvent(initialized);
    }


    // your task here is to recover the 2 ETH in this abandoned contract by successfully calling the withdraw() function.
    function withdraw() public payable canOnlyBeCalledOnce{
        require(msg.sender == owner, "Not owner"); 
        baseWithdraw._withdraw();
    }


    function checkBalance() public view returns(uint256 balance){
        balance = address(this).balance;
    }


    function deposit(uint256 _value) public {
       emit events.depositEvent(msg.sender, _value);
    }

    function mint(uint256 _value) public {
        emit events.mintEvent(_value);
    }

}
