// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BUSDToken {
    string public name = "BUSD"; // Token name
    string public symbol = "BUSD"; // Token symbol
    uint8 public decimals = 18; // Number of decimal places (same as ETH)

    uint256 private _totalSupply; // Total supply of tokens
    mapping(address => uint256) private _balances; // Mapping of token balances
    mapping(address => mapping(address => uint256)) private _allowances; // Mapping of allowed token transfers

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    constructor(uint256 totalSupply_) {
        _totalSupply = totalSupply_ * (10**uint256(decimals));
        _balances[msg.sender] = _totalSupply;
    }

    // Returns the total supply of tokens
    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }

    // Returns the balance of tokens for a specific address
    function balanceOf(address account) public view returns (uint256) {
        return _balances[account];
    }

    // Transfers tokens from the sender's account to another account
    function transfer(address recipient, uint256 amount) public returns (bool) {
        _transfer(msg.sender, recipient, amount);
        return true;
    }

    // Transfers tokens from one account to another if allowed by the sender
    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) public returns (bool) {
        uint256 currentAllowance = _allowances[sender][msg.sender];
        require(currentAllowance >= amount, "BUSD: Transfer amount exceeds allowance");
        _approve(sender, msg.sender, currentAllowance - amount);
        _transfer(sender, recipient, amount);
        return true;
    }

    // Allows spender to withdraw a certain amount of tokens from the owner's account
    function approve(address spender, uint256 amount) public returns (bool) {
        _approve(msg.sender, spender, amount);
        return true;
    }

    // Returns the remaining number of tokens that spender is allowed to withdraw from owner
    function allowance(address owner, address spender) public view returns (uint256) {
        return _allowances[owner][spender];
    }

    // Internal function to perform token transfer
    function _transfer(
        address sender,
        address recipient,
        uint256 amount
    ) internal {
        require(sender != address(0), "BUSD: Transfer from the zero address");
        require(recipient != address(0), "BUSD: Transfer to the zero address");
        require(amount > 0, "BUSD: Transfer amount must be greater than zero");
        require(_balances[sender] >= amount, "BUSD: Not enough balance");

        _balances[sender] -= amount;
        _balances[recipient] += amount;

        emit Transfer(sender, recipient, amount);
    }

    // Internal function to approve token transfer
    function _approve(
        address owner,
        address spender,
        uint256 amount
    ) internal {
        require(owner != address(0), "BUSD: Approve from the zero address");
        require(spender != address(0), "BUSD: Approve to the zero address");

        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }
}
