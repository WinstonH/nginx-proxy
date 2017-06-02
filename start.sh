#!/bin/sh
echo "0.0.0.0 80 $host 80" >> /etc/rinetd.conf
/usr/sbin/rinetd -c /etc/rinetd.conf
