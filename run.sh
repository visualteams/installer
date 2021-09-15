chmod 777 configure-settings.sh

./configure-settings.sh

export METEOR_SETTINGS=$(cat settings.json)

sudo docker-compose up
