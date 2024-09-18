#! /bin/sh

docker_yaml=docker-compose.yaml

if [ $# -lt 1 ]; then
    echo "Starting VAmpI"
    # docker-compose -f $docker_yaml down
    docker-compose -f $docker_yaml up -d
fi

if [ "$1" == "build" ]; then
    echo "Building VAmpI"
    # docker-compose -f $docker_yaml down
    docker-compose -f $docker_yaml up -d --build
fi

sleep 5

echo "Populating DB..."

# Invoke the API using curl with GET method to populate the database
api_url="http://localhost:5002/createdb"
curl_respons_createdb=$(curl -s -H "Accept: application/json" "$api_url")