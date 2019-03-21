# Zabbix-LXD-monitoring
Zabbix template &amp; scripts for LXD container monitoring

- copy zabbix/scripts to /etc/zabbix/scripts
- make scripts executable: chmod +x /etc/zabbix/scripts/*
- copy zabbix/zabbix_agentd.d?lxd.conf to /etc/zabbix/zabbix_agent.d/lxd.conf
- copy zabbix-lxd.sudoers to /etc/sudoers.d/zabbix-lxd
- restart zabbix-agent
- import zabbix-templates.xml into zabbix server
- add template to LXD node

NB: There must be a nicer way to trigger a container down, then done now by checking
for data received on the number of processes running inside the container. But for now it works. ;)

NB: security wise it has to be looked at as well, cause for now the zabbix-agent can execute all lxc commands
(both for snap package as normal distro package)
