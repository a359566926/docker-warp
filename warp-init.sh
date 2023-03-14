#!/bin/sh

warp-svc &
sleep 5
warp-cli --accept-tos status

warp-cli --accept-tos register
warp-cli --accept-tos status

warp-cli --accept-tos set-mode proxy
warp-cli --accept-tos set-proxy-port 40001
warp-cli --accept-tos connect
warp-cli --accept-tos status

# use socat to expose bind address from 127.0.0.1 to 0.0.0.0
socat TCP-LISTEN:40000,fork,reuseaddr TCP4:127.0.0.1:40001 &
bash
