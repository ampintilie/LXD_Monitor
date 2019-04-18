#!/bin/bash
containerId="juju-143605-0-lxd-8"
value=`lxc exec $containerId -- sh -c "ceph df -f json-pretty" | grep "$1" | awk '{print $2}' | sed 's/,//'`
expr $value / 1024 / 1024 / 1024
