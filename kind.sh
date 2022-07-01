#!/bin/bash


source common.sh

Head "Downloading  Kind for setup environment "
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.14.0/kind-linux-amd64 

chmod +x ./kind &>/dev/null

sudo mv ./kind /usr/local/bin/kind &>/dev/null

mkdir kind && cd /kind &>/dev/null

cat <<EOF >> kind-config.yaml
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
  image: kindest/node:v1.24.0@sha256:0866296e693efe1fed79d5e6c7af8df71fc73ae45e3679af05342239cdc5bc8e
- role: worker
  image: kindest/node:v1.24.0@sha256:0866296e693efe1fed79d5e6c7af8df71fc73ae45e3679af05342239cdc5bc8e
- role: worker
  image: kindest/node:v1.24.0@sha256:0866296e693efe1fed79d5e6c7af8df71fc73ae45e3679af05342239cdc5bc8e
EOF

Head "Be Patience !! Creating Cluster for you"

kind create cluster --config kind-config.yaml 

Head "Configuring KUBECONFIG For you "

kubectl cluster-info --context kind-kind

kubectl get po -A

echo "HOLLA !! Your Cluster is ready!! Have a nice day! 👋"
