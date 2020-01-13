#!/bin/bash
wget https://github.com/prometheus/node_exporter/releases/download/v0.18.1/node_exporter-0.18.1.linux-amd64.tar.gz
tar xzf node_exporter-0.18.1.linux-amd64.tar.gz
mkdir /opt/monitor-prometheus
cp node_exporter-0.18.1.linux-amd64/node_exporter /usr/sbin
cp node-exporter.sh /usr/sbin 
cp node-exporter.sh /opt/monitor-prometheus
cp node-exporter /etc/init.d/
mv node_exporter-0.18.1.linux-amd64.tar.gz /opt/monitor-prometheus
chmod +x /usr/sbin/node-exporter.sh
chmod +x /opt/monitor-prometheus/node-exporter.sh
chmod +x /etc/init.d/node-exporter
chkconfig --add node-exporter
rm -rf node_exporter-0.18.1.linux-*
service node-exporter start
