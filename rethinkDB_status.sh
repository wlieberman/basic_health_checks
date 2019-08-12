#!/bin/bash

# Get the NODE_ADDRESS
NODE_ADDRESS=$(docker info --format '{{.Swarm.NodeAddr}}')

# Set the VERSION
VERSION=$(docker image ls \
  --format '{{.Tag}}' docker/ucp-auth | head -n 1)

docker container run --rm \
  -v ucp-auth-store-certs:/tls \
  docker/ucp-auth:${VERSION} \
  --db-addr=${NODE_ADDRESS}:12383 \
  db-status
