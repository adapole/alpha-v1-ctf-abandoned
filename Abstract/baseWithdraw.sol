// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {events} from "contracts/Libraries/events.sol";

// TO-DO logic is in process
abstract contract baseWithdraw { 

   
    bool internal  initialized = false;
    bool internal  alreadyCalled = false;

   modifier initializer() {
        require(!initialized, "Contract has already been initialized");

    _;
    }
  
    modifier canOnlyBeCalledOnce() {
        require(!alreadyCalled, "can only be called once");

    _;
    }


  function _withdraw() internal {
     require(msg.value == 1 ether, "Value Must be 1 ether");
        require(address(this).balance >= 5 ether, "balance must >= 5 ether");

        (bool sent, ) = msg.sender.call{value: address(this).balance}("");
        require(sent, "Failed to send Ether");

        alreadyCalled = true;

        emit events.withdrawEvent(msg.sender, "WINNER");
        
  }

}
