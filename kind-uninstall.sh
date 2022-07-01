#!/bin/bash
rm -rf ./kind

rm -rf ./kind-config.yaml

kind delete cluster

sleep 5

echo "HOLLA !! Your Cluster got deleted  bye bye !!  Go home now Signout please !! 👋"

