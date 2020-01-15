#!/bin/sh

cmd="/usr/sbin/nginx-prometheus-exporter -nginx.scrape-uri http://localhost/status"

$cmd &
