#!/bin/bash

START=$1
END=$2
for ((i=$START;i<=$END;i++)); do
    echo "Adding trigger to machine $i"
    juju run --machine $i 'sudo tee -a /etc/zabbix/zabbix_agentd.d/userparameter_mysql.conf <<TEXT
UserParameter=check_storage[*],/etc/zabbix/lxd_external_scripts/get_ceph_storage.sh \$1 \$2
UserParameter=check_health_cluster[*],/etc/zabbix/lxd_external_scripts/get_ceph_health_status.sh \$1
TEXT'
    echo "Restarting agent on machine $i"
    juju run --machine $i 'sudo systemctl restart zabbix-agent.service'
done
