const HDWalletProvider = require('@truffle/hdwallet-provider')

const privateKeys = [
    "3f841bf589fdf83a521e55d51afddc34fa65351161eead24f064855fc29c9580",
    "9549f39decea7b7504e15572b2c6a72766df0281cea22bd1a3bc87166b1ca290",
];
const provider = new HDWalletProvider(privateKeys, "https://rinkeby.infura.io/v3/7596fc2db67e49f2b7c3c70bd6f06dd2", 0, 2);

module.exports = {
    networks: {
        development: {
            host: "localhost",
            port: 8545,
            network_id: "*" // Match any network id
        },
        rinkeby: {
            // must be a thunk, otherwise truffle commands may hang in CI
            provider : provider,
            network_id: '4',
        }
    }
};

/*



module.exports = {
    networks: {
        rinkeby: {
            provider: function () {
                return new HDWalletProvider(
                    {
                        privateKeys: ["YourPrivateKey"],
                        providerOrUrl: "https://rinkeby.infura.io/v3/7596fc2db67e49f2b7c3c70bd6f06dd2",
                        chainId: 3,
                    }
                )
            },
            from: '0x974793572DD2a4a47A258eab66FB1893d0e519Dc',
            network_id: 4,
            gas: 4500000,
            gasPrice: 10000000000,
        }
    }
};

 */
