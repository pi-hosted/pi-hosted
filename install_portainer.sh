#!/bin/bash

function error {
  echo -e "\\e[91m$1\\e[39m"
  exit 1
}

function check_internet() {
  printf "Checking if you are online..."
  wget -q --spider http://github.com
  if [ $? -eq 0 ]; then
    echo "Online. Continuing."
  else
    error "Offline. Go connect to the internet then run the script again."
  fi
}

check_internet

sudo mkdir -p /portainer/Files/AppData/Config/portainer || error "Failed to create the Portainer Config Folder"

sudo docker pull portainer/portainer-ce:latest || error "Failed to pull latest Portainer docker image!"
sudo docker run -d -p 9000:9000 -p 9443:9443 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v /portainer/Files/AppData/Config/portainer:/data portainer/portainer-ce:latest --logo "https://raw.githubusercontent.com/pi-hosted/pi-hosted/master/images/pi-hosted-logo.png" || error "Failed to run Portainer docker image!"

