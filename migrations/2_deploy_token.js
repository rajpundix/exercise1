let Token = artifacts.require("./Token.sol");
const config = require('../config/config');

module.exports = async function (deployer) {
    await deployer.deploy(Token,
        config.tokenName,
        config.initialSupply,
        config.address);
}
