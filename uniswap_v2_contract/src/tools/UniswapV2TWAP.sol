// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "../interfaces/IUniswapV2Pair.sol";
// 这是uniswap独创的数据类型，提供了固定点数运算，用于处理价格等数据的精确计算
import "../libraries/v2-periphery-libraries/FixedPoint.sol";
// 方便大家创建TWAP
import "../libraries/v2-periphery-libraries/UniswapV2OracleLibrary.sol";
import "../libraries/v2-periphery-libraries/UniswapV2Library.sol";

// pair: 0xE2C4949aF6D8Cc085eCD3621E2a7110963b7201D
// router2: 0xC532a74256D3Db42D0Bf7a0400fEFDbad7694008

contract UniswapV2TWAP {
    using FixedPoint for *;

    // 更新周期为1小时
    uint public constant PERIOD = 1 hours;

    IUniswapV2Pair public immutable pair;
    address public immutable token0;
    address public immutable token1;

    uint public price0CumulativeLast; // 是token0基于时间的价格累计值
    uint public price1CumulativeLast; // 是token1基于时间的价格累计值
    uint32 public blockTimestampLast; // 从pair合约中获取的最后一次更新价格的时间戳

    FixedPoint.uq112x112 public price0Average;
    FixedPoint.uq112x112 public price1Average;

    constructor(address _pairAddress) {
        pair = IUniswapV2Pair(_pairAddress);
        token0 = pair.token0();
        token1 = pair.token1();
        price0CumulativeLast = pair.price0CumulativeLast();
        price1CumulativeLast = pair.price1CumulativeLast();
        (,, blockTimestampLast) = pair.getReserves();
    }

    // 仅当至少过去了设定的 PERIOD（例如1小时）后才进行更新
    function update() external {
        (
            uint price0Cumulative,
            uint price1Cumulative,
            uint32 blockTimestamp
        ) = UniswapV2OracleLibrary.currentCumulativePrices(address(pair));
        
        uint timeElapsed = blockTimestamp - blockTimestampLast;
        require(timeElapsed >= PERIOD, 'UniswapV2TWAP: PERIOD_NOT_ELAPSED');

        price0Average = FixedPoint.uq112x112(uint224((price0Cumulative - price0CumulativeLast) / timeElapsed));
        price1Average = FixedPoint.uq112x112(uint224((price1Cumulative - price1CumulativeLast) / timeElapsed));

        price0CumulativeLast = price0Cumulative;
        price1CumulativeLast = price1Cumulative;
        blockTimestampLast = blockTimestamp;
    }

    // 根据输入的代币和数量，查询等价的另一种代币的数量
    function consult(
        address token,
        uint amountIn
    ) external view returns(uint amountOut) {
        require(token == token0 || token == token1, 'UniswapV2TWAP: INVALID_TOKEN');
        if (token == token0) {
            amountOut = price0Average.mul(amountIn).decode144();
        } else {
            amountOut = price1Average.mul(amountIn).decode144();
        }
    }
}















