# Blacksmith on Docker

This repository contains images for running Blacksmith on Docker.

The purpose is to offer an environment inherited from the official Go images without
any fluff. They download and unzip adapters as well as setting environment variables.

## Usage

Images follow the convention of the official Go images:
`nunchistudio/blacksmith:<version>-<distribution>`.

- `version` is the Blacksmith version.
- `distribution` is one of `alpine`, `buster`, `stretch`. Defaults to `buster`.

An example using `docker-compose` lives in the `smithy` repository, the demo
application using Blacksmith.

- [See example](https://github.com/nunchistudio/smithy)

## Versions

- Blacksmith version: v0.10.2
- Go version: v1.14.4

## License

Repository licensed under the [Apache License, Version 2.0](./LICENSE).

Each and every adapter attached to this repository as an asset is licensed under the
[Blacksmith Adapter License](https://nunchi.studio/licenses/blacksmith-adapter).
