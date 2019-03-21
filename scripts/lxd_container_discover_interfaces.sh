#!/bin/bash
container=`echo $1|awk -F '.' '{print $2}'`

interfaces=`lxc exec $container -- cat /proc/net/dev| grep ":"| sed "s/://" |awk '{print $1}'`

echo "{"
echo "     \"data\":["



comma=""
for interface in $interfaces
do
    echo "     $comma{"
    echo "           \"{#INTERFACE}\":\"$interface\""
    echo "     }"
    comma=","
done



echo "     ]"
echo "}"
