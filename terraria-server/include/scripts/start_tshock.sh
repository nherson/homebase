#!/bin/bash

[ -n "$TSHOCK_WORLD_NAME" ] || (echo "ERROR: TSHOCK_WORLD_NAME not set" && exit 1)

./TShock.Server \
  -world /storage/worlds/$TSHOCK_WORLD_NAME.wld \
  -autocreate 1 \
  -motd "World created by Homebase! :)" \