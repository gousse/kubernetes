#!/bin/bash

#TRAEFIK_HELM_VERSION="10.24.3"
TRAEFIK_HELM_VERSION="20.8.0"

# create namespace
kubectl create namespace traefik --dry-run=client -o yaml | kubectl apply -f -

# generate certificates
bash ./certs.sh

# helm traefik
helm upgrade --install -n traefik traefik traefik/traefik -f traefik-values.yaml --version $TRAEFIK_HELM_VERSION

sleep 5

# wait for traefik CRD
kubectl -n traefik wait --for condition=established --timeout=-1s crd tlsstores.traefik.containo.us

# add a traefic monitoring service
kubectl apply -n traefik -f monitoring-traefik.yaml

# add default cert store
kubectl apply -n traefik -f default-cert.yaml

echo "Waiting for pods to be ready"
kubectl wait --namespace traefik deploy/traefik --for condition=available --timeout=-1s

pod=$(kubectl get pods -n traefik -l app.kubernetes.io/instance=traefik -o jsonpath='{.items[0].metadata.name}')
kubectl -n traefik wait pod/${pod} --for condition=ready --timeout 120s
