#!/bin/bash -e

# setup ngrok
systemctl disable ngrok.service

# setup lte hat
## To use the hardware serial port, you need to first disable the login shell function and then enable the hardware serial.
## https://www.waveshare.com/wiki/A7670E_Cat-1_HAT
## for some reason 1 means off and 0 means on
raspi-config nonint do_serial_cons 1
raspi-config nonint do_serial_hw 0
## activate lte hat service
systemctl enable lte_hat.service

# activate cronjobs
crontab /home/admin/crontab_config
rm /home/admin/crontab_config

chown -R admin:admin /home/admin

