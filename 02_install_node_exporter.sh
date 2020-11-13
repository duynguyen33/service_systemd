#!/bin/bash
wget https://nexus.fbox.fpt.vn/repository/repo-paytv/prometheus-exporter/node_exporter-1.0.1.linux-amd64.tar.gz
tar xzf node_exporter-1.0.1.linux-amd64.tar.gz
cp node_exporter-1.0.1.linux-amd64/node_exporter /usr/sbin
chmod a+x /sbin/node_exporter
mkdir /opt/monitor-prometheus
mv node_exporter-1.0.1.linux-amd64.tar.gz /opt/monitor-prometheus
rm -rf node_exporter-1.0.1.linux-*
cat <<EOF >> /usr/lib/systemd/system/node-exporter.service
[Unit]
Description=Node Exporter Prometheus
Wants=network-online.target
After=network-online.target

[Service]
User=root
WorkingDirectory=/sbin
ExecStart=/usr/sbin/node_exporter --collector.mountstats --no-collector.hwmon --no-collector.pressure \
--no-collector.thermal_zone --no-collector.rapl --no-collector.infiniband \
--no-collector.edac --no-collector.arp --no-collector.entropy --no-collector.ipvs --no-collector.schedstat --no-collector.softnet \
--no-collector.filefd --collector.filesystem.ignored-mount-points=^/mnt(vcas|mfs)

ExecReload=/bin/kill -HUP $MAINPID
TimeoutStopSec=10s
SendSIGKILL=no
SyslogIdentifier=prometheus_node_exporter
Restart=always
RestartSec=3

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable node-exporter
systemctl start node-exporter

## Open firewall CSF
#echo -e "tcp|in/out|d=9100|s=172.20.2.32 #Allow Server Monitor PayTV Grafana V2" >> /etc/csf/csf.allow
#csf -r
#yum install -y net-tools