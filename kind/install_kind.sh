#!/bin/bash
version=v0.7.0

GO111MODULE="on" go get sigs.k8s.io/kind@${version}
