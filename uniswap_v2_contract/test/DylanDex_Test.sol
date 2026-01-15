// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test, console} from "../lib/forge-std/src/Test.sol";
import "../src/UniswapV2Pair.sol";
import "../src/UniswapV2Factory.sol";
import "../src/UniswapV2Router02.sol";
import "../src/libraries/v2-periphery-libraries/UniswapV2Library.sol";
import "../src/tools/WETH9.sol";
import "../src/DylanDex.sol";
import "../src/interfaces/IDylanDex.sol";
import {ERC20} from "../lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract RNTToken is ERC20("RNTToken", "RNT") {
    function mint(uint256 amount) public {
        _mint(msg.sender, amount);
    }
}

contract DylanDex_Test is Test {
    RNTToken RNT;

    address public tokenOwner;
    address public tokenOwner2;

    address public factoryOwner;
    UniswapV2Factory public factory;

    address public routerOwner;
    UniswapV2Router02 public router;

    UniswapV2Pair public pair;
    WETH9 public weth;

    DylanDex public dylanDex;

    function setUp() public {
        routerOwner = makeAddr("routerOwner");
        factoryOwner = makeAddr("factoryOwner");
        tokenOwner = makeAddr("tokenOwner");
        tokenOwner2 = makeAddr("tokenOwner2");

        RNT = new RNTToken();
        weth = new WETH9();

        vm.prank(factoryOwner);
        factory = new UniswapV2Factory(factoryOwner);

        vm.prank(routerOwner);
        router = new UniswapV2Router02(address(factory), address(weth));

        vm.prank(tokenOwner);
        RNT.mint(10 * 10 ** 18);
        vm.prank(tokenOwner);
        RNT.mint(10 * 10 ** 18);
        vm.deal(tokenOwner, 100 ether);

        vm.prank(tokenOwner2);
        RNT.mint(10 * 10 ** 18);
        vm.prank(tokenOwner2);
        RNT.mint(10 * 10 ** 18);
        vm.deal(tokenOwner2, 100 ether);

        dylanDex = new DylanDex(address(router), address(factory));

        (address token0, address token1) = UniswapV2Library.sortTokens(address(RNT), address(weth));
        console.log("RNT address: ", address(RNT));
        console.log("WETH address: ", address(weth));
        console.log("token0: ", token0);
        console.log("token1: ", token1);
        /**
            RNT address:  0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f
            WETH address:  0x2e234DAe75C793f67A35089C9d99245E1C58470b
            token0:  0x2e234DAe75C793f67A35089C9d99245E1C58470b
            token1:  0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f
         */
    }

    function assertReserves(
        address _pair,
        uint112 _reserve0, 
        uint112 _reserve1
    ) internal view {
        IUniswapV2Pair pair_ = IUniswapV2Pair(_pair);
        (uint112 reserve0, uint112 reserve1, ) = pair_.getReserves();
        assertEq(reserve0, _reserve0, "reserve0 is not as expected");
        assertEq(reserve1, _reserve1, "reserve1 is not as expected");
    }

    function getPathForTokenToToken(
        address _tokenIn, 
        address _tokenOut
    ) internal pure returns (address[] memory)
    {
        address[] memory path = new address[](2);
        path[0] = _tokenIn;
        path[1] = _tokenOut;

        return path;
    }

    // first add liquidity
    function MintBootstrap() internal {
        vm.prank(tokenOwner);
        RNT.approve(address(router), 1000 * 10 ** 18);

        vm.prank(tokenOwner);
        (uint _amountToken, uint _amountETH, uint _liquidity_0) = router.addLiquidityETH{value: 1 ether}(
            address(RNT),
            1 * 10 ** 18,
            0,
            0,
            tokenOwner,
            block.timestamp + 100
        );

        assertEq(_amountToken, 1 * 10 ** 18, "the amount of tokenA is not as expected");
        assertEq(_amountETH, 1 ether, "the amount of tokenB is not as expected");
        
        pair = UniswapV2Pair(factory.getPair(address(RNT), address(weth)));

        assertEq(_liquidity_0, pair.balanceOf(tokenOwner), "UniswapV2Pair: mint() should return the number of LP tokens minted");

        uint expectedLiquidity = 1e18 - 1000;
        assertEq(_liquidity_0, expectedLiquidity, "the number of liquidity is not as expected");
        assertEq(pair.totalSupply(), expectedLiquidity + 1000, "the total supply of LP tokens is not as expected");

        assertReserves(address(pair), 1e18, 1e18);
    }

    // ------------------- remove liquidity -------------------
    function test_Burn_TokenETH() public {
        // first
        MintBootstrap();

        // 将LP授权给router
        vm.prank(tokenOwner);
        pair.approve(address(router), 1000e18);
        vm.prank(tokenOwner);
        (uint _amountToken, uint _amountETH) = router.removeLiquidityETH(
            address(RNT),
            1e18 - 1000,
            0,
            0,
            tokenOwner,
            block.timestamp + 100
        );

        assertEq(_amountToken, 1e18 - 1000, "the amount of tokenA is not as expected");
        assertEq(_amountETH, 1e18 - 1000, "the amount of tokenB is not as expected");

        assertEq(pair.balanceOf(tokenOwner), 0, "the number of LP tokens is not as expected");
        
        pair = UniswapV2Pair(factory.getPair(address(RNT), address(weth)));
        assertReserves(address(pair), 1000, 1000);
    }

    // ------------------- swap -------------------
    function test_swap_token_to_ETH() public {
        // first
        MintBootstrap();

        pair = UniswapV2Pair(factory.getPair(address(RNT), address(weth)));
        (uint112 _reserveIn, uint112 _reserveOut, ) = pair.getReserves();

        vm.prank(tokenOwner);
        RNT.approve(address(dylanDex), 1000 * 10 ** 18);

        uint deltaX = 1e18;
        uint amountInWithFee = deltaX * 997;
        uint numerator = amountInWithFee * uint(_reserveOut);
        uint denominator = uint(_reserveIn) * 1000 + amountInWithFee;
        uint amountOut = numerator / denominator;

        // vm.expectEmit(true, true, true, true);
        // emit DylanDex.ETHBought(tokenOwner, address(RNT), deltaX, amountOut);
        vm.prank(tokenOwner);
        uint[] memory _amounts = dylanDex.buyETH(address(RNT), deltaX, 0);

        assertEq(_amounts[0], deltaX, "the amount of tokenB is not as expected");
        assertEq(_amounts[1], amountOut, "the amount of tokenA is not as expected");

        assertReserves(address(pair), uint112(1e18 - amountOut), 2e18);
    }

    function test_swap_ETH_to_token() public {
        // first
        MintBootstrap();

        pair = UniswapV2Pair(factory.getPair(address(RNT), address(weth)));
        (uint112 _reserveIn, uint112 _reserveOut, ) = pair.getReserves();

        uint deltaX = 1e18;
        uint amountInWithFee = deltaX * 997;
        uint numerator = amountInWithFee * uint(_reserveOut);
        uint denominator = uint(_reserveIn) * 1000 + amountInWithFee;
        uint amountOut = numerator / denominator;

        vm.prank(tokenOwner);
        uint[] memory _amounts = dylanDex.sellETH{value: deltaX}(address(RNT), 0);

        assertEq(_amounts[0], deltaX, "the amount of tokenB is not as expected");
        assertEq(_amounts[1], amountOut, "the amount of tokenA is not as expected");

        assertReserves(address(pair), 2e18, uint112(1e18 - amountOut));

    }
}