#!/bin/bash

sudo apt update;
sudo apt install git vim tmux htop wget zip unzip gcc build-essential make;

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)";