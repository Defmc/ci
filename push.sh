#!/bin/sh
# Push a(n) docker container(s)
# Arguments:
# - 1: Container name
# - 2: Container version

pwd="$(pwd)"
pkg=$1
vers=$2
cd "$pkg"
docker buildx build -t "defmc/$pkg:latest" .
docker buildx build -t "defmc/$pkg:$vers" .
docker push "defmc/$pkg:latest"
docker push "defmc/$pkg:$vers"
cd "$pwd"
