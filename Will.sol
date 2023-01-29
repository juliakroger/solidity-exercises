pragma solidity >= 0.7.0 < 0.9.0;

contract Will {
    address owner;
    uint fortune;
    bool deceased = false;

    constructor() payable {
        owner = msg.sender;
        fortune = msg.value;
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    modifier mustBeDecesed {
        require(deceased == true);
        _;
    }

    address payable [] wallets;

    mapping(address => uint) inherintance;

    function setInheritance(address payable wallet, uint amount) public {
        wallets.push(wallet);
        inherintance[wallet] = amount;
    }
}
