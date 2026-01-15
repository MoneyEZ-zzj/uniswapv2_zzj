// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./libraries/Math.sol";
import "./interfaces/IERC20.sol";
import "./interfaces/IUniswapV2Pair.sol";
import {UniswapV2ERC20} from "./UniswapV2ERC20.sol";
import "./libraries/UQ112x112.sol";
import "./interfaces/IUniswapV2Factory.sol";
import "./interfaces/IUniswapV2Callee.sol";

contract UniswapV2Pair is IUniswapV2Pair, UniswapV2ERC20 {
    // using SafeMath for uint;  // 0.8.0 doesn't need SafeMath, the compiler checks for overflows

    using UQ112x112 for uint224;

    uint public constant MINIMUM_LIQUIDITY = 10**3;
    bytes4 private constant SELECTOR = bytes4(keccak256(bytes('transfer(address,uint256)')));

    address public factory;
    address public token0;
    address public token1;

    uint112 private reserve0; // the amount of token0 in the reserve
    uint112 private reserve1; // the amount of token1 in the reserve
    uint32  private blockTimestampLast; // 因为TWAP是基于时间的，所以需要记录最后一次的时间戳
    
    uint public price0CumulativeLast; // token0的价格累计值 
    uint public price1CumulativeLast; // token1的价格累计值
    uint public kLast; // reserve0 * reserve1, as of immediately after the most recent liquidity event

    constructor() {
        factory = msg.sender;
    }

    uint private unlocked = 1;
    modifier lock() {
        require(unlocked == 1, 'UniswapV2: LOCKED');
        unlocked = 0;
        _;
        unlocked = 1;
    }

    // called once by the factory at time of deployment
    function initialize(
        address _token0, 
        address _token1
    ) external {
        require(msg.sender == factory, 'UniswapV2: FORBIDDEN'); // sufficient check
        token0 = _token0;
        token1 = _token1;
    }

    function getReserves() public view returns (
        uint112 _reserve0, 
        uint112 _reserve1, 
        uint32 _blockTimestampLast
    ) {
        _reserve0 = reserve0;
        _reserve1 = reserve1;
        _blockTimestampLast = blockTimestampLast;
    }

    // if fee is on, mint liquidity equivalent to 1/6th of the growth in sqrt(k)
    function _mintFee(uint112 _reserve0, uint112 _reserve1) private returns (bool feeOn) {
        address feeTo = IUniswapV2Factory(factory).feeTo();
        feeOn = feeTo != address(0);
        uint _kLast = kLast; // gas savings
        if (feeOn) {
            if (_kLast != 0) {
                uint rootK = Math.sqrt(uint(_reserve0) * _reserve1);
                uint rootKLast = Math.sqrt(_kLast);
                if (rootK > rootKLast) {
                    uint numerator = totalSupply * (rootK - rootKLast);
                    uint denominator = rootK * 5 + rootKLast;
                    uint fee = numerator / denominator;
                    if (fee > 0) {
                        _mint(feeTo, fee);
                    }
                }
            }
        } else if (_kLast != 0) {
            kLast = 0;
        }
    }

    // Need to transfer token0 and token1 first
    function mint(address to) external lock returns (uint liquidity) {
        (uint112 _reserve0, uint112 _reserve1,) = getReserves(); // gas savings
        uint balance0 = IERC20(token0).balanceOf(address(this));
        uint balance1 = IERC20(token1).balanceOf(address(this));

        uint amount0 = balance0 - _reserve0;
        uint amount1 = balance1 - _reserve1;

        bool feeOn = _mintFee(_reserve0, _reserve1);
        uint _totalSupply = totalSupply; // gas savings, don't need to read from storage again

        if (_totalSupply == 0) {
            liquidity = Math.sqrt(amount0 * amount1) - MINIMUM_LIQUIDITY;
            _mint(address(0), MINIMUM_LIQUIDITY);
        } else {
            liquidity = Math.min(
                _totalSupply * amount0 / _reserve0, 
                _totalSupply * amount1 / _reserve1
            );
        }

        if (liquidity <= 0) {
            revert InsufficientLiquidityMinted();
        }

        _mint(to, liquidity);
        _update(balance0, balance1, _reserve0, _reserve1);

        if (feeOn) kLast = uint(reserve0) * uint(reserve1); 

        emit Mint(msg.sender, amount0, amount1);
    }

    // Need to transfer LPToken first
    function burn(address _to) public lock returns(
        uint amount0, 
        uint amount1
    ) {
        address _token0 = token0;
        address _token1 = token1;
        uint balance0 = IERC20(_token0).balanceOf(address(this));
        uint balance1 = IERC20(_token1).balanceOf(address(this));

        (uint112 _reserve0, uint112 _reserve1,) = getReserves(); // gas savings

        uint liquidity = balanceOf[address(this)];
        
        bool feeOn = _mintFee(_reserve0, _reserve1);
        uint _totalSupply = totalSupply; // gas savings, don't need to read from storage again
        
        amount0 = balance0 * liquidity / _totalSupply;
        amount1 = balance1 * liquidity / _totalSupply;
        require(amount0 > 0 && amount1 > 0, "UniswapV2: INSUFFICIENT_LIQUIDITY_BURNED");

        _burn(address(this), liquidity);
        _safeTransfer(_token0, _to, amount0);
        _safeTransfer(_token1, _to, amount1);

        // update reserves
        balance0 = IERC20(_token0).balanceOf(address(this));
        balance1 = IERC20(_token1).balanceOf(address(this));
        _update(balance0, balance1, _reserve0, _reserve1);
        if (feeOn) kLast = uint(reserve0) * uint(reserve1); // reserve0 and reserve1 are up-to-date

        emit Burn(msg.sender, amount0, amount1, _to);
    }

    // 为了交换 'token0' 至 'token1'，用户首先需要授权 'UniswapV2Pair' 合约从他们的账户使用相应数量的 'token0'。这一步是通过调用 'approve' 方法完成的。授权之后，用户通过调用 'UniswapV2Pair' 或相关路由合约上的交换函数（例如 'swapExactTokensForTokens'）来启动交换过程。在此过程中，合约将根据授权转移 'token0' 并根据流动性池的当前状态提供相应的 'token1'。
    function swap(
        uint amount0Out, 
        uint amount1Out, 
        address to, 
        bytes calldata data
    ) external lock {
        if (amount0Out == 0 && amount1Out == 0) {
            revert InsufficientOutputAmount();
        }

        (uint112 _reserve0, uint112 _reserve1,) = getReserves(); // Determine if the reserve is sufficient
        if (amount0Out > _reserve0 || amount1Out > _reserve1) {
            revert InsufficientLiquidity();
        }

        uint balance0;
        uint balance1;

        {
            address _token0 = token0;
            address _token1 = token1;
            require(to != _token0 && to != _token1, "UniswapV2: INVALID_TO");

            if (amount0Out > 0) _safeTransfer(_token0, to, amount0Out);
            if (amount1Out > 0) _safeTransfer(_token1, to, amount1Out);
            if (data.length > 0) IUniswapV2Callee(to).uniswapV2Call(msg.sender, amount0Out, amount1Out, data);
            balance0 = IERC20(_token0).balanceOf(address(this));
            balance1 = IERC20(_token1).balanceOf(address(this));
        }

        // 检查交易后的 token0 余额（balance0）是否大于交易前的储备量减去输出量（_reserve0 - amount0Out）。如果大于，说明有新的 token0 被注入到池中，因此输入量 amount0In 就是实际余额减去这个差值。如果不大于，说明没有 token0 被注入，amount0In 为0。
        uint amount0In = balance0 > _reserve0 - amount0Out ? balance0 - (_reserve0 - amount0Out) : 0;
        uint amount1In = balance1 > _reserve1 - amount1Out ? balance1 - (_reserve1 - amount1Out) : 0;
        require(amount0In > 0 || amount1In > 0, 'UniswapV2: INSUFFICIENT_INPUT_AMOUNT');

        // stack too deep
        { // 确保交换不会破坏流动性池的恒定乘积（k值不变）
            uint balance0Adjusted = balance0 * 1000 - amount0In * 3;
            uint balance1Adjusted = balance1 * 1000 - amount1In * 3;
            require(balance0Adjusted * balance1Adjusted >= uint(_reserve0) * _reserve1 * 1000**2, 'UniswapV2: K');
        }

        _update(balance0, balance1, _reserve0, _reserve1);
        emit Swap(msg.sender, amount0In, amount1In, amount0Out, amount1Out, to);
    }

    // force balances to match reserves
    // 纠正 Uniswap 流动性池合约中实际代币余额与记录的储备量不匹配的情况
    function skim(address to) external lock {
        address _token0 = token0; // gas savings
        address _token1 = token1; // gas savings
        _safeTransfer(_token0, to, IERC20(_token0).balanceOf(address(this)) - reserve0);
        _safeTransfer(_token1, to, IERC20(_token1).balanceOf(address(this)) - reserve1);
    }

    // force reserves to match balances
    function sync() external lock {
        _update(IERC20(token0).balanceOf(address(this)), IERC20(token1).balanceOf(address(this)), reserve0, reserve1);
    }

    function _update(
        uint256 balance0, 
        uint256 balance1,
        uint112 _reserve0,
        uint112 _reserve1
    ) private {
        if (balance0 > type(uint112).max || balance1 > type(uint112).max) {
            revert BalanceOverflow();
        }

        unchecked {
            // blockTimestamp 只取最后32位
            uint32 blockTimestamp = uint32(block.timestamp % 2**32);
            uint32 timeElapsed = blockTimestamp - blockTimestampLast; // 时间差

            if (timeElapsed > 0 && _reserve0 > 0 && _reserve1 > 0) {
                /*
                累积价格包含了上一次交易区块中发生的截止价格，但不会将当前区块中的最新截止价格计算进去，这个计算要等到后续区块的交易发生时进行。
                因此累积价格永远都比当前区块的最新价格（执行价格）慢那么一个区块
                */
                // 用的是reserve0 和 reserve1进行计算（上一个区块的价格），其目的是为了使当前价格比当前区块的最新价格慢一个区块
                price0CumulativeLast += uint256(UQ112x112.encode(_reserve1).uqdiv(_reserve0)) * timeElapsed;
                price1CumulativeLast += uint256(UQ112x112.encode(_reserve0).uqdiv(_reserve1)) * timeElapsed;
            }
        }
        reserve0 = uint112(balance0);
        reserve1 = uint112(balance1);
        blockTimestampLast = uint32(block.timestamp);

        emit Sync(reserve0, reserve1);
    }

    function _safeTransfer(
        address _token, 
        address _to, 
        uint value
    ) private {
        // abi.encodeWithSignature("transfer(address,uint256)", to, value)
        (bool success, bytes memory data) = _token.call(abi.encodeWithSelector(SELECTOR, _to, value));

        if (!success || (data.length > 0 && abi.decode(data, (bool)) == false)) {
            revert TransferFailed();
        }
    }

    error InsufficientLiquidityMinted();
    error InsufficientLiquidityBurned();
    error InsufficientOutputAmount();
    error InsufficientLiquidity();
    error InvalidK();
    error TransferFailed();
    error BalanceOverflow();
}