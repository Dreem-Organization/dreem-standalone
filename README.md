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
3. You will need to manually create all buckets for object storage with minio
    1. Go to <http://localhost:9001/> and enter the following credentials : `Username: minio_user` `Password: minio_password`
    2. Click on **Buckets** on the left menu
    3. Click on **Create Bucket +** and enter the Bucket Name
    4. Click on **Create Bucket** to submit
    5. Repeat steps 3 and 4 to create all buckets with the following names :
        1. `dreem-algorythm`
        2. `dreem-record`
        3. `dreem-nightreport`
        4. `dreem-dreemer`
        5. `dreem-dataupload`

## Usage
