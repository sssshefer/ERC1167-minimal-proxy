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

contract ProxyFactory {
    mapping (address => bool) public proxies;
    event proxyCreated(address proxy);
    address public lastDeployedProxy;

    function make(address _impl) external returns(address target){
        bytes memory code = ERC6551BytecodeLib.getCreationCode(_impl);

        assembly {
            target := create(0, add(code, 0x20), mload(code))
        }

        emit proxyCreated(target);

        proxies[target] = true;
        lastDeployedProxy = target;
    }
}

contract Implementation {
    uint public a;

    function callMe(uint _a) public{
        a = _a;
    }
}