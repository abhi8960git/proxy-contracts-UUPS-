pragma solidity >=0.7.0 <0.9.0;

contract v1 {
    uint public age;

    function setAge(uint _age) external {
        age = _age;
    }
}
