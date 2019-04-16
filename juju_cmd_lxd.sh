#!/bin/bash
juju scp add_lxd_monitor.sh $1:/home/ubuntu
juju run --machine $1 "chmod +x /home/ubuntu/add_lxd_monitor.sh"
juju run --machine $1 "~/add_lxd_monitor.sh"
