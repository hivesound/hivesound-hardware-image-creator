#!/bin/bash -e

USER_HOME=/home/admin
APP_HOME=/home/admin/IND0906BLE

echo $USER_HOME
echo $APP_HOME

# compile bluepy libary
cd $APP_HOME/microsensys/bluezero/bluepy
make clean
make all

# install python dependencies
su - admin -c "pip install -r $APP_HOME/requirements.txt  --break-system-packages"
su - admin -c "pip install numpy  --break-system-packages"

# setup microsensys as service
systemctl enable microsensys.service

sudo chown -R admin:admin /home/admin
