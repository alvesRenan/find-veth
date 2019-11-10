#!/bin/bash

# Script to find the veth of a given pod on Kubernetes

if [ $# -eq 0 -o $# -gt 1 ]; then
  echo "Usage: find_veth.sh <pod_name>"
  exit 
fi

container_id=$(docker ps --format '{{.ID}},{{.Names}},{{.Command}}' | grep ${1} | grep -v "pause" | cut -f1 -d,)
container_pid=$(docker inspect --format '{{ .State.Pid }}' ${container_id})
veth_number=$(nsenter -t ${container_pid} -n ip addr | grep eth0@ | cut -f2 -d: | cut -f2 -d@ | cut -f2 -d'f')
veth=$(ip addr | grep ${veth_number} | cut -f2 -d: | cut -f1 -d@)