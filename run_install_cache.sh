#!/bin/bash
### Donwload file exporter ###
wget https://github.com/prometheus/statsd_exporter/releases/download/v0.13.0/statsd_exporter-0.13.0.linux-amd64.tar.gz
wget https://github.com/prometheus/node_exporter/releases/download/v0.18.1/node_exporter-0.18.1.linux-amd64.tar.gz
tar xzf statsd_exporter-0.13.0.linux-amd64.tar.gz
tar xzf node_exporter-0.18.1.linux-amd64.tar.gz
cp statsd_exporter-0.13.0.linux-amd64/statsd_exporter /usr/sbin
cp node_exporter-0.18.1.linux-amd64/node_exporter /usr/sbin
mkdir monitor-prometheus
mv statsd_exporter-0.13.0.linux-amd64.tar.gz node_exporter-0.18.1.linux-amd64.tar.gz monitor-prometheus
rm -rf node_exporter-0.18.1.linux-*
rm -rf statsd_exporter-0.13.0.linux-*

### Create service run on systemd ###
#Node-exporter
touch /usr/lib/systemd/system/node-exporter.service
echo "[Unit]" > /usr/lib/systemd/system/node-exporter.service
echo "Description=Node Exporter Prometheus" >> /usr/lib/systemd/system/node-exporter.service
echo "" >> /usr/lib/systemd/system/node-exporter.service
echo "[Service]" >> /usr/lib/systemd/system/node-exporter.service
echo "User=root" >> /usr/lib/systemd/system/node-exporter.service
echo "ExecStart=/usr/sbin/node_exporter --collector.tcpstat" >> /usr/lib/systemd/system/node-exporter.service
echo "" >> /usr/lib/systemd/system/node-exporter.service
echo "[Install]" >> /usr/lib/systemd/system/node-exporter.service
echo "WantedBy=multi-user.target" >> /usr/lib/systemd/system/node-exporter.service

#Statsd-exporter
touch /usr/lib/systemd/system/statsd-exporter.service
echo "[Unit]" > /usr/lib/systemd/system/statsd-exporter.service
echo "Description=Statsd Exporter Prometheus" >> /usr/lib/systemd/system/statsd-exporter.service
echo "" >> /usr/lib/systemd/system/statsd-exporter.service
echo "[Service]" >> /usr/lib/systemd/system/statsd-exporter.service
echo "User=root" >> /usr/lib/systemd/system/statsd-exporter.service
echo "ExecStart=/usr/sbin/statsd_exporter --statsd.listen-udp=127.0.0.1:8125 --statsd.listen-tcp=127.0.0.1:8125 --statsd.mapping-config=/etc/nginx/statsd.yml" >> /usr/lib/systemd/system/statsd-exporter.service
echo "" >> /usr/lib/systemd/system/statsd-exporter.service
echo "[Install]" >> /usr/lib/systemd/system/statsd-exporter.service
echo "WantedBy=multi-user.target" >> /usr/lib/systemd/system/statsd-exporter.service

systemctl daemon-reload
systemctl enable node-exporter
systemctl enable statsd-exporter
systemctl start node-exporter
systemctl start statsd-exporter
