#!/bin/bash

REPLICA_ID=$(docker ps -lf \
  name='^/dtr-rethinkdb-.{12}$' --format '{{.Names}}' | cut -d- -f3)

docker container run -it --rm \
  --network dtr-ol \
  -v dtr-ca-$REPLICA_ID:/ca dockerhubenterprise/rethinkcli:v2.2.0 \
  $REPLICA_ID
