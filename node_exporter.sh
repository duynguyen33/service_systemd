#!/bin/sh

cmd="/usr/sbin/node_exporter --collector.tcpstat --collector.mountstats --collector.buddyinfo --collector.interrupts --collector.ksmd --collector.logind --collector.processes --collector.meminfo_numa --collector.ntp"

$cmd &
