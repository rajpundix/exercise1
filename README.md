
# Smart Contract

Application is used to build and deploy new token (RAJ) with initial supply of 100000

- Token.sol

Client Application built using React. Please view the necessary steps under client folder

## To run the application.

- npm install -g truffle
- npm install  
- Make sure this address has necessary funds - 0xc515DB5834d8f110Eee96C3036854DBF1d87DE2b  
- truffle migrate --network rinkeby --reset --compile-all

## Basic configuration

To modify the configuration of infura project id, please navigate to truffle-config.js
and replace the key at the end of url
https://rinkeby.infura.io/v3/7596fc2db67e49f2b7c3c70bd6f06dd2

Configuration related to initial supply, tokenname can be found at config folder

## Post deployment steps
https://ropsten.etherscan.io/address/0x974793572DD2a4a47A258eab66FB1893d0e519Dc

Verified and published contract on etherscan at this location -https://rinkeby.etherscan.io/address/0x5fcace51c72a1f6e6b34a444cd18f969fd2a1ec6#code
