#!/bin/bash
kubectl apply -f example1-foo-bar.yaml
kubectl apply -f example2-whoami.yaml
kubectl apply -f example3-http-https-echo-traefikSSLTerminaison.yaml
kubectl apply -f example4-http-https-echo-sslpassthrough.yaml
