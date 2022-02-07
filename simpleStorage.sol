//SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract SimpleStorage {
    //favoriteNumber isn't defined thus it will initialize to null, 0
    uint256 favoriteNumber;

    struct People {
        uint256 favoriteNumber;
        string name;
    }

    People[] public people;
    mapping(string => uint256) public nameToFavoriteNumber;

    // view, pure are non state changing functions. View reads off of the block chain, pure functions only do some type of math but they do not save the results
    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns (uint256) {
        return favoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}
