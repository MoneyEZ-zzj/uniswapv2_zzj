// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "../interfaces/IUniswapV2Callee.sol";
import "../interfaces/IUniswapV2Pair.sol";
import "../interfaces/IERC20.sol";
// 主要用到的是getPair函数，用来获取pair合约地址
import "../interfaces/IUniswapV2Factory.sol";
import "../interfaces/IUniswapV2Router02.sol";
import "../interfaces/ISushiSwapV2Router.sol";

contract UniswapV2FlashSwap_v2 is IUniswapV2Callee {
    // WETH在主网的地址
    address private constant WETH = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    // uniswap官方部署在主网的工厂合约地址
    address private constant UNISWAP_V2_FACTORY = 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f;
    address private constant UNISWAP_V2_ROUTER = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;
    //https://docs.sushi.com/docs/Products/Trident%20AMM/Deployment%20Addresses
    address private constant SUSHISWAP_ROUTER = 0xDdC1b5920723F774d2Ec2C3c9355251A20819776; // Sushiswap的路由地址

    address private immutable OWNER;
    constructor() {
        OWNER = msg.sender;
    }

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

        // 具体的套利过程
        {
            // 获取借贷的token
            IERC20 token = IERC20(tokenBorrow);

            // 假设在Sushiswap上发现该token的价格高于Uniswap
            // 这里是假设的价格，实际上需要实时的价格获取和计算
            uint256 sushiPrice = 120; // 1 tokenBorrow = 120 WETH
            uint256 uniPrice = 100; // 1 tokenBorrow = 100 WETH 

            if (sushiPrice > uniPrice) {
                // 在Sushiswap买入
                // 授权SushiSwap Router 使用借入的token
                token.approve(SUSHISWAP_ROUTER, amount);
                uint256 minAmountOutSushi = estimateSwapOutSushi(tokenBorrow, WETH, amount);
                // 在SushiSwap卖出借入的Token，以获取WETH
                uint256[] memory amounts = ISushiSwapV2Router(SUSHISWAP_ROUTER).swapExactTokensForTokens(
                    amount,
                    minAmountOutSushi, // 这里是想要换取WETH的最小数量
                    getPathForTokenToToken(tokenBorrow, WETH),
                    address(this),
                    block.timestamp + 100
                );

                emit LogSwap(tokenBorrow, WETH, amount, amounts[1]);

                uint256 amountWETH = amounts[amounts.length - 1]; // 交换后的WETH数量
                
                // 下面的代码有问题，因为swap有lock，所以不能在同一个交易中在同一个池子进行两次swap
                // 在Uniswap卖出
                // 授权Uniswap Router 使用WETH
                // IERC20(WETH).approve(UNISWAP_V2_ROUTER, amountWETH);

                // uint256 minAmountOutUni = estimateSwapOutUni(WETH, tokenBorrow, amountWETH);
                // // 在Uniswap卖出WETH，以获取借入的Token
                // uint256[] memory amountsBuy = IUniswapV2Router02(UNISWAP_V2_ROUTER).swapExactTokensForTokens(
                //     amountWETH,
                //     minAmountOutUni,
                //     getPathForTokenToToken(WETH, tokenBorrow),
                //     address(this),
                //     block.timestamp + 100
                // );
                // uint256 amountTokensBought = amountsBuy[amountsBuy.length - 1]; // 交换后的token数量

                // // 0.3% fees
                // uint fee = ((amount * 3) / 997) + 1;
                // uint amountToRepay = amount + fee;

                // require(token.transfer(msg.sender, amountToRepay), "Failed to repay flash loan");
                // require(token.transfer(OWNER, amountTokensBought - amountToRepay), "Failed to send profits");
                // emit LogRepayment(amount, amountToRepay, amountTokensBought - amountToRepay);

                // 不还token，直接还WETH
                uint fee = ((amount * uniPrice * 3) / 997) + 1;
                uint WETHamountToRepay = amount * uniPrice + fee;
                require(token.transfer(msg.sender, WETHamountToRepay), "Failed to repay flash loan");
                emit LogRepayment(WETH, WETHamountToRepay, amountWETH - WETHamountToRepay);
    }
        }
    }

    function getPathForTokenToToken(
        address _tokenIn, 
        address _tokenOut
    ) private pure returns (address[] memory)
    {
        address[] memory path = new address[](2);
        path[0] = _tokenIn;
        path[1] = _tokenOut;

        return path;
    }

    // 获取SushiSwap预估输出
    function estimateSwapOutSushi(address _tokenIn, address _tokenOut, uint256 _amountIn) public view returns (uint256) {
        address[] memory path = getPathForTokenToToken(_tokenIn, _tokenOut);
        uint256[] memory amountOuts = ISushiSwapV2Router(SUSHISWAP_ROUTER).getAmountsOut(_amountIn, path);
        return amountOuts[1] * 99 / 100;  // 计算包含1%滑点保护的最小输出
    }

    // 获取Uniswap预估输出
    function estimateSwapOutUni(address _tokenIn, address _tokenOut, uint256 _amountIn) public view returns (uint256) {
        address[] memory path = getPathForTokenToToken(_tokenIn, _tokenOut);
        uint256[] memory amountOuts = IUniswapV2Router02(UNISWAP_V2_ROUTER).getAmountsOut(_amountIn, path);
        return amountOuts[1] * 99 / 100;  // 计算包含1%滑点保护的最小输出
    }

    event LogSwap(
        address indexed tokenIn,
        address indexed tokenOut,
        uint256 amountIn,
        uint256 amountOut
    );

    event LogRepayment(
        address indexed repayTokenAddress, // 用于还款的token地址
        uint256 repaymentAmount,
        uint256 profit
    );
}


