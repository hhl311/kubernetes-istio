#!/bin/bash

set -eo pipefail

dir=$(dirname $0)

echo "setting up cluster"

if ! command -v kind &> /dev/null
then
    echo "get kind https://kind.sigs.k8s.io"
    exit
fi

if ! command -v kubectl &> /dev/null
then
    echo "get kubectl https://kubernetes.io/docs/tasks/tools/install-kubectl/"
    exit
fi

echo "create cluster"
kind create cluster --name dev --config ${dir}/cluster/kind-config.yaml

kubectl cluster-info --context kind-dev