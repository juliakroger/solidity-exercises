pragma solidity >=0.5.7;

contract Inherintance {
    address owner;
    uint256 fortune;
    bool isDeceased;

    constructor() public payable {
        owner = msg.sender;
        fortune = msg.value;
        isDeceased = false;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    modifier mustBeDeceased() {
        require(isDeceased == true);
        _;
    }

    address payable[] familyWallets;

    mapping(address => uint256) inherintance;

    function setInheritance(address payable wallet, uint256 amount)
        public
        onlyOwner
    {
        familyWallets.push(wallet);
        inherintance[wallet] = amount;
    }

    function payout() private mustBeDeceased {
        for (uint256 i = 0; i < familyWallets.length; i++) {
            familyWallets[i].transfer(inherintance[familyWallets[i]]);
        }
    }

    function deceased() public onlyOwner {
        isDeceased = true;
        payout();
    }
}
