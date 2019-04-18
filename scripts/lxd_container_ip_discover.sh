#!/bin/bash
container=`echo $1|awk -F '.' '{print $2}'`

ips=`lxc list $container$ --columns=4 | grep eth0 | awk '{print $2}'`

echo "{"
echo "     \"data\":["






comma=""
for ip in $ips
do
    echo "     $comma{"
    echo "           \"{#IPV4}\":\"$ip\"",
    echo "           \"{#CONTAINER}\":\"$1\""
    echo "     }"
    comma=","
done






echo "     ]"
echo "}"
