#!/bin/bash

HOSTNAME=$(hostname)

container=$(echo $1 | sed "s/${HOSTNAME}.//")

lxc info $container | awk '/Processes/ {print $2}'

