pragma solidity >= 0.7.0 < 0.9.0;

contract AddressWallets {
    uint funds;
    uint conversionValue = 1000000000000000000;

    address payable[] investorWallets;

    mapping(address => uint) investors;

    constructor() public payable {
        funds = msg.value;
    }

    function payInvestors(address payable wallet, uint amount) public {
        investorWallets.push(wallet);
        investors[wallet] = amount*conversionValue;
    }

    function payout() private {
        for(uint i = 0; i < investorWallets.length; i++) {
            investorWallets[i].transfer(investors[investorWallets[i]]);
        }
    }


    function makePayment() public {
        payout();
    }

     function checkInvestors() public view returns (uint) {
        uint amountAvailable = funds;
        for(uint i = 0; i < investorWallets.length; i++) {
            amountAvailable = amountAvailable - investors[investorWallets[i]];
        }

        return amountAvailable;
    }    
}
