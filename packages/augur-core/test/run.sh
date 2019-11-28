rm -rf output
rm test/deployedAddresses test/addresses.json
node -r ts-node/register source/deployment/compileContracts.ts
yarn deploy:local > test/deployedAddresses
node test/addressClipper.js
node test/predicateTrade.js