#!/usr/bin/env bash
echo "Verifying that push to local docker registry works..."
docker pull alpine
docker tag alpine 10.100.198.100:5000/myfirstimage
docker push 10.100.198.100:5000/myfirstimage
curl --insecure http://10.100.198.100:5000/v2/myfirstimage/tags/list