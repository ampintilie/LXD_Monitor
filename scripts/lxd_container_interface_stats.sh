#!/bin/bash

if  [ $# -lt 3 ]
  then
    echo "Wrong number of arguments"
    exit 1
fi

container=`echo $1|awk -F '.' '{print $2}'`
interface=$2
item=$3

case $item in
      rx_bytes)
                lxc exec $container -- grep $interface /proc/net/dev | awk '{print $2}'
                ;;
      tx_bytes)
                lxc exec $container -- grep $interface /proc/net/dev | awk '{print $10}'
                ;;
      rx_packets)
                lxc exec $container -- grep $interface /proc/net/dev | awk '{print $3}'
                ;;
      tx_packets)
                lxc exec $container -- grep $interface /proc/net/dev | awk '{print $11}'
                ;;
      ip_address)
                lxc info $container |grep $interface |grep inet|grep -v inet6|awk '{print $3}'
                ;;
esac


