#!/bin/bash
value=`lxc exec "$2" -- sh -c "ceph df -f json-pretty" | grep "$1" | awk '{print $2}' | sed 's/,//'`
expr $value / 1024 / 1024 / 1024
