#!/bin/bash
kubectl delete -f example1-foo-bar.yaml
kubectl delete -f example2-whoami.yaml
kubectl delete -f example3-http-https-echo-sslpassthrough.yaml

