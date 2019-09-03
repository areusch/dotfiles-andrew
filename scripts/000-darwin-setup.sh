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

# Install apps
# mas install \
#     926036361  # LastPass

# Setup menu icons

# Show Bluetooth
defaults write com.apple.systemuiserver menuExtras -array-add "/System/Library/CoreServices/Menu Extras/Bluetooth.menu"

# Battery Percent
defaults write com.apple.menuextra.battery ShowPercent YES

# Siri
defaults write com.apple.Siri StatusMenuVisible -bool false

killall SystemUIServer

# Credit where credit is due: https://github.com/robb/.dotfiles  --->

# Disable the built-in captive portal (use your browser instead)
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.captive.control Active -bool false

# Show absolute path in Finder's title bar.
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Don't create dreaded .DS_Store files.
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Don't want Photos.app to open up as soon as you plug something in?
defaults write com.apple.ImageCapture disableHotPlug -bool YES

# Use plain text for new documents in TextEdit.app
defaults write com.apple.TextEdit RichText -bool false

# Show the ~/Library folder
chflags nohidden ~/Library

# <--- Credit where credit is due

# Use scroll gesture with the Ctrl (^) modifier key to zoom
if [ $(defaults read com.apple.universalaccess closeViewScrollWheelToggle) != "1" ]; then
    osascript -l AppleScript $(dirname $0)/applescript/zoom-accessibility.scpt
fi

# Dock tile size
defaults write com.apple.dock tilesize -float 48

killall Dock
