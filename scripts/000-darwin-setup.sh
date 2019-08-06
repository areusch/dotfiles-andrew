#!/bin/bash -xe

if [ "$(uname)" != "Darwin" ]; then
    exit
fi

xcode_installed=$(xcode-select -p 1>/dev/null;echo $?)
if [ $xcode_installed -ne 0 ]; then
    sudo xcode-select --install
fi

if [ -z "$(which brew)" ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew cask install \
     docker \
     emacs \
     iterm2 \

brew install \
    bash-completion \
    mas \
    python

pip3 install \
     pipenv
