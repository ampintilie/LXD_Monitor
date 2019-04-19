#!/bin/bash

START=$1
END=$2
for ((i=$START;i<=$END;i++)); do
    echo "Adding trigger to machine $i"
    juju run --machine $i 'sudo tee -a /etc/zabbix/zabbix_agentd.d/userparameter_mysql.conf <<TEXT
UserParameter=check_storage[*],/etc/zabbix/lxd_external_scripts/get_ceph_storage.sh \$1
UserParameter=check_health_cluster,lxc exec juju-bdafc8-0-lxd-9 -- sh -c "ceph status" | grep health | awk "{print \$2}"
TEXT'
    echo "Restarting agent on machine $i"
    juju run --machine $i 'sudo systemctl restart zabbix-agent.service'
done
