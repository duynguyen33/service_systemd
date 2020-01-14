#!/bin/bash
### Donwload file exporter ###
wget https://github.com/prometheus/statsd_exporter/releases/download/v0.13.0/statsd_exporter-0.13.0.linux-amd64.tar.gz
tar xzf statsd_exporter-0.13.0.linux-amd64.tar.gz
cp statsd_exporter-0.13.0.linux-amd64/statsd_exporter /usr/sbin
mkdir /opt/monitor-prometheus
mv statsd_exporter-0.13.0.linux-amd64.tar.gz /opt/monitor-prometheus
rm -rf statsd_exporter-0.13.0.linux-*
cp ./statsd-exporter.service /usr/lib/systemd/system
cp ./statsd.yml /etc/nginx
systemctl daemon-reload
systemctl enable statsd-exporter
#systemctl start statsd-exporter