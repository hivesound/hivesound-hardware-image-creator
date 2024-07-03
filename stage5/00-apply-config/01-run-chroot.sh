#!/bin/bash -e

# fix ip resolving issue with ipv6 -> deactivate ipv6
echo net.ipv6.conf.all.disable_ipv6=1 >> /etc/sysctl.conf
echo net.ipv6.conf.default.disable_ipv6=1 >> /etc/sysctl.conf
echo net.ipv6.conf.lo.disable_ipv6=1 >> /etc/sysctl.conf

# setup ngrok
systemctl disable ngrok.service

# activate cronjobs
crontab /home/admin/crontab_config
rm /home/admin/crontab_config

chown -R admin:admin /home/admin

