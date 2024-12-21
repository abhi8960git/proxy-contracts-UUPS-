// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {v1} from "../src/v1.sol";
import {v2} from "../src/v2.sol";
import {ProxyContract} from "../src/proxy.sol";

contract CounterScript is Script {
    v1 public logicV1;
    v2 public logicV2;
    ProxyContract public proxy;

    function setUp() public {}

    function run() public {
        uint privateKey = vm.envUint("PRIVATE_KEY");
        address account = vm.addr(privateKey);
        console.log("account", account);

        vm.startBroadcast(privateKey);
     // Deploy the logic contracts
        logicV1 = new v1();
        console.log("v1 deployed at:", address(logicV1));

        logicV2 = new v2();
        console.log("v2 deployed at:", address(logicV2));

        // Deploy the proxy contract
        proxy = new ProxyContract();
        console.log("ProxyContract deployed at:", address(proxy));

        // Upgrade the proxy to use the v1 logic contract
        proxy.upgrade(address(logicV1));
        console.log("Proxy upgraded to use v1 at:", address(logicV1));

        vm.stopBroadcast();
    }
}
