#!/bin/bash

set -eu

container_name="docker-test-container"

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

docker build -t docker-test "$script_dir"

echo "Immagine creata con successo."

id_container=$(docker ps -a -f "name=$container_name" --format "{{.ID}} {{.Names}}" | awk '$2 == "'$container_name'" { print $1 }')

if [ -n "$id_container" ]; then
   docker stop $id_container
   docker rm -f $id_container
   echo "Container esistente fermato e rimosso."
fi

docker run -d --name "$container_name" -p 127.0.0.1:3000:3000 docker-test

echo "Container avviato con successo."
