#!/bin/bash
### Donwload file exporter ###
wget https://github.com/prometheus/statsd_exporter/releases/download/v0.13.0/statsd_exporter-0.13.0.linux-amd64.tar.gz
wget https://github.com/prometheus/node_exporter/releases/download/v0.18.1/node_exporter-0.18.1.linux-amd64.tar.gz
tar xzf statsd_exporter-0.13.0.linux-amd64.tar.gz
tar xzf node_exporter-0.18.1.linux-amd64.tar.gz
cp statsd_exporter-0.13.0.linux-amd64/statsd_exporter /usr/sbin
cp node_exporter-0.18.1.linux-amd64/node_exporter /usr/sbin
chmod a+x ./nginx-prometheus-exporter
cp ./nginx-prometheus-exporter /usr/sbin
mkdir /opt/monitor-prometheus
mv statsd_exporter-0.13.0.linux-amd64.tar.gz node_exporter-0.18.1.linux-amd64.tar.gz /opt/monitor-prometheus
rm -rf node_exporter-0.18.1.linux-*
rm -rf statsd_exporter-0.13.0.linux-*
##Copy file
cp ./node-exporter.service /usr/lib/systemd/system
cp ./statsd-exporter.service /usr/lib/systemd/system
cp ./nginx-exporter.service /usr/lib/systemd/system
cp ./statsd_image.yml /etc/nginx

sed -i 's/statsd.yml/statsd_image.yml/g' /usr/lib/systemd/system/statsd-exporter.service
##Rename location
#sed -i 's/HCM/HN/g' /etc/nginx/statsd_vod.yml

systemctl daemon-reload
systemctl enable node-exporter
systemctl enable statsd-exporter
systemctl enable nginx-exporter
systemctl start node-exporter
systemctl start nginx-exporter
systemctl start statsd-exporter
