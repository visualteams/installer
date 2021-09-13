export METEOR_SETTINGS=$(cat settings.json)

sudo docker-compose up -d && echo "VisualTeams started"
