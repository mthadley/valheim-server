#!/usr/bin/env bash
set -eo pipefail

# Make sure volume mount directories exist
# mkdir -p "$STEAM_APP_DIR"
# mkdir -p "$VALHEIM_DATA_DIR"

# Update/install game server
bash "$STEAMCMDDIR/steamcmd.sh" \
  +login anonymous \
  +force_install_dir "$STEAM_APP_DIR" \
  +app_update 896660 \
  +quit


# Some junk found in the start script distributed with the dedicated server
# steam pacakge. Not sure which of these are actually needed.
export templdpath=$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=./linux64:$LD_LIBRARY_PATH
export SteamAppId=892970 # Why is this needed?

cd "$STEAM_APP_DIR"

# From the original start script:
#
#     NOTE: Minimum password length is 5 characters & Password cant be in the server name.
#
./valheim_server.x86_64 \
  -no-graphics \
  -name "$GAME_SERVER_NAME" \
  -port 2456 \
  -world "$WORLD_NAME" \
  -password "$GAME_SERVER_PASSWORD" \
  -savedir "$VALHEIM_DATA_DIR"

export LD_LIBRARY_PATH=$templdpath
