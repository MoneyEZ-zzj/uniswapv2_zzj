// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import './interfaces/IUniswapV2ERC20.sol';
// import './libraries/SafeMath.sol';

contract UniswapV2ERC20 is IUniswapV2ERC20 {
    // using SafeMath for uint;

    //代币的名片
    string public constant name = 'Uniswap V2';
    string public constant symbol = 'UNI-V2';
    uint8 public constant decimals = 18;           //代币的精度

    //这是一个全局变量，记录目前市面上总共发了多少 LP Token
    uint  public totalSupply;

    //核心账本
    mapping(address => uint) public balanceOf;

    //授权额度
    mapping(address => mapping(address => uint)) public allowance;

    //(防伪水印/印章)： 这相当于支票上的防伪水印。
    //它包含了：银行名字（Uniswap V2）、分行地址（合约地址）、所在城市（链 ID）
    bytes32 public DOMAIN_SEPARATOR;

    //这就像是银行规定的一份标准的空白支票格式
    // keccak256("Permit(address owner,address spender,uint256 value,uint256 nonce,uint256 deadline)");
    bytes32 public constant PERMIT_TYPEHASH = 0x6e71edae12b1b97f4d1f60370fef10105fa2faae0126114a169c64845d6126c9;
    
    //存储nonce值对应的地址什么的
    mapping(address => uint) public nonces;

    // event Approval(address indexed owner, address indexed spender, uint value);
    // event Transfer(address indexed from, address indexed to, uint value);

    constructor() {
        //获取当前区块链的 ID（比如以太坊主网是 1）
        uint chainId = block.chainid;

        //(域名分隔符): 它的作用是防伪
        //EIP712Domain:以太坊社区制定了 EIP-712 标准，规定了：如果你想进行“结构化数据签名”，你必须先定义一个叫 EIP712Domain 的环境描述符。

        DOMAIN_SEPARATOR = keccak256(
            abi.encode(
                keccak256('EIP712Domain(string name,string version,uint256 chainId,address verifyingContract)'),
                keccak256(bytes(name)),
                keccak256(bytes('1')),
                chainId,
                address(this)
            )
        );
    }

    //铸币
    function _mint(address to, uint value) internal {
        totalSupply += value;                          // 总供应量增加
        balanceOf[to] = balanceOf[to] + value;         // 给某个人的账本加钱
        emit Transfer(address(0), to, value);          // 广播：钱是从“无”中产生的
    }
    //销毁
    function _burn(address from, uint value) internal {
        balanceOf[from] = balanceOf[from]-value;       // 减掉用户的钱
        totalSupply = totalSupply - value ;            // 总供应量减少
        emit Transfer(from, address(0), value);        // 广播：钱销毁了
    }
    //授权
    function _approve(address owner, address spender, uint value) private {
        allowance[owner][spender] = value;
        emit Approval(owner, spender, value);
    }
    //转账
    function _transfer(address from, address to, uint value) private {
        balanceOf[from] = balanceOf[from]-value;
        balanceOf[to] = balanceOf[to]+value;
        emit Transfer(from, to ,value);
    }
    

    //对外部的函数
    //对外授权
    function approve(address spender, uint value) external returns (bool) {
        _approve(msg.sender, spender, value);
        return true;
    }

    //对外转账
    function transfer(address to, uint value) external returns (bool) {
        _transfer(msg.sender, to, value);
        return true;
    }

    // from-持币人   to-收款人or池子   msg.sender-代理人（路由合约）
    // uint(int(-1))：在计算机二进制里，-1 的补码全都是 1。把它强制转换成 uint，就变成了该类型能表示的最大值（$2^{256} - 1$）。这在代码中通常代表“无限”
    // 逻辑含义： 如果你（from）给路由合约（msg.sender）授权了无限多的额度（这是很多用户的默认操作），那么合约就跳过中间的减法计算
    // 为什么要跳过？ 在以太坊上，改写状态变量（修改存储）是非常贵的。跳过这一步可以节省 Gas
    function transferFrom(address from, address to, uint value) external returns (bool) {
        if (allowance[from][msg.sender] != uint(int(-1))) {
            allowance[from][msg.sender] = allowance[from][msg.sender] - value;
        }
        _transfer(from, to, value);
        return true;
    }

    function permit(address owner, address spender, uint value, uint deadline, uint8 v, bytes32 r, bytes32 s) external {
        // 1. 检查时间：支票过期了吗？
        require(deadline >= block.timestamp, 'UniswapV2: EXPIRED');// 检查签名是否过期

        // 2. 拼凑支票内容（结构化哈希）
        //\x19\x01：这是 EIP-712 标准规定的开头，告诉解析器这是一个“结构化数据签名”
        bytes32 digest = keccak256(
            abi.encodePacked(
                '\x19\x01',
                DOMAIN_SEPARATOR,
                keccak256(abi.encode(PERMIT_TYPEHASH, owner, spender, value, nonces[owner]++, deadline))
            )
        );

        // 3. 核心魔法：从签名推导出签名人地址
        //这是一个底层数学函数。它不需要知道你的私钥，它只需要通过数学运算就能反推出：“谁能对这段摘要签出这样的结果？”
        address recoveredAddress = ecrecover(digest, v, r, s);// 从签名中“反推”出签名人是谁

        // 4. 验证与执行：签名人必须是 owner，且不能是地址 0
        require(recoveredAddress != address(0) && recoveredAddress == owner, 'UniswapV2: INVALID_SIGNATURE');
        
        _approve(owner, spender, value);
    }
}