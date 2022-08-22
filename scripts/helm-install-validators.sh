#!/bin/bash

STATIC_PORT=${1:-30300}

helm upgrade --install validator-1 --set node.goquorum.p2p.port=$STATIC_PORT ../charts/goquorum-node --namespace quorum --values ../values/validator.yml & \
helm upgrade --install validator-2 --set node.goquorum.p2p.port=$(($STATIC_PORT+1)) ../charts/goquorum-node --namespace quorum --values ../values/validator.yml & \
helm upgrade --install validator-3 --set node.goquorum.p2p.port=$(($STATIC_PORT+2)) ../charts/goquorum-node --namespace quorum --values ../values/validator.yml & \
helm upgrade --install validator-4 --set node.goquorum.p2p.port=$(($STATIC_PORT+3)) ../charts/goquorum-node --namespace quorum --values ../values/validator.yml & \
helm upgrade --install validator-5 --set node.goquorum.p2p.port=$(($STATIC_PORT+4)) ../charts/goquorum-node --namespace quorum --values ../values/validator.yml & \
helm upgrade --install validator-6 --set node.goquorum.p2p.port=$(($STATIC_PORT+5)) ../charts/goquorum-node --namespace quorum --values ../values/validator.yml & \
helm upgrade --install validator-7 --set node.goquorum.p2p.port=$(($STATIC_PORT+6)) ../charts/goquorum-node --namespace quorum --values ../values/validator.yml