#!/bin/bash
#wget https://github.com/prometheus/node_exporter/releases/download/v0.18.1/node_exporter-0.18.1.linux-amd64.tar.gz
tar xzf node_exporter-0.18.1.linux-amd64.tar.gz
mkdir /opt/monitor-prometheus
cp node_exporter-0.18.1.linux-amd64/node_exporter /usr/sbin
cp node_exporter.sh /usr/sbin 
cp node_exporter.sh /opt/monitor-prometheus
cp node_exporter /etc/init.d/
mv node_exporter-0.18.1.linux-amd64.tar.gz /opt/monitor-prometheus
chmod +x /usr/sbin/node_exporter.sh
chmod +x /opt/monitor-prometheus/node_exporter.sh
chmod +x /etc/init.d/node_exporter
chkconfig --add node_exporter
rm -rf node_exporter-0.18.1.linux-*
service node_exporter start
