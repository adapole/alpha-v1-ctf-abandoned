// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

library events {

  event withdrawEvent(address sender, string message);
  
  event depositEvent(address sender, uint256 value);
 
  event initializedEvent(bool init);
 
  event mintEvent(uint256 val);

}
