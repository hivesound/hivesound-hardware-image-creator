#!/bin/bash -e

# setup ngrok
systemctl disable ngrok.service

# activate cronjobs
crontab /home/admin/crontab_config
rm /home/admin/crontab_config

chown -R admin:admin /home/admin

