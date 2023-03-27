#!/bin/bash

## This script will create everything needed inside the PostgreSQL database for Kong to run properly
## Run like this :
##
## DB_HOST=xxx DB_USER=xxx DB_NAME=xxx PGPASSWORD=xxx WSID=xxx ./kong-bootstrap.sh
##
## DB_USER is the owner of the kong database
## DB_NAME is the name of the kong database
## WSID is the Kong Workspace ID used on the target Kong database
## NB: Run this script AFTER Kong has started and created all tables

# function psql_exec_command() {
#     psql -h $DB_HOST -U $DB_USER -d $DB_NAME
# }

# if [ -z "$WSID" ]
# then
#     echo "Missing WSID"
#     exit 1
# fi

# # SQL files should be prefixed by a number that will result in the order they will be executed
# sqlfiles=`ls ./*.sql`
# for sqlfile in $sqlfiles
# do
#     cat $sqlfile | sed -r "s/_WS_ID_/$WSID/g" | psql_exec_command
# done

export KONG_API_HOST=localhost:8001

export KONG_WS_ID=$(curl -s $KONG_API_HOST/workspaces | jq '.data[0].id')

echo "** Found Kong Workspace : $KONG_WS_ID **"

echo "** Creating Kong Services **"

kongServices=("algorythm6" "datasample" "dataupload" "dreemer" "headband" "nightreport" "record")

for kongService in ${kongServices[*]}; do
    createdServiceId=$(curl -s -request POST \
    --url http://$KONG_API_HOST/services/ \
    --header 'Content-Type: application/json' \
    --data '{
        "name": "'$kongService'",
        "protocol": "http",
        "host": "'$kongService'",
        "port": 80,
        "retries": 5,
        "read_timeout": 60000,
        "write_timeout": 60000,
        "connect_timeout": 60000,
        "enabled": true
    }' | jq .id)

    createdRouteId=$(curl -s --request POST \
    --url http://$KONG_API_HOST/routes/ \
    --header 'Content-Type: application/json' \
    --data '{
        "protocols": ["http", "https"],
        "methods": null,
        "hosts": null,
        "paths": ["/v1/dreem/'$kongService'"],
        "regex_priority": 0,
        "strip_path": false,
        "preserve_host": false,
        "service": {
            "id": '$createdServiceId'
        }
    }' | jq -r .id)

    createPluginCors=$(curl -s --request POST \
    --url http://$KONG_API_HOST/routes/$createdRouteId/plugins/ \
    --header 'Content-Type: application/json' \
    --data '{
        "name": "cors",
        "enabled": true,
        "config": {"origins": ["*"], "credentials": false, "preflight_continue": false}
    }')

    createPluginJWT=$(curl -s --request POST \
    --url http://$KONG_API_HOST/routes/$createdRouteId/plugins/ \
    --header 'Content-Type: application/json' \
    --data '{
        "name": "jwt",
        "enabled": true,
        "config": {"cookie_names": {}, "key_claim_name": "iss", "uri_param_names": ["jwt"], "claims_to_verify": {}, "run_on_preflight": true, "secret_is_base64": false, "maximum_expiration": 0}
    }')

    echo "=> Created service $kongService"
done

echo "** Kong Bootstrap finished **"