#!/bin/bash

FILE=`find /tmp/recordings/* -name '*.mp4'`
NEWFILE=`echo $FILE | sed -e "s/_[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}-[0-9]\{2\}-[0-9]\{2\}-[0-9]\{2\}//g"`

ACCESS_KEY_ID=user
SECRET_ACCESS_KEY=changeme
HASH=$(echo -n "${ACCESS_KEY_ID}:${SECRET_ACCESS_KEY}" | base64)

mv $FILE $NEWFILE

curl -i -H "Authorization: Bearer ${HASH}" -F "file=@${NEWFILE}" https://app.visualteams.fr/api/replay/upload

rm -f $NEWFILE
