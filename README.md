# Zabbix-LXD-monitoring
Zabbix template &amp; scripts for LXD container monitoring

- copy LXD_Monitor/scripts to /etc/zabbix/lxd_external_scripts: sudo cp -R /etc/zabbix/LXD_Monitor/scripts /etc/zabbix/lxd_external_scripts
- make scripts executable: chmod +x /etc/zabbix/lxd_external_scripts/*
- copy LXD_Monitor/zabbix_agentd.conf.d/lxd.conf to /etc/zabbix/zabbix_agentd.d/lxd.conf
- copy LXD_Monitor/zabbix-lxd.sudoers to /etc/sudoers.d/zabbix-lxd
- restart zabbix-agent: systemctl restart zabbix-agent.service
- import zabbix-templates.xml into zabbix server
- add template to LXD node
