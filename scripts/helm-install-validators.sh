#!/bin/bash

while getopts p:n:i:c:m:s: flag
do
    case "${flag}" in
        p) port=${OPTARG};;
        n) count=${OPTARG};;
        i) id_from=${OPTARG};;
        c) storage_class=${OPTARG};;
        m) use_service_monitor=${OPTARG};;
        s) service_type=${OPTARG};;
    esac
done

STATIC_PORT=${port:-30300}
NODE_COUNT=${count:-7}
ID=${id_from:-1}
SERVICE_TYPE=${service_type:-"ClusterIP"}
STORAGE_CLASS=${storage_class:-"standard"}
SERVICE_MONITOR_ENABLED=${use_service_monitor:-true}

lim=$(($NODE_COUNT+$ID-1)) 
for (( c=$ID; c<=$lim; c++ ))
do
    helm upgrade --install validator-"$c" fpt-blc-lab/goquorum-node --set node.goquorum.p2p.port=$(($STATIC_PORT+$c)) --set node.goquorum.serviceType=$SERVICE_TYPE --set storage.storageClass=$STORAGE_CLASS --set node.goquorum.metrics.serviceMonitorEnabled=$SERVICE_MONITOR_ENABLED --namespace quorum --create-namespace --values ../values/validator.yml
done