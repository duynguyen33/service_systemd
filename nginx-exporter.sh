#!/bin/sh

cmd="/usr/sbin/nginx-prometheus-exporter -nginx.scrape-uri http://localhost:8080/status"

$cmd &
