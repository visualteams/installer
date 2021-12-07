#!/bin/bash

if [ -f .env ]; then
  export $(echo $(cat .env | sed 's/#.*//g'| xargs) | envsubst)
fi

SETTINGS_FILE="settings.json.generated"

cp settings.json.template $SETTINGS_FILE

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
ESCAPED_REPLACE=$(printf '%s\n' "$SCALITY_SECRET_ACCESS_KEY" | sed -e 's/[\/&]/\\&/g')
sed -i "s/#SCALITY_SECRET_ACCESS_KEY#/${ESCAPED_REPLACE:-""}/g" $SETTINGS_FILE
sed -i "s/#BUCKET_NAME_REPLAY#/${BUCKET_NAME_REPLAY:-"video-replay"}/g" $SETTINGS_FILE
sed -i "s/#BUCKET_REGION#/${BUCKET_REGION:-""}/g" $SETTINGS_FILE

sed -i "s/#BEEPLUGIN_CLIENT_ID#/${BEEPLUGIN_CLIENT_ID:-""}/g" $SETTINGS_FILE
sed -i "s/#BEEPLUGIN_CLIENT_SECRET#/${BEEPLUGIN_CLIENT_SECRET:-""}/g" $SETTINGS_FILE

sed -i "s/#MAIL_SENDER#/${MAIL_SENDER:-""}/g" $SETTINGS_FILE

sed -i "s/#PUBLIC_VAPID_KEY#/${PUBLIC_VAPID_KEY:-""}/g" $SETTINGS_FILE
sed -i "s/#PRIVATE_VAPID_KEY#/${PRIVATE_VAPID_KEY:-""}/g" $SETTINGS_FILE
sed -i "s/#FIREBASE_KEY#/${FIREBASE_KEY:-""}/g" $SETTINGS_FILE
sed -i "s/#GOOGLE_TAG_MANAGER_ID#/${GOOGLE_TAG_MANAGER_ID:-""}/g" $SETTINGS_FILE

if test -f settings.json.override; then
  jq -s '.[0] * .[1]' $SETTINGS_FILE settings.json.override > settings.json
else
  cp $SETTINGS_FILE settings.json
fi

echo "Settings successfully generated"
