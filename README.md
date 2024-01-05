# Tron Docker container

A Docker container running [Tron][tron] as a service and exposing
the REST API.

## Prerequisites

- [Docker][docker], see e.g. https://docs.docker.com/engine/install/
- Docker Compose: https://docs.docker.com/compose/install/

Ensure that a user `dockeruser` with ID `10000` exists on your local system.

## Configuration

A default config file for the client is provided in `conf/main_net_config.conf` according to your environment.
By default the conf file is copied into the container at /opt/graphsense/client.conf.

Client data is persisted on the host machine using a Docker volume.
In the default setting the local directory `./data` is mapped to
to `/opt/graphsense/data` inside the container.
Logs are stored in the log directory created by the tron client 
which resides in `/opt/graphsense/logs` and is by default mapped
to `./logs/`. To override these settings 
a Docker Compose override file can be used, e.g.

```
> cat docker-compose.override.yml
version: "3.1"

services:
  tron-client:
    volumes:
      - ./data:/opt/graphsense/data
      - ./logs:/opt/graphsense/logs
```

The data directory on the host system must be writeable by user `dockeruser`. To provide your own customized java-tron config, just map it at ```/opt/graphsense/client.conf```.

## Usage

Building the docker container (via docker-compose).

    make build

Starting the container (in detached mode):

    make run

Showing log information:

    docker-compose logs

## Fetch from docker

To receive the image via the github docker hub run:
```bash
docker pull ghcr.io/graphsense/trx-client

```



[tron]: https://tron.network/
[docker]: https://www.docker.com
