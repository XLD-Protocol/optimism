// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

import { WETH98 } from "src/dispute/weth/WETH98.sol";
import { Predeploys } from "src/libraries/Predeploys.sol";
import { L1Block } from "src/L2/L1Block.sol";

/// @title WETH contract that reads the name and symbol from the L1Block contract
contract WETH is WETH98 {
    /// @notice Returns the name of the token from the L1Block contract
    function name() external view override returns (string memory) {
        return string.concat(
            "Wrapped ", string(abi.encodePacked(L1Block(Predeploys.L1_BLOCK_ATTRIBUTES).gasPayingTokenName()))
        );
    }

    /// @notice Returns the symbol of the token from the L1Block contract
    function symbol() external view override returns (string memory) {
        return
            string.concat("W", string(abi.encodePacked(L1Block(Predeploys.L1_BLOCK_ATTRIBUTES).gasPayingTokenSymbol())));
    }
}
