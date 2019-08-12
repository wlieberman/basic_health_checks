#!/bin/bash

# Find the replica ID of the replica on the unhealthy node by running the following

docker container ls -lf name='^/dtr-rethinkdb-.{12}$' \
  --format '{{.Names}}' \
  | cut -d- -f3

# From the healthy replica, use the DTR bootstrapper to remove the unhealthy
# replica gracefully

docker container run docker/dtr:2.7.1 remove \
  --replica-ids <UNHEALTHY replica ID> \
  --existing-replica-id <HEALTHY replica ID> \
  --ucp-url https://<UCP_URL> \
  --ucp-insecure-tls \
  --ucp-username admin
