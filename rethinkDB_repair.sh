#!/bin/bash
# If you need to do an emergency repair of your rethinkDB, then do the below
# steps

# Get the NODE_ADDRESS
NODE_ADDRESS=$(docker info --format '{{.Swarm.NodeAddr}}')

# Set the VERSION
VERSION=$(docker image ls \
  --format '{{.Tag}}' docker/ucp-auth | head -n 1)

NUM_MANAGERS=$(docker node ls \
  --filter role=manager -q | wc -l)
docker container run \
  --rm -v ucp-auth-store-certs:/tls docker/ucp-auth:${VERSION} \
  --db-addr=${NODE_ADDRESS}:12383 \
  --debug reconfigure-db \
  --num-replicas ${NUM_MANAGERS} \
  --emergency-repair
