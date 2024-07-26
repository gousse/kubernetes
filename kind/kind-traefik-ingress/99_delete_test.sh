#!/bin/bash
kubectl delete -f example1-foo-bar.yaml
kubectl delete -f example2-whoami.yaml
kubectl delete -f example3-http-https-echo-traefikSSLTerminaison.yaml
kubectl delete -f example4-http-https-passthrough.yaml
kubectl delete -f example5_https2https_traefikfwd.sh
