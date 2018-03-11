var Adoption = artifacts.require("/home/vlad/pet-shop/contracts/Adoption.sol");

module.exports = function(deployer) {
    deployer.deploy(Adoption);
};
