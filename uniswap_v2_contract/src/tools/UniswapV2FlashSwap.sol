// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "../interfaces/IUniswapV2Callee.sol";
import "../interfaces/IUniswapV2Pair.sol";
import "../interfaces/IERC20.sol";
// 主要用到的是getPair函数，用来获取pair合约地址
import "../interfaces/IUniswapV2Factory.sol";

contract UniswapV2FlashSwap is IUniswapV2Callee {
    // WETH在主网的地址
    address private constant WETH = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    // uniswap官方部署在主网的工厂合约地址
    address private constant UNISWAP_V2_FACTORY = 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f;


    // _tokenBorrow: 想要借贷的token地址
    // _amount: 想要借贷的数量
    function flashSwap(address _tokenBorrow, uint256 _amount) external {
        address pair = IUniswapV2Factory(UNISWAP_V2_FACTORY).getPair(
            _tokenBorrow,
            WETH
        );
        require(pair != address(0), "UniswapV2FlashSwap: pair not exists");

        address token0 = IUniswapV2Pair(msg.sender).token0();
        address token1 = IUniswapV2Pair(msg.sender).token1();

        // 由于池子里的token顺序不确定，所以需要判断一下
        uint256 amount0Out = _tokenBorrow == token0 ? _amount : 0;
        uint256 amount1Out = _tokenBorrow == token1 ? _amount : 0;
    
        // 封装data（借什么token，借多少amount）
        bytes memory data = abi.encode(_tokenBorrow, _amount);
        // 调用pair合约的swap函数
        IUniswapV2Pair(pair).swap(amount0Out, amount1Out, address(this), data);
        // adding data triggers a flashloan
    }

    // in return of flashloan call, uniswap will return with this function
    // providing us the token borrow and the amount
    // we also have to repay the borrowed amt plus some fees
    function uniswapV2Call(
        address _sender,
        uint256 _amount0,
        uint256 _amount1,
        bytes calldata _data
    ) external override {
        // 检查 msg.sender 是pair合约
        address token0 = IUniswapV2Pair(msg.sender).token0();
        address token1 = IUniswapV2Pair(msg.sender).token1();
        // call uniswapV2Factory.getPair函数，获取pair合约地址
        address pair = IUniswapV2Factory(UNISWAP_V2_FACTORY).getPair(
            token0,
            token1
        );
        require(msg.sender == pair, "UniswapV2FlashSwap: call uniswapV2Call not a pair");

        // 检查调用者是FlashSwap合约
        require(_sender == address(this), "UniswapV2FlashSwap: not sender");

        (address tokenBorrow, uint amount) = abi.decode(_data, (address, uint));

        // 0.3% fees
        uint fee = ((amount * 3) / 997) + 1;
        uint amountToRepay = amount + fee;

        IERC20(tokenBorrow).transfer(pair, amountToRepay);
    }
}


