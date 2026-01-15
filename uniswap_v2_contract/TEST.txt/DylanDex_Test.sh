No files changed, compilation skipped

Ran 3 tests for test/DylanDex_Test.sol:DylanDex_Test
[PASS] test_Burn_TokenETH() (gas: 2088973)
Logs:
  RNT address:  0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f
  WETH address:  0x2e234DAe75C793f67A35089C9d99245E1C58470b
  token0:  0x2e234DAe75C793f67A35089C9d99245E1C58470b
  token1:  0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f

Traces:
  [2088973] DylanDex_Test::test_Burn_TokenETH()
    ├─ [0] VM::prank(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   └─ ← [Return] 
    ├─ [24349] RNTToken::approve(UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], 1000000000000000000000 [1e21])
    │   ├─ emit Approval(owner: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], spender: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], value: 1000000000000000000000 [1e21])
    │   └─ ← [Return] true
    ├─ [0] VM::prank(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   └─ ← [Return] 
    ├─ [1975565] UniswapV2Router02::addLiquidityETH{value: 1000000000000000000}(RNTToken: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], 1000000000000000000 [1e18], 0, 0, tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], 101)
    │   ├─ [2965] UniswapV2Factory::getPair(RNTToken: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], WETH9: [0x2e234DAe75C793f67A35089C9d99245E1C58470b]) [staticcall]
    │   │   └─ ← [Return] 0x0000000000000000000000000000000000000000
    │   ├─ [1737916] UniswapV2Factory::createPair(RNTToken: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], WETH9: [0x2e234DAe75C793f67A35089C9d99245E1C58470b])
    │   │   ├─ [1566515] → new UniswapV2Pair@0x0a250Eaf504976df78FE4839F5459e6cCB2420D5
    │   │   │   └─ ← [Return] 7490 bytes of code
    │   │   ├─ [44896] UniswapV2Pair::initialize(WETH9: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], RNTToken: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f])
    │   │   │   └─ ← [Return] 
    │   │   ├─ emit PairCreated(token0: WETH9: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], token1: RNTToken: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], pair: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], : 1)
    │   │   └─ ← [Return] UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]
    │   ├─ [2437] UniswapV2Pair::getReserves() [staticcall]
    │   │   └─ ← [Return] 0, 0, 0
    │   ├─ [30244] RNTToken::transferFrom(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], 1000000000000000000 [1e18])
    │   │   ├─ emit Transfer(from: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], to: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], value: 1000000000000000000 [1e18])
    │   │   └─ ← [Return] true
    │   ├─ [23999] WETH9::deposit{value: 1000000000000000000}()
    │   │   ├─ emit Deposit(dst: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], wad: 1000000000000000000 [1e18])
    │   │   └─ ← [Return] 
    │   ├─ [25136] WETH9::transfer(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], 1000000000000000000 [1e18])
    │   │   ├─ emit Transfer(from: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], to: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], value: 1000000000000000000 [1e18])
    │   │   └─ ← [Return] true
    │   ├─ [134281] UniswapV2Pair::mint(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   │   ├─ [560] WETH9::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
    │   │   │   └─ ← [Return] 1000000000000000000 [1e18]
    │   │   ├─ [541] RNTToken::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
    │   │   │   └─ ← [Return] 1000000000000000000 [1e18]
    │   │   ├─ [2295] UniswapV2Factory::feeTo() [staticcall]
    │   │   │   └─ ← [Return] 0x0000000000000000000000000000000000000000
    │   │   ├─ emit Transfer(from: 0x0000000000000000000000000000000000000000, to: 0x0000000000000000000000000000000000000000, value: 1000)
    │   │   ├─ emit Transfer(from: 0x0000000000000000000000000000000000000000, to: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], value: 999999999999999000 [9.999e17])
    │   │   ├─ emit Sync(reserve0: 1000000000000000000 [1e18], reserve1: 1000000000000000000 [1e18])
    │   │   ├─ emit Mint(sender: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], amount0: 1000000000000000000 [1e18], amount1: 1000000000000000000 [1e18])
    │   │   └─ ← [Return] 999999999999999000 [9.999e17]
    │   └─ ← [Return] 1000000000000000000 [1e18], 1000000000000000000 [1e18], 999999999999999000 [9.999e17]
    ├─ [0] VM::assertEq(1000000000000000000 [1e18], 1000000000000000000 [1e18], "the amount of tokenA is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [0] VM::assertEq(1000000000000000000 [1e18], 1000000000000000000 [1e18], "the amount of tokenB is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [965] UniswapV2Factory::getPair(RNTToken: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], WETH9: [0x2e234DAe75C793f67A35089C9d99245E1C58470b]) [staticcall]
    │   └─ ← [Return] UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]
    ├─ [717] UniswapV2Pair::balanceOf(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1]) [staticcall]
    │   └─ ← [Return] 999999999999999000 [9.999e17]
    ├─ [0] VM::assertEq(999999999999999000 [9.999e17], 999999999999999000 [9.999e17], "UniswapV2Pair: mint() should return the number of LP tokens minted") [staticcall]
    │   └─ ← [Return] 
    ├─ [0] VM::assertEq(999999999999999000 [9.999e17], 999999999999999000 [9.999e17], "the number of liquidity is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [365] UniswapV2Pair::totalSupply() [staticcall]
    │   └─ ← [Return] 1000000000000000000 [1e18]
    ├─ [0] VM::assertEq(1000000000000000000 [1e18], 1000000000000000000 [1e18], "the total supply of LP tokens is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [437] UniswapV2Pair::getReserves() [staticcall]
    │   └─ ← [Return] 1000000000000000000 [1e18], 1000000000000000000 [1e18], 1
    ├─ [0] VM::assertEq(1000000000000000000 [1e18], 1000000000000000000 [1e18], "reserve0 is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [0] VM::assertEq(1000000000000000000 [1e18], 1000000000000000000 [1e18], "reserve1 is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [0] VM::prank(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   └─ ← [Return] 
    ├─ [24380] UniswapV2Pair::approve(UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], 1000000000000000000000 [1e21])
    │   ├─ emit Approval(owner: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], spender: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], value: 1000000000000000000000 [1e21])
    │   └─ ← [Return] true
    ├─ [0] VM::prank(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   └─ ← [Return] 
    ├─ [131585] UniswapV2Router02::removeLiquidityETH(RNTToken: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], 999999999999999000 [9.999e17], 0, 0, tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], 101)
    │   ├─ [25811] UniswapV2Pair::transferFrom(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], 999999999999999000 [9.999e17])
    │   │   ├─ emit Transfer(from: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], to: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], value: 999999999999999000 [9.999e17])
    │   │   └─ ← [Return] true
    │   ├─ [83012] UniswapV2Pair::burn(UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C])
    │   │   ├─ [560] WETH9::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
    │   │   │   └─ ← [Return] 1000000000000000000 [1e18]
    │   │   ├─ [541] RNTToken::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
    │   │   │   └─ ← [Return] 1000000000000000000 [1e18]
    │   │   ├─ [295] UniswapV2Factory::feeTo() [staticcall]
    │   │   │   └─ ← [Return] 0x0000000000000000000000000000000000000000
    │   │   ├─ emit Transfer(from: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], to: 0x0000000000000000000000000000000000000000, value: 999999999999999000 [9.999e17])
    │   │   ├─ [23136] WETH9::transfer(UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], 999999999999999000 [9.999e17])
    │   │   │   ├─ emit Transfer(from: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], to: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], value: 999999999999999000 [9.999e17])
    │   │   │   └─ ← [Return] true
    │   │   ├─ [24855] RNTToken::transfer(UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], 999999999999999000 [9.999e17])
    │   │   │   ├─ emit Transfer(from: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], to: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], value: 999999999999999000 [9.999e17])
    │   │   │   └─ ← [Return] true
    │   │   ├─ [560] WETH9::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
    │   │   │   └─ ← [Return] 1000
    │   │   ├─ [541] RNTToken::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
    │   │   │   └─ ← [Return] 1000
    │   │   ├─ emit Sync(reserve0: 1000, reserve1: 1000)
    │   │   ├─ emit Burn(sender: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], amount0: 999999999999999000 [9.999e17], amount1: 999999999999999000 [9.999e17], to: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C])
    │   │   └─ ← [Return] 999999999999999000 [9.999e17], 999999999999999000 [9.999e17]
    │   ├─ [2955] RNTToken::transfer(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], 999999999999999000 [9.999e17])
    │   │   ├─ emit Transfer(from: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], to: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], value: 999999999999999000 [9.999e17])
    │   │   └─ ← [Return] true
    │   ├─ [9204] WETH9::withdraw(999999999999999000 [9.999e17])
    │   │   ├─ [138] UniswapV2Router02::receive{value: 999999999999999000}()
    │   │   │   └─ ← [Stop] 
    │   │   ├─ emit Withdrawal(src: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], wad: 999999999999999000 [9.999e17])
    │   │   └─ ← [Return] 
    │   ├─ [0] tokenOwner::fallback{value: 999999999999999000}()
    │   │   └─ ← [Stop] 
    │   └─ ← [Return] 999999999999999000 [9.999e17], 999999999999999000 [9.999e17]
    ├─ [0] VM::assertEq(999999999999999000 [9.999e17], 999999999999999000 [9.999e17], "the amount of tokenA is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [0] VM::assertEq(999999999999999000 [9.999e17], 999999999999999000 [9.999e17], "the amount of tokenB is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [717] UniswapV2Pair::balanceOf(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1]) [staticcall]
    │   └─ ← [Return] 0
    ├─ [0] VM::assertEq(0, 0, "the number of LP tokens is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [965] UniswapV2Factory::getPair(RNTToken: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], WETH9: [0x2e234DAe75C793f67A35089C9d99245E1C58470b]) [staticcall]
    │   └─ ← [Return] UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]
    ├─ [437] UniswapV2Pair::getReserves() [staticcall]
    │   └─ ← [Return] 1000, 1000, 1
    ├─ [0] VM::assertEq(1000, 1000, "reserve0 is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [0] VM::assertEq(1000, 1000, "reserve1 is not as expected") [staticcall]
    │   └─ ← [Return] 
    └─ ← [Return] 

[PASS] test_swap_ETH_to_token() (gas: 2087907)
Logs:
  RNT address:  0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f
  WETH address:  0x2e234DAe75C793f67A35089C9d99245E1C58470b
  token0:  0x2e234DAe75C793f67A35089C9d99245E1C58470b
  token1:  0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f

Traces:
  [2087907] DylanDex_Test::test_swap_ETH_to_token()
    ├─ [0] VM::prank(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   └─ ← [Return] 
    ├─ [24349] RNTToken::approve(UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], 1000000000000000000000 [1e21])
    │   ├─ emit Approval(owner: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], spender: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], value: 1000000000000000000000 [1e21])
    │   └─ ← [Return] true
    ├─ [0] VM::prank(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   └─ ← [Return] 
    ├─ [1975565] UniswapV2Router02::addLiquidityETH{value: 1000000000000000000}(RNTToken: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], 1000000000000000000 [1e18], 0, 0, tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], 101)
    │   ├─ [2965] UniswapV2Factory::getPair(RNTToken: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], WETH9: [0x2e234DAe75C793f67A35089C9d99245E1C58470b]) [staticcall]
    │   │   └─ ← [Return] 0x0000000000000000000000000000000000000000
    │   ├─ [1737916] UniswapV2Factory::createPair(RNTToken: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], WETH9: [0x2e234DAe75C793f67A35089C9d99245E1C58470b])
    │   │   ├─ [1566515] → new UniswapV2Pair@0x0a250Eaf504976df78FE4839F5459e6cCB2420D5
    │   │   │   └─ ← [Return] 7490 bytes of code
    │   │   ├─ [44896] UniswapV2Pair::initialize(WETH9: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], RNTToken: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f])
    │   │   │   └─ ← [Return] 
    │   │   ├─ emit PairCreated(token0: WETH9: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], token1: RNTToken: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], pair: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], : 1)
    │   │   └─ ← [Return] UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]
    │   ├─ [2437] UniswapV2Pair::getReserves() [staticcall]
    │   │   └─ ← [Return] 0, 0, 0
    │   ├─ [30244] RNTToken::transferFrom(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], 1000000000000000000 [1e18])
    │   │   ├─ emit Transfer(from: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], to: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], value: 1000000000000000000 [1e18])
    │   │   └─ ← [Return] true
    │   ├─ [23999] WETH9::deposit{value: 1000000000000000000}()
    │   │   ├─ emit Deposit(dst: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], wad: 1000000000000000000 [1e18])
    │   │   └─ ← [Return] 
    │   ├─ [25136] WETH9::transfer(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], 1000000000000000000 [1e18])
    │   │   ├─ emit Transfer(from: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], to: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], value: 1000000000000000000 [1e18])
    │   │   └─ ← [Return] true
    │   ├─ [134281] UniswapV2Pair::mint(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   │   ├─ [560] WETH9::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
    │   │   │   └─ ← [Return] 1000000000000000000 [1e18]
    │   │   ├─ [541] RNTToken::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
    │   │   │   └─ ← [Return] 1000000000000000000 [1e18]
    │   │   ├─ [2295] UniswapV2Factory::feeTo() [staticcall]
    │   │   │   └─ ← [Return] 0x0000000000000000000000000000000000000000
    │   │   ├─ emit Transfer(from: 0x0000000000000000000000000000000000000000, to: 0x0000000000000000000000000000000000000000, value: 1000)
    │   │   ├─ emit Transfer(from: 0x0000000000000000000000000000000000000000, to: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], value: 999999999999999000 [9.999e17])
    │   │   ├─ emit Sync(reserve0: 1000000000000000000 [1e18], reserve1: 1000000000000000000 [1e18])
    │   │   ├─ emit Mint(sender: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], amount0: 1000000000000000000 [1e18], amount1: 1000000000000000000 [1e18])
    │   │   └─ ← [Return] 999999999999999000 [9.999e17]
    │   └─ ← [Return] 1000000000000000000 [1e18], 1000000000000000000 [1e18], 999999999999999000 [9.999e17]
    ├─ [0] VM::assertEq(1000000000000000000 [1e18], 1000000000000000000 [1e18], "the amount of tokenA is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [0] VM::assertEq(1000000000000000000 [1e18], 1000000000000000000 [1e18], "the amount of tokenB is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [965] UniswapV2Factory::getPair(RNTToken: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], WETH9: [0x2e234DAe75C793f67A35089C9d99245E1C58470b]) [staticcall]
    │   └─ ← [Return] UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]
    ├─ [717] UniswapV2Pair::balanceOf(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1]) [staticcall]
    │   └─ ← [Return] 999999999999999000 [9.999e17]
    ├─ [0] VM::assertEq(999999999999999000 [9.999e17], 999999999999999000 [9.999e17], "UniswapV2Pair: mint() should return the number of LP tokens minted") [staticcall]
    │   └─ ← [Return] 
    ├─ [0] VM::assertEq(999999999999999000 [9.999e17], 999999999999999000 [9.999e17], "the number of liquidity is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [365] UniswapV2Pair::totalSupply() [staticcall]
    │   └─ ← [Return] 1000000000000000000 [1e18]
    ├─ [0] VM::assertEq(1000000000000000000 [1e18], 1000000000000000000 [1e18], "the total supply of LP tokens is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [437] UniswapV2Pair::getReserves() [staticcall]
    │   └─ ← [Return] 1000000000000000000 [1e18], 1000000000000000000 [1e18], 1
    ├─ [0] VM::assertEq(1000000000000000000 [1e18], 1000000000000000000 [1e18], "reserve0 is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [0] VM::assertEq(1000000000000000000 [1e18], 1000000000000000000 [1e18], "reserve1 is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [965] UniswapV2Factory::getPair(RNTToken: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], WETH9: [0x2e234DAe75C793f67A35089C9d99245E1C58470b]) [staticcall]
    │   └─ ← [Return] UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]
    ├─ [437] UniswapV2Pair::getReserves() [staticcall]
    │   └─ ← [Return] 1000000000000000000 [1e18], 1000000000000000000 [1e18], 1
    ├─ [0] VM::prank(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   └─ ← [Return] 
    ├─ [85550] DylanDex::sellETH{value: 1000000000000000000}(RNTToken: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], 0)
    │   ├─ [74546] UniswapV2Router02::swapExactETHForTokens{value: 1000000000000000000}(0, [0x2e234DAe75C793f67A35089C9d99245E1C58470b, 0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], 1)
    │   │   ├─ [437] UniswapV2Pair::getReserves() [staticcall]
    │   │   │   └─ ← [Return] 1000000000000000000 [1e18], 1000000000000000000 [1e18], 1
    │   │   ├─ [21999] WETH9::deposit{value: 1000000000000000000}()
    │   │   │   ├─ emit Deposit(dst: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], wad: 1000000000000000000 [1e18])
    │   │   │   └─ ← [Return] 
    │   │   ├─ [3236] WETH9::transfer(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], 1000000000000000000 [1e18])
    │   │   │   ├─ emit Transfer(from: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], to: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], value: 1000000000000000000 [1e18])
    │   │   │   └─ ← [Return] true
    │   │   ├─ [32568] UniswapV2Pair::swap(0, 499248873309964947 [4.992e17], tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], 0x)
    │   │   │   ├─ [2955] RNTToken::transfer(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], 499248873309964947 [4.992e17])
    │   │   │   │   ├─ emit Transfer(from: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], to: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], value: 499248873309964947 [4.992e17])
    │   │   │   │   └─ ← [Return] true
    │   │   │   ├─ [560] WETH9::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
    │   │   │   │   └─ ← [Return] 2000000000000000000 [2e18]
    │   │   │   ├─ [541] RNTToken::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
    │   │   │   │   └─ ← [Return] 500751126690035053 [5.007e17]
    │   │   │   ├─ emit Sync(reserve0: 2000000000000000000 [2e18], reserve1: 500751126690035053 [5.007e17])
    │   │   │   ├─ emit Swap(sender: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], amount0In: 1000000000000000000 [1e18], amount1In: 0, amount0Out: 0, amount1Out: 499248873309964947 [4.992e17], to: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   │   │   └─ ← [Return] 
    │   │   └─ ← [Return] [1000000000000000000 [1e18], 499248873309964947 [4.992e17]]
    │   ├─ emit ETHSold(seller: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], buyToken: RNTToken: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], ethAmount: 1000000000000000000 [1e18], buyTokenAmount: 499248873309964947 [4.992e17])
    │   └─ ← [Return] [1000000000000000000 [1e18], 499248873309964947 [4.992e17]]
    ├─ [0] VM::assertEq(1000000000000000000 [1e18], 1000000000000000000 [1e18], "the amount of tokenB is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [0] VM::assertEq(499248873309964947 [4.992e17], 499248873309964947 [4.992e17], "the amount of tokenA is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [437] UniswapV2Pair::getReserves() [staticcall]
    │   └─ ← [Return] 2000000000000000000 [2e18], 500751126690035053 [5.007e17], 1
    ├─ [0] VM::assertEq(2000000000000000000 [2e18], 2000000000000000000 [2e18], "reserve0 is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [0] VM::assertEq(500751126690035053 [5.007e17], 500751126690035053 [5.007e17], "reserve1 is not as expected") [staticcall]
    │   └─ ← [Return] 
    └─ ← [Return] 

[PASS] test_swap_token_to_ETH() (gas: 2126873)
Logs:
  RNT address:  0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f
  WETH address:  0x2e234DAe75C793f67A35089C9d99245E1C58470b
  token0:  0x2e234DAe75C793f67A35089C9d99245E1C58470b
  token1:  0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f

Traces:
  [2126873] DylanDex_Test::test_swap_token_to_ETH()
    ├─ [0] VM::prank(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   └─ ← [Return] 
    ├─ [24349] RNTToken::approve(UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], 1000000000000000000000 [1e21])
    │   ├─ emit Approval(owner: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], spender: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], value: 1000000000000000000000 [1e21])
    │   └─ ← [Return] true
    ├─ [0] VM::prank(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   └─ ← [Return] 
    ├─ [1975565] UniswapV2Router02::addLiquidityETH{value: 1000000000000000000}(RNTToken: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], 1000000000000000000 [1e18], 0, 0, tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], 101)
    │   ├─ [2965] UniswapV2Factory::getPair(RNTToken: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], WETH9: [0x2e234DAe75C793f67A35089C9d99245E1C58470b]) [staticcall]
    │   │   └─ ← [Return] 0x0000000000000000000000000000000000000000
    │   ├─ [1737916] UniswapV2Factory::createPair(RNTToken: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], WETH9: [0x2e234DAe75C793f67A35089C9d99245E1C58470b])
    │   │   ├─ [1566515] → new UniswapV2Pair@0x0a250Eaf504976df78FE4839F5459e6cCB2420D5
    │   │   │   └─ ← [Return] 7490 bytes of code
    │   │   ├─ [44896] UniswapV2Pair::initialize(WETH9: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], RNTToken: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f])
    │   │   │   └─ ← [Return] 
    │   │   ├─ emit PairCreated(token0: WETH9: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], token1: RNTToken: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], pair: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], : 1)
    │   │   └─ ← [Return] UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]
    │   ├─ [2437] UniswapV2Pair::getReserves() [staticcall]
    │   │   └─ ← [Return] 0, 0, 0
    │   ├─ [30244] RNTToken::transferFrom(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], 1000000000000000000 [1e18])
    │   │   ├─ emit Transfer(from: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], to: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], value: 1000000000000000000 [1e18])
    │   │   └─ ← [Return] true
    │   ├─ [23999] WETH9::deposit{value: 1000000000000000000}()
    │   │   ├─ emit Deposit(dst: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], wad: 1000000000000000000 [1e18])
    │   │   └─ ← [Return] 
    │   ├─ [25136] WETH9::transfer(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], 1000000000000000000 [1e18])
    │   │   ├─ emit Transfer(from: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], to: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], value: 1000000000000000000 [1e18])
    │   │   └─ ← [Return] true
    │   ├─ [134281] UniswapV2Pair::mint(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   │   ├─ [560] WETH9::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
    │   │   │   └─ ← [Return] 1000000000000000000 [1e18]
    │   │   ├─ [541] RNTToken::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
    │   │   │   └─ ← [Return] 1000000000000000000 [1e18]
    │   │   ├─ [2295] UniswapV2Factory::feeTo() [staticcall]
    │   │   │   └─ ← [Return] 0x0000000000000000000000000000000000000000
    │   │   ├─ emit Transfer(from: 0x0000000000000000000000000000000000000000, to: 0x0000000000000000000000000000000000000000, value: 1000)
    │   │   ├─ emit Transfer(from: 0x0000000000000000000000000000000000000000, to: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], value: 999999999999999000 [9.999e17])
    │   │   ├─ emit Sync(reserve0: 1000000000000000000 [1e18], reserve1: 1000000000000000000 [1e18])
    │   │   ├─ emit Mint(sender: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], amount0: 1000000000000000000 [1e18], amount1: 1000000000000000000 [1e18])
    │   │   └─ ← [Return] 999999999999999000 [9.999e17]
    │   └─ ← [Return] 1000000000000000000 [1e18], 1000000000000000000 [1e18], 999999999999999000 [9.999e17]
    ├─ [0] VM::assertEq(1000000000000000000 [1e18], 1000000000000000000 [1e18], "the amount of tokenA is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [0] VM::assertEq(1000000000000000000 [1e18], 1000000000000000000 [1e18], "the amount of tokenB is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [965] UniswapV2Factory::getPair(RNTToken: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], WETH9: [0x2e234DAe75C793f67A35089C9d99245E1C58470b]) [staticcall]
    │   └─ ← [Return] UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]
    ├─ [717] UniswapV2Pair::balanceOf(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1]) [staticcall]
    │   └─ ← [Return] 999999999999999000 [9.999e17]
    ├─ [0] VM::assertEq(999999999999999000 [9.999e17], 999999999999999000 [9.999e17], "UniswapV2Pair: mint() should return the number of LP tokens minted") [staticcall]
    │   └─ ← [Return] 
    ├─ [0] VM::assertEq(999999999999999000 [9.999e17], 999999999999999000 [9.999e17], "the number of liquidity is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [365] UniswapV2Pair::totalSupply() [staticcall]
    │   └─ ← [Return] 1000000000000000000 [1e18]
    ├─ [0] VM::assertEq(1000000000000000000 [1e18], 1000000000000000000 [1e18], "the total supply of LP tokens is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [437] UniswapV2Pair::getReserves() [staticcall]
    │   └─ ← [Return] 1000000000000000000 [1e18], 1000000000000000000 [1e18], 1
    ├─ [0] VM::assertEq(1000000000000000000 [1e18], 1000000000000000000 [1e18], "reserve0 is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [0] VM::assertEq(1000000000000000000 [1e18], 1000000000000000000 [1e18], "reserve1 is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [965] UniswapV2Factory::getPair(RNTToken: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], WETH9: [0x2e234DAe75C793f67A35089C9d99245E1C58470b]) [staticcall]
    │   └─ ← [Return] UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]
    ├─ [437] UniswapV2Pair::getReserves() [staticcall]
    │   └─ ← [Return] 1000000000000000000 [1e18], 1000000000000000000 [1e18], 1
    ├─ [0] VM::prank(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   └─ ← [Return] 
    ├─ [24349] RNTToken::approve(DylanDex: [0xF62849F9A0B5Bf2913b396098F7c7019b51A820a], 1000000000000000000000 [1e21])
    │   ├─ emit Approval(owner: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], spender: DylanDex: [0xF62849F9A0B5Bf2913b396098F7c7019b51A820a], value: 1000000000000000000000 [1e21])
    │   └─ ← [Return] true
    ├─ [0] VM::prank(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   └─ ← [Return] 
    ├─ [145061] DylanDex::buyETH(RNTToken: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], 1000000000000000000 [1e18], 0)
    │   ├─ [25444] RNTToken::transferFrom(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], DylanDex: [0xF62849F9A0B5Bf2913b396098F7c7019b51A820a], 1000000000000000000 [1e18])
    │   │   ├─ emit Transfer(from: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], to: DylanDex: [0xF62849F9A0B5Bf2913b396098F7c7019b51A820a], value: 1000000000000000000 [1e18])
    │   │   └─ ← [Return] true
    │   ├─ [24349] RNTToken::approve(UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], 1000000000000000000 [1e18])
    │   │   ├─ emit Approval(owner: DylanDex: [0xF62849F9A0B5Bf2913b396098F7c7019b51A820a], spender: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], value: 1000000000000000000 [1e18])
    │   │   └─ ← [Return] true
    │   ├─ [83117] UniswapV2Router02::swapExactTokensForETH(1000000000000000000 [1e18], 0, [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f, 0x2e234DAe75C793f67A35089C9d99245E1C58470b], DylanDex: [0xF62849F9A0B5Bf2913b396098F7c7019b51A820a], 1)
    │   │   ├─ [437] UniswapV2Pair::getReserves() [staticcall]
    │   │   │   └─ ← [Return] 1000000000000000000 [1e18], 1000000000000000000 [1e18], 1
    │   │   ├─ [3544] RNTToken::transferFrom(DylanDex: [0xF62849F9A0B5Bf2913b396098F7c7019b51A820a], UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], 1000000000000000000 [1e18])
    │   │   │   ├─ emit Transfer(from: DylanDex: [0xF62849F9A0B5Bf2913b396098F7c7019b51A820a], to: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], value: 1000000000000000000 [1e18])
    │   │   │   └─ ← [Return] true
    │   │   ├─ [52749] UniswapV2Pair::swap(499248873309964947 [4.992e17], 0, UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], 0x)
    │   │   │   ├─ [23136] WETH9::transfer(UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], 499248873309964947 [4.992e17])
    │   │   │   │   ├─ emit Transfer(from: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], to: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], value: 499248873309964947 [4.992e17])
    │   │   │   │   └─ ← [Return] true
    │   │   │   ├─ [560] WETH9::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
    │   │   │   │   └─ ← [Return] 500751126690035053 [5.007e17]
    │   │   │   ├─ [541] RNTToken::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
    │   │   │   │   └─ ← [Return] 2000000000000000000 [2e18]
    │   │   │   ├─ emit Sync(reserve0: 500751126690035053 [5.007e17], reserve1: 2000000000000000000 [2e18])
    │   │   │   ├─ emit Swap(sender: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], amount0In: 0, amount1In: 1000000000000000000 [1e18], amount0Out: 499248873309964947 [4.992e17], amount1Out: 0, to: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C])
    │   │   │   └─ ← [Return] 
    │   │   ├─ [9204] WETH9::withdraw(499248873309964947 [4.992e17])
    │   │   │   ├─ [138] UniswapV2Router02::receive{value: 499248873309964947}()
    │   │   │   │   └─ ← [Stop] 
    │   │   │   ├─ emit Withdrawal(src: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], wad: 499248873309964947 [4.992e17])
    │   │   │   └─ ← [Return] 
    │   │   ├─ [83] DylanDex::receive{value: 499248873309964947}()
    │   │   │   └─ ← [Stop] 
    │   │   └─ ← [Return] [1000000000000000000 [1e18], 499248873309964947 [4.992e17]]
    │   ├─ [0] tokenOwner::fallback{value: 499248873309964947}()
    │   │   └─ ← [Stop] 
    │   ├─ emit ETHBought(user: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], sellToken: RNTToken: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], tokenAmount: 1000000000000000000 [1e18], ethAmount: 499248873309964947 [4.992e17])
    │   └─ ← [Return] [1000000000000000000 [1e18], 499248873309964947 [4.992e17]]
    ├─ [0] VM::assertEq(1000000000000000000 [1e18], 1000000000000000000 [1e18], "the amount of tokenB is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [0] VM::assertEq(499248873309964947 [4.992e17], 499248873309964947 [4.992e17], "the amount of tokenA is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [437] UniswapV2Pair::getReserves() [staticcall]
    │   └─ ← [Return] 500751126690035053 [5.007e17], 2000000000000000000 [2e18], 1
    ├─ [0] VM::assertEq(500751126690035053 [5.007e17], 500751126690035053 [5.007e17], "reserve0 is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [0] VM::assertEq(2000000000000000000 [2e18], 2000000000000000000 [2e18], "reserve1 is not as expected") [staticcall]
    │   └─ ← [Return] 
    └─ ← [Return] 

Suite result: ok. 3 passed; 0 failed; 0 skipped; finished in 6.95ms (3.87ms CPU time)

Ran 1 test suite in 2872.99s (6.95ms CPU time): 3 tests passed, 0 failed, 0 skipped (3 total tests)
