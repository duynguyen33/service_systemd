#!/bin/bash
wget https://github.com/prometheus/node_exporter/releases/download/v0.18.1/node_exporter-0.18.1.linux-amd64.tar.gz
wget https://github.com/prometheus/statsd_exporter/releases/download/v0.13.0/statsd_exporter-0.13.0.linux-amd64.tar.gz
tar xzf node_exporter-0.18.1.linux-amd64.tar.gz
tar xzf statsd_exporter-0.13.0.linux-amd64.tar.gz
mkdir /opt/monitor-prometheus
cp node_exporter-0.18.1.linux-amd64/node_exporter /usr/sbin
cp statsd_exporter-0.13.0.linux-amd64/statsd_exporter /usr/sbin
cp nginx-prometheus-exporter /usr/sbin
cp node-exporter.sh /usr/sbin
cp statsd-exporter.sh /usr/sbin
cp nginx-exporter.sh /usr/sbin
cp node-exporter.sh /opt/monitor-prometheus
cp statsd-exporter.sh /opt/monitor-prometheus
cp nginx-exporter.sh /opt/monitor-prometheus
cp node-exporter /etc/init.d/
cp statsd-exporter /etc/init.d/
cp nginx-exporter /etc/init.d/
mv node_exporter-0.18.1.linux-amd64.tar.gz /opt/monitor-prometheus
mv statsd_exporter-0.13.0.linux-amd64.tar.gz /opt/monitor-prometheus
cp ./statsd.yml /etc/nginx
chmod +x /usr/sbin/node-exporter.sh
chmod +x /usr/sbin/statsd-exporter.sh
chmod +x /usr/sbin/nginx-exporter.sh
chmod +x /etc/init.d/node-exporter
chmod +x /etc/init.d/statsd-exporter
chmod +x /etc/init.d/nginx-exporter
chkconfig --add node-exporter
chkconfig --add statsd-exporter
chkconfig --add nginx-exporter
rm -rf statsd_exporter-0.13.0.linux-*
rm -rf node_exporter-0.18.1.linux-*
service node-exporter start
#service statsd-exporter start
service nginx-exporter start