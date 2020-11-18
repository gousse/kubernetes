#!/bin/bash
version=v0.9.0

GO111MODULE="on" go get sigs.k8s.io/kind@${version}

#latest alpha
#go get sigs.k8s.io/kind
