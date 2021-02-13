#!/usr/bin/env bash

# build image
docker build -t valheim .

# Run it!
docker run --rm --name valheim \
  --mount type=bind,source="$(pwd)/server",target=/server \
  --mount type=bind,source="$(pwd)/world-data",target=/world-data \
  -p 2456-2458:2456-2458/tcp \
  -p 2456-2458:2456-2458/udp \
  -p 27015:27015/tcp \
  -p 27015:27015/udp \
  -t valheim
