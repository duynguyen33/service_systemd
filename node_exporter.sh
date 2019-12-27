#!/bin/sh

/usr/sbin/node_exporter --collector.tcpstat --collector.systemd --collector.mountstats --collector.buddyinfo --collector.interrupts --collector.ksmd --collector.logind --collector.processes --collector.meminfo_numa --collector.ntp --collector.supervisord
