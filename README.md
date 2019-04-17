# Zabbix-LXD-monitoring
Zabbix template &amp; scripts for LXD container monitoring

1. Run 'juju_cmd_lxd.sh' for each machine you want to discover containers. The script takes 1 argument - the id of machine. The script will run "add_lxd_monitor.sh" and send files to machine.
2. Import templates in Zabbix.
3. Apply 'LXD NODE' Template to machines. The 'LXD CONTAINER' Template will be appplied automatically to discovered containers.

Note! If discovery doent work, check if /var/lib/zabbix or 'home path' for user zabbix exists and owner is zabbix.




- copy LXD_Monitor/scripts to /etc/zabbix/lxd_external_scripts: sudo cp -R /etc/zabbix/LXD_Monitor/scripts /etc/zabbix/lxd_external_scripts
- make scripts executable: chmod +x /etc/zabbix/lxd_external_scripts/*
- copy LXD_Monitor/zabbix_agentd.conf.d/lxd.conf to /etc/zabbix/zabbix_agentd.d/lxd.conf
- copy LXD_Monitor/zabbix-lxd.sudoers to /etc/sudoers.d/zabbix-lxd
- restart zabbix-agent: systemctl restart zabbix-agent.service
- import zabbix-templates.xml into zabbix server
- add template to LXD node
