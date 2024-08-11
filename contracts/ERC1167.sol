// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

library ERC6551BytecodeLib {
    function getCreationCode(address _impl) internal pure returns (bytes memory) {
        return
            abi.encodePacked(
                hex"3d60ad80600a3d3981f3363d3d373d3d3d363d73",
                _impl,
                hex"5af43d82803e903d91602b57fd5bf3"
            );
    }
}

contract ERC1167 {
   
}
