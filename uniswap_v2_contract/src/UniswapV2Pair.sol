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

    // UQ112x112 是一种定点数表示法，用于在智能合约中高精度地表示和计算分数值，特别适用于价格计算等需要精确小数表示的场景。
    //这是把小数转换成定点数整数的操作(定点数 = 实际小数 × 放大倍数)
    using UQ112x112 for uint224;

    //这是 Uniswap 池子的"最低注册资本金"，防止坏人用一点点钱创建假池子然后诈骗别人
    uint public constant MINIMUM_LIQUIDITY = 10**3;
    
    //为了省钱（Gas）和兼容所有 ERC20 代币（包括坏学生），Uniswap 手动构造调用数据，用函数选择器这个"身份证号"来调用 transfer 函数。
    bytes4 private constant SELECTOR = bytes4(keccak256(bytes('transfer(address,uint256)')));

    address public factory;
    address public token0;
    address public token1;

    //reserve0/reserve1：使用 uint112（不是 uint256）是为了与 uint32 blockTimestampLast 一起打包成 3 个 uint256（节省 gas）
    uint112 private reserve0; // the amount of token0 in the reserve 代币0储备量
    uint112 private reserve1; // the amount of token1 in the reserve 代币1储备量
    uint32  private blockTimestampLast; // 因为TWAP是基于时间的，所以需要记录最后一次的时间戳
    
    uint public price0CumulativeLast; // token0的价格累计值 
    uint public price1CumulativeLast; // token1的价格累计值
    uint public kLast; // reserve0 * reserve1, as of immediately after the most recent liquidity event
  
    // 构造函数：在部署合约时被调用一次，初始化 factory 地址
    constructor() {
        factory = msg.sender;  // 必须是 Factory 合约
    }

    // 防止重入锁，确保在一个交易过程中不会被多次调用，引发不可预期的行为
    uint private unlocked = 1;
    modifier lock() {
        require(unlocked == 1, 'UniswapV2: LOCKED');
        unlocked = 0;
        _;
        unlocked = 1;
    }

    // initialize 是 Factory 给新生儿（Pair合约）"起名字"的过程——告诉它："你是 WETH 和 USDT 的交易对，记住你的身份！"
    // called once by the factory at time of deployment
    function initialize(
        address _token0, 
        address _token1 
    ) external {
        require(msg.sender == factory, 'UniswapV2: FORBIDDEN'); // sufficient check
        token0 = _token0;
        token1 = _token1;
    }

    // 返回当前储备量和最后更新时间戳, Uniswap 池子的实时数据接口，让所有人知道池子的实时状态。
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
    // 这里的手续费是指协议手续费（protocol fee），而不是交易手续费（trading fee）。
    // 协议手续费是指当流动性池的总储备量（k值）增长时，协议会从中抽取一部分作为手续费，奖励给协议的持有者（feeTo 地址）。
    // 这个函数的作用是根据储备量的变化来计算并铸造相应数量的流动性代币（LP tokens）作为协议手续费。
    // 具体来说，当 k 值（即储备量的乘积）增长时，协议会计算出增长部分的六分之一，并将相应数量的流动性代币铸造给 feeTo 地址。
    // 这样做的目的是为了激励协议的持有者，同时也确保流动性提供者（LPs）能够从交易中获得收益。
    // 这个机制有助于维持协议的可持续性和发展。
    // 返回值 feeOn 表示当前是否启用了协议手续费
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
    //to：流动性凭证（LP Token）发送给谁
    //liquidity：返回铸造的 LP Token 数量
    //
    // Need to transfer token0 and token1 first 户必须先转账代币到合约，然后才能调用 mint！
    function mint(address to) external lock returns (uint liquidity) {
        (uint112 _reserve0, uint112 _reserve1,) = getReserves(); // gas savings,记录添加流动性之前的池子状态。

        uint balance0 = IERC20(token0).balanceOf(address(this)); //转账后的余额
        uint balance1 = IERC20(token1).balanceOf(address(this));

        uint amount0 = balance0 - _reserve0; // 实际添加的数量,新余额 - 旧储备 = 用户存入的数量
        uint amount1 = balance1 - _reserve1;

        bool feeOn = _mintFee(_reserve0, _reserve1); //如果开启了协议手续费，先给协议 mint 一些 LP Token
        uint _totalSupply = totalSupply; // gas savings, don't need to read from storage again 从 storage 读取一次，后面重复使用

        //计算要 mint 多少流动性代币（LP Token）
        if (_totalSupply == 0) {
            liquidity = Math.sqrt(amount0 * amount1) - MINIMUM_LIQUIDITY;
            _mint(address(0), MINIMUM_LIQUIDITY);
        } else {
            liquidity = Math.min(
                _totalSupply * amount0 / _reserve0, 
                _totalSupply * amount1 / _reserve1
            );
        }

        //确保至少 mint 出一些流动性代币，否则交易会失败
        if (liquidity <= 0) {
            revert InsufficientLiquidityMinted();
        }

        //调用父合约的 _mint() 函数，给 to 地址铸造 LP Token
        //更新 reserve0, reserve1 为新的余额,更新价格累积值（用于 TWAP 预言机）
        _mint(to, liquidity);
        _update(balance0, balance1, _reserve0, _reserve1);

        if (feeOn) kLast = uint(reserve0) * uint(reserve1); //记录新的 k 值，用于下次计算协议手续费

        emit Mint(msg.sender, amount0, amount1);
    }

    // Need to transfer LPToken first 用户必须先转账 LP Token 到 Pair 合约！
    function burn(address _to) public lock returns(
        uint amount0, 
        uint amount1
    ) {
        address _token0 = token0;
        address _token1 = token1;
        uint balance0 = IERC20(_token0).balanceOf(address(this)); //把 storage 变量读到 memory 中，节省 gas
        uint balance1 = IERC20(_token1).balanceOf(address(this)); //获取当前合约的代币余额

        (uint112 _reserve0, uint112 _reserve1,) = getReserves(); // gas savings, 记录销毁流动性之前的池子状态。

        uint liquidity = balanceOf[address(this)]; // 获取合约中持有的流动性代币数量（用户刚刚转账过来的）
        
        bool feeOn = _mintFee(_reserve0, _reserve1); // 如果开启了协议手续费，先给协议 mint 一些 LP Token
        uint _totalSupply = totalSupply; // gas savings, don't need to read from storage again, 从 storage 读取一次，后面重复使用
        
        amount0 = balance0 * liquidity / _totalSupply; 
        amount1 = balance1 * liquidity / _totalSupply;
        require(amount0 > 0 && amount1 > 0, "UniswapV2: INSUFFICIENT_LIQUIDITY_BURNED");

        _burn(address(this), liquidity);
        _safeTransfer(_token0, _to, amount0); // 将对应数量的 token 转给用户
        _safeTransfer(_token1, _to, amount1);

        // update reserves
        balance0 = IERC20(_token0).balanceOf(address(this));
        balance1 = IERC20(_token1).balanceOf(address(this));
        _update(balance0, balance1, _reserve0, _reserve1);
        if (feeOn) kLast = uint(reserve0) * uint(reserve1); // reserve0 and reserve1 are up-to-date 如果开启协议手续费，记录新的 k 值

        emit Burn(msg.sender, amount0, amount1, _to);
    }

    // 为了交换 'token0' 至 'token1'，用户首先需要授权 'UniswapV2Pair' 合约从他们的账户使用相应数量的 'token0'。这一步是通过调用 'approve' 方法完成的。授权之后，用户通过调用 'UniswapV2Pair' 或相关路由合约上的交换函数（例如 'swapExactTokensForTokens'）来启动交换过程。在此过程中，合约将根据授权转移 'token0' 并根据流动性池的当前状态提供相应的 'token1'。
    function swap(
        uint amount0Out,  // 用户想要从池子中取出的 token0 数量
        uint amount1Out,  // 用户想要从池子中取出的 token1 数量
        address to,       // 接收代币的地址
        bytes calldata data  // 额外数据，用于闪电贷等高级功能      amount0Out 和 amount1Out 只能有一个大于 0！
    ) external lock {
        if (amount0Out == 0 && amount1Out == 0) {   // 必须至少输出一种代币
            revert InsufficientOutputAmount();      
        }

        (uint112 _reserve0, uint112 _reserve1,) = getReserves(); // Determine if the reserve is sufficient,查一下够不够换的
        if (amount0Out > _reserve0 || amount1Out > _reserve1) {
            revert InsufficientLiquidity();
        }

        uint balance0; // token0 交易后的余额
        uint balance1; // token1 交易后的余额

        {
            address _token0 = token0;  // gas savings
            address _token1 = token1;  //
            require(to != _token0 && to != _token1, "UniswapV2: INVALID_TO");  // 防止闪电贷攻击,收款地址不能是池子本身,否则会导致无限循环调用swap函数,从而被攻击者反复借贷代币。

            if (amount0Out > 0) _safeTransfer(_token0, to, amount0Out);  // 把用户想要的代币转给用户
            if (amount1Out > 0) _safeTransfer(_token1, to, amount1Out);  
            if (data.length > 0) IUniswapV2Callee(to).uniswapV2Call(msg.sender, amount0Out, amount1Out, data); // 如果 data 不为空，调用接收方的回调函数，支持闪电贷功能    
            balance0 = IERC20(_token0).balanceOf(address(this)); // 交易后的余额
            balance1 = IERC20(_token1).balanceOf(address(this));
        }

        // 检查交易后的 token0 余额（balance0）是否大于交易前的储备量减去输出量（_reserve0 - amount0Out）。如果大于，说明有新的 token0 被注入到池中，因此输入量 amount0In 就是实际余额减去这个差值。如果不大于，说明没有 token0 被注入，amount0In 为0。
        uint amount0In = balance0 > _reserve0 - amount0Out ? balance0 - (_reserve0 - amount0Out) : 0; 
        uint amount1In = balance1 > _reserve1 - amount1Out ? balance1 - (_reserve1 - amount1Out) : 0;
        require(amount0In > 0 || amount1In > 0, 'UniswapV2: INSUFFICIENT_INPUT_AMOUNT');   //防止用户只拿代币不给钱？

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
    // 提取多余的代币：当合约余额大于记录储备时，把多余的部分转走
    function skim(address to) external lock {
        address _token0 = token0; // gas savings
        address _token1 = token1; // gas savings

        //// 计算多余的数量 = 当前余额 - 记录储备
        _safeTransfer(_token0, to, IERC20(_token0).balanceOf(address(this)) - reserve0);
        _safeTransfer(_token1, to, IERC20(_token1).balanceOf(address(this)) - reserve1);
    }

    // force reserves to match balances
    // 手动同步储备量和实际余额,确保储备量与合约中的实际代币余额一致
    function sync() external lock {
        _update(IERC20(token0).balanceOf(address(this)), IERC20(token1).balanceOf(address(this)), reserve0, reserve1);
    }

    // 更新储备量和价格累计值的内部函数,更新池子状态并计算时间加权平均价格（TWAP）
    function _update(
        uint256 balance0, // 交易后的 token0 余额
        uint256 balance1,
        uint112 _reserve0, // 交易前的 token0 储备  
        uint112 _reserve1
    ) private {
        if (balance0 > type(uint112).max || balance1 > type(uint112).max) {    // 防止溢出
            revert BalanceOverflow();
        }

        unchecked {  // 这里用 unchecked 来节省 gas，因为我们已经通过前面的检查确保不会溢出
            /*
            blockTimestampLast 是上一次更新储备量的时间戳（32位）
            block.timestamp 是当前区块的时间戳（秒级别，通常是 Unix 时间戳）
            */  
            // blockTimestamp 只取最后32位
            uint32 blockTimestamp = uint32(block.timestamp % 2**32);  // 取模防止溢出，也足够了（32位 ≈ 136年）
            uint32 timeElapsed = blockTimestamp - blockTimestampLast; // 时间差,用 unchecked 块，允许减法溢出

            if (timeElapsed > 0 && _reserve0 > 0 && _reserve1 > 0) {  // 防止时间差为0或储备量为0
                /*
                累积价格包含了上一次交易区块中发生的截止价格，但不会将当前区块中的最新截止价格计算进去，这个计算要等到后续区块的交易发生时进行。
                因此累积价格永远都比当前区块的最新价格（执行价格）慢那么一个区块
                */
                // 用的是reserve0 和 reserve1进行计算（上一个区块的价格），其目的是为了使当前价格比当前区块的最新价格慢一个区块,从而防止价格操纵攻击。这里不是很清楚
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
        address _token, // 在调用函数中，先把 token0/token1 读到 memory，节省 gas
        address _to, 
        uint value
    ) private {  
        // abi.encodeWithSignature("transfer(address,uint256)", to, value)
        // 这里手动构造调用数据，节省 gas 并兼容所有 ERC20 代币
        // 通过低级调用（low-level call）来执行转账操作
        (bool success, bytes memory data) = _token.call(abi.encodeWithSelector(SELECTOR, _to, value));
        // 检查调用是否成功，并确保返回数据（如果有的话）表示转账成功
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