#!/bin/bash
set -e

# UPGRADE
sudo apt update -y
sudo apt upgrade -y

# EDITOR
if ! [ -x "$(command -v nvim)" ]; then
  sudo apt install -y neovim python3-neovim
  sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 61
  sudo update-alternatives --set vi /usr/bin/nvim
  sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
  sudo update-alternatives --set vim /usr/bin/nvim
  sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
  sudo update-alternatives --set editor /usr/bin/nvim
fi

# DOCKER
if ! [ -x "$(command -v docker)" ]; then
  sudo apt update
  sudo apt install ca-certificates curl
  sudo install -m 0755 -d /etc/apt/keyrings
  sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
  sudo chmod a+r /etc/apt/keyrings/docker.asc
  
  echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

  sudo apt update
  sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
fi

# GITCONFIG
git config --global user.name "Daniel Rodriguez Gil"
git config --global user.email "daniel@dpstudios.es"

# TOOLS
sudo apt install -y zip ripgrep direnv

# Java
if ! command -v sdk &> /dev/null
then
  curl -s "https://get.sdkman.io" | bash || true
  source $HOME/.sdkman/bin/sdkman-init.sh
fi
sdk install java 21.0.2-open
sdk install maven
sdk install gradle

# Node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install 20
npm install -g prettier eslint

# Go
sudo apt install golang

# PHP
sudo apt install -y php php-soap php-mysqli php-gd php-xdebug php-xml php-curl composer

# Lua
sudo apt install -y luarocks

# ZSH, TMUX
sudo apt install -y zsh tmux
