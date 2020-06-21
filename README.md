# Ocaml Testing Template

[![CircleCI](https://circleci.com/gh/mukul-rathi/ocaml-testing-template.svg?style=svg)](https://circleci.com/gh/mukul-rathi/ocaml-testing-template) [![Coverage Status](https://coveralls.io/repos/github/mukul-rathi/ocaml-testing-template/badge.svg?branch=master)](https://coveralls.io/github/mukul-rathi/ocaml-testing-template?branch=master)

## Tutorials

Accompanying this repo are two tutorials:

- [Dune](https://mukulrathi.netlify.app/ocaml-tooling-dune/)
- [OCaml Testing and CI](https://mukulrathi.netlify.app/ocaml-testing-frameworks/)

## The Makefile

The Makefile consists of a list of useful commands:

`make install` installs all the opam dependencies needed to use this repo

`make lint` lints your code and also checks it has been auto-formatted

`make hook` sets the git pre-commit hook to a hook that formats and lints your code.

`make doc` generates the documentation and copies it into a `docs/` folder in the root of the repo`.

`make coverage` runs the test coverage, and generates HTML output of coverage in `_coverage/`

## Generating Coveralls.io Reports

In your Circle CI project, you need to set the environment variable `$COVERALLS_REPO_TOKEN` that Coveralls provides you.

## Generating Documentation

The repo uses GitHub Pages to display the [generated documentation](http://ocamltest.mukulrathi.com/).

In the `_circleci/config.yml` file, you will need to change the "provision custom domain" step to your custom domain (or remove the step entirely).

The documentation deployment is run in a separate docker container in the CircleCI.

Be sure to update the `git config user.email` and `git config user.name` in the config file to your GitHub username and email.

For this to run successfully you need to **grant CircleCI write access** to your GitHub repo (by default the deploy key is read-only).
