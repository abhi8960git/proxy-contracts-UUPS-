// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract ProxyContract {
    bytes32 private constant _OWNER_SLOT = keccak256("proxy.admin");
    bytes32 private constant _SCWBL_SLOT = keccak256("proxy.logic");

    constructor (){
        bytes32 slot = _OWNER_SLOT;
        address _admin = msg.sender;

        assembly {
            sstore(slot,_admin)
        }
    }


    function admin() public view returns(address owner){
       bytes32 slot = _OWNER_SLOT;

       assembly {
        owner :=sload(slot)
       }
    }

    function samart_contract_with_logic() external view returns(address _contract_with_logic){
        bytes32 slot = _SCWBL_SLOT;

        assembly {
            _contract_with_logic := sload(slot)
        }
    }

    function upgrade(address _new_contract) external {
        require(msg.sender == admin(), "You are not admin");

        bytes32 slot = _SCWBL_SLOT;
        assembly {
            sstore(slot,_new_contract)
        }
    }


    fallback() external payable {
        bytes32 slot = _SCWBL_SLOT;

        assembly {
            let _target := sload(slot)

            calldatacopy(0x0,0x0,calldatasize())

            let result := delegatecall(gas(), _target, 0x00, calldatasize(), 0x00, 0x00)

            returndatacopy(0x0,0x0,returndatasize())

            switch result

            case 0{
                revert(0, returndatasize())
            }
            default {
                return(0, returndatasize())
            }
            
        }
    }




}