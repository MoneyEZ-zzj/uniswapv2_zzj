Compiling 1 files with Solc 0.8.20
Solc 0.8.20 finished in 66.32s
Compiler run successful!

Ran 9 tests for test/TokensForTokens_Test.sol:TokensForTokens_Test
[PASS] test_Burn() (gas: 2080204)
Traces:
  [2080204] TokensForTokens_Test::test_Burn()
    ├─ [0] VM::prank(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   └─ ← [Return] 
    ├─ [24349] ERC20Mintable::approve(UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], 1000000000000000000000 [1e21])
    │   ├─ emit Approval(owner: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], spender: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], value: 1000000000000000000000 [1e21])
    │   └─ ← [Return] true
    ├─ [0] VM::prank(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   └─ ← [Return] 
    ├─ [24349] ERC20Mintable::approve(UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], 1000000000000000000000 [1e21])
    │   ├─ emit Approval(owner: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], spender: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], value: 1000000000000000000000 [1e21])
    │   └─ ← [Return] true
    ├─ [0] VM::prank(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   └─ ← [Return] 
    ├─ [1947293] UniswapV2Router02::addLiquidity(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], 1000000000000000000 [1e18], 1000000000000000000 [1e18], 0, 0, tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], 101)
    │   ├─ [2965] UniswapV2Factory::getPair(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f]) [staticcall]
    │   │   └─ ← [Return] 0x0000000000000000000000000000000000000000
    │   ├─ [1737907] UniswapV2Factory::createPair(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f])
    │   │   ├─ [1566515] → new UniswapV2Pair@0x0a250Eaf504976df78FE4839F5459e6cCB2420D5
    │   │   │   └─ ← [Return] 7490 bytes of code
    │   │   ├─ [44896] UniswapV2Pair::initialize(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f])
    │   │   │   └─ ← [Return] 
    │   │   ├─ emit PairCreated(token0: ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], token1: ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], pair: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], : 1)
    │   │   └─ ← [Return] UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]
    │   ├─ [2437] UniswapV2Pair::getReserves() [staticcall]
    │   │   └─ ← [Return] 0, 0, 0
    │   ├─ [30244] ERC20Mintable::transferFrom(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], 1000000000000000000 [1e18])
    │   │   ├─ emit Transfer(from: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], to: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], value: 1000000000000000000 [1e18])
    │   │   └─ ← [Return] true
    │   ├─ [30244] ERC20Mintable::transferFrom(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], 1000000000000000000 [1e18])
    │   │   ├─ emit Transfer(from: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], to: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], value: 1000000000000000000 [1e18])
    │   │   └─ ← [Return] true
    │   ├─ [134262] UniswapV2Pair::mint(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   │   ├─ [541] ERC20Mintable::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
    │   │   │   └─ ← [Return] 1000000000000000000 [1e18]
    │   │   ├─ [541] ERC20Mintable::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
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
    ├─ [965] UniswapV2Factory::getPair(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f]) [staticcall]
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
    ├─ [69643] UniswapV2Router02::removeLiquidity(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], 999999999999999000 [9.999e17], 0, 0, tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], 101)
    │   ├─ [25811] UniswapV2Pair::transferFrom(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], 999999999999999000 [9.999e17])
    │   │   ├─ emit Transfer(from: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], to: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], value: 999999999999999000 [9.999e17])
    │   │   └─ ← [Return] true
    │   ├─ [40893] UniswapV2Pair::burn(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   │   ├─ [541] ERC20Mintable::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
    │   │   │   └─ ← [Return] 1000000000000000000 [1e18]
    │   │   ├─ [541] ERC20Mintable::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
    │   │   │   └─ ← [Return] 1000000000000000000 [1e18]
    │   │   ├─ [295] UniswapV2Factory::feeTo() [staticcall]
    │   │   │   └─ ← [Return] 0x0000000000000000000000000000000000000000
    │   │   ├─ emit Transfer(from: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], to: 0x0000000000000000000000000000000000000000, value: 999999999999999000 [9.999e17])
    │   │   ├─ [2955] ERC20Mintable::transfer(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], 999999999999999000 [9.999e17])
    │   │   │   ├─ emit Transfer(from: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], to: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], value: 999999999999999000 [9.999e17])
    │   │   │   └─ ← [Return] true
    │   │   ├─ [2955] ERC20Mintable::transfer(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], 999999999999999000 [9.999e17])
    │   │   │   ├─ emit Transfer(from: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], to: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], value: 999999999999999000 [9.999e17])
    │   │   │   └─ ← [Return] true
    │   │   ├─ [541] ERC20Mintable::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
    │   │   │   └─ ← [Return] 1000
    │   │   ├─ [541] ERC20Mintable::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
    │   │   │   └─ ← [Return] 1000
    │   │   ├─ emit Sync(reserve0: 1000, reserve1: 1000)
    │   │   ├─ emit Burn(sender: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], amount0: 999999999999999000 [9.999e17], amount1: 999999999999999000 [9.999e17], to: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   │   └─ ← [Return] 999999999999999000 [9.999e17], 999999999999999000 [9.999e17]
    │   └─ ← [Return] 999999999999999000 [9.999e17], 999999999999999000 [9.999e17]
    ├─ [0] VM::assertEq(999999999999999000 [9.999e17], 999999999999999000 [9.999e17], "the amount of tokenA is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [0] VM::assertEq(999999999999999000 [9.999e17], 999999999999999000 [9.999e17], "the amount of tokenB is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [717] UniswapV2Pair::balanceOf(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1]) [staticcall]
    │   └─ ← [Return] 0
    ├─ [0] VM::assertEq(0, 0, "the number of LP tokens is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [965] UniswapV2Factory::getPair(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f]) [staticcall]
    │   └─ ← [Return] UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]
    ├─ [437] UniswapV2Pair::getReserves() [staticcall]
    │   └─ ← [Return] 1000, 1000, 1
    ├─ [0] VM::assertEq(1000, 1000, "reserve0 is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [0] VM::assertEq(1000, 1000, "reserve1 is not as expected") [staticcall]
    │   └─ ← [Return] 
    └─ ← [Return] 

[PASS] test_MintMoreLiquidity() (gas: 2073162)
Traces:
  [2073162] TokensForTokens_Test::test_MintMoreLiquidity()
    ├─ [0] VM::prank(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   └─ ← [Return] 
    ├─ [24349] ERC20Mintable::approve(UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], 1000000000000000000000 [1e21])
    │   ├─ emit Approval(owner: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], spender: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], value: 1000000000000000000000 [1e21])
    │   └─ ← [Return] true
    ├─ [0] VM::prank(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   └─ ← [Return] 
    ├─ [24349] ERC20Mintable::approve(UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], 1000000000000000000000 [1e21])
    │   ├─ emit Approval(owner: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], spender: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], value: 1000000000000000000000 [1e21])
    │   └─ ← [Return] true
    ├─ [0] VM::prank(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   └─ ← [Return] 
    ├─ [1947293] UniswapV2Router02::addLiquidity(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], 1000000000000000000 [1e18], 1000000000000000000 [1e18], 0, 0, tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], 101)
    │   ├─ [2965] UniswapV2Factory::getPair(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f]) [staticcall]
    │   │   └─ ← [Return] 0x0000000000000000000000000000000000000000
    │   ├─ [1737907] UniswapV2Factory::createPair(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f])
    │   │   ├─ [1566515] → new UniswapV2Pair@0x0a250Eaf504976df78FE4839F5459e6cCB2420D5
    │   │   │   └─ ← [Return] 7490 bytes of code
    │   │   ├─ [44896] UniswapV2Pair::initialize(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f])
    │   │   │   └─ ← [Return] 
    │   │   ├─ emit PairCreated(token0: ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], token1: ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], pair: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], : 1)
    │   │   └─ ← [Return] UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]
    │   ├─ [2437] UniswapV2Pair::getReserves() [staticcall]
    │   │   └─ ← [Return] 0, 0, 0
    │   ├─ [30244] ERC20Mintable::transferFrom(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], 1000000000000000000 [1e18])
    │   │   ├─ emit Transfer(from: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], to: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], value: 1000000000000000000 [1e18])
    │   │   └─ ← [Return] true
    │   ├─ [30244] ERC20Mintable::transferFrom(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], 1000000000000000000 [1e18])
    │   │   ├─ emit Transfer(from: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], to: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], value: 1000000000000000000 [1e18])
    │   │   └─ ← [Return] true
    │   ├─ [134262] UniswapV2Pair::mint(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   │   ├─ [541] ERC20Mintable::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
    │   │   │   └─ ← [Return] 1000000000000000000 [1e18]
    │   │   ├─ [541] ERC20Mintable::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
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
    ├─ [965] UniswapV2Factory::getPair(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f]) [staticcall]
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
    ├─ [45882] UniswapV2Router02::addLiquidity(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], 2000000000000000000 [2e18], 2000000000000000000 [2e18], 0, 0, tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], 101)
    │   ├─ [965] UniswapV2Factory::getPair(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f]) [staticcall]
    │   │   └─ ← [Return] UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]
    │   ├─ [437] UniswapV2Pair::getReserves() [staticcall]
    │   │   └─ ← [Return] 1000000000000000000 [1e18], 1000000000000000000 [1e18], 1
    │   ├─ [3544] ERC20Mintable::transferFrom(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], 2000000000000000000 [2e18])
    │   │   ├─ emit Transfer(from: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], to: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], value: 2000000000000000000 [2e18])
    │   │   └─ ← [Return] true
    │   ├─ [3544] ERC20Mintable::transferFrom(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], 2000000000000000000 [2e18])
    │   │   ├─ emit Transfer(from: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], to: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], value: 2000000000000000000 [2e18])
    │   │   └─ ← [Return] true
    │   ├─ [30827] UniswapV2Pair::mint(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   │   ├─ [541] ERC20Mintable::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
    │   │   │   └─ ← [Return] 3000000000000000000 [3e18]
    │   │   ├─ [541] ERC20Mintable::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
    │   │   │   └─ ← [Return] 3000000000000000000 [3e18]
    │   │   ├─ [295] UniswapV2Factory::feeTo() [staticcall]
    │   │   │   └─ ← [Return] 0x0000000000000000000000000000000000000000
    │   │   ├─ emit Transfer(from: 0x0000000000000000000000000000000000000000, to: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], value: 2000000000000000000 [2e18])
    │   │   ├─ emit Sync(reserve0: 3000000000000000000 [3e18], reserve1: 3000000000000000000 [3e18])
    │   │   ├─ emit Mint(sender: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], amount0: 2000000000000000000 [2e18], amount1: 2000000000000000000 [2e18])
    │   │   └─ ← [Return] 2000000000000000000 [2e18]
    │   └─ ← [Return] 2000000000000000000 [2e18], 2000000000000000000 [2e18], 2000000000000000000 [2e18]
    ├─ [0] VM::assertEq(2000000000000000000 [2e18], 2000000000000000000 [2e18], "the amount of tokenA is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [0] VM::assertEq(2000000000000000000 [2e18], 2000000000000000000 [2e18], "the amount of tokenB is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [0] VM::assertEq(2000000000000000000 [2e18], 2000000000000000000 [2e18], "the number of liquidity is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [965] UniswapV2Factory::getPair(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f]) [staticcall]
    │   └─ ← [Return] UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]
    ├─ [717] UniswapV2Pair::balanceOf(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1]) [staticcall]
    │   └─ ← [Return] 2999999999999999000 [2.999e18]
    ├─ [0] VM::assertEq(2999999999999999000 [2.999e18], 2999999999999999000 [2.999e18], "UniswapV2Pair: the number of balance is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [365] UniswapV2Pair::totalSupply() [staticcall]
    │   └─ ← [Return] 3000000000000000000 [3e18]
    ├─ [0] VM::assertEq(3000000000000000000 [3e18], 3000000000000000000 [3e18], "the total supply of LP tokens is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [437] UniswapV2Pair::getReserves() [staticcall]
    │   └─ ← [Return] 3000000000000000000 [3e18], 3000000000000000000 [3e18], 1
    ├─ [0] VM::assertEq(3000000000000000000 [3e18], 3000000000000000000 [3e18], "reserve0 is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [0] VM::assertEq(3000000000000000000 [3e18], 3000000000000000000 [3e18], "reserve1 is not as expected") [staticcall]
    │   └─ ← [Return] 
    └─ ← [Return] 

[PASS] test_MintWrongProportion_burn_pair() (gas: 2107939)
Traces:
  [2107939] TokensForTokens_Test::test_MintWrongProportion_burn_pair()
    ├─ [0] VM::prank(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   └─ ← [Return] 
    ├─ [24349] ERC20Mintable::approve(UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], 1000000000000000000000 [1e21])
    │   ├─ emit Approval(owner: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], spender: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], value: 1000000000000000000000 [1e21])
    │   └─ ← [Return] true
    ├─ [0] VM::prank(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   └─ ← [Return] 
    ├─ [24349] ERC20Mintable::approve(UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], 1000000000000000000000 [1e21])
    │   ├─ emit Approval(owner: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], spender: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], value: 1000000000000000000000 [1e21])
    │   └─ ← [Return] true
    ├─ [0] VM::prank(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   └─ ← [Return] 
    ├─ [1947293] UniswapV2Router02::addLiquidity(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], 1000000000000000000 [1e18], 1000000000000000000 [1e18], 0, 0, tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], 101)
    │   ├─ [2965] UniswapV2Factory::getPair(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f]) [staticcall]
    │   │   └─ ← [Return] 0x0000000000000000000000000000000000000000
    │   ├─ [1737907] UniswapV2Factory::createPair(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f])
    │   │   ├─ [1566515] → new UniswapV2Pair@0x0a250Eaf504976df78FE4839F5459e6cCB2420D5
    │   │   │   └─ ← [Return] 7490 bytes of code
    │   │   ├─ [44896] UniswapV2Pair::initialize(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f])
    │   │   │   └─ ← [Return] 
    │   │   ├─ emit PairCreated(token0: ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], token1: ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], pair: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], : 1)
    │   │   └─ ← [Return] UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]
    │   ├─ [2437] UniswapV2Pair::getReserves() [staticcall]
    │   │   └─ ← [Return] 0, 0, 0
    │   ├─ [30244] ERC20Mintable::transferFrom(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], 1000000000000000000 [1e18])
    │   │   ├─ emit Transfer(from: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], to: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], value: 1000000000000000000 [1e18])
    │   │   └─ ← [Return] true
    │   ├─ [30244] ERC20Mintable::transferFrom(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], 1000000000000000000 [1e18])
    │   │   ├─ emit Transfer(from: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], to: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], value: 1000000000000000000 [1e18])
    │   │   └─ ← [Return] true
    │   ├─ [134262] UniswapV2Pair::mint(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   │   ├─ [541] ERC20Mintable::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
    │   │   │   └─ ← [Return] 1000000000000000000 [1e18]
    │   │   ├─ [541] ERC20Mintable::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
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
    ├─ [965] UniswapV2Factory::getPair(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f]) [staticcall]
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
    ├─ [965] UniswapV2Factory::getPair(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f]) [staticcall]
    │   └─ ← [Return] UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]
    ├─ [0] VM::prank(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   └─ ← [Return] 
    ├─ [2955] ERC20Mintable::transfer(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], 2000000000000000000 [2e18])
    │   ├─ emit Transfer(from: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], to: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], value: 2000000000000000000 [2e18])
    │   └─ ← [Return] true
    ├─ [0] VM::prank(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   └─ ← [Return] 
    ├─ [2955] ERC20Mintable::transfer(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], 1000000000000000000 [1e18])
    │   ├─ emit Transfer(from: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], to: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], value: 1000000000000000000 [1e18])
    │   └─ ← [Return] true
    ├─ [0] VM::prank(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   └─ ← [Return] 
    ├─ [30827] UniswapV2Pair::mint(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   ├─ [541] ERC20Mintable::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
    │   │   └─ ← [Return] 3000000000000000000 [3e18]
    │   ├─ [541] ERC20Mintable::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
    │   │   └─ ← [Return] 2000000000000000000 [2e18]
    │   ├─ [295] UniswapV2Factory::feeTo() [staticcall]
    │   │   └─ ← [Return] 0x0000000000000000000000000000000000000000
    │   ├─ emit Transfer(from: 0x0000000000000000000000000000000000000000, to: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], value: 1000000000000000000 [1e18])
    │   ├─ emit Sync(reserve0: 3000000000000000000 [3e18], reserve1: 2000000000000000000 [2e18])
    │   ├─ emit Mint(sender: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], amount0: 2000000000000000000 [2e18], amount1: 1000000000000000000 [1e18])
    │   └─ ← [Return] 1000000000000000000 [1e18]
    ├─ [0] VM::assertEq(1000000000000000000 [1e18], 1000000000000000000 [1e18]) [staticcall]
    │   └─ ← [Return] 
    ├─ [717] UniswapV2Pair::balanceOf(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1]) [staticcall]
    │   └─ ← [Return] 1999999999999999000 [1.999e18]
    ├─ [0] VM::assertEq(1999999999999999000 [1.999e18], 1999999999999999000 [1.999e18], "UniswapV2Pair: mint() should return the number of LP tokens minted") [staticcall]
    │   └─ ← [Return] 
    ├─ [365] UniswapV2Pair::totalSupply() [staticcall]
    │   └─ ← [Return] 2000000000000000000 [2e18]
    ├─ [0] VM::assertEq(2000000000000000000 [2e18], 2000000000000000000 [2e18], "the total supply of LP tokens is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [437] UniswapV2Pair::getReserves() [staticcall]
    │   └─ ← [Return] 3000000000000000000 [3e18], 2000000000000000000 [2e18], 1
    ├─ [0] VM::assertEq(3000000000000000000 [3e18], 3000000000000000000 [3e18], "reserve0 is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [0] VM::assertEq(2000000000000000000 [2e18], 2000000000000000000 [2e18], "reserve1 is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [0] VM::prank(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   └─ ← [Return] 
    ├─ [24380] UniswapV2Pair::approve(UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], 1000000000000000000000 [1e21])
    │   ├─ emit Approval(owner: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], spender: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], value: 1000000000000000000000 [1e21])
    │   └─ ← [Return] true
    ├─ [0] VM::prank(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   └─ ← [Return] 
    ├─ [69643] UniswapV2Router02::removeLiquidity(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], 1999999999999999000 [1.999e18], 0, 0, tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], 101)
    │   ├─ [25811] UniswapV2Pair::transferFrom(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], 1999999999999999000 [1.999e18])
    │   │   ├─ emit Transfer(from: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], to: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], value: 1999999999999999000 [1.999e18])
    │   │   └─ ← [Return] true
    │   ├─ [40893] UniswapV2Pair::burn(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   │   ├─ [541] ERC20Mintable::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
    │   │   │   └─ ← [Return] 3000000000000000000 [3e18]
    │   │   ├─ [541] ERC20Mintable::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
    │   │   │   └─ ← [Return] 2000000000000000000 [2e18]
    │   │   ├─ [295] UniswapV2Factory::feeTo() [staticcall]
    │   │   │   └─ ← [Return] 0x0000000000000000000000000000000000000000
    │   │   ├─ emit Transfer(from: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], to: 0x0000000000000000000000000000000000000000, value: 1999999999999999000 [1.999e18])
    │   │   ├─ [2955] ERC20Mintable::transfer(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], 2999999999999998500 [2.999e18])
    │   │   │   ├─ emit Transfer(from: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], to: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], value: 2999999999999998500 [2.999e18])
    │   │   │   └─ ← [Return] true
    │   │   ├─ [2955] ERC20Mintable::transfer(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], 1999999999999999000 [1.999e18])
    │   │   │   ├─ emit Transfer(from: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], to: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], value: 1999999999999999000 [1.999e18])
    │   │   │   └─ ← [Return] true
    │   │   ├─ [541] ERC20Mintable::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
    │   │   │   └─ ← [Return] 1500
    │   │   ├─ [541] ERC20Mintable::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
    │   │   │   └─ ← [Return] 1000
    │   │   ├─ emit Sync(reserve0: 1500, reserve1: 1000)
    │   │   ├─ emit Burn(sender: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], amount0: 2999999999999998500 [2.999e18], amount1: 1999999999999999000 [1.999e18], to: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   │   └─ ← [Return] 2999999999999998500 [2.999e18], 1999999999999999000 [1.999e18]
    │   └─ ← [Return] 2999999999999998500 [2.999e18], 1999999999999999000 [1.999e18]
    ├─ [0] VM::assertEq(2999999999999998500 [2.999e18], 2999999999999998500 [2.999e18], "the amount of tokenA is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [0] VM::assertEq(1999999999999999000 [1.999e18], 1999999999999999000 [1.999e18], "the amount of tokenB is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [717] UniswapV2Pair::balanceOf(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1]) [staticcall]
    │   └─ ← [Return] 0
    ├─ [0] VM::assertEq(0, 0, "the number of LP tokens is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [437] UniswapV2Pair::getReserves() [staticcall]
    │   └─ ← [Return] 1500, 1000, 1
    ├─ [0] VM::assertEq(1500, 1500, "reserve0 is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [0] VM::assertEq(1000, 1000, "reserve1 is not as expected") [staticcall]
    │   └─ ← [Return] 
    └─ ← [Return] 

[PASS] test_MintWrongProportion_burn_tokenOwner2() (gas: 2189776)
Traces:
  [2189776] TokensForTokens_Test::test_MintWrongProportion_burn_tokenOwner2()
    ├─ [0] VM::prank(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   └─ ← [Return] 
    ├─ [24349] ERC20Mintable::approve(UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], 1000000000000000000000 [1e21])
    │   ├─ emit Approval(owner: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], spender: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], value: 1000000000000000000000 [1e21])
    │   └─ ← [Return] true
    ├─ [0] VM::prank(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   └─ ← [Return] 
    ├─ [24349] ERC20Mintable::approve(UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], 1000000000000000000000 [1e21])
    │   ├─ emit Approval(owner: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], spender: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], value: 1000000000000000000000 [1e21])
    │   └─ ← [Return] true
    ├─ [0] VM::prank(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   └─ ← [Return] 
    ├─ [1947293] UniswapV2Router02::addLiquidity(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], 1000000000000000000 [1e18], 1000000000000000000 [1e18], 0, 0, tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], 101)
    │   ├─ [2965] UniswapV2Factory::getPair(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f]) [staticcall]
    │   │   └─ ← [Return] 0x0000000000000000000000000000000000000000
    │   ├─ [1737907] UniswapV2Factory::createPair(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f])
    │   │   ├─ [1566515] → new UniswapV2Pair@0x0a250Eaf504976df78FE4839F5459e6cCB2420D5
    │   │   │   └─ ← [Return] 7490 bytes of code
    │   │   ├─ [44896] UniswapV2Pair::initialize(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f])
    │   │   │   └─ ← [Return] 
    │   │   ├─ emit PairCreated(token0: ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], token1: ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], pair: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], : 1)
    │   │   └─ ← [Return] UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]
    │   ├─ [2437] UniswapV2Pair::getReserves() [staticcall]
    │   │   └─ ← [Return] 0, 0, 0
    │   ├─ [30244] ERC20Mintable::transferFrom(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], 1000000000000000000 [1e18])
    │   │   ├─ emit Transfer(from: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], to: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], value: 1000000000000000000 [1e18])
    │   │   └─ ← [Return] true
    │   ├─ [30244] ERC20Mintable::transferFrom(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], 1000000000000000000 [1e18])
    │   │   ├─ emit Transfer(from: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], to: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], value: 1000000000000000000 [1e18])
    │   │   └─ ← [Return] true
    │   ├─ [134262] UniswapV2Pair::mint(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   │   ├─ [541] ERC20Mintable::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
    │   │   │   └─ ← [Return] 1000000000000000000 [1e18]
    │   │   ├─ [541] ERC20Mintable::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
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
    ├─ [965] UniswapV2Factory::getPair(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f]) [staticcall]
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
    ├─ [0] VM::prank(tokenOwner2: [0x3680526b6Cb34d03A4AB3a9ce9A924863844a174])
    │   └─ ← [Return] 
    ├─ [24349] ERC20Mintable::approve(UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], 1000000000000000000000 [1e21])
    │   ├─ emit Approval(owner: tokenOwner2: [0x3680526b6Cb34d03A4AB3a9ce9A924863844a174], spender: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], value: 1000000000000000000000 [1e21])
    │   └─ ← [Return] true
    ├─ [0] VM::prank(tokenOwner2: [0x3680526b6Cb34d03A4AB3a9ce9A924863844a174])
    │   └─ ← [Return] 
    ├─ [24349] ERC20Mintable::approve(UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], 1000000000000000000000 [1e21])
    │   ├─ emit Approval(owner: tokenOwner2: [0x3680526b6Cb34d03A4AB3a9ce9A924863844a174], spender: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], value: 1000000000000000000000 [1e21])
    │   └─ ← [Return] true
    ├─ [0] VM::prank(tokenOwner2: [0x3680526b6Cb34d03A4AB3a9ce9A924863844a174])
    │   └─ ← [Return] 
    ├─ [77382] UniswapV2Router02::addLiquidity(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], 1000000000000000000 [1e18], 2000000000000000000 [2e18], 0, 0, tokenOwner2: [0x3680526b6Cb34d03A4AB3a9ce9A924863844a174], 101)
    │   ├─ [965] UniswapV2Factory::getPair(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f]) [staticcall]
    │   │   └─ ← [Return] UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]
    │   ├─ [437] UniswapV2Pair::getReserves() [staticcall]
    │   │   └─ ← [Return] 1000000000000000000 [1e18], 1000000000000000000 [1e18], 1
    │   ├─ [8344] ERC20Mintable::transferFrom(tokenOwner2: [0x3680526b6Cb34d03A4AB3a9ce9A924863844a174], UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], 1000000000000000000 [1e18])
    │   │   ├─ emit Transfer(from: tokenOwner2: [0x3680526b6Cb34d03A4AB3a9ce9A924863844a174], to: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], value: 1000000000000000000 [1e18])
    │   │   └─ ← [Return] true
    │   ├─ [8344] ERC20Mintable::transferFrom(tokenOwner2: [0x3680526b6Cb34d03A4AB3a9ce9A924863844a174], UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], 1000000000000000000 [1e18])
    │   │   ├─ emit Transfer(from: tokenOwner2: [0x3680526b6Cb34d03A4AB3a9ce9A924863844a174], to: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], value: 1000000000000000000 [1e18])
    │   │   └─ ← [Return] true
    │   ├─ [52727] UniswapV2Pair::mint(tokenOwner2: [0x3680526b6Cb34d03A4AB3a9ce9A924863844a174])
    │   │   ├─ [541] ERC20Mintable::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
    │   │   │   └─ ← [Return] 2000000000000000000 [2e18]
    │   │   ├─ [541] ERC20Mintable::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
    │   │   │   └─ ← [Return] 2000000000000000000 [2e18]
    │   │   ├─ [295] UniswapV2Factory::feeTo() [staticcall]
    │   │   │   └─ ← [Return] 0x0000000000000000000000000000000000000000
    │   │   ├─ emit Transfer(from: 0x0000000000000000000000000000000000000000, to: tokenOwner2: [0x3680526b6Cb34d03A4AB3a9ce9A924863844a174], value: 1000000000000000000 [1e18])
    │   │   ├─ emit Sync(reserve0: 2000000000000000000 [2e18], reserve1: 2000000000000000000 [2e18])
    │   │   ├─ emit Mint(sender: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], amount0: 1000000000000000000 [1e18], amount1: 1000000000000000000 [1e18])
    │   │   └─ ← [Return] 1000000000000000000 [1e18]
    │   └─ ← [Return] 1000000000000000000 [1e18], 1000000000000000000 [1e18], 1000000000000000000 [1e18]
    ├─ [0] VM::assertEq(1000000000000000000 [1e18], 1000000000000000000 [1e18], "the amount of tokenA is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [0] VM::assertEq(1000000000000000000 [1e18], 1000000000000000000 [1e18], "the amount of tokenB is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [0] VM::assertEq(1000000000000000000 [1e18], 1000000000000000000 [1e18], "the number of liquidity is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [717] UniswapV2Pair::balanceOf(tokenOwner2: [0x3680526b6Cb34d03A4AB3a9ce9A924863844a174]) [staticcall]
    │   └─ ← [Return] 1000000000000000000 [1e18]
    ├─ [0] VM::assertEq(1000000000000000000 [1e18], 1000000000000000000 [1e18], "the number of liquidity is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [0] VM::prank(tokenOwner2: [0x3680526b6Cb34d03A4AB3a9ce9A924863844a174])
    │   └─ ← [Return] 
    ├─ [24380] UniswapV2Pair::approve(UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], 1000000000000000000000 [1e21])
    │   ├─ emit Approval(owner: tokenOwner2: [0x3680526b6Cb34d03A4AB3a9ce9A924863844a174], spender: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], value: 1000000000000000000000 [1e21])
    │   └─ ← [Return] true
    ├─ [0] VM::prank(tokenOwner2: [0x3680526b6Cb34d03A4AB3a9ce9A924863844a174])
    │   └─ ← [Return] 
    ├─ [69643] UniswapV2Router02::removeLiquidity(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], 1000000000000000000 [1e18], 0, 0, tokenOwner2: [0x3680526b6Cb34d03A4AB3a9ce9A924863844a174], 101)
    │   ├─ [25811] UniswapV2Pair::transferFrom(tokenOwner2: [0x3680526b6Cb34d03A4AB3a9ce9A924863844a174], UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], 1000000000000000000 [1e18])
    │   │   ├─ emit Transfer(from: tokenOwner2: [0x3680526b6Cb34d03A4AB3a9ce9A924863844a174], to: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], value: 1000000000000000000 [1e18])
    │   │   └─ ← [Return] true
    │   ├─ [40893] UniswapV2Pair::burn(tokenOwner2: [0x3680526b6Cb34d03A4AB3a9ce9A924863844a174])
    │   │   ├─ [541] ERC20Mintable::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
    │   │   │   └─ ← [Return] 2000000000000000000 [2e18]
    │   │   ├─ [541] ERC20Mintable::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
    │   │   │   └─ ← [Return] 2000000000000000000 [2e18]
    │   │   ├─ [295] UniswapV2Factory::feeTo() [staticcall]
    │   │   │   └─ ← [Return] 0x0000000000000000000000000000000000000000
    │   │   ├─ emit Transfer(from: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], to: 0x0000000000000000000000000000000000000000, value: 1000000000000000000 [1e18])
    │   │   ├─ [2955] ERC20Mintable::transfer(tokenOwner2: [0x3680526b6Cb34d03A4AB3a9ce9A924863844a174], 1000000000000000000 [1e18])
    │   │   │   ├─ emit Transfer(from: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], to: tokenOwner2: [0x3680526b6Cb34d03A4AB3a9ce9A924863844a174], value: 1000000000000000000 [1e18])
    │   │   │   └─ ← [Return] true
    │   │   ├─ [2955] ERC20Mintable::transfer(tokenOwner2: [0x3680526b6Cb34d03A4AB3a9ce9A924863844a174], 1000000000000000000 [1e18])
    │   │   │   ├─ emit Transfer(from: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], to: tokenOwner2: [0x3680526b6Cb34d03A4AB3a9ce9A924863844a174], value: 1000000000000000000 [1e18])
    │   │   │   └─ ← [Return] true
    │   │   ├─ [541] ERC20Mintable::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
    │   │   │   └─ ← [Return] 1000000000000000000 [1e18]
    │   │   ├─ [541] ERC20Mintable::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
    │   │   │   └─ ← [Return] 1000000000000000000 [1e18]
    │   │   ├─ emit Sync(reserve0: 1000000000000000000 [1e18], reserve1: 1000000000000000000 [1e18])
    │   │   ├─ emit Burn(sender: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], amount0: 1000000000000000000 [1e18], amount1: 1000000000000000000 [1e18], to: tokenOwner2: [0x3680526b6Cb34d03A4AB3a9ce9A924863844a174])
    │   │   └─ ← [Return] 1000000000000000000 [1e18], 1000000000000000000 [1e18]
    │   └─ ← [Return] 1000000000000000000 [1e18], 1000000000000000000 [1e18]
    ├─ [0] VM::assertEq(1000000000000000000 [1e18], 1000000000000000000 [1e18], "the amount of tokenA is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [0] VM::assertEq(1000000000000000000 [1e18], 1000000000000000000 [1e18], "the amount of tokenB is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [965] UniswapV2Factory::getPair(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f]) [staticcall]
    │   └─ ← [Return] UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]
    ├─ [437] UniswapV2Pair::getReserves() [staticcall]
    │   └─ ← [Return] 1000000000000000000 [1e18], 1000000000000000000 [1e18], 1
    ├─ [0] VM::assertEq(1000000000000000000 [1e18], 1000000000000000000 [1e18], "reserve0 is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [0] VM::assertEq(1000000000000000000 [1e18], 1000000000000000000 [1e18], "reserve1 is not as expected") [staticcall]
    │   └─ ← [Return] 
    └─ ← [Return] 

[PASS] test_MintWrongProportion_pair() (gas: 2063927)
Traces:
  [2063927] TokensForTokens_Test::test_MintWrongProportion_pair()
    ├─ [0] VM::prank(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   └─ ← [Return] 
    ├─ [24349] ERC20Mintable::approve(UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], 1000000000000000000000 [1e21])
    │   ├─ emit Approval(owner: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], spender: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], value: 1000000000000000000000 [1e21])
    │   └─ ← [Return] true
    ├─ [0] VM::prank(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   └─ ← [Return] 
    ├─ [24349] ERC20Mintable::approve(UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], 1000000000000000000000 [1e21])
    │   ├─ emit Approval(owner: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], spender: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], value: 1000000000000000000000 [1e21])
    │   └─ ← [Return] true
    ├─ [0] VM::prank(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   └─ ← [Return] 
    ├─ [1947293] UniswapV2Router02::addLiquidity(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], 1000000000000000000 [1e18], 1000000000000000000 [1e18], 0, 0, tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], 101)
    │   ├─ [2965] UniswapV2Factory::getPair(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f]) [staticcall]
    │   │   └─ ← [Return] 0x0000000000000000000000000000000000000000
    │   ├─ [1737907] UniswapV2Factory::createPair(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f])
    │   │   ├─ [1566515] → new UniswapV2Pair@0x0a250Eaf504976df78FE4839F5459e6cCB2420D5
    │   │   │   └─ ← [Return] 7490 bytes of code
    │   │   ├─ [44896] UniswapV2Pair::initialize(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f])
    │   │   │   └─ ← [Return] 
    │   │   ├─ emit PairCreated(token0: ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], token1: ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], pair: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], : 1)
    │   │   └─ ← [Return] UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]
    │   ├─ [2437] UniswapV2Pair::getReserves() [staticcall]
    │   │   └─ ← [Return] 0, 0, 0
    │   ├─ [30244] ERC20Mintable::transferFrom(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], 1000000000000000000 [1e18])
    │   │   ├─ emit Transfer(from: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], to: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], value: 1000000000000000000 [1e18])
    │   │   └─ ← [Return] true
    │   ├─ [30244] ERC20Mintable::transferFrom(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], 1000000000000000000 [1e18])
    │   │   ├─ emit Transfer(from: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], to: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], value: 1000000000000000000 [1e18])
    │   │   └─ ← [Return] true
    │   ├─ [134262] UniswapV2Pair::mint(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   │   ├─ [541] ERC20Mintable::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
    │   │   │   └─ ← [Return] 1000000000000000000 [1e18]
    │   │   ├─ [541] ERC20Mintable::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
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
    ├─ [965] UniswapV2Factory::getPair(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f]) [staticcall]
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
    ├─ [965] UniswapV2Factory::getPair(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f]) [staticcall]
    │   └─ ← [Return] UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]
    ├─ [0] VM::prank(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   └─ ← [Return] 
    ├─ [2955] ERC20Mintable::transfer(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], 2000000000000000000 [2e18])
    │   ├─ emit Transfer(from: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], to: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], value: 2000000000000000000 [2e18])
    │   └─ ← [Return] true
    ├─ [0] VM::prank(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   └─ ← [Return] 
    ├─ [2955] ERC20Mintable::transfer(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], 1000000000000000000 [1e18])
    │   ├─ emit Transfer(from: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], to: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], value: 1000000000000000000 [1e18])
    │   └─ ← [Return] true
    ├─ [0] VM::prank(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   └─ ← [Return] 
    ├─ [30827] UniswapV2Pair::mint(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   ├─ [541] ERC20Mintable::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
    │   │   └─ ← [Return] 3000000000000000000 [3e18]
    │   ├─ [541] ERC20Mintable::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
    │   │   └─ ← [Return] 2000000000000000000 [2e18]
    │   ├─ [295] UniswapV2Factory::feeTo() [staticcall]
    │   │   └─ ← [Return] 0x0000000000000000000000000000000000000000
    │   ├─ emit Transfer(from: 0x0000000000000000000000000000000000000000, to: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], value: 1000000000000000000 [1e18])
    │   ├─ emit Sync(reserve0: 3000000000000000000 [3e18], reserve1: 2000000000000000000 [2e18])
    │   ├─ emit Mint(sender: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], amount0: 2000000000000000000 [2e18], amount1: 1000000000000000000 [1e18])
    │   └─ ← [Return] 1000000000000000000 [1e18]
    ├─ [0] VM::assertEq(1000000000000000000 [1e18], 1000000000000000000 [1e18]) [staticcall]
    │   └─ ← [Return] 
    ├─ [717] UniswapV2Pair::balanceOf(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1]) [staticcall]
    │   └─ ← [Return] 1999999999999999000 [1.999e18]
    ├─ [0] VM::assertEq(1999999999999999000 [1.999e18], 1999999999999999000 [1.999e18], "UniswapV2Pair: mint() should return the number of LP tokens minted") [staticcall]
    │   └─ ← [Return] 
    ├─ [365] UniswapV2Pair::totalSupply() [staticcall]
    │   └─ ← [Return] 2000000000000000000 [2e18]
    ├─ [0] VM::assertEq(2000000000000000000 [2e18], 2000000000000000000 [2e18], "the total supply of LP tokens is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [437] UniswapV2Pair::getReserves() [staticcall]
    │   └─ ← [Return] 3000000000000000000 [3e18], 2000000000000000000 [2e18], 1
    ├─ [0] VM::assertEq(3000000000000000000 [3e18], 3000000000000000000 [3e18], "reserve0 is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [0] VM::assertEq(2000000000000000000 [2e18], 2000000000000000000 [2e18], "reserve1 is not as expected") [staticcall]
    │   └─ ← [Return] 
    └─ ← [Return] 

[PASS] test_MintWrongProportion_router() (gas: 2073428)
Traces:
  [2073428] TokensForTokens_Test::test_MintWrongProportion_router()
    ├─ [0] VM::prank(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   └─ ← [Return] 
    ├─ [24349] ERC20Mintable::approve(UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], 1000000000000000000000 [1e21])
    │   ├─ emit Approval(owner: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], spender: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], value: 1000000000000000000000 [1e21])
    │   └─ ← [Return] true
    ├─ [0] VM::prank(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   └─ ← [Return] 
    ├─ [24349] ERC20Mintable::approve(UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], 1000000000000000000000 [1e21])
    │   ├─ emit Approval(owner: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], spender: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], value: 1000000000000000000000 [1e21])
    │   └─ ← [Return] true
    ├─ [0] VM::prank(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   └─ ← [Return] 
    ├─ [1947293] UniswapV2Router02::addLiquidity(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], 1000000000000000000 [1e18], 1000000000000000000 [1e18], 0, 0, tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], 101)
    │   ├─ [2965] UniswapV2Factory::getPair(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f]) [staticcall]
    │   │   └─ ← [Return] 0x0000000000000000000000000000000000000000
    │   ├─ [1737907] UniswapV2Factory::createPair(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f])
    │   │   ├─ [1566515] → new UniswapV2Pair@0x0a250Eaf504976df78FE4839F5459e6cCB2420D5
    │   │   │   └─ ← [Return] 7490 bytes of code
    │   │   ├─ [44896] UniswapV2Pair::initialize(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f])
    │   │   │   └─ ← [Return] 
    │   │   ├─ emit PairCreated(token0: ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], token1: ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], pair: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], : 1)
    │   │   └─ ← [Return] UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]
    │   ├─ [2437] UniswapV2Pair::getReserves() [staticcall]
    │   │   └─ ← [Return] 0, 0, 0
    │   ├─ [30244] ERC20Mintable::transferFrom(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], 1000000000000000000 [1e18])
    │   │   ├─ emit Transfer(from: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], to: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], value: 1000000000000000000 [1e18])
    │   │   └─ ← [Return] true
    │   ├─ [30244] ERC20Mintable::transferFrom(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], 1000000000000000000 [1e18])
    │   │   ├─ emit Transfer(from: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], to: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], value: 1000000000000000000 [1e18])
    │   │   └─ ← [Return] true
    │   ├─ [134262] UniswapV2Pair::mint(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   │   ├─ [541] ERC20Mintable::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
    │   │   │   └─ ← [Return] 1000000000000000000 [1e18]
    │   │   ├─ [541] ERC20Mintable::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
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
    ├─ [965] UniswapV2Factory::getPair(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f]) [staticcall]
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
    ├─ [45882] UniswapV2Router02::addLiquidity(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], 1000000000000000000 [1e18], 2000000000000000000 [2e18], 0, 0, tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], 101)
    │   ├─ [965] UniswapV2Factory::getPair(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f]) [staticcall]
    │   │   └─ ← [Return] UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]
    │   ├─ [437] UniswapV2Pair::getReserves() [staticcall]
    │   │   └─ ← [Return] 1000000000000000000 [1e18], 1000000000000000000 [1e18], 1
    │   ├─ [3544] ERC20Mintable::transferFrom(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], 1000000000000000000 [1e18])
    │   │   ├─ emit Transfer(from: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], to: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], value: 1000000000000000000 [1e18])
    │   │   └─ ← [Return] true
    │   ├─ [3544] ERC20Mintable::transferFrom(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], 1000000000000000000 [1e18])
    │   │   ├─ emit Transfer(from: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], to: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], value: 1000000000000000000 [1e18])
    │   │   └─ ← [Return] true
    │   ├─ [30827] UniswapV2Pair::mint(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   │   ├─ [541] ERC20Mintable::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
    │   │   │   └─ ← [Return] 2000000000000000000 [2e18]
    │   │   ├─ [541] ERC20Mintable::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
    │   │   │   └─ ← [Return] 2000000000000000000 [2e18]
    │   │   ├─ [295] UniswapV2Factory::feeTo() [staticcall]
    │   │   │   └─ ← [Return] 0x0000000000000000000000000000000000000000
    │   │   ├─ emit Transfer(from: 0x0000000000000000000000000000000000000000, to: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], value: 1000000000000000000 [1e18])
    │   │   ├─ emit Sync(reserve0: 2000000000000000000 [2e18], reserve1: 2000000000000000000 [2e18])
    │   │   ├─ emit Mint(sender: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], amount0: 1000000000000000000 [1e18], amount1: 1000000000000000000 [1e18])
    │   │   └─ ← [Return] 1000000000000000000 [1e18]
    │   └─ ← [Return] 1000000000000000000 [1e18], 1000000000000000000 [1e18], 1000000000000000000 [1e18]
    ├─ [0] VM::assertEq(1000000000000000000 [1e18], 1000000000000000000 [1e18], "the amount of tokenA is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [0] VM::assertEq(1000000000000000000 [1e18], 1000000000000000000 [1e18], "the amount of tokenB is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [0] VM::assertEq(1000000000000000000 [1e18], 1000000000000000000 [1e18], "the number of liquidity is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [965] UniswapV2Factory::getPair(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f]) [staticcall]
    │   └─ ← [Return] UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]
    ├─ [717] UniswapV2Pair::balanceOf(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1]) [staticcall]
    │   └─ ← [Return] 1999999999999999000 [1.999e18]
    ├─ [0] VM::assertEq(1999999999999999000 [1.999e18], 1999999999999999000 [1.999e18], "UniswapV2Pair: mint() should return the number of LP tokens minted") [staticcall]
    │   └─ ← [Return] 
    ├─ [365] UniswapV2Pair::totalSupply() [staticcall]
    │   └─ ← [Return] 2000000000000000000 [2e18]
    ├─ [0] VM::assertEq(2000000000000000000 [2e18], 2000000000000000000 [2e18], "the total supply of LP tokens is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [437] UniswapV2Pair::getReserves() [staticcall]
    │   └─ ← [Return] 2000000000000000000 [2e18], 2000000000000000000 [2e18], 1
    ├─ [0] VM::assertEq(2000000000000000000 [2e18], 2000000000000000000 [2e18], "reserve0 is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [0] VM::assertEq(2000000000000000000 [2e18], 2000000000000000000 [2e18], "reserve1 is not as expected") [staticcall]
    │   └─ ← [Return] 
    └─ ← [Return] 

[PASS] test_Mint_burn_router() (gas: 2110925)
Traces:
  [2110925] TokensForTokens_Test::test_Mint_burn_router()
    ├─ [0] VM::prank(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   └─ ← [Return] 
    ├─ [24349] ERC20Mintable::approve(UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], 1000000000000000000000 [1e21])
    │   ├─ emit Approval(owner: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], spender: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], value: 1000000000000000000000 [1e21])
    │   └─ ← [Return] true
    ├─ [0] VM::prank(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   └─ ← [Return] 
    ├─ [24349] ERC20Mintable::approve(UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], 1000000000000000000000 [1e21])
    │   ├─ emit Approval(owner: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], spender: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], value: 1000000000000000000000 [1e21])
    │   └─ ← [Return] true
    ├─ [0] VM::prank(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   └─ ← [Return] 
    ├─ [1947293] UniswapV2Router02::addLiquidity(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], 1000000000000000000 [1e18], 1000000000000000000 [1e18], 0, 0, tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], 101)
    │   ├─ [2965] UniswapV2Factory::getPair(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f]) [staticcall]
    │   │   └─ ← [Return] 0x0000000000000000000000000000000000000000
    │   ├─ [1737907] UniswapV2Factory::createPair(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f])
    │   │   ├─ [1566515] → new UniswapV2Pair@0x0a250Eaf504976df78FE4839F5459e6cCB2420D5
    │   │   │   └─ ← [Return] 7490 bytes of code
    │   │   ├─ [44896] UniswapV2Pair::initialize(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f])
    │   │   │   └─ ← [Return] 
    │   │   ├─ emit PairCreated(token0: ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], token1: ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], pair: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], : 1)
    │   │   └─ ← [Return] UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]
    │   ├─ [2437] UniswapV2Pair::getReserves() [staticcall]
    │   │   └─ ← [Return] 0, 0, 0
    │   ├─ [30244] ERC20Mintable::transferFrom(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], 1000000000000000000 [1e18])
    │   │   ├─ emit Transfer(from: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], to: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], value: 1000000000000000000 [1e18])
    │   │   └─ ← [Return] true
    │   ├─ [30244] ERC20Mintable::transferFrom(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], 1000000000000000000 [1e18])
    │   │   ├─ emit Transfer(from: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], to: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], value: 1000000000000000000 [1e18])
    │   │   └─ ← [Return] true
    │   ├─ [134262] UniswapV2Pair::mint(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   │   ├─ [541] ERC20Mintable::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
    │   │   │   └─ ← [Return] 1000000000000000000 [1e18]
    │   │   ├─ [541] ERC20Mintable::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
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
    ├─ [965] UniswapV2Factory::getPair(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f]) [staticcall]
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
    ├─ [965] UniswapV2Factory::getPair(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f]) [staticcall]
    │   └─ ← [Return] UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]
    ├─ [0] VM::prank(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   └─ ← [Return] 
    ├─ [46224] UniswapV2Router02::addLiquidity(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], 2000000000000000000 [2e18], 1000000000000000000 [1e18], 0, 0, tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], 101)
    │   ├─ [965] UniswapV2Factory::getPair(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f]) [staticcall]
    │   │   └─ ← [Return] UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]
    │   ├─ [437] UniswapV2Pair::getReserves() [staticcall]
    │   │   └─ ← [Return] 1000000000000000000 [1e18], 1000000000000000000 [1e18], 1
    │   ├─ [3544] ERC20Mintable::transferFrom(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], 1000000000000000000 [1e18])
    │   │   ├─ emit Transfer(from: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], to: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], value: 1000000000000000000 [1e18])
    │   │   └─ ← [Return] true
    │   ├─ [3544] ERC20Mintable::transferFrom(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], 1000000000000000000 [1e18])
    │   │   ├─ emit Transfer(from: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], to: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], value: 1000000000000000000 [1e18])
    │   │   └─ ← [Return] true
    │   ├─ [30827] UniswapV2Pair::mint(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   │   ├─ [541] ERC20Mintable::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
    │   │   │   └─ ← [Return] 2000000000000000000 [2e18]
    │   │   ├─ [541] ERC20Mintable::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
    │   │   │   └─ ← [Return] 2000000000000000000 [2e18]
    │   │   ├─ [295] UniswapV2Factory::feeTo() [staticcall]
    │   │   │   └─ ← [Return] 0x0000000000000000000000000000000000000000
    │   │   ├─ emit Transfer(from: 0x0000000000000000000000000000000000000000, to: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], value: 1000000000000000000 [1e18])
    │   │   ├─ emit Sync(reserve0: 2000000000000000000 [2e18], reserve1: 2000000000000000000 [2e18])
    │   │   ├─ emit Mint(sender: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], amount0: 1000000000000000000 [1e18], amount1: 1000000000000000000 [1e18])
    │   │   └─ ← [Return] 1000000000000000000 [1e18]
    │   └─ ← [Return] 1000000000000000000 [1e18], 1000000000000000000 [1e18], 1000000000000000000 [1e18]
    ├─ [0] VM::assertEq(1000000000000000000 [1e18], 1000000000000000000 [1e18], "the amount of tokenA is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [0] VM::assertEq(1000000000000000000 [1e18], 1000000000000000000 [1e18], "the amount of tokenB is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [0] VM::assertEq(1000000000000000000 [1e18], 1000000000000000000 [1e18], "the number of liquidity is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [717] UniswapV2Pair::balanceOf(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1]) [staticcall]
    │   └─ ← [Return] 1999999999999999000 [1.999e18]
    ├─ [0] VM::assertEq(1999999999999999000 [1.999e18], 1999999999999999000 [1.999e18], "the number of liquidity is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [0] VM::prank(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   └─ ← [Return] 
    ├─ [24380] UniswapV2Pair::approve(UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], 1000000000000000000000 [1e21])
    │   ├─ emit Approval(owner: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], spender: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], value: 1000000000000000000000 [1e21])
    │   └─ ← [Return] true
    ├─ [0] VM::prank(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   └─ ← [Return] 
    ├─ [69643] UniswapV2Router02::removeLiquidity(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], 1999999999999999000 [1.999e18], 0, 0, tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], 101)
    │   ├─ [25811] UniswapV2Pair::transferFrom(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], 1999999999999999000 [1.999e18])
    │   │   ├─ emit Transfer(from: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], to: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], value: 1999999999999999000 [1.999e18])
    │   │   └─ ← [Return] true
    │   ├─ [40893] UniswapV2Pair::burn(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   │   ├─ [541] ERC20Mintable::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
    │   │   │   └─ ← [Return] 2000000000000000000 [2e18]
    │   │   ├─ [541] ERC20Mintable::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
    │   │   │   └─ ← [Return] 2000000000000000000 [2e18]
    │   │   ├─ [295] UniswapV2Factory::feeTo() [staticcall]
    │   │   │   └─ ← [Return] 0x0000000000000000000000000000000000000000
    │   │   ├─ emit Transfer(from: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], to: 0x0000000000000000000000000000000000000000, value: 1999999999999999000 [1.999e18])
    │   │   ├─ [2955] ERC20Mintable::transfer(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], 1999999999999999000 [1.999e18])
    │   │   │   ├─ emit Transfer(from: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], to: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], value: 1999999999999999000 [1.999e18])
    │   │   │   └─ ← [Return] true
    │   │   ├─ [2955] ERC20Mintable::transfer(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], 1999999999999999000 [1.999e18])
    │   │   │   ├─ emit Transfer(from: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], to: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], value: 1999999999999999000 [1.999e18])
    │   │   │   └─ ← [Return] true
    │   │   ├─ [541] ERC20Mintable::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
    │   │   │   └─ ← [Return] 1000
    │   │   ├─ [541] ERC20Mintable::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
    │   │   │   └─ ← [Return] 1000
    │   │   ├─ emit Sync(reserve0: 1000, reserve1: 1000)
    │   │   ├─ emit Burn(sender: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], amount0: 1999999999999999000 [1.999e18], amount1: 1999999999999999000 [1.999e18], to: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   │   └─ ← [Return] 1999999999999999000 [1.999e18], 1999999999999999000 [1.999e18]
    │   └─ ← [Return] 1999999999999999000 [1.999e18], 1999999999999999000 [1.999e18]
    ├─ [0] VM::assertEq(1999999999999999000 [1.999e18], 1999999999999999000 [1.999e18], "the amount of tokenA is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [0] VM::assertEq(1999999999999999000 [1.999e18], 1999999999999999000 [1.999e18], "the amount of tokenB is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [437] UniswapV2Pair::getReserves() [staticcall]
    │   └─ ← [Return] 1000, 1000, 1
    ├─ [0] VM::assertEq(1000, 1000, "reserve0 is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [0] VM::assertEq(1000, 1000, "reserve1 is not as expected") [staticcall]
    │   └─ ← [Return] 
    └─ ← [Return] 

[PASS] test_Swap() (gas: 2070686)
Traces:
  [2070686] TokensForTokens_Test::test_Swap()
    ├─ [0] VM::prank(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   └─ ← [Return] 
    ├─ [24349] ERC20Mintable::approve(UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], 1000000000000000000000 [1e21])
    │   ├─ emit Approval(owner: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], spender: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], value: 1000000000000000000000 [1e21])
    │   └─ ← [Return] true
    ├─ [0] VM::prank(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   └─ ← [Return] 
    ├─ [24349] ERC20Mintable::approve(UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], 1000000000000000000000 [1e21])
    │   ├─ emit Approval(owner: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], spender: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], value: 1000000000000000000000 [1e21])
    │   └─ ← [Return] true
    ├─ [0] VM::prank(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   └─ ← [Return] 
    ├─ [1947293] UniswapV2Router02::addLiquidity(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], 1000000000000000000 [1e18], 1000000000000000000 [1e18], 0, 0, tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], 101)
    │   ├─ [2965] UniswapV2Factory::getPair(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f]) [staticcall]
    │   │   └─ ← [Return] 0x0000000000000000000000000000000000000000
    │   ├─ [1737907] UniswapV2Factory::createPair(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f])
    │   │   ├─ [1566515] → new UniswapV2Pair@0x0a250Eaf504976df78FE4839F5459e6cCB2420D5
    │   │   │   └─ ← [Return] 7490 bytes of code
    │   │   ├─ [44896] UniswapV2Pair::initialize(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f])
    │   │   │   └─ ← [Return] 
    │   │   ├─ emit PairCreated(token0: ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], token1: ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], pair: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], : 1)
    │   │   └─ ← [Return] UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]
    │   ├─ [2437] UniswapV2Pair::getReserves() [staticcall]
    │   │   └─ ← [Return] 0, 0, 0
    │   ├─ [30244] ERC20Mintable::transferFrom(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], 1000000000000000000 [1e18])
    │   │   ├─ emit Transfer(from: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], to: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], value: 1000000000000000000 [1e18])
    │   │   └─ ← [Return] true
    │   ├─ [30244] ERC20Mintable::transferFrom(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], 1000000000000000000 [1e18])
    │   │   ├─ emit Transfer(from: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], to: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], value: 1000000000000000000 [1e18])
    │   │   └─ ← [Return] true
    │   ├─ [134262] UniswapV2Pair::mint(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   │   ├─ [541] ERC20Mintable::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
    │   │   │   └─ ← [Return] 1000000000000000000 [1e18]
    │   │   ├─ [541] ERC20Mintable::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
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
    ├─ [965] UniswapV2Factory::getPair(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f]) [staticcall]
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
    ├─ [965] UniswapV2Factory::getPair(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f]) [staticcall]
    │   └─ ← [Return] UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]
    ├─ [437] UniswapV2Pair::getReserves() [staticcall]
    │   └─ ← [Return] 1000000000000000000 [1e18], 1000000000000000000 [1e18], 1
    ├─ [0] VM::prank(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   └─ ← [Return] 
    ├─ [45789] UniswapV2Router02::swapExactTokensForTokens(1000000000000000000 [1e18], 0, [0x2e234DAe75C793f67A35089C9d99245E1C58470b, 0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], 101)
    │   ├─ [437] UniswapV2Pair::getReserves() [staticcall]
    │   │   └─ ← [Return] 1000000000000000000 [1e18], 1000000000000000000 [1e18], 1
    │   ├─ [3544] ERC20Mintable::transferFrom(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], 1000000000000000000 [1e18])
    │   │   ├─ emit Transfer(from: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], to: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], value: 1000000000000000000 [1e18])
    │   │   └─ ← [Return] true
    │   ├─ [32549] UniswapV2Pair::swap(0, 499248873309964947 [4.992e17], tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], 0x)
    │   │   ├─ [2955] ERC20Mintable::transfer(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], 499248873309964947 [4.992e17])
    │   │   │   ├─ emit Transfer(from: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], to: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], value: 499248873309964947 [4.992e17])
    │   │   │   └─ ← [Return] true
    │   │   ├─ [541] ERC20Mintable::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
    │   │   │   └─ ← [Return] 2000000000000000000 [2e18]
    │   │   ├─ [541] ERC20Mintable::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
    │   │   │   └─ ← [Return] 500751126690035053 [5.007e17]
    │   │   ├─ emit Sync(reserve0: 2000000000000000000 [2e18], reserve1: 500751126690035053 [5.007e17])
    │   │   ├─ emit Swap(sender: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], amount0In: 1000000000000000000 [1e18], amount1In: 0, amount0Out: 0, amount1Out: 499248873309964947 [4.992e17], to: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   │   └─ ← [Return] 
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

[PASS] test_Swap2() (gas: 2071507)
Traces:
  [2071507] TokensForTokens_Test::test_Swap2()
    ├─ [0] VM::prank(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   └─ ← [Return] 
    ├─ [24349] ERC20Mintable::approve(UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], 1000000000000000000000 [1e21])
    │   ├─ emit Approval(owner: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], spender: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], value: 1000000000000000000000 [1e21])
    │   └─ ← [Return] true
    ├─ [0] VM::prank(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   └─ ← [Return] 
    ├─ [24349] ERC20Mintable::approve(UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], 1000000000000000000000 [1e21])
    │   ├─ emit Approval(owner: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], spender: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], value: 1000000000000000000000 [1e21])
    │   └─ ← [Return] true
    ├─ [0] VM::prank(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   └─ ← [Return] 
    ├─ [1947293] UniswapV2Router02::addLiquidity(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], 1000000000000000000 [1e18], 1000000000000000000 [1e18], 0, 0, tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], 101)
    │   ├─ [2965] UniswapV2Factory::getPair(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f]) [staticcall]
    │   │   └─ ← [Return] 0x0000000000000000000000000000000000000000
    │   ├─ [1737907] UniswapV2Factory::createPair(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f])
    │   │   ├─ [1566515] → new UniswapV2Pair@0x0a250Eaf504976df78FE4839F5459e6cCB2420D5
    │   │   │   └─ ← [Return] 7490 bytes of code
    │   │   ├─ [44896] UniswapV2Pair::initialize(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f])
    │   │   │   └─ ← [Return] 
    │   │   ├─ emit PairCreated(token0: ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], token1: ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], pair: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], : 1)
    │   │   └─ ← [Return] UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]
    │   ├─ [2437] UniswapV2Pair::getReserves() [staticcall]
    │   │   └─ ← [Return] 0, 0, 0
    │   ├─ [30244] ERC20Mintable::transferFrom(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], 1000000000000000000 [1e18])
    │   │   ├─ emit Transfer(from: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], to: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], value: 1000000000000000000 [1e18])
    │   │   └─ ← [Return] true
    │   ├─ [30244] ERC20Mintable::transferFrom(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], 1000000000000000000 [1e18])
    │   │   ├─ emit Transfer(from: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], to: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], value: 1000000000000000000 [1e18])
    │   │   └─ ← [Return] true
    │   ├─ [134262] UniswapV2Pair::mint(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   │   ├─ [541] ERC20Mintable::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
    │   │   │   └─ ← [Return] 1000000000000000000 [1e18]
    │   │   ├─ [541] ERC20Mintable::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
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
    ├─ [965] UniswapV2Factory::getPair(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f]) [staticcall]
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
    ├─ [965] UniswapV2Factory::getPair(ERC20Mintable: [0x2e234DAe75C793f67A35089C9d99245E1C58470b], ERC20Mintable: [0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f]) [staticcall]
    │   └─ ← [Return] UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]
    ├─ [437] UniswapV2Pair::getReserves() [staticcall]
    │   └─ ← [Return] 1000000000000000000 [1e18], 1000000000000000000 [1e18], 1
    ├─ [0] VM::prank(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   └─ ← [Return] 
    ├─ [46151] UniswapV2Router02::swapTokensForExactTokens(100000000000000000 [1e17], 1000000000000000000 [1e18], [0x2e234DAe75C793f67A35089C9d99245E1C58470b, 0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f], tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], 101)
    │   ├─ [437] UniswapV2Pair::getReserves() [staticcall]
    │   │   └─ ← [Return] 1000000000000000000 [1e18], 1000000000000000000 [1e18], 1
    │   ├─ [3544] ERC20Mintable::transferFrom(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], 111445447453471526 [1.114e17])
    │   │   ├─ emit Transfer(from: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], to: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], value: 111445447453471526 [1.114e17])
    │   │   └─ ← [Return] true
    │   ├─ [32549] UniswapV2Pair::swap(0, 100000000000000000 [1e17], tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], 0x)
    │   │   ├─ [2955] ERC20Mintable::transfer(tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], 100000000000000000 [1e17])
    │   │   │   ├─ emit Transfer(from: UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5], to: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1], value: 100000000000000000 [1e17])
    │   │   │   └─ ← [Return] true
    │   │   ├─ [541] ERC20Mintable::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
    │   │   │   └─ ← [Return] 1111445447453471526 [1.111e18]
    │   │   ├─ [541] ERC20Mintable::balanceOf(UniswapV2Pair: [0x0a250Eaf504976df78FE4839F5459e6cCB2420D5]) [staticcall]
    │   │   │   └─ ← [Return] 900000000000000000 [9e17]
    │   │   ├─ emit Sync(reserve0: 1111445447453471526 [1.111e18], reserve1: 900000000000000000 [9e17])
    │   │   ├─ emit Swap(sender: UniswapV2Router02: [0x353f6fAc28Be9410d194fb2DccaF5e27A59c250C], amount0In: 111445447453471526 [1.114e17], amount1In: 0, amount0Out: 0, amount1Out: 100000000000000000 [1e17], to: tokenOwner: [0xB5da940311d85e6E3dF2250dE017e52602903ee1])
    │   │   └─ ← [Return] 
    │   └─ ← [Return] [111445447453471526 [1.114e17], 100000000000000000 [1e17]]
    ├─ [0] VM::assertEq(111445447453471526 [1.114e17], 111445447453471526 [1.114e17], "the amount of tokenB is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [0] VM::assertEq(100000000000000000 [1e17], 100000000000000000 [1e17], "the amount of tokenA is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [437] UniswapV2Pair::getReserves() [staticcall]
    │   └─ ← [Return] 1111445447453471526 [1.111e18], 900000000000000000 [9e17], 1
    ├─ [0] VM::assertEq(1111445447453471526 [1.111e18], 1111445447453471526 [1.111e18], "reserve0 is not as expected") [staticcall]
    │   └─ ← [Return] 
    ├─ [0] VM::assertEq(900000000000000000 [9e17], 900000000000000000 [9e17], "reserve1 is not as expected") [staticcall]
    │   └─ ← [Return] 
    └─ ← [Return] 

Suite result: ok. 9 passed; 0 failed; 0 skipped; finished in 21.84ms (35.37ms CPU time)

Ran 1 test suite in 8589.43s (21.84ms CPU time): 9 tests passed, 0 failed, 0 skipped (9 total tests)
