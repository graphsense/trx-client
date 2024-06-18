# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).


## [24.06.0] - 2024-06-18
### Changed
- bump version v4.7.4 -> v4.7.5


## [24.01.4] - 2024-04-15
### Changed
- bump version v4.7.2 -> v4.7.3

## [24.01.3] - 2024-01-05
### Changed
- retired semantic versions, new versions are based on vYEAR.MONTH.VERSION
- fix ci bugs

## [24.01/1.3.0] - 2024-01-05
### Changed
- BREAKING: change mount paths to /home/dockeruser/output-directory -> /opt/graphsense/data, /home/dockeruser/main_net_config.conf -> /opt/graphsense/client.conf

## [23.09/1.2.2] - 2023-12-18
### Changed
- set vm.supportConstant = true in main_net_config.conf
- bump version v4.7.2 -> v4.7.3

## [23.09/1.2.1] - 2023-09-20
### Changed
- setup automatic docker file publish on github packages

## [23.09/1.2.0] - 2023-09-15
### Changed
- enable save internal tx option

## [23.06/1.1.0] - 2023-09-15
### Changed
- bump version 4.7.1.1 -> 4.7.2
- expose http api ports in docker compose (58090:8090, 58091:8091)

## [23.06/1.0.0] - 2023-06-12
### Changed
- first version