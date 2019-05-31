#!/usr/bin/env bash
docker run -it --rm --init \
  --ipc=host \
  --network=host \
  -e DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
  -v $XAUTHORITY:/root/.Xauthority \
  corenel/game-controller \
  $@
