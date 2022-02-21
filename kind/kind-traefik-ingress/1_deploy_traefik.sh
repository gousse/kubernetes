#!/bin/bash


# create namespace
kubectl create namespace traefik --dry-run=client -o yaml | kubectl apply -f -

# helm traefik
helm upgrade --install -n traefik traefik traefik/traefik -f traefik-values.yaml
# add a traefic monitoring service
kubectl apply -n traefik -f monitoring-traefik.yaml

echo "Waiting for pods to be ready"
kubectl wait --namespace traefik deploy/traefik --for condition=available
