### Setup
:one: `cd augur`
```
nvm use 10
yarn
yarn build:watch
yarn docker:geth:pop-normal-time
(networkId 103 and 1s block times)
```
Pick deployed contract addresses from [here](https://github.com/AugurProject/augur/blob/master/packages/augur-artifacts/src/addresses.json); abis [here](https://github.com/AugurProject/augur/blob/master/packages/augur-artifacts/src/abi.json).

:two: `cd packages/augur-core`

```
yarn
```

## Deploy contracts and call `Predicate.trade`
```
bash test/run.sh
```

