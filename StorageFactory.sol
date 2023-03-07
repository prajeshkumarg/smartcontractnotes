// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;  //make sure to have compiler versions thats compatible with both

//one way is to put this in the simpleStorage.sol file and deploy there
//then use new for deploying within it

import "./SimpleStorage.sol"; //just like copying the smartcontracts code in it
contract StorageFactory{
    //SimpleStorage public simpleStorage;
    SimpleStorage[] public simpleStorageArray;
    function createSimpleStorageContract() public {
        //simpleStorage = new SimpleStorage(); //if in same file to deploy it
        SimpleStorage simpleStorage = new SimpleStorage(); //new for deploying it
        simpleStorageArray.push(simpleStorage);
    }


    //to interact with other contracts we need the address and ABI(interface) -> can this from compilation details too
    //import automatically makes the ABI 
    function sfStore(uint _simpleStorageIndex, uint _simpleStorageNumber) public {
        SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
        simpleStorage.store(_simpleStorageNumber);
    }

    //to read store from simpleStorage.sol
    function sfGet(uint _simpleStorageIndex) public view returns(uint){
        SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
        return simpleStorage.retrieve(); 
    }

    //the above function can be put in one line return statements

}

//this is how it runs now
/*  we createSimpleStorage and put in array
    then use sfstore to put at index 0
    the check with sfget
    Again createSimpleStorage and repeat
*/