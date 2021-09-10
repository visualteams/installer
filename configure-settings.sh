#!/bin/bash

if [ -f .env ]; then
  export $(echo $(cat .env | sed 's/#.*//g'| xargs) | envsubst)
fi

cp settings.json.template settings.json

SETTINGS_FILE="settings.json"

sed -i "s/#ELASTIC_USERNAME#/${ELASTIC_USERNAME:-"elastic"}/g" $SETTINGS_FILE
sed -i "s/#ELASTIC_PASSWORD#/${ELASTIC_PASSWORD:-""}/g" $SETTINGS_FILE

sed -i "s/#ETHERPAD_DOMAIN#/${ETHERPAD_DOMAIN:-""}/g" $SETTINGS_FILE
sed -i "s/#ETHERPAD_PASSWORD#/${ETHERPAD_PASSWORD:-""}/g" $SETTINGS_FILE

sed -i "s/#JIBRI_USERNAME#/${JIBRI_USERNAME:-""}/g" $SETTINGS_FILE
sed -i "s/#JIBRI_PASSWORD#/${JIBRI_PASSWORD:-""}/g" $SETTINGS_FILE
sed -i "s/#JITSI_DOMAIN#/${JITSI_DOMAIN:-""}/g" $SETTINGS_FILE
sed -i "s/#JITSI_APP_ID#/${JITSI_APP_ID:-""}/g" $SETTINGS_FILE
sed -i "s/#JITSI_SECRET_JWT#/${JITSI_SECRET_JWT:-""}/g" $SETTINGS_FILE

sed -i "s/#SCALITY_ACCESS_KEY_ID#/${SCALITY_ACCESS_KEY_ID:-""}/g" $SETTINGS_FILE
sed -i "s/#SCALITY_SECRET_ACCESS_KEY#/${SCALITY_SECRET_ACCESS_KEY:-""}/g" $SETTINGS_FILE
sed -i "s/#BUCKET_NAME_REPLAY#/${SCALITY_SECRET_ACCESS_KEY:-"video-replay"}/g" $SETTINGS_FILE

sed -i "s/#BEEPLUGIN_CLIENT_ID#/${BEEPLUGIN_CLIENT_ID:-""}/g" $SETTINGS_FILE
sed -i "s/#BEEPLUGIN_CLIENT_SECRET#/${BEEPLUGIN_CLIENT_SECRET:-""}/g" $SETTINGS_FILE

sed -i "s/#MAIL_SENDER#/${MAIL_SENDER:-""}/g" $SETTINGS_FILE

sed -i "s/#PUBLIC_VAPID_KEY#/${PUBLIC_VAPID_KEY:-""}/g" $SETTINGS_FILE
sed -i "s/#PRIVATE_VAPID_KEY#/${PRIVATE_VAPID_KEY:-""}/g" $SETTINGS_FILE

echo "Settings successfully generated"
