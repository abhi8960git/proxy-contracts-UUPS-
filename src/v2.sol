pragma solidity >=0.7.0 <0.9.0;

contract v2 {
    uint public age1;
    uint public age2;

    function setAge1(uint _age1) external {
        age1 = _age1;
    }

    function setAge2(uint _age2) external {
        age2 = _age2;
    }
}
