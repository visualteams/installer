![VisualTeams](https://www.visualteams.fr/images/logo.png)

# VisualTeams Self Hosted

> Install VisualTeams directly on your servers

## Requirements

### Supported Linux distributions

- Ubuntu (18.04/20.04)
- Debian (9/10)

Installation of VisualTeams on other operating system may be possible but not supported. 
VisualTeams is developed for Linux-based operating systems. It does **not** run on Microsoft Windows, and we have no plans to support it in the near future.

### Software requirements

#### General
- Docker ([Installation](https://docs.docker.com/engine/install/))
- Docker-compose ([Installation](https://docs.docker.com/compose/install/))

#### Video conferencing
If you plan to use video conferencing, you need a fully functional self-hosted Jitsi server :
- Videoconferencing : Jitsi ([Installation](https://jitsi.github.io/handbook/docs/devops-guide/devops-guide-quickstart))
- Recording : Jibri ([Installation](https://github.com/jitsi/jibri))

**Another option is to use VisualTeams video-conferencing cloud server. Ask your account manager for more information.**

### Hardware requirements

- 4 cores is the recommended minimum number of cores
- 4GB RAM is the required minimum memory size
- Storage is depending on your use. If you plan to use videoconferencing replays and/or file exchange massively, you must allocate more storage.

This configuration supports approximately 100 users.

## Installation

1. Clone this repository on your server
```bash
git clone https://github.com/visualteams/installer.git
cd installer
```

2. Create a .env file and fill it with your configuration. Some tips to fill this file is directly written in the file.
```bash 
cp .env.example .env
````

3. Run the configurator to initialize the VisualTeams settings
```bash
chmod +x configure-settings.sh && ./configure-settings.sh 
```

4. Finally, start your VisualTeams Instance
```bash
docker-compose up 
```
