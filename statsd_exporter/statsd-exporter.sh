#!/bin/sh

cmd="/usr/sbin/statsd_exporter --statsd.listen-udp=127.0.0.1:8125 --statsd.listen-tcp=127.0.0.1:8125 --statsd.mapping-config=/etc/nginx/statsd.yml "

$cmd &