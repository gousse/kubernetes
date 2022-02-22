#!/bin/bash

# create namespace
kubectl create namespace traefik --dry-run=client -o yaml | kubectl apply -f -

# generate certificates
bash ./certs.sh

# helm traefik
helm upgrade --install -n traefik traefik traefik/traefik -f traefik-values.yaml
# add a traefic monitoring service
kubectl apply -n traefik -f monitoring-traefik.yaml

# add default cert store
kubectl apply -n traefik -f default-cert.yaml

echo "Waiting for pods to be ready"
kubectl wait --namespace traefik deploy/traefik --for condition=available

pod=$(kubectl get pods -n traefik -l app.kubernetes.io/instance=traefik -o jsonpath='{.items[0].metadata.name}')
kubectl -n traefik wait pod/${pod} --for condition=ready --timeout 120s
