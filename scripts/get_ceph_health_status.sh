#!/bin/bash
containerId=$1

status=`lxc exec $containerId -- sh -c "ceph status" | grep health | awk '{print $2}'`
echo $status
