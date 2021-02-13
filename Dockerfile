FROM cm2network/steamcmd:steam

LABEL maintainer="mikethadley@gmail.com"

# Steam App Config
ENV STEAM_APP_DIR "/server"
ENV VALHEIM_DATA_DIR "/world-data"

# Game Server Config
ENV GAME_SERVER_NAME "Default Server Name"
ENV GAME_SERVER_PASSWORD "defaultpassword"
ENV WORLD_NAME "Dedicated"

COPY start.sh "${HOMEDIR}/start.sh"

# Mounts that you'll want to set when running
VOLUME $STEAM_APP_DIR
VOLUME $VALHEIM_DATA_DIR

CMD bash "$HOMEDIR/start.sh"

EXPOSE 2456/tcp 2456/udp
EXPOSE 2457/tcp 2457/udp
EXPOSE 2458/tcp 2458/udp

EXPOSE 27015/tcp 27015/udp
