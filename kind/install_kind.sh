#!/bin/bash
version=v0.10.0

GO111MODULE="on" go get sigs.k8s.io/kind@${version}

#warning no version is latest alpha 
#$ go get sigs.k8s.io/kind
