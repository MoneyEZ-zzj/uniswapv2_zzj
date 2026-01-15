// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./interfaces/IERC20.sol";
import "./interfaces/IUniswapV2Factory.sol";
import "./interfaces/IUniswapV2Router02.sol";
import "./interfaces/IDylanDex.sol";
import "./interfaces/IWETH.sol";
import "./libraries/v2-periphery-libraries/TransferHelper.sol";

contract DylanDex is IDylanDex {
    IUniswapV2Router02 public immutable uniswapV2Router;
    IUniswapV2Factory public immutable uniswapV2Factory;
    IWETH public immutable WETH;

    constructor(
        address _uniswapV2Router, 
        address _uniswapV2Factory
    ) {
        uniswapV2Router = IUniswapV2Router02(_uniswapV2Router);
        uniswapV2Factory = IUniswapV2Factory(_uniswapV2Factory);
        WETH = IWETH(uniswapV2Router.WETH());
    }

    function sellETH(
        address buyToken,
        uint256 minBuyAmount
    ) external payable returns (uint[] memory){
        if (msg.value <= 0) revert ZeroSellETH();

        address[] memory path = new address[](2);
        path[0] = address(WETH);
        path[1] = buyToken;

        uint[] memory amounts = uniswapV2Router.swapExactETHForTokens{value: msg.value}(
            minBuyAmount,
            path,
            msg.sender,
            block.timestamp
        );

        emit ETHSold(msg.sender, buyToken, msg.value, amounts[1]);

        return amounts;
    }

    function buyETH(
        address sellToken,
        uint256 sellAmount,
        uint256 minBuyAmount
    ) external returns (uint[] memory) {
        if (sellAmount <= 0) revert ZeroTokenSellAmount();

        IERC20(sellToken).transferFrom(msg.sender, address(this), sellAmount);
        IERC20(sellToken).approve(address(uniswapV2Router), sellAmount);

        address[] memory path = new address[](2);
        path[0] = sellToken;
        path[1] = address(WETH);

        uint[] memory amounts = uniswapV2Router.swapExactTokensForETH(
            sellAmount,
            minBuyAmount,
            path,
            address(this),
            block.timestamp
        );

        payable(msg.sender).transfer(amounts[1]);

        emit ETHBought(msg.sender, sellToken, sellAmount, amounts[1]);

        return amounts;
    }

    receive() external payable {}

    error ZeroSellETH();
    error ZeroTokenSellAmount();

}
