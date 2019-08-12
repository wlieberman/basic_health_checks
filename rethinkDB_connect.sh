#!/bin/bash

# Get the NODE_ADDRESS
NODE_ADDRESS=$(docker info --format '{{.Swarm.NodeAddr}}')

# Run the interactive container to get the information that we need
# List the rethinkDB tables
# Look at current_issues
docker container run -it -v ucp-auth-store-certs:/tls \
  --net container:ucp-auth-store \
  --rm training/reticule ${NODE_ADDRESS} 12383
r.dbList()
r.db('rethinkdb').tableList()
r.db('rethinkdb').table('current_issues')
.exit

