// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;  //current version - only this will be used
// ^0.8.7 and above version
// >=0.8.7 <0.9.0 will work 

contract SimpleStorage {
    // primitive types
    // bool,uint,int,address,bytes,string

    //default value is 0
    uint favoriteNumber ;

    //like dict
    mapping(string => uint) public nametoFavoriteNumber;

    struct People {
        uint favoriteNumber;
        string name;
    }

    People public person = People(10,"John");
    People[] public peoples;


    //scope: vars in contract are global but in function are local
    //scope based on the curly brackets duh!

    //visiblilty specifiers > public, private, external, internal
    //view -> no gas, only read something from the contract (no state modification)
    //pure -> like view, but doesnt allow read also
    //if gas calling function calls view or pure then gas is used
    //public is like view too !

    function store(uint _favoriteNumber) public virtual {
        favoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns(uint){
        return favoriteNumber;
    }

    //calldata, memory -> only exist temporarily, calldata wont allow to reassign the value 
    //storage -> permanent vars that can be modified
    //uint is has defaulted to memory
    //string is like array, mappings and struct so need memory
    function addPerson(string memory _name, uint _favoriteNumber) public{
        peoples.push(People(_favoriteNumber,_name));
        nametoFavoriteNumber[_name]= _favoriteNumber;
    }

}

//deploying a contract is just a transaction on the blockchain network
//we spend gas to call the function on the contract
// change to public to view the variables value

//send to testnet only after testing,
//testnet is good to learn deploying