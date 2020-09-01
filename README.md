# Blacksmith on Docker

This repository contains images for running Blacksmith on Docker.

The purpose is to offer an environment inherited from the official Go images without
any fluff. They download, unzip, and install the Blacksmith CLI.

## Images

Images follow the convention:
`nunchistudio/blacksmith[-edition]:[version][-distribution]`.

- `edition` is the Blacksmith edition and is one of `standard`, `enterprise.`
  Defaults to `standard`.
- `version` is the Blacksmith version.
- `distribution` is one of `alpine`, `buster`. Defaults to `buster`.

## Usage

In a `Docker-compose.yml`:
```yml
version: "3"

services:
  blacksmith_gateway:
    image: "nunchistudio/blacksmith-standard:0.11.0-alpine"
    restart: "unless-stopped"
    volumes:
      - "./:/app"
    working_dir: "/app"
    entrypoint: "blacksmith start --service gateway"
    environment:
      NATS_SERVER_URL: ""
      POSTGRES_STORE_URL: ""
      POSTGRES_WANDERER_URL: ""
    ports:
      - "8080:8080"

  blacksmith_scheduler:
    image: "nunchistudio/blacksmith-standard:0.11.0-alpine"
    restart: "unless-stopped"
    volumes:
      - "./:/app"
    working_dir: "/app"
    entrypoint: "blacksmith start --service scheduler"
    environment:
      NATS_SERVER_URL: ""
      POSTGRES_STORE_URL: ""
      POSTGRES_WANDERER_URL: ""
    ports:
      - "8081:8081"
```

## Versions

- **Blacksmith version:** v0.11.0
- **Go version:** v1.15.0

## License

Repository licensed under the [Apache License, Version 2.0](./LICENSE).
