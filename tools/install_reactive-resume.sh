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

echo "Creating directories..."
sudo mkdir -p /portainer/Files/AppData/Config/reactive-resume/uploads || error "Failed to create Reactive-Resume assets directory!"
sudo mkdir -p /portainer/Files/AppData/Config/reactive-resume/db || error "Failed to create Reactive-Resume database directory!"

echo "Fetching nginx configuration file"
sudo wget -O /portainer/Files/AppData/Config/reactive-resume/nginx.conf https://raw.githubusercontent.com/pi-hosted/pi-hosted/master/configs/reactive-resume_nginx.conf || error "Failed to download nginx.conf file"

echo "Setting permissions..."
sudo chown -R 1000:1000 /portainer/Files/AppData/Config/reactive-resume || error "Failed to set permissions!"

echo "Done You are ready to install the Reactive-Resume stack"
