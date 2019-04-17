# Zabbix-LXD-monitoring
Zabbix template &amp; scripts for LXD container monitoring

1. Run 'juju_cmd_lxd.sh' for each machine you want to discover containers. The script takes 1 argument - the id of machine. The script will run "add_lxd_monitor.sh" and send files to machine.
2. Import templates in Zabbix.
3. Apply 'LXD NODE' Template to machines. The 'LXD CONTAINER' Template will be appplied automatically to discovered containers.

Note! If discovery doent work, check if /var/lib/zabbix or 'home path' for user zabbix exists and owner is zabbix. Also check if '.config' directory exist in /var/lib/zabbix.
