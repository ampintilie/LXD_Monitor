#!/bin/bash

HOSTNAME=$(hostname)

container=$(echo $1 | sed "s/${HOSTNAME}.//")

space=`lxc info $container | awk '/root/ {print $2}'`

if echo $space |grep GB > /dev/null
  then
   number=`lxc info $container | awk '/root/ {print $2}'|head --bytes -3`
   # print usage in Bytes
   echo "($number * 1024 * 1024 * 1024)"|bc
fi

if echo $space |grep MB > /dev/null
  then
   number=`lxc info $container | awk '/root/ {print $2}'|head --bytes -3`
   # print usage in Bytes
   echo "($number * 1024 * 1024)"|bc
fi


