#!/bin/bash
container=`echo $1|awk -F '.' '{print $2}'`


services=`lxc exec $container -- systemctl list-units -t service | grep "neutron\|nova\|ovsdb\|ceph\|cinder\|glance\|keystone\|apache2\|mysql\|percona-cluster\|rabbitmq-server\|gnocchi\|heat" | grep -v "juju" | grep -o "\w.*.service"`

echo "{"
echo "     \"data\":["






comma=""
for service in $services
do
    echo "     $comma{"
    echo "           \"{#SERVICE}\":\"$service\""
    echo "     }"
    comma=","
done






echo "     ]"
echo "}"
