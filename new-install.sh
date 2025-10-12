#!/bin/bash

# ******** Install Docker

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install -y ca-certificates curl uidmap
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update

# Install packages.
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Disable normal mode and install rootless.
sudo systemctl disable --now docker.service docker.socket
sudo rm /var/run/docker.sock

dockerd-rootless-setuptool.sh install

# ******** Extra user setup for myself.

curl -fsL https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh
curl -fsL https://raw.githubusercontent.com/DorkmasterFlek/dorkmasterflek.github.io/master/bashrc_extra >> ~/.bashrc
curl -fsL https://raw.githubusercontent.com/DorkmasterFlek/dorkmasterflek.github.io/master/gitignore_global -o ~/.gitignore_global
curl -fsL https://raw.githubusercontent.com/DorkmasterFlek/dorkmasterflek.github.io/master/gitconfig -o ~/.gitconfig
