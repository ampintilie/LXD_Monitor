#!/bin/bash

cd /etc/zabbix
sudo git clone https://github.com/ampintilie/LXD_Monitor
sudo cp -R /etc/zabbix/LXD_Monitor/scripts /etc/zabbix/lxd_external_scripts
sudo chmod +x /etc/zabbix/lxd_external_scripts/*
sudo cp LXD_Monitor/zabbix_agentd.conf.d/lxd.conf /etc/zabbix/zabbix_agentd.d/lxd.conf
sudo cp LXD_Monitor/zabbix-lxd.sudoers /etc/sudoers.d/zabbix-lxd
sudo systemctl restart zabbix-agent.service
sudo rm -rf /etc/zabbix/LXD_Monitor
