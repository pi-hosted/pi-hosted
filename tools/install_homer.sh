#!/bin/bash

function error {
  echo -e "\\e[91m$1\\e[39m"
  exit 1
}

#function check_internet() {
#  printf "Checking if you are online..."
#  wget -q --spider http://github.com
#  if [ $? -eq 0 ]; then
#    echo "Online. Continuing."
#  else
#    error "Offline. Go connect to the internet then run the script again."
#  fi
#}

check_internet

echo "Creating directories..."
sudo mkdir -p /portainer/Files/AppData/Config/Homer/assets || error "Failed to create Homer assets directory!"
echo "Setting permissions..."
sudo chown -R 1000.1000 /portainer/Files/AppData/Config/Homer || error "Failed to set permissions!"
echo "Done You are ready to install the Homer Template"
