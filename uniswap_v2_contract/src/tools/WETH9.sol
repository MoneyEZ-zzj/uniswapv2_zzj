// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract WETH9 {
    string public name = "Wrapped Ether";
    string public symbol = "WETH";
    uint8 public decimals = 18;

    mapping (address => uint) public balanceOf;
    mapping (address => mapping (address => uint)) public allowance;

    receive() external payable {
        deposit();
    }

    function deposit() public payable {
        balanceOf[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value);
    }

    function withdraw(uint wad) public {
        require(balanceOf[msg.sender] >= wad, "WETH9: insufficient balance");
        balanceOf[msg.sender] -= wad;
        payable(msg.sender).transfer(wad);
        emit Withdrawal(msg.sender, wad);
    }

    function totalSupply() public view returns (uint) {
        return address(this).balance;
    }

    function approve(
        address guy, 
        uint wad
    ) public returns (bool) {
        allowance[msg.sender][guy] = wad;
        emit Approval(msg.sender, guy, wad);
        return true;
    }

    function transfer(
        address dst, 
        uint wad
    ) public returns (bool) {
        return transferFrom(msg.sender, dst, wad);
    }

    function transferFrom(
        address src, 
        address dst, 
        uint wad
    ) public returns (bool) {
        require(balanceOf[src] >= wad, "WETH9: insufficient balance");

        // 检查 src 给 msg.sender 的授权是不是无限的
        // 如果不是无限的，那么需要检查授权数量是否足够
        if (src != msg.sender && allowance[src][msg.sender] != type(uint).max) {
            require(allowance[src][msg.sender] >= wad, "WETH9: insufficient allowance");
            allowance[src][msg.sender] -= wad;
        }

        balanceOf[src] -= wad;
        balanceOf[dst] += wad;

        emit Transfer(src, dst, wad);
        return true;
    }

    // src: 授权人， guy: 被授权人， wad: 授权数量
    event Approval(address indexed src, address indexed guy, uint wad);
    // src: 发送方， dst: 接收方， wad: 转账数量
    event Transfer(address indexed src, address indexed dst, uint wad);
    // dst: 存款方， wad: 存款数量
    event Deposit(address indexed dst, uint wad);
    // src: 提款方， wad: 提款数量
    event Withdrawal(address indexed src, uint wad);


}