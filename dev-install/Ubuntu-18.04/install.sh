#!/bin/bash -xe

# Emacs 26
sudo add-apt-repository -y ppa:kelleyk/emacs

sudo apt-get update

# Install packages
sudo apt-get install -y emacs26 tmux
