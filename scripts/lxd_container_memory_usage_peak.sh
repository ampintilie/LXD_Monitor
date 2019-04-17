#!/bin/bash

HOSTNAME=$(hostname)

container=$(echo $1 | sed "s/${HOSTNAME}.//")

mem=`lxc info $container |awk '/peak/ {print $3}'`

if echo $mem |grep GB > /dev/null
  then
   number=`lxc info $container | awk '/peak/ {print $3}'|head --bytes -3`
   # print usage in MBytes
   echo "($number * 1024)"|bc
fi

if echo $mem |grep MB > /dev/null
  then
   number=`lxc info $container | awk '/peak/ {print $3}'|head --bytes -3`
   # print usage in MBytes
   echo "$number"|bc
fi
