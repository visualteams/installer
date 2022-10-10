#!/bin/bash

if ((EUID != 0)); then
    echo "Error: Root or Sudo is required for this script ( $(basename $0) )"
    exit
fi

if ! [ -x "$(command -v jq)" ]; then
  echo 'Error: jq is not installed.' >&2
  exit 1
fi

chmod 777 configure-settings.sh

./configure-settings.sh

export METEOR_SETTINGS=$(cat settings.json)

docker-compose down

if test -f docker-compose.override.yml; then
  docker-compose -f docker-compose.yml -f docker-compose.override.yml up
else
  docker-compose up
fi
