#!/bin/bash -e

USER_HOME=${ROOTFS_DIR}/home/admin
APP_HOME=${ROOTFS_DIR}/home/admin/IND0906BLE

echo $USER_HOME
echo $APP_HOME

mkdir -p $APP_HOME

cd app
cp -r activity_data microsensys config.yml config_factory_settings.yml device.yml device_factory_settings.yml logging_factory_settings.yml ind0906ble.py login.yml login_factory_settings.yml main.py requirements.txt $APP_HOME/
cp deployment/microsensys.service ${ROOTFS_DIR}/etc/systemd/system/microsensys.service
install -m 755 deployment/microsensys_restart.sh deployment/microsensys_start.sh deployment/microsensys_stop.sh $USER_HOME/
