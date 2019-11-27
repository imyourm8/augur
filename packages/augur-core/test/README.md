## Setup
```
cd augur
nvm use 10
yarn
yarn build:watch
yarn docker:geth:pop-normal-time
(networkId 103 and 1s block times)
```
Pick deployed contract addresses from [here](https://github.com/AugurProject/augur/blob/master/packages/augur-artifacts/src/addresses.json); abis [here](https://github.com/AugurProject/augur/blob/master/packages/augur-artifacts/src/abi.json).

## Deploy Augur contracts
```
cd packages/augur-core
yarn
yarn deploy:local > test/deployedAddresses
node test/addressClipper.js
```

## Run Test
```
node test/zeroXTrade.js
```
