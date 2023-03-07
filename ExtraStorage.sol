// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import "./SimpleStorage.sol";
//inheritance and overrides
//making this the child of SimpleStorage
contract ExtraStorage is SimpleStorage{
    //on deployment all functions are inherited
    //we can also override these like in java
    //keywords: virtual and override
    //only virual functions in parent can be overriden

    function store(uint _favoriteNumber) public  override{ //needs the override specifier 
        favoriteNumber = _favoriteNumber+5;
    }
}

//now on deployment of this contract we get them to be 10