// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test, console} from "../lib/forge-std/src/Test.sol";
import "../src/UniswapV2Pair.sol";
import "../src/UniswapV2Factory.sol";
import "../src/UniswapV2Router02.sol";
import "../src/tools/WETH9.sol";
// import "../src/DylanDex.sol";
import {ERC20} from "../lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract ERC20Mintable is ERC20 {
    constructor(string memory name, string memory symbol) ERC20(name, symbol) {}
    
    function mint(uint256 amount) public {
        _mint(msg.sender, amount);
    }
}

contract TokensForTokens_Test is Test {
    ERC20Mintable tokenA;
    ERC20Mintable tokenB;

    address public tokenOwner;
    address public tokenOwner2;

    address public factoryOwner;
    UniswapV2Factory public factory;

    address public routerOwner;
    UniswapV2Router02 public router;

    UniswapV2Pair public pair;
    WETH9 public weth;

    function setUp() public {
        routerOwner = makeAddr("routerOwner");
        factoryOwner = makeAddr("factoryOwner");
        tokenOwner = makeAddr("tokenOwner");
        tokenOwner2 = makeAddr("tokenOwner2");

        ERC20Mintable token_C = new ERC20Mintable("Token C", "TKC");
        ERC20Mintable token_D = new ERC20Mintable("Token D", "TKD");
        (tokenA, tokenB) = token_C < token_D ? (token_C, token_D) : (token_D, token_C);

        weth = new WETH9();

        vm.prank(factoryOwner);
        factory = new UniswapV2Factory(factoryOwner);

        vm.prank(routerOwner);
        router = new UniswapV2Router02(address(factory), address(weth));

        vm.prank(tokenOwner);
        tokenA.mint(10 * 10 ** 18);
        vm.prank(tokenOwner);
        tokenB.mint(10 * 10 ** 18);

        vm.prank(tokenOwner2);
        tokenA.mint(10 * 10 ** 18);
        vm.prank(tokenOwner2);
        tokenB.mint(10 * 10 ** 18);
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
        tokenA.approve(address(router), 1000 * 10 ** 18);
        vm.prank(tokenOwner);
        tokenB.approve(address(router), 1000 * 10 ** 18);

        vm.prank(tokenOwner);
        (uint _amountA_0, uint _amountB_0, uint _liquidity_0) = router.addLiquidity(
            address(tokenA),
            address(tokenB),
            1 * 10 ** 18,
            1 * 10 ** 18,
            0,
            0,
            tokenOwner,
            block.timestamp + 100
        );

        assertEq(_amountA_0, 1 * 10 ** 18, "the amount of tokenA is not as expected");
        assertEq(_amountB_0, 1 * 10 ** 18, "the amount of tokenB is not as expected");
        
        pair = UniswapV2Pair(factory.getPair(address(tokenA), address(tokenB)));

        assertEq(_liquidity_0, pair.balanceOf(tokenOwner), "UniswapV2Pair: mint() should return the number of LP tokens minted");

        uint expectedLiquidity = 1e18 - 1000;
        assertEq(_liquidity_0, expectedLiquidity, "the number of liquidity is not as expected");
        assertEq(pair.totalSupply(), expectedLiquidity + 1000, "the total supply of LP tokens is not as expected");

        assertReserves(address(pair), 1e18, 1e18);
    }

    // ------------------- add liquidity -------------------

    // add more liquidity
    function test_MintMoreLiquidity() public {
        // first
        MintBootstrap();

        // second
        vm.prank(tokenOwner);
        (uint _amountA_1, uint _amountB_1, uint _liquidity_1) = router.addLiquidity(
            address(tokenA),
            address(tokenB),
            2 * 10 ** 18,
            2 * 10 ** 18,
            0,
            0,
            tokenOwner,
            block.timestamp + 100
        );

        assertEq(_amountA_1, 2 * 10 ** 18, "the amount of tokenA is not as expected");
        assertEq(_amountB_1, 2 * 10 ** 18, "the amount of tokenB is not as expected");
        assertEq(_liquidity_1, 2e18, "the number of liquidity is not as expected");
        
        pair = UniswapV2Pair(factory.getPair(address(tokenA), address(tokenB)));

        assertEq(3e18 - 1000, pair.balanceOf(tokenOwner), "UniswapV2Pair: the number of balance is not as expected");
        assertEq(pair.totalSupply(), 3e18, "the total supply of LP tokens is not as expected");
        assertReserves(address(pair), 3e18, 3e18);
    }

    // Adding liquidity in the wrong proportion use router
    function test_MintWrongProportion_router() public {
        // first proportion with 1:1
        MintBootstrap();

        // second proportion with 2:1
        vm.prank(tokenOwner);
        (uint _amountA_1, uint _amountB_1, uint _liquidity_1) = router.addLiquidity(
            address(tokenA),
            address(tokenB),
            1 * 10 ** 18,
            2 * 10 ** 18,
            0,
            0,
            tokenOwner,
            block.timestamp + 100
        );

        assertEq(_amountA_1, 1 * 10 ** 18, "the amount of tokenA is not as expected");
        assertEq(_amountB_1, 1 * 10 ** 18, "the amount of tokenB is not as expected");
        assertEq(_liquidity_1, 1e18, "the number of liquidity is not as expected");
        
        pair = UniswapV2Pair(factory.getPair(address(tokenA), address(tokenB)));

        assertEq(2 ether - 1000, pair.balanceOf(tokenOwner), "UniswapV2Pair: mint() should return the number of LP tokens minted");
        assertEq(pair.totalSupply(), 2e18, "the total supply of LP tokens is not as expected");
        assertReserves(address(pair), 2e18, 2e18);
    }

    // Adding liquidity in the wrong proportion use pair
    function test_MintWrongProportion_pair() public {
        // first proportion with 1:1
        MintBootstrap();

        pair = UniswapV2Pair(factory.getPair(address(tokenA), address(tokenB)));

        vm.prank(tokenOwner);
        tokenA.transfer(address(pair), 2e18);
        vm.prank(tokenOwner);
        tokenB.transfer(address(pair), 1e18);
        vm.prank(tokenOwner);
        uint _liquidity = pair.mint(tokenOwner);
        assertEq(_liquidity, 1e18);
        assertEq(2e18 - 1000, pair.balanceOf(tokenOwner), "UniswapV2Pair: mint() should return the number of LP tokens minted");
        assertEq(pair.totalSupply(), 2e18, "the total supply of LP tokens is not as expected");
        assertReserves(address(pair), 3e18, 2e18);
    }

    // ------------------- remove liquidity -------------------
    function test_Burn() public {
        // first
        MintBootstrap();

        // 将LP授权给router
        vm.prank(tokenOwner);
        pair.approve(address(router), 1000e18);
        vm.prank(tokenOwner);
        (uint amountA_1, uint amountB_1) = router.removeLiquidity(
            address(tokenA),
            address(tokenB),
            1e18 - 1000,
            0,
            0,
            tokenOwner,
            block.timestamp + 100
        );

        assertEq(amountA_1, 1e18 - 1000, "the amount of tokenA is not as expected");
        assertEq(amountB_1, 1e18 - 1000, "the amount of tokenB is not as expected");

        assertEq(pair.balanceOf(tokenOwner), 0, "the number of LP tokens is not as expected");
        
        pair = UniswapV2Pair(factory.getPair(address(tokenA), address(tokenB)));
        assertReserves(address(pair), 1000, 1000);
    }

    // Adding liquidity in the wrong proportion and burn
    function test_MintWrongProportion_burn_tokenOwner2() public {
        // first proportion with 1:1
        MintBootstrap();

        // second proportion with 2:1
        vm.prank(tokenOwner2);
        tokenA.approve(address(router), 1000 * 10 ** 18);
        vm.prank(tokenOwner2);
        tokenB.approve(address(router), 1000 * 10 ** 18);
        vm.prank(tokenOwner2);
        (uint _amountA_1, uint _amountB_1, uint _liquidity_1) = router.addLiquidity(
            address(tokenA),
            address(tokenB),
            1 * 10 ** 18,
            2 * 10 ** 18,
            0,
            0,
            tokenOwner2,
            block.timestamp + 100
        );
        assertEq(_amountA_1, 1 * 10 ** 18, "the amount of tokenA is not as expected");
        assertEq(_amountB_1, 1 * 10 ** 18, "the amount of tokenB is not as expected");
        assertEq(_liquidity_1, 1e18, "the number of liquidity is not as expected");

        uint liquidity_2 = pair.balanceOf(tokenOwner2);
        assertEq(liquidity_2, 1e18, "the number of liquidity is not as expected");

        // 将LP授权给router
        vm.prank(tokenOwner2);
        pair.approve(address(router), 1000e18);

        vm.prank(tokenOwner2);
        (uint amountA_1, uint amountB_1) = router.removeLiquidity(
            address(tokenA),
            address(tokenB),
            1e18,
            0,
            0,
            tokenOwner2,
            block.timestamp + 100
        );

        assertEq(amountA_1, 1e18, "the amount of tokenA is not as expected");
        assertEq(amountB_1, 1e18, "the amount of tokenB is not as expected");

        pair = UniswapV2Pair(factory.getPair(address(tokenA), address(tokenB)));

        assertReserves(address(pair), 1e18, 1e18);
    }

    function test_Mint_burn_router() public {
        // first proportion with 1:1
        MintBootstrap();

        pair = UniswapV2Pair(factory.getPair(address(tokenA), address(tokenB)));

        // second proportion with 2:1
        vm.prank(tokenOwner);
        (uint _amountA_1, uint _amountB_1, uint _liquidity_1) = router.addLiquidity(
            address(tokenA),
            address(tokenB),
            2 * 10 ** 18,
            1 * 10 ** 18,
            0,
            0,
            tokenOwner,
            block.timestamp + 100
        );

        assertEq(_amountA_1, 1 * 10 ** 18, "the amount of tokenA is not as expected");
        assertEq(_amountB_1, 1 * 10 ** 18, "the amount of tokenB is not as expected");
        assertEq(_liquidity_1, 1e18, "the number of liquidity is not as expected");

        uint liquidity = pair.balanceOf(tokenOwner);
        assertEq(liquidity, 2e18 - 1000, "the number of liquidity is not as expected");

        vm.prank(tokenOwner);
        pair.approve(address(router), 1000e18);
        vm.prank(tokenOwner);
        (uint amountA_2, uint amountB_2) = router.removeLiquidity(
            address(tokenA),
            address(tokenB),
            2e18 - 1000,
            0,
            0,
            tokenOwner,
            block.timestamp + 100
        );

        assertEq(amountA_2, 2e18 - 1000, "the amount of tokenA is not as expected");
        assertEq(amountB_2, 2e18 - 1000, "the amount of tokenB is not as expected");

        assertReserves(address(pair), 1000, 1000);

    }

    function test_MintWrongProportion_burn_pair() public {
        // first proportion with 1:1
        MintBootstrap();

        pair = UniswapV2Pair(factory.getPair(address(tokenA), address(tokenB)));

        // second proportion with 2:1 use pair
        vm.prank(tokenOwner);
        tokenA.transfer(address(pair), 2e18);
        vm.prank(tokenOwner);
        tokenB.transfer(address(pair), 1e18);
        vm.prank(tokenOwner);
        uint _liquidity = pair.mint(tokenOwner);
        assertEq(_liquidity, 1e18);
        assertEq(2e18 - 1000, pair.balanceOf(tokenOwner), "UniswapV2Pair: mint() should return the number of LP tokens minted");
        assertEq(pair.totalSupply(), 2e18, "the total supply of LP tokens is not as expected");
        assertReserves(address(pair), 3e18, 2e18);

        // 将LP授权给router
        vm.prank(tokenOwner);
        pair.approve(address(router), 1000e18);
        vm.prank(tokenOwner);
        (uint amountA_2, uint amountB_2) = router.removeLiquidity(
            address(tokenA),
            address(tokenB),
            2e18 - 1000,
            0,
            0,
            tokenOwner,
            block.timestamp + 100
        );

        assertEq(amountA_2, 3e18 - 1500, "the amount of tokenA is not as expected");
        assertEq(amountB_2, 2e18 - 1000, "the amount of tokenB is not as expected");

        assertEq(pair.balanceOf(tokenOwner), 0, "the number of LP tokens is not as expected");
        
        assertReserves(address(pair), 1500, 1000);
    }

    // ------------------- swap -------------------
    // ExactTokensForTokens
    function test_Swap() public {
        // first
        MintBootstrap();
        pair = UniswapV2Pair(factory.getPair(address(tokenA), address(tokenB)));

        (uint112 _reserveIn, uint112 _reserveOut, ) = pair.getReserves();

        // swap: A->B
        address[] memory path = getPathForTokenToToken(address(tokenA), address(tokenB));

        uint deltaX = 1e18;
        vm.prank(tokenOwner);
        uint[] memory _amounts = router.swapExactTokensForTokens(
            1e18,
            0,
            path,
            tokenOwner,
            block.timestamp + 100
        );

        uint amountInWithFee = deltaX * 997;
        uint numerator = amountInWithFee * uint(_reserveOut);
        uint denominator = uint(_reserveIn) * 1000 + amountInWithFee;
        uint amountOut = numerator / denominator;

        assertEq(_amounts[0], deltaX, "the amount of tokenB is not as expected");
        assertEq(_amounts[1], amountOut, "the amount of tokenA is not as expected");

        assertReserves(address(pair), 2e18, uint112(1e18 - amountOut));
    }

    // TokensForExactTokens
    function test_Swap2() public {
        // first
        MintBootstrap();
        pair = UniswapV2Pair(factory.getPair(address(tokenA), address(tokenB)));

        (uint112 _reserveIn, uint112 _reserveOut, ) = pair.getReserves();

        // swap: A->B
        address[] memory path = getPathForTokenToToken(address(tokenA), address(tokenB));

        uint deltaY = 1e17;
        vm.prank(tokenOwner);
        uint[] memory _amounts = router.swapTokensForExactTokens(
            deltaY,
            1e18,
            path,
            tokenOwner,
            block.timestamp + 100
        );

        uint numerator = uint(_reserveIn) * deltaY * 1000;
        uint denominator = (uint(_reserveOut) - deltaY) * 997;
        uint amountIn = (numerator / denominator) + 1;

        assertEq(_amounts[0], amountIn, "the amount of tokenB is not as expected");
        assertEq(_amounts[1], deltaY, "the amount of tokenA is not as expected");

        assertReserves(address(pair), uint112(1e18 + amountIn), uint112(1e18 - deltaY));
    }
}