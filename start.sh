#!/bin/sh
sed -i "s/127.0.0.1/$host/g" /etc/nginx/conf.d/default.conf
nginx

exec "$@"
