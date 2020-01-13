#!/bin/bash
wget https://github.com/prometheus/node_exporter/releases/download/v0.18.1/node_exporter-0.18.1.linux-amd64.tar.gz
tar xzf node_exporter-0.18.1.linux-amd64.tar.gz
cp node_exporter-0.18.1.linux-amd64/node_exporter /usr/sbin
chmod a+x /usr/sbin/node_exporter
cp node-exporter.service /usr/lib/systemd/system
mkdir /opt/monitor-prometheus
mv node_exporter-0.18.1.linux-amd64.tar.gz /opt/monitor-prometheus
rm -rf node_exporter-0.18.1.linux-*

systemctl daemon-reload
systemctl enable node-exporter
systemctl start node-exporter
