#!/bin/sh

cmd="/usr/sbin/node_exporter --collector.tcpstat --collector.mountstats --collector.buddyinfo --collector.interrupts --collector.ksmd --collector.processes --collector.meminfo_numa"
cmd01="/usr/sbin/statsd_exporter    --statsd.listen-udp=127.0.0.1:8125 --statsd.listen-tcp=127.0.0.1:8125 --statsd.mapping-config=/etc/nginx/statsd_image.yml"
cmd02="/usr/sbin/nginx-prometheus-exporter -nginx.scrape-uri http://localhost/status"

$cmd &
$cmd01 &
$cmd02 &