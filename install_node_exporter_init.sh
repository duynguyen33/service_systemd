#!/bin/bash
#wget https://github.com/prometheus/node_exporter/releases/download/v0.18.1/node_exporter-0.18.1.linux-amd64.tar.gz
tar xzf node_exporter-0.18.1.linux-amd64.tar.gz
cp node_exporter-0.18.1.linux-amd64/node_exporter /usr/sbin
cp node_exporter.sh /usr/sbin
cp node_exporter /etc/init.d/
chmod +x /usr/sbin/node_exporter.sh
chmod +x /etc/init.d/node_exporter
chkconfig --add node_exporter
mkdir /opt/monitor-prometheus
mv node_exporter-0.18.1.linux-amd64.tar.gz /opt/monitor-prometheus
rm -rf node_exporter-0.18.1.linux-*
service node_exporter start
