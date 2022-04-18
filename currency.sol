pragma solidity >=0.7.0 <0.9.0;


contract Coin {
    address public minter;
    address[] wallets;
    mapping(address => uint) balances;

    constructor() {
        minter = msg.sender;
    }

    modifier onlyMinter {
        require(msg.sender == minter);
        _;
    }

    error insufficientBalance(uint requested, uint available);

    event Sent(address from, address to, uint amount);

    function mint(address receiver, uint amount) onlyMinter public {
        wallets.push(receiver);
        balances[receiver] += amount;
    }

    function send(address receiver, uint amount) public {
        if(amount > balances[msg.sender]) {
            revert insufficientBalance({
                requested: amount,
                available: balances[msg.sender]
            });
        }
       
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }

    function getBalance(address wallet) public view returns (uint) {
        return balances[wallet];
    }

    function geMyBalance() public view returns (uint) {
        return balances[msg.sender];
    }

    function totalSupply() public view returns (uint) {
        uint total;
        for (uint i=0; i < wallets.length; i++) {
            total += balances[wallets[i]];
        }

        return total;
    }
}