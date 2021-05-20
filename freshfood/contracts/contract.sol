pragma solidity >= 0.4.0 ;
pragma experimental ABIEncoderV2;

import "./ownable.sol";

contract Storage is Ownable {
    struct Food {
        uint number;
        string name;
        string origin;
    }

    Food[] public foods;

    mapping (uint => uint) chainLengthCount;

    function addFood(uint _number, string calldata _name, string calldata _origin) external {
        foods.push(Food(_number, _name, _origin));
        chainLengthCount[_number]++;
    }

    function getFood(uint _number) external view returns (Food[] memory) {
        Food[] memory result = new Food[](chainLengthCount[_number]);
        uint counter = 0;
        for(uint i = 0; i < foods.length; i++) {
            if(foods[i].number == _number) {
                result[counter] = foods[i];
                counter++;
            }
        }

        return result;
    }
}