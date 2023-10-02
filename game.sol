contract Destiny {

bytes32 public constant Dwayne = "Dwayne";
bytes32 public constant A4 = "A4";
bytes32 public constant Knife = "Knife";
mapping (address => bytes32) public choices;

function play(bytes32 choice) external {
    require(choices[msg.sender] == bytes32(0));
    choices[msg.sender] = choice;

}

function evaluate (address barbie, bytes32 barbieChoice, bytes32 barbieRandomness, address ken, bytes32 kenChoice, bytes32 kenRandomness) external view returns (address){
    require(keccak256(abi.encodePacked(barbieChoice, barbieRandomness)) == choices[barbie]);
    require(keccak256(abi.encodePacked(kenChoice, kenRandomness)) == choices[ken]);



    if(barbieChoice == kenChoice) {
        return address(0);
    }

    if (barbieChoice == Dwayne && kenChoice == A4) {
        return ken;
    } else if (kenChoice == Dwayne && barbieChoice == A4) {
        return barbie;
    } else if (barbieChoice == Knife && kenChoice == A4) {
        return barbie;
    } else if (kenChoice == Knife && barbieChoice == A4) {
        return ken;
    } else if (barbieChoice == Dwayne && kenChoice == Knife) {
        return barbie;
    } else if (kenChoice == Dwayne && barbieChoice == Knife) {
        return ken;
    }
}
}


