#!/bin/sh

echo "[kaazvaag/deconz] Starting deCONZ..."
echo "[kaazvaag/deconz] Current deCONZ version: $DECONZ_VERSION"
echo "[kaazvaag/deconz] Web UI port: $DECONZ_WEB_PORT"
echo "[kaazvaag/deconz] Websockets port: $DECONZ_WS_PORT"

export DISPLAY=:0
rm /tmp/.X0-lock
Xvfb :0 -screen 0 1280x720x16 &
x11vnc -display :0 -usepw -forever &

if [ "$DECONZ_DEVICE" != 0 ]; then
    /usr/bin/deCONZ \
        --auto-connect=1 \
        --dbg-info=$DEBUG_INFO \
        --dbg-aps=$DEBUG_APS \
        --dbg-zcl=$DEBUG_ZCL \
        --dbg-zdp=$DEBUG_ZDP \
        --dbg-otau=$DEBUG_OTAU \
        --http-port=$DECONZ_WEB_PORT \
        --ws-port=$DECONZ_WS_PORT \
        --dev=$DECONZ_DEVICE \
        --upnp=$DECONZ_UPNP
else
    /usr/bin/deCONZ \
        --auto-connect=1 \
        --dbg-info=$DEBUG_INFO \
        --dbg-aps=$DEBUG_APS \
        --dbg-zcl=$DEBUG_ZCL \
        --dbg-zdp=$DEBUG_ZDP \
        --dbg-otau=$DEBUG_OTAU \
        --http-port=$DECONZ_WEB_PORT \
        --ws-port=$DECONZ_WS_PORT \
        --upnp=$DECONZ_UPNP
fi