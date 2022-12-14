#!/bin/bash
helm repo add traefik https://traefik.github.io/charts
helm repo update
echo "Show latest chart version"
helm search repo traefik
