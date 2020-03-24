#!/bin/bash
#export http_proxy=http://proxy.hcm.fpt.vn:80
#export https_proxy=http://proxy.hcm.fpt.vn:80
wget https://github.com/prometheus/node_exporter/releases/download/v0.18.1/node_exporter-0.18.1.linux-amd64.tar.gz
tar xzf node_exporter-0.18.1.linux-amd64.tar.gz
cp node_exporter-0.18.1.linux-amd64/node_exporter /sbin
chmod a+x /sbin/node_exporter
mkdir /opt/monitor-prometheus
mv node_exporter-0.18.1.linux-amd64.tar.gz /opt/monitor-prometheus
rm -rf node_exporter-0.18.1.linux-*
touch /lib/systemd/system/node-exporter.service
echo -e "[Unit]" >> /lib/systemd/system/node-exporter.service
echo -e "Description=Node Exporter Prometheus" >> /lib/systemd/system/node-exporter.service
echo -e "Wants=network-online.target" >> /lib/systemd/system/node-exporter.service
echo -e "After=network-online.target\n" >> /lib/systemd/system/node-exporter.service
echo -e "[Service]" >> /lib/systemd/system/node-exporter.service
echo -e "User=root" >> /lib/systemd/system/node-exporter.service
echo -e "WorkingDirectory=/sbin" >> /lib/systemd/system/node-exporter.service
echo -e "ExecStart=/sbin/node_exporter --collector.mountstats --collector.meminfo_numa" >> /lib/systemd/system/node-exporter.service
echo -e "ExecReload=/bin/kill -HUP $MAINPID" >> /lib/systemd/system/node-exporter.service
echo -e "TimeoutStopSec=10s" >> /lib/systemd/system/node-exporter.service
echo -e "SendSIGKILL=no" >> /lib/systemd/system/node-exporter.service
echo -e "SyslogIdentifier=prometheus_node_exporter" >> /lib/systemd/system/node-exporter.service
echo -e "Restart=always" >> /lib/systemd/system/node-exporter.service
echo -e "RestartSec=3\n" >> /lib/systemd/system/node-exporter.service
echo -e "[Install]" >> /lib/systemd/system/node-exporter.service
echo -e "WantedBy=multi-user.target\n" >> /lib/systemd/system/node-exporter.service

systemctl daemon-reload
systemctl enable node-exporter
systemctl start node-exporter

## Open firewall CSF
#echo -e "tcp|in/out|d=9100|s=172.20.2.31 #Allow Server Monitor PayTV Grafana V2" >> /etc/csf/csf.allow
#csf -r
#yum install -y net-tools