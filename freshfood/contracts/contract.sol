pragma solidity >= 0.4.0 ;
pragma experimental ABIEncoderV2;

contract Storage {
    struct Food {
        uint number; // 식별 번호
        string name; // 식자재 명
        string origin; // 원산지
        string author; // 등록자
    }
    
    Food[] private foods;
    uint private number;
    mapping (uint => uint) chainLengthCount; // 특정 식자재의 등록된 유통 과정 수

    // 새로운 식자재 추가
    function addFood(string calldata _name, string calldata _origin, string calldata _author) external {
        foods.push(Food(++number, _name, _origin, _author));
        chainLengthCount[number]++;
    }

    // 식자재의 번호를 받아온다.
    function getNumber() external view returns (uint) {
        return number;
    }

    // 등록된 식자재에 대해 유통 과정을 추가하기 위한 함수
    // 번호를 이용하여 해당 식자재의 데이터를 가져온다.
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
