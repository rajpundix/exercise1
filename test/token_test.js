const { expect } = require('chai');

// Import utilities from Test Helpers
const { BN, expectEvent, expectRevert, constants } = require('@openzeppelin/test-helpers');

// Load compiled artifacts
const SimpleToken = artifacts.require('Token');

// Start test block
contract('Token', function ([creator, other]) {

    const NAME = 'Token';
    const SYMBOL = 'SIM';
    const TOTAL_SUPPLY = new BN('10000000000000000000000');

    beforeEach(async function () {
        this.token = await Token.new(NAME, SYMBOL, TOTAL_SUPPLY, { from: creator });
    });

    it('retrieve returns a value previously stored', async function () {
        // Use large integer comparisons
        expect(await this.token.totalSupply()).to.be.bignumber.equal(TOTAL_SUPPLY);
    });

    it('has a name', async function () {
        expect(await this.token.name()).to.be.equal(NAME);
    });

    it('assigns the initial total supply to the creator', async function () {
        expect(await this.token.balanceOf(creator)).to.be.bignumber.equal(TOTAL_SUPPLY);
    });
});