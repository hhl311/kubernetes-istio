#!/bin/bash

# setup helm repository
helm repo add cilium https://helm.cilium.io/

# Preload the cilium image into each worker node in the kind cluster.
docker pull quay.io/cilium/cilium:v1.9.4
docker pull cilium/operator-generic:v1.9.4
docker pull cilium/startup-script:62bfbe88c17778aad7bef9fa57ff9e2d4a9ba0d8

kind load docker-image quay.io/cilium/cilium:v1.9.4 --name dev
kind load docker-image cilium/operator-generic:v1.9.4 --name dev
kind load docker-image cilium/startup-script:62bfbe88c17778aad7bef9fa57ff9e2d4a9ba0d8 --name dev
# install 
helm install cilium cilium/cilium --version 1.9.4 \
   --namespace kube-system \
   --set nodeinit.enabled=true \
   --set kubeProxyReplacement=partial \
   --set hostServices.enabled=false \
   --set externalIPs.enabled=true \
   --set nodePort.enabled=true \
   --set hostPort.enabled=true \
   --set bpf.masquerade=false \
   --set image.pullPolicy=IfNotPresent \
   --set ipam.mode=kubernetes
