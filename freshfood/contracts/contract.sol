pragma solidity >= 0.4.0 ;
pragma experimental ABIEncoderV2;

contract Storage {
    struct Food {
        uint number;
        string name;
        string origin;
        string author;
    }

    Food[] private foods;
    uint private number;
    mapping (uint => uint) chainLengthCount;

    // 새로운 식자재 추가
    function addFood(string calldata _name, string calldata _origin, string calldata _author) external {
        foods.push(Food(++number, _name, _origin, _author));
        chainLengthCount[number]++;
    }

    function getNumber() external view returns (uint) {
        return number;
    }

    function getFoodData(uint _number) internal view returns (string memory, string memory) {
        string memory name = '';
        string memory origin = '';
        for(uint i = 0; i < foods.length; i++) {
            if(foods[i].number == _number) {
                name = foods[i].name;
                origin = foods[i].origin;
                break;
            }
        }

        return (name, origin);
    }

    // 특정 식자재의 유통과정 정보 추가
    function modifyFood(uint _number, string calldata _author) external {
        string memory _name;
        string memory _origin;
        (_name, _origin) = getFoodData(_number);
        foods.push(Food(_number, _name, _origin, _author));
        chainLengthCount[_number]++;
    }

    // 번호를 통해 식자재 유통 정보를 반환
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