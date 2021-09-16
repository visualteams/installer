if ((EUID != 0)); then
    echo "Root or Sudo  Required for script ( $(basename $0) )"
    exit
fi

chmod 777 configure-settings.sh

./configure-settings.sh

export METEOR_SETTINGS=$(cat settings.json)

docker-compose down
docker-compose up
