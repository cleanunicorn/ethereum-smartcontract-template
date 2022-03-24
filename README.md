# Dapptools template

It is heavily inspired by [Georgios's template](https://github.com/gakonst/dapptools-template).

It requires [dapptools](https://github.com/dapphub/dapptools) installed to run properly.

## Installation

### GitHub template

It's easiest to start a new project by clicking the ["Use this template"](https://github.com/cleanunicorn/dapptools-template/generate).

### Manual installation

If you want to manually create your project clone the template in a new folder and `cd` into it.

Clone the template, install dependencies and make sure tests work:

```sh
git clone https://github.com/cleanunicorn/dapptools-template ./
# Install the project's dependencies
make 
# Run tests
make test 
```

## Features

Included libraries in [`lib`](lib/):

- [ds-test](https://github.com/dapphub/ds-test) - Test framework for DappTools
- [openzeppelin-contracts](https://github.com/OpenZeppelin/openzeppelin-contracts) - OpenZeppelin contracts library
- [mockprovider](https://github.com/cleanunicorn/mockprovider) - Mocking library

## Commands

- `make` - installs solc locally and all dependencies
- `make build` - builds your project
- `make xclean` - removes compiled files
- `make debug` - starts debug
- `make lint` - lints files
- `make test` - runs tests
- `make test-fuzz` - runs tests with higher fuzz runs
- `make test-coverage` - runs coverage showing which lines of code are covered by tests

### Testing locally

Normally you would run your tests on the local evm engine.

```sh
$ make test
```

### Testing forked chain

You can also fork a chain by providing an RPC url to something like [Alchemy](https://www.alchemy.com/) or [Infura](https://infura.io/).

To enable blockchain forking, you need to copy `.env.example` to `.env` and change `RPC_ON` and `ETH_NODE` to match your environment.

```sh
export RPC_ON=yes
export ETH_NODE=https://eth-mainnet.alchemyapi.io/v2/ALCHEMY_API_KEY
```

After that you can run `make test` normally

You also need to add these variables to your GitHub secrets to enable forking in GitHub Actions.

```yaml
# Enable this if using forking tests
env:
    ETH_NODE: ${{ secrets.ETH_NODE }}
    RPC_ON: yes
```

Also make sure to add your RPC url to GitHub's secrets section.

### GitHub Actions

The template already comes with GitHub actions configured.

Check the [project's actions](https://github.com/cleanunicorn/dapptools-template/actions) for an example.

Actions are currently defined in [.github/workflows/ci.yml](.github/workflows/ci.yml).
