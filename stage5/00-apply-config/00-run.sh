#!/bin/bash -e


USER_HOME=${ROOTFS_DIR}/home/admin
APP_HOME=${ROOTFS_DIR}/home/admin/IND0906BLE

cd config
cp -r hivesound $APP_HOME/

# setup app config
cp config.yml $APP_HOME/
sed -i "s/\${AWS_CLIENT_ID}/$AWS_CLIENT_ID/g" $APP_HOME/config.yml

# setup logging config
cp logging.yml $APP_HOME/
sed -i "s#\${OPEN_OBSERVE_LOGS_URL}#$OPEN_OBSERVE_LOGS_URL#g" $APP_HOME/logging.yml
sed -i "s/\${OPEN_OBSERVE_LOGS_AUTH_HEADER_VALUE}/$OPEN_OBSERVE_LOGS_AUTH_HEADER_VALUE/g" $APP_HOME/logging.yml

# setup credentials
mkdir -p $APP_HOME/hivesound/aws
echo -e $AWS_CLIENT_CERTIFICATE > $APP_HOME/hivesound/aws/client-certificate.pem
echo -e $AWS_CLIENT_PRIVATE_KEY > $APP_HOME/hivesound/aws/client-private.key

cp crontab_config $USER_HOME/

# setup alloy
mkdir -p ${ROOTFS_DIR}/etc/alloy
cp config.alloy ${ROOTFS_DIR}/etc/alloy/config.alloy
sed -i "s/\${ALLOY_AGENT_REMOTE_TARGET_USERNAME}/$ALLOY_AGENT_REMOTE_TARGET_USERNAME/g" ${ROOTFS_DIR}/etc/alloy/config.alloy
sed -i "s/\${ALLOY_AGENT_REMOTE_TARGET_PASSWORD}/$ALLOY_AGENT_REMOTE_TARGET_PASSWORD/g" ${ROOTFS_DIR}/etc/alloy/config.alloy


# ngrok
mkdir -p ${ROOTFS_DIR}/home/admin/.config/ngrok
cp ngrok.yml ${ROOTFS_DIR}/home/admin/.config/ngrok/ngrok.yml
# replace placeholder with actual ngrok token of this build
sed -i "s/\${NGROK_TOKEN}/$NGROK_TOKEN/g" ${ROOTFS_DIR}/home/admin/.config/ngrok/ngrok.yml
cp ngrok.service ${ROOTFS_DIR}/etc/systemd/system/ngrok.service

# lte
cp activate_lte_apn.service ${ROOTFS_DIR}/etc/systemd/system/activate_lte_apn.service

# dns settings
## deactivate dns managment by NetworkManager
## Guide -> https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/8/html/configuring_and_managing_networking/manually-configuring-the-etc-resolv-conf-file_configuring-and-managing-networking#disabling-dns-processing-in-the-networkmanager-configuration_manually-configuring-the-etc-resolv-conf-file
cp 90-dns-none.conf ${ROOTFS_DIR}/etc/NetworkManager/conf.d/90-dns-none.conf

## set hardcoded dns servers
cp resolv.conf ${ROOTFS_DIR}/etc/resolv.conf