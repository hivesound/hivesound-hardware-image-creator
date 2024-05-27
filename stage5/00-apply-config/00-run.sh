#!/bin/bash -e


USER_HOME=${ROOTFS_DIR}/home/admin
APP_HOME=${ROOTFS_DIR}/home/admin/IND0906BLE

cd config
cp -r hivesound $APP_HOME/
cp config.yml $APP_HOME/
cp logging.yml $APP_HOME/

cp crontab_config $USER_HOME/

mkdir -p ${ROOTFS_DIR}/etc/alloy
cp config.alloy ${ROOTFS_DIR}/etc/alloy/config.alloy

# ngrok
mkdir -p ${ROOTFS_DIR}/home/admin/.config/ngrok
cp ngrok.yml ${ROOTFS_DIR}/home/admin/.config/ngrok/ngrok.yml
# replace placeholder with actual ngrok token of this build
sed -i "s/\${NGROK_TOKEN}/${NGROK_TOKEN}/g" ${ROOTFS_DIR}/home/admin/.config/ngrok/ngrok.yml
cp ngrok.service ${ROOTFS_DIR}/etc/systemd/system/ngrok.service