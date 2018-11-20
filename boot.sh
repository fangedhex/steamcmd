#!/bin/bash
if [ -z "$APP_ID" ]; then
    echo "Need to set APP_ID"
    exit 1
fi  

# Installing server
APP=$APP_ID
if [ ! -z "$APP_BRANCH" ]; then 
    APP="$APP -beta $APP_BRANCH"
fi
/steam/steamcmd.sh +login anonymous +force_install_dir /server +app_update $APP +exit

if [ -z "$APP_CMD" ]; then
    echo "Need to set APP_CMD"
    exit 1
fi

# Launching
cd /server && ./$APP_CMD $APP_PARAMS
