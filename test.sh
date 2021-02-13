#!/usr/bin/env bash
#
# A test script for validating the docker image locally.
#

# Build the image
docker build -t valheim .

# Run it!
docker run --rm --name valheim \
  --mount type=bind,source="$(pwd)/server",target=/server \
  --mount type=bind,source="$(pwd)/world-data",target=/world-data \
  --network="host" \
  -t valheim
