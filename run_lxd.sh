#!/bin/bash
juju scp add_lxd.sh 0:/home/ubuntu
juju run --machine 0 "chmod +x /home/ubuntu/add_lxd.sh"
juju run --machine 0 "~/add_lxd.sh"
