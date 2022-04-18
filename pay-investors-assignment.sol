pragma solidity >= 0.7.0 < 0.9.0;

// 1. Create a contract called AddressWallets which wraps around the function checkInvestors below.
contract AddressWallets {
    // 2. Create an empty array of addresses which is payable called investorWallets
    address payable[] investorWallets;

    // 3. Write a libaray of keys and values nameed investors where the keys are addresses and the values are integers. DONE
    mapping(address => uint) investors;

    // 4. Write a payable function called payInvestors which takes the parameters address and amount.
    function payInvestors(address payable wallet, uint amount) payable public {
        // 5. Write logic in the function so that it can add new wallets to investorWallets and fill them with amounts of your choosing.
        // 6. Combine the address link to the array and map to do this correctly.
        investorWallets.push(wallet);
        investors[wallet] = amount;
    }

    function checkInvestors() public view returns (uint) {
        return investorWallets.length;
    }

    function listOfInvestors(uint id) public view returns (address payable) {
        return investorWallets[id];
    } 
}