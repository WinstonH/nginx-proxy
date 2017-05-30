#!/bin/sh
echo ":80 {
 gzip
 proxy / http://$host
}" > /usr/local/caddy/Caddyfile
cd /usr/local/caddy
./caddy -conf /usr/local/caddy/Caddyfile
