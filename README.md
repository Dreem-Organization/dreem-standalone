# Dreem Standalone

## Prerequisites

This setup has been tested on macOS and ubuntu. No support provided for Windows.

- Docker and docker-compose must be installed
- <https://stedolan.github.io/jq/> must be installed
- curl must be installed

## First time use

1. Run `docker-compose up -d` in a terminal
2. When everything has started, you will need to manually run the tool that configures the Kong service.
    1. Go to `kong-db-bootstrap`
    2. Run `./ kong-bootstrap-api.sh` to configure Kong Services

## Usage
