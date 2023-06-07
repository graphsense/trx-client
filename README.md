# Tron Docker container

A Docker container running [Tron][bitcoin] as a service and exposing
the REST API.

## Prerequisites

- [Docker][docker], see e.g. https://docs.docker.com/engine/install/
- Docker Compose: https://docs.docker.com/compose/install/

Ensure that a user `dockeruser` with ID `10000` exists on your local system.

## Configuration

A default config file for the client is provide in `conf/main_net_config.conf` according to your environment.
By default the conf file is copied into the container at /home/dockeruser/main_net_config.conf.

Client data is persisted on the host machine using a Docker volume.
In the default setting the local directory `./data` is mapped to
to `/home/dockeruser/output-directory` inside the container.
The same is true for the log directory produce by the tron client 
which resides in `/home/dockeruser/logs` and is by default mapped
to `./logs/`. To override these settings 
a Docker Compose override file can be used, e.g.

```
> cat docker-compose.override.yml
version: "3.1"

services:
  bitcoin-client:
    volumes:
      - /var/data/graphsense/clients/btc:/home/dockeruser/output-directory
      - /var/data/graphsense/clients/btc:/home/dockeruser/logs
```

The data directory on the host system must be writeable by user `dockeruser`.

## Usage

Building the docker container (via docker-compose).

    make build

Starting the container (in detached mode):

    make run

Showing log information:

    docker-compose logs


[tron]: https://tron.network/
[docker]: https://www.docker.com
[bitcoin-conf]: https://en.bitcoin.it/wiki/Running_Bitcoin#Bitcoin.conf_Configuration_File
