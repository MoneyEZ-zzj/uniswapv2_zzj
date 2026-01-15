// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./UniswapV2Pair.sol";
import "./interfaces/IUniswapV2Factory.sol";
import "../lib/forge-std/src/Test.sol";

contract UniswapV2Factory is IUniswapV2Factory, Test {
    address public feeTo;          // 手续费接收地址（谁能分红）Uniswap V2 默认不收协议手续费（全给流动性提供者 LP），但如果这个地址被设置了，协议就会抽走一部分手续费。
    address public feeToSetter;    //谁有权限改手续费地址（大管家）

    mapping(address => mapping(address => address)) public getPair;// 查字典：两个币对应哪个交易对
    address[] public allPairs;     // 数组：记录全网所有交易对地址
    
    constructor(address _feeToSetter) {
        feeToSetter = _feeToSetter;
    }

    //返回目前全网通过这个工厂合约创建的交易对（Pair）的总数量。
    function allPairsLength() external view returns (uint) {
        return allPairs.length;
    }

    // 设置收取交易费用的地址
    function setFeeTo(address _feeTo) external {
        require(msg.sender == feeToSetter, 'UniswapV2: FORBIDDEN');
        feeTo = _feeTo;
    }

    // 用于更改 feeToSetter 的地址，即更改谁有权限来设置 feeTo 地址
    function setFeeToSetter(address _feeToSetter) external {
        require(msg.sender == feeToSetter, 'UniswapV2: FORBIDDEN');
        feeToSetter = _feeToSetter;
    }

    function createPair(
        address tokenA, 
        address tokenB
    ) external returns (address pair) {
        if (tokenA == tokenB) {
            revert IdenticalAddresses();
        }

        (address token0, address token1) = tokenA < tokenB ? (tokenA, tokenB) : (tokenB, tokenA);
    
        if (token0 == address(0)) {
            revert ZeroAddress();
        }

        if (getPair[token0][token1] != address(0)) {
            revert PairExists();
        }

        //这里不会，回头看一下
        bytes memory bytecode = type(UniswapV2Pair).creationCode;
        // 参考：https://learnblockchain.cn/article/8887
        // bytes32 hash = keccak256(abi.encodePacked(bytecode));
        // console.log("here here here: ");
        // console.logBytes32(hash);

        bytes32 salt = keccak256(abi.encodePacked(token0, token1));
        assembly {
            pair := create2(0, add(bytecode, 32), mload(bytecode), salt)
        }

        IUniswapV2Pair(pair).initialize(token0, token1);

        // 注册
        getPair[token0][token1] = pair;
        getPair[token1][token0] = pair;
        allPairs.push(pair);

        emit PairCreated(token0, token1, pair, allPairs.length);
    }

    
    error IdenticalAddresses();
    error PairExists();
    error ZeroAddress();
}