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
make # This installs the project's dependencies.
make test
```

## Features


### GitHub Actions

The template already comes with GitHub actions configured.

Check the [project's actions](https://github.com/cleanunicorn/dapptools-template/actions) for an example how this would look in your project.

It is currently defined in [.github/workflows/ci.yml](.github/workflows/ci.yml).


### Testing

Run tests:

```sh
$ make test
```

You can also run a more deeper tests suite:

```sh
$ make test-fuzz
```

### Libraries

It already comes with

- [openzeppelin-contracts](https://github.com/OpenZeppelin/openzeppelin-contracts)
- [ds-test](https://github.com/dapphub/ds-test)

You can install a new library with:

```sh
$ dapp install
```

Check the official documentation of [dapp install](https://github.com/dapphub/dapptools/tree/master/src/dapp#dapp-install).

