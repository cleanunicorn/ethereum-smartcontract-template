# include .env file and export its env vars
# (-include to ignore error if it does not exist)
-include .env

install: solc update npm

# dapp deps
update:; dapp update

# npm deps for linting etc.
npm:; yarn install

# install solc version
# example to install other versions: `make solc 0_8_2`
SOLC_VERSION := 0_8_7
solc:; nix-env -f https://github.com/dapphub/dapptools/archive/master.tar.gz -iA solc-static-versions.solc_${SOLC_VERSION}

# Build & test & deploy
build         :; dapp build
xclean         :; dapp clean
debug         :; dapp debug
lint          :; yarn run lint
test          :; dapp test # --ffi # enable if you need the `ffi` cheat code on HEVM
test-fuzz	  :; DEEP_FUZZ=true dapp test
test-coverage :; dapp test --coverage
test-forking  :; make cache; dapp test --rpc
