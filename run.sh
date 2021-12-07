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
docker-compose up
