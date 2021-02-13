#!/usr/bin/env bash

# build image
docker build -t valheim .

# Run it!
docker run --rm --name valheim \
  --mount type=bind,source="$(pwd)/server",target=/server \
  --mount type=bind,source="$(pwd)/world-data",target=/world-data \
  --network="host" \
  -t valheim
