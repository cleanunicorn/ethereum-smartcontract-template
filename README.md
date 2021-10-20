# Dapptools template

Heavily inspired by [Georgios's template](https://github.com/gakonst/dapptools-template).

## Installation

Create a folder for your project and `cd` into it. Using the commands below you will set up your template.

```sh
git clone https://github.com/cleanunicorn/dapptools-template ./
make # This installs the project's dependencies.
make test
```

## Features

### Generic caller

Most of the time you'll need to test your application for unauthorized access. In that case, you need a contract that is NOT allowed to call some methods. To do this, you can use the `User` contract and make it call whatever you need.

The user contract is able to call any method of the contract it is given. Check the test [OnlyAuthrorized.t.sol](./src/OnlyAuthrorized.t.sol) to find out how to use the generic caller.

## Testing

```sh
make test
```

### Fuzz testing

```sh
make test-fuzz
```
