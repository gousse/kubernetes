#!/bin/bash
curl -sLO https://kind.sigs.k8s.io/examples/loadbalancer/usage.yaml
kubectl apply -f usage.yaml

