#!/bin/bash

set -ex

if [ "$CI" == "bootstrap" ]; then
    # ensure correct path
    mkdir -p $GOPATH/src/istio.io
    mv $GOPATH/src/github.com/istio/test-infra $GOPATH/src/istio.io
    cd $GOPATH/src/istio.io/test-infra/
fi

echo "=== Building ==="
bazel build //...

echo "=== Testing ==="
bazel test //...

echo "=== Linting ==="
./scripts/linters.sh