# kubernetes-istio
a sample setup scripts for provisioning istio on kind based k8s clusters

### Step 1
cilium 
metallb
istio
  istioctl install
portainer (option)
  helm install --create-namespace -n portainer portainer portainer/portainer
  '''
  1. Get the application URL by running these commands:
  export NODE_PORT=$(kubectl get --namespace portainer -o jsonpath="{.spec.ports[0].nodePort}" services portainer)
  export NODE_IP=$(kubectl get nodes --namespace portainer -o jsonpath="{.items[0].status.addresses[0].address}")
  echo http://$NODE_IP:$NODE_PORT
  '''
  **kubectl port-forward --namespace portainer service/portainer 9000:9000
sitewhere
  helm install sitewhere -n sitewhere-system --create-namespace sitewhere/sitewhere-infrastructure
dapr