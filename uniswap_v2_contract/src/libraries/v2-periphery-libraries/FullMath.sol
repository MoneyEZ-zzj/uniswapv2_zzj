// SPDX-License-Identifier: CC-BY-4.0
pragma solidity >=0.8.20;

// 改了 7，16
library FullMath {
    function fullMul(uint256 x, uint256 y) internal pure returns (uint256 l, uint256 h) {
        uint256 mm = mulmod(x, y, type(uint256).max);
        l = x * y;
        h = mm < l ? mm - l - 1 : mm - l;
    }

    function fullDiv(
        uint256 l,
        uint256 h,
        uint256 d
    ) private pure returns (uint256) {
        uint256 pow2 = d & (~d + 1);
        d /= pow2;
        l /= pow2;
        l += h * ((type(uint256).max / pow2 + 1) % pow2);
        uint256 r = 1;
        for (uint i = 0; i < 8; ++i) {
            r *= 2 - d * r;  // Newton-Raphson iteration to approximate the inverse of d
        }
        return l * r;
    }

    function mulDiv(
        uint256 x,
        uint256 y,
        uint256 d
    ) internal pure returns (uint256) {
        (uint256 l, uint256 h) = fullMul(x, y);

        uint256 mm = mulmod(x, y, d);
        if (mm > l) h -= 1;
        l -= mm;

        if (h == 0) return l / d;

        require(h < d, 'FullMath: FULLDIV_OVERFLOW');
        return fullDiv(l, h, d);
    }
}
