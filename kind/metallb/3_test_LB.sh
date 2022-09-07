#!/bin/bash
LB_IP=$(kubectl get svc/foo-service -o=jsonpath='{.status.loadBalancer.ingress[0].ip}')

echo "Calling 10 time ${LB_IP}:5678"
for _ in {1..10}; do
  curl ${LB_IP}:5678
done
