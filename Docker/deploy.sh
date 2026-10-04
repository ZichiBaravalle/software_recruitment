#!/bin/bash

set -eu

docker build -t docker-test .

echo "Immagine creata con successo."

id_container=$(docker ps -aqf "name=docker-test-container")

if [ -n "$id_container" ]; then
   docker stop $id_container
   docker rm -f $id_container
   echo "Container esistente fermato e rimosso."
fi

docker run -d --name docker-test-container -p 127.0.0.1:3000:3000 docker-test

echo "Container avviato con successo."
