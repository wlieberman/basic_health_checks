#!/bin/bash

# Setup the alias to use for etcd
alias etcdctl="docker container exec -it ucp-kv etcdctl \
  --endpoint https://127.0.0.1:2379 \
  --ca-file /etc/docker/ssl/ca.pem \
  --cert-file /etc/docker/ssl/cert.pem \
  --key-file /etc/docker/ssl/key.pem"

# Check the member list
etcdctl member list

# Query the cluster health
etcdctl cluster-health

# Use ls and get
etcdctl ls
