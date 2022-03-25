# include .env file and export its env vars
# (-include to ignore error if it does not exist)
-include .env

# Update dependencies
update:; git submodule update --init --recursive ; yarn

# npm deps for linting etc.
npm:; yarn install

# install solc version
# example to install other versions: `make solc 0_8_2`
# SOLC_VERSION := 0_8_12
# solc:; nix-env -f https://github.com/dapphub/dapptools/archive/master.tar.gz -iA solc-static-versions.solc_${SOLC_VERSION}

# Build & test & deploy
build         :; forge build
xclean        :; forge clean
# debug         :; dapp debug
lint          :; yarn run lint
test          :; forge test
watch		  :; forge test --watch src/ 
# test-coverage :; dapp test --coverage
