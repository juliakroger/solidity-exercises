pragma solidity >=0.7.0 <0.9.0;

// Create a contract that can store data and return the data back

contract simpleStorage {
    // 1. receive info (names)
    uint256 storeData;

    // string storeData;

    // 2. store info
    function set(uint256 x) public {
        storeData = x;
    }

    // 3. return info
    function get() public view returns (uint256) {
        return storeData;
    }

    function getDouble() public view returns (uint256) {
        return storeData * 2;
    }
}
