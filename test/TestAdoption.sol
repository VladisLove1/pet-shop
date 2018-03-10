pragma solidity ^0.4.17;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {

    Adoption adoption = Adoption(DeployedAddresses.Adoption());

    //adopt() test
    function testUserCanAdoptPet() public {
        uint returnedId = adoption.adopt(8);
        uint expected = 8;

        Assert.equal(returnedId, expected, "Adoption of pet ID 8 should be recorded");
    }
    //test retrieval of a pet's owner
    function testGetAdopterAddressByPetId() public {
        //expected owner is this contract
        address expected = this;

        address adopter = adoption.adopters(8);

        Assert.equal(expected, adopter, "owner of pet Id 8 should be recorded");
    }
    //testing retreval of all pet owners
    function testGetAdopterAddressByPetIdInArray() public {
        //expected owner is this contract's address
        address expected = this;

        address[16] memory adopters = adoption.getAdopters();

        Assert.equal(expected, adopters[8], "Owner of pet ID 8 should be recorded");
    }

}
