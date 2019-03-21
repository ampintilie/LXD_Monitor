#!/bin/bash

container=`echo $1|awk -F '.' ' {print $2}'`

lxc info $container|grep "CPU usage (in seconds)"|awk '{print $5}'

